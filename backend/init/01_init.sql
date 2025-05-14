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