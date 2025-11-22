<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hasil Pencarian: <?= esc($keyword) ?> | Nusantara Rank</title>
    <!-- Import D3.js untuk Visualisasi Graf (paling umum digunakan) -->
    <script src="https://d3js.org/d3.v7.min.js"></script> 
    <style>
        /* CSS dasar untuk hasil pencarian */
        body { font-family: Arial, sans-serif; margin: 20px; background-color: #f4f4f9; }
        .container { max-width: 1000px; margin: auto; padding: 30px; }
        .result-item { background: #fff; border: 1px solid #ddd; padding: 15px; margin-bottom: 15px; border-radius: 6px; position: relative; }
        .result-title { font-size: 1.2em; color: #1a0dab; margin-bottom: 5px; }
        .result-link { color: #006621; font-size: 0.9em; margin-bottom: 8px; display: block; }
        .pagerank-score { font-weight: bold; color: #b31412; font-size: 0.9em; position: absolute; top: 15px; right: 15px; }
        .visualize-btn { background: #6f42c1; color: white; border: none; padding: 5px 10px; border-radius: 3px; cursor: pointer; font-size: 0.8em; margin-top: 10px; }
        /* Style untuk Modal Visualisasi */
        .modal { display: none; position: fixed; z-index: 1000; left: 0; top: 0; width: 100%; height: 100%; overflow: auto; background-color: rgba(0,0,0,0.4); }
        .modal-content { background-color: #fefefe; margin: 10% auto; padding: 20px; border: 1px solid #888; width: 80%; border-radius: 8px; }
        .close-btn { color: #aaa; float: right; font-size: 28px; font-weight: bold; }
        .close-btn:hover, .close-btn:focus { color: #000; text_decoration: none; cursor: pointer; }
        #graph-container { height: 400px; border: 1px solid #eee; margin-top: 15px; }
        .filter-group { display: flex; gap: 10px; flex-wrap: wrap; }
        .filter-group select { padding: 8px; border-radius: 4px; border: 1px solid #ccc; }
    </style>
</head>
<body>
    <div class="container">
        <h1>Hasil Pencarian Budaya untuk: "<?= esc($keyword) ?>"</h1>
        <p>Menampilkan <?= count($results) ?> sumber yang diurutkan berdasarkan <strong>Cultural PageRank Score</strong>.</p>
        
        <!-- FORM FILTER ULANG  -->
        <form method="post" action="<?= base_url('search/results') ?>" class="filter-group">
            <!-- Input Keyword Tersembunyi (Agar pencarian tetap berdasarkan keyword awal) -->
            <input type="hidden" name="keyword" value="<?= esc($keyword) ?>">
            
            <!-- Filter Kategori -->
            <select name="category" onchange="this.form.submit()">
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
            <select name="wilayah" onchange="this.form.submit()">
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
        <hr>

        <?php if (!empty($results)): ?>
            <?php foreach ($results as $item): ?>
                <div class="result-item">
                    <div class="pagerank-score">Skor Otoritas: <?= number_format($item['skor_pagerank'], 8) ?></div>
                    <a href="<?= esc($item['link_arsip']) ?>" target="_blank" class="result-title"><?= esc($item['nama_budaya']) ?></a>
                    <span class="result-link"><?= esc($item['link_arsip']) ?></span>
                    <p><?= esc(substr($item['deskripsi'], 0, 150)) . '...' ?></p>
                    <p>
                        <small>Wilayah: <?= esc($item['wilayah_asal']) ?> | Jenis: <?= esc($item['jenis_budaya']) ?></small>
                    </p>
                    
                    <!-- FITUR UNGGULAN: Tombol Visualisasi Graf Otoritas -->
                    <!-- Di implementasi nyata, ID Arsip ini akan dikirim untuk mengambil data links_graph -->
                    <button class="visualize-btn" onclick="openModal(<?= esc($item['id']) ?>, '<?= esc($item['nama_budaya']) ?>')">
                        ✨ Lihat Graf Otoritas
                    </button>
                </div>
            <?php endforeach; ?>
        <?php else: ?>
            <p>Maaf, tidak ditemukan arsip budaya terkait dengan kata kunci "<?= esc($keyword) ?>" dan filter yang dipilih.</p>
        <?php endif; ?>
    </div>

    <!-- MODAL UNTUK VISUALISASI GRAF -->
    <div id="visualizationModal" class="modal">
        <div class="modal-content">
            <span class="close-btn" onclick="closeModal()">&times;</span>
            <h2>Visualisasi Graf Otoritas (<span id="modal-title"></span>)</h2>
            <p>Graf ini menunjukkan tautan masuk (inbound links) dari sumber lain yang membentuk skor PageRank.</p>
            <div id="graph-container">
                <!-- SVG/Canvas untuk Graf akan dirender di sini oleh D3.js -->
            </div>
        </div>
    </div>

    <!-- SCRIPT JAVASCRIPT & D3.js -->
    <script>
        function openModal(nodeId, title) {
            document.getElementById('modal-title').innerText = title;
            document.getElementById('visualizationModal').style.display = 'block';
            
            // Panggil fungsi untuk menggambar graf
            // CATATAN: Ini adalah SIMULASI D3.js. Di implementasi akhir,
            // data graf harus diambil melalui AJAX/API berdasarkan nodeId.
            simulateAndDrawGraph(nodeId);
        }

        function closeModal() {
            document.getElementById('visualizationModal').style.display = 'none';
            // Bersihkan kontainer graf saat ditutup
            d3.select("#graph-container").selectAll("*").remove(); 
        }

        // --- SIMULASI D3.JS FORCE-DIRECTED GRAPH ---
        function simulateAndDrawGraph(nodeId) {
            
            // --- DATA SIMULASI (AKAN DIGANTI DENGAN FETCH API LINKS_GRAPH) ---
            const graphData = {
                nodes: [
                    { id: nodeId, name: 'Target Arsip (' + nodeId + ')', group: 1, type: 'Target' },
                    { id: 101, name: 'UNESCO Laporan (Otoritatif)', group: 2, type: 'Source' },
                    { id: 102, name: 'Arsip Lain', group: 3, type: 'Source' },
                    { id: 103, name: 'Jurnal Studi Budaya', group: 2, type: 'Source' },
                ],
                links: [
                    // Contoh link: Node 101 menautkan ke node yang diklik (nodeId)
                    { source: 101, target: nodeId, value: 1.3, label: 'Bobot Tinggi (1.3)' }, 
                    { source: 102, target: nodeId, value: 1.0, label: 'Bobot Normal (1.0)' }, 
                    { source: 103, target: nodeId, value: 1.2, label: 'Bobot Sedang (1.2)' } 
                ]
            };
            // ------------------------------------------------------------------

            const width = 800;
            const height = 400;

            const svg = d3.select("#graph-container")
                .append("svg")
                .attr("width", width)
                .attr("height", height);

            const simulation = d3.forceSimulation(graphData.nodes)
                .force("link", d3.forceLink(graphData.links).id(d => d.id).distance(100))
                .force("charge", d3.forceManyBody().strength(-400))
                .force("center", d3.forceCenter(width / 2, height / 2));

            const link = svg.append("g")
                .attr("class", "links")
                .selectAll("line")
                .data(graphData.links)
                .enter().append("line")
                .attr("stroke-width", d => d.value * 2) // Visualisasi bobot
                .attr("stroke", "#999");

            const node = svg.append("g")
                .attr("class", "nodes")
                .selectAll("circle")
                .data(graphData.nodes)
                .enter().append("circle")
                .attr("r", 10)
                .attr("fill", d => d.type === 'Target' ? "#b31412" : (d.group === 2 ? "#007bff" : "#5cb85c")) // Merah untuk target, Biru/Hijau untuk sumber
                .call(d3.drag()
                    .on("start", dragstarted)
                    .on("drag", dragged)
                    .on("end", dragended));
            
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
        
        // Panggil fungsi saat modal ditutup
        window.onclick = function(event) {
            if (event.target == document.getElementById('visualizationModal')) {
                closeModal();
            }
        }
    </script>
</body>
</html>