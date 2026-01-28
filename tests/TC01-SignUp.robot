
*** Settings ***
Resource    ../Resources/POM/ProductPage.robot
Resource    ../Resources/Common.robot
Resource    ../Resources/POM/SignUpPage.robot
Test Setup    Visit Page

*** Test Cases ***
User dapat melakukan daftar akun
    ${data}    Load Json From File    ${CURDIR}/../Resources/DataFiles/users.json
    
    Klik Tombol SIgnUp
    Isi Form Pendaftaran    
    ...    ${data['user_pendaftaran']['first_name']}
    ...    ${data['user_pendaftaran']['last_name']}
    ...    ${data['user_pendaftaran']['email']}
    ...    ${data['user_pendaftaran']['password']}
    Klik Tombol Create Account
    Take Screenshot

