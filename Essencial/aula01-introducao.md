# Aula 01 — Introdução

## O que é um Banco de Dados?

Um banco de dados é um sistema organizado para **armazenar, gerenciar e recuperar informações**. Pense nele como uma planilha turbinada — só que feita para lidar com milhões de linhas de forma rápida e segura.

### Banco de Dados Relacional

No modelo relacional, os dados ficam em **tabelas** (também chamadas de relações). Cada tabela tem:

- **Colunas** — definem *o que* é armazenado (nome, email, preço...)
- **Linhas** — cada linha é um **registro** (um cliente, um produto...)

Exemplo visual:

```
tabela: clientes
+----+----------+--------------------+-------------+
| id | nome     | email              | cidade      |
+----+----------+--------------------+-------------+
|  1 | Ana      | ana@email.com      | São Paulo   |
|  2 | Bruno    | bruno@email.com    | Curitiba    |
|  3 | Carla    | carla@email.com    | Recife      |
+----+----------+--------------------+-------------+
```

## O que é SQL?

**SQL** (Structured Query Language) é a linguagem padrão para conversar com bancos de dados relacionais. Com SQL você:

- **Cria** tabelas e estruturas (`CREATE TABLE`)
- **Insere** dados (`INSERT`)
- **Consulta** dados (`SELECT`)
- **Atualiza** dados (`UPDATE`)
- **Remove** dados (`DELETE`)

SQL é usado em praticamente todo sistema que armazena dados: apps, sites, APIs, dashboards, etc.

## O que é SQLite?

**SQLite** é um banco de dados relacional leve e embutido. Diferente de bancos como PostgreSQL ou MySQL, o SQLite:

- **Não precisa de servidor** — o banco inteiro fica em um único arquivo `.db`
- **Zero configuração** — sem senhas, portas ou serviços para gerenciar
- **É portátil** — copie o arquivo e pronto, seu banco está em outro lugar
- **É real** — usado em produção no Android, iOS, navegadores, e bilhões de dispositivos

Isso faz dele perfeito para aprender SQL: você foca na linguagem sem se perder em infraestrutura.

## Conceitos Importantes

### Chave Primária (Primary Key)

Coluna (ou conjunto de colunas) que identifica **cada registro de forma única**. Geralmente é um `id` numérico auto-incrementado.

```
id = 1  →  sempre vai apontar para a Ana
id = 2  →  sempre vai apontar para o Bruno
```

### Chave Estrangeira (Foreign Key)

Coluna que **referencia a chave primária de outra tabela**, criando um relacionamento entre elas.

```
tabela: pedidos
+----+------------+------------+
| id | cliente_id | data       |
+----+------------+------------+
|  1 |          1 | 2025-01-10 |  ← cliente_id = 1 referencia Ana na tabela clientes
|  2 |          2 | 2025-01-11 |  ← cliente_id = 2 referencia Bruno
+----+------------+------------+
```

### Tipos de Dados no SQLite

SQLite é flexível com tipos. Na prática, tudo se resume a 5 "afinidades":

| Tipo      | Uso                        | Exemplo          |
|-----------|---------------------------|------------------|
| `INTEGER` | Números inteiros          | 1, 42, -10       |
| `REAL`    | Números decimais          | 9.99, 3.14       |
| `TEXT`    | Texto/strings             | 'Ana', 'SP'      |
| `BLOB`    | Dados binários            | imagens, arquivos|
| `NULL`    | Ausência de valor         | (vazio)          |

### CRUD

Acrônimo para as 4 operações básicas que todo sistema faz com dados:

| Operação | SQL         |
|----------|-------------|
| Create   | `INSERT`    |
| Read     | `SELECT`    |
| Update   | `UPDATE`    |
| Delete   | `DELETE`    |

---

**Próxima aula:** vamos configurar o ambiente com Docker para começar a praticar.
