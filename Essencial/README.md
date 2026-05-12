# SQL Essencial (SQLite)

Curso prático de SQL do zero usando SQLite. Siga as aulas em ordem para aprender os fundamentos de banco de dados relacional escrevendo queries reais.

## Tema do Curso

Todas as aulas usam o cenário de uma **loja online** com 4 tabelas:

- `clientes` — cadastro de clientes
- `produtos` — catálogo de produtos
- `pedidos` — pedidos realizados
- `itens_pedido` — produtos dentro de cada pedido

## Aulas

| #  | Aula                        | Arquivo                          | Conteúdo                                    |
|----|-----------------------------|---------------------------------|---------------------------------------------|
| 01 | Introdução                  | `aula01-introducao.md`          | O que é banco de dados, SQL e SQLite        |
| 02 | Setup do Ambiente           | `aula02-setup.md`               | Docker Compose + primeiros comandos         |
| 03 | Criando Tabelas             | `aula03-criando-tabelas.sql`    | CREATE TABLE, tipos, constraints            |
| 04 | Manipulando Dados           | `aula04-manipulando-dados.sql`  | INSERT, UPDATE, DELETE                       |
| 05 | Consultas Básicas           | `aula05-consultas-basicas.sql`  | SELECT, WHERE, operadores                   |
| 06 | Ordenação e Paginação       | `aula06-ordenacao-paginacao.sql`| ORDER BY, LIMIT, DISTINCT, aliases          |
| 07 | Relacionamentos (JOINs)     | `aula07-joins.sql`              | INNER JOIN, LEFT JOIN                        |
| 08 | Agrupamentos                | `aula08-agrupamentos.sql`       | GROUP BY, HAVING, COUNT, SUM, AVG           |

## Como Usar

```bash
# 1. Suba o container
docker compose up -d

# 2. Acesse o SQLite
docker compose exec sqlite sqlite3 /data/loja.db

# 3. Execute uma aula inteira
.read /aulas/aula03-criando-tabelas.sql

# 4. Ou copie e cole cada query individualmente para acompanhar
```

> **Dica:** para aulas 05 em diante, rode primeiro a `aula03` e `aula04` (ou use o `seed.sql`) para ter dados no banco.

### Setup Rápido (pular para qualquer aula)

```bash
docker compose exec sqlite sqlite3 /data/loja.db < seed.sql
```

O arquivo `seed.sql` cria todas as tabelas e insere os dados de exemplo de uma vez.

## Pré-requisitos

- [Docker](https://docs.docker.com/get-docker/) instalado
- Terminal (qualquer um: PowerShell, bash, zsh)
