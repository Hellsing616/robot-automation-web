*** Settings ***
Library     Browser
Variables   ../elements/insurant_elements.py

*** Keywords ***
Fill Insurant Data    
    Fill Text    ${FIRST_NAME}    Max
    Fill Text    ${LAST_NAME}     Corno
    Fill Text    ${BIRTH_DATE}    05/10/1978
    Check Checkbox    ${GENDER_MALE}
    Fill Text    ${STREET_ADDRESS}    Test Street
    Select Options By    ${COUNTRY}    text    Germany
    Fill Text    ${ZIP_CODE}    40123
    Fill Text    ${CITY}    Essen
    Select Options By    ${OCCUPATION}    text    Employee
    Click    ${HOBBY_CLIFF_DIVING}

Continue To Product Data
    Click    ${NEXT_PRODUCT_DATA}
