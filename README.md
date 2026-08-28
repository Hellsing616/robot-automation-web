# Robot Framework + Playwright

Projeto de automação de testes web utilizando **Robot Framework**, **Browser Library** baseada em **Playwright** e arquitetura **Page Object Model (POM)**.

A automação cobre o fluxo de criação de uma cotação de seguro para veículo na aplicação:

**Tricentis Vehicle Insurance Application**

A estrutura foi organizada com separação de responsabilidades entre cenários de teste, fluxos de negócio, páginas, elementos, dados de teste e bibliotecas auxiliares.

---

## Tecnologias

* Python
* Robot Framework
* Robot Framework Browser
* Playwright
* Browser Library
* python-dotenv
* Allure Robot Framework

As dependências do projeto estão definidas em `requirements.txt`.

---

## Estrutura do projeto

```text
robot-automation-web/
│
├── config/
│   └── environment.py
│
├── libraries/
│   ├── allure_evidence.py
│   └── test_lifecycle.py
│
├── resources/
│   │
│   ├── elements/
│   │   ├── application_elements.py
│   │   ├── insurant_elements.py
│   │   ├── price_elements.py
│   │   ├── product_elements.py
│   │   └── vehicle_elements.py
│   │
│   ├── features/
│   │   └── vehicle_quote.robot
│   │
│   ├── pages/
│   │   ├── application_page.robot
│   │   ├── insurant_data_page.robot
│   │   ├── price_option_page.robot
│   │   ├── product_data_page.robot
│   │   ├── quote_page.robot
│   │   └── vehicle_data_page.robot
│   │
│   └── test_data/
│       ├── insurant_data.json
│       ├── price_data.json
│       ├── product_data.json
│       ├── quote_data.json
│       └── vehicle_data.json
│
├── tests/
│   └── vehicle/
│       └── create_quote.robot
│
├── output/
│   └── allure-results/
│
├── .env
├── .gitignore
├── README.md
├── requirements.txt
└── robot.toml
```

> Os arquivos de evidência e resultados de execução, como `output.xml`, `log.html`, `report.html`, logs do Playwright e resultados do Allure, são artefatos gerados durante a execução e não fazem parte do código-fonte da automação.

---

## Responsabilidades

A arquitetura segue uma separação clara de responsabilidades.

### `tests`

Contém **somente os cenários executáveis** do Robot Framework.

Exemplo:

```text
tests/
└── vehicle/
    └── create_quote.robot
```

É a partir desses arquivos que a execução dos testes deve ser realizada.

Os testes não devem conter detalhes de implementação de locators ou comandos de baixo nível do Browser.

---

### `features`

Organiza o **fluxo de negócio** da automação e reutiliza os Page Objects.

Exemplo:

```text
resources/features/vehicle_quote.robot
```

Responsabilidades:

* organizar o fluxo funcional;
* combinar ações de diferentes páginas;
* fornecer keywords de negócio reutilizáveis;
* manter os cenários de teste mais legíveis.

Exemplo conceitual:

```robot
Enter Vehicle Data For Automobile
    Go To Automobile Section
    Fill Vehicle Data
    Continue To Insurant Data
```

A camada `features` não deve ser utilizada para armazenar locators.

---

### `pages`

Contém as **ações das páginas** e encapsula a interação com o Browser/Playwright.

Exemplo:

```text
resources/pages/
├── application_page.robot
├── vehicle_data_page.robot
├── insurant_data_page.robot
├── product_data_page.robot
├── price_option_page.robot
└── quote_page.robot
```

Responsabilidades:

* implementar ações realizadas na página;
* encapsular comandos da Browser Library;
* utilizar os locators disponibilizados pela camada `elements`;
* evitar que os testes conheçam detalhes da implementação da interface.

Exemplo:

```robot
Fill Vehicle Data
    Fill Text    ${MAKE_LOCATOR}    ${vehicle.make}
    Fill Text    ${DATE_LOCATOR}    ${vehicle.date_of_manufacture}
```

---

### `elements`

Centraliza os **locators da aplicação** para facilitar manutenção.

Exemplo:

```text
resources/elements/
├── application_elements.py
├── vehicle_elements.py
├── insurant_elements.py
├── product_elements.py
└── price_elements.py
```

