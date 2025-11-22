<?php namespace App\Controllers;

use App\Models\ArsipBudayaModel;

class Search extends BaseController
{
    protected $arsipModel;
    protected $pythonApiUrl = 'http://127.0.0.1:5000/api/calculate-pagerank';

    public function __construct()
    {
        $this->arsipModel = new ArsipBudayaModel();
    }

    public function index()
    {
        return view('search_form'); // Tampilkan halaman form pencarian awal
    }

    public function results()
    {
        // Ambil input dari form
        $keyword = $this->request->getPost('keyword');
        $category = $this->request->getPost('category');
        $wilayah = $this->request->getPost('wilayah'); // Menerima input Wilayah

        $data = [
            'keyword' => $keyword,
            // Memanggil Model dengan parameter Wilayah baru
            'results' => $this->arsipModel->searchAndRank($keyword, $category, $wilayah),
            // Ambil daftar kategori unik
            'categories' => $this->arsipModel->getUniqueCategories(),
            // Ambil daftar wilayah unik 
            'wilayah_list' => $this->arsipModel->getUniqueWilayah(),
            
            // MENGAKSES DATA POST DI VIEW
            'request' => $this->request, 
        ];

        return view('search_results', $data);
    }
    
    /** Memanggil Engine Python untuk menjalankan perhitungan PageRank. */
    public function runPagerankEngine()
    {
        $client = \Config\Services::curlrequest();

        try {
            $response = $client->post($this->pythonApiUrl, [
                'timeout' => 300, 
                'json' => ['action' => 'run']
            ]);

            $body = json_decode($response->getBody(), true);
            $message = $body['message'] ?? 'Perhitungan berhasil. Cek database.';
            
            return redirect()->to(base_url())->with('success', 'PageRank Engine Berhasil Dijalankan: ' . $message);

        } catch (\Exception $e) {
            return redirect()->to(base_url())->with('error', 'Gagal menjalankan PageRank Engine: ' . $e->getMessage());
        }
    }
}