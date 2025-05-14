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
mkdir -p /home/ec2-user/api/deploy/postgres
aws s3 cp s3://dormitorio-rge-files/01_init.sql /home/ec2-user/api/deploy/postgres/init/01_init.sql
aws s3 cp s3://dormitorio-rge-files/02_data.sql /home/ec2-user/api/deploy/postgres/init/02_init.sql

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

# Iniciar os containers
docker-compose up -d