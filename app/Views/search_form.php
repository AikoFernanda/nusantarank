<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Nusantarank - Mesin Pencari Budaya</title>
    
    <!-- Memuat Bootstrap 5 CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" xintegrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

    <style>
        /* CSS Tambahan untuk Pusat Layar dan Kustomisasi (Menggantikan CSS murni sebelumnya) */
        body { 
            font-family: 'Inter', sans-serif; 
            background-color: #f8f9fa; /* Latar belakang Bootstrap */
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            margin: 0;
        }
        .main-content {
            width: 100%;
            max-width: 750px; /* Lebar lebih lega */
        }
        .card { 
            /* class .container custom */
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1); 
            border: none;
            border-radius: 1rem;
        }
        h1 { 
            color: #1a0dab;
            font-size: 2.5rem;
            font-weight: 800;
        }
        .info { 
            color: #6c757d; 
            font-style: italic; 
            font-size: 1.1rem;
        }
        /* Kustomisasi Input dan Tombol */
        .form-control-lg-custom {
            padding: 1.25rem 1.5rem;
            border-radius: 2rem; 
            font-size: 1.15rem;
            border: 2px solid #ced4da;
        }
        .btn-custom-danger {
            background-color: #dc3545; /* Merah Otoritas */
            border: none;
            padding: 0.75rem 2rem;
            border-radius: 2rem;
            font-weight: bold;
            font-size: 1.1rem;
            transition: background-color 0.3s, box-shadow 0.3s;
        }
        .btn-custom-danger:hover { 
            background-color: #c82333; 
            box-shadow: 0 4px 10px rgba(220, 53, 69, 0.4);
        }
    </style>
</head>
<body>
    <div class="main-content">
        <!-- Card dan Shadow -->
        <div class="card p-4 mx-3"> 
            <div class="card-body text-center">
                <h1 class="mb-2">🔍 Nusantarank</h1>
                <p class="info mb-5">Mesin Pencari Kuratorial Budaya Lokal Berbasis Algoritma Otoritas</p>

                <!-- Form -->
                <form method="post" action="<?= base_url('search/results') ?>" class="d-flex flex-column align-items-center gap-3">
                    
                    <!-- Input Keyword-->
                    <input type="text" name="keyword" class="form-control form-control-lg-custom" 
                           placeholder="Cari Budaya (misal: Tari Saman, Naskah Kuno Batak)" required>
                    
                    <!-- Tombol Submit -->
                    <button type="submit" class="btn btn-custom-danger mt-3">
                        Cari Otoritas Budaya
                    </button>
                </form>
            </div>
        </div>
    </div>
    
    <!-- Script Bootstrap 5 untuk fungsionalitas -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" xintegrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>