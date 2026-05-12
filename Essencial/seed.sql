-- ============================================
-- SEED — Setup rápido do banco
-- ============================================
-- Cria todas as tabelas e insere os dados de exemplo.
-- Use para pular direto para qualquer aula (05 em diante)
-- ou para resetar o banco ao estado inicial.
--
-- Uso:  .read /aulas/seed.sql
-- ============================================

DROP TABLE IF EXISTS itens_pedido;
DROP TABLE IF EXISTS pedidos;
DROP TABLE IF EXISTS produtos;
DROP TABLE IF EXISTS clientes;

CREATE TABLE clientes (
    id         INTEGER PRIMARY KEY,
    nome       TEXT    NOT NULL,
    email      TEXT    NOT NULL UNIQUE,
    cidade     TEXT    NOT NULL,
    criado_em  TEXT    DEFAULT (datetime('now'))
);

CREATE TABLE produtos (
    id         INTEGER PRIMARY KEY,
    nome       TEXT    NOT NULL,
    categoria  TEXT    NOT NULL,
    preco      REAL    NOT NULL CHECK (preco > 0),
    estoque    INTEGER NOT NULL DEFAULT 0
);

CREATE TABLE pedidos (
    id           INTEGER PRIMARY KEY,
    cliente_id   INTEGER NOT NULL REFERENCES clientes(id),
    data_pedido  TEXT    DEFAULT (date('now')),
    status       TEXT    NOT NULL DEFAULT 'pendente'
);

CREATE TABLE itens_pedido (
    id              INTEGER PRIMARY KEY,
    pedido_id       INTEGER NOT NULL REFERENCES pedidos(id),
    produto_id      INTEGER NOT NULL REFERENCES produtos(id),
    quantidade      INTEGER NOT NULL CHECK (quantidade > 0),
    preco_unitario  REAL    NOT NULL CHECK (preco_unitario > 0)
);

INSERT INTO clientes (nome, email, cidade) VALUES
    ('Ana Silva', 'ana@email.com', 'São Paulo'),
    ('Bruno Costa', 'bruno@email.com', 'Curitiba'),
    ('Carla Dias', 'carla@email.com', 'Recife'),
    ('Daniel Rocha', 'daniel@email.com', 'São Paulo'),
    ('Elena Martins', 'elena@email.com', 'Belo Horizonte'),
    ('Felipe Souza', 'felipe@email.com', 'Curitiba'),
    ('Gabriela Lima', 'gabriela@email.com', 'Salvador'),
    ('Hugo Oliveira', 'hugo@email.com', 'Recife');

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

INSERT INTO itens_pedido (pedido_id, produto_id, quantidade, preco_unitario) VALUES
    (1, 1, 2, 49.90),
    (1, 5, 1, 39.90),
    (2, 3, 1, 199.90),
    (3, 2, 1, 129.90),
    (3, 7, 3, 29.90),
    (4, 4, 1, 89.90),
    (4, 9, 1, 99.90),
    (5, 6, 1, 179.90),
    (5, 1, 3, 49.90),
    (6, 8, 1, 149.90),
    (6, 10, 2, 79.90),
    (7, 5, 2, 39.90),
    (8, 3, 1, 199.90),
    (8, 1, 1, 49.90),
    (9, 2, 2, 129.90),
    (9, 4, 1, 89.90),
    (10, 6, 1, 179.90),
    (10, 7, 5, 29.90);
