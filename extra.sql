USE extra_joins;

-- 1 Obtenha os artistas que atuaram em um ou mais filmes.

SELECT a.nome, COUNT(c.titulo) as qtd
FROM artista a
INNER JOIN artista_filmes b ON a.id = b.artista_id
INNER JOIN filmes c ON c.id = b.filme_id
GROUP BY a.nome
ORDER BY c.titulo;

-- 2 - Obtenha os filmes onde mais de um artista participou de acordo com nosso banco de dados.

SELECT a.titulo, COUNT(c.nome)
FROM filmes a
INNER JOIN artista_filmes b ON a.id = b.filme_id
INNER JOIN artista c ON b.artista_id = c.id
GROUP BY a.titulo
HAVING count(c.nome) > 1;

-- 3 - Liste todos os artistas, mesmo aqueles que ainda não atuaram em nenhum filme, de acordo com nosso banco de dados.

SELECT a.nome, a.sobrenome, COUNT(c.titulo) as qtdTit
FROM artista a
LEFT JOIN artista_filmes b ON a.id = b.artista_id
LEFT JOIN filmes c ON b.filme_id
GROUP BY a.nome;

-- 4 - Obtenha filmes que não foram atribuídos a artistas em nosso banco de dados.

SELECT c.titulo, COUNT(a.id) as qtd
FROM filmes c
LEFT JOIN artista_filmes b ON b.filme_id = c.id
LEFT JOIN artista a ON a.id = b.artista_id
GROUP BY c.titulo; 

-- 5 - Pegue aqueles artistas que não atuaram em um filme, de acordo com nosso banco de dados.

SELECT a.nome, a.sobrenome, COUNT(b.artista_id) as qtdFilmes
FROM artista a
LEFT JOIN artista_filmes b ON a.id = b.artista_id
LEFT JOIN filmes c ON c.id = b.filme_id
GROUP BY a.nome
HAVING count(b.artista_id) < 1;

-- 6 Obtenha os artistas que atuaram em dois ou mais filmes de acordo com nosso banco de dados.

SELECT a.nome, COUNT(b.filme_id)
FROM artista a
LEFT JOIN artista_filmes b ON b.artista_id = a.id
LEFT JOIN filmes c ON c.id = b.filme_id
GROUP BY a.nome
HAVING COUNT(b.filme_id) >= 2;

-- 7 - Obtenha os filmes que têm um ou mais artistas atribuídos, mesmo aqueles que ainda não foram atribuídos a um artista em nosso banco de dados.

SELECT b.titulo, count(c.artista_id) AS artisAtri
FROM filmes b
LEFT JOIN artista_filmes c ON c.filme_id = b.id
LEFT JOIN artista a ON a.id = c.artista_id
GROUP BY b.titulo
HAVING count(c.artista_id); 
 