# Analisa Project Robot Framework

## Ringkasan Project
Project ini adalah *automation testing suite* yang dibangun menggunakan **Robot Framework** dengan library **Browser (berbasis Playwright)**. Struktur project telah mengikuti *industry standard* dengan menerapkan design pattern **Page Object Model (POM)** untuk meningkatkan keterbacaan dan kemudahan pemeliharaan (*maintainability*).

## Poin Utama Pembelajaran

Berikut adalah konsep dan teknik utama yang telah diterapkan dalam project ini:

### 1. Page Object Model (POM) Design Pattern
Kamu telah memisahkan logic pengujian dengan detail elemen halaman.
*   **Test Case Logic**: Berada di `tests/TC01-SignUp.robot`.
*   **Page Objects**: Berada di `Resources/POM/SignUpPage.robot`.
*   **Manfaat**: Jika ada perubahan pada locator elemen di website, kamu hanya perlu mengubah satu file di direktori POM tanpa perlu menyentuh file Test Case.

### 2. Robot Framework Structure & Best Practices
Struktur file `.robot` yang dibuat sudah sangat rapi:
*   **Settings**: Mengelola import library (`Browser`, `JSONLibrary`) dan resource lain (`Common.robot`).
*   **Variables**: Menggunakan variabel untuk locator (contoh: `${BTN_SIGN_UP}`) agar kode lebih bersih.
*   **Keywords**: Membuat *custom keyword* yang deskriptif seperti `Klik Tombol SIgnUp` atau `Isi Form Pendaftaran`.
*   **Test Setup**: Memastikan kondisi awal yang konsisten dengan `Test Setup Visit Page`.

### 3. Browser Library (Playwright)
Menggunakan library modern **Browser** yang lebih cepat dan stabil dibandingkan Selenium.
*   Menggunakan keyword kunci seperti `New Browser`, `New Context`, `New Page`, `Click`, dan `Fill Text`.
*   Konfigurasi `headless=False` di `Common.robot` memudahkan debugging secara visual.

### 4. Data-Driven Testing (External Data)
Data pengujian tidak di-*hardcode* di dalam script, melainkan dipisahkan ke file eksternal.
*   **Implementasi**: Menggunakan keyword `Load Json From File` untuk membaca data dari `Resources/DataFiles/users.json`.
*   **Akses Data**: Mengambil nilai secara dinamis, contoh: `${data['user_pendaftaran']['first_name']}`.
*   **Manfaat**: Memungkinkan pengujian dengan berbagai set data yang berbeda dengan mudah.

### 5. Reusable Resources (DRY Principle)
Penerapan prinsip **Don't Repeat Yourself (DRY)** terlihat pada file `Resources/Common.robot`.
*   Keyword umum seperti `Visit Page` ditempatkan di file terpisah agar bisa digunakan kembali oleh Test Case lain.

### 6. Dynamic Arguments
Penggunaan argumen pada custom keyword menambah fleksibilitas.
*   Contoh: `Isi Form Pendaftaran` menerima parameter `${first_name}`, `${last_name}`, dll.
*   Ini memungkinkan keyword yang sama digunakan untuk mendaftarkan user yang berbeda-beda.

## Rekomendasi Pengembangan (Next Steps)

1.  **Assertions/Validasi**:
    *   Tambahkan langkah validasi di akhir Test Case.
    *   Contoh: Pastikan URL berubah ke halaman dashboard atau muncul pesan "Welcome" setelah tombol "Create Account" diklik.
    *   Code: `Get Text    h1    ==    Welcome` atau `Get Url    contains    /account`

2.  **Tagging**:
    *   Gunakan fitur `[Tags]` pada Test Cases.
    *   Contoh: `[Tags] smoke` atau `[Tags] regression`.
    *   Ini memudahkan eksekusi parsial suite test (misal: hanya menjalankan basic functionality).

## Tools & Libraries

Berikut adalah daftar tools dan library yang terinstall pada project ini:

### Core Frameworks
*   **Robot Framework (v7.4.1)**: Core automation framework.
*   **Robot Framework Browser (v19.12.3)**: Library utama untuk web automation berbasis Playwright.
*   **Robot Framework JSONLibrary (v0.5)**: Library untuk memanipulasi data JSON.
*   **Allure Robot Framework (v2.15.3)**: Library untuk integrasi reporting dengan Allure.

### Dependencies Lainnya
*   **grpcio**: Digunakan oleh Browser library untuk komunikasi dengan Playwright node process.
*   **protobuf**: Dependencies untuk serialisasi data.
*   **jsonschema**: Validasi struktur JSON.
*   **PyYAML**: Parsing konfigurasi YAML (kemungkinan digunakan oleh Allure atau tools lain).

### Instruksi Instalasi
File `requirements.txt` telah dibuat untuk memudahkan instalasi semua dependencies di atas.
Command: `pip install -r requirements.txt`

