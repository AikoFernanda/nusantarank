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
        
        // Gunakan Grouping untuk Keyword LIKE
        // memastikan kondisi WHERE filter digabungkan dengan AND setelah keyword ditemukan.
        $builder->groupStart()
                    ->like('nama_budaya', $keyword)
                    ->orLike('deskripsi', $keyword)
                ->groupEnd();


        // Filter Kategori (Otomatis digabung dengan AND ke groupStart)
        if ($category && $category !== 'all' && $category !== '') {
            $builder->where('jenis_budaya', $category);
        }
        
        // Filter Wilayah
        if ($wilayah && $wilayah !== 'all' && $wilayah !== '') {
            $builder->where('wilayah_asal', $wilayah);
        }


        // Pengurutan Berdasarkan Skor PageRank
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
     * Mengambil daftar wilayah unik.
     */
    public function getUniqueWilayah()
    {
        return $this->select('wilayah_asal')
                    ->groupBy('wilayah_asal')
                    ->findAll();
    }
}