*** Settings ***
Library    Browser
Library    String
Variables    ../elements/price_elements.py
Variables    ../../test_data/price_data.json


*** Keywords ***

Select Price
    ${locator}=    Replace String    ${PRICE_OPTION_RADIO}    \${PRICE}    ${price_option}
    Click    ${locator}


Continue To Send Quote
    Click    ${NEXT_SEND_QUOTE}