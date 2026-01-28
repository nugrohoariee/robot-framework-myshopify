*** Settings ***
Library    Browser

*** Variables ***
${PRODUCT_SELECTOR}    .product >> nth=1
${SIZE_DROPDOWN}       id=product-select-option-0
${COLOR_DROPDOWN}      id=product-select-option-1
${ADD_TO_CART_BTN}     id=add
${CHECKOUT_LINK}       role=link[name="Check Out"]

*** Keywords ***
Pilih Produk Pertama
    Click    ${PRODUCT_SELECTOR}
    
Konfigurasi Produk
    [Arguments]    ${size}    ${color}
    Select Options By    ${SIZE_DROPDOWN}     label    ${size}
    Select Options By    ${COLOR_DROPDOWN}    label    ${color}

Tambahkan Ke Keranjang Dan Checkout
    Click    ${ADD_TO_CART_BTN}
    Click    ${CHECKOUT_LINK}