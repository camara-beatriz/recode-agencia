CREATE DATABASE OdysseyTours;
USE OdysseyTours;

-- Table: Cliente
CREATE TABLE Cliente (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    cpf VARCHAR(11) UNIQUE NOT NULL,
    nome VARCHAR(50) NOT NULL,
    sobrenome VARCHAR(50) NOT NULL,
    data_nascimento DATE NOT NULL,
    endereco VARCHAR(255) NOT NULL,
    cep VARCHAR(10) NOT NULL,
    telefone VARCHAR(20) NOT NULL,
    login VARCHAR(50) UNIQUE NOT NULL,
    senha VARCHAR(255) NOT NULL
);

-- Table: Destino
CREATE TABLE Destino (
    id_destino INT AUTO_INCREMENT PRIMARY KEY,
    nome_cidade VARCHAR(100) NOT NULL,
    pais VARCHAR(100) NOT NULL,
    preco_diaria DECIMAL(10,2) NOT NULL
);

-- Table: Pacote
CREATE TABLE Pacote (
    id_pacote INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    preco_total DECIMAL(10,2) NOT NULL
);

-- Table: Pacote_Destino
CREATE TABLE Pacote_Destino (
    id_pacote INT,
    id_destino INT,
    PRIMARY KEY (id_pacote, id_destino),
    FOREIGN KEY (id_pacote) REFERENCES Pacote(id_pacote),
    FOREIGN KEY (id_destino) REFERENCES Destino(id_destino)
);

-- Table: Carrinho
CREATE TABLE Carrinho (
    id_carrinho INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NOT NULL,
    status ENUM('Aberto', 'Confirmado', 'Cancelado') NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente)
);

-- Table: Carrinho_Destino
CREATE TABLE Carrinho_Destino (
    id_carrinho INT,
    id_destino INT,
    quantidade INT NOT NULL,
    PRIMARY KEY (id_carrinho, id_destino),
    FOREIGN KEY (id_carrinho) REFERENCES Carrinho(id_carrinho),
    FOREIGN KEY (id_destino) REFERENCES Destino(id_destino)
);

-- Table: Carrinho_Pacote
CREATE TABLE Carrinho_Pacote (
    id_carrinho INT,
    id_pacote INT,
    quantidade INT NOT NULL,
    PRIMARY KEY (id_carrinho, id_pacote),
    FOREIGN KEY (id_carrinho) REFERENCES Carrinho(id_carrinho),
    FOREIGN KEY (id_pacote) REFERENCES Pacote(id_pacote)
);

-- Table: Pagamento
CREATE TABLE Pagamento (
    id_pagamento INT AUTO_INCREMENT PRIMARY KEY,
    id_carrinho INT NOT NULL,
    valor_total DECIMAL(10,2) NOT NULL,
    metodo ENUM('Cartão de Crédito', 'Boleto', 'PIX') NOT NULL,
    data_pagamento DATE NOT NULL,
    FOREIGN KEY (id_carrinho) REFERENCES Carrinho(id_carrinho)
);


