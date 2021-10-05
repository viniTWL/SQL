USE emarket;

-- 1
DELIMITER $$

CREATE PROCEDURE nomes ()
BEGIN
	SELECT 	Nome, Sobrenome
    FROM empregados
    ORDER BY nome ASC;
END $$
DELIMITER ;

CALL nomes;

-- 2
DELIMITER $$

CREATE PROCEDURE cidade_empregado (IN city VARCHAR (50), OUT func VARCHAR(50))
BEGIN 
	SELECT Nome
    FROM empregados 
    WHERE Cidade = city;
END $$

DELIMITER ;

CALL cidade_empregado('Seattle', @nome);

-- 3

DELIMITER $$
CREATE PROCEDURE cliente_pais ( IN nome VARCHAR(50), OUT numero INT)
BEGIN
	SELECT count(*) INTO numero
    FROM clientes
    WHERE Pais = nome;
END $$

DELIMITER ;

CALL cliente_pais('Brazil', @valor);

-- 4

DELIMITER $$
CREATE PROCEDURE nome_produtos ( IN num INT, OUT nome VARCHAR(50))
BEGIN 
	SELECT p.ProdutoNome, p.UnidadesEstoque, c.CategoriaNome
    FROM produtos p
    INNER JOIN categorias c  ON c.CategoriaID = p.CategoriaID
    WHERE UnidadesEstoque <= num;
END $$

DELIMITER ;

CALL nome_produtos (10, @produto);
CALL nome_produtos (0, @produto);

-- 5

DROP PROCEDURE produto_desconto;
DELIMITER $$
CREATE PROCEDURE produto_desconto ( IN porcentagem DOUBLE, OUT nome VARCHAR(50))
BEGIN 
	SELECT p.ProdutoNome, c.Contato
    FROM produtos p
    INNER JOIN detalhefatura d ON p.ProdutoID = d.ProdutoID
    INNER JOIN faturas f ON d.FaturaId = f.FaturaId
    INNER JOIN clientes c ON f.ClienteID = c.ClienteID
    WHERE d.Desconto >= porcentagem;
END $$
DELIMITER ;
    
CALL produto_desconto(0.1, @lista);