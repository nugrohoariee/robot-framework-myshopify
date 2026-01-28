
*** Settings ***
Resource   ../Resources/POM/ProductPage.robot
Resource    ../Resources/Common.robot

Test Setup    Visit Page

*** Test Cases ***
User dapat melakukan add to cart dan pembayaran
    ${data}    Load Json From File    ${CURDIR}/../Resources/DataFiles/konfigurasiProduk.json
    Pilih Produk Pertama
    Konfigurasi Produk    
    ...    ${data['konfigurasiProduk']['size']}    
    ...    ${data['konfigurasiProduk']['color']}
    Tambahkan Ke Keranjang Dan Checkout
    Take Screenshot
