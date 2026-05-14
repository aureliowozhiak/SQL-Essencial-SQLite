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
| 02 | Setup do Ambiente           | `aula02-setup.md`               | Python + SQLite, primeiros comandos         |
| 03 | Criando Tabelas             | `aula03-criando-tabelas.sql`    | CREATE TABLE, tipos, constraints            |
| 04 | Manipulando Dados           | `aula04-manipulando-dados.sql`  | INSERT, UPDATE, DELETE                       |
| 05 | Consultas Básicas           | `aula05-consultas-basicas.sql`  | SELECT, WHERE, operadores                   |
| 06 | Ordenação e Paginação       | `aula06-ordenacao-paginacao.sql`| ORDER BY, LIMIT, DISTINCT, aliases          |
| 07 | Relacionamentos (JOINs)     | `aula07-joins.sql`              | INNER JOIN, LEFT JOIN                        |
| 08 | Agrupamentos                | `aula08-agrupamentos.sql`       | GROUP BY, HAVING, COUNT, SUM, AVG           |

## Como Usar

Abra o terminal na pasta **`Essencial/`** (é onde estão `db.py`, `seed.sql` e os arquivos das aulas). Se você estiver na raiz do repositório `sql`, faça `cd Essencial` antes dos comandos abaixo.

```bash
# 1. Popule o banco com os dados de exemplo
python db.py seed

# 2. Abra o shell interativo
python db.py

# 3. No shell, execute uma aula inteira
.read aula03-criando-tabelas.sql

# 4. Ou copie e cole cada query individualmente para acompanhar
```

> **Dica:** para aulas 05 em diante, rode `python db.py seed` para popular o banco de uma vez.

Para **apagar só as tabelas** (sem recriar dados), use `python db.py run 00drop-all.sql`. Para voltar ao estado inicial completo, rode de novo `python db.py seed`.

### Comandos do db.py

| Comando                      | O que faz                              |
|------------------------------|----------------------------------------|
| `python db.py`               | Abre o shell SQL interativo            |
| `python db.py seed`          | Cria tabelas e insere dados de exemplo |
| `python db.py run ARQUIVO`   | Executa um arquivo `.sql`              |

### Comandos dentro do shell

| Comando            | O que faz                         |
|--------------------|-----------------------------------|
| `.help`            | Lista os dot-commands disponíveis |
| `.tables`          | Lista todas as tabelas            |
| `.schema [tabela]` | Mostra o CREATE TABLE             |
| `.read arquivo`    | Executa um arquivo `.sql`         |
| `.select` + espaço + query | Executa um SELECT e imprime o resultado (ex.: `.select SELECT * FROM clientes`) |
| `.quit`            | Sai do shell                      |

O banco fica salvo em `data/loja.db`.

## Pré-requisitos

- [Python 3](https://python.org) instalado (sem dependências extras)
- Terminal (qualquer um: PowerShell, bash, zsh)
