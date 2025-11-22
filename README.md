Nusantara Rank: Platform Kurasi Budaya Lokal Berbasis Algoritma Otoritas

Nusantara Rank adalah platform website mesin pencari khusus yang dirancang untuk mengatasi masalah hilangnya otoritas konten budaya lokal di ruang digital. Kami tidak mengindeks internet secara umum, melainkan mengkurasi dan merangking arsip-arsip budaya yang terancam punah dari sumber-sumber tepercaya. Konten budaya lokal sering mendapatkan skor otoritas (PageRank) yang rendah di mesin pencari umum karena minimnya link dari situs-situs global. Hal ini menyebabkan informasi otentik tentang warisan bangsa tenggelam di hasil pencarian, kalah dari konten komersial. Nusantara Rank menyelesaikan masalah ini dengan mendefinisikan Otoritas Digital yang Adil di dalam ekosistem budaya tertutup.

Sistem merangking hasil pencarian berdasarkan Cultural PageRank Score, yang dihitung oleh Engine PageRank khusus:
- Algoritma: Weighted PageRank (PageRank Berbobot).
- Mekanisme Otoritas: Kami memberikan bobot tautan (Link Weight) yang lebih tinggi ($\ge 1.1$) pada tautan yang berasal dari sumber-sumber yang terverifikasi sebagai Institusi Otoritatif (misalnya Jurnal Akademik, Museum, Laporan UNESCO).
- Keunggulan Teknis: Implementasi algoritma mencakup Penanganan Dangling Nodes (Node Menggantung) untuk mencegah kebocoran otoritas, menjamin skor yang dihasilkan stabil dan akurat.


🛠️ Arsitektur dan Instalasi
Nusantara Rank menggunakan arsitektur hybrid (pemisahan web dan engine algoritma) untuk kinerja dan skalabilitas.

Prasyarat
Pastikan Anda telah menginstal komponen berikut:
- Web Server: MAMP/XAMPP (dengan PHP 8.1+ dan MySQL/MariaDB).
- PHP Framework: CodeIgniter 4 (CI4).
- Python Environment: Python 3.10+.
- Python Libraries: Flask, numpy, mysql-connector-python.

Langkah-Langkah Instalasi
A. Setup Database (MySQL/MariaDB)
- Buat database baru (misalnya search_engine atau nusantarank).
- Impor file .sql yang berisi tabel arsip_budaya (Node) dan links_graph (Edge).
- Pastikan data di links_graph sudah terisi minimal 200 tautan logis.
- Perbarui kredensial database di file app/Config/Database.php (untuk CI4) dan pagerank_engine/app.py (untuk Python) agar menggunakan Port MAMP yang benar (biasanya 8889).

B. Setup PageRank Engine (Python)
- Buka Terminal di root proyek.
- Buat dan aktifkan Virtual Environment (venv):
- python3 -m venv venv
- source venv/bin/activate
    Instal dependencies:
    - pip install numpy flask mysql-connector-python
    - Jalankan Engine (Pastikan CI4 belum diakses):
    - python pagerank_engine/app.py (Engine harus tetap berjalan selama pengujian.)

C. Setup CodeIgniter 4 (CI4)
- Akses proyek Anda melalui web browser:
    http://localhost:8888/nusantarank/public/index.php/


⚙️ Panduan Penggunaan dan Uji Coba

1. Memicu Perhitungan PageRank (Wajib)
- Skor PageRank harus dihitung ulang setiap kali data di links_graph berubah.
- Akses rute trigger ini di browser Anda:
    http://localhost:8888/projectSearchEngine/public/index.php/admin/triggerPagerank/RAHASIA
- Verifikasi: Cek log Terminal Python (akan muncul pesan Konvergen di iterasi ke-XX). Kolom skor_pagerank di DB akan terisi.

2. Fitur Pencarian dan Filter
- Pencarian Awal: Masukkan keyword di halaman utama.
- Filter Otoritas: Di halaman hasil, gunakan dropdown Filter Jenis Budaya dan Filter Wilayah untuk mempersempit hasil. Filter ini menerapkan logika AND setelah pencarian keyword untuk menunjukkan arsip yang paling relevan dan otoritatif di wilayah spesifik.

3. Fitur Unggulan: Visualisasi Graf Otoritas
- Klik tombol "✨ Lihat Graf Otoritas" pada hasil pencarian mana pun.
- Purpose: Fitur ini secara visual mendemonstrasikan transparansi algoritma dengan menunjukkan Node mana yang menautkan ke arsip yang sedang dilihat (target_id) dan seberapa besar bobot tautan mereka (link_weight). Ini adalah bukti nyata implementasi Algoritma Weighted PageRank Anda.

👥 Kontributor
[Aiko] - [Backend]
[Asyam] - [Frontend]