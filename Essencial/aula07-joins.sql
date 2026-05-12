-- ============================================
-- AULA 07 — Relacionamentos (JOINs)
-- ============================================
-- JOIN conecta dados de tabelas diferentes usando
-- uma coluna em comum (geralmente uma foreign key).
--
-- Pré-requisito: rode aula03 + aula04 (ou seed.sql)
-- ============================================


-- ============================================
-- INNER JOIN — retorna só onde há correspondência nas duas tabelas
-- ============================================

-- Pedidos com o nome do cliente
-- Conecta pedidos.cliente_id com clientes.id
SELECT
    p.id        AS pedido,
    c.nome      AS cliente,
    p.data_pedido,
    p.status
FROM pedidos p
INNER JOIN clientes c ON p.cliente_id = c.id;

-- Itens do pedido com o nome do produto
SELECT
    ip.pedido_id,
    pr.nome       AS produto,
    ip.quantidade,
    ip.preco_unitario,
    ip.quantidade * ip.preco_unitario AS subtotal
FROM itens_pedido ip
INNER JOIN produtos pr ON ip.produto_id = pr.id;


-- ============================================
-- JOIN com múltiplas tabelas
-- ============================================
-- Você pode encadear vários JOINs para cruzar 3 ou mais tabelas.

-- Visão completa: cliente → pedido → itens → produto
SELECT
    c.nome        AS cliente,
    p.id          AS pedido,
    p.data_pedido,
    pr.nome       AS produto,
    ip.quantidade,
    ip.preco_unitario,
    ip.quantidade * ip.preco_unitario AS subtotal
FROM pedidos p
INNER JOIN clientes c      ON p.cliente_id  = c.id
INNER JOIN itens_pedido ip ON ip.pedido_id  = p.id
INNER JOIN produtos pr     ON ip.produto_id = pr.id
ORDER BY p.id, pr.nome;


-- ============================================
-- LEFT JOIN — retorna tudo da tabela da esquerda, mesmo sem correspondência
-- ============================================
-- Útil para encontrar registros que NÃO têm relação.

-- Todos os clientes e seus pedidos (mesmo quem nunca comprou)
-- Clientes sem pedido aparecem com NULL nas colunas de pedidos
SELECT
    c.nome    AS cliente,
    p.id      AS pedido,
    p.status
FROM clientes c
LEFT JOIN pedidos p ON p.cliente_id = c.id
ORDER BY c.nome;

-- Quais clientes NUNCA fizeram um pedido?
-- Basta filtrar onde o lado direito (pedido) é NULL
SELECT c.nome, c.email
FROM clientes c
LEFT JOIN pedidos p ON p.cliente_id = c.id
WHERE p.id IS NULL;

-- Quais produtos NUNCA foram vendidos?
SELECT pr.nome, pr.categoria
FROM produtos pr
LEFT JOIN itens_pedido ip ON ip.produto_id = pr.id
WHERE ip.id IS NULL;


-- ============================================
-- JOIN com WHERE — filtrando após o cruzamento
-- ============================================

-- Pedidos entregues com detalhes do cliente
SELECT
    c.nome      AS cliente,
    c.cidade,
    p.id        AS pedido,
    p.data_pedido
FROM pedidos p
INNER JOIN clientes c ON p.cliente_id = c.id
WHERE p.status = 'entregue'
ORDER BY p.data_pedido;

-- Itens de pedidos feitos por clientes de São Paulo
SELECT
    c.nome    AS cliente,
    pr.nome   AS produto,
    ip.quantidade
FROM itens_pedido ip
INNER JOIN pedidos p   ON ip.pedido_id  = p.id
INNER JOIN clientes c  ON p.cliente_id  = c.id
INNER JOIN produtos pr ON ip.produto_id = pr.id
WHERE c.cidade = 'São Paulo';


-- ============================================
-- Resumo visual
-- ============================================
-- INNER JOIN  →  só onde há match nas DUAS tabelas
--                [  A  ∩  B  ]
--
-- LEFT JOIN   →  tudo da tabela A + matches de B (NULL onde não há match)
--                [ A  (∩  B) ]
