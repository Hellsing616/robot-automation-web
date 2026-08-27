# Robot Framework + Playwright

Projeto de automação web com Robot Framework, Browser Library (Playwright) e Page Object Model.

## Estrutura

```text
robotframework/
├── tests/
│   └── vehicle/
│       └── create_quote.robot
├── resources/
│   ├── features/
│   │   └── vehicle_quote.feature
│   ├── pages/
│   │   ├── application_page.robot
│   │   ├── vehicle_data_page.robot
│   │   ├── insurant_data_page.robot
│   │   ├── product_data_page.robot
│   │   ├── price_option_page.robot
│   │   └── quote_page.robot
│   └── elements/
│       ├── application_elements.py
│       ├── vehicle_elements.py
│       ├── insurant_elements.py
│       ├── product_elements.py
│       ├── price_elements.py
│       └── quote_elements.py
├── results/
├── requirements.txt
├── .gitignore
└── README.md
```

## Responsabilidades

- `tests`: contém somente os cenários executáveis.
- `features`: organiza o fluxo de negócio e reutiliza Page Objects.
- `pages`: contém ações da página e encapsula a interação com o Browser/Playwright.
- `elements`: centraliza os locators para facilitar manutenção.
- `results`: destino local para resultados de execução e relatórios.

O teste não contém locators nem detalhes de implementação do Playwright.

## Pré-requisitos

- Python 3.10+
- Node.js
- Java, caso o Allure CLI seja utilizado para abrir/gerar o relatório

## Instalação

```bash
python -m venv .venv
```

Windows:

```bash
.venv\Scripts\activate
```

Linux/macOS:

```bash
source .venv/bin/activate
```

Instale as dependências:

```bash
pip install -r requirements.txt
rfbrowser init
```

O Browser Library utiliza Playwright e fornece os navegadores necessários por meio do próprio ecossistema Playwright. citeturn0search6

## Executar o teste diretamente pelo arquivo Robot

Execução normal:

```bash
robot -d results tests/vehicle/create_quote.robot
```

O arquivo `.robot` continua sendo o ponto de entrada da execução.

Para execução com Allure:

```bash
robot -d output/robot --listener allure_robotframework:output/allure-results tests/vehicle/create_quote.robot
```

O listener oficial `allure-robotframework` coleta os resultados em um diretório de resultados do Allure. citeturn1search0turn1search1
Install: python -m pip install allure-robotframework

## Visualizar relatório Allure

Depois da execução:

```bash
allure serve results/allure
```

Ou:

```bash
allure generate results/allure -o results/allure-report
allure open results/allure-report
```

## Navegador

O projeto está configurado para Chromium com interface gráfica:

```robot
${BROWSER}    chromium
${HEADLESS}   ${False}
```

Para execução headless, altere `${HEADLESS}` para `${True}`.

## Observação

Os dados usados no cenário original foram preservados para manter o comportamento do teste funcional. A principal mudança é arquitetural: responsabilidades foram separadas sem adicionar camadas desnecessárias.
