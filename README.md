# CAMPTERIA
![logo](https://github.com/user-attachments/assets/e5173265-ee6b-4953-99ac-17213d3e8427)


## Kelompok 5 - C2

Anggota Kelompok:  
Abdurrahman Rauf Budiman – 2301102  
Faiz Bayu Erlangga – 2311231  
Marco Henrik Abineno – 2301093  
Muhammad Alfi Fariz – 2311174  
Qalam Noer Fazrian – 2304746  

## Cara Menjalankan Aplikasi
1. Clone terlebih dahulu github repository ini "https://github.com/alfifariz15/Tugas3-Provis.git"
2. Setelah clone, edit configuration Run/Debug nya dan ganti nama dengan `logo.dart` lalu untuk dart entrypoint nya arahkan ke file `logo.dart` projek nya `"Tugas3-Provis\lib\logo.dart"`
3. Setelah configuration jangan lupa di flutter pub get atau get dependencies
4. Setelah itu baru run projek aplikasi nya

`Disclaimer : Kami menggunakan web chrome untuk menjalankan aplikasi nya`

## Berikut penjelasan mengenai implementasi UI dalam Flutter:

| No. | Halaman           | Deskripsi                                                                                                                                         |
|-----|-------------------|---------------------------------------------------------------------------------------------------------------------------------------------------|
| 1   | Sign In           | Terdapat tombol login dan register yang dapat diklik. Tombol "Login as Guest" akan diarahkan ke halaman Home.                                    |
| 2   | Home              | Terdapat profile, package sudah dinavigasikan, dan kategori hanya untuk tenda. Navbar berisi Home, History, Chat, Cart, dan Notification.        |
| 3   | History           | Menampilkan detail transaksi dengan status: Done, Waiting, On Delivery, Borrowed.                                                                |
| 4   | Chat              | Ketika diklik langsung terhubung ke WhatsApp admin.                                                                                              |
| 5   | Cart              | -                                                                                                                                                 |
| 6   | Notification      | -                                                                                                                                                 |
| 7   | Review            | -                                                                                                                                                 |
| 8   | Profile           | Terdapat tombol Help yang akan diarahkan ke halaman Help.                                                                                         |
| 9   | Category          | -                                                                                                                                                 |
| 10  | Item Details      | -                                                                                                                                                 |
| 11  | Package           | -                                                                                                                                                 |
| 12  | Checkout          | Customer mengisi data dan memilih antara Self Pickup atau Home Delivery. Self Pickup = datang langsung, Home Delivery = isi form alamat.         |
| 13  | Payment           | Customer dapat transfer secara langsung. Tersedia tata cara transfer.                                                                             |
| 14  | Payment Option    | Customer memilih metode pembayaran yang diinginkan.                                                                                               |
| 15  | Waiting Confirm   | -                                                                                                                                                 |
| 16  | Success Transact  | -                                                                                                                                                 |
| 17  | Detail Transact   | Jika statusnya "Done", customer bisa menilai layanan.                                                                                             |
| 18  | Return Form       | -                                                                                                                                                 |
| 19  | Help              | Terdapat 3 tombol: About Us, Terms and Conditions, dan Contact Us.                                                                                |
| 20  | About Us          | -                                                                                                                                                 |
| 21  | Terms and Conditions | -                                                                                                                                             |
| 22  | Contact Us        | -                                                                                                                                                 |

## Catatan
Beberapa fitur mungkin belum diimplementasikan karena baru berupa antarmuka (front end) saja.
