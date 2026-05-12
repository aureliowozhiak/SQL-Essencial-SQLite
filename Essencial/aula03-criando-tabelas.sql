-- ============================================
-- AULA 03 — Criando Tabelas
-- ============================================
-- Nesta aula vamos criar as 4 tabelas da nossa loja:
--   clientes, produtos, pedidos, itens_pedido
--
-- Conceitos: CREATE TABLE, tipos de dados, constraints
-- ============================================

-- Antes de criar, vamos garantir que não existe nada antigo.
-- DROP TABLE IF EXISTS remove a tabela se ela já existir,
-- sem dar erro caso ela não exista.
-- A ordem importa: tabelas que são referenciadas por outras
-- precisam ser removidas por último.

DROP TABLE IF EXISTS itens_pedido;
DROP TABLE IF EXISTS pedidos;
DROP TABLE IF EXISTS produtos;
DROP TABLE IF EXISTS clientes;

-- ============================================
-- TABELA: clientes
-- ============================================
-- Armazena os clientes da loja.
--
-- INTEGER PRIMARY KEY — no SQLite, isso já funciona como auto-increment
-- NOT NULL            — campo obrigatório (não aceita valor vazio)
-- UNIQUE              — não permite valores duplicados
-- DEFAULT             — valor padrão caso nenhum seja informado

CREATE TABLE clientes (
    id         INTEGER PRIMARY KEY,
    nome       TEXT    NOT NULL,
    email      TEXT    NOT NULL UNIQUE,
    cidade     TEXT    NOT NULL,
    criado_em  TEXT    DEFAULT (datetime('now'))
);

-- ============================================
-- TABELA: produtos
-- ============================================
-- Catálogo de produtos disponíveis na loja.
--
-- REAL — tipo para números decimais (preços)
-- CHECK — constraint que valida uma condição

CREATE TABLE produtos (
    id         INTEGER PRIMARY KEY,
    nome       TEXT    NOT NULL,
    categoria  TEXT    NOT NULL,
    preco      REAL    NOT NULL CHECK (preco > 0),
    estoque    INTEGER NOT NULL DEFAULT 0
);

-- ============================================
-- TABELA: pedidos
-- ============================================
-- Cada pedido pertence a um cliente.
--
-- REFERENCES — cria uma chave estrangeira (foreign key)
--   liga pedidos.cliente_id → clientes.id

CREATE TABLE pedidos (
    id           INTEGER PRIMARY KEY,
    cliente_id   INTEGER NOT NULL REFERENCES clientes(id),
    data_pedido  TEXT    DEFAULT (date('now')),
    status       TEXT    NOT NULL DEFAULT 'pendente'
);

-- ============================================
-- TABELA: itens_pedido
-- ============================================
-- Cada item liga um pedido a um produto.
-- Um pedido pode ter vários itens.
--
-- Duas foreign keys: uma para pedidos, outra para produtos.

CREATE TABLE itens_pedido (
    id              INTEGER PRIMARY KEY,
    pedido_id       INTEGER NOT NULL REFERENCES pedidos(id),
    produto_id      INTEGER NOT NULL REFERENCES produtos(id),
    quantidade      INTEGER NOT NULL CHECK (quantidade > 0),
    preco_unitario  REAL    NOT NULL CHECK (preco_unitario > 0)
);

-- ============================================
-- Verificando o resultado
-- ============================================
-- Rode esses comandos no terminal do SQLite para ver as tabelas criadas:
--
--   .tables
--   .schema clientes
--   .schema produtos
--   .schema pedidos
--   .schema itens_pedido
