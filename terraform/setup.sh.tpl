#!/bin/bash
DB_USER=${db_user}
DB_PASS=${db_pass}
DB_NAME=${db_name}
IP=${ip}

# Atualizar pacotes
sudo yum update -y && sudo yum upgrade -y

# Instalar Docker e Docker Compose
sudo yum install -y docker
sudo systemctl start docker
sudo systemctl enable docker
sudo usermod -aG docker ec2-user
sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

# Configurar o volume EBS (verificar se já não está formatado)
sudo mkdir -p /mnt/data
if ! sudo file -sL /dev/xvdh | grep -q ext4; then
    echo "Formatando o volume EBS..."
    sudo mkfs -t ext4 /dev/xvdh
fi

# Montar o volume
sudo mount /dev/xvdh /mnt/data

# Adicionar ao fstab para montagem automática
echo "/dev/xvdh /mnt/data ext4 defaults,nofail 0 2" | sudo tee -a /etc/fstab

# Criar diretório para dados do PostgreSQL e ajustar permissões
sudo mkdir -p /mnt/data/postgres_data
sudo chown -R 1000:1000 /mnt/data/postgres_data  # PostgreSQL roda como usuário 1000 no container
sudo chmod -R 700 /mnt/data/postgres_data

# Clonar repositório e configurar aplicação
mkdir /home/ec2-user/api
git clone https://github.com/guilinares/dormitorio-bras.git /home/ec2-user/api
cd /home/ec2-user/api

mkdir -p /home/ec2-user/api/deploy/cred
aws s3 cp s3://dormitorio-rge-files/firebase-adminsdk.json /home/ec2-user/api/deploy/cred/firebase-adminsdk.json

cat <<EOL > docker-compose.yml
version: '3.8'

services:
  postgres:
    image: postgres:15
    container_name: postgres
    restart: always
    environment:
      POSTGRES_USER: $DB_USER
      POSTGRES_PASSWORD: $DB_PASS
      POSTGRES_DB: $DB_NAME
    volumes:
      - /mnt/data/postgres_data:/var/lib/postgresql/data      
      - ./deploy/postgres/init:/docker-entrypoint-initdb.d
    networks:
      - app-network

  api:
    image: guilinares/dormitorio-bras-backend:latest
    container_name: dormitorio-bras-backend
    restart: always
    ports:
      - "8080:8080"
    environment:
      - SPRING_DATASOURCE_URL=jdbc:postgresql://postgres:5432/$DB_NAME
      - SPRING_DATASOURCE_USERNAME=$DB_USER
      - SPRING_DATASOURCE_PASSWORD=$DB_PASS
      - FIREBASE_CREDENTIALS_PATH=/app/credentials/firebase-credentials.json
    depends_on:
      - postgres
    networks:
      - app-network
    volumes:
    - ./deploy/cred/firebase-adminsdk.json:/app/credentials/firebase-credentials.json:ro

  frontend:
    image: guilinares/dormitorio-bras-frontend:latest
    container_name: dormitorio-bras-frontend
    restart: always
    environment:
      - HOST_ADDRESS=$IP
    ports:
      - "4200:80"
    depends_on:
      - api
    networks:
      - app-network

networks:
  app-network:
    driver: bridge
EOL

# Criar diretórios de inicialização do PostgreSQL
mkdir -p deploy/postgres/init
cat <<EOL > deploy/postgres/init/01_init.sql
CREATE TABLE IF NOT EXISTS dormitorio (
    dormitorio_id VARCHAR(255) PRIMARY KEY,
    nome VARCHAR(255),
    localizacao VARCHAR(255),
    descricao TEXT,
    capacidade INTEGER
);

CREATE TABLE IF NOT EXISTS leitos (
    numero_leito VARCHAR(255) PRIMARY KEY,
    dormitorio_id VARCHAR(255) NOT NULL,
    ocupado BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (dormitorio_id) REFERENCES dormitorio(dormitorio_id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS reservas_rge_raw (
    id_reserva varchar(255),
    horario_reserva timestamp,
    nome_completo varchar(255),
    ministerio varchar(255),
    cidade varchar(255),
    data_nascimento date,
    data_ordenacao date,
    enfermidade varchar(255),
    participa_reuniao_ministerio boolean,
    preside_regional boolean,
    data_checkin date,
    data_checkout date,
    hospedou_rge_passada boolean,
    celular varchar(255),
    numero_leito VARCHAR(255),
    FOREIGN KEY (numero_leito) REFERENCES leitos(numero_leito) ON DELETE CASCADE
);
EOL

cat <<EOL > deploy/postgres/init/02_data.sql
-- Inserir dormitórios apenas se não existirem
INSERT INTO dormitorio (dormitorio_id, nome, capacidade)
SELECT '1', 'Central (Menor)', 30 WHERE NOT EXISTS (SELECT 1 FROM dormitorio WHERE dormitorio_id = '1');

INSERT INTO dormitorio (dormitorio_id, nome, capacidade)
SELECT '2', 'Central (Maior)', 67 WHERE NOT EXISTS (SELECT 1 FROM dormitorio WHERE dormitorio_id = '2');

-- (continua com os outros INSERTs seguindo o mesmo padrão)
-- [Restante dos INSERTs com a mesma lógica de verificação]
EOL

# Iniciar os containers
docker-compose up -d