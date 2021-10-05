USE emarket;

-- 1
SELECT 
	f.FaturaId, 
	f.DataFatura,
    co.empresa,
    f.NomeEnvio,
    ca.CategoriaNome,
    p.CategoriaID,
    p.ProdutoNome,
    p.PrecoUnitario,
    p.UnidadesPedidas
FROM correios co
INNER JOIN faturas f ON co.CorreioID = f.FormaEnvio
INNER JOIN detalhefatura df ON f.FaturaID = df.FaturaID
INNER JOIN produtos p ON p.ProdutoID = df.ProdutoID
INNER JOIN categorias ca ON p.CategoriaID = ca.CategoriaID;

-- 2

-- 1 - Liste todas as categorias junto com informações sobre seus produtos. Incluir todas as categorias, mesmo que não tenham produtos.

SELECT 
	c.CategoriaNome,
    c.Descricao,
    p.ProdutoNome
FROM categorias c
LEFT JOIN produtos p ON c.CategoriaID = p.CategoriaID;

-- 2 - Liste as informações de contato de clientes que nunca compraram no emarket

select 
	c.Contato,
    c.Telefone
from clientes c
where c.ClienteID not in (select ClienteID from faturas);

-- 3 - Faça uma lista de produtos. Para cada um, indique seu nome, categoria e as informações de contato de seu fornecedor. Lembre-se que podem existir produtos para os quais o fornecedor não foi indicado.

SELECT p.ProdutoNome, c.CategoriaNome, f.Empresa, f.Contato, f.Telefone
FROM categorias c
INNER JOIN produtos p ON p.CategoriaID = c.CategoriaID
LEFT JOIN provedores f ON f.ProvedorID = p.ProvedorID;

-- 4 - Para cada categoria, liste o preço unitário médio de seus produtos.

SELECT 
	c.CategoriaNome, 
	FORMAT(AVG(df.PrecoUnitario), 2) as preço
FROM categorias c 
INNER JOIN produtos p ON c.CategoriaID = p.CategoriaID 
INNER JOIN detalhefatura df ON p.ProdutoID = df.ProdutoID
GROUP BY c.CategoriaNome;

-- 5 -  Para cada cliente, indique a última nota fiscal de compra. Inclua clientes que nunca compraram no e-market.

SELECT 
	c.Empresa,
    MAX(f.DataFatura),
    f.FaturaID
FROM clientes c
LEFT JOIN faturas f ON c.ClienteID = f.ClienteID
GROUP BY c.empresa;

-- 6 - Todas as faturas têm uma empresa de correio associada (envio). Gere uma lista com todas as empresas de correio e o número de faturas correspondentes. Execute a consulta usando RIGHT JOIN.

SELECT 
	co.Empresa,
    COUNT(f.FaturaId) as Numero_Fatura
FROM faturas f 
RIGHT JOIN correios co  ON co.CorreioID = f.FormaEnvio
GROUP BY co.CorreioID;


























 

