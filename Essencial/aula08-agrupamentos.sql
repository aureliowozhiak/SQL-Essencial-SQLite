-- ============================================
-- AULA 08 — Agrupamentos e Funções de Agregação
-- ============================================
-- Funções de agregação operam sobre um conjunto de linhas
-- e retornam um único valor. GROUP BY agrupa linhas com
-- valores iguais para aplicar essas funções.
--
-- Pré-requisito: rode aula03 + aula04 (ou seed.sql)
-- ============================================


-- ============================================
-- Funções de agregação (sem GROUP BY)
-- ============================================
-- Quando usadas sem GROUP BY, operam sobre a tabela inteira.

-- Quantos clientes temos?
SELECT COUNT(*) AS total_clientes FROM clientes;

-- Quantos pedidos existem?
SELECT COUNT(*) AS total_pedidos FROM pedidos;

-- Qual o preço médio dos produtos?
SELECT AVG(preco) AS preco_medio FROM produtos;

-- Qual o produto mais caro e mais barato?
SELECT
    MIN(preco) AS menor_preco,
    MAX(preco) AS maior_preco
FROM produtos;

-- Qual o valor total do estoque da loja?
SELECT SUM(preco * estoque) AS valor_total_estoque FROM produtos;


-- ============================================
-- GROUP BY — agrupando resultados
-- ============================================
-- Agrupa linhas que têm o mesmo valor em uma coluna
-- para aplicar funções de agregação em cada grupo.

-- Quantos clientes por cidade?
SELECT cidade, COUNT(*) AS total
FROM clientes
GROUP BY cidade;

-- Quantos produtos por categoria?
SELECT categoria, COUNT(*) AS total
FROM produtos
GROUP BY categoria;

-- Preço médio por categoria
SELECT categoria, ROUND(AVG(preco), 2) AS preco_medio
FROM produtos
GROUP BY categoria;

-- Quantos pedidos por status?
SELECT status, COUNT(*) AS total
FROM pedidos
GROUP BY status;

-- Total de pedidos por cliente
SELECT
    c.nome,
    COUNT(p.id) AS total_pedidos
FROM clientes c
LEFT JOIN pedidos p ON p.cliente_id = c.id
GROUP BY c.id, c.nome
ORDER BY total_pedidos DESC;


-- ============================================
-- HAVING — filtrando grupos
-- ============================================
-- WHERE filtra LINHAS (antes do agrupamento).
-- HAVING filtra GRUPOS (depois do agrupamento).

-- Cidades com mais de 1 cliente
SELECT cidade, COUNT(*) AS total
FROM clientes
GROUP BY cidade
HAVING total > 1;

-- Categorias onde o preço médio é maior que 80
SELECT categoria, ROUND(AVG(preco), 2) AS preco_medio
FROM produtos
GROUP BY categoria
HAVING preco_medio > 80;

-- Clientes que fizeram mais de 1 pedido
SELECT
    c.nome,
    COUNT(p.id) AS total_pedidos
FROM clientes c
INNER JOIN pedidos p ON p.cliente_id = c.id
GROUP BY c.id, c.nome
HAVING total_pedidos > 1;


-- ============================================
-- GROUP BY + JOIN — consultas mais completas
-- ============================================

-- Valor total por pedido
SELECT
    p.id        AS pedido,
    c.nome      AS cliente,
    SUM(ip.quantidade * ip.preco_unitario) AS valor_total
FROM pedidos p
INNER JOIN clientes c      ON p.cliente_id  = c.id
INNER JOIN itens_pedido ip ON ip.pedido_id  = p.id
GROUP BY p.id, c.nome
ORDER BY valor_total DESC;

-- Quanto cada cliente gastou no total?
SELECT
    c.nome      AS cliente,
    COUNT(DISTINCT p.id) AS pedidos,
    SUM(ip.quantidade * ip.preco_unitario) AS total_gasto
FROM clientes c
INNER JOIN pedidos p       ON p.cliente_id  = c.id
INNER JOIN itens_pedido ip ON ip.pedido_id  = p.id
GROUP BY c.id, c.nome
ORDER BY total_gasto DESC;

-- Produtos mais vendidos (por quantidade)
SELECT
    pr.nome      AS produto,
    SUM(ip.quantidade) AS total_vendido
FROM itens_pedido ip
INNER JOIN produtos pr ON ip.produto_id = pr.id
GROUP BY pr.id, pr.nome
ORDER BY total_vendido DESC;

-- Faturamento por categoria
SELECT
    pr.categoria,
    SUM(ip.quantidade * ip.preco_unitario) AS faturamento
FROM itens_pedido ip
INNER JOIN produtos pr ON ip.produto_id = pr.id
GROUP BY pr.categoria
ORDER BY faturamento DESC;


-- ============================================
-- Subquery básica (bônus)
-- ============================================

-- Produtos com preço acima da média
SELECT nome, preco
FROM produtos
WHERE preco > (SELECT AVG(preco) FROM produtos)
ORDER BY preco DESC;

-- Clientes que fizeram pedidos em março de 2025
SELECT nome, email
FROM clientes
WHERE id IN (
    SELECT cliente_id
    FROM pedidos
    WHERE data_pedido BETWEEN '2025-03-01' AND '2025-03-31'
);


-- ============================================
-- Ordem de execução do SQL (resumo)
-- ============================================
-- 1. FROM / JOIN    → de onde vêm os dados
-- 2. WHERE          → filtra linhas
-- 3. GROUP BY       → agrupa linhas
-- 4. HAVING         → filtra grupos
-- 5. SELECT         → escolhe colunas
-- 6. ORDER BY       → ordena resultado
-- 7. LIMIT / OFFSET → limita quantidade
