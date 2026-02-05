CREATE DATABASE Viagens;

USE Viagens;

CREATE TABLE usuarios (
    id INT,
    nome VARCHAR(255) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    endereco VARCHAR(50) NOT NULL  ,
    data_nascimento DATE NOT NULL
)

CREATE TABLE reserevas (
    id INT,
    id_usuario INT,
    id_destino INT,
    data DATE,
    status VARCHAR ( 255 ) DEFAULT 'pendente'
)
DROP  TABLE usuarios;

SELECT * FROM usuarios;

SHOW DATABASES;
SELECT * FROM usuarios;