Responsabilidades:

* centralizar seletores;
* evitar duplicação de locators;
* facilitar alterações da interface;
* manter os Page Objects livres de seletores espalhados pelo código.

Quando um locator da aplicação mudar, a alteração deve ser feita preferencialmente nessa camada.

---

### `test_data`

Centraliza os dados utilizados pelos testes.

Exemplo:

```text
resources/test_data/
├── vehicle_data.json
├── insurant_data.json
├── product_data.json
├── price_data.json
└── quote_data.json
```

Responsabilidades:

* separar dados da implementação;
* facilitar manutenção dos dados utilizados pelos cenários;
* permitir reutilização dos dados pelos Page Objects e fluxos.

---

### `libraries`

Contém bibliotecas auxiliares implementadas em Python para funcionalidades que não pertencem diretamente à camada de Page Object.

Exemplo:

```text
libraries/
├── allure_evidence.py
└── test_lifecycle.py
```

Entre as responsabilidades estão funcionalidades auxiliares relacionadas ao ciclo de vida da execução e captura de evidências.

---

### `config`

Centraliza configurações relacionadas ao ambiente da aplicação.

```text
config/
└── environment.py
```

A configuração utiliza variáveis de ambiente carregadas a partir do `.env`.

Informações sensíveis ou específicas do ambiente não devem ser armazenadas diretamente no código-fonte.

---

### `results` / `output`

Destinado aos **resultados e artefatos gerados durante a execução**.

Exemplos:

```text
output/
├── output.xml
├── log.html
├── report.html
├── playwright-log.txt
└── allure-results/
```

Esses arquivos são gerados pela execução dos testes e servem para análise dos resultados, diagnóstico de falhas e geração de relatórios.

Eles não representam código da automação e, portanto, não devem ser versionados.

---

## Configuração do ambiente

### 1. Clonar o projeto

Após obter o código-fonte do projeto, acesse a pasta raiz:

```powershell
cd robot-automation-web
```

---

### 2. Criar ambiente virtual

Recomenda-se utilizar um ambiente virtual Python para isolar as dependências do projeto.

No Windows:

```powershell
python -m venv .venv
```

Ative o ambiente:

```powershell
.venv\Scripts\Activate.ps1
```

---

### 3. Instalar as dependências

Com o ambiente virtual ativado:

```powershell
pip install -r requirements.txt
```

As versões das principais dependências utilizadas pelo projeto estão definidas em `requirements.txt`.

---

### 4. Inicializar o Browser Library

Após instalar `robotframework-browser`, é necessário inicializar os componentes utilizados pela Browser Library:

```powershell
rfbrowser init
```

Essa etapa prepara os componentes necessários para execução dos testes utilizando Playwright.

---

## Configuração do ambiente da aplicação

O projeto utiliza variáveis de ambiente através do arquivo `.env`.

O arquivo `.env` deve ser mantido localmente e **não deve ser versionado**, especialmente quando possuir informações específicas ou sensíveis do ambiente.

Exemplo de configuração utilizada pelo projeto:

```env
BASE_URL=https://sampleapp.tricentis.com/101/app.php
BROWSER=chromium
HEADLESS=false
```

O projeto possui `config/environment.py` para carregar essas configurações.

> Caso o projeto seja disponibilizado para outras pessoas, recomenda-se fornecer um `.env.example` contendo somente as chaves necessárias, sem valores sensíveis.

---

# Execução dos testes

## Execução padrão

A execução deve ser realizada **diretamente pelo arquivo de teste do Robot Framework** localizado em `tests`.

Para executar o teste de criação de cotação:

```powershell
robot --pythonpath . tests/vehicle/create_quote.robot
```

O comando deve ser executado a partir da **raiz do projeto**.

A opção:

```text
--pythonpath .
```

garante que a raiz do projeto esteja disponível no `PYTHONPATH`, permitindo que módulos Python internos sejam encontrados durante a execução.

---

## Fluxo de execução

A execução segue a seguinte sequência:

