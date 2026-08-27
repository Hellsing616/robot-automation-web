*** Settings ***
Library     Browser
Variables   ../elements/insurant_elements.py

*** Keywords ***
Fill Insurant Data    
    [Arguments]    ${firstname_value}=Max    ${lastname_value}=Mustermann
    Fill Text    ${FIRST_NAME}    ${firstname_value}
    Fill Text    ${LAST_NAME}     ${lastname_value}    
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
