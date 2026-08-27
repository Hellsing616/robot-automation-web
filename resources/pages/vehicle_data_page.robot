*** Settings ***
Library     Browser
Variables   ../elements/vehicle_elements.py
Variables   ../../test_data/vehicle_data.json

*** Keywords ***
Go To Automobile Section
    Click    ${AUTOMOBILE_MENU}

Fill Vehicle Data
    Select Options By    ${MAKE_LOCATOR}                    text    ${vehicle.make}
    Fill Text            ${ENGINE_PERFORMANCE_LOCATOR}      ${vehicle.engine_performance}
    Fill Text            ${DATE_OF_MANUFACTURE_LOCATOR}     ${vehicle.date_of_manufacture}
    Select Options By    ${NUMBER_OF_SEATS_LOCATOR}         text    ${vehicle.number_of_seats}
    Select Options By    ${FUEL_LOCATOR}                    text    ${vehicle.fuel}
    Fill Text            ${LIST_PRICE_LOCATOR}              ${vehicle.list_price}
    Fill Text            ${LICENSE_PLATE_LOCATOR}           ${vehicle.license_plate}
    Fill Text            ${ANNUAL_MILEAGE_LOCATOR}          ${vehicle.annual_mileage}

Continue To Insurant Data
    Click    ${NEXT_INSURANT_DATA}
