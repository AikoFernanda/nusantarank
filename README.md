team:
 - Aiko
 - Asyam

DEV:
1. Aktifkan localhosthost dan buka project web CI4 (contoh: http://localhost:8888/projectSearchEngine/public/)
2. di terminal jalankan pip install numpy flask mysql-connector-python
    - jika tidak bisa: 
        a. python3 -m venv venv
        b. source venv/bin/activate
        c. jalankan kembali pip install numpy flask mysql-connector-python
3. python pagerank_engine/app.py
    - Selama mengerjakan proyek backend Python ini, Anda harus selalu mengaktifkan lingkungan 
      virtual (source venv/bin/activate) setiap kali Anda membuka Terminal baru. Setelah selesai, ketik deactivate
4. test dulu koneksi db, apakah output terminal '...berhasil...' dengan: python pagerank_engine/test_db.py
5. jika berhasil, ketil url di web browser(ubah port sesuai local) untuk menghitung skor_pagerank: http://localhost:8888/projectSearchEngine/public/index.php/admin/triggerPagerank/RAHASIA