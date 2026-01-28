*** Settings ***
Library    Browser

*** Variables ***
${BTN_LOGIN}           css=a:has-text("Log In")
${FIELD_EMAIL}         id=customer_email
${FIELD_PASSWORD}      id=customer_password
${BTN_SIGNIN}          css=input[type="submit"][value="Sign In"]
${ERROR_MESSAGE}         xpath=//li[normalize-space()='Incorrect email or password.']


*** Keywords ***
Klik Tombol Login
    Click    ${BTN_LOGIN}

Isi Form Login
    [Arguments]     ${email}    ${password}
    Fill Text    ${FIELD_EMAIL}            ${email}
    Fill Text    ${FIELD_PASSWORD}      ${password}

Klik Tombol SignIn
    Click    ${BTN_SIGNIN}

