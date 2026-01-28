
*** Settings ***
Resource   ../Resources/POM/ProductPage.robot
Resource    ../Resources/Common.robot
Test Setup    Visit Page
Documentation    *Skenario Pembelian Produk*
...              Test ini bertujuan untuk memastikan user dapat melakukan add to cart dan pembayaran

*** Test Cases ***
TC02001 - User dapat melakukan add to cart dan pembayaran
    ${data}    Load Json From File    ${CURDIR}/../Resources/DataFiles/konfigurasiProduk.json
    Pilih Produk Pertama
    Konfigurasi Produk    
    ...    ${data['konfigurasiProduk']['size']}    
    ...    ${data['konfigurasiProduk']['color']}
    Tambahkan Ke Keranjang Dan Checkout
    Take Screenshot
