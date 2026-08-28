*** Settings ***
Documentation    Create a car insurance quote using Robot Framework, Browser/Playwright and Page Objects.

Library    Browser

Resource    ../../resources/features/vehicle_quote.robot

Suite Setup       Start Test Session
Suite Teardown    Finish Test Session


*** Variables ***
${BROWSER}        chromium
${HEADLESS}       ${False}
${BASE_URL}       https://sampleapp.tricentis.com/101/app.php


*** Keywords ***
Start Test Session
    New Browser    ${BROWSER}    headless=${HEADLESS}
    New Context
    New Page    ${BASE_URL}


Finish Test Session
    Close Browser


*** Test Cases ***
Create Quote For Car
    Open Insurance Application
    Enter Vehicle Data For Automobile
    Enter Insurant Data
    Enter Product Data
    Select Price Option
    Send Quote