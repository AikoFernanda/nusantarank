import numpy as np
import mysql.connector
from flask import Flask, jsonify, request
import time 

app = Flask(__name__)

# --- Konfigurasi Database (Pastikan sama dengan yang berhasil diuji) ---
DB_CONFIG = {
    'host': 'localhost',
    'user': 'root',
    'password': 'root',
    'database': 'nusantarank', # Ganti dengan nama DB Anda yang benar (nusantarank atau nusantarank)
    'port': 8889
}
# -----------------------------------------------------------

def calculate_pagerank(d=0.85, max_iter=1000, tolerance=1e-8): # Meningkatkan iterasi & toleransi
    """
    Fungsi inti untuk menghitung PageRank Berbobot dengan penanganan Dangling Nodes.
    """
    conn = mysql.connector.connect(**DB_CONFIG)
    cursor = conn.cursor(dictionary=True)
    
    # 1. Ambil Node (Arsip Budaya)
    cursor.execute("SELECT id, is_otoritatif FROM arsip_budaya")
    nodes_data = cursor.fetchall()
    N = len(nodes_data)
    
    if N == 0:
        return {'status': 'error', 'message': 'Tidak ada data arsip.'}

    print(f"--- DEBUG: 2. Ditemukan {N} Node ---") 

    id_map = {node['id']: i for i, node in enumerate(nodes_data)} 
    M = np.zeros((N, N)) # Matriks Transisi
    PR = np.ones(N) / N  # Vektor PageRank Awal
    
    # 3. Ambil Edge (Tautan/Links) dan Bobotnya
    cursor.execute("SELECT source_id, target_id, link_weight FROM links_graph")
    links = cursor.fetchall()

    print(f"--- DEBUG: 3. Ditemukan {len(links)} Link ---") 

    # 4. Hitung Jumlah Tautan Keluar (Out-degree)
    out_degree = np.zeros(N)
    for link in links:
        i = id_map.get(link['source_id'])
        weight = float(link['link_weight']) 
        if i is not None:
            out_degree[i] += weight 
            
    # 5. Penanganan Dangling Nodes (Nodes tanpa Out-link)
    is_dangling = (out_degree == 0)
    dangling_count = np.sum(is_dangling)
    print(f"--- DEBUG: 5. Ditemukan {dangling_count} node dangling ---")

    # 6. PENGISIAN MATRIKS M (Matriks Transisi) - PERBAIKAN LOGIKA UTAMA
    for link in links:
        i = id_map.get(link['source_id'])
        j = id_map.get(link['target_id'])
        weight = float(link['link_weight']) 

        # Logika: Hanya isi jika source bukan dangling node
        if i is not None and j is not None and out_degree[i] > 0:
            M[j, i] = weight / out_degree[i]
            
    # 7. ITERASI PAGERANK
    # Lakukan loop PageRank (M @ PR) berulang kali
    for iter_count in range(max_iter):
        PR_old = PR.copy()
        
        # 7a. Perhitungan PageRank Dasar (M @ PR_old)
        M_dot_PR = M @ PR_old
        
        # 7b. Handling Dangling Nodes (Sinks/Kebocoran)
        # Jika ada dangling nodes, hitung total otoritas yang hilang (sum of PR_old[dangling])
        # dan distribusikan secara merata ke SEMUA node (1/N)
        leak_factor = np.sum(PR_old[is_dangling]) / N
        
        # 7c. Formula PageRank Lengkap
        # PR_new = (1-d)/N + d * (M @ PR_old + factor_kebocoran)
        PR_new = (1 - d) / N + d * (M_dot_PR + leak_factor)
        
        # Normalisasi
        PR_new = PR_new / np.sum(PR_new)
        
        # Cek konvergensi
        if np.linalg.norm(PR_new - PR_old) < tolerance:
            print(f"Konvergen di iterasi ke-{iter_count + 1}")
            break
        PR = PR_new
    
    if iter_count + 1 == max_iter:
         print(f"Peringatan: Tidak Konvergen dalam {max_iter} iterasi")

    # 8. Update Database dengan Skor Baru
    update_data = []
    for db_id, index in id_map.items():
        update_data.append((float(PR[index]), db_id))
    
    # Kueri Update Batch (Lebih efisien jika di CI4)
    for skor, db_id in update_data:
        cursor.execute("UPDATE arsip_budaya SET skor_pagerank = %s WHERE id = %s", (skor, db_id))

    conn.commit()
    cursor.close()
    conn.close()

    return {'status': 'success', 'message': f'PageRank berhasil dihitung untuk {N} node.', 'iterations': iter_count + 1}


@app.route('/api/calculate-pagerank', methods=['POST'])
def run_pagerank():
    """Endpoint yang dipanggil oleh CI4 untuk menjalankan perhitungan."""
    try:
        result = calculate_pagerank()
        return jsonify(result), 200
    except Exception as e:
        print(f"Fatal Error di PageRank Engine: {e}") # Print error ke terminal
        return jsonify({'status': 'error', 'message': str(e)}), 500

if __name__ == '__main__':
    app.run(debug=True, port=5000)