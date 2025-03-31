import pandas as pd
import pyodbc
from sqlalchemy import create_engine
from dotenv import load_dotenv
import os

# Carregar variáveis de ambiente
load_dotenv()

# Obter as variáveis do .env
server = os.getenv('server')
user = os.getenv('user')
password = os.getenv('password')
database = os.getenv('database')

# Caminho da pasta onde estão os CSVs
csv_folder_path = r"C:\Users\ubicase01\Desktop\BASES\bases-operacaoes-case"  # Caminho ajustado para o seu diretório

# Configuração da string de conexão para o SQL Server usando SQLAlchemy
connection_string = f"mssql+pyodbc://{user}:{password}@{server}/{database}?driver=ODBC+Driver+18+for+SQL+Server&Encrypt=yes&TrustServerCertificate=yes"

# Conectar ao banco de dados SQL Server com SQLAlchemy
try:
    engine = create_engine(connection_string)
    print("✅ Conexão bem-sucedida ao SQL Server!")

    # Percorrer todos os arquivos CSV na pasta
    for csv_file in os.listdir(csv_folder_path):
        if csv_file.endswith(".csv"):
            csv_path = os.path.join(csv_folder_path, csv_file)
            
            # Carregar o arquivo CSV em um DataFrame do pandas
            df = pd.read_csv(csv_path, delimiter=";")
            print(f"✅ Arquivo CSV '{csv_file}' carregado com {df.shape[0]} linhas e {df.shape[1]} colunas.")
            
            # Remover a linha onde todas as colunas são NULL
            df = df.dropna(how='all')

            # Remover ou substituir os valores NULL por um valor padrão (por exemplo, 0 ou uma string vazia)
            df = df.fillna('')  # Substitui os valores null por uma string vazia
            # Ou, se preferir substituir por 0, use:
            # df = df.fillna(0)

            # Definir o nome da tabela com base no nome do arquivo CSV
            table_name = os.path.splitext(csv_file)[0]  # Usa o nome do arquivo (sem extensão) como nome da tabela

            # Inserir os dados na tabela do SQL Server
            df.to_sql(table_name, con=engine, schema='dbo', if_exists='replace', index=False)

            print(f"✅ Dados inseridos com sucesso na tabela '{table_name}'.")

except Exception as e:
    print(f"❌ Erro na conexão ou na inserção dos dados: {e}")




