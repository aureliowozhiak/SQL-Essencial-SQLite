# SQL Essencial (SQLite)

Curso prático de SQL do zero usando SQLite (este curso faz parte do https://dataengineer.help/).
Siga as aulas em ordem para aprender os fundamentos de banco de dados relacional escrevendo queries reais.

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

## E se quiser rodar em BigQuery, Oracle, SQL Server, PostgreSQL ou outro banco?

Este curso usa **SQLite** porque é leve, sem servidor e ótimo para aprender SQL padrão. A maior parte do que você vê (`SELECT`, `JOIN`, `GROUP BY`, `HAVING`, etc.) é **SQL relacional comum** e funciona em qualquer engine com pequenos ajustes.

### Dicas práticas ao portar os scripts

1. **Tipos de dados** — SQLite é flexível; outros bancos exigem tipos mais explícitos (por exemplo `VARCHAR(n)`, `NUMERIC`, `TIMESTAMP`). Revise o `CREATE TABLE` da aula 03 ao migrar.
2. **`AUTOINCREMENT` / chaves** — Em PostgreSQL costuma-se usar `SERIAL` ou `GENERATED ALWAYS AS IDENTITY`. Em SQL Server, `IDENTITY`. Em Oracle, sequências + trigger ou `GENERATED AS IDENTITY`.
3. **`LIMIT` e paginação** — SQLite e PostgreSQL usam `LIMIT` / `OFFSET`. No SQL Server prefira `ORDER BY ... OFFSET n ROWS FETCH NEXT m ROWS ONLY`. No Oracle 12c+, `FETCH FIRST n ROWS ONLY`.
4. **Funções e datas** — Funções de data/hora e formatação mudam de engine para engine; troque `datetime('now')` e similares pela função nativa do seu banco.
5. **Aspas e identificadores** — Evite nomes que precisem de aspas; se usar, cada banco tem regras diferentes (PostgreSQL prefere `"tabela"`; SQL Server `[tabela]`).
6. **`db.py` e `.read`** — São específicos do SQLite. Em outro SGBD, use o cliente oficial, uma IDE (DBeaver, DataGrip) ou o console web (BigQuery).

### Links úteis (documentação oficial)

| Banco | Onde começar |
|-------|----------------|
| **PostgreSQL** | [Documentação SQL](https://www.postgresql.org/docs/current/sql.html) |
| **SQL Server (Microsoft)** | [Transact-SQL reference](https://learn.microsoft.com/sql/t-sql/language-elements/language-elements-transact-sql) |
| **Oracle Database** | [SQL Language Reference](https://docs.oracle.com/en/database/oracle/oracle-database/) (escolha a versão na página) |
| **BigQuery (Google Cloud)** | [Standard SQL query syntax](https://cloud.google.com/bigquery/docs/reference/standard-sql/query-syntax) |
| **MySQL / MariaDB** | [MySQL 8.0 Reference Manual — SQL Statements](https://dev.mysql.com/doc/refman/8.0/en/sql-statements.html) |
| **SQLite** (referência do curso) | [SQL As Understood By SQLite](https://www.sqlite.org/lang.html) |

Ferramentas **multi-banco** (úteis para colar as queries e comparar resultados): [DBeaver](https://dbeaver.io/), [Azure Data Studio](https://learn.microsoft.com/sql/azure-data-studio/download-azure-data-studio) (com extensões), [Google Cloud Console](https://console.cloud.google.com/) para BigQuery.

Se algo não rodar, compare a mensagem de erro com a documentação do seu engine — quase sempre é diferença de sintaxe em **tipos**, **datas** ou **paginação**, não no conceito da query.

---

## Gostou desse curso?

Se curtiu o curso, conheça outros conteúdos, tutoriais e dicas em: [https://dataengineer.help/](https://dataengineer.help/)