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

# Clonar repositório e configurar aplicação
mkdir /home/ec2-user/api
git clone https://github.com/guilinares/dormitorio-bras.git /home/ec2-user/api
cd /home/ec2-user/api

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
      - postgres_data:/var/lib/postgresql/data
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
    depends_on:
      - postgres
    networks:
      - app-network

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

volumes:
  postgres_data:

networks:
  app-network:
    driver: bridge
EOL

# Iniciar os containers
docker-compose up -d