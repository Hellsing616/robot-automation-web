*** Settings ***
Library    Browser
Variables    ../elements/application_elements.py
Variables    ../../config/environment.py


*** Keywords ***
Open Application
    New Browser    browser=${BROWSER}    headless=${HEADLESS}
    New Context    locale=en-GB
    New Page    ${BASE_URL}

Close Test Session
    Close Context
    Close Browser