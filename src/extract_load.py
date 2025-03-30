import pandas as pd
import pyodbc
from dotenv import load_dotenv
import os

load_dotenv()

server = os.getenv('server')
user = os.getenv('user')
password = os.getenv('password')
database = os.getenv('database')

try:
    conn = pyodbc.connect(
        f"DRIVER={{SQL Server}};SERVER={server};DATABASE={database};UID={user};PWD={password}"
    )
    print("✅ Conexão bem-sucedida!")
    conn.close()
except Exception as e:
    print(f"❌ Erro na conexão: {e}")
