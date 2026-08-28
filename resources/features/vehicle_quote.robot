*** Settings ***

Resource    ../pages/vehicle_data_page.robot
Resource    ../pages/insurant_data_page.robot
Resource    ../pages/product_data_page.robot
Resource    ../pages/price_option_page.robot
Resource    ../pages/quote_page.robot
Resource    ../pages/application_page.robot


*** Keywords ***

Open Insurance Application
    Open Application


Enter Vehicle Data For Automobile
    Go To Automobile Section
    Fill Vehicle Data
    Continue To Insurant Data


Enter Insurant Data
    Fill Insurant Data
    Continue To Product Data


Enter Product Data
    Fill Product Data
    Continue To Price Options


Select Price Option
    Select Price
    Continue To Send Quote


Send Quote
    Fill Quote Data
    Submit Quote
    Verify Quote Sent