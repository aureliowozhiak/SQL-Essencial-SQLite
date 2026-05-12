# Aula 02 — Setup do Ambiente

## Pré-requisito

- [Docker Desktop](https://docs.docker.com/get-docker/) instalado e rodando

## Subindo o Ambiente

Abra o terminal na pasta `Essencial/` e rode:

```bash
docker compose up -d
```

Isso baixa a imagem do SQLite e deixa o container pronto.

## Acessando o SQLite

```bash
docker compose exec sqlite sqlite3 /data/loja.db
```

Você vai ver o prompt do SQLite:

```
SQLite version 3.x.x
Enter ".help" for usage hints.
sqlite>
```

Pronto — você está dentro do banco `loja.db`. Tudo que você digitar aqui é SQL (ou comandos do SQLite).

## Comandos Úteis do SQLite (dot-commands)

Esses comandos começam com `.` e são exclusivos do SQLite (não são SQL):

```sql
-- listar todas as tabelas do banco
.tables

-- ver a estrutura de uma tabela
.schema clientes

-- ativar modo coluna (saída formatada)
.mode column
.headers on

-- sair do SQLite
.quit
```

> **Dica:** rode `.mode column` e `.headers on` sempre que entrar no SQLite para ter uma saída legível.

## Executando Arquivos .sql

Em vez de digitar query por query, você pode rodar um arquivo inteiro:

```sql
.read /aulas/aula03-criando-tabelas.sql
```

Isso executa todas as queries do arquivo de uma vez.

## Resetando o Banco

Se quiser começar do zero, basta apagar o arquivo do banco e entrar de novo:

```bash
# de fora do container
docker compose exec sqlite rm /data/loja.db
docker compose exec sqlite sqlite3 /data/loja.db
```

Ou, de dentro do SQLite, rode o seed para recriar tudo:

```sql
.read /aulas/seed.sql
```

## Parando o Container

```bash
docker compose down
```

---

**Próxima aula:** vamos criar as tabelas da nossa loja.
