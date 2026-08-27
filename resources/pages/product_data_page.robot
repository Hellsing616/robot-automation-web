*** Settings ***
Library     Browser
Library     DateTime
Variables   ../elements/product_elements.py

*** Keywords ***
Fill Product Data
    ${today}=    Get Current Date
    ${start_date}=    Add Time To Date    ${today}    60 days    result_format=%m/%d/%Y
    Fill Text   id=startdate    10/25/2026
    Select Options By    ${INSURANCE_SUM}    text    7.000.000,00
    Select Options By    ${MERIT_RATING}    text    Bonus 1
    Select Options By    ${DAMAGE_INSURANCE}    text    No Coverage
    Check Checkbox    ${EURO_PROTECTION}
    Select Options By    ${COURTESY_CAR}    text    Yes

Continue To Price Options
    Click    ${NEXT_PRICE_OPTION}
