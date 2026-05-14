# Aula 02 — Setup do Ambiente

## Pré-requisito

- [Python 3](https://python.org) instalado (sem dependências extras — o SQLite já vem embutido no Python)

## Acessando o Shell SQL

Abra o terminal na pasta `Essencial/` e rode:

```bash
python db.py
```

Você vai ver o prompt do shell:

```
SQLite conectado em 'data/loja.db'
Digite suas queries. Use '.tables' para listar tabelas, '.quit' para sair.

sql>
```

Pronto — você está dentro do banco `loja.db`. Tudo que você digitar aqui é SQL (ou dot-commands).

O banco fica salvo no arquivo `data/loja.db`. Se a pasta `data/` não existir, o `db.py` cria automaticamente.

## Comandos Úteis (dot-commands)

Esses comandos começam com `.` e funcionam dentro do shell:

| Comando            | O que faz                         |
|--------------------|-----------------------------------|
| `.tables`          | Lista todas as tabelas            |
| `.schema [tabela]` | Mostra o CREATE TABLE             |
| `.read arquivo`    | Executa um arquivo `.sql`         |
| `.quit`            | Sai do shell                      |

Exemplo:

```
sql> .tables
clientes  itens_pedido  pedidos  produtos

sql> .schema clientes
CREATE TABLE clientes ( ... );
```

## Executando Arquivos .sql

Em vez de digitar query por query, você pode rodar um arquivo inteiro de dentro do shell:

```
sql> .read aula03-criando-tabelas.sql
```

Ou diretamente pelo terminal, sem abrir o shell:

```bash
python db.py run aula03-criando-tabelas.sql
```

Isso executa todas as queries do arquivo de uma vez.

## Populando o Banco (Seed)

Para criar todas as tabelas e inserir os dados de exemplo de uma vez:

```bash
python db.py seed
```

Isso roda o `seed.sql`, que cria as 4 tabelas e insere dados prontos para as aulas 05 em diante.

## Resetando o Banco

Se quiser começar do zero, apague o arquivo do banco e rode o seed novamente:

```bash
# apaga o banco
rm data/loja.db

# recria tudo
python db.py seed
```

Ou, de dentro do shell, rode o seed diretamente:

```
sql> .read seed.sql
```

---

**Próxima aula:** vamos criar as tabelas da nossa loja.
