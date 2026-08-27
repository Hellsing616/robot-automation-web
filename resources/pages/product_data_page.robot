*** Settings ***
Library     Browser
Library     DateTime
Variables   ../elements/product_elements.py
Variables    ../../test_data/product_data.json

*** Keywords ***
Fill Product Data
    ${today}=    Get Current Date
    ${start_date}=    Add Time To Date    ${today}    60 days    result_format=%m/%d/%Y

    Fill Text            ${START_DATE_LOCATOR}                  ${start_date}
    Select Options By    ${INSURANCE_SUM_LOCATOR}       text    ${product.insurance_sum}
    Select Options By    ${MERIT_RATING_LOCATOR}        text    ${product.merit_rating}
    Select Options By    ${DAMAGE_INSURANCE_LOCATOR}    text    ${product.damage_insurance}

    Check Checkbox       ${EURO_PROTECTION}

    Select Options By    ${COURTESY_CAR_LOCATOR}        text    ${product.courtesy_car}

Continue To Price Options
    Click    ${NEXT_PRICE_OPTION}
