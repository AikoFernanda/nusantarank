<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Nusantara Rank - Mesin Pencari Budaya</title>
    <style>
        /* CSS dasar untuk styling minimal */
        body { font-family: Arial, sans-serif; margin: 20px; background-color: #f4f4f9; }
        .container { max-width: 800px; margin: auto; background: #fff; padding: 30px; border-radius: 8px; box-shadow: 0 0 10px rgba(0,0,0,0.1); }
        h1 { color: #333; text-align: center; }
        form { display: flex; flex-direction: column; gap: 15px; }
        input[type="text"], select { padding: 10px; border: 1px solid #ccc; border-radius: 4px; }
        button { padding: 10px 15px; background-color: #007bff; color: white; border: none; border-radius: 4px; cursor: pointer; }
        button:hover { background-color: #0056b3; }
        .info { text-align: center; margin-top: 20px; color: #666; font-style: italic; }
    </style>
</head>
<body>
    <div class="container">
        <h1>🔍 Nusantara Rank</h1>
        <p class="info">Mesin Pencari Kuratorial Budaya Lokal berbasis Otoritas Algoritma.</p>

        <!-- Form akan memanggil method results() di Search Controller -->
        <form method="post" action="<?= base_url('search/results') ?>">
            <!-- Input Keyword-->
            <input type="text" name="keyword" placeholder="Cari Budaya (misal: Tari Saman, Naskah Kuno Batak)" required>
            
            <button type="submit">Cari</button>
        </form>
    </div>
</body>
</html>