*** Settings ***
Library     Browser
Variables   ../elements/application_elements.py

*** Variables ***
${BROWSER}    chromium
${HEADLESS}   ${False}
${BASE_URL}   https://sampleapp.tricentis.com/101/app.php

*** Keywords ***
Open Application
    New Browser    browser=${BROWSER}    headless=${HEADLESS}
    New Context    locale=en-GB
    New Page      ${BASE_URL}

Close Test Session
    Close Context
    Close Browser
