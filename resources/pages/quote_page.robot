*** Settings ***
Library     Browser
Variables   ../elements/quote_elements.py

*** Keywords ***
Fill Quote Data
    Fill Text    ${EMAIL}             max.mustermann@example.com
    Fill Text    ${PHONE}             0049201123456
    Fill Text    ${USERNAME}          max.mustermann
    Fill Text    ${PASSWORD}          SecretPassword123!
    Fill Text    ${CONFIRM_PASSWORD}  SecretPassword123!
    Fill Text    ${COMMENTS}          Some comments

Submit Quote
    ${promise}=    Promise To    Wait For Response    matcher=${QUOTE_RESPONSE_URL}    timeout=15
    Click    ${SEND_EMAIL}
    ${body}=    Wait For    ${promise}
    Log    ${body}[status]
    Log    ${body}[body]

Verify Quote Sent
    Wait For Elements State    ${SUCCESS_MESSAGE}
    Click    ${OK_BUTTON}
