USE sakila;

-- 1 - Obtenha o nome e o sobrenome dos primeiros 5 atores disponíveis, use Alias para exibir os nomes das colunas com a primeira letra maiúscula.
SELECT ator.nome AS 'Nomes', ator.sobrenome AS 'Sobrenomes' FROM ator LIMIT 5;

-- 2 - Obtenha uma lista que inclua nome, sobrenome e e-mail dos clientes inativos. Use Alias para exibir os nomes das colunas com a primeira letra maiúscula.

SELECT cliente.nome AS 'Nomes', cliente.sobrenome AS 'Sobrenome', cliente.email AS 'Email'
FROM cliente
WHERE cliente.ativo = 0;

-- 3 - Obtenha uma lista de filmes, incluindo título, ano e descrição dos filmes que têm uma duracao_locacao maior que cinco. Classificar por duracao_locacao descendente e use Alias para exibir os nomes das colunas com a primeira letra maiúscula.

SELECT filme.titulo AS 'Titulo', filme.ano_lancamento AS 'Ano', filme.descricao as 'Descrição', filme.duracao_locacao AS 'TempoLocação'
FROM filme
WHERE duracao_locacao > 5
ORDER BY duracao_locacao DESC;

-- 4 - Obtenha uma lista de aluguéis que foram feitos durante o mês de Maio de 2005. Inclua todas as colunas disponíveis no resultado




