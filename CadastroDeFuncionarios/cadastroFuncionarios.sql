CREATE DATABASE empresa;
USE empresa;

CREATE TABLE funcionarios (
    id_funcionario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(11) UNIQUE NOT NULL,
    email VARCHAR(100),
    telefone VARCHAR(15),
    endereco VARCHAR(255),
    cargo VARCHAR(100),
    salario DECIMAL(10, 2) NOT NULL 
);