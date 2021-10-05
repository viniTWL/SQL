USE musimundos;

CREATE VIEW faturas_nacionais AS
SELECT f.id AS 'IDfatura', f.data_fatura, c.id 'IDcliente', c.nome, c.sobrenome, f.valor_total
FROM faturas f
INNER JOIN clientes c ON f.id_cliente = c.id
WHERE pais LIKE 'Argentina';

SELECT * FROM faturas_nacionais;

CREATE VIEW latinas AS
SELECT a.nome, al.titulo, c.nome AS musica
FROM artistas a
INNER JOIN albuns al ON a.id = al.id
INNER JOIN cancoes c  ON a.id = c.id
INNER JOIN generos g ON c.id_genero = g.id
WHERE g.nome LIKE 'Latin';

select * from latinas;

DROP VIEW faturas_brazil;
CREATE VIEW faturas_brazil AS
SELECT DISTINCT c.nome, c.sobrenome, f.pais_cobranca, SUM(f.valor_total)
FROM clientes c
INNER JOIN faturas f ON c.id = f.id_cliente
WHERE f.pais_cobranca LIKE 'BRAZIL';

SELECT * FROM faturas_brazil;