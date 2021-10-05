CREATE DATABASE spotify;
USE spotify;

CREATE TABLE usuario (
id INT PRIMARY KEY AUTO_INCREMENT,
nomeusuario VARCHAR(45),
data_nac DATE,
sexo VARCHAR(1),
email VARCHAR(150),
senha VARCHAR(45)
);

CREATE TABLE artista (
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45),
sobrenome VARCHAR(100)
);

CREATE TABLE playlist (
id INT NOT NULL PRIMARY KEY auto_increment,
titulo VARCHAR(45),
qtdcancoes INT,
datacriacao DATETIME,
usuario INT,
FOREIGN KEY (usuario) REFERENCES usuario (id)
);


CREATE TABLE album (
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
titulo VARCHAR(45),
artista INT,
FOREIGN KEY (artista) REFERENCES artista (id)
);

CREATE TABLE cancoes (
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
titulo VARCHAR(45),
duracao DOUBLE,
qtdreproduçao INT,
qtdlikes INT,
album INT,
FOREIGN KEY (album) REFERENCES album (id)
);

CREATE TABLE playlist_cancao(
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
cancao INT,
playlist INT,
FOREIGN KEY (cancao) REFERENCES cancoes (id),
FOREIGN KEY (playlist) REFERENCES playlist (id)
);

CREATE TABLE genero(
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
genero VARCHAR(45)
);

CREATE TABLE generocancao(
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
cancao INT,
genero INT,
FOREIGN KEY (cancao) REFERENCES cancoes (id),
FOREIGN KEY (genero) REFERENCES genero (id)
);

INSERT INTO usuario (nomeusuario)
VALUES ("Marco"),
("Lelia"),
("Gladston");

SELECT * FROM usuario;

INSERT INTO cancoes (titulo)
VALUES ("Yesterday"),
("Breaking the habit"),
("Fur Elise");

INSERT INTO album (titulo)
VALUES ("Help"),
("Meteora"),
("Betoven");




