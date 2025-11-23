<?php namespace App\Controllers;

use App\Models\ArsipBudayaModel;
use CodeIgniter\API\ResponseTrait; // WAJIB DI GUNAKAN

class Graph extends BaseController
{
    use ResponseTrait; // WAJIB DI DEKLARASIKAN

    protected $arsipModel;

    public function __construct()
    {
        $this->arsipModel = new ArsipBudayaModel();
    }

    /**
     * Endpoint API untuk mendapatkan data graf tautan masuk
     */
    public function links($targetId = null)
    {
        if (is_null($targetId) || !is_numeric($targetId)) {
            return $this->fail('Target ID tidak valid.', 400);
        }

        try {
            $data = $this->arsipModel->getInboundLinks($targetId);
        } catch (\Exception $e) {
            // Tangkap error DB atau Query di sini untuk debugging yang lebih baik
            return $this->failServerError('Gagal menjalankan query graf: ' . $e->getMessage());
        }

        // Jika data tidak ditemukan, kirim respons kosong
        if (empty($data)) {
            return $this->respond([
                'status' => 'success',
                'data' => ['nodes' => [], 'links' => []], // Kirim struktur kosong yang benar
                'message' => 'Tidak ditemukan tautan masuk.'
            ]);
        }

        // Format ulang data untuk D3.js
        $nodes = [];
        $links = [];
        
        // Cek apakah arsip target ada sebelum memformat. 
        // Kita perlu nama budaya target untuk ditampilkan di modal.
        $target_arsip = $this->arsipModel->find($targetId);
        $target_name = $target_arsip ? $target_arsip['nama_budaya'] : 'Target Arsip';
        
        // Node Target
        $nodes[] = [
            'id' => (int)$targetId, 
            'name' => $target_name, 
            'group' => 1, 
            'type' => 'Target'
        ];
        
        // Node Sumber
        foreach ($data as $i => $link) {
            $sourceId = (int)$link['source_id'];
            
            $nodes[] = [
                'id' => $sourceId,
                'name' => $link['nama_budaya'],
                'group' => ($link['is_otoritatif'] == 1) ? 2 : 3, // 2: Otoritatif, 3: Normal
                'type' => 'Source'
            ];
            
            $links[] = [
                'source' => $sourceId,
                'target' => (int)$targetId,
                'value' => (float)$link['link_weight'],
            ];
        }


        return $this->respond([
            'status' => 'success',
            'data' => ['nodes' => $nodes, 'links' => $links],
        ]);
    }
}