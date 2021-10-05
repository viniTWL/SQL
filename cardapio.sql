CREATE DATABASE cardapio;
USE cardapio;

CREATE TABLE categorias(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(20),
    url_imagem VARCHAR(250)
    );
    
CREATE TABLE produtos(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    idcategoria INT,
    nome VARCHAR(20),
    descriçao VARCHAR(300),
    valor DECIMAL(5,2),
    FOREIGN KEY (idcategoria) REFERENCES categorias(id)
);

CREATE TABLE clientes(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR (20),
    sobrenome VARCHAR(100),
    cpf CHAR(11),
    numCel CHAR(15),
    email VARCHAR(150)
);

CREATE TABLE pedidos(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    idProduto INT,
    idCliente INT,
    quantidade INT,
    preçoTotal DECIMAL (7,2),
    FOREIGN KEY (idProduto) REFERENCES produtos(id),
    FOREIGN KEY (idCliente) REFERENCES clientes(id)
);

CREATE TABLE vendas(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    IdPedido INT,
    dataAtual DATE,
    horaAtual TIME,
    total DECIMAL(7,2),
    FOREIGN KEY (idPedido) REFERENCES pedidos(id)
);

INSERT INTO categorias (nome, url_imagem)
VALUES ('Pratos','url'),
('Lanches','url'),
('Bebias','url');
;

INSERT INTO produtos (nome, descriçao, valor)
VALUES ('Refrigerante', 'Coca-Cola', 1.00),
('Salgadinho','Fandangos', 2.50)
;

SELECT * FROM cardapio.produtos;
    
