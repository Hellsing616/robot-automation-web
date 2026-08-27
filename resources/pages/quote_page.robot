*** Settings ***
Library    Browser
Variables    ../elements/quote_elements.py
Variables    ../../test_data/quote_data.json


*** Keywords ***

Fill Quote Data
    Fill Text    ${EMAIL_LOCATOR}              ${quote.email}
    Fill Text    ${PHONE_LOCATOR}              ${quote.phone}
    Fill Text    ${USERNAME_LOCATOR}           ${quote.username}
    Fill Text    ${PASSWORD_LOCATOR}           ${quote.password}
    Fill Text    ${CONFIRM_PASSWORD_LOCATOR}   ${quote.confirm_password}
    Fill Text    ${COMMENTS_LOCATOR}           ${quote.comments}


Submit Quote
    ${promise}=    Promise To    Wait For Response
    ...    matcher=${QUOTE_RESPONSE_URL}
    ...    timeout=15

    Click    ${SEND_EMAIL_LOCATOR}

    ${response}=    Wait For    ${promise}
    Should Be Equal As Integers    ${response}[status]    200

Verify Quote Sent
    Wait For Elements State    ${SUCCESS_MESSAGE}
    Click    ${OK_BUTTON}