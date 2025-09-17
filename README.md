
# 💸 Money Expense

Aplikasi pencatat keuangan sederhana berbasis **Flutter** dengan penyimpanan **SQLite**.  
Tujuan aplikasi ini adalah untuk mempermudah pencatatan pengeluaran harian, mingguan, dan bulanan sekaligus memberikan ringkasan berdasarkan kategori.

---

## ✨ Fitur Utama
- 📅 **Catat pengeluaran** dengan nama, kategori, tanggal, dan nominal.
- 🔎 **Filter otomatis**:  
  - Hari ini  
  - Minggu ini  
  - Bulan ini  
- 📊 **Ringkasan pengeluaran per kategori**.
- 📂 **Riwayat lengkap** pengeluaran, tersimpan di database lokal (`sqflite`).
- 🗑 **Reset database** untuk menghapus semua data.
- 📌 **Pemilihan tanggal** dengan **calendar picker** (pakai `syncfusion_flutter_datepicker`).

---

## 🛠 Teknologi
- **Flutter** (UI framework)
- **sqflite** (SQLite database)
- **path_provider** (lokasi penyimpanan DB)
- **go_router** (navigasi)
- **flutter_bloc** (state management)
- **syncfusion_flutter_datepicker** (calendar widget)

---

## 📂 Struktur Folder
```
lib/
├── database/
│ └── database_helper.dart # Helper untuk koneksi & query SQLite
│
├── features/
│ ├── dashboard/ # Modul dashboard
│ │ ├── data/ # Repository, model, dsb.
│ │ └── presentation/ # Widget/UI untuk dashboard
│ │
│ ├── form/ # Modul form pengeluaran
│ │ ├── data/ # Model & repository untuk form
│ │ └── presentation/ # Widget/UI untuk form
│
├── global/ # Resource & utilitas global
│ ├── color/ # Palet warna aplikasi
│ ├── extension/ # Extension method
│ ├── utils/ # Helper utilitas (format tanggal, rupiah, dll.)
│ └── widgets/ # Reusable widget (button, overlay, text, dll.)
│
├── router/ # Konfigurasi routing dengan GoRouter
│ └── router.dart
│
├── main.dart # Entry point aplikasi
```

---

## 🚀 Setup & Instalasi

1. Clone repository:
   ```bash
   git clone https://github.com/username/money_expense.git
   cd money_expense
   ```

2. Install dependencies:
   ```bash
   flutter pub get
   ```

3. Jalankan aplikasi:
   ```bash
   flutter run
   ```

---

## 🗄 Database

- Tabel utama: **expenses**
  ```sql
  CREATE TABLE expenses (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    expense TEXT,
    category_id INTEGER,
    date TEXT,
    nominal REAL
  );
  ```

- `date` disimpan sebagai string ISO (`yyyy-MM-ddTHH:mm:ss`) agar mudah diurutkan & difilter dengan query SQLite.

---

## 📜 Lisensi
MIT License © 2025
