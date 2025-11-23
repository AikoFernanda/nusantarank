<?php namespace App\Models;

use CodeIgniter\Model;

class ArsipBudayaModel extends Model
{
    protected $table      = 'arsip_budaya';
    protected $primaryKey = 'id';

    protected $returnType = 'array';
    protected $allowedFields = [
        'nama_budaya', 'wilayah_asal', 'jenis_budaya', 
        'sumber_data', 'deskripsi', 'link_arsip', 
        'skor_pagerank', 'is_otoritatif', 'updated_at'
    ];

    /**
     * Fungsi untuk mencari dan mengurutkan hasil berdasarkan skor PageRank.
     * @param string $keyword Kata kunci pencarian.
     * @param string|null $category Filter jenis budaya.
     * @param string|null $wilayah Filter wilayah asal.
     * @return array Hasil arsip yang sudah diurutkan.
     */
    public function searchAndRank($keyword, $category = null, $wilayah = null)
    {
        $builder = $this->builder();

        $builder->groupStart()
                    ->like('nama_budaya', $keyword)
                    ->orLike('deskripsi', $keyword)
                ->groupEnd();


        // 2. Filter Kategori (Otomatis digabung dengan AND ke groupStart)
        if ($category && $category !== 'all' && $category !== '') {
            $builder->where('jenis_budaya', $category);
        }
        
        // 3. Filter Wilayah 
        if ($wilayah && $wilayah !== 'all' && $wilayah !== '') {
            $builder->where('wilayah_asal', $wilayah);
        }


        // 4. Pengurutan Berdasarkan Skor PageRank
        $builder->orderBy('skor_pagerank', 'DESC');

        return $builder->get()->getResultArray();
    }
    
    /**
     * Mengambil daftar kategori unik.
     */
    public function getUniqueCategories()
    {
        return $this->select('jenis_budaya')
                    ->groupBy('jenis_budaya')
                    ->findAll();
    }

    /**
     * Mengambil daftar wilayah unik. (BARU)
     */
    public function getUniqueWilayah()
    {
        return $this->select('wilayah_asal')
                    ->groupBy('wilayah_asal')
                    ->findAll();
    }

    /**
     * MENGAMBIL DATA GRAF UNTUK VISUALISASI
     * Mengambil semua source_id dan link_weight yang menautkan ke target_id tertentu.
     * @param int $targetId ID arsip yang diklik.
     * @return array Data tautan masuk.
     */
    public function getInboundLinks($targetId)
    {
        $db = \Config\Database::connect();
        
        // Gunakan $db->table() dengan koneksi langsung untuk query kompleks
        $query = $db->table('links_graph AS lg')
                    // Menggunakan AS untuk alias, dan memilih field secara spesifik.
                    ->select('lg.source_id, lg.link_weight, ab.nama_budaya, ab.is_otoritatif')
                    // Join ke arsip_budaya untuk mendapatkan metadata SOURCE node
                    ->join('arsip_budaya AS ab', 'ab.id = lg.source_id') 
                    ->where('lg.target_id', $targetId)
                    ->get();
        
        // Menggunakan getResultArray() memastikan hasilnya berupa array yang mudah diproses oleh Controller
        return $query->getResultArray();
    }
}