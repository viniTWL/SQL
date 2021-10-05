USE EMarket;
-- Categorias e produtos
-- 1) Queremos ter uma lista de todas as categorias.
SELECT * FROM Categorias;
-- 2) Como as categorias não possuem imagens, você está interessado em obter apenas um Nome e descrição da lista de categorias.
SELECT CategoriaNome, Descricao FROM Categorias;
-- 3) Obtenha uma lista dos produtos.
SELECT * FROM Produtos;
-- 4) Existem produtos descontinuados? (Descontinuado = 1).
SELECT Descontinuado FROM Produtos
WHERE Descontinuado = 1;
-- 5) Na sexta-feira, você deve se reunir com o fornecedor nr. 8. Quais são os produtos que eles fornecem?
SELECT * FROM Produtos
WHERE ProvedorID = 8;
-- 6) Queremos saber todos os produtos cujo preço unitário se encontra entre 10 e 22.
SELECT * FROM Produtos
WHERE PrecoUnitario >=10 AND PrecoUnitario <= 22; 
-- 7) Fica definido que um produto deve ser solicitado ao fornecedor se suas unidades em estoque forem inferiores ao nível de reabastecimento. Existem produtos a solicitar?
SELECT * FROM Produtos
WHERE  UnidadesEstoque < NivelReabastecimento; 
-- 8) Você quer saber todos os produtos da lista anterior, mas que as unidades pedidas sejam iguais a zero.
SELECT * FROM Produtos
WHERE  UnidadesEstoque < NivelReabastecimento AND UnidadesEstoque = 0; 

-- Clientes
-- 1) Obtenha uma lista de todos os clientes com contato, empresa, cargo, País. Classifique a lista por país.
SELECT Contato, Empresa, Titulo, Pais FROM Clientes
ORDER BY Pais ASC;
-- 2) Queremos atender todos os clientes que possuem o título de  “Proprietário". Esse título estará em inglês (Owner).
SELECT Contato, Empresa, Titulo, Pais 
FROM Clientes
WHERE Titulo = 'Owner';
-- 3) A operadora de telefonia atendeu um cliente e não lembra o nome dele. Sabe apenas que começa com "C". Podemos ajudá-lo a obter uma lista com todos os contatos que começam com a letra C?
SELECT Contato
FROM Clientes
WHERE Contato LIKE 'C%';

-- Faturas
-- 1) Obtenha uma lista de todas as faturas, ordenadas por data da fatura em ordem ascendente.
SELECT * FROM Faturas
ORDER BY DataFatura ASC;
-- 2) Agora é necessário uma lista de faturas com o país de envio "EUA" e que a FormaeEnvio seja diferente de 3.
SELECT * FROM Faturas
WHERE PaisEnvio = 'USA' AND FormaEnvio != 3;
-- 3) O cliente 'GOURL' fez um pedido?
SELECT * FROM Faturas
WHERE ClienteID = 'GOURL';
-- 4) Você deseja visualizar todas as faturas dos funcionários 2, 3, 5, 8 e 9.
SELECT * FROM Faturas
WHERE EmpregadoID IN (2,3,5,8,9);

-- Produtos
-- 1) Obtenha a lista de todos os produtos em ordem decrescente por preço unitário.
SELECT * FROM Produtos
ORDER BY PrecoUnitario DESC;
-- 2) Obtenha a lista dos 5 melhores produtos cujo preço unitário é o mais "Caro".
SELECT * FROM Produtos
ORDER BY PrecoUnitario DESC
LIMIT 5;
-- 3) Obtenha um top 10 dos produtos com mais unidades em estoque.
SELECT * FROM Produtos
ORDER BY UnidadesEstoque DESC
LIMIT 10;

-- DetalheFatura
-- 1) Obtenha uma lista de FaturaId, Produto, Quantidade. 
SELECT FaturaId, ProdutoID, Quantidade FROM DetalheFatura;
-- 2) Classifique a lista acima por Quantidade decrescente. 
SELECT FaturaId, ProdutoID, Quantidade FROM DetalheFatura
ORDER BY Quantidade DESC;
-- 3) Filtre a mesma lista apenas para os produtos cuja quantidade esteja entre 50 e 100. 
SELECT FaturaId, ProdutoID, Quantidade 
FROM DetalheFatura
WHERE Quantidade BETWEEN 50 AND 100
ORDER BY Quantidade DESC;
-- 4) Em outra nova consulta, obtenha uma lista com os seguintes nomes de coluna: Número da fatura (FaturaId), Produto (ProdutoId), Total (Preço Unitário * Quantidade)
-- Total (Preço Unitário * Quantidade)
SELECT * FROM DetalheFatura;
SELECT 
Quantidade,
PrecoUnitario,
(Quantidade * PrecoUnitario) AS Total, FaturaId, ProdutoID, Quantidade FROM DetalheFatura;