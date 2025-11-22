import mysql.connector
DB_CONFIG = {
    'host': 'localhost',
    'user': 'root',
    'password': 'root',
    'database': 'nusantarank',
    'port': 8889
}
try:
    conn = mysql.connector.connect(**DB_CONFIG)
    if conn.is_connected():
        print("Koneksi Database Berhasil!")
    conn.close()
except Exception as e:
    print(f"Koneksi Gagal: {e}")