
*** Settings ***
Resource    ../Resources/Common.robot
Resource    ../Resources/POM/LoginPage.robot
Test Setup    Visit Page

*** Test Cases ***
User dapat melakukan login dengan akun yang terdaftar
    ${data}    Load Json From File    ${CURDIR}/../Resources/DataFiles/users.json
    
    Klik Tombol Login
    Isi Form Login    
    ...    ${data['user_pendaftaran']['email']}
    ...    ${data['user_pendaftaran']['password']}
    Klik Tombol SignIn
    Take Screenshot

User tidak dapat melakukan login dengan akun yang tidak terdaftar
    ${data}    Load Json From File    ${CURDIR}/../Resources/DataFiles/users.json
    
    Klik Tombol Login
    Isi Form Login    
    ...    ${data['login_not_valid']['email']}
    ...    ${data['login_not_valid']['password']}
    Klik Tombol SignIn
    Should Contain    ${PESAN_ERROR}    'Incorrect email or password.'
    Take Screenshot


