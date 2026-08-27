*** Settings ***
Documentation    Create a car insurance quote using Robot Framework, Browser/Playwright and Page Objects.
Resource         ../../resources/features/vehicle_quote.robot
Test Tags        allure.epic:Insurance    allure.feature:Vehicle Quote

*** Test Cases ***
Create Quote For Car
    [Tags]    allure.story:Create Quote
    Open Insurance Application
    Enter Vehicle Data For Automobile
    Enter Insurant Data
    Enter Product Data
    Select Price Option
    Send Quote