CREATE TABLE IF NOT EXISTS dormitorios (
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
