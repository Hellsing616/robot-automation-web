*** Settings ***
Library     Browser
Variables   ../elements/insurant_elements.py
Variables    ../../test_data/insurant_data.json

*** Keywords ***
Fill Insurant Data    
    
    Fill Text    ${FIRST_NAME_LOCATOR}    ${FIRST_NAME}
    Fill Text    ${LAST_NAME_LOCATOR}     ${LAST_NAME}
    Fill Text    ${BIRTH_DATE_LOCATOR}    ${BIRTH_DATE}

    Check Checkbox       ${GENDER_MALE_LOCATOR}
    Fill Text            ${STREET_ADDRESS_LOCATOR}    ${STREET_ADDRESS}
    Select Options By    ${COUNTRY_LOCATOR}    text   ${country}
    Fill Text            ${ZIP_CODE_LOCATOR}          ${ZIP_CODE}
    Fill Text            ${CITY_LOCATOR}              ${CITY}

    Select Options By    ${OCCUPATION_LOCATOR} text   ${occupation}
    Click    ${HOBBY_CLIFF_DIVING}

Continue To Product Data
    Click    ${NEXT_PRODUCT_DATA}
