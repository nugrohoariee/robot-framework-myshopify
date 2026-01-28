*** Settings ***
Library    Browser
Library    JSONLibrary  

*** Variables ***
${BROWSER_TYPE}    chromium
${URL}             https://sauce-demo.myshopify.com/


*** Keywords ***
Visit Page
    [Arguments]    ${url}=${URL}    ${browser}=${BROWSER_TYPE}
    New Browser    ${browser}       headless=False    args=["--start-maximized"]
    New Context    viewport=${None}
    New Page       ${url}
    Take Screenshot

