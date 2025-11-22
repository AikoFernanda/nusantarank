<?php
namespace App\Models;

use CodeIgniter\Model;

class SkripsiModel extends Model
{
    protected $table = 'deskripsi';
    protected $primaryKey = 'id';
    protected $allowedFields = ['nama_budaya', 'wilayah_asal', 'jenis_budaya', 'sumber_data', 'tahun_pencacatan', 'link_arsip'];

    public function getAllSkripsi()
    {
        return $this->findAll();
    }
}