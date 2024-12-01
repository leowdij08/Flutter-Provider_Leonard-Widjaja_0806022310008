**Leonard Widjaja - 0806022310008** 

# Advanced State Mnagement in Flutter 

Pada proyek Flutter kali ini, saya membuat aplikasi interaktif yang memungkinkan pengguna untuk menambah dan mengurangi counter. Pada setiap counter nantinya akan memiliki warna yang berbeda sesuai dengan warna primaries dari flutter. Di setiap counter, pengguna dapat menambah dan mengurangi nilai dari counter tersebut, selain itu pengguna dapat menghapus, mengubah warna, hingga mengubah urutana counter.

---

## Fitur

1. **Tambah Counter**
Fitur tambahkan counter dapat dilihat pada potongan kode di ```main.dart``` dan juga di ```counter_util.dart```
### **Kode di `main.dart`**
```dart
appBar: AppBar(
  title: const Text('Global Counter App'),
  actions: [
    // Tombol tambah counter
    IconButton(
      onPressed: () {
        setState(() {
          globalState.addCounter(); // Menambahkan counter baru ke daftar
        });
      },
      icon: const Icon(Icons.add),
    ),
  ],
),

---

## Instalasi dan Konfigurasi

1. **Clone Repository**
   Clone repository ke perangkat lokal Anda.
   ```bash
   git clone https://github.com/your-username/advanced-counter-app.git
   cd advanced-counter-app