```text
tests/vehicle/create_quote.robot
            │
            ▼
     Suite Setup
            │
            ▼
     Browser / Context / Page
            │
            ▼
resources/features/vehicle_quote.robot
            │
            ▼
       Page Objects
            │
            ▼
resources/pages/
            │
            ▼
resources/elements/
            │
            ▼
     Aplicação Web
```

O cenário de teste utiliza keywords de negócio, enquanto os detalhes de interação com a aplicação permanecem encapsulados nas camadas inferiores.

---

## Execução em modo headless

O comportamento do navegador é controlado pela variável:

```text
HEADLESS
```

Quando configurada como:

```text
false
```

o navegador é executado de forma visível.

Quando configurada como:

```text
true
```

a execução ocorre em modo headless.

---

# Resultado da execução

Após executar os testes, o Robot Framework gera artefatos de execução, como:

```text
output.xml
log.html
report.html
```

Esses arquivos podem ser utilizados para:

* verificar o resultado dos testes;
* analisar falhas;
* consultar detalhes da execução;
* investigar o comportamento da automação.

As evidências adicionais e resultados relacionados ao Allure são armazenados na estrutura destinada aos resultados da execução.

---

# Evidências

O projeto possui uma biblioteca auxiliar:

```text
libraries/allure_evidence.py
```

responsável pela captura de evidências utilizadas durante a execução.

As evidências são destinadas principalmente à análise de falhas e rastreabilidade da execução.

Os arquivos gerados durante os testes são artefatos temporários e não devem ser tratados como parte do código-fonte.

---

# Arquivos que devem ser versionados

Devem fazer parte do repositório os arquivos necessários para reproduzir a automação, incluindo:

```text
tests/
resources/
libraries/
config/
requirements.txt
robot.toml
README.md
.gitignore
```

O arquivo:

```text
robot.toml
```

é uma configuração do projeto e deve ser versionado quando utilizado pela automação.

---

# Arquivos que não devem ser versionados

Arquivos gerados durante a execução devem permanecer fora do controle de versão.

Exemplos:

```text
output.xml
log.html
report.html
playwright-log.txt
allure-results/
screenshots/
.env
```

O `.gitignore` deve ser responsável por impedir que esses arquivos sejam adicionados ao repositório.

---

# Boas práticas adotadas

O projeto busca manter as seguintes práticas:

* separação entre cenário e implementação;
* Page Object Model;
* centralização de locators;
* separação entre dados e implementação;
* reutilização de keywords;
* utilização da Browser Library para interação com a aplicação;
* isolamento de configurações de ambiente;
* utilização de ambiente virtual Python;
* armazenamento dos artefatos de execução fora do código-fonte;
* utilização de bibliotecas Python somente para responsabilidades auxiliares;
* execução dos testes diretamente pelos arquivos `.robot`.

---

# Ponto de entrada da automação

O ponto de entrada do teste atualmente disponível é:

```text
tests/vehicle/create_quote.robot
```

Para executar:

```powershell
robot --pythonpath . tests/vehicle/create_quote.robot
```

Não é necessário executar os arquivos presentes em `resources/pages`, `resources/features` ou `resources/elements` individualmente.

Esses arquivos são componentes utilizados pelo teste principal.


# Para execução com Allure:
robot -d output/robot --listener allure_robotframework:output/allure-results tests/vehicle/create_quote.robot

# Visualizar relatório Allure:
allure serve results/allure
ou
allure generate results/allure -o results/allure-report
allure open results/allure-report


---

## Resumo da arquitetura

```text
                    TESTES
                      │
                      ▼
        tests/vehicle/create_quote.robot
                      │
                      ▼
                  FEATURES
                      │
                      ▼
        resources/features/*.robot
                      │
                      ▼
                   PAGES
                      │
                      ▼
          resources/pages/*.robot
                      │
             ┌────────┴────────┐
             ▼                 ▼
         ELEMENTS          TEST DATA
             │                 │
             ▼                 ▼
        Locators             JSON
             │
             └────────┬────────┘
                      ▼
              Browser Library
                      │
                      ▼
                  Playwright
                      │
                      ▼
                Aplicação Web
```

A responsabilidade de cada camada permanece isolada, permitindo que alterações nos elementos da interface sejam realizadas sem modificar os cenários de negócio e que novos cenários sejam adicionados sem duplicar a implementação das páginas.
