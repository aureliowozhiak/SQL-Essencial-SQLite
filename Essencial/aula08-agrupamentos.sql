-- ============================================
-- AULA 08 — Agrupamentos e Funções de Agregação
-- ============================================
-- Funções de agregação (COUNT, AVG, MIN, MAX, SUM) resumem
-- várias linhas em um único valor. Sem GROUP BY, o cálculo
-- vale para a tabela inteira.
--
-- GROUP BY divide os dados em grupos (ex.: por categoria)
-- e aplica a agregação em cada grupo.
--
-- HAVING filtra grupos já agrupados — como WHERE, mas depois
-- do GROUP BY (ex.: só categorias com média acima de 80).
--
-- Pré-requisito: rode aula03 + aula04 (ou seed.sql)
-- ============================================


SELECT
    COUNT(*)  AS total,
    AVG(preco) AS media,
    MIN(preco) AS minimo,
    MAX(preco) AS maximo,
    SUM(preco) AS soma
FROM produtos;


SELECT categoria, COUNT(*) AS total
FROM produtos
GROUP BY categoria;


SELECT categoria, AVG(preco) AS media
FROM produtos
GROUP BY categoria
HAVING media > 80;
