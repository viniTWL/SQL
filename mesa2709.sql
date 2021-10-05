USE emarket;

-- 1 - Exiba os índices existentes na tabela produtos;
SHOW INDEX FROM produtos;
-- 2 - Exclua o índice Produtos_ProdutoNome da tabela Produtos;
DROP INDEX produtos_produtonome ON produtos;
-- 3 - Crie uma consulta que traga os campos ProdutoNome da tabela produtos,  ProdutoID, PrecoUnitario e Quantidade da tabela detalhefatura. Observe o tempo de duração da consulta.
EXPLAIN SELECT 
	p.ProdutoNome, 
	df.ProdutoID, 
	df.PrecoUnitario, 
	df.Quantidade
FROM produtos p
INNER JOIN detalhefatura df ON p.ProdutoID = df.ProdutoID;
-- 4 - Crie o índice Produtos_ProdutoNome no campo ProdutoNome da tabela produtos e repita a consulta do item 3. Observe o tempo de duração da consulta. Houve alguma diferença? Descreva o que você observou.
CREATE INDEX `Produtos_ProdutoNome` ON produtos(ProdutoNome);


-- WHERE

-- 1) Exiba os nomes dos produtos que possuem qualquer combinação de‘spread’.
-- Tabela: Produtos
-- Campo: ProdutoNome

SELECT ProdutoNome FROM produtos
WHERE ProdutoNome LIKE '%spread%';

-- 2) Mostre os contatos  cujos nomes começam com a letra "Y"
-- Tabela: clientes
-- Campo: contato

SELECT Contato FROM clientes
WHERE Contato LIKE 'y%';

-- ORDER BY

-- 1) Mostre cinco produtos mais caros e seus nomes em ordem decrescente
-- Tabela: produtos
-- Campos: ProdutoNome, PrecoUnitario

SELECT ProdutoNome, PrecoUnitario FROM produtos
ORDER BY PrecoUnitario DESC LIMIT 5;


-- Operadores e Joins

-- 1) Mostre o contato, o  endereço concatenado com a cidade dos clientes cuja cidade é ‘London’
-- Tabela: clientes
-- Campos: Contato, Endereco, Cidade

SELECT Contato, CONCAT(Endereco,',',Cidade) AS endereço FROM clientes
WHERE Cidade LIKE 'London';

-- 2) Concatene o nome  e o sobrenome dos empregados e mostre a soma dos valores em Transporte para cada um. Ordene os valores de forma decrescente.
-- Tabelas: empregados, faturas
-- Campos: nome, sobrenome, transporte

SELECT CONCAT(e.Nome,' ',e.Sobrenome) AS nome, SUM(f.Transporte) AS total
FROM empregados e 
INNER JOIN faturas f ON e.EmpregadoID = f.EmpregadoID
GROUP BY e.nome
ORDER BY f.Transporte DESC;

-- Funções de Agregação












