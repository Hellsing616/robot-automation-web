*** Settings ***

Library    Browser

Variables    ../elements/application_elements.py
Variables    ../../config/environment.py


*** Keywords ***

Open Application
    Go To    ${BASE_URL}