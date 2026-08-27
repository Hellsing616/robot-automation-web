from pathlib import Path
import os
from dotenv import load_dotenv


# Localiza a raiz do projeto
PROJECT_ROOT = Path(__file__).resolve().parents[2]

# Localiza o arquivo .env
ENV_FILE = PROJECT_ROOT / ".env"

# Carrega as variáveis
load_dotenv(ENV_FILE)


BASE_URL = os.getenv("BASE_URL")
USERNAME = os.getenv("USERNAME")
PASSWORD = os.getenv("PASSWORD")
API_TOKEN = os.getenv("API_TOKEN")