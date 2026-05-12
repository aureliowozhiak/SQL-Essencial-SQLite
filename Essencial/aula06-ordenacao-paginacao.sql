-- ============================================
-- AULA 06 — Ordenação e Paginação
-- ============================================
-- Aprender a ordenar resultados, limitar quantidades,
-- remover duplicatas e usar aliases.
--
-- Pré-requisito: rode aula03 + aula04 (ou seed.sql)
-- ============================================


-- ============================================
-- ORDER BY — ordenando resultados
-- ============================================

-- Produtos ordenados por preço (menor para maior)
-- ASC = ascendente (padrão, pode omitir)
SELECT nome, preco FROM produtos ORDER BY preco ASC;

-- Produtos ordenados por preço (maior para menor)
-- DESC = descendente
SELECT nome, preco FROM produtos ORDER BY preco DESC;

-- Clientes ordenados por cidade, e dentro da mesma cidade por nome
SELECT nome, cidade FROM clientes ORDER BY cidade, nome;

-- Pedidos mais recentes primeiro
SELECT * FROM pedidos ORDER BY data_pedido DESC;


-- ============================================
-- LIMIT — limitando quantidade de resultados
-- ============================================

-- Os 3 produtos mais caros
SELECT nome, preco
FROM produtos
ORDER BY preco DESC
LIMIT 3;

-- Os 5 primeiros clientes cadastrados
SELECT nome, criado_em
FROM clientes
ORDER BY id
LIMIT 5;


-- ============================================
-- OFFSET — pulando resultados (paginação)
-- ============================================
-- OFFSET pula N registros antes de começar a retornar.
-- Útil para paginação: página 1, página 2, etc.

-- Página 1 (primeiros 3 produtos)
SELECT nome, preco FROM produtos ORDER BY nome LIMIT 3 OFFSET 0;

-- Página 2 (próximos 3 produtos)
SELECT nome, preco FROM produtos ORDER BY nome LIMIT 3 OFFSET 3;

-- Página 3
SELECT nome, preco FROM produtos ORDER BY nome LIMIT 3 OFFSET 6;


-- ============================================
-- DISTINCT — removendo duplicatas
-- ============================================

-- Quais cidades têm clientes cadastrados? (sem repetir)
SELECT DISTINCT cidade FROM clientes;

-- Quais categorias de produtos existem?
SELECT DISTINCT categoria FROM produtos;

-- Quais status de pedido existem?
SELECT DISTINCT status FROM pedidos;


-- ============================================
-- AS (aliases) — renomeando colunas e tabelas
-- ============================================

-- Renomear coluna no resultado (não altera a tabela, só a exibição)
SELECT nome AS produto, preco AS valor FROM produtos;

-- Criar colunas calculadas com alias
SELECT
    nome,
    preco,
    estoque,
    preco * estoque AS valor_total_estoque
FROM produtos;

-- Alias em tabelas (atalho para nomes longos, muito usado com JOINs)
SELECT p.nome, p.preco
FROM produtos AS p
WHERE p.categoria = 'Roupas';


-- ============================================
-- Combinando tudo
-- ============================================

-- Top 3 produtos mais caros da categoria Acessórios
SELECT nome AS produto, preco AS valor
FROM produtos
WHERE categoria = 'Acessórios'
ORDER BY preco DESC
LIMIT 3;

-- Clientes de SP ou RJ, ordenados por nome, só os 5 primeiros
SELECT nome, cidade
FROM clientes
WHERE cidade IN ('São Paulo', 'Rio de Janeiro')
ORDER BY nome
LIMIT 5;

-- Produtos com maior valor em estoque
SELECT
    nome,
    preco,
    estoque,
    preco * estoque AS valor_em_estoque
FROM produtos
ORDER BY valor_em_estoque DESC
LIMIT 5;
