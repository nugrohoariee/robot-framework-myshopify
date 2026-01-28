
*** Settings ***
Resource    ../Resources/Common.robot
Resource    ../Resources/POM/LoginPage.robot

Test Setup    Visit Page

*** Test Cases ***
User dapat melakukan daftar akun
    ${data}    Load Json From File    ${CURDIR}/../Resources/DataFiles/users.json
    
    Klik Tombol Login
    Isi Form Login    
    ...    ${data['user_pendaftaran']['email']}
    ...    ${data['user_pendaftaran']['password']}
    Klik Tombol SignIn
    Take Screenshot




