-- ============================================
-- AULA 04 — Manipulando Dados
-- ============================================
-- Nesta aula vamos popular as tabelas com dados
-- e aprender INSERT, UPDATE e DELETE.
--
-- Pré-requisito: rode a aula03 antes (.read /aulas/aula03-criando-tabelas.sql)
-- ============================================


-- ============================================
-- INSERT — inserindo registros
-- ============================================

-- Inserindo um cliente de cada vez
INSERT INTO clientes (nome, email, cidade) VALUES ('Ana Silva', 'ana@email.com', 'São Paulo');
INSERT INTO clientes (nome, email, cidade) VALUES ('Bruno Costa', 'bruno@email.com', 'Curitiba');

-- Inserindo vários de uma vez (mais eficiente)
INSERT INTO clientes (nome, email, cidade) VALUES
    ('Carla Dias', 'carla@email.com', 'Recife'),
    ('Daniel Rocha', 'daniel@email.com', 'São Paulo'),
    ('Elena Martins', 'elena@email.com', 'Belo Horizonte'),
    ('Felipe Souza', 'felipe@email.com', 'Curitiba'),
    ('Gabriela Lima', 'gabriela@email.com', 'Salvador'),
    ('Hugo Oliveira', 'hugo@email.com', 'Recife');

-- Inserindo produtos
INSERT INTO produtos (nome, categoria, preco, estoque) VALUES
    ('Camiseta Básica', 'Roupas', 49.90, 100),
    ('Calça Jeans', 'Roupas', 129.90, 50),
    ('Tênis Esportivo', 'Calçados', 199.90, 30),
    ('Mochila Urbana', 'Acessórios', 89.90, 40),
    ('Boné Classic', 'Acessórios', 39.90, 80),
    ('Jaqueta Corta-Vento', 'Roupas', 179.90, 20),
    ('Meias Kit 3 Pares', 'Roupas', 29.90, 200),
    ('Relógio Digital', 'Acessórios', 149.90, 25),
    ('Óculos de Sol', 'Acessórios', 99.90, 35),
    ('Sandália Confort', 'Calçados', 79.90, 60);

-- Inserindo pedidos (cada pedido pertence a um cliente)
INSERT INTO pedidos (cliente_id, data_pedido, status) VALUES
    (1, '2025-01-10', 'entregue'),
    (1, '2025-02-15', 'entregue'),
    (2, '2025-01-20', 'entregue'),
    (3, '2025-02-01', 'enviado'),
    (4, '2025-03-05', 'pendente'),
    (5, '2025-03-10', 'entregue'),
    (6, '2025-03-12', 'cancelado'),
    (2, '2025-03-15', 'pendente'),
    (7, '2025-03-20', 'enviado'),
    (3, '2025-04-01', 'pendente');

-- Inserindo itens dos pedidos
INSERT INTO itens_pedido (pedido_id, produto_id, quantidade, preco_unitario) VALUES
    (1, 1, 2, 49.90),   -- Pedido 1: 2x Camiseta
    (1, 5, 1, 39.90),   -- Pedido 1: 1x Boné
    (2, 3, 1, 199.90),  -- Pedido 2: 1x Tênis
    (3, 2, 1, 129.90),  -- Pedido 3: 1x Calça
    (3, 7, 3, 29.90),   -- Pedido 3: 3x Meias
    (4, 4, 1, 89.90),   -- Pedido 4: 1x Mochila
    (4, 9, 1, 99.90),   -- Pedido 4: 1x Óculos
    (5, 6, 1, 179.90),  -- Pedido 5: 1x Jaqueta
    (5, 1, 3, 49.90),   -- Pedido 5: 3x Camiseta
    (6, 8, 1, 149.90),  -- Pedido 6: 1x Relógio
    (6, 10, 2, 79.90),  -- Pedido 6: 2x Sandália
    (7, 5, 2, 39.90),   -- Pedido 7: 2x Boné
    (8, 3, 1, 199.90),  -- Pedido 8: 1x Tênis
    (8, 1, 1, 49.90),   -- Pedido 8: 1x Camiseta
    (9, 2, 2, 129.90),  -- Pedido 9: 2x Calça
    (9, 4, 1, 89.90),   -- Pedido 9: 1x Mochila
    (10, 6, 1, 179.90), -- Pedido 10: 1x Jaqueta
    (10, 7, 5, 29.90);  -- Pedido 10: 5x Meias


-- ============================================
-- Conferindo os dados inseridos
-- ============================================

SELECT '--- CLIENTES ---';
SELECT * FROM clientes;

SELECT '--- PRODUTOS ---';
SELECT * FROM produtos;

SELECT '--- PEDIDOS ---';
SELECT * FROM pedidos;

SELECT '--- ITENS PEDIDO ---';
SELECT * FROM itens_pedido;


-- ============================================
-- UPDATE — atualizando registros
-- ============================================
-- SEMPRE use WHERE no UPDATE, senão você altera TODAS as linhas da tabela.

-- Alterar a cidade de um cliente
UPDATE clientes SET cidade = 'Rio de Janeiro' WHERE id = 1;

-- Dar desconto em um produto (reduzir preço)
UPDATE produtos SET preco = 39.90 WHERE nome = 'Camiseta Básica';

-- Mudar o status de um pedido
UPDATE pedidos SET status = 'enviado' WHERE id = 5;

-- Conferindo as alterações
SELECT * FROM clientes WHERE id = 1;
SELECT * FROM produtos WHERE nome = 'Camiseta Básica';
SELECT * FROM pedidos WHERE id = 5;


-- ============================================
-- DELETE — removendo registros
-- ============================================
-- SEMPRE use WHERE no DELETE, senão você apaga TODAS as linhas da tabela.

-- Remover o pedido cancelado (primeiro os itens, depois o pedido)
DELETE FROM itens_pedido WHERE pedido_id = 7;
DELETE FROM pedidos WHERE id = 7;

-- Conferindo que o pedido 7 não existe mais
SELECT * FROM pedidos WHERE id = 7;
