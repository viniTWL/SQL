CREATE DATABASE academia;

USE academia;

CREATE TABLE clientes(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	nome VARCHAR(30),
	peso DECIMAL(3,1),
	idade CHAR(2),
	telefone VARCHAR(20)
);

CREATE TABLE personal_trainer(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(30),
    sobrenome VARCHAR(50),
    especialidade VARCHAR(50),
    telefone VARCHAR(20)
    );

CREATE TABLE inscricao (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    dataInscricao DATE,
    idclientes INT,
	FOREIGN KEY (idclientes) REFERENCES clientes(id)
    );

CREATE TABLE aparelhos (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	nome_aparelho VARCHAR(30),
    tempo_uso TIME
    );
    
ALTER TABLE clientes
ADD idpersonal_trainer INT,
ADD FOREIGN KEY (idpersonal_trainer) REFERENCES personal_trainer(id);

ALTER TABLE personal_trainer
ADD idaparelhos INT,
ADD FOREIGN KEY (idaparelhos) REFERENCES aparelhos(id);

ALTER TABLE personal_trainer
DROP CONSTRAINT personal_trainer_ibfk_1;

ALTER TABLE personal_trainer
DROP COLUMN idaparelhos;

CREATE TABLE aparelho_personal (
	id_aparelho INT,
    id_personal INT,
	FOREIGN KEY (id_aparelho) REFERENCES aparelhos(id),
    FOREIGN KEY (id_personal) REFERENCES personal_trainer(id)
    );

ALTER TABLE clientes
ADD COLUMN endereco VARCHAR(100);

ALTER TABLE inscricao 
ADD COLUMN descricao VARCHAR(100);

ALTER TABLE aparelhos 
ADD COLUMN descricao VARCHAR(100);

INSERT INTO clientes (nome, peso, idade, telefone, endereco) 
VALUES ('Vinícius', 60.0, 19, 99767610,'Rua Emerson Batista, São Cristovão');

INSERT INTO clientes (nome, peso, idade, telefone, endereco) 
VALUES('João', 72.3, 34, 98432330, 'Rua Flores, Jardins'),
('Maria', 53.2, 22, 97657658, 'Rua Pedras, Rochas');

INSERT INTO personal_trainer (nome, sobrenome, especialidade, telefone)
VALUES ('José','Silva','aeróbica',98765312),
('Roger','Flores','musculação',96446221),
('Regina','Cazé','Zumba',96669666);

INSERT INTO aparelhos (nome_aparelho, tempo_uso, descricao)
VALUES ('esteira', '0:30:00','aparelho para cardio'),
('supino','0:20:00','aparelho para musculação'),
('barras','0:20:00','aparelho para musculação e resistência');

INSERT INTO inscricao (dataInscricao, descricao)
VALUES ('2019:03:04', 'foco em calistenia'),
('2021:09:17', 'começar do básico'),
('2020:06:21', 'foco em aeróbica');

UPDATE clientes SET idpersonal_trainer = 2
WHERE id = 1;

UPDATE clientes SET idpersonal_trainer = 1
WHERE id = 2;

UPDATE clientes SET idpersonal_trainer = 3
WHERE id = 3;

UPDATE inscricao SET idclientes = 1
WHERE id = 1;

UPDATE inscricao SET idclientes = 3
WHERE id = 2;

UPDATE inscricao SET idclientes = 3
WHERE id = 3;

INSERT INTO aparelho_personal (id_aparelho, id_personal)
VALUES (1, 3),
(2, 2),
(3, 1);

UPDATE personal_trainer SET sobrenome = 'Souza'
WHERE id = 1;

UPDATE clientes SET peso = 61.0
WHERE id = 1;

UPDATE aparelhos SET tempo_uso = '00:15:00'
WHERE id = 2;

SET FOREIGN_KEY_CHECKS = 1;

DELETE FROM aparelhos WHERE nome_aparelho = 'esteira';

SELECT * FROM clientes
ORDER BY idade ASC;

SELECT * FROM personal_trainer
WHERE especialidade = 'musculação';

SELECT COUNT(id) FROM clientes
WHERE idade >= 18;

SELECT 
	COUNT(c.id) as qtdClientes, 
	AVG(c.peso) as MédiaPeso
FROM clientes c;

SELECT
	c.nome, 
	c.peso, 
	c.idade, 
    p.nome as Personal
FROM clientes c 
INNER JOIN personal_trainer p ON c.idpersonal_trainer = p.id;















