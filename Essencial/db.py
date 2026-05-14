"""
Roda o SQLite direto com Python.

Uso:
    python db.py              → abre o shell interativo
    python db.py seed         → cria as tabelas e insere dados do seed.sql
    python db.py run ARQUIVO  → executa um arquivo .sql
"""

import os
import sys
import sqlite3
import readline  # habilita histórico e setas no input

DB_PATH = os.path.join("data", "loja.db")


def ensure_data_dir():
    os.makedirs("data", exist_ok=True)


def run_sql_file(conn, path):
    with open(path, "r", encoding="utf-8") as f:
        script = f.read()
    conn.executescript(script)
    print(f"✔ Arquivo '{path}' executado com sucesso.")

def run_and_print_select_query(conn, query):
    cur = conn.cursor()
    cur.execute(query)
    result = cur.fetchall()
    print(result)


def interactive_shell(conn):
    print(f"SQLite conectado em '{DB_PATH}'")
    print("Digite suas queries. Use '.tables' para listar tabelas, '.quit' para sair.\n")
    print("Caso queira rodar um arquivo .sql, use o comando '.read arquivo.sql'")

    cur = conn.cursor()
    buffer = ""

    while True:
        try:
            prompt = "sql> " if not buffer else " ... "
            line = input(prompt)
        except (EOFError, KeyboardInterrupt):
            print()
            break

        stripped = line.strip()

        if stripped.lower() in (".quit", ".exit"):
            break

        if stripped.lower() == ".help":
            print("Comandos disponíveis:")
            print(".tables - lista todas as tabelas")
            print(".schema - mostra o CREATE TABLE de uma tabela")
            print(".read - executa um arquivo .sql")
            print(".select - executa uma query e imprime o resultado")
            print(".quit - sai do shell")
            continue

        if stripped.lower().startswith(".select "):
            query = stripped[7:].strip()
            run_and_print_select_query(conn, query)
            # exemplo: .select "SELECT * FROM clientes"
            continue

        if stripped.lower() == ".tables":
            cur.execute("SELECT name FROM sqlite_master WHERE type='table' ORDER BY name")
            tables = [row[0] for row in cur.fetchall()]
            print("  ".join(tables) if tables else "(nenhuma tabela)")
            continue

        if stripped.lower().startswith(".schema"):
            parts = stripped.split()
            if len(parts) == 2:
                cur.execute(
                    "SELECT sql FROM sqlite_master WHERE name = ?", (parts[1],)
                )
            else:
                cur.execute("SELECT sql FROM sqlite_master WHERE sql IS NOT NULL")
            for row in cur.fetchall():
                print(row[0] + ";")
            continue

        if stripped.lower().startswith(".read "):
            path = stripped[6:].strip()
            try:
                run_sql_file(conn, path)
            except FileNotFoundError:
                print(f"Arquivo não encontrado: {path}")
            continue

        buffer += " " + line if buffer else line

        if not buffer.rstrip().endswith(";"):
            continue

        try:
            cur.execute(buffer)
            if cur.description:
                cols = [d[0] for d in cur.description]
                rows = cur.fetchall()
                widths = [len(c) for c in cols]
                for row in rows:
                    for i, val in enumerate(row):
                        widths[i] = max(widths[i], len(str(val)))

                header = " | ".join(c.ljust(w) for c, w in zip(cols, widths))
                sep = "-+-".join("-" * w for w in widths)
                print(header)
                print(sep)
                for row in rows:
                    print(" | ".join(str(v).ljust(w) for v, w in zip(row, widths)))
                print(f"({len(rows)} linha{'s' if len(rows) != 1 else ''})")
            else:
                conn.commit()
                if cur.rowcount >= 0:
                    print(f"OK — {cur.rowcount} linha(s) afetada(s)")
        except sqlite3.Error as e:
            print(f"Erro: {e}")

        buffer = ""


def main():
    ensure_data_dir()
    conn = sqlite3.connect(DB_PATH)
    conn.execute("PRAGMA foreign_keys = ON")

    try:
        if len(sys.argv) < 2:
            interactive_shell(conn)
        elif sys.argv[1] == "seed":
            run_sql_file(conn, "seed.sql")
        elif sys.argv[1] == "run" and len(sys.argv) >= 3:
            run_sql_file(conn, sys.argv[2])
        else:
            print(__doc__.strip())
    finally:
        conn.close()


if __name__ == "__main__":
    main()
