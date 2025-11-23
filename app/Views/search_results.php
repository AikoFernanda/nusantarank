<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hasil Pencarian: <?= esc($keyword) ?> | Nusantara Rank</title>
    
    <!-- Memuat Bootstrap 5 CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" xintegrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

    <!-- Import D3.js untuk Visualisasi Graf (paling umum digunakan) -->
    <script src="https://d3js.org/d3.v7.min.js"></script> 
    
    <style>
        /* Kustomisasi Tambahan di atas Bootstrap */
        body { 
            font-family: 'Inter', sans-serif; 
            background-color: #f8f9fa; 
        }
        .main-container { 
            /* Menggantikan .container lama */
            max-width: 1100px; 
            margin-top: 30px;
        }
        .result-item { 
            /* Mengganti .result-item lama dengan card Bootstrap */
            transition: transform 0.2s, box-shadow 0.2s;
            position: relative;
        }
        .result-item:hover {
            transform: translateY(-3px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }
        .pagerank-score { 
            font-weight: bold; 
            color: #dc3545; /* Merah Otoritas */
            font-size: 0.9em; 
            position: absolute; 
            top: 15px; 
            right: 15px; 
            padding: 5px 10px;
            border-radius: 5px;
            background-color: #ffe5e8;
        }
        .result-title { 
            font-size: 1.25rem; 
            color: #1a0dab; 
            text-decoration: none;
            font-weight: 600;
        }
        .result-title:hover {
            text-decoration: underline;
        }
        .visualize-btn { 
            background: #6f42c1; /* Ungu untuk Visualisasi */
            border: none; 
            padding: 0.5rem 1rem; 
            border-radius: 0.5rem; 
            font-size: 0.9rem;
            transition: background-color 0.3s;
        }
        .visualize-btn:hover {
            background: #5a2e99;
        }
        /* Style untuk Modal D3.js */
        .modal-content { 
            max-width: 900px;
        }
        #graph-container { 
            height: 400px; 
            border: 1px solid #dee2e6; 
            margin-top: 15px; 
            text-align: center;
        }
        /* Style untuk Pesan Loading */
        #loading-message {
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-color: rgba(255, 255, 255, 0.8);
            display: flex;
            justify-content: center;
            align-items: center;
            font-size: 1.2rem;
            color: #007bff;
            z-index: 10; 
        }
    </style>
