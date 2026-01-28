*** Settings ***
Resource    ../Resources/Common.robot
Resource    ../Resources/POM/LoginPage.robot
Resource    ../Resources/POM/SignUpPage.robot
Test Setup    Visit Page
Documentation    *Skenario Login*
...              Test ini bertujuan untuk memastikan user baru dapat mendaftar 
...              menggunakan email terdaftar dan tidak bisa login menggunakan user yang tidak terdaftar

*** Test Cases ***
TC03001 - User dapat melakukan login dengan akun yang terdaftar
    ${data}    Load Json From File    ${CURDIR}/../Resources/DataFiles/users.json
    
    Klik Tombol Login
    Isi Form Login    
    ...    ${data['user_pendaftaran']['email']}
    ...    ${data['user_pendaftaran']['password']}
    Klik Tombol SignIn
    Get Url    contains    /account
    Take Screenshot

TC03002 - User tidak dapat melakukan login dengan akun yang tidak terdaftar
    ${data}    Load Json From File    ${CURDIR}/../Resources/DataFiles/users.json
    
    Klik Tombol Login
    Isi Form Login    
    ...    ${data['login_not_valid']['email']}
    ...    ${data['login_not_valid']['password']}
    Klik Tombol SignIn
    Should Contain    ${ERROR_MESSAGE}    'Incorrect email or password.'
    Take Screenshot


