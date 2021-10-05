USE projeto_spotify;

SELECT * FROM cancao
WHERE titulo;

SELECT * FROM cancao
WHERE titulo LIKE "_a" and titulo LIKE "%s";

SELECT * FROM usuario ORDER BY Data_nac DESC LIMIT 5; 

SELECT * FROM cancao ORDER BY qtdreproducao DESC LIMIT 5;

SELECT imagemcapa, titulo, idAlbum FROM album
WHERE imagemcapa IS NULL;

INSERT INTO usuario (Nomeusuario)
VALUES ('IIDASD');






