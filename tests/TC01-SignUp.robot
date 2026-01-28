
*** Settings ***
Resource    ../Resources/POM/ProductPage.robot
Resource    ../Resources/Common.robot
Resource    ../Resources/POM/SignUpPage.robot
Test Setup    Visit Page
Documentation    *Skenario Sign Up*
...              Test ini bertujuan untuk memastikan user baru dapat mendaftar 
...              menggunakan email yang valid

*** Test Cases ***
TC01001 - User dapat melakukan daftar akun
    ${data}    Load Json From File    ${CURDIR}/../Resources/DataFiles/users.json
    
    Klik Tombol SIgnUp
    Isi Form Pendaftaran    
    ...    ${data['user_pendaftaran']['first_name']}
    ...    ${data['user_pendaftaran']['last_name']}
    ...    ${data['user_pendaftaran']['email']}
    ...    ${data['user_pendaftaran']['password']}
    Klik Tombol Create Account
    Take Screenshot

