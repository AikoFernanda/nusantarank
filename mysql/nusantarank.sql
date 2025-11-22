-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Waktu pembuatan: 22 Nov 2025 pada 20.02
-- Versi server: 5.7.39
-- Versi PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `nusantarank`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `arsip_budaya`
--

CREATE TABLE `arsip_budaya` (
  `id` int(11) NOT NULL,
  `nama_budaya` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `wilayah_asal` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `jenis_budaya` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sumber_data` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tahun_pencatatan` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deskripsi` text COLLATE utf8mb4_unicode_ci,
  `link_arsip` text COLLATE utf8mb4_unicode_ci,
  `skor_pagerank` decimal(10,8) NOT NULL DEFAULT '0.00000000',
  `is_otoritatif` tinyint(1) NOT NULL DEFAULT '0',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `arsip_budaya`
--

INSERT INTO `arsip_budaya` (`id`, `nama_budaya`, `wilayah_asal`, `jenis_budaya`, `sumber_data`, `tahun_pencatatan`, `deskripsi`, `link_arsip`, `skor_pagerank`, `is_otoritatif`, `updated_at`) VALUES
(1, 'Bahasa Tandia', 'Papua Barat', 'Bahasa dan Sastra', 'Data Kemendikbudristek', '2022', 'Salah satu bahasa daerah yang telah dinyatakan punah. Dokumentasi terakhir menunjukkan sangat sedikit data yang tersisa.', 'https://id.wikipedia.org/wiki/Bahasa_Tandia', '0.00775169', 1, '2025-11-22 19:59:33'),
(2, 'Bahasa Hoti', 'Pulau Seram, Maluku', 'Bahasa dan Sastra', 'Data Kemendikbudristek', '2022', 'Salah satu dari 11 bahasa daerah di Maluku yang telah dinyatakan punah. Bagian dari rumpun bahasa Seram.', 'https://id.wikipedia.org/wiki/Bahasa_Hoti', '0.00775169', 1, '2025-11-22 19:59:33'),
(3, 'Tari Srandul Kuno (Era 1920-an)', 'Yogyakarta/Jawa Tengah', 'Seni Pertunjukan', 'Jurnal Javanologi UNS', '1920', 'Drama tari kerakyatan yang bernafaskan Islam dan terbentuk sekitar tahun 1920-an. Sangat jarang dipentaskan dalam format aslinya.', 'https://javanologi.uns.ac.id/2022/11/28/javanologi-explore-kesenian-jawa-srandul/', '0.00775169', 1, '2025-11-22 19:59:33'),
(4, 'Bahasa Ponosakan', 'Minahasa, Sulawesi Utara', 'Bahasa dan Sastra', 'Balai Bahasa Sulut', '2015', 'Bahasa daerah yang sangat terancam punah. Hanya tersisa sedikit penutur, dan sedang diupayakan pelestariannya.', 'https://id.wikipedia.org/wiki/Bahasa_Ponosakan', '0.00775169', 1, '2025-11-22 19:59:33'),
(5, 'Ritual Manene', 'Tana Toraja, Sulawesi Selatan', 'Adat dan Ritual', 'Laporan Budaya Toraja', '1980', 'Ritual membersihkan jenazah leluhur. Praktiknya terancam hilang seiring modernisasi dan berkurangnya pemegang adat.', 'https://id.wikipedia.org/wiki/Ma%27nene', '0.00775169', 0, '2025-11-22 19:59:33'),
(6, 'Bahasa Duriankere', 'Papua Barat', 'Bahasa dan Sastra', 'Linguistik Internasional', '1998', 'Bahasa dari Semenanjung Kepala Burung yang berstatus Kritis (sangat terancam punah). Penutur aslinya tersisa sangat sedikit.', 'https://id.wikipedia.org/wiki/Daftar_bahasa_terancam_di_Indonesia', '0.01434063', 0, '2025-11-22 19:59:33'),
(7, 'Teknik Pewarnaan Kain Ikat Sumba', 'Sumba Timur', 'Kerajinan dan Tekstil', 'Kajian Tekstil Indonesia', '1975', 'Metode pewarnaan alami yang rumit untuk menghasilkan motif spesifik pada Kain Ikat Sumba. Sulit ditemukan dan jarang diajarkan.', 'https://id.wikipedia.org/wiki/Kain_Ikat_Sumba', '0.00775169', 0, '2025-11-22 19:59:33'),
(8, 'Tradisi Lisan Madihin Melayu Kuno', 'Kalimantan Selatan', 'Sastra Lisan', 'Pusat Studi Melayu', '1965', 'Bentuk syair berantai spontan yang dibawakan dalam bahasa Melayu kuno. Sering digunakan dalam ritual adat.', 'https://id.wikipedia.org/wiki/Madihin', '0.00775169', 0, '2025-11-22 19:59:33'),
(9, 'Topeng Lengger Lanang', 'Banyumas, Jawa Tengah', 'Seni Pertunjukan', 'Arsip Budaya Jateng', '1970', 'Tari topeng dengan penari laki-laki (lanang). Sempat dilarang dan terancam punah, kini mulai direvitalisasi.', 'https://id.wikipedia.org/wiki/Lengger', '0.01434063', 0, '2025-11-22 19:59:33'),
(10, 'Sistem Irigasi Subak Kuno', 'Bali', 'Adat dan Ritual', 'Laporan UNESCO', '1950', 'Sistem irigasi tradisional Bali yang merupakan manifestasi filosofi Tri Hita Karana. Terancam oleh konversi lahan.', 'https://id.wikipedia.org/wiki/Subak', '0.00775169', 1, '2025-11-22 19:59:33'),
(11, 'Naskah Kuno Batak (Pustaha)', 'Tapanuli Utara', 'Sastra Kuno', 'Arsip Pemerintah Daerah', '1945', 'Ritual tahunan untuk menyucikan kitab kuno (Pustaha). Minim regenerasi pemegang adat.', 'https://id.wikipedia.org/wiki/Pustaha', '0.00775169', 1, '2025-11-22 19:59:33'),
(12, 'Bahasa Pagu Kuno', 'Halmahera Utara, Maluku Utara', 'Bahasa dan Sastra', 'Pusat Kajian Bahasa', '2005', 'Dialek bahasa Pagu yang memiliki penutur kritis (kurang dari 100 orang).', 'https://id.wikipedia.org/wiki/Bahasa_Pagu', '0.00775169', 1, '2025-11-22 19:59:33'),
(13, 'Permainan Gasing Melayu Tua', 'Kepulauan Riau', 'Permainan Tradisional', 'Komunitas Gasing Riau', '1985', 'Teknik dan jenis gasing kuno yang berbeda dari yang dimainkan sekarang. Tergantikan oleh permainan digital.', 'https://id.wikipedia.org/wiki/Gasing', '0.00775169', 0, '2025-11-22 19:59:33'),
(14, 'Ritual Belian Bawo', 'Kutai, Kalimantan Timur', 'Adat dan Ritual', 'Dokumentasi Kerajaan Kutai', '1930', 'Ritual penyembuhan dan tolak bala yang sangat sakral, kini jarang dilakukan dan terancam hilang.', 'https://id.wikipedia.org/wiki/Belian_Bawo', '0.00775169', 0, '2025-11-22 19:59:33'),
(15, 'Tenun Kerek Kuno', 'Jawa Tengah', 'Kerajinan dan Tekstil', 'Museum Batik Indonesia', '1960', 'Teknik tenun menggunakan alat kerek tradisional. Proses pembuatan sangat lambat, digantikan mesin.', 'https://id.wikipedia.org/wiki/Tenun', '0.00775169', 1, '2025-11-22 19:59:33'),
(16, 'Seni Ukir Asmat Tradisional', 'Asmat, Papua Selatan', 'Seni Rupa', 'Yayasan Budaya Asmat', '1978', 'Motif ukiran yang sangat spesifik untuk ritual kematian. Saat ini banyak motif yang dibuat hanya untuk komersial.', 'https://id.wikipedia.org/wiki/Asmat', '0.01434063', 0, '2025-11-22 19:59:33'),
(17, 'Bahasa Wamesa Dialek Utara', 'Papua Barat', 'Bahasa dan Sastra', 'Lembaga Bahasa Papua', '2010', 'Dialek bahasa Wamesa yang terancam punah karena penutur beralih ke Bahasa Indonesia.', 'https://id.wikipedia.org/wiki/Bahasa_Wamesa', '0.00775169', 1, '2025-11-22 19:59:33'),
(18, 'Wayang Beber Kuno', 'Pacitan, Jawa Timur', 'Seni Pertunjukan', 'Pusat Studi Wayang', '1900', 'Wayang tertua yang narasi dan musiknya sudah jarang dipahami oleh dalang muda.', 'https://id.wikipedia.org/wiki/Wayang_beber', '0.00775169', 0, '2025-11-22 19:59:33'),
(19, 'Sistem Kalender Adat Marapu', 'Sumba', 'Adat dan Ritual', 'Riset Antropologi Sumba', '1955', 'Sistem penentuan hari baik/buruk untuk pertanian dan ritual yang hanya dikuasai oleh Rato Adat.', 'https://id.wikipedia.org/wiki/Marapu', '0.00775169', 0, '2025-11-22 19:59:33'),
(20, 'Teknik Pembuatan Gerabah Pundung', 'Pundung, Yogyakarta', 'Kerajinan dan Tekstil', 'Sentra Gerabah Pundung', '1988', 'Teknik pembakaran gerabah secara tradisional yang kini kalah saing dengan produksi modern.', 'https://id.wikipedia.org/wiki/Gerabah', '0.00775169', 0, '2025-11-22 19:59:33'),
(21, 'Tari Topeng Cirebon Gaya Losari', 'Cirebon', 'Seni Pertunjukan', 'Sanggar Tari Cirebon', '1950', 'Gaya tari topeng Cirebon yang paling tua dan ekspresif. Terancam punah karena kurangnya regenerasi.', 'https://id.wikipedia.org/wiki/Tari_Topeng_Cirebon', '0.00775169', 0, '2025-11-22 19:59:33'),
(22, 'Bahasa Lishoun', 'Alor, NTT', 'Bahasa dan Sastra', 'Linguistik Indonesia Timur', '2008', 'Bahasa Alor yang diklasifikasikan sebagai bahasa yang sedang berjuang (Endangered).', 'https://id.wikipedia.org/wiki/Bahasa_Lishoun', '0.00775169', 0, '2025-11-22 19:59:33'),
(23, 'Ritual Kematian Ma’padong', 'Tana Toraja', 'Adat dan Ritual', 'Kajian Adat Toraja', '1970', 'Ritual pemakaman tradisional yang berdurasi panjang, mulai dipersingkat karena alasan biaya dan modernitas.', 'https://id.wikipedia.org/wiki/Rambu_Solo', '0.01434063', 0, '2025-11-22 19:59:33'),
(24, 'Batik Tulis Motif Klasik (Garis Abadi)', 'Pekalongan, Jawa Tengah', 'Kerajinan dan Tekstil', 'Museum Batik Pekalongan', '1962', 'Motif batik yang sangat rumit dan membutuhkan ketelitian tinggi, pembuatnya tersisa sedikit.', 'https://id.wikipedia.org/wiki/Batik_Pekalongan', '0.00775169', 0, '2025-11-22 19:59:33'),
(25, 'Musik Gambang Kromong Kuno', 'Jakarta', 'Seni Musik', 'Pusat Kesenian Jakarta', '1935', 'Musik Gambang Kromong dengan aransemen dan instrumen era sebelum kemerdekaan. Nadanya berbeda dari versi modern.', 'https://id.wikipedia.org/wiki/Gambang_Kromong', '0.00775169', 0, '2025-11-22 19:59:33'),
(26, 'Bahasa Kisar', 'Pulau Kisar, Maluku Barat Daya', 'Bahasa dan Sastra', 'Linguistik Maluku', '1990', 'Bahasa Austronesia yang penuturnya mulai beralih ke bahasa Melayu Ambon.', 'https://id.wikipedia.org/wiki/Bahasa_Kisar', '0.00775169', 0, '2025-11-22 19:59:33'),
(27, 'Permainan Tradisional Benteng', 'Jawa Barat', 'Permainan Tradisional', 'Komunitas Permainan Anak', '1992', 'Permainan fisik dan strategi anak-anak yang kini jarang dimainkan di perkotaan.', 'https://id.wikipedia.org/wiki/Bentengan', '0.01434063', 0, '2025-11-22 19:59:33'),
(28, 'Seni Bela Diri Silek Tuo', 'Minangkabau, Sumatera Barat', 'Adat dan Ritual', 'Perguruan Silek Tua', '1950', 'Aliran silat tertua yang gerakannya sangat halus dan filosofis, jarang dipraktikkan karena fokus pada silat prestasi.', 'https://id.wikipedia.org/wiki/Silek_Minangkabau', '0.00775169', 0, '2025-11-22 19:59:33'),
(29, 'Naskah Kidung Sunda Kuno', 'Jawa Barat', 'Sastra Kuno', 'Koleksi Perpustakaan Nasional', '1900', 'Naskah kidung berbahasa Sunda kuno yang menceritakan sejarah Pajajaran.', 'https://id.wikipedia.org/wiki/Kidung_Sunda', '0.01434063', 1, '2025-11-22 19:59:33'),
(30, 'Rumah Adat Uma Mbatangu', 'Sumba Timur', 'Arsitektur', 'Riset Budaya NTT', '1968', 'Model rumah adat Sumba yang terancam punah karena konstruksi modern lebih disukai.', 'https://id.wikipedia.org/wiki/Arsitektur_Sumba', '0.00775169', 0, '2025-11-22 19:59:33'),
(31, 'Bahasa Kupang Dialek Darat', 'NTT', 'Bahasa dan Sastra', 'Linguistik NTT', '2003', 'Dialek bahasa Kupang yang hanya dituturkan di area pedalaman tertentu, penutur berkurang drastis.', 'https://id.wikipedia.org/wiki/Bahasa_Kupang', '0.00775169', 0, '2025-11-22 19:59:33'),
(32, 'Upacara Perkawinan Adat Mandailing Kuno', 'Sumatera Utara', 'Adat dan Ritual', 'Dokumentasi Adat', '1975', 'Serangkaian ritual perkawinan yang panjang dan sakral, banyak yang sudah dipersingkat atau dihilangkan.', 'https://id.wikipedia.org/wiki/Mandailing', '0.00775169', 0, '2025-11-22 19:59:33'),
(33, 'Tari Saman Asli (Hanya Laki-laki)', 'Aceh', 'Seni Pertunjukan', 'Pusat Studi Tari Aceh', '1960', 'Tari Saman yang benar-benar asli (hanya ditarikan oleh laki-laki) dan biasanya untuk ritual, bukan pementasan massal.', 'https://id.wikipedia.org/wiki/Tari_Saman', '0.01434063', 1, '2025-11-22 19:59:33'),
(34, 'Kerajinan Logam Bima Kuno', 'Sumbawa, NTB', 'Kerajinan dan Tekstil', 'Museum NTB', '1958', 'Teknik peleburan dan ukiran logam tradisional yang rumit, hanya dikuasai oleh pengrajin senior.', 'https://id.wikipedia.org/wiki/Bima', '0.00775169', 1, '2025-11-22 19:59:33'),
(35, 'Alat Musik Sasando Gong', 'Rote, NTT', 'Seni Musik', 'Dokumentasi Musik NTT', '1930', 'Jenis Sasando yang lebih tua dengan resonator dari pelepah daun lontar, kini digantikan Sasando modern.', 'https://id.wikipedia.org/wiki/Sasando', '0.00775169', 0, '2025-11-22 19:59:33'),
(36, 'Bahasa Abui', 'Alor, NTT', 'Bahasa dan Sastra', 'Linguistik Alor', '2012', 'Salah satu bahasa di Alor yang terancam punah karena kontak dengan bahasa luar.', 'https://id.wikipedia.org/wiki/Bahasa_Abui', '0.01434063', 0, '2025-11-22 19:59:33'),
(37, 'Seni Pertunjukan Sandiwara Cirebon', 'Cirebon', 'Seni Pertunjukan', 'Pusat Kesenian Cirebon', '1940', 'Bentuk drama rakyat dengan unsur komedi dan kritik sosial, kini tergeser sinetron.', 'https://id.wikipedia.org/wiki/Sandiwara', '0.00775169', 1, '2025-11-22 19:59:33'),
(38, 'Permainan Congklak Tradisional', 'Jawa', 'Permainan Tradisional', 'Komunitas Permainan', '1980', 'Model dan aturan bermain congklak yang bervariasi antar daerah, kini distandarisasi.', 'https://id.wikipedia.org/wiki/Congklak', '0.01434063', 0, '2025-11-22 19:59:33'),
(39, 'Teknik Melukis Kaca Cirebon', 'Cirebon', 'Seni Rupa', 'Sentra Kerajinan Cirebon', '1977', 'Teknik melukis terbalik pada media kaca dengan motif Wayang, mulai jarang dipraktikkan.', 'https://id.wikipedia.org/wiki/Lukisan_kaca', '0.00775169', 0, '2025-11-22 19:59:33'),
(40, 'Ritual Bau Nyale Kuno', 'Lombok, NTB', 'Adat dan Ritual', 'Kajian Adat Sasak', '1955', 'Ritual penangkapan cacing laut yang dikaitkan dengan legenda Putri Mandalika. Praktik adatnya terancam hilang akibat pariwisata.', 'https://id.wikipedia.org/wiki/Bau_Nyale', '0.00775169', 0, '2025-11-22 19:59:33'),
(41, 'Bahasa Salar', 'Sulawesi Selatan', 'Bahasa dan Sastra', 'Linguistik Sulsel', '2009', 'Bahasa yang memiliki sedikit penutur, terancam punah karena migrasi dan perkawinan campur.', 'https://id.wikipedia.org/wiki/Daftar_bahasa_terancam_di_Indonesia', '0.00775169', 0, '2025-11-22 19:59:33'),
(42, 'Tari Zapin Api', 'Riau', 'Seni Pertunjukan', 'Pusat Studi Tari Melayu', '1965', 'Tarian ritual yang melibatkan api, terancam punah karena dianggap berbahaya dan mistis.', 'https://id.wikipedia.org/wiki/Tari_Zapin', '0.01434063', 0, '2025-11-22 19:59:33'),
(43, 'Naskah Hikayat Aceh Kuno', 'Aceh', 'Sastra Kuno', 'Koleksi Museum Aceh', '1910', 'Naskah sejarah Aceh yang menggunakan aksara Jawi, sulit dibaca oleh generasi muda.', 'https://id.wikipedia.org/wiki/Hikayat', '0.00775169', 1, '2025-11-22 19:59:33'),
(44, 'Seni Ukir Pintu Gerbang Jawa Kuno', 'Jawa Tengah', 'Seni Rupa', 'Arsitektur Jawa', '1925', 'Motif ukiran pintu gerbang yang sangat rumit dan memiliki makna filosofis mendalam.', 'https://id.wikipedia.org/wiki/Seni_ukir', '0.01434063', 0, '2025-11-22 19:59:33'),
(45, 'Bahasa Mairasi', 'Papua Barat', 'Bahasa dan Sastra', 'Linguistik Papua', '2018', 'Bahasa di daerah Kaimana yang termasuk dalam kategori kritis terancam punah.', 'https://id.wikipedia.org/wiki/Daftar_bahasa_terancam_di_Indonesia', '0.00775169', 0, '2025-11-22 19:59:33'),
(46, 'Alat Musik Serunai', 'Melayu', 'Seni Musik', 'Pusat Seni Melayu', '1950', 'Instrumen musik tiup tradisional yang kurang populer dibandingkan alat musik modern.', 'https://id.wikipedia.org/wiki/Serunai', '0.01434063', 0, '2025-11-22 19:59:33'),
(47, 'Permainan Rakyat Adu Jangkrik', 'Jawa Timur', 'Permainan Tradisional', 'Komunitas Jangkrik', '1982', 'Permainan adu jangkrik dengan ritual dan aturan yang ketat, kini dianggap hiburan biasa.', 'https://id.wikipedia.org/wiki/Adu_jangkrik', '0.00775169', 0, '2025-11-22 19:59:33'),
(48, 'Tradisi Lisan Pamangku', 'Bali', 'Adat dan Ritual', 'Riset Adat Bali', '1967', 'Tradisi menceritakan sejarah desa oleh pemangku (pemimpin ritual), kini jarang dilakukan.', 'https://id.wikipedia.org/wiki/Pamangku', '0.02470173', 0, '2025-11-22 19:59:33'),
(49, 'Kerajinan Perak Kota Gede Kuno', 'Yogyakarta', 'Kerajinan dan Tekstil', 'Sentra Perak Kotagede', '1930', 'Teknik pembuatan perhiasan perak dengan motif klasik yang sangat detail, butuh regenerasi.', 'https://id.wikipedia.org/wiki/Kotagede', '0.01434063', 0, '2025-11-22 19:59:33'),
(50, 'Bahasa Muna Dialek Siompu', 'Muna, Sulawesi Tenggara', 'Bahasa dan Sastra', 'Linguistik Muna', '2007', 'Dialek bahasa Muna yang terancam punah karena interaksi dengan dialek yang lebih dominan.', 'https://id.wikipedia.org/wiki/Bahasa_Muna', '0.00775169', 0, '2025-11-22 19:59:33'),
(51, 'Tari Topeng Endel (Betawi)', 'Jakarta', 'Seni Pertunjukan', 'Sanggar Betawi', '1970', 'Tari topeng Betawi yang bersifat komedi dan improvisasi, kurang diminati penari muda.', 'https://id.wikipedia.org/wiki/Tari_Topeng_Betawi', '0.00775169', 0, '2025-11-22 19:59:33'),
(52, 'Upacara Adat Erau Kuno', 'Kutai, Kalimantan Timur', 'Adat dan Ritual', 'Dokumentasi Kerajaan Kutai', '1948', 'Upacara adat Erau yang lebih sakral dan panjang, banyak ritual yang dipersingkat.', 'https://id.wikipedia.org/wiki/Erau', '0.01434063', 0, '2025-11-22 19:59:33'),
(53, 'Naskah Lontar Usada Bali Tua', 'Bali', 'Sastra Kuno', 'Koleksi Pustaka Lontar', '1905', 'Naskah pengobatan tradisional tertua yang rentan rusak, belum semua didigitalisasi.', 'https://id.wikipedia.org/wiki/Usada', '0.01434063', 1, '2025-11-22 19:59:33'),
(54, 'Permainan Tradisional Patok Lele', 'Jawa Barat', 'Permainan Tradisional', 'Komunitas Permainan Anak', '1990', 'Permainan anak menggunakan tongkat dan potongan kayu, sulit dimainkan di area perkotaan.', 'https://id.wikipedia.org/wiki/Patok_lele', '0.00775169', 0, '2025-11-22 19:59:33'),
(55, 'Musik Karawitan Jawa Gaya Lama', 'Solo/Yogyakarta', 'Seni Musik', 'Pusat Karawitan Jawa', '1935', 'Gaya musikal karawitan yang lebih lambat dan meditatif, berbeda dari versi modern yang energik.', 'https://id.wikipedia.org/wiki/Karawitan', '0.00775169', 1, '2025-11-22 19:59:33'),
(56, 'Bahasa Mapia', 'Papua', 'Bahasa dan Sastra', 'Linguistik Papua', '2000', 'Bahasa yang hampir punah, penutur tersisa sedikit di Pulau Mapia.', 'https://id.wikipedia.org/wiki/Bahasa_Mapia', '0.00775169', 0, '2025-11-22 19:59:33'),
(57, 'Ritual Merarik (Sasak Kuno)', 'Lombok, NTB', 'Adat dan Ritual', 'Kajian Adat Sasak', '1960', 'Tata cara kawin lari Sasak yang ketat dan sakral, banyak yang dipermudah saat ini.', 'https://id.wikipedia.org/wiki/Suku_Sasak', '0.01434063', 0, '2025-11-22 19:59:33'),
(58, 'Kerajinan Tenun Rangrang Tua', 'Nusa Penida, Bali', 'Kerajinan dan Tekstil', 'Sentra Tenun Bali', '1972', 'Teknik tenun Rangrang yang menggunakan pewarna alami dan motif kuno, prosesnya sangat lama.', 'https://id.wikipedia.org/wiki/Tenun_Bali', '0.01434063', 0, '2025-11-22 19:59:33'),
(59, 'Bahasa Arandai', 'Papua Barat', 'Bahasa dan Sastra', 'Linguistik Papua', '2015', 'Bahasa yang termasuk dalam kategori kritis terancam punah di Kepala Burung.', 'https://id.wikipedia.org/wiki/Daftar_bahasa_terancam_di_Indonesia', '0.00775169', 0, '2025-11-22 19:59:33'),
(60, 'Seni Ukir Kayu Samin', 'Blora, Jawa Tengah', 'Seni Rupa', 'Komunitas Samin', '1955', 'Motif ukiran yang mencerminkan filosofi Samin (anti-modernisasi), sulit ditemukan.', 'https://id.wikipedia.org/wiki/Samin', '0.00775169', 0, '2025-11-22 19:59:33'),
(61, 'Tari Sekapur Sirih Kuno', 'Jambi/Riau', 'Seni Pertunjukan', 'Pusat Studi Tari Melayu', '1940', 'Gerakan Tari Sekapur Sirih yang lebih ritualistik dan formal, berbeda dari versi penyambutan modern.', 'https://id.wikipedia.org/wiki/Tari_Sekapur_Sirih', '0.00775169', 0, '2025-11-22 19:59:33'),
(62, 'Permainan Rakyat Egrang Bambu', 'Jawa', 'Permainan Tradisional', 'Komunitas Permainan', '1987', 'Permainan berjalan menggunakan bambu tinggi. Tergeser oleh permainan digital.', 'https://id.wikipedia.org/wiki/Egrang', '0.01434063', 0, '2025-11-22 19:59:33'),
(63, 'Bahasa Tambora', 'Pulau Sumbawa, NTB', 'Bahasa dan Sastra', 'Linguistik NTB', '1815', 'Bahasa yang punah akibat letusan Gunung Tambora (1815), hanya tersisa sedikit kata.', 'https://id.wikipedia.org/wiki/Bahasa_Tambora', '0.00775169', 0, '2025-11-22 19:59:33'),
(64, 'Upacara Adat Kebo-keboan', 'Banyuwangi, Jawa Timur', 'Adat dan Ritual', 'Dokumentasi Adat', '1965', 'Ritual memohon kesuburan sawah yang melibatkan manusia berpakaian kerbau, terancam karena lahan sawah berkurang.', 'https://id.wikipedia.org/wiki/Kebo-keboan', '0.00775169', 0, '2025-11-22 19:59:33'),
(65, 'Naskah Serat Centhini Kuno', 'Jawa Tengah', 'Sastra Kuno', 'Koleksi Perpustakaan', '1912', 'Naskah sastra Jawa yang sangat panjang dan komprehensif. Perlu digitalisasi total.', 'https://id.wikipedia.org/wiki/Serat_Centhini', '0.01434063', 1, '2025-11-22 19:59:33'),
(66, 'Musik Keroncong Tugu', 'Jakarta Utara', 'Seni Musik', 'Komunitas Keroncong', '1930', 'Aliran Keroncong tertua dengan irama Portugis yang otentik. Sulit mencari pemain lama.', 'https://id.wikipedia.org/wiki/Keroncong_Tugu', '0.00775169', 0, '2025-11-22 19:59:33'),
(67, 'Bahasa Irarutu', 'Papua Barat', 'Bahasa dan Sastra', 'Linguistik Papua', '2014', 'Bahasa di sekitar Teluk Bintuni yang terancam punah karena penutur berkurang.', 'https://id.wikipedia.org/wiki/Bahasa_Irarutu', '0.00775169', 0, '2025-11-22 19:59:33'),
(68, 'Naskah Kidung Sunda Teks C', 'Jawa Barat', 'Sastra Kuno', 'Koleksi Museum', '1920', 'Salah satu versi naskah Kidung Sunda yang memiliki detail berbeda dari versi lain.', 'https://id.wikipedia.org/wiki/Kidung_Sunda', '0.00775169', 0, '2025-11-22 19:59:33'),
(69, 'Kerajinan Batik Gajah Oling Kuno', 'Banyuwangi, Jawa Timur', 'Kerajinan dan Tekstil', 'Sentra Batik Banyuwangi', '1970', 'Motif batik paling tua di Banyuwangi dengan makna spiritual yang mendalam.', 'https://id.wikipedia.org/wiki/Batik_Gajah_Oling', '0.01434063', 1, '2025-11-22 19:59:33'),
(70, 'Ritual Pesta Rakyat Zaman Kolonial', 'Jakarta', 'Adat dan Ritual', 'Arsip Kolonial Belanda', '1935', 'Pesta rakyat yang diadakan pada masa kolonial dengan campuran unsur lokal dan Belanda, dokumentasi minim.', 'https://id.wikipedia.org/wiki/Betawi', '0.00775169', 0, '2025-11-22 19:59:33'),
(71, 'Bahasa Kasuweri', 'Papua Barat', 'Bahasa dan Sastra', 'Linguistik Papua', '2019', 'Bahasa yang telah punah dan tidak ada lagi penuturnya yang tersisa.', 'https://id.wikipedia.org/wiki/Daftar_bahasa_terancam_di_Indonesia', '0.00775169', 0, '2025-11-22 19:59:33'),
(72, 'Seni Ukir Toraja Tua (Rambu Tuka)', 'Tana Toraja', 'Seni Rupa', 'Museum Toraja', '1945', 'Motif ukiran yang spesifik digunakan pada ritual Rambu Tuka (syukuran), jarang dibuat saat ini.', 'https://id.wikipedia.org/wiki/Toraja', '0.00775169', 0, '2025-11-22 19:59:33'),
(73, 'Tari Topeng Sidakarya Kuno', 'Bali', 'Seni Pertunjukan', 'Pusat Studi Tari Bali', '1915', 'Tarian sakral yang wajib dipentaskan pada akhir upacara keagamaan. Teknik aslinya sangat langka.', 'https://id.wikipedia.org/wiki/Tari_Sidakarya', '0.01994122', 1, '2025-11-22 19:59:33'),
(74, 'Permainan Rakyat Dakocan', 'Jawa Barat', 'Permainan Tradisional', 'Komunitas Permainan Anak', '1985', 'Permainan menggunakan boneka kecil dan kartu, terancam karena beralih ke mainan impor.', 'https://id.wikipedia.org/wiki/Dakocan', '0.00775169', 0, '2025-11-22 19:59:33'),
(75, 'Bahasa Wolani', 'Papua', 'Bahasa dan Sastra', 'Linguistik Papua', '2017', 'Bahasa di wilayah Nabire yang terancam punah karena masuknya pengaruh bahasa lain.', 'https://id.wikipedia.org/wiki/Bahasa_Wolani', '0.00775169', 0, '2025-11-22 19:59:33'),
(76, 'Teknik Pembuatan Gamelan Bonang Kuno', 'Jawa Tengah', 'Seni Musik', 'Sentra Gamelan Jawa', '1952', 'Teknik menempa Bonang yang menghasilkan nada spesifik pada gamelan kuno, sulit ditiru.', 'https://id.wikipedia.org/wiki/Bonang', '0.01434063', 1, '2025-11-22 19:59:33'),
(77, 'Ritual Sunat Adat Melayu Tua', 'Riau', 'Adat dan Ritual', 'Dokumentasi Adat Melayu', '1963', 'Ritual sunat yang melibatkan prosesi adat panjang, kini sebagian besar dilakukan secara medis.', 'https://id.wikipedia.org/wiki/Melayu', '0.00775169', 0, '2025-11-22 19:59:33'),
(78, 'Naskah Mantra Jawa Kuno', 'Jawa Timur', 'Sastra Kuno', 'Koleksi Pribadi Budayawan', '1908', 'Kumpulan mantra dan doa berbahasa Jawa Kuno, sulit diterjemahkan dan dibaca.', 'https://id.wikipedia.org/wiki/Jawa_Kuno', '0.01434063', 0, '2025-11-22 19:59:33'),
(79, 'Kerajinan Topi Anyaman Rotan Dayak', 'Kalimantan Barat', 'Kerajinan dan Tekstil', 'Sentra Anyaman Dayak', '1979', 'Teknik anyaman rotan untuk topi adat yang rumit, hanya dikuasai beberapa orang tua.', 'https://id.wikipedia.org/wiki/Suku_Dayak', '0.00775169', 0, '2025-11-22 19:59:33'),
(80, 'Bahasa Nila', 'Maluku', 'Bahasa dan Sastra', 'Linguistik Maluku', '2022', 'Salah satu bahasa di Maluku yang telah dinyatakan punah oleh Kemendikbudristek.', 'https://id.wikipedia.org/wiki/Daftar_bahasa_terancam_di_Indonesia', '0.00775169', 0, '2025-11-22 19:59:33'),
(81, 'Tari Piring Adat (Ritual Asli)', 'Sumatera Barat', 'Seni Pertunjukan', 'Pusat Studi Tari Minang', '1930', 'Tari Piring yang gerakannya lebih sakral dan untuk upacara, bukan hanya atraksi wisata.', 'https://id.wikipedia.org/wiki/Tari_Piring', '0.00775169', 0, '2025-11-22 19:59:33'),
(82, 'Upacara Perkawinan Adat Timor Kuno', 'Timor, NTT', 'Adat dan Ritual', 'Kajian Adat Timor', '1955', 'Prosesi perkawinan adat yang kompleks dan mahal, banyak yang memilih cara modern.', 'https://id.wikipedia.org/wiki/Suku_Timor', '0.01434063', 0, '2025-11-22 19:59:33'),
(83, 'Permainan Tradisional Sepak Raga', 'Melayu', 'Permainan Tradisional', 'Komunitas Sepak Raga', '1970', 'Permainan menendang bola rotan yang kini digantikan sepak takraw modern.', 'https://id.wikipedia.org/wiki/Sepak_raga', '0.00775169', 0, '2025-11-22 19:59:33'),
(84, 'Seni Ukir Patung Leseh', 'Bali', 'Seni Rupa', 'Sentra Ukir Bali', '1962', 'Teknik ukir patung yang dilakukan sambil duduk di lantai (leseh), menghasilkan detail unik.', 'https://id.wikipedia.org/wiki/Seni_ukir', '0.00775169', 0, '2025-11-22 19:59:33'),
(85, 'Bahasa Dampelas', 'Sulawesi Tengah', 'Bahasa dan Sastra', 'Linguistik Sulawesi', '2016', 'Bahasa yang berstatus rentan (Vulnerable), penutur berkurang.', 'https://id.wikipedia.org/wiki/Bahasa_Dampelas', '0.01434063', 0, '2025-11-22 19:59:33'),
(86, 'Naskah Aksara Rejang Kuno', 'Bengkulu', 'Sastra Kuno', 'Koleksi Museum Bengkulu', '1900', 'Naskah dengan aksara Rejang yang hampir punah, hanya bisa dibaca oleh filolog tertentu.', 'https://id.wikipedia.org/wiki/Aksara_Rejang', '0.00775169', 1, '2025-11-22 19:59:33'),
(87, 'Ritual Tabuik Piaman Kuno', 'Pariaman, Sumatera Barat', 'Adat dan Ritual', 'Dokumentasi Tabuik', '1940', 'Ritual mengenang cucu Nabi Muhammad. Praktik aslinya terancam karena adanya perdebatan agama.', 'https://id.wikipedia.org/wiki/Tabuik', '0.01434063', 0, '2025-11-22 19:59:33'),
(88, 'Kerajinan Tembikar Mamasa', 'Sulawesi Barat', 'Kerajinan dan Tekstil', 'Sentra Tembikar Mamasa', '1975', 'Teknik pembuatan tembikar dengan motif khas Mamasa, kini kalah saing.', 'https://id.wikipedia.org/wiki/Mamasa', '0.00775169', 0, '2025-11-22 19:59:33'),
(89, 'Bahasa Bantik', 'Minahasa, Sulawesi Utara', 'Bahasa dan Sastra', 'Balai Bahasa Sulut', '2010', 'Bahasa terancam punah, penutur banyak beralih ke bahasa Melayu Manado.', 'https://id.wikipedia.org/wiki/Bahasa_Bantik', '0.00775169', 1, '2025-11-22 19:59:33'),
(90, 'Musik Tari Monong', 'Dayak, Kalimantan Barat', 'Seni Musik', 'Pusat Studi Dayak', '1968', 'Musik pengiring tari penyembuhan (Monong), bersifat ritual dan jarang dimainkan di luar upacara.', 'https://id.wikipedia.org/wiki/Suku_Dayak', '0.00775169', 0, '2025-11-22 19:59:33'),
(91, 'Tari Seudati Inong', 'Aceh', 'Seni Pertunjukan', 'Pusat Studi Tari Aceh', '1955', 'Tari Seudati yang ditarikan oleh wanita (Inong), terancam punah karena adaptasi budaya modern.', 'https://id.wikipedia.org/wiki/Tari_Seudati', '0.01994122', 1, '2025-11-22 19:59:33'),
(92, 'Permainan Rakyat Cublak-Cublak Suweng', 'Jawa Tengah', 'Permainan Tradisional', 'Komunitas Permainan Anak', '1989', 'Permainan sambil bernyanyi, terancam karena jarang diajarkan di sekolah modern.', 'https://id.wikipedia.org/wiki/Cublak-cublak_suweng', '0.00775169', 0, '2025-11-22 19:59:33'),
(93, 'Ritual Adat Cacar Tradisional', 'Jawa', 'Adat dan Ritual', 'Riset Etnomedisin', '1900', 'Ritual dan ramuan tradisional untuk mengobati cacar (sebelum vaksin), dokumentasi sangat langka.', 'https://id.wikipedia.org/wiki/Pengobatan_tradisional', '0.00775169', 0, '2025-11-22 19:59:33'),
(94, 'Kerajinan Ukir Perak Bangka', 'Bangka Belitung', 'Kerajinan dan Tekstil', 'Sentra Kerajinan Bangka', '1965', 'Teknik ukir perak spesifik Bangka yang unik dan berbeda dari Jawa/Sumatera.', 'https://id.wikipedia.org/wiki/Bangka_Belitung', '0.01994122', 0, '2025-11-22 19:59:33'),
(95, 'Bahasa Lamatuka', 'Lembata, NTT', 'Bahasa dan Sastra', 'Linguistik Lembata', '2011', 'Bahasa yang berstatus Kritis terancam punah di Lembata.', 'https://id.wikipedia.org/wiki/Daftar_bahasa_terancam_di_Indonesia', '0.00775169', 0, '2025-11-22 19:59:33'),
(96, 'Naskah Carita Parahyangan', 'Jawa Barat', 'Sastra Kuno', 'Koleksi Museum', '1902', 'Naskah sejarah Sunda yang menceritakan raja-raja Sunda pra-Islam.', 'https://id.wikipedia.org/wiki/Carita_Parahyangan', '0.00775169', 1, '2025-11-22 19:59:33'),
(97, 'Alat Musik Rebab Betawi Kuno', 'Jakarta', 'Seni Musik', 'Sanggar Betawi', '1945', 'Model Rebab yang digunakan dalam orkes Gambang Kromong Kuno, kini sulit ditemukan.', 'https://id.wikipedia.org/wiki/Rebab', '0.00775169', 0, '2025-11-22 19:59:33'),
(98, 'Tari Gantar Kuno', 'Dayak, Kalimantan Timur', 'Seni Pertunjukan', 'Pusat Studi Dayak', '1935', 'Tarian penyambutan yang gerakannya lebih ritualistik dan jarang dipentaskan.', 'https://id.wikipedia.org/wiki/Tari_Gantar', '0.00775169', 0, '2025-11-22 19:59:33'),
(99, 'Permainan Rakyat Sumpitan', 'Dayak/Kalimantan', 'Permainan Tradisional', 'Komunitas Dayak', '1958', 'Permainan menggunakan sumpit (alat berburu) dengan aturan khusus, terancam dilupakan.', 'https://id.wikipedia.org/wiki/Sumpit_(senjata)', '0.01434063', 0, '2025-11-22 19:59:33'),
(100, 'Bahasa Kembayan', 'Kalimantan Barat', 'Bahasa dan Sastra', 'Linguistik Kalbar', '2013', 'Bahasa Dayak yang diklasifikasikan terancam punah, penutur pindah ke bahasa Melayu.', 'https://id.wikipedia.org/wiki/Bahasa_Kembayan', '0.00775169', 0, '2025-11-22 19:59:33');

-- --------------------------------------------------------

--
-- Struktur dari tabel `links_graph`
--

CREATE TABLE `links_graph` (
  `id` int(11) NOT NULL,
  `source_id` int(11) NOT NULL COMMENT 'ID Arsip yang MENAUTKAN/MENSITASI',
  `target_id` int(11) NOT NULL COMMENT 'ID Arsip yang DITAUTKAN/DISITASI',
  `link_weight` decimal(3,2) NOT NULL DEFAULT '1.00' COMMENT 'Bobot tautan: >1.0 jika sumber otoritatif'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `links_graph`
--

INSERT INTO `links_graph` (`id`, `source_id`, `target_id`, `link_weight`) VALUES
(1, 10, 53, '1.30'),
(2, 43, 33, '1.20'),
(3, 3, 9, '1.10'),
(4, 96, 29, '1.10'),
(5, 53, 73, '1.20'),
(6, 33, 91, '1.10'),
(7, 86, 78, '1.20'),
(8, 73, 48, '1.10'),
(9, 1, 6, '1.00'),
(10, 22, 36, '1.00'),
(11, 50, 85, '1.00'),
(12, 24, 69, '1.00'),
(13, 7, 58, '1.00'),
(14, 49, 94, '1.00'),
(15, 18, 65, '1.00'),
(16, 5, 23, '1.00'),
(17, 40, 57, '1.00'),
(18, 14, 52, '1.00'),
(19, 35, 46, '1.00'),
(20, 55, 76, '1.00'),
(21, 83, 27, '1.00'),
(22, 54, 62, '1.00'),
(23, 79, 99, '1.00'),
(24, 72, 16, '1.00'),
(25, 84, 44, '1.00'),
(26, 28, 87, '1.00'),
(27, 32, 82, '1.00'),
(28, 92, 38, '1.00'),
(29, 60, 49, '1.00'),
(30, 61, 42, '1.00');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `arsip_budaya`
--
ALTER TABLE `arsip_budaya`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `links_graph`
--
ALTER TABLE `links_graph`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_source_id` (`source_id`),
  ADD KEY `fk_target_id` (`target_id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `arsip_budaya`
--
ALTER TABLE `arsip_budaya`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT untuk tabel `links_graph`
--
ALTER TABLE `links_graph`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `links_graph`
--
ALTER TABLE `links_graph`
  ADD CONSTRAINT `fk_source_id` FOREIGN KEY (`source_id`) REFERENCES `arsip_budaya` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_target_id` FOREIGN KEY (`target_id`) REFERENCES `arsip_budaya` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
