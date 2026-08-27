from pathlib import Path
import os

from dotenv import load_dotenv


# Raiz do projeto
PROJECT_ROOT = Path(__file__).resolve().parents[1]

# Arquivo .env
ENV_FILE = PROJECT_ROOT / ".env"

# Carrega variáveis do ambiente
load_dotenv(ENV_FILE)


BASE_URL = os.getenv("BASE_URL")
BROWSER = os.getenv("BROWSER", "chromium")
HEADLESS = os.getenv("HEADLESS", "false").lower() == "true"