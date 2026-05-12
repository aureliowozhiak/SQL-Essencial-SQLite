-- ============================================
-- AULA 05 — Consultas Básicas
-- ============================================
-- O SELECT é o comando mais usado em SQL.
-- Aqui vamos aprender a buscar e filtrar dados.
--
-- Pré-requisito: rode aula03 + aula04 (ou seed.sql)
-- ============================================


-- ============================================
-- SELECT — buscando dados
-- ============================================

-- Buscar todas as colunas de todos os clientes
SELECT * FROM clientes;

-- Buscar apenas colunas específicas
SELECT nome, email FROM clientes;

-- Buscar todos os produtos com nome e preço
SELECT nome, preco FROM produtos;


-- ============================================
-- WHERE — filtrando resultados
-- ============================================

-- Clientes de São Paulo
SELECT * FROM clientes WHERE cidade = 'São Paulo';

-- Produtos com preço maior que 100
SELECT nome, preco FROM produtos WHERE preco > 100;

-- Produtos com preço menor ou igual a 50
SELECT nome, preco FROM produtos WHERE preco <= 50;

-- Pedidos que já foram entregues
SELECT * FROM pedidos WHERE status = 'entregue';


-- ============================================
-- Operadores de comparação
-- ============================================
-- =     igual
-- != ou <> diferente
-- >     maior que
-- <     menor que
-- >=    maior ou igual
-- <=    menor ou igual

-- Produtos que NÃO são da categoria Roupas
SELECT nome, categoria FROM produtos WHERE categoria != 'Roupas';

-- Pedidos de 2025 em diante
SELECT * FROM pedidos WHERE data_pedido >= '2025-03-01';


-- ============================================
-- AND / OR — combinando condições
-- ============================================

-- Produtos de Roupas com preço abaixo de 100
SELECT nome, categoria, preco
FROM produtos
WHERE categoria = 'Roupas' AND preco < 100;

-- Clientes de São Paulo OU Curitiba
SELECT nome, cidade
FROM clientes
WHERE cidade = 'São Paulo' OR cidade = 'Curitiba';

-- Produtos de Roupas baratos OU qualquer acessório
SELECT nome, categoria, preco
FROM produtos
WHERE (categoria = 'Roupas' AND preco < 50)
   OR categoria = 'Acessórios';


-- ============================================
-- IN — comparar com uma lista de valores
-- ============================================

-- Clientes de cidades específicas (substitui vários ORs)
SELECT nome, cidade
FROM clientes
WHERE cidade IN ('São Paulo', 'Curitiba', 'Recife');

-- Pedidos com status pendente ou enviado
SELECT * FROM pedidos WHERE status IN ('pendente', 'enviado');


-- ============================================
-- BETWEEN — intervalo de valores
-- ============================================

-- Produtos com preço entre 50 e 150 (inclui os extremos)
SELECT nome, preco
FROM produtos
WHERE preco BETWEEN 50 AND 150;

-- Pedidos feitos em fevereiro de 2025
SELECT * FROM pedidos
WHERE data_pedido BETWEEN '2025-02-01' AND '2025-02-28';


-- ============================================
-- LIKE — busca por padrão em textos
-- ============================================
-- %  = qualquer sequência de caracteres (zero ou mais)
-- _  = exatamente um caractere

-- Clientes cujo nome começa com "C"
SELECT nome FROM clientes WHERE nome LIKE 'C%';

-- Produtos que contêm "Kit" no nome
SELECT nome FROM produtos WHERE nome LIKE '%Kit%';

-- Clientes cujo email termina com @email.com
SELECT nome, email FROM clientes WHERE email LIKE '%@email.com';

-- Nomes com exatamente 3 letras antes de um espaço
SELECT nome FROM clientes WHERE nome LIKE '___  %';


-- ============================================
-- IS NULL / IS NOT NULL — valores nulos
-- ============================================

-- Para checar se um campo é vazio (NULL), NÃO use = NULL.
-- Use IS NULL ou IS NOT NULL.

-- Todos os clientes que TÊM data de criação
SELECT nome, criado_em FROM clientes WHERE criado_em IS NOT NULL;
