*** Settings ***
Library     Browser
Variables   ../elements/vehicle_elements.py

*** Keywords ***
Go To Automobile Section
    Click    ${AUTOMOBILE_MENU}

Fill Vehicle Data
    Select Options By    ${MAKE}    text    Audi
    Fill Text    ${ENGINE_PERFORMANCE}    110
    Fill Text    ${DATE_OF_MANUFACTURE}    06/12/1980
    Select Options By    ${NUMBER_OF_SEATS}    text    5
    Select Options By    ${FUEL}    text    Petrol
    Fill Text    ${LIST_PRICE}    30000
    Fill Text    ${LICENSE_PLATE}    DMK1234
    Fill Text    ${ANNUAL_MILEAGE}    10000

Continue To Insurant Data
    Click    ${NEXT_INSURANT_DATA}
