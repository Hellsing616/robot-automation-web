*** Settings ***
Documentation    Create a car insurance quote using Robot Framework, Browser/Playwright and Page Objects.
Resource         ../../resources/features/vehicle_quote.robot
Library          ../../libraries/allure_evidence.py

*** Test Cases ***
Create Quote For Car
    Open Insurance Application

    Enter Vehicle Data For Automobile
    Take Screenshot    Vehicle Data

    Enter Insurant Data
    Take Screenshot    Insurant Data

    Enter Product Data
    Take Screenshot    Product Data

    Select Price Option
    Take Screenshot    Price Option

    Send Quote
    Take Screenshot    Quote Sent