</head>
<body>
    <div class="container main-container">
        
        <!-- TOMBOL KEMBALI KE PENCARIAN (BARU) -->
        <a href="<?= base_url('/') ?>" class="btn btn-outline-secondary btn-sm mb-3">
            ← Kembali ke Pencarian Baru
        </a>

        <h1 class="mb-2">Hasil Pencarian Budaya untuk: "<?= esc($keyword) ?>"</h1>
        <p class="text-muted">Menampilkan <?= count($results) ?> sumber yang diurutkan berdasarkan <strong>Cultural PageRank Score (Otoritas)</strong>.</p>
        
        <!-- FORM FILTER ULANG (Menggunakan kelas Bootstrap d-flex dan form-control) -->
        <form method="post" action="<?= base_url('search/results') ?>" class="d-flex flex-wrap align-items-center mb-4 gap-3">
            <!-- Input Keyword Tersembunyi -->
            <input type="hidden" name="keyword" value="<?= esc($keyword) ?>">
            
            <!-- Filter Kategori -->
            <select name="category" onchange="this.form.submit()" class="form-select form-select-sm w-auto">
                <option value="all">Filter Jenis (Saat Ini: <?= esc($request->getPost('category') ?: 'Semua') ?>)</option>
                
                <?php foreach ($categories as $cat): ?>
                    <?php 
                        $jenis = esc($cat['jenis_budaya']);
                        $selected = ($jenis === $request->getPost('category')) ? 'selected' : '';
                    ?>
                    <option value="<?= $jenis ?>" <?= $selected ?>>
                        <?= $jenis ?>
                    </option>
                <?php endforeach; ?>
            </select>
            
            <!-- Filter Wilayah -->
            <select name="wilayah" onchange="this.form.submit()" class="form-select form-select-sm w-auto">
                <option value="all">Filter Wilayah (Saat Ini: <?= esc($request->getPost('wilayah') ?: 'Semua') ?>)</option>
                
                <?php foreach ($wilayah_list as $wilayah_item): ?>
                    <?php 
                        $wilayah_nama = esc($wilayah_item['wilayah_asal']);
                        $selected = ($wilayah_nama === $request->getPost('wilayah')) ? 'selected' : '';
                    ?>
                    <option value="<?= $wilayah_nama ?>" <?= $selected ?>>
                        <?= $wilayah_nama ?>
                    </option>
                <?php endforeach; ?>
            </select>
        </form>

        <?php if (!empty($results)): ?>
            <div class="row">
                <div class="col-12">
                    <?php foreach ($results as $item): ?>
                        <!-- Menggunakan class card Bootstrap -->
                        <div class="card result-item shadow-sm mb-3">
                            <div class="card-body">
                                <div class="pagerank-score">Skor Otoritas: <?= number_format($item['skor_pagerank'], 8) ?></div>
                                
                                <a href="<?= esc($item['link_arsip']) ?>" target="_blank" class="result-title mb-1 d-block"><?= esc($item['nama_budaya']) ?></a>
                                
                                <span class="text-success small d-block mb-2"><?= esc($item['link_arsip']) ?></span>
                                
                                <p class="card-text text-dark mb-2"><?= esc(substr($item['deskripsi'], 0, 150)) . '...' ?></p>
                                
                                <small class="text-secondary">
                                    Wilayah: <strong><?= esc($item['wilayah_asal']) ?></strong> | Jenis: <strong><?= esc($item['jenis_budaya']) ?></strong>
                                </small>
                                
                                <button class="btn btn-sm text-white visualize-btn mt-2" onclick="openModal(<?= esc($item['id']) ?>, '<?= esc($item['nama_budaya']) ?>')">
                                    ✨ Lihat Graf Otoritas
                                </button>
                            </div>
                        </div>
                    <?php endforeach; ?>
                </div>
            </div>
        <?php else: ?>
            <div class="alert alert-warning mt-4" role="alert">
                Maaf, tidak ditemukan arsip budaya terkait dengan kata kunci "<?= esc($keyword) ?>" dan filter yang dipilih.
            </div>
        <?php endif; ?>
    </div>

    <!-- MODAL UNTUK VISUALISASI GRAF (Menggunakan Modal Bootstrap) -->
    <div class="modal fade" id="visualizationModal" tabindex="-1" aria-labelledby="modalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="modalLabel">Visualisasi Graf Otoritas (<span id="modal-title"></span>)</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" onclick="closeModal()"></button>
                </div>
                <div class="modal-body">
                    <p class="text-muted">Graf ini menunjukkan tautan masuk (inbound links) dari sumber lain yang membentuk skor PageRank.</p>
                    
                    <div id="graph-wrapper"> 
                         <!-- Wrapper baru untuk menampung graf dan loading -->
                        <div id="loading-message" style="display:none;">
                            <div class="spinner-border text-primary me-2" role="status">
                                <span class="visually-hidden">Loading...</span>
                            </div>
                            Memuat data graf...
                        </div>
                        <div id="graph-container">
                            <!-- SVG/Canvas untuk Graf akan dirender di sini oleh D3.js -->
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" onclick="closeModal()">Tutup</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Script Bootstrap 5 JS Bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>

    <!-- SCRIPT JAVASCRIPT & D3.js -->
    <script>
        // Inisialisasi Modal Bootstrap
        let visualizationModal;
        document.addEventListener('DOMContentLoaded', function () {
            visualizationModal = new bootstrap.Modal(document.getElementById('visualizationModal'));
        });

        function openModal(nodeId, title) {
            document.getElementById('modal-title').innerText = title;
            visualizationModal.show();
            
            // 1. Bersihkan kontainer dari SVG lama dan pesan error/info sebelumnya
            d3.select("#graph-container").html(""); 
            
            // 2. Tampilkan pesan loading BARU (Fix TypeError)
            document.getElementById('loading-message').style.display = 'flex'; // Menggunakan flex karena di CSS sdh diatur display: flex
            
            // 3. Panggil fungsi untuk mengambil data graf NYATA
            fetchGraphData(nodeId, title);
        }

        function closeModal() {
            visualizationModal.hide();
            // Cukup sembunyikan loading message saat ditutup
            document.getElementById('loading-message').style.display = 'none'; 
            d3.select("#graph-container").html(""); // Pastikan konten graf dihilangkan
        }

        async function fetchGraphData(nodeId, title) {
            try {
                // Panggil endpoint API baru di CI4
                const apiUrl = `<?= base_url('api/graph/links') ?>/${nodeId}`;
                const response = await fetch(apiUrl);
                
                // 3. Penanganan Error 404/500/etc.
                if (!response.ok) {
                     // Jika status bukan 200, lempar error.
                    throw new Error(`Gagal memuat rute API. Status: ${response.status} (${response.statusText}).`);
                }

                const result = await response.json();

                // 4. Sembunyikan loading
                document.getElementById('loading-message').style.display = 'none';

                if (result.status === 'success' && result.data.nodes.length > 1) { // Lebih dari 1 node (target + setidaknya 1 source)
                    simulateAndDrawGraph(result.data);
                } else {
                    document.getElementById('graph-container').innerHTML = `<div class="alert alert-info mt-3">Arsip ini tidak menerima tautan masuk (in-link) dari arsip lain di database, sehingga tidak ada Graf Otoritas yang dapat ditampilkan.</div>`;
                }

            } catch (error) {
                console.error("Gagal mengambil data graf:", error);
                document.getElementById('loading-message').style.display = 'none';
                document.getElementById('graph-container').innerHTML = `<div class="alert alert-danger mt-3">Gagal memuat data graf: ${error.message}. Cek log PHP server.</div>`;
            }
        }

        // --- FUNGSI D3.JS MENGGUNAKAN DATA NYATA ---
        function simulateAndDrawGraph(graphData) {
            
            const width = 850; 
            const height = 400;

            const svg = d3.select("#graph-container")
                .append("svg")
                .attr("width", '100%')
                .attr("height", height)
                .attr("viewBox", `0 0 ${width} ${height}`); 

            const simulation = d3.forceSimulation(graphData.nodes)
                .force("link", d3.forceLink(graphData.links).id(d => d.id).distance(100))
                .force("charge", d3.forceManyBody().strength(-400))
                .force("center", d3.forceCenter(width / 2, height / 2));

            const link = svg.append("g")
                .attr("class", "links")
                .selectAll("line")
                .data(graphData.links)
                .enter().append("line")
                .attr("stroke-width", d => d.value * 3) /* Bobot Tautan lebih menonjol */
                .attr("stroke", "#999");
            
            // Tambahkan label bobot pada tautan
            const linkLabels = svg.append("g")
                .attr("class", "link-labels")
                .selectAll("text")
                .data(graphData.links)
                .enter().append("text")
                .attr("font-size", 10)
                .attr("fill", "#6c757d")
                .text(d => `Bobot: ${d.value.toFixed(2)}`);


            const node = svg.append("g")
                .attr("class", "nodes")
                .selectAll("circle")
                .data(graphData.nodes)
                .enter().append("circle")
                .attr("r", 10)
                // Penentuan Warna berdasarkan Group: 1=Target, 2=Otoritatif (Biru), 3=Normal (Hijau)
                .attr("fill", d => {
                    if (d.group === 1) return "#dc3545"; // Target: Merah Otoritas
                    if (d.group === 2) return "#007bff"; // Otoritatif: Biru Utama
                    return "#5cb85c"; // Normal: Hijau Sekunder
                })
                .call(d3.drag()
                    .on("start", dragstarted)
                    .on("drag", dragged)
                    .on("end", dragended))
                .on("mouseover", function(event, d) {
                    // Tampilkan tooltip sederhana dengan nama arsip
                    d3.select(this).attr("r", 14);
                })
                .on("mouseout", function() {
                    d3.select(this).attr("r", 10);
                });
            
            // Tambahkan label teks
            const labels = svg.append("g")
                .attr("class", "labels")
                .selectAll("text")
                .data(graphData.nodes)
                .enter().append("text")
                .attr("dx", 12)
                .attr("dy", ".35em")
                .text(d => d.name);

            simulation.on("tick", () => {
                link
                    .attr("x1", d => d.source.x)
                    .attr("y1", d => d.source.y)
                    .attr("x2", d => d.target.x)
                    .attr("y2", d => d.target.y);
                
                linkLabels
                    .attr("x", d => (d.source.x + d.target.x) / 2)
                    .attr("y", d => (d.source.y + d.target.y) / 2 - 5); /* Di tengah garis */


                node
                    .attr("cx", d => d.x)
                    .attr("cy", d => d.y);
                    
                labels
                    .attr("x", d => d.x)
                    .attr("y", d => d.y);
            });

            // Drag functions (standard D3)
            function dragstarted(event, d) {
                if (!event.active) simulation.alphaTarget(0.3).restart();
                d.fx = d.x;
                d.fy = d.y;
            }

            function dragged(event, d) {
                d.fx = event.x;
                d.fy = event.y;
            }

            function dragended(event, d) {
                if (!event.active) simulation.alphaTarget(0);
                d.fx = null;
                d.fy = null;
            }
        }
    </script>
</body>
</html>