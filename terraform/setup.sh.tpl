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

mkdir /deploy/postgres/init

cat <<EOL > 01_init.sql
CREATE TABLE dormitorio (
    dormitorio_id VARCHAR(255) PRIMARY KEY,
    nome VARCHAR(255),
    localizacao VARCHAR(255),
    descricao TEXT,
    capacidade INTEGER
);

CREATE TABLE leitos (
    numero_leito VARCHAR(255) PRIMARY KEY,
    dormitorio_id VARCHAR(255) NOT NULL,
    ocupado BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (dormitorio_id) REFERENCES dormitorio(dormitorio_id) ON DELETE CASCADE
);

CREATE TABLE reservas_rge_raw (
    id_reserva varchar(255),
    horario_reserva timestamp(255),
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

cat <<EOL > 02_data.sql
INSERT INTO dormitorio (dormitorio_id, nome, capacidade) VALUES
  ('1', 'Central (Menor)', 30),
  ('2', 'Central (Maior)', 67),
  ('3', 'Salão de Jovens', 47),
  ('4', 'Ipanema I', 22),
  ('5', 'Ipanema II', 15),
  ('6', 'Ipanema III', 15),
  ('7', 'Visconde I', 26),
  ('8', 'Visconde II', 61),
  ('9', 'Visconde III', 27),
  ('10', 'Enfermos', 6);

-- Inserir os leitos para cada dormitório
-- Central (Menor)
INSERT INTO leitos (numero_leito, dormitorio_id) VALUES
  ('1', '1'), ('2', '1'), ('3', '1'), ('4', '1'), ('5', '1'),
  ('6', '1'), ('7', '1'), ('8', '1'), ('9', '1'), ('10', '1'),
  ('11', '1'), ('12', '1'), ('13', '1'), ('14', '1'), ('15', '1'),
  ('16', '1'), ('17', '1'), ('18', '1'), ('19', '1'), ('20', '1'),
  ('21', '1'), ('22', '1'), ('23', '1'), ('24', '1'), ('25', '1'),
  ('26', '1'), ('27', '1'), ('28', '1'), ('29', '1'), ('30', '1');

-- Central (Maior)
INSERT INTO leitos (numero_leito, dormitorio_id) VALUES
  ('31', '2'), ('32', '2'), ('33', '2'), ('34', '2'), ('35', '2'),
  ('36', '2'), ('37', '2'), ('38', '2'), ('39', '2'), ('40', '2'),
  ('41', '2'), ('42', '2'), ('43', '2'), ('44', '2'), ('45', '2'),
  ('46', '2'), ('47', '2'), ('48', '2'), ('49', '2'), ('50', '2'),
  ('51', '2'), ('52', '2'), ('53', '2'), ('54', '2'), ('55', '2'),
  ('56', '2'), ('57', '2'), ('58', '2'), ('59', '2'), ('60', '2'),
  ('61', '2'), ('62', '2'), ('63', '2'), ('64', '2'), ('65', '2'),
  ('66', '2'), ('67', '2'), ('68', '2'), ('69', '2'), ('70', '2'),
  ('71', '2'), ('72', '2'), ('73', '2'), ('74', '2'), ('75', '2'),
  ('76', '2'), ('77', '2'), ('78', '2'), ('79', '2'), ('80', '2'),
  ('81', '2'), ('82', '2'), ('83', '2'), ('84', '2'), ('85', '2'),
  ('86', '2'), ('87', '2'), ('88', '2'), ('89', '2'), ('90', '2'),
  ('91', '2'), ('92', '2'), ('93', '2'), ('94', '2'), ('95', '2'),
  ('96', '2'), ('97', '2');

-- Salão de Jovens
INSERT INTO leitos (numero_leito, dormitorio_id) VALUES
  ('98', '3'), ('99', '3'), ('100', '3'), ('101', '3'), ('102', '3'),
  ('103', '3'), ('104', '3'), ('105', '3'), ('106', '3'), ('107', '3'),
  ('108', '3'), ('109', '3'), ('110', '3'), ('111', '3'), ('112', '3'),
  ('113', '3'), ('114', '3'), ('115', '3'), ('116', '3'), ('117', '3'),
  ('118', '3'), ('119', '3'), ('120', '3'), ('121', '3'), ('122', '3'),
  ('123', '3'), ('124', '3'), ('125', '3'), ('126', '3'), ('127', '3'),
  ('128', '3'), ('129', '3'), ('130', '3'), ('131', '3'), ('132', '3'),
  ('133', '3'), ('134', '3'), ('135', '3'), ('136', '3'), ('137', '3'),
  ('138', '3'), ('139', '3'), ('140', '3'), ('141', '3'), ('142', '3'),
  ('143', '3'), ('144', '3');

-- Ipanema I
INSERT INTO leitos (numero_leito, dormitorio_id) VALUES
  ('145', '4'), ('146', '4'), ('147', '4'), ('148', '4'), ('149', '4'),
  ('150', '4'), ('151', '4'), ('152', '4'), ('153', '4'), ('154', '4'),
  ('155', '4'), ('156', '4'), ('157', '4'), ('158', '4'), ('159', '4'),
  ('160', '4'), ('161', '4'), ('162', '4'), ('163', '4'), ('164', '4'),
  ('165', '4'), ('166', '4');

-- Ipanema II
INSERT INTO leitos (numero_leito, dormitorio_id) VALUES
  ('167', '5'), ('168', '5'), ('169', '5'), ('170', '5'), ('171', '5'),
  ('172', '5'), ('173', '5'), ('174', '5'),
  ('295', '5'), ('296', '5'), ('297', '5'), ('298', '5'), ('299', '5'),
  ('300', '5'), ('301', '5');

-- Ipanema III
INSERT INTO leitos (numero_leito, dormitorio_id) VALUES
  ('175', '6'), ('176', '6'), ('177', '6'), ('178', '6'), ('179', '6'),
  ('180', '6'), ('181', '6'), ('182', '6'), ('183', '6'), ('184', '6'),
  ('185', '6'), ('186', '6'), ('187', '6'), ('188', '6'), ('189', '6');

-- Visconde I
INSERT INTO leitos (numero_leito, dormitorio_id) VALUES
  ('190', '7'), ('191', '7'), ('192', '7'), ('193', '7'), ('194', '7'),
  ('195', '7'), ('196', '7'), ('197', '7'), ('198', '7'), ('199', '7'),
  ('200', '7'), ('201', '7'), ('202', '7'), ('203', '7'), ('204', '7'),
  ('205', '7'), ('206', '7'), ('207', '7'), ('208', '7'), ('209', '7'),
  ('210', '7'), ('211', '7'), ('212', '7'), ('213', '7'), ('214', '7'),
  ('215', '7');

-- Visconde II
INSERT INTO leitos (numero_leito, dormitorio_id) VALUES
  ('216', '8'), ('217', '8'), ('218', '8'), ('219', '8'), ('220', '8'),
  ('221', '8'), ('222', '8'), ('223', '8'), ('224', '8'), ('225', '8'),
  ('226', '8'), ('227', '8'), ('228', '8'), ('229', '8'), ('230', '8'),
  ('231', '8'), ('232', '8'), ('233', '8'), ('234', '8'), ('235', '8'),
  ('236', '8'), ('237', '8'), ('238', '8'), ('239', '8'), ('240', '8'),
  ('241', '8'), ('242', '8'), ('243', '8'), ('244', '8'), ('245', '8'),
  ('246', '8'), ('247', '8'), ('248', '8'), ('249', '8'), ('250', '8'),
  ('251', '8'), ('252', '8'), ('253', '8'), ('254', '8'), ('255', '8'),
  ('256', '8'), ('257', '8'), ('258', '8'), ('259', '8'), ('260', '8'),
  ('261', '8'), ('262', '8'), ('263', '8'), ('264', '8'), ('265', '8'),
  ('266', '8'), ('267', '8'), ('268', '8'), ('269', '8'), ('270', '8'),
  ('271', '8'), ('272', '8'), ('273', '8'), ('274', '8'), ('275', '8'),
  ('276', '8'), ('277', '8'), ('278', '8');

-- Visconde III
INSERT INTO leitos (numero_leito, dormitorio_id) VALUES
  ('279', '9'), ('280', '9'), ('281', '9'), ('282', '9'), ('283', '9'),
  ('284', '9'), ('285', '9'), ('286', '9'), ('287', '9'), ('288', '9'),
  ('289', '9'), ('290', '9'), ('291', '9'), ('292', '9'), ('293', '9'),
  ('294', '9'), ('308', '9'), ('309', '9'), ('310', '9'), ('311', '9'),
  ('312', '9'), ('313', '9'), ('314', '9'), ('315', '9'), ('316', '9'),
  ('317', '9'), ('318', '9');

-- Enfermos
INSERT INTO leitos (numero_leito, dormitorio_id) VALUES
  ('302', '10'), ('303', '10'), ('304', '10'), ('305', '10'),
  ('306', '10'), ('307', '10');
EOL

cd ..
cd ..
cd ..

# Iniciar os containers
docker-compose up -d