*** Settings ***
Library    Browser

*** Variables ***
${BTN_SIGN_UP}         css=a:has-text("Sign up")
${FIELD_FIRST_NAME}    xpath=//input[@id='first_name']
${FIELD_LAST_NAME}     xpath=//input[@id='last_name']
${FIELD_ID}            xpath=//input[@id='email']
${FIELD_PASSWORD}      xpath=//input[@id='password']
${BTN_CREATE}          xpath=//form/div[6]/input
${BTN_MY_ACCOUNT}      css=a:has-text("My Account")

*** Keywords ***
Klik Tombol SIgnUp
    Click    ${BTN_SIGN_UP}

Isi Form Pendaftaran
    [Arguments]    ${first_name}    ${last_name}    ${email}    ${password}
    Fill Text    ${FIELD_FIRST_NAME}    ${first_name}
    Fill Text    ${FIELD_LAST_NAME}     ${last_name}
    Fill Text    ${FIELD_ID}            ${email}
    Fill Text    ${FIELD_PASSWORD}      ${password}

Klik Tombol Create Account
    Click    ${BTN_CREATE}

