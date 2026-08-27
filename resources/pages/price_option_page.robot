*** Settings ***
Library     Browser
Library     String
Variables   ../elements/price_elements.py

*** Keywords ***
Select Price
    [Arguments]    ${price_option}=Silver

    ${locator}=    Replace String    ${PRICE_OPTION_RADIO}    \${PRICE}    ${price_option}
    Click    ${locator}
    
Continue To Send Quote
    Click    ${NEXT_SEND_QUOTE}
