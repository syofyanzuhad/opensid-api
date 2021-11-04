-- MySQL dump 10.13  Distrib 8.0.27, for Linux (x86_64)
--
-- Host: localhost    Database: opensid
-- ------------------------------------------------------
-- Server version	8.0.27-0ubuntu0.20.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `agenda`
--

DROP TABLE IF EXISTS `agenda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `agenda` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_artikel` int NOT NULL,
  `tgl_agenda` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `koordinator_kegiatan` varchar(50) NOT NULL,
  `lokasi_kegiatan` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_artikel_fk` (`id_artikel`),
  CONSTRAINT `id_artikel_fk` FOREIGN KEY (`id_artikel`) REFERENCES `artikel` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `analisis_indikator`
--

DROP TABLE IF EXISTS `analisis_indikator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `analisis_indikator` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_master` int NOT NULL,
  `nomor` varchar(10) DEFAULT NULL,
  `pertanyaan` varchar(400) NOT NULL,
  `id_tipe` tinyint NOT NULL DEFAULT '1',
  `bobot` tinyint NOT NULL DEFAULT '0',
  `act_analisis` tinyint(1) NOT NULL DEFAULT '2',
  `id_kategori` int NOT NULL,
  `is_publik` tinyint(1) NOT NULL DEFAULT '0',
  `is_teks` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `id_master` (`id_master`,`id_tipe`),
  KEY `id_tipe` (`id_tipe`),
  KEY `id_kategori` (`id_kategori`)
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `analisis_kategori_indikator`
--

DROP TABLE IF EXISTS `analisis_kategori_indikator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `analisis_kategori_indikator` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_master` tinyint NOT NULL,
  `kategori` varchar(50) NOT NULL,
  `kategori_kode` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_master` (`id_master`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `analisis_klasifikasi`
--

DROP TABLE IF EXISTS `analisis_klasifikasi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `analisis_klasifikasi` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_master` int NOT NULL,
  `nama` varchar(20) NOT NULL,
  `minval` double(7,2) NOT NULL,
  `maxval` double(7,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_master` (`id_master`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `analisis_master`
--

DROP TABLE IF EXISTS `analisis_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `analisis_master` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nama` varchar(40) NOT NULL,
  `subjek_tipe` tinyint NOT NULL,
  `lock` tinyint(1) NOT NULL DEFAULT '1',
  `deskripsi` text NOT NULL,
  `kode_analisis` varchar(5) NOT NULL DEFAULT '00000',
  `id_kelompok` int DEFAULT NULL,
  `pembagi` varchar(10) NOT NULL DEFAULT '100',
  `id_child` smallint DEFAULT NULL,
  `format_impor` tinyint DEFAULT NULL,
  `jenis` tinyint NOT NULL DEFAULT '2',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `analisis_parameter`
--

DROP TABLE IF EXISTS `analisis_parameter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `analisis_parameter` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_indikator` int NOT NULL,
  `jawaban` varchar(200) NOT NULL,
  `nilai` int NOT NULL DEFAULT '0',
  `kode_jawaban` int DEFAULT '0',
  `asign` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `id_indikator` (`id_indikator`)
) ENGINE=InnoDB AUTO_INCREMENT=1052 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `analisis_partisipasi`
--

DROP TABLE IF EXISTS `analisis_partisipasi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `analisis_partisipasi` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_subjek` int NOT NULL,
  `id_master` int NOT NULL,
  `id_periode` int NOT NULL,
  `id_klassifikasi` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `id_subjek` (`id_subjek`,`id_master`,`id_periode`,`id_klassifikasi`),
  KEY `id_master` (`id_master`),
  KEY `id_periode` (`id_periode`),
  KEY `id_klassifikasi` (`id_klassifikasi`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `analisis_periode`
--

DROP TABLE IF EXISTS `analisis_periode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `analisis_periode` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_master` int NOT NULL,
  `nama` varchar(50) NOT NULL,
  `id_state` tinyint NOT NULL DEFAULT '1',
  `aktif` tinyint(1) NOT NULL DEFAULT '0',
  `keterangan` varchar(100) NOT NULL,
  `tahun_pelaksanaan` year NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_master` (`id_master`),
  KEY `id_state` (`id_state`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `analisis_ref_state`
--

DROP TABLE IF EXISTS `analisis_ref_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `analisis_ref_state` (
  `id` tinyint NOT NULL AUTO_INCREMENT,
  `nama` varchar(40) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `analisis_ref_subjek`
--

DROP TABLE IF EXISTS `analisis_ref_subjek`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `analisis_ref_subjek` (
  `id` tinyint NOT NULL AUTO_INCREMENT,
  `subjek` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `analisis_respon`
--

DROP TABLE IF EXISTS `analisis_respon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `analisis_respon` (
  `id_indikator` int NOT NULL,
  `id_parameter` int NOT NULL,
  `id_subjek` int NOT NULL,
  `id_periode` int NOT NULL,
  KEY `id_parameter` (`id_parameter`,`id_subjek`),
  KEY `id_periode` (`id_periode`),
  KEY `id_indikator` (`id_indikator`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `analisis_respon_bukti`
--

DROP TABLE IF EXISTS `analisis_respon_bukti`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `analisis_respon_bukti` (
  `id_master` tinyint NOT NULL,
  `id_periode` tinyint NOT NULL,
  `id_subjek` int NOT NULL,
  `pengesahan` varchar(100) NOT NULL,
  `tgl_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `analisis_respon_hasil`
--

DROP TABLE IF EXISTS `analisis_respon_hasil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `analisis_respon_hasil` (
  `id_master` tinyint NOT NULL,
  `id_periode` tinyint NOT NULL,
  `id_subjek` int NOT NULL,
  `akumulasi` double(8,3) NOT NULL,
  `tgl_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  UNIQUE KEY `id_master` (`id_master`,`id_periode`,`id_subjek`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `analisis_tipe_indikator`
--

DROP TABLE IF EXISTS `analisis_tipe_indikator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `analisis_tipe_indikator` (
  `id` tinyint NOT NULL AUTO_INCREMENT,
  `tipe` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `anggota_grup_kontak`
--

DROP TABLE IF EXISTS `anggota_grup_kontak`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `anggota_grup_kontak` (
  `id_grup_kontak` int NOT NULL AUTO_INCREMENT,
  `id_grup` int NOT NULL,
  `id_kontak` int NOT NULL,
  PRIMARY KEY (`id_grup_kontak`),
  KEY `anggota_grup_kontak_ke_kontak` (`id_kontak`),
  KEY `anggota_grup_kontak_ke_kontak_grup` (`id_grup`),
  CONSTRAINT `anggota_grup_kontak_ke_kontak` FOREIGN KEY (`id_kontak`) REFERENCES `kontak` (`id_kontak`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `anggota_grup_kontak_ke_kontak_grup` FOREIGN KEY (`id_grup`) REFERENCES `kontak_grup` (`id_grup`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `anjungan`
--

DROP TABLE IF EXISTS `anjungan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `anjungan` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(100) NOT NULL,
  `keterangan` varchar(300) DEFAULT NULL,
  `keyboard` tinyint(1) DEFAULT '1',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_by` int NOT NULL,
  `updated_by` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `area`
--

DROP TABLE IF EXISTS `area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `area` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) NOT NULL,
  `path` text,
  `enabled` int NOT NULL DEFAULT '1',
  `ref_polygon` int NOT NULL,
  `foto` varchar(100) DEFAULT NULL,
  `id_cluster` int DEFAULT NULL,
  `desk` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `artikel`
--

DROP TABLE IF EXISTS `artikel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `artikel` (
  `id` int NOT NULL AUTO_INCREMENT,
  `gambar` varchar(200) DEFAULT NULL,
  `isi` text NOT NULL,
  `enabled` int NOT NULL DEFAULT '1',
  `tgl_upload` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_kategori` int NOT NULL,
  `id_user` int NOT NULL,
  `judul` varchar(100) NOT NULL,
  `headline` int NOT NULL DEFAULT '0',
  `gambar1` varchar(200) DEFAULT NULL,
  `gambar2` varchar(200) DEFAULT NULL,
  `gambar3` varchar(200) DEFAULT NULL,
  `dokumen` varchar(400) DEFAULT NULL,
  `link_dokumen` varchar(200) DEFAULT NULL,
  `boleh_komentar` tinyint(1) NOT NULL DEFAULT '1',
  `slug` varchar(200) DEFAULT NULL,
  `hit` int DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `captcha_codes`
--

DROP TABLE IF EXISTS `captcha_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `captcha_codes` (
  `id` varchar(40) NOT NULL,
  `namespace` varchar(32) NOT NULL,
  `code` varchar(32) NOT NULL,
  `code_display` varchar(32) NOT NULL,
  `created` int NOT NULL,
  `audio_data` mediumblob,
  PRIMARY KEY (`id`,`namespace`),
  KEY `created` (`created`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cdesa`
--

DROP TABLE IF EXISTS `cdesa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cdesa` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nomor` varchar(20) NOT NULL,
  `nama_kepemilikan` varchar(100) NOT NULL,
  `jenis_pemilik` tinyint(1) NOT NULL DEFAULT '0',
  `nama_pemilik_luar` varchar(100) DEFAULT NULL,
  `alamat_pemilik_luar` varchar(200) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_by` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nomor` (`nomor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cdesa_penduduk`
--

DROP TABLE IF EXISTS `cdesa_penduduk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cdesa_penduduk` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `id_cdesa` int unsigned NOT NULL,
  `id_pend` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_cdesa` (`id_cdesa`),
  CONSTRAINT `cdesa_penduduk_fk` FOREIGN KEY (`id_cdesa`) REFERENCES `cdesa` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `config`
--

DROP TABLE IF EXISTS `config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `config` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nama_desa` varchar(100) NOT NULL,
  `kode_desa` varchar(100) NOT NULL,
  `kode_pos` varchar(6) NOT NULL,
  `nama_kecamatan` varchar(100) NOT NULL,
  `kode_kecamatan` varchar(100) NOT NULL,
  `nama_kepala_camat` varchar(100) NOT NULL,
  `nip_kepala_camat` varchar(100) NOT NULL,
  `nama_kabupaten` varchar(100) NOT NULL,
  `kode_kabupaten` varchar(100) NOT NULL,
  `nama_propinsi` varchar(100) NOT NULL,
  `kode_propinsi` varchar(100) NOT NULL,
  `logo` varchar(100) DEFAULT NULL,
  `lat` varchar(20) DEFAULT NULL,
  `lng` varchar(20) DEFAULT NULL,
  `zoom` tinyint DEFAULT NULL,
  `map_tipe` varchar(20) DEFAULT NULL,
  `path` text,
  `alamat_kantor` varchar(200) DEFAULT NULL,
  `email_desa` varchar(50) DEFAULT NULL,
  `telepon` varchar(50) DEFAULT NULL,
  `website` varchar(100) DEFAULT NULL,
  `kantor_desa` varchar(100) DEFAULT NULL,
  `warna` varchar(10) DEFAULT NULL,
  `pamong_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `covid19_pantau`
--

DROP TABLE IF EXISTS `covid19_pantau`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `covid19_pantau` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_pemudik` int DEFAULT NULL,
  `tanggal_jam` datetime DEFAULT NULL,
  `suhu_tubuh` decimal(4,2) DEFAULT NULL,
  `batuk` varchar(20) DEFAULT NULL,
  `flu` varchar(20) DEFAULT NULL,
  `sesak_nafas` varchar(20) DEFAULT NULL,
  `keluhan_lain` varchar(255) DEFAULT NULL,
  `status_covid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_pantau_pemudik` (`id_pemudik`),
  CONSTRAINT `fk_pantau_pemudik` FOREIGN KEY (`id_pemudik`) REFERENCES `covid19_pemudik` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `covid19_pemudik`
--

DROP TABLE IF EXISTS `covid19_pemudik`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `covid19_pemudik` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_terdata` int DEFAULT NULL,
  `tanggal_datang` date DEFAULT NULL,
  `asal_mudik` varchar(255) DEFAULT NULL,
  `durasi_mudik` varchar(50) DEFAULT NULL,
  `tujuan_mudik` varchar(255) DEFAULT NULL,
  `keluhan_kesehatan` varchar(255) DEFAULT NULL,
  `status_covid` varchar(50) DEFAULT NULL,
  `no_hp` varchar(20) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `is_wajib_pantau` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_pemudik_penduduk` (`id_terdata`),
  CONSTRAINT `fk_pemudik_penduduk` FOREIGN KEY (`id_terdata`) REFERENCES `tweb_penduduk` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `daftar_anggota_grup`
--

DROP TABLE IF EXISTS `daftar_anggota_grup`;
/*!50001 DROP VIEW IF EXISTS `daftar_anggota_grup`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `daftar_anggota_grup` AS SELECT 
 1 AS `id_grup_kontak`,
 1 AS `id_grup`,
 1 AS `nama_grup`,
 1 AS `id_kontak`,
 1 AS `nama`,
 1 AS `no_hp`,
 1 AS `sex`,
 1 AS `alamat_sekarang`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `daftar_grup`
--

DROP TABLE IF EXISTS `daftar_grup`;
/*!50001 DROP VIEW IF EXISTS `daftar_grup`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `daftar_grup` AS SELECT 
 1 AS `id_grup`,
 1 AS `nama_grup`,
 1 AS `jumlah_anggota`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `daftar_kontak`
--

DROP TABLE IF EXISTS `daftar_kontak`;
/*!50001 DROP VIEW IF EXISTS `daftar_kontak`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `daftar_kontak` AS SELECT 
 1 AS `id_kontak`,
 1 AS `id_pend`,
 1 AS `nama`,
 1 AS `no_hp`,
 1 AS `sex`,
 1 AS `alamat_sekarang`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `detail_log_penduduk`
--

DROP TABLE IF EXISTS `detail_log_penduduk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detail_log_penduduk` (
  `id` int NOT NULL,
  `nama` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `disposisi_surat_masuk`
--

DROP TABLE IF EXISTS `disposisi_surat_masuk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `disposisi_surat_masuk` (
  `id_disposisi` int NOT NULL AUTO_INCREMENT,
  `id_surat_masuk` int NOT NULL,
  `id_desa_pamong` int DEFAULT NULL,
  `disposisi_ke` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_disposisi`),
  KEY `id_surat_fk` (`id_surat_masuk`),
  KEY `desa_pamong_fk` (`id_desa_pamong`),
  CONSTRAINT `desa_pamong_fk` FOREIGN KEY (`id_desa_pamong`) REFERENCES `tweb_desa_pamong` (`pamong_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `id_surat_fk` FOREIGN KEY (`id_surat_masuk`) REFERENCES `surat_masuk` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dokumen`
--

DROP TABLE IF EXISTS `dokumen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dokumen` (
  `id` int NOT NULL AUTO_INCREMENT,
  `satuan` varchar(200) DEFAULT NULL,
  `nama` varchar(200) NOT NULL,
  `enabled` int NOT NULL DEFAULT '1',
  `tgl_upload` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_pend` int NOT NULL DEFAULT '0',
  `kategori` tinyint NOT NULL DEFAULT '1',
  `attr` text NOT NULL,
  `tahun` int DEFAULT NULL,
  `kategori_info_publik` tinyint DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `id_syarat` int DEFAULT NULL,
  `id_parent` int DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(16) DEFAULT NULL,
  `updated_by` varchar(16) DEFAULT NULL,
  `dok_warga` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `dokumen_hidup`
--

DROP TABLE IF EXISTS `dokumen_hidup`;
/*!50001 DROP VIEW IF EXISTS `dokumen_hidup`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `dokumen_hidup` AS SELECT 
 1 AS `id`,
 1 AS `satuan`,
 1 AS `nama`,
 1 AS `enabled`,
 1 AS `tgl_upload`,
 1 AS `id_pend`,
 1 AS `kategori`,
 1 AS `attr`,
 1 AS `tahun`,
 1 AS `kategori_info_publik`,
 1 AS `updated_at`,
 1 AS `deleted`,
 1 AS `id_syarat`,
 1 AS `id_parent`,
 1 AS `created_at`,
 1 AS `created_by`,
 1 AS `updated_by`,
 1 AS `dok_warga`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `gambar_gallery`
--

DROP TABLE IF EXISTS `gambar_gallery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gambar_gallery` (
  `id` int NOT NULL AUTO_INCREMENT,
  `parrent` int DEFAULT '0',
  `gambar` varchar(200) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `enabled` int NOT NULL DEFAULT '1',
  `tgl_upload` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `tipe` int DEFAULT '0',
  `slider` tinyint(1) DEFAULT NULL,
  `urut` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `parrent` (`parrent`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `garis`
--

DROP TABLE IF EXISTS `garis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `garis` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) NOT NULL,
  `path` text,
  `enabled` int NOT NULL DEFAULT '1',
  `ref_line` int NOT NULL,
  `foto` varchar(100) DEFAULT NULL,
  `desk` text,
  `id_cluster` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gis_simbol`
--

DROP TABLE IF EXISTS `gis_simbol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gis_simbol` (
  `id` int NOT NULL AUTO_INCREMENT,
  `simbol` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `simbol` (`simbol`),
  UNIQUE KEY `simbol_2` (`simbol`),
  UNIQUE KEY `simbol_3` (`simbol`),
  UNIQUE KEY `simbol_4` (`simbol`),
  UNIQUE KEY `simbol_5` (`simbol`),
  UNIQUE KEY `simbol_6` (`simbol`)
) ENGINE=InnoDB AUTO_INCREMENT=639 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `inbox`
--

DROP TABLE IF EXISTS `inbox`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inbox` (
  `UpdatedInDB` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ReceivingDateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Text` text NOT NULL,
  `SenderNumber` varchar(20) NOT NULL DEFAULT '',
  `Coding` enum('Default_No_Compression','Unicode_No_Compression','8bit','Default_Compression','Unicode_Compression') NOT NULL DEFAULT 'Default_No_Compression',
  `UDH` text NOT NULL,
  `SMSCNumber` varchar(20) NOT NULL DEFAULT '',
  `Class` int NOT NULL DEFAULT '-1',
  `TextDecoded` text NOT NULL,
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `RecipientID` text NOT NULL,
  `Processed` enum('false','true') NOT NULL DEFAULT 'false',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `inventaris_asset`
--

DROP TABLE IF EXISTS `inventaris_asset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventaris_asset` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nama_barang` varchar(255) NOT NULL,
  `kode_barang` varchar(64) NOT NULL,
  `register` varchar(64) NOT NULL,
  `jenis` varchar(255) NOT NULL,
  `judul_buku` varchar(255) DEFAULT NULL,
  `spesifikasi_buku` varchar(255) DEFAULT NULL,
  `asal_daerah` varchar(255) DEFAULT NULL,
  `pencipta` varchar(255) DEFAULT NULL,
  `bahan` varchar(255) DEFAULT NULL,
  `jenis_hewan` varchar(255) DEFAULT NULL,
  `ukuran_hewan` varchar(255) DEFAULT NULL,
  `jenis_tumbuhan` varchar(255) DEFAULT NULL,
  `ukuran_tumbuhan` varchar(255) DEFAULT NULL,
  `jumlah` int NOT NULL,
  `tahun_pengadaan` year NOT NULL,
  `asal` varchar(255) NOT NULL,
  `harga` double NOT NULL,
  `keterangan` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_by` int NOT NULL,
  `status` int NOT NULL DEFAULT '0',
  `visible` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `inventaris_gedung`
--

DROP TABLE IF EXISTS `inventaris_gedung`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventaris_gedung` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nama_barang` varchar(255) NOT NULL,
  `kode_barang` varchar(64) NOT NULL,
  `register` varchar(64) NOT NULL,
  `kondisi_bangunan` varchar(255) NOT NULL,
  `kontruksi_bertingkat` varchar(255) NOT NULL,
  `kontruksi_beton` int NOT NULL,
  `luas_bangunan` int NOT NULL,
  `letak` varchar(255) NOT NULL,
  `tanggal_dokument` date DEFAULT NULL,
  `no_dokument` varchar(255) DEFAULT NULL,
  `luas` int DEFAULT NULL,
  `status_tanah` varchar(255) DEFAULT NULL,
  `kode_tanah` varchar(255) DEFAULT NULL,
  `asal` varchar(255) NOT NULL,
  `harga` double NOT NULL,
  `keterangan` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_by` int NOT NULL,
  `status` int NOT NULL DEFAULT '0',
  `visible` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `inventaris_jalan`
--

DROP TABLE IF EXISTS `inventaris_jalan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventaris_jalan` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nama_barang` varchar(255) NOT NULL,
  `kode_barang` varchar(64) NOT NULL,
  `register` varchar(64) NOT NULL,
  `kontruksi` varchar(255) NOT NULL,
  `panjang` int NOT NULL,
  `lebar` int NOT NULL,
  `luas` int NOT NULL,
  `letak` text,
  `tanggal_dokument` date NOT NULL,
  `no_dokument` varchar(255) DEFAULT NULL,
  `status_tanah` varchar(255) DEFAULT NULL,
  `kode_tanah` varchar(255) DEFAULT NULL,
  `kondisi` varchar(255) NOT NULL,
  `asal` varchar(255) NOT NULL,
  `harga` double NOT NULL,
  `keterangan` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_by` int NOT NULL,
  `status` int NOT NULL DEFAULT '0',
  `visible` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `inventaris_kontruksi`
--

DROP TABLE IF EXISTS `inventaris_kontruksi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventaris_kontruksi` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nama_barang` varchar(255) NOT NULL,
  `kondisi_bangunan` varchar(255) NOT NULL,
  `kontruksi_bertingkat` varchar(255) NOT NULL,
  `kontruksi_beton` tinyint(1) DEFAULT '0',
  `luas_bangunan` int NOT NULL,
  `letak` varchar(255) NOT NULL,
  `tanggal_dokument` date DEFAULT NULL,
  `no_dokument` varchar(255) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `status_tanah` varchar(255) DEFAULT NULL,
  `kode_tanah` varchar(255) DEFAULT NULL,
  `asal` varchar(255) NOT NULL,
  `harga` double NOT NULL,
  `keterangan` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_by` int NOT NULL,
  `status` int NOT NULL DEFAULT '0',
  `visible` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `inventaris_peralatan`
--

DROP TABLE IF EXISTS `inventaris_peralatan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventaris_peralatan` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nama_barang` varchar(255) NOT NULL,
  `kode_barang` varchar(64) NOT NULL,
  `register` varchar(64) NOT NULL,
  `merk` varchar(255) NOT NULL,
  `ukuran` text NOT NULL,
  `bahan` text NOT NULL,
  `tahun_pengadaan` year NOT NULL,
  `no_pabrik` varchar(255) DEFAULT NULL,
  `no_rangka` varchar(255) DEFAULT NULL,
  `no_mesin` varchar(255) DEFAULT NULL,
  `no_polisi` varchar(255) DEFAULT NULL,
  `no_bpkb` varchar(255) DEFAULT NULL,
  `asal` varchar(255) NOT NULL,
  `harga` double NOT NULL,
  `keterangan` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_by` int NOT NULL,
  `status` int NOT NULL DEFAULT '0',
  `visible` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `inventaris_tanah`
--

DROP TABLE IF EXISTS `inventaris_tanah`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventaris_tanah` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nama_barang` varchar(255) NOT NULL,
  `kode_barang` varchar(64) NOT NULL,
  `register` varchar(64) NOT NULL,
  `luas` int NOT NULL,
  `tahun_pengadaan` year NOT NULL,
  `letak` varchar(255) NOT NULL,
  `hak` varchar(255) NOT NULL,
  `no_sertifikat` varchar(255) NOT NULL,
  `tanggal_sertifikat` date NOT NULL,
  `penggunaan` varchar(255) NOT NULL,
  `asal` varchar(255) NOT NULL,
  `harga` double NOT NULL,
  `keterangan` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_by` int NOT NULL,
  `status` int NOT NULL DEFAULT '0',
  `visible` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `kategori`
--

DROP TABLE IF EXISTS `kategori`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kategori` (
  `id` int NOT NULL AUTO_INCREMENT,
  `kategori` varchar(100) NOT NULL,
  `tipe` int NOT NULL DEFAULT '1',
  `urut` tinyint NOT NULL,
  `enabled` tinyint NOT NULL,
  `parrent` tinyint NOT NULL DEFAULT '0',
  `slug` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `kelompok`
--

DROP TABLE IF EXISTS `kelompok`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kelompok` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_master` int NOT NULL,
  `id_ketua` int NOT NULL,
  `nama` varchar(50) NOT NULL,
  `keterangan` varchar(300) DEFAULT NULL,
  `kode` varchar(16) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `kode` (`kode`),
  KEY `id_ketua` (`id_ketua`),
  KEY `id_master` (`id_master`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `kelompok_anggota`
--

DROP TABLE IF EXISTS `kelompok_anggota`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kelompok_anggota` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_kelompok` int NOT NULL,
  `id_penduduk` int NOT NULL,
  `no_anggota` varchar(20) DEFAULT NULL,
  `keterangan` text,
  `jabatan` varchar(50) DEFAULT '90',
  `no_sk_jabatan` varchar(50) DEFAULT NULL,
  `foto` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_kelompok` (`id_kelompok`,`id_penduduk`),
  CONSTRAINT `kelompok_anggota_fk` FOREIGN KEY (`id_kelompok`) REFERENCES `kelompok` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `kelompok_master`
--

DROP TABLE IF EXISTS `kelompok_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kelompok_master` (
  `id` int NOT NULL AUTO_INCREMENT,
  `kelompok` varchar(50) NOT NULL,
  `deskripsi` varchar(400) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `keluarga_aktif`
--

DROP TABLE IF EXISTS `keluarga_aktif`;
/*!50001 DROP VIEW IF EXISTS `keluarga_aktif`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `keluarga_aktif` AS SELECT 
 1 AS `id`,
 1 AS `no_kk`,
 1 AS `nik_kepala`,
 1 AS `tgl_daftar`,
 1 AS `kelas_sosial`,
 1 AS `tgl_cetak_kk`,
 1 AS `alamat`,
 1 AS `id_cluster`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `keuangan_manual_ref_bidang`
--

DROP TABLE IF EXISTS `keuangan_manual_ref_bidang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `keuangan_manual_ref_bidang` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Kd_Bid` varchar(50) NOT NULL,
  `Nama_Bidang` varchar(250) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `keuangan_manual_ref_kegiatan`
--

DROP TABLE IF EXISTS `keuangan_manual_ref_kegiatan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `keuangan_manual_ref_kegiatan` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ID_Keg` varchar(100) NOT NULL,
  `Nama_Kegiatan` varchar(250) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=240 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `keuangan_manual_ref_rek1`
--

DROP TABLE IF EXISTS `keuangan_manual_ref_rek1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `keuangan_manual_ref_rek1` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Akun` varchar(100) NOT NULL,
  `Nama_Akun` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `keuangan_manual_ref_rek2`
--

DROP TABLE IF EXISTS `keuangan_manual_ref_rek2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `keuangan_manual_ref_rek2` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Akun` varchar(100) NOT NULL,
  `Kelompok` varchar(100) NOT NULL,
  `Nama_Kelompok` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `keuangan_manual_ref_rek3`
--

DROP TABLE IF EXISTS `keuangan_manual_ref_rek3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `keuangan_manual_ref_rek3` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Kelompok` varchar(100) NOT NULL,
  `Jenis` varchar(100) NOT NULL,
  `Nama_Jenis` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `keuangan_manual_rinci`
--

DROP TABLE IF EXISTS `keuangan_manual_rinci`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `keuangan_manual_rinci` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Tahun` varchar(100) NOT NULL,
  `Kd_Akun` varchar(100) NOT NULL,
  `Kd_Keg` varchar(100) NOT NULL,
  `Kd_Rincian` varchar(100) NOT NULL,
  `Nilai_Anggaran` varchar(100) NOT NULL,
  `Nilai_Realisasi` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `keuangan_manual_rinci_tpl`
--

DROP TABLE IF EXISTS `keuangan_manual_rinci_tpl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `keuangan_manual_rinci_tpl` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Tahun` varchar(100) NOT NULL,
  `Kd_Akun` varchar(100) NOT NULL,
  `Kd_Keg` varchar(100) NOT NULL,
  `Kd_Rincian` varchar(100) NOT NULL,
  `Nilai_Anggaran` varchar(100) NOT NULL,
  `Nilai_Realisasi` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `keuangan_master`
--

DROP TABLE IF EXISTS `keuangan_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `keuangan_master` (
  `id` int NOT NULL AUTO_INCREMENT,
  `versi_database` varchar(50) NOT NULL,
  `tahun_anggaran` varchar(250) NOT NULL,
  `aktif` int NOT NULL DEFAULT '1',
  `tanggal_impor` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `keuangan_ref_bank_desa`
--

DROP TABLE IF EXISTS `keuangan_ref_bank_desa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `keuangan_ref_bank_desa` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_keuangan_master` int NOT NULL,
  `Tahun` varchar(50) NOT NULL,
  `Kd_Desa` varchar(50) NOT NULL,
  `Kd_Rincian` varchar(100) NOT NULL,
  `NoRek_Bank` varchar(100) NOT NULL,
  `Nama_Bank` varchar(250) NOT NULL,
  `Kantor_Cabang` varchar(100) DEFAULT NULL,
  `Nama_Pemilik` varchar(100) DEFAULT NULL,
  `Alamat_Pemilik` varchar(100) DEFAULT NULL,
  `No_Identitas` varchar(20) DEFAULT NULL,
  `No_Telepon` varchar(20) DEFAULT NULL,
  `ID_Bank` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_keuangan_ref_bank_desa_master_fk` (`id_keuangan_master`),
  CONSTRAINT `id_keuangan_ref_bank_desa_master_fk` FOREIGN KEY (`id_keuangan_master`) REFERENCES `keuangan_master` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `keuangan_ref_bel_operasional`
--

DROP TABLE IF EXISTS `keuangan_ref_bel_operasional`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `keuangan_ref_bel_operasional` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_keuangan_master` int NOT NULL,
  `ID_Keg` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_keuangan_ref_bel_operasional_master_fk` (`id_keuangan_master`),
  CONSTRAINT `id_keuangan_ref_bel_operasional_master_fk` FOREIGN KEY (`id_keuangan_master`) REFERENCES `keuangan_master` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `keuangan_ref_bidang`
--

DROP TABLE IF EXISTS `keuangan_ref_bidang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `keuangan_ref_bidang` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_keuangan_master` int NOT NULL,
  `Kd_Bid` varchar(50) NOT NULL,
  `Nama_Bidang` varchar(250) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_keuangan_ref_bidang_master_fk` (`id_keuangan_master`),
  CONSTRAINT `id_keuangan_ref_bidang_master_fk` FOREIGN KEY (`id_keuangan_master`) REFERENCES `keuangan_master` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `keuangan_ref_bunga`
--

DROP TABLE IF EXISTS `keuangan_ref_bunga`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `keuangan_ref_bunga` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_keuangan_master` int NOT NULL,
  `Kd_Bunga` varchar(50) NOT NULL,
  `Kd_Admin` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_keuangan_ref_bunga_master_fk` (`id_keuangan_master`),
  CONSTRAINT `id_keuangan_ref_bunga_master_fk` FOREIGN KEY (`id_keuangan_master`) REFERENCES `keuangan_master` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `keuangan_ref_desa`
--

DROP TABLE IF EXISTS `keuangan_ref_desa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `keuangan_ref_desa` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_keuangan_master` int NOT NULL,
  `Kd_Kec` varchar(100) NOT NULL,
  `Kd_Desa` varchar(100) NOT NULL,
  `Nama_Desa` varchar(250) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_keuangan_ref_desa_master_fk` (`id_keuangan_master`),
  CONSTRAINT `id_keuangan_ref_desa_master_fk` FOREIGN KEY (`id_keuangan_master`) REFERENCES `keuangan_master` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `keuangan_ref_kecamatan`
--

DROP TABLE IF EXISTS `keuangan_ref_kecamatan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `keuangan_ref_kecamatan` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_keuangan_master` int NOT NULL,
  `Kd_Kec` varchar(100) NOT NULL,
  `Nama_Kecamatan` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_keuangan_ref_kecamatan_master_fk` (`id_keuangan_master`),
  CONSTRAINT `id_keuangan_ref_kecamatan_master_fk` FOREIGN KEY (`id_keuangan_master`) REFERENCES `keuangan_master` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `keuangan_ref_kegiatan`
--

DROP TABLE IF EXISTS `keuangan_ref_kegiatan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `keuangan_ref_kegiatan` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_keuangan_master` int NOT NULL,
  `Kd_Bid` varchar(100) DEFAULT NULL,
  `ID_Keg` varchar(100) NOT NULL,
  `Nama_Kegiatan` varchar(250) NOT NULL,
  `Jns_Kegiatan` tinyint DEFAULT NULL,
  `Kd_Sub` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_keuangan_ref_kegiatan_master_fk` (`id_keuangan_master`),
  CONSTRAINT `id_keuangan_ref_kegiatan_master_fk` FOREIGN KEY (`id_keuangan_master`) REFERENCES `keuangan_master` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `keuangan_ref_korolari`
--

DROP TABLE IF EXISTS `keuangan_ref_korolari`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `keuangan_ref_korolari` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_keuangan_master` int NOT NULL,
  `Kd_Rincian` varchar(100) NOT NULL,
  `Kd_RekDB` varchar(100) NOT NULL,
  `Kd_RekKD` varchar(250) NOT NULL,
  `Jenis` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_keuangan_ref_korolari_master_fk` (`id_keuangan_master`),
  CONSTRAINT `id_keuangan_ref_korolari_master_fk` FOREIGN KEY (`id_keuangan_master`) REFERENCES `keuangan_master` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `keuangan_ref_neraca_close`
--

DROP TABLE IF EXISTS `keuangan_ref_neraca_close`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `keuangan_ref_neraca_close` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_keuangan_master` int NOT NULL,
  `Kd_Rincian` varchar(100) NOT NULL,
  `Kelompok` varchar(250) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_keuangan_ref_neraca_close_master_fk` (`id_keuangan_master`),
  CONSTRAINT `id_keuangan_ref_neraca_close_master_fk` FOREIGN KEY (`id_keuangan_master`) REFERENCES `keuangan_master` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `keuangan_ref_perangkat`
--

DROP TABLE IF EXISTS `keuangan_ref_perangkat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `keuangan_ref_perangkat` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_keuangan_master` int NOT NULL,
  `Kode` varchar(100) NOT NULL,
  `Nama_Perangkat` varchar(250) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_keuangan_ref_perangkat_master_fk` (`id_keuangan_master`),
  CONSTRAINT `id_keuangan_ref_perangkat_master_fk` FOREIGN KEY (`id_keuangan_master`) REFERENCES `keuangan_master` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `keuangan_ref_potongan`
--

DROP TABLE IF EXISTS `keuangan_ref_potongan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `keuangan_ref_potongan` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_keuangan_master` int NOT NULL,
  `Kd_Rincian` varchar(100) NOT NULL,
  `Kd_Potongan` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_keuangan_ref_potongan_master_fk` (`id_keuangan_master`),
  CONSTRAINT `id_keuangan_ref_potongan_master_fk` FOREIGN KEY (`id_keuangan_master`) REFERENCES `keuangan_master` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `keuangan_ref_rek1`
--

DROP TABLE IF EXISTS `keuangan_ref_rek1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `keuangan_ref_rek1` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_keuangan_master` int NOT NULL,
  `Akun` varchar(100) NOT NULL,
  `Nama_Akun` varchar(100) NOT NULL,
  `NoLap` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_keuangan_ref_rek1_master_fk` (`id_keuangan_master`),
  CONSTRAINT `id_keuangan_ref_rek1_master_fk` FOREIGN KEY (`id_keuangan_master`) REFERENCES `keuangan_master` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `keuangan_ref_rek2`
--

DROP TABLE IF EXISTS `keuangan_ref_rek2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `keuangan_ref_rek2` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_keuangan_master` int NOT NULL,
  `Akun` varchar(100) NOT NULL,
  `Kelompok` varchar(100) NOT NULL,
  `Nama_Kelompok` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_keuangan_ref_rek2_master_fk` (`id_keuangan_master`),
  CONSTRAINT `id_keuangan_ref_rek2_master_fk` FOREIGN KEY (`id_keuangan_master`) REFERENCES `keuangan_master` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `keuangan_ref_rek3`
--

DROP TABLE IF EXISTS `keuangan_ref_rek3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `keuangan_ref_rek3` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_keuangan_master` int NOT NULL,
  `Kelompok` varchar(100) NOT NULL,
  `Jenis` varchar(100) NOT NULL,
  `Nama_Jenis` varchar(100) NOT NULL,
  `Formula` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_keuangan_ref_rek3_master_fk` (`id_keuangan_master`),
  CONSTRAINT `id_keuangan_ref_rek3_master_fk` FOREIGN KEY (`id_keuangan_master`) REFERENCES `keuangan_master` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `keuangan_ref_rek4`
--

DROP TABLE IF EXISTS `keuangan_ref_rek4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `keuangan_ref_rek4` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_keuangan_master` int NOT NULL,
  `Jenis` varchar(100) NOT NULL,
  `Obyek` varchar(100) NOT NULL,
  `Nama_Obyek` varchar(100) NOT NULL,
  `Peraturan` varchar(250) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_keuangan_ref_rek4_master_fk` (`id_keuangan_master`),
  CONSTRAINT `id_keuangan_ref_rek4_master_fk` FOREIGN KEY (`id_keuangan_master`) REFERENCES `keuangan_master` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `keuangan_ref_sbu`
--

DROP TABLE IF EXISTS `keuangan_ref_sbu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `keuangan_ref_sbu` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_keuangan_master` int NOT NULL,
  `Kd_Rincian` varchar(100) NOT NULL,
  `Kode_SBU` varchar(100) NOT NULL,
  `NoUrut_SBU` varchar(100) NOT NULL,
  `Nama_SBU` varchar(100) NOT NULL,
  `Nilai` varchar(100) NOT NULL,
  `Satuan` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_keuangan_ref_sbu_master_fk` (`id_keuangan_master`),
  CONSTRAINT `id_keuangan_ref_sbu_master_fk` FOREIGN KEY (`id_keuangan_master`) REFERENCES `keuangan_master` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `keuangan_ref_sumber`
--

DROP TABLE IF EXISTS `keuangan_ref_sumber`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `keuangan_ref_sumber` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_keuangan_master` int NOT NULL,
  `Kode` varchar(100) NOT NULL,
  `Nama_Sumber` varchar(100) NOT NULL,
  `Urut` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_keuangan_ref_sumber_master_fk` (`id_keuangan_master`),
  CONSTRAINT `id_keuangan_ref_sumber_master_fk` FOREIGN KEY (`id_keuangan_master`) REFERENCES `keuangan_master` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `keuangan_ta_anggaran`
--

DROP TABLE IF EXISTS `keuangan_ta_anggaran`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `keuangan_ta_anggaran` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_keuangan_master` int NOT NULL,
  `KdPosting` varchar(100) NOT NULL,
  `Tahun` varchar(100) NOT NULL,
  `KURincianSD` varchar(100) NOT NULL,
  `KD_Rincian` varchar(100) NOT NULL,
  `RincianSD` varchar(100) NOT NULL,
  `Anggaran` varchar(100) NOT NULL,
  `AnggaranPAK` varchar(100) NOT NULL,
  `AnggaranStlhPAK` varchar(100) NOT NULL,
  `Belanja` varchar(100) NOT NULL,
  `Kd_keg` varchar(100) NOT NULL,
  `SumberDana` varchar(100) NOT NULL,
  `Kd_Desa` varchar(100) NOT NULL,
  `TglPosting` varchar(100) NOT NULL,
  `Kd_SubRinci` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_keuangan_ta_anggaran_master_fk` (`id_keuangan_master`),
  CONSTRAINT `id_keuangan_ta_anggaran_master_fk` FOREIGN KEY (`id_keuangan_master`) REFERENCES `keuangan_master` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `keuangan_ta_anggaran_log`
--

DROP TABLE IF EXISTS `keuangan_ta_anggaran_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `keuangan_ta_anggaran_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_keuangan_master` int NOT NULL,
  `KdPosting` varchar(100) NOT NULL,
  `Tahun` varchar(100) NOT NULL,
  `Kd_Desa` varchar(100) NOT NULL,
  `No_Perdes` varchar(100) NOT NULL,
  `TglPosting` varchar(100) NOT NULL,
  `UserID` varchar(50) NOT NULL,
  `Kunci` varchar(100) NOT NULL,
  `No_Perkades` varchar(100) DEFAULT NULL,
  `Petugas` varchar(80) DEFAULT NULL,
  `Tanggal` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_keuangan_ta_anggaran_log_master_fk` (`id_keuangan_master`),
  CONSTRAINT `id_keuangan_ta_anggaran_log_master_fk` FOREIGN KEY (`id_keuangan_master`) REFERENCES `keuangan_master` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `keuangan_ta_anggaran_rinci`
--

DROP TABLE IF EXISTS `keuangan_ta_anggaran_rinci`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `keuangan_ta_anggaran_rinci` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_keuangan_master` int NOT NULL,
  `KdPosting` varchar(100) NOT NULL,
  `Tahun` varchar(100) NOT NULL,
  `Kd_Desa` varchar(100) NOT NULL,
  `Kd_Keg` varchar(100) NOT NULL,
  `Kd_Rincian` varchar(100) NOT NULL,
  `Kd_SubRinci` varchar(100) NOT NULL,
  `No_Urut` varchar(100) NOT NULL,
  `Uraian` varchar(100) NOT NULL,
  `SumberDana` varchar(100) NOT NULL,
  `JmlSatuan` varchar(100) NOT NULL,
  `HrgSatuan` varchar(100) NOT NULL,
  `Satuan` varchar(100) NOT NULL,
  `Anggaran` varchar(100) NOT NULL,
  `JmlSatuanPAK` varchar(100) NOT NULL,
  `HrgSatuanPAK` varchar(100) NOT NULL,
  `AnggaranStlhPAK` varchar(100) NOT NULL,
  `AnggaranPAK` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_keuangan_ta_anggaran_rinci_master_fk` (`id_keuangan_master`),
  CONSTRAINT `id_keuangan_ta_anggaran_rinci_master_fk` FOREIGN KEY (`id_keuangan_master`) REFERENCES `keuangan_master` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `keuangan_ta_bidang`
--

DROP TABLE IF EXISTS `keuangan_ta_bidang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `keuangan_ta_bidang` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_keuangan_master` int NOT NULL,
  `Tahun` varchar(100) NOT NULL,
  `Kd_Desa` varchar(100) NOT NULL,
  `Kd_Bid` varchar(100) NOT NULL,
  `Nama_Bidang` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_keuangan_ta_bidang_master_fk` (`id_keuangan_master`),
  CONSTRAINT `id_keuangan_ta_bidang_master_fk` FOREIGN KEY (`id_keuangan_master`) REFERENCES `keuangan_master` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `keuangan_ta_desa`
--

DROP TABLE IF EXISTS `keuangan_ta_desa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `keuangan_ta_desa` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_keuangan_master` int NOT NULL,
  `Tahun` varchar(100) NOT NULL,
  `Kd_Desa` varchar(100) NOT NULL,
  `Nm_Kades` varchar(100) NOT NULL,
  `Jbt_Kades` varchar(100) NOT NULL,
  `Nm_Sekdes` varchar(100) NOT NULL,
  `NIP_Sekdes` varchar(100) NOT NULL,
  `Jbt_Sekdes` varchar(100) NOT NULL,
  `Nm_Kaur_Keu` varchar(100) NOT NULL,
  `Jbt_Kaur_Keu` varchar(100) NOT NULL,
  `Nm_Bendahara` varchar(100) NOT NULL,
  `Jbt_Bendahara` varchar(100) NOT NULL,
  `No_Perdes` varchar(100) NOT NULL,
  `Tgl_Perdes` varchar(100) NOT NULL,
  `No_Perdes_PB` varchar(100) NOT NULL,
  `Tgl_Perdes_PB` varchar(100) NOT NULL,
  `No_Perdes_PJ` varchar(100) NOT NULL,
  `Tgl_Perdes_PJ` varchar(100) NOT NULL,
  `Alamat` varchar(250) NOT NULL,
  `Ibukota` varchar(100) NOT NULL,
  `Status` varchar(100) NOT NULL,
  `NPWP` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_keuangan_ta_desa_master_fk` (`id_keuangan_master`),
  CONSTRAINT `id_keuangan_ta_desa_master_fk` FOREIGN KEY (`id_keuangan_master`) REFERENCES `keuangan_master` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `keuangan_ta_jurnal_umum`
--

DROP TABLE IF EXISTS `keuangan_ta_jurnal_umum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `keuangan_ta_jurnal_umum` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_keuangan_master` int NOT NULL,
  `Tahun` varchar(100) NOT NULL,
  `KdBuku` varchar(100) NOT NULL,
  `Kd_Desa` varchar(100) NOT NULL,
  `Tanggal` varchar(100) NOT NULL,
  `JnsBukti` varchar(100) NOT NULL,
  `NoBukti` varchar(100) NOT NULL,
  `Keterangan` varchar(100) NOT NULL,
  `DK` varchar(100) NOT NULL,
  `Debet` varchar(100) NOT NULL,
  `Kredit` varchar(100) NOT NULL,
  `Jenis` varchar(100) NOT NULL,
  `Posted` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_keuangan_ta_jurnal_umum_master_fk` (`id_keuangan_master`),
  CONSTRAINT `id_keuangan_ta_jurnal_umum_master_fk` FOREIGN KEY (`id_keuangan_master`) REFERENCES `keuangan_master` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `keuangan_ta_jurnal_umum_rinci`
--

DROP TABLE IF EXISTS `keuangan_ta_jurnal_umum_rinci`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `keuangan_ta_jurnal_umum_rinci` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_keuangan_master` int NOT NULL,
  `Tahun` varchar(100) NOT NULL,
  `NoBukti` varchar(100) NOT NULL,
  `Kd_Keg` varchar(100) NOT NULL,
  `RincianSD` varchar(100) NOT NULL,
  `NoID` varchar(100) NOT NULL,
  `Kd_Desa` varchar(100) NOT NULL,
  `Akun` varchar(100) NOT NULL,
  `Kd_Rincian` varchar(100) NOT NULL,
  `Sumberdana` varchar(100) NOT NULL,
  `DK` varchar(100) NOT NULL,
  `Debet` varchar(100) NOT NULL,
  `Kredit` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_keuangan_ta_jurnal_umum_rinci_master_fk` (`id_keuangan_master`),
  CONSTRAINT `id_keuangan_ta_jurnal_umum_rinci_master_fk` FOREIGN KEY (`id_keuangan_master`) REFERENCES `keuangan_master` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `keuangan_ta_kegiatan`
--

DROP TABLE IF EXISTS `keuangan_ta_kegiatan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `keuangan_ta_kegiatan` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_keuangan_master` int NOT NULL,
  `Tahun` varchar(100) NOT NULL,
  `Kd_Desa` varchar(100) NOT NULL,
  `Kd_Bid` varchar(100) DEFAULT NULL,
  `Kd_Keg` varchar(100) NOT NULL,
  `ID_Keg` varchar(100) NOT NULL,
  `Nama_Kegiatan` varchar(100) NOT NULL,
  `Pagu` varchar(100) NOT NULL,
  `Pagu_PAK` varchar(100) NOT NULL,
  `Nm_PPTKD` varchar(100) NOT NULL,
  `NIP_PPTKD` varchar(100) NOT NULL,
  `Lokasi` varchar(100) NOT NULL,
  `Waktu` varchar(100) NOT NULL,
  `Keluaran` varchar(100) NOT NULL,
  `Sumberdana` varchar(100) NOT NULL,
  `Jbt_PPTKD` varchar(100) DEFAULT NULL,
  `Kd_Sub` varchar(30) DEFAULT NULL,
  `Nilai` bigint unsigned DEFAULT NULL,
  `NilaiPAK` bigint unsigned DEFAULT NULL,
  `Satuan` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_keuangan_ta_kegiatan_master_fk` (`id_keuangan_master`),
  CONSTRAINT `id_keuangan_ta_kegiatan_master_fk` FOREIGN KEY (`id_keuangan_master`) REFERENCES `keuangan_master` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `keuangan_ta_mutasi`
--

DROP TABLE IF EXISTS `keuangan_ta_mutasi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `keuangan_ta_mutasi` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_keuangan_master` int NOT NULL,
  `Tahun` varchar(100) NOT NULL,
  `Kd_Desa` varchar(100) NOT NULL,
  `No_Bukti` varchar(100) NOT NULL,
  `Tgl_Bukti` varchar(100) NOT NULL,
  `Keterangan` varchar(200) DEFAULT NULL,
  `Kd_Bank` varchar(100) DEFAULT NULL,
  `Kd_Rincian` varchar(100) NOT NULL,
  `Kd_Keg` varchar(100) NOT NULL,
  `Sumberdana` varchar(100) NOT NULL,
  `Kd_Mutasi` varchar(100) NOT NULL,
  `Nilai` varchar(100) NOT NULL,
  `ID_Bank` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_keuangan_ta_mutasi_master_fk` (`id_keuangan_master`),
  CONSTRAINT `id_keuangan_ta_mutasi_master_fk` FOREIGN KEY (`id_keuangan_master`) REFERENCES `keuangan_master` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `keuangan_ta_pajak`
--

DROP TABLE IF EXISTS `keuangan_ta_pajak`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `keuangan_ta_pajak` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_keuangan_master` int NOT NULL,
  `Tahun` varchar(100) NOT NULL,
  `Kd_Desa` varchar(100) NOT NULL,
  `No_SSP` varchar(100) NOT NULL,
  `Tgl_SSP` varchar(100) NOT NULL,
  `Keterangan` varchar(250) DEFAULT NULL,
  `Nama_WP` varchar(100) NOT NULL,
  `Alamat_WP` varchar(100) NOT NULL,
  `NPWP` varchar(100) NOT NULL,
  `Kd_MAP` varchar(100) NOT NULL,
  `Nm_Penyetor` varchar(100) NOT NULL,
  `Jn_Transaksi` varchar(100) NOT NULL,
  `Kd_Rincian` varchar(100) NOT NULL,
  `Jumlah` varchar(100) NOT NULL,
  `KdBayar` varchar(100) NOT NULL,
  `ID_Bank` varchar(10) DEFAULT NULL,
  `NTPN` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_keuangan_ta_pajak_master_fk` (`id_keuangan_master`),
  CONSTRAINT `id_keuangan_ta_pajak_master_fk` FOREIGN KEY (`id_keuangan_master`) REFERENCES `keuangan_master` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `keuangan_ta_pajak_rinci`
--

DROP TABLE IF EXISTS `keuangan_ta_pajak_rinci`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `keuangan_ta_pajak_rinci` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_keuangan_master` int NOT NULL,
  `Tahun` varchar(100) NOT NULL,
  `Kd_Desa` varchar(100) NOT NULL,
  `No_SSP` varchar(100) NOT NULL,
  `No_Bukti` varchar(100) NOT NULL,
  `Kd_Rincian` varchar(100) NOT NULL,
  `Nilai` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_keuangan_ta_pajak_rinci_master_fk` (`id_keuangan_master`),
  CONSTRAINT `id_keuangan_ta_pajak_rinci_master_fk` FOREIGN KEY (`id_keuangan_master`) REFERENCES `keuangan_master` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `keuangan_ta_pemda`
--

DROP TABLE IF EXISTS `keuangan_ta_pemda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `keuangan_ta_pemda` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_keuangan_master` int NOT NULL,
  `Tahun` varchar(100) NOT NULL,
  `Kd_Prov` varchar(100) NOT NULL,
  `Kd_Kab` varchar(100) NOT NULL,
  `Nama_Pemda` varchar(100) NOT NULL,
  `Nama_Provinsi` varchar(100) NOT NULL,
  `Ibukota` varchar(100) NOT NULL,
  `Alamat` varchar(100) NOT NULL,
  `Nm_Bupati` varchar(100) NOT NULL,
  `Jbt_Bupati` varchar(100) NOT NULL,
  `Logo` mediumblob,
  `C_Kode` varchar(100) NOT NULL,
  `C_Pemda` varchar(100) NOT NULL,
  `C_Data` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_keuangan_ta_pemda_master_fk` (`id_keuangan_master`),
  CONSTRAINT `id_keuangan_ta_pemda_master_fk` FOREIGN KEY (`id_keuangan_master`) REFERENCES `keuangan_master` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `keuangan_ta_pencairan`
--

DROP TABLE IF EXISTS `keuangan_ta_pencairan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `keuangan_ta_pencairan` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_keuangan_master` int NOT NULL,
  `Tahun` varchar(100) NOT NULL,
  `No_Cek` varchar(100) NOT NULL,
  `No_SPP` varchar(100) NOT NULL,
  `Tgl_Cek` varchar(100) NOT NULL,
  `Kd_Desa` varchar(100) NOT NULL,
  `Keterangan` varchar(250) DEFAULT NULL,
  `Jumlah` varchar(100) NOT NULL,
  `Potongan` varchar(100) NOT NULL,
  `KdBayar` varchar(100) NOT NULL,
  `ID_Bank` varchar(10) DEFAULT NULL,
  `Kunci` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_keuangan_ta_pencairan_master_fk` (`id_keuangan_master`),
  CONSTRAINT `id_keuangan_ta_pencairan_master_fk` FOREIGN KEY (`id_keuangan_master`) REFERENCES `keuangan_master` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `keuangan_ta_perangkat`
--

DROP TABLE IF EXISTS `keuangan_ta_perangkat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `keuangan_ta_perangkat` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_keuangan_master` int NOT NULL,
  `Tahun` varchar(100) NOT NULL,
  `Kd_Desa` varchar(100) NOT NULL,
  `Kd_Jabatan` varchar(100) NOT NULL,
  `No_ID` varchar(100) NOT NULL,
  `Nama_Perangkat` varchar(100) NOT NULL,
  `Alamat_Perangkat` varchar(100) NOT NULL,
  `Nomor_HP` varchar(100) NOT NULL,
  `Rek_Bank` varchar(100) NOT NULL,
  `Nama_Bank` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_keuangan_ta_perangkat_master_fk` (`id_keuangan_master`),
  CONSTRAINT `id_keuangan_ta_perangkat_master_fk` FOREIGN KEY (`id_keuangan_master`) REFERENCES `keuangan_master` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `keuangan_ta_rab`
--

DROP TABLE IF EXISTS `keuangan_ta_rab`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `keuangan_ta_rab` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_keuangan_master` int NOT NULL,
  `Tahun` varchar(100) NOT NULL,
  `Kd_Desa` varchar(100) NOT NULL,
  `Kd_Keg` varchar(100) NOT NULL,
  `Kd_Rincian` varchar(100) NOT NULL,
  `Anggaran` varchar(100) NOT NULL,
  `AnggaranPAK` varchar(100) NOT NULL,
  `AnggaranStlhPAK` varchar(100) NOT NULL,
  `Kd_SubRinci` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_keuangan_ta_rab_master_fk` (`id_keuangan_master`),
  CONSTRAINT `id_keuangan_ta_rab_master_fk` FOREIGN KEY (`id_keuangan_master`) REFERENCES `keuangan_master` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `keuangan_ta_rab_rinci`
--

DROP TABLE IF EXISTS `keuangan_ta_rab_rinci`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `keuangan_ta_rab_rinci` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_keuangan_master` int NOT NULL,
  `Tahun` varchar(100) NOT NULL,
  `Kd_Desa` varchar(100) NOT NULL,
  `Kd_Keg` varchar(100) NOT NULL,
  `Kd_Rincian` varchar(100) NOT NULL,
  `Kd_SubRinci` varchar(100) NOT NULL,
  `No_Urut` varchar(100) NOT NULL,
  `SumberDana` varchar(100) NOT NULL,
  `Uraian` varchar(100) NOT NULL,
  `Satuan` varchar(100) NOT NULL,
  `JmlSatuan` varchar(100) NOT NULL,
  `HrgSatuan` varchar(100) NOT NULL,
  `Anggaran` varchar(100) NOT NULL,
  `JmlSatuanPAK` varchar(100) NOT NULL,
  `HrgSatuanPAK` varchar(100) NOT NULL,
  `AnggaranStlhPAK` varchar(100) NOT NULL,
  `AnggaranPAK` varchar(100) NOT NULL,
  `Kode_SBU` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_keuangan_ta_rab_rinci_master_fk` (`id_keuangan_master`),
  CONSTRAINT `id_keuangan_ta_rab_rinci_master_fk` FOREIGN KEY (`id_keuangan_master`) REFERENCES `keuangan_master` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `keuangan_ta_rab_sub`
--

DROP TABLE IF EXISTS `keuangan_ta_rab_sub`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `keuangan_ta_rab_sub` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_keuangan_master` int NOT NULL,
  `Tahun` varchar(100) NOT NULL,
  `Kd_Desa` varchar(100) NOT NULL,
  `Kd_Keg` varchar(100) NOT NULL,
  `Kd_Rincian` varchar(100) NOT NULL,
  `Kd_SubRinci` varchar(100) NOT NULL,
  `Nama_SubRinci` varchar(100) NOT NULL,
  `Anggaran` varchar(100) NOT NULL,
  `AnggaranPAK` varchar(100) NOT NULL,
  `AnggaranStlhPAK` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_keuangan_ta_rab_sub_master_fk` (`id_keuangan_master`),
  CONSTRAINT `id_keuangan_ta_rab_sub_master_fk` FOREIGN KEY (`id_keuangan_master`) REFERENCES `keuangan_master` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `keuangan_ta_rpjm_bidang`
--

DROP TABLE IF EXISTS `keuangan_ta_rpjm_bidang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `keuangan_ta_rpjm_bidang` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_keuangan_master` int NOT NULL,
  `Kd_Desa` varchar(100) NOT NULL,
  `Kd_Bid` varchar(100) NOT NULL,
  `Nama_Bidang` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_keuangan_ta_rpjm_bidang_master_fk` (`id_keuangan_master`),
  CONSTRAINT `id_keuangan_ta_rpjm_bidang_master_fk` FOREIGN KEY (`id_keuangan_master`) REFERENCES `keuangan_master` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `keuangan_ta_rpjm_kegiatan`
--

DROP TABLE IF EXISTS `keuangan_ta_rpjm_kegiatan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `keuangan_ta_rpjm_kegiatan` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_keuangan_master` int NOT NULL,
  `Kd_Desa` varchar(100) NOT NULL,
  `Kd_Bid` varchar(100) DEFAULT NULL,
  `Kd_Keg` varchar(100) NOT NULL,
  `ID_Keg` varchar(100) NOT NULL,
  `Nama_Kegiatan` varchar(100) NOT NULL,
  `Lokasi` varchar(100) NOT NULL,
  `Keluaran` varchar(100) NOT NULL,
  `Kd_Sas` varchar(100) NOT NULL,
  `Sasaran` varchar(100) NOT NULL,
  `Tahun1` varchar(100) NOT NULL,
  `Tahun2` varchar(100) NOT NULL,
  `Tahun3` varchar(100) NOT NULL,
  `Tahun4` varchar(100) NOT NULL,
  `Tahun5` varchar(100) NOT NULL,
  `Tahun6` varchar(100) NOT NULL,
  `Swakelola` varchar(100) NOT NULL,
  `Kerjasama` varchar(100) NOT NULL,
  `Pihak_Ketiga` varchar(100) NOT NULL,
  `Sumberdana` varchar(100) NOT NULL,
  `Kd_Sub` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_keuangan_ta_rpjm_kegiatan_master_fk` (`id_keuangan_master`),
  CONSTRAINT `id_keuangan_ta_rpjm_kegiatan_master_fk` FOREIGN KEY (`id_keuangan_master`) REFERENCES `keuangan_master` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `keuangan_ta_rpjm_misi`
--

DROP TABLE IF EXISTS `keuangan_ta_rpjm_misi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `keuangan_ta_rpjm_misi` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_keuangan_master` int NOT NULL,
  `ID_Misi` varchar(100) NOT NULL,
  `Kd_Desa` varchar(100) NOT NULL,
  `ID_Visi` varchar(100) NOT NULL,
  `No_Misi` varchar(100) NOT NULL,
  `Uraian_Misi` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_keuangan_ta_rpjm_misi_master_fk` (`id_keuangan_master`),
  CONSTRAINT `id_keuangan_ta_rpjm_misi_master_fk` FOREIGN KEY (`id_keuangan_master`) REFERENCES `keuangan_master` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `keuangan_ta_rpjm_pagu_indikatif`
--

DROP TABLE IF EXISTS `keuangan_ta_rpjm_pagu_indikatif`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `keuangan_ta_rpjm_pagu_indikatif` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_keuangan_master` int NOT NULL,
  `Kd_Desa` varchar(100) NOT NULL,
  `Kd_Keg` varchar(100) NOT NULL,
  `Kd_Sumber` varchar(100) NOT NULL,
  `Tahun1` varchar(100) NOT NULL,
  `Tahun2` varchar(100) NOT NULL,
  `Tahun3` varchar(100) NOT NULL,
  `Tahun4` varchar(100) NOT NULL,
  `Tahun5` varchar(100) NOT NULL,
  `Tahun6` varchar(100) NOT NULL,
  `Pola` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_keuangan_ta_rpjm_pagu_indikatif_master_fk` (`id_keuangan_master`),
  CONSTRAINT `id_keuangan_ta_rpjm_pagu_indikatif_master_fk` FOREIGN KEY (`id_keuangan_master`) REFERENCES `keuangan_master` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `keuangan_ta_rpjm_pagu_tahunan`
--

DROP TABLE IF EXISTS `keuangan_ta_rpjm_pagu_tahunan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `keuangan_ta_rpjm_pagu_tahunan` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_keuangan_master` int NOT NULL,
  `Kd_Desa` varchar(100) NOT NULL,
  `Kd_Keg` varchar(100) NOT NULL,
  `Kd_Tahun` varchar(100) NOT NULL,
  `Kd_Sumber` varchar(100) NOT NULL,
  `Biaya` varchar(100) NOT NULL,
  `Volume` varchar(100) NOT NULL,
  `Satuan` varchar(100) NOT NULL,
  `Lokasi_Spesifik` varchar(100) NOT NULL,
  `Jml_Sas_Pria` varchar(100) NOT NULL,
  `Jml_Sas_Wanita` varchar(100) NOT NULL,
  `Jml_Sas_ARTM` varchar(100) NOT NULL,
  `Waktu` varchar(100) NOT NULL,
  `Mulai` varchar(100) NOT NULL,
  `Selesai` varchar(100) NOT NULL,
  `Pola_Kegiatan` varchar(100) NOT NULL,
  `Pelaksana` varchar(100) NOT NULL,
  `No_ID` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_keuangan_ta_rpjm_pagu_tahunan_master_fk` (`id_keuangan_master`),
  CONSTRAINT `id_keuangan_ta_rpjm_pagu_tahunan_master_fk` FOREIGN KEY (`id_keuangan_master`) REFERENCES `keuangan_master` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `keuangan_ta_rpjm_sasaran`
--

DROP TABLE IF EXISTS `keuangan_ta_rpjm_sasaran`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `keuangan_ta_rpjm_sasaran` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_keuangan_master` int NOT NULL,
  `ID_Sasaran` varchar(100) NOT NULL,
  `Kd_Desa` varchar(100) NOT NULL,
  `ID_Tujuan` varchar(100) NOT NULL,
  `No_Sasaran` varchar(100) NOT NULL,
  `Uraian_Sasaran` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_keuangan_ta_rpjm_sasaran_master_fk` (`id_keuangan_master`),
  CONSTRAINT `id_keuangan_ta_rpjm_sasaran_master_fk` FOREIGN KEY (`id_keuangan_master`) REFERENCES `keuangan_master` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `keuangan_ta_rpjm_tujuan`
--

DROP TABLE IF EXISTS `keuangan_ta_rpjm_tujuan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `keuangan_ta_rpjm_tujuan` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_keuangan_master` int NOT NULL,
  `ID_Tujuan` varchar(100) NOT NULL,
  `Kd_Desa` varchar(100) NOT NULL,
  `ID_Misi` varchar(100) NOT NULL,
  `No_Tujuan` varchar(100) NOT NULL,
  `Uraian_Tujuan` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_keuangan_ta_rpjm_tujuan_master_fk` (`id_keuangan_master`),
  CONSTRAINT `id_keuangan_ta_rpjm_tujuan_master_fk` FOREIGN KEY (`id_keuangan_master`) REFERENCES `keuangan_master` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `keuangan_ta_rpjm_visi`
--

DROP TABLE IF EXISTS `keuangan_ta_rpjm_visi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `keuangan_ta_rpjm_visi` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_keuangan_master` int NOT NULL,
  `ID_Visi` varchar(100) NOT NULL,
  `Kd_Desa` varchar(100) NOT NULL,
  `No_Visi` varchar(100) NOT NULL,
  `Uraian_Visi` varchar(250) DEFAULT NULL,
  `TahunA` varchar(100) NOT NULL,
  `TahunN` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_keuangan_ta_rpjm_visi_master_fk` (`id_keuangan_master`),
  CONSTRAINT `id_keuangan_ta_rpjm_visi_master_fk` FOREIGN KEY (`id_keuangan_master`) REFERENCES `keuangan_master` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `keuangan_ta_saldo_awal`
--

DROP TABLE IF EXISTS `keuangan_ta_saldo_awal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `keuangan_ta_saldo_awal` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_keuangan_master` int NOT NULL,
  `Tahun` varchar(100) NOT NULL,
  `Kd_Desa` varchar(100) NOT NULL,
  `Kd_Rincian` varchar(100) NOT NULL,
  `Jenis` varchar(100) NOT NULL,
  `Anggaran` varchar(100) NOT NULL,
  `Debet` varchar(100) NOT NULL,
  `Kredit` varchar(100) NOT NULL,
  `Tgl_Bukti` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_keuangan_ta_saldo_awal_master_fk` (`id_keuangan_master`),
  CONSTRAINT `id_keuangan_ta_saldo_awal_master_fk` FOREIGN KEY (`id_keuangan_master`) REFERENCES `keuangan_master` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `keuangan_ta_spj`
--

DROP TABLE IF EXISTS `keuangan_ta_spj`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `keuangan_ta_spj` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_keuangan_master` int NOT NULL,
  `Tahun` varchar(100) NOT NULL,
  `No_SPJ` varchar(100) NOT NULL,
  `Tgl_SPJ` varchar(100) NOT NULL,
  `Kd_Desa` varchar(100) NOT NULL,
  `No_SPP` varchar(100) NOT NULL,
  `Keterangan` varchar(100) NOT NULL,
  `Jumlah` varchar(100) NOT NULL,
  `Potongan` varchar(100) NOT NULL,
  `Status` varchar(100) NOT NULL,
  `Kunci` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_keuangan_ta_spj_master_fk` (`id_keuangan_master`),
  CONSTRAINT `id_keuangan_ta_spj_master_fk` FOREIGN KEY (`id_keuangan_master`) REFERENCES `keuangan_master` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `keuangan_ta_spj_bukti`
--

DROP TABLE IF EXISTS `keuangan_ta_spj_bukti`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `keuangan_ta_spj_bukti` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_keuangan_master` int NOT NULL,
  `Tahun` varchar(100) NOT NULL,
  `No_SPJ` varchar(100) NOT NULL,
  `Kd_Keg` varchar(100) NOT NULL,
  `Kd_Rincian` varchar(100) NOT NULL,
  `No_Bukti` varchar(100) NOT NULL,
  `Tgl_Bukti` varchar(100) NOT NULL,
  `Sumberdana` varchar(100) NOT NULL,
  `Kd_Desa` varchar(100) NOT NULL,
  `Nm_Penerima` varchar(100) NOT NULL,
  `Alamat` varchar(100) NOT NULL,
  `Rek_Bank` varchar(100) NOT NULL,
  `Nm_Bank` varchar(100) NOT NULL,
  `NPWP` varchar(100) NOT NULL,
  `Keterangan` varchar(250) DEFAULT NULL,
  `Nilai` varchar(100) NOT NULL,
  `Kd_SubRinci` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_keuangan_ta_spj_bukti_master_fk` (`id_keuangan_master`),
  CONSTRAINT `id_keuangan_ta_spj_bukti_master_fk` FOREIGN KEY (`id_keuangan_master`) REFERENCES `keuangan_master` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `keuangan_ta_spj_rinci`
--

DROP TABLE IF EXISTS `keuangan_ta_spj_rinci`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `keuangan_ta_spj_rinci` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_keuangan_master` int NOT NULL,
  `Tahun` varchar(100) NOT NULL,
  `No_SPJ` varchar(100) NOT NULL,
  `Kd_Keg` varchar(100) NOT NULL,
  `Kd_Rincian` varchar(100) NOT NULL,
  `Sumberdana` varchar(100) NOT NULL,
  `Kd_Desa` varchar(100) NOT NULL,
  `No_SPP` varchar(100) NOT NULL,
  `JmlCair` varchar(100) NOT NULL,
  `Nilai` varchar(100) NOT NULL,
  `Alamat` varchar(100) DEFAULT NULL,
  `Sisa` varchar(100) NOT NULL,
  `Kd_SubRinci` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_keuangan_ta_spj_rinci_master_fk` (`id_keuangan_master`),
  CONSTRAINT `id_keuangan_ta_spj_rinci_master_fk` FOREIGN KEY (`id_keuangan_master`) REFERENCES `keuangan_master` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `keuangan_ta_spj_sisa`
--

DROP TABLE IF EXISTS `keuangan_ta_spj_sisa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `keuangan_ta_spj_sisa` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_keuangan_master` int NOT NULL,
  `Tahun` varchar(100) NOT NULL,
  `Kd_Desa` varchar(100) NOT NULL,
  `No_Bukti` varchar(100) NOT NULL,
  `Tgl_Bukti` varchar(100) NOT NULL,
  `No_SPJ` varchar(100) NOT NULL,
  `Tgl_SPJ` varchar(100) NOT NULL,
  `No_SPP` varchar(100) NOT NULL,
  `Tgl_SPP` varchar(100) NOT NULL,
  `Kd_Keg` varchar(100) NOT NULL,
  `Keterangan` varchar(100) NOT NULL,
  `Nilai` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_keuangan_ta_spj_sisa_master_fk` (`id_keuangan_master`),
  CONSTRAINT `id_keuangan_ta_spj_sisa_master_fk` FOREIGN KEY (`id_keuangan_master`) REFERENCES `keuangan_master` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `keuangan_ta_spjpot`
--

DROP TABLE IF EXISTS `keuangan_ta_spjpot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `keuangan_ta_spjpot` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_keuangan_master` int NOT NULL,
  `Tahun` varchar(100) NOT NULL,
  `Kd_Desa` varchar(100) NOT NULL,
  `No_SPJ` varchar(100) NOT NULL,
  `Kd_Keg` varchar(100) NOT NULL,
  `No_Bukti` varchar(100) NOT NULL,
  `Kd_Rincian` varchar(100) NOT NULL,
  `Nilai` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_keuangan_ta_spjpot_master_fk` (`id_keuangan_master`),
  CONSTRAINT `id_keuangan_ta_spjpot_master_fk` FOREIGN KEY (`id_keuangan_master`) REFERENCES `keuangan_master` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `keuangan_ta_spp`
--

DROP TABLE IF EXISTS `keuangan_ta_spp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `keuangan_ta_spp` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_keuangan_master` int NOT NULL,
  `Tahun` varchar(100) NOT NULL,
  `No_SPP` varchar(100) NOT NULL,
  `Tgl_SPP` varchar(100) NOT NULL,
  `Jn_SPP` varchar(100) NOT NULL,
  `Kd_Desa` varchar(100) NOT NULL,
  `Keterangan` varchar(250) DEFAULT NULL,
  `Jumlah` varchar(100) NOT NULL,
  `Potongan` varchar(100) NOT NULL,
  `Status` varchar(100) NOT NULL,
  `F10` varchar(10) DEFAULT NULL,
  `F11` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_keuangan_ta_spp_master_fk` (`id_keuangan_master`),
  CONSTRAINT `id_keuangan_ta_spp_master_fk` FOREIGN KEY (`id_keuangan_master`) REFERENCES `keuangan_master` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `keuangan_ta_spp_rinci`
--

DROP TABLE IF EXISTS `keuangan_ta_spp_rinci`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `keuangan_ta_spp_rinci` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_keuangan_master` int NOT NULL,
  `Tahun` varchar(100) NOT NULL,
  `Kd_Desa` varchar(100) NOT NULL,
  `No_SPP` varchar(100) NOT NULL,
  `Kd_Keg` varchar(100) NOT NULL,
  `Kd_Rincian` varchar(100) NOT NULL,
  `Sumberdana` varchar(100) NOT NULL,
  `Nilai` varchar(100) NOT NULL,
  `Kd_SubRinci` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_keuangan_ta_spp_rinci_master_fk` (`id_keuangan_master`),
  CONSTRAINT `id_keuangan_ta_spp_rinci_master_fk` FOREIGN KEY (`id_keuangan_master`) REFERENCES `keuangan_master` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `keuangan_ta_sppbukti`
--

DROP TABLE IF EXISTS `keuangan_ta_sppbukti`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `keuangan_ta_sppbukti` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_keuangan_master` int NOT NULL,
  `Tahun` varchar(100) NOT NULL,
  `Kd_Desa` varchar(100) NOT NULL,
  `No_SPP` varchar(100) NOT NULL,
  `Kd_Keg` varchar(100) NOT NULL,
  `Kd_Rincian` varchar(100) NOT NULL,
  `Sumberdana` varchar(100) NOT NULL,
  `No_Bukti` varchar(100) NOT NULL,
  `Tgl_Bukti` varchar(100) NOT NULL,
  `Nm_Penerima` varchar(100) NOT NULL,
  `Alamat` varchar(100) NOT NULL,
  `Rek_Bank` varchar(100) NOT NULL,
  `Nm_Bank` varchar(100) NOT NULL,
  `NPWP` varchar(100) NOT NULL,
  `Keterangan` varchar(200) DEFAULT NULL,
  `Nilai` varchar(100) NOT NULL,
  `Kd_SubRinci` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_keuangan_ta_sppbukti_master_fk` (`id_keuangan_master`),
  CONSTRAINT `id_keuangan_ta_sppbukti_master_fk` FOREIGN KEY (`id_keuangan_master`) REFERENCES `keuangan_master` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `keuangan_ta_spppot`
--

DROP TABLE IF EXISTS `keuangan_ta_spppot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `keuangan_ta_spppot` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_keuangan_master` int NOT NULL,
  `Tahun` varchar(100) NOT NULL,
  `Kd_Desa` varchar(100) NOT NULL,
  `No_SPP` varchar(100) NOT NULL,
  `Kd_Keg` varchar(100) NOT NULL,
  `No_Bukti` varchar(100) NOT NULL,
  `Kd_Rincian` varchar(100) NOT NULL,
  `Nilai` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_keuangan_ta_spppot_master_fk` (`id_keuangan_master`),
  CONSTRAINT `id_keuangan_ta_spppot_master_fk` FOREIGN KEY (`id_keuangan_master`) REFERENCES `keuangan_master` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `keuangan_ta_sts`
--

DROP TABLE IF EXISTS `keuangan_ta_sts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `keuangan_ta_sts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_keuangan_master` int NOT NULL,
  `Tahun` varchar(100) NOT NULL,
  `No_Bukti` varchar(100) NOT NULL,
  `Tgl_Bukti` varchar(100) NOT NULL,
  `Kd_Desa` varchar(100) NOT NULL,
  `Uraian` varchar(100) NOT NULL,
  `NoRek_Bank` varchar(100) NOT NULL,
  `Nama_Bank` varchar(100) NOT NULL,
  `Jumlah` varchar(100) NOT NULL,
  `Nm_Bendahara` varchar(100) NOT NULL,
  `Jbt_Bendahara` varchar(100) NOT NULL,
  `ID_Bank` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_keuangan_ta_sts_master_fk` (`id_keuangan_master`),
  CONSTRAINT `id_keuangan_ta_sts_master_fk` FOREIGN KEY (`id_keuangan_master`) REFERENCES `keuangan_master` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `keuangan_ta_sts_rinci`
--

DROP TABLE IF EXISTS `keuangan_ta_sts_rinci`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `keuangan_ta_sts_rinci` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_keuangan_master` int NOT NULL,
  `Tahun` varchar(100) NOT NULL,
  `Kd_Desa` varchar(100) NOT NULL,
  `No_Bukti` varchar(100) NOT NULL,
  `No_TBP` varchar(100) NOT NULL,
  `Uraian` varchar(100) NOT NULL,
  `Nilai` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_keuangan_ta_sts_rinci_master_fk` (`id_keuangan_master`),
  CONSTRAINT `id_keuangan_ta_sts_rinci_master_fk` FOREIGN KEY (`id_keuangan_master`) REFERENCES `keuangan_master` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `keuangan_ta_tbp`
--

DROP TABLE IF EXISTS `keuangan_ta_tbp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `keuangan_ta_tbp` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_keuangan_master` int NOT NULL,
  `Tahun` varchar(100) NOT NULL,
  `No_Bukti` varchar(100) NOT NULL,
  `Tgl_Bukti` varchar(100) NOT NULL,
  `Kd_Desa` varchar(100) NOT NULL,
  `Uraian` varchar(250) DEFAULT NULL,
  `Nm_Penyetor` varchar(100) NOT NULL,
  `Alamat_Penyetor` varchar(100) NOT NULL,
  `TTD_Penyetor` varchar(100) NOT NULL,
  `NoRek_Bank` varchar(100) NOT NULL,
  `Nama_Bank` varchar(100) NOT NULL,
  `Jumlah` varchar(100) NOT NULL,
  `Nm_Bendahara` varchar(100) NOT NULL,
  `Jbt_Bendahara` varchar(100) NOT NULL,
  `Status` varchar(100) NOT NULL,
  `KdBayar` varchar(100) NOT NULL,
  `Ref_Bayar` varchar(100) NOT NULL,
  `ID_Bank` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_keuangan_ta_tbp_master_fk` (`id_keuangan_master`),
  CONSTRAINT `id_keuangan_ta_tbp_master_fk` FOREIGN KEY (`id_keuangan_master`) REFERENCES `keuangan_master` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `keuangan_ta_tbp_rinci`
--

DROP TABLE IF EXISTS `keuangan_ta_tbp_rinci`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `keuangan_ta_tbp_rinci` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_keuangan_master` int NOT NULL,
  `Tahun` varchar(100) NOT NULL,
  `No_Bukti` varchar(100) NOT NULL,
  `Kd_Desa` varchar(100) NOT NULL,
  `Kd_Keg` varchar(100) NOT NULL,
  `Kd_Rincian` varchar(100) NOT NULL,
  `RincianSD` varchar(100) NOT NULL,
  `SumberDana` varchar(100) NOT NULL,
  `nilai` varchar(100) NOT NULL,
  `Kd_SubRinci` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_keuangan_ta_tbp_rinci_master_fk` (`id_keuangan_master`),
  CONSTRAINT `id_keuangan_ta_tbp_rinci_master_fk` FOREIGN KEY (`id_keuangan_master`) REFERENCES `keuangan_master` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `keuangan_ta_triwulan`
--

DROP TABLE IF EXISTS `keuangan_ta_triwulan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `keuangan_ta_triwulan` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_keuangan_master` int NOT NULL,
  `KURincianSD` varchar(100) NOT NULL,
  `Tahun` varchar(100) NOT NULL,
  `Sifat` varchar(100) NOT NULL,
  `SumberDana` varchar(100) NOT NULL,
  `Kd_Desa` varchar(100) NOT NULL,
  `Kd_Keg` varchar(100) NOT NULL,
  `Kd_Rincian` varchar(100) NOT NULL,
  `Anggaran` varchar(100) NOT NULL,
  `AnggaranPAK` varchar(100) NOT NULL,
  `Tw1Rinci` varchar(100) DEFAULT NULL,
  `Tw2Rinci` varchar(100) DEFAULT NULL,
  `Tw3Rinci` varchar(100) DEFAULT NULL,
  `Tw4Rinci` varchar(100) DEFAULT NULL,
  `KunciData` varchar(100) NOT NULL,
  `Jan` varchar(100) DEFAULT NULL,
  `Peb` varchar(100) DEFAULT NULL,
  `Mar` varchar(100) DEFAULT NULL,
  `Apr` varchar(100) DEFAULT NULL,
  `Mei` varchar(100) DEFAULT NULL,
  `Jun` varchar(100) DEFAULT NULL,
  `Jul` varchar(100) DEFAULT NULL,
  `Agt` varchar(100) DEFAULT NULL,
  `Sep` varchar(100) DEFAULT NULL,
  `Okt` varchar(100) DEFAULT NULL,
  `Nop` varchar(100) DEFAULT NULL,
  `Des` varchar(100) DEFAULT NULL,
  `Kd_SubRinci` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_keuangan_ta_triwulan_master_fk` (`id_keuangan_master`),
  CONSTRAINT `id_keuangan_ta_triwulan_master_fk` FOREIGN KEY (`id_keuangan_master`) REFERENCES `keuangan_master` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `keuangan_ta_triwulan_rinci`
--

DROP TABLE IF EXISTS `keuangan_ta_triwulan_rinci`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `keuangan_ta_triwulan_rinci` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_keuangan_master` int NOT NULL,
  `KdPosting` varchar(100) NOT NULL,
  `KURincianSD` varchar(100) NOT NULL,
  `Tahun` varchar(100) NOT NULL,
  `Sifat` varchar(100) NOT NULL,
  `SumberDana` varchar(100) NOT NULL,
  `Kd_Desa` varchar(100) NOT NULL,
  `Kd_Keg` varchar(100) NOT NULL,
  `Kd_Rincian` varchar(100) NOT NULL,
  `Anggaran` varchar(100) NOT NULL,
  `AnggaranPAK` varchar(100) NOT NULL,
  `Tw1Rinci` varchar(100) DEFAULT NULL,
  `Tw2Rinci` varchar(100) DEFAULT NULL,
  `Tw3Rinci` varchar(100) DEFAULT NULL,
  `Tw4Rinci` varchar(100) DEFAULT NULL,
  `KunciData` varchar(100) NOT NULL,
  `Jan` varchar(100) DEFAULT NULL,
  `Peb` varchar(100) DEFAULT NULL,
  `Mar` varchar(100) DEFAULT NULL,
  `Apr` varchar(100) DEFAULT NULL,
  `Mei` varchar(100) DEFAULT NULL,
  `Jun` varchar(100) DEFAULT NULL,
  `Jul` varchar(100) DEFAULT NULL,
  `Agt` varchar(100) DEFAULT NULL,
  `Sep` varchar(100) DEFAULT NULL,
  `Okt` varchar(100) DEFAULT NULL,
  `Nop` varchar(100) DEFAULT NULL,
  `Des` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_keuangan_ta_triwulan_rinci_master_fk` (`id_keuangan_master`),
  CONSTRAINT `id_keuangan_ta_triwulan_rinci_master_fk` FOREIGN KEY (`id_keuangan_master`) REFERENCES `keuangan_master` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `klasifikasi_analisis_keluarga`
--

DROP TABLE IF EXISTS `klasifikasi_analisis_keluarga`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `klasifikasi_analisis_keluarga` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nama` varchar(20) NOT NULL,
  `jenis` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `klasifikasi_surat`
--

DROP TABLE IF EXISTS `klasifikasi_surat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `klasifikasi_surat` (
  `id` int NOT NULL AUTO_INCREMENT,
  `kode` varchar(50) NOT NULL,
  `nama` varchar(250) NOT NULL,
  `uraian` mediumtext NOT NULL,
  `enabled` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2335 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `komentar`
--

DROP TABLE IF EXISTS `komentar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `komentar` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_artikel` int NOT NULL,
  `owner` varchar(50) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `subjek` tinytext,
  `komentar` text NOT NULL,
  `tgl_upload` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` tinyint(1) DEFAULT NULL,
  `tipe` tinyint(1) DEFAULT NULL,
  `no_hp` varchar(15) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_archived` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `kontak`
--

DROP TABLE IF EXISTS `kontak`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kontak` (
  `id_kontak` int NOT NULL AUTO_INCREMENT,
  `id_pend` int DEFAULT NULL,
  `no_hp` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id_kontak`),
  KEY `kontak_ke_tweb_penduduk` (`id_pend`),
  CONSTRAINT `kontak_ke_tweb_penduduk` FOREIGN KEY (`id_pend`) REFERENCES `tweb_penduduk` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `kontak_grup`
--

DROP TABLE IF EXISTS `kontak_grup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kontak_grup` (
  `id_grup` int NOT NULL AUTO_INCREMENT,
  `nama_grup` varchar(30) NOT NULL,
  PRIMARY KEY (`id_grup`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `line`
--

DROP TABLE IF EXISTS `line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `line` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) NOT NULL,
  `simbol` varchar(50) DEFAULT NULL,
  `color` varchar(10) NOT NULL DEFAULT 'ff0000',
  `tipe` int DEFAULT '0',
  `parrent` int DEFAULT '1',
  `enabled` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `parrent` (`parrent`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `log_bulanan`
--

DROP TABLE IF EXISTS `log_bulanan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_bulanan` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pend` int NOT NULL,
  `wni_lk` int DEFAULT NULL,
  `wni_pr` int DEFAULT NULL,
  `kk` int NOT NULL,
  `tgl` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `kk_lk` int DEFAULT NULL,
  `kk_pr` int DEFAULT NULL,
  `wna_lk` int DEFAULT NULL,
  `wna_pr` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1620 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `log_ekspor`
--

DROP TABLE IF EXISTS `log_ekspor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_ekspor` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tgl_ekspor` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `kode_ekspor` varchar(100) NOT NULL,
  `semua` int NOT NULL DEFAULT '1',
  `dari_tgl` date DEFAULT NULL,
  `total` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `log_hapus_penduduk`
--

DROP TABLE IF EXISTS `log_hapus_penduduk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_hapus_penduduk` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_pend` int NOT NULL,
  `nik` decimal(16,0) NOT NULL,
  `foto` varchar(100) DEFAULT NULL,
  `deleted_by` varchar(100) DEFAULT NULL,
  `deleted_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `log_keluarga`
--

DROP TABLE IF EXISTS `log_keluarga`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_keluarga` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_kk` int NOT NULL,
  `kk_sex` tinyint DEFAULT NULL,
  `id_peristiwa` int NOT NULL,
  `tgl_peristiwa` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_kk` (`id_kk`,`id_peristiwa`,`tgl_peristiwa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `log_penduduk`
--

DROP TABLE IF EXISTS `log_penduduk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_penduduk` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_pend` int NOT NULL,
  `kode_peristiwa` int DEFAULT NULL,
  `meninggal_di` varchar(50) DEFAULT NULL,
  `alamat_tujuan` tinytext,
  `tgl_lapor` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `tgl_peristiwa` datetime DEFAULT CURRENT_TIMESTAMP,
  `catatan` text,
  `no_kk` decimal(16,0) DEFAULT NULL,
  `nama_kk` varchar(100) DEFAULT NULL,
  `ref_pindah` tinyint DEFAULT '1',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_by` int DEFAULT NULL,
  `maksud_tujuan_kedatangan` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_pend` (`id_pend`,`kode_peristiwa`,`tgl_peristiwa`),
  KEY `id_ref_pindah` (`ref_pindah`),
  CONSTRAINT `id_ref_pindah` FOREIGN KEY (`ref_pindah`) REFERENCES `ref_pindah` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `log_perubahan_penduduk`
--

DROP TABLE IF EXISTS `log_perubahan_penduduk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_perubahan_penduduk` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_pend` int NOT NULL,
  `id_cluster` varchar(200) NOT NULL,
  `tanggal` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `log_surat`
--

DROP TABLE IF EXISTS `log_surat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_surat` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_format_surat` int NOT NULL,
  `id_pend` int DEFAULT NULL,
  `id_pamong` int NOT NULL,
  `id_user` int NOT NULL,
  `tanggal` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `bulan` varchar(2) DEFAULT NULL,
  `tahun` varchar(4) DEFAULT NULL,
  `no_surat` varchar(20) DEFAULT NULL,
  `nama_surat` varchar(100) DEFAULT NULL,
  `lampiran` varchar(100) DEFAULT NULL,
  `nik_non_warga` decimal(16,0) DEFAULT NULL,
  `nama_non_warga` varchar(100) DEFAULT NULL,
  `keterangan` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lokasi`
--

DROP TABLE IF EXISTS `lokasi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lokasi` (
  `id` int NOT NULL AUTO_INCREMENT,
  `desk` text NOT NULL,
  `nama` varchar(50) NOT NULL,
  `enabled` int NOT NULL DEFAULT '1',
  `lat` varchar(30) DEFAULT NULL,
  `lng` varchar(30) DEFAULT NULL,
  `ref_point` int NOT NULL,
  `foto` varchar(100) DEFAULT NULL,
  `id_cluster` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ref_point` (`ref_point`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `media_sosial`
--

DROP TABLE IF EXISTS `media_sosial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media_sosial` (
  `id` int NOT NULL AUTO_INCREMENT,
  `gambar` text NOT NULL,
  `link` text,
  `nama` varchar(100) NOT NULL,
  `tipe` tinyint(1) DEFAULT '1',
  `enabled` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) NOT NULL,
  `link` varchar(500) NOT NULL,
  `tipe` int NOT NULL,
  `parrent` int NOT NULL DEFAULT '1',
  `link_tipe` tinyint(1) NOT NULL DEFAULT '0',
  `enabled` int NOT NULL DEFAULT '1',
  `urut` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=119 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `migrasi`
--

DROP TABLE IF EXISTS `migrasi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrasi` (
  `id` int NOT NULL AUTO_INCREMENT,
  `versi_database` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mutasi_cdesa`
--

DROP TABLE IF EXISTS `mutasi_cdesa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mutasi_cdesa` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `id_cdesa_masuk` int unsigned DEFAULT NULL,
  `cdesa_keluar` int unsigned DEFAULT NULL,
  `jenis_mutasi` tinyint DEFAULT NULL,
  `tanggal_mutasi` date DEFAULT NULL,
  `keterangan` text,
  `id_persil` int NOT NULL,
  `no_bidang_persil` tinyint DEFAULT NULL,
  `luas` decimal(7,0) DEFAULT NULL,
  `no_objek_pajak` varchar(30) DEFAULT NULL,
  `path` text,
  PRIMARY KEY (`id`),
  KEY `cdesa_mutasi_fk` (`id_cdesa_masuk`),
  CONSTRAINT `cdesa_mutasi_fk` FOREIGN KEY (`id_cdesa_masuk`) REFERENCES `cdesa` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mutasi_inventaris_asset`
--

DROP TABLE IF EXISTS `mutasi_inventaris_asset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mutasi_inventaris_asset` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_inventaris_asset` int DEFAULT NULL,
  `jenis_mutasi` varchar(255) NOT NULL,
  `tahun_mutasi` date NOT NULL,
  `harga_jual` double DEFAULT NULL,
  `sumbangkan` varchar(255) DEFAULT NULL,
  `keterangan` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_by` int NOT NULL,
  `visible` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `FK_mutasi_inventaris_asset` (`id_inventaris_asset`),
  CONSTRAINT `FK_mutasi_inventaris_asset` FOREIGN KEY (`id_inventaris_asset`) REFERENCES `inventaris_asset` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mutasi_inventaris_gedung`
--

DROP TABLE IF EXISTS `mutasi_inventaris_gedung`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mutasi_inventaris_gedung` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_inventaris_gedung` int DEFAULT NULL,
  `jenis_mutasi` varchar(255) NOT NULL,
  `tahun_mutasi` date NOT NULL,
  `harga_jual` double DEFAULT NULL,
  `sumbangkan` varchar(255) DEFAULT NULL,
  `keterangan` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_by` int NOT NULL,
  `visible` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `FK_mutasi_inventaris_gedung` (`id_inventaris_gedung`),
  CONSTRAINT `FK_mutasi_inventaris_gedung` FOREIGN KEY (`id_inventaris_gedung`) REFERENCES `inventaris_gedung` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mutasi_inventaris_jalan`
--

DROP TABLE IF EXISTS `mutasi_inventaris_jalan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mutasi_inventaris_jalan` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_inventaris_jalan` int DEFAULT NULL,
  `jenis_mutasi` varchar(255) NOT NULL,
  `tahun_mutasi` date NOT NULL,
  `harga_jual` double DEFAULT NULL,
  `sumbangkan` varchar(255) DEFAULT NULL,
  `keterangan` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_by` int NOT NULL,
  `visible` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `FK_mutasi_inventaris_jalan` (`id_inventaris_jalan`),
  CONSTRAINT `FK_mutasi_inventaris_jalan` FOREIGN KEY (`id_inventaris_jalan`) REFERENCES `inventaris_jalan` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mutasi_inventaris_peralatan`
--

DROP TABLE IF EXISTS `mutasi_inventaris_peralatan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mutasi_inventaris_peralatan` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_inventaris_peralatan` int DEFAULT NULL,
  `jenis_mutasi` varchar(255) NOT NULL,
  `tahun_mutasi` date NOT NULL,
  `harga_jual` double DEFAULT NULL,
  `sumbangkan` varchar(255) DEFAULT NULL,
  `keterangan` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_by` int NOT NULL,
  `visible` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `FK_mutasi_inventaris_peralatan` (`id_inventaris_peralatan`),
  CONSTRAINT `FK_mutasi_inventaris_peralatan` FOREIGN KEY (`id_inventaris_peralatan`) REFERENCES `inventaris_peralatan` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mutasi_inventaris_tanah`
--

DROP TABLE IF EXISTS `mutasi_inventaris_tanah`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mutasi_inventaris_tanah` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_inventaris_tanah` int DEFAULT NULL,
  `jenis_mutasi` varchar(255) NOT NULL,
  `tahun_mutasi` date NOT NULL,
  `harga_jual` double DEFAULT NULL,
  `sumbangkan` varchar(255) DEFAULT NULL,
  `keterangan` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_by` int NOT NULL,
  `visible` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `FK_mutasi_inventaris_tanah` (`id_inventaris_tanah`),
  CONSTRAINT `FK_mutasi_inventaris_tanah` FOREIGN KEY (`id_inventaris_tanah`) REFERENCES `inventaris_tanah` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `notifikasi`
--

DROP TABLE IF EXISTS `notifikasi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notifikasi` (
  `id` int NOT NULL AUTO_INCREMENT,
  `kode` varchar(100) NOT NULL,
  `judul` varchar(100) NOT NULL,
  `jenis` varchar(50) NOT NULL,
  `isi` text NOT NULL,
  `server` varchar(20) NOT NULL,
  `tgl_berikutnya` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_by` int NOT NULL,
  `frekuensi` smallint NOT NULL,
  `aksi` varchar(100) NOT NULL,
  `aktif` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `kode` (`kode`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `outbox`
--

DROP TABLE IF EXISTS `outbox`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `outbox` (
  `UpdatedInDB` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `InsertIntoDB` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `SendingDateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `SendBefore` time NOT NULL DEFAULT '23:59:59',
  `SendAfter` time NOT NULL DEFAULT '00:00:00',
  `Text` text,
  `DestinationNumber` varchar(20) NOT NULL DEFAULT '',
  `Coding` enum('Default_No_Compression','Unicode_No_Compression','8bit','Default_Compression','Unicode_Compression') NOT NULL DEFAULT 'Default_No_Compression',
  `UDH` text,
  `Class` int DEFAULT '-1',
  `TextDecoded` text NOT NULL,
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `MultiPart` enum('false','true') DEFAULT 'false',
  `RelativeValidity` int DEFAULT '-1',
  `SenderID` varchar(255) DEFAULT NULL,
  `SendingTimeOut` timestamp NULL DEFAULT NULL,
  `DeliveryReport` enum('default','yes','no') DEFAULT 'default',
  `CreatorID` text,
  PRIMARY KEY (`ID`),
  KEY `outbox_date` (`SendingDateTime`,`SendingTimeOut`),
  KEY `outbox_sender` (`SenderID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pembangunan`
--

DROP TABLE IF EXISTS `pembangunan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pembangunan` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_lokasi` int DEFAULT NULL,
  `sumber_dana` varchar(255) DEFAULT NULL,
  `judul` varchar(255) DEFAULT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `lokasi` varchar(225) DEFAULT NULL,
  `lat` varchar(225) DEFAULT NULL,
  `lng` varchar(255) DEFAULT NULL,
  `volume` varchar(100) DEFAULT NULL,
  `tahun_anggaran` year DEFAULT NULL,
  `pelaksana_kegiatan` varchar(255) DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `anggaran` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `id_lokasi` (`id_lokasi`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pembangunan_ref_dokumentasi`
--

DROP TABLE IF EXISTS `pembangunan_ref_dokumentasi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pembangunan_ref_dokumentasi` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_pembangunan` int NOT NULL,
  `gambar` varchar(255) DEFAULT NULL,
  `persentase` varchar(255) DEFAULT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_pembangunan` (`id_pembangunan`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `penduduk_hidup`
--

DROP TABLE IF EXISTS `penduduk_hidup`;
/*!50001 DROP VIEW IF EXISTS `penduduk_hidup`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `penduduk_hidup` AS SELECT 
 1 AS `id`,
 1 AS `nama`,
 1 AS `nik`,
 1 AS `id_kk`,
 1 AS `kk_level`,
 1 AS `id_rtm`,
 1 AS `rtm_level`,
 1 AS `sex`,
 1 AS `tempatlahir`,
 1 AS `tanggallahir`,
 1 AS `agama_id`,
 1 AS `pendidikan_kk_id`,
 1 AS `pendidikan_sedang_id`,
 1 AS `pekerjaan_id`,
 1 AS `status_kawin`,
 1 AS `warganegara_id`,
 1 AS `dokumen_pasport`,
 1 AS `dokumen_kitas`,
 1 AS `ayah_nik`,
 1 AS `ibu_nik`,
 1 AS `nama_ayah`,
 1 AS `nama_ibu`,
 1 AS `foto`,
 1 AS `golongan_darah_id`,
 1 AS `id_cluster`,
 1 AS `status`,
 1 AS `alamat_sebelumnya`,
 1 AS `alamat_sekarang`,
 1 AS `status_dasar`,
 1 AS `hamil`,
 1 AS `cacat_id`,
 1 AS `sakit_menahun_id`,
 1 AS `akta_lahir`,
 1 AS `akta_perkawinan`,
 1 AS `tanggalperkawinan`,
 1 AS `akta_perceraian`,
 1 AS `tanggalperceraian`,
 1 AS `cara_kb_id`,
 1 AS `telepon`,
 1 AS `tanggal_akhir_paspor`,
 1 AS `no_kk_sebelumnya`,
 1 AS `ktp_el`,
 1 AS `status_rekam`,
 1 AS `waktu_lahir`,
 1 AS `tempat_dilahirkan`,
 1 AS `jenis_kelahiran`,
 1 AS `kelahiran_anak_ke`,
 1 AS `penolong_kelahiran`,
 1 AS `berat_lahir`,
 1 AS `panjang_lahir`,
 1 AS `tag_id_card`,
 1 AS `created_at`,
 1 AS `created_by`,
 1 AS `updated_at`,
 1 AS `updated_by`,
 1 AS `id_asuransi`,
 1 AS `no_asuransi`,
 1 AS `email`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `permohonan_surat`
--

DROP TABLE IF EXISTS `permohonan_surat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permohonan_surat` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_pemohon` int NOT NULL,
  `id_surat` int NOT NULL,
  `isian_form` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `keterangan` text,
  `no_hp_aktif` varchar(50) NOT NULL,
  `syarat` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `persil`
--

DROP TABLE IF EXISTS `persil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `persil` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nomor` varchar(20) NOT NULL,
  `nomor_urut_bidang` tinyint NOT NULL DEFAULT '1',
  `kelas` int NOT NULL,
  `luas_persil` decimal(7,0) DEFAULT NULL,
  `id_wilayah` int DEFAULT NULL,
  `lokasi` text,
  `path` text,
  `cdesa_awal` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `nomor_nomor_urut_bidang` (`nomor`,`nomor_urut_bidang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pertanyaan`
--

DROP TABLE IF EXISTS `pertanyaan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pertanyaan` (
  `1` int DEFAULT NULL,
  `Pendapatan perkapita perbulan` varchar(87) DEFAULT NULL,
  `36` int DEFAULT NULL,
  `15` int DEFAULT NULL,
  `24` int DEFAULT NULL,
  `23` int DEFAULT NULL,
  `26` int DEFAULT NULL,
  `28` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `point`
--

DROP TABLE IF EXISTS `point`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `point` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) NOT NULL,
  `simbol` varchar(50) DEFAULT NULL,
  `tipe` int DEFAULT '0',
  `parrent` int NOT NULL DEFAULT '1',
  `enabled` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `parrent` (`parrent`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `polygon`
--

DROP TABLE IF EXISTS `polygon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `polygon` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) NOT NULL,
  `simbol` varchar(50) DEFAULT NULL,
  `color` varchar(10) NOT NULL DEFAULT 'ff0000',
  `tipe` int DEFAULT '0',
  `parrent` int DEFAULT '1',
  `enabled` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `parrent` (`parrent`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `program`
--

DROP TABLE IF EXISTS `program`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `program` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) NOT NULL,
  `sasaran` tinyint DEFAULT NULL,
  `ndesc` varchar(500) DEFAULT NULL,
  `sdate` date NOT NULL,
  `edate` date NOT NULL,
  `userid` mediumint NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `asaldana` char(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `program_peserta`
--

DROP TABLE IF EXISTS `program_peserta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `program_peserta` (
  `id` int NOT NULL AUTO_INCREMENT,
  `peserta` varchar(30) NOT NULL,
  `program_id` int NOT NULL,
  `no_id_kartu` varchar(30) DEFAULT NULL,
  `kartu_nik` varchar(30) NOT NULL,
  `kartu_nama` varchar(100) NOT NULL,
  `kartu_tempat_lahir` varchar(100) NOT NULL,
  `kartu_tanggal_lahir` date NOT NULL,
  `kartu_alamat` varchar(200) NOT NULL,
  `kartu_peserta` varchar(100) DEFAULT NULL,
  `kartu_id_pend` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `provinsi`
--

DROP TABLE IF EXISTS `provinsi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `provinsi` (
  `kode` tinyint NOT NULL DEFAULT '0',
  `nama` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`kode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ref_dokumen`
--

DROP TABLE IF EXISTS `ref_dokumen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ref_dokumen` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ref_penduduk_bahasa`
--

DROP TABLE IF EXISTS `ref_penduduk_bahasa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ref_penduduk_bahasa` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) NOT NULL,
  `inisial` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ref_peristiwa`
--

DROP TABLE IF EXISTS `ref_peristiwa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ref_peristiwa` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ref_persil_kelas`
--

DROP TABLE IF EXISTS `ref_persil_kelas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ref_persil_kelas` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `tipe` varchar(20) NOT NULL,
  `kode` varchar(20) NOT NULL,
  `ndesc` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ref_persil_mutasi`
--

DROP TABLE IF EXISTS `ref_persil_mutasi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ref_persil_mutasi` (
  `id` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(20) NOT NULL,
  `ndesc` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ref_pindah`
--

DROP TABLE IF EXISTS `ref_pindah`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ref_pindah` (
  `id` tinyint NOT NULL,
  `nama` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ref_status_covid`
--

DROP TABLE IF EXISTS `ref_status_covid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ref_status_covid` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ref_syarat_surat`
--

DROP TABLE IF EXISTS `ref_syarat_surat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ref_syarat_surat` (
  `ref_syarat_id` int unsigned NOT NULL AUTO_INCREMENT,
  `ref_syarat_nama` varchar(255) NOT NULL,
  PRIMARY KEY (`ref_syarat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sentitems`
--

DROP TABLE IF EXISTS `sentitems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sentitems` (
  `UpdatedInDB` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `InsertIntoDB` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `SendingDateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `DeliveryDateTime` timestamp NULL DEFAULT NULL,
  `Text` text NOT NULL,
  `DestinationNumber` varchar(20) NOT NULL DEFAULT '',
  `Coding` enum('Default_No_Compression','Unicode_No_Compression','8bit','Default_Compression','Unicode_Compression') NOT NULL DEFAULT 'Default_No_Compression',
  `UDH` text NOT NULL,
  `SMSCNumber` varchar(20) NOT NULL DEFAULT '',
  `Class` int NOT NULL DEFAULT '-1',
  `TextDecoded` text NOT NULL,
  `ID` int unsigned NOT NULL DEFAULT '0',
  `SenderID` varchar(255) NOT NULL,
  `SequencePosition` int NOT NULL DEFAULT '1',
  `Status` enum('SendingOK','SendingOKNoReport','SendingError','DeliveryOK','DeliveryFailed','DeliveryPending','DeliveryUnknown','Error') NOT NULL DEFAULT 'SendingOK',
  `StatusError` int NOT NULL DEFAULT '-1',
  `TPMR` int NOT NULL DEFAULT '-1',
  `RelativeValidity` int NOT NULL DEFAULT '-1',
  `CreatorID` text NOT NULL,
  PRIMARY KEY (`ID`,`SequencePosition`),
  KEY `sentitems_date` (`DeliveryDateTime`),
  KEY `sentitems_tpmr` (`TPMR`),
  KEY `sentitems_dest` (`DestinationNumber`),
  KEY `sentitems_sender` (`SenderID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `setting_aplikasi`
--

DROP TABLE IF EXISTS `setting_aplikasi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `setting_aplikasi` (
  `id` int NOT NULL AUTO_INCREMENT,
  `key` varchar(50) DEFAULT NULL,
  `value` varchar(1000) DEFAULT NULL,
  `keterangan` varchar(200) DEFAULT NULL,
  `jenis` varchar(30) DEFAULT NULL,
  `kategori` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `setting_aplikasi_options`
--

DROP TABLE IF EXISTS `setting_aplikasi_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `setting_aplikasi_options` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_setting` int NOT NULL,
  `value` varchar(512) NOT NULL,
  `kode` tinyint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_setting_fk` (`id_setting`),
  CONSTRAINT `id_setting_fk` FOREIGN KEY (`id_setting`) REFERENCES `setting_aplikasi` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `setting_modul`
--

DROP TABLE IF EXISTS `setting_modul`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `setting_modul` (
  `id` int NOT NULL AUTO_INCREMENT,
  `modul` varchar(50) NOT NULL,
  `url` varchar(50) NOT NULL,
  `aktif` tinyint(1) NOT NULL DEFAULT '0',
  `ikon` varchar(50) NOT NULL,
  `urut` tinyint NOT NULL,
  `level` tinyint(1) NOT NULL DEFAULT '2',
  `hidden` tinyint(1) NOT NULL DEFAULT '0',
  `ikon_kecil` varchar(50) NOT NULL,
  `parent` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=332 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `setting_sms`
--

DROP TABLE IF EXISTS `setting_sms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `setting_sms` (
  `autoreply_text` varchar(160) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `statistics`
--

DROP TABLE IF EXISTS `statistics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `statistics` (
  `id` int NOT NULL AUTO_INCREMENT,
  `url_id` int NOT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `url_id` (`url_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `suplemen`
--

DROP TABLE IF EXISTS `suplemen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `suplemen` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) DEFAULT NULL,
  `sasaran` tinyint DEFAULT NULL,
  `keterangan` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `suplemen_terdata`
--

DROP TABLE IF EXISTS `suplemen_terdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `suplemen_terdata` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_suplemen` int DEFAULT NULL,
  `id_terdata` varchar(20) DEFAULT NULL,
  `sasaran` tinyint DEFAULT NULL,
  `keterangan` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_suplemen` (`id_suplemen`),
  CONSTRAINT `suplemen_terdata_ibfk_1` FOREIGN KEY (`id_suplemen`) REFERENCES `suplemen` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `surat_keluar`
--

DROP TABLE IF EXISTS `surat_keluar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `surat_keluar` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nomor_urut` smallint DEFAULT NULL,
  `nomor_surat` varchar(35) DEFAULT NULL,
  `kode_surat` varchar(10) DEFAULT NULL,
  `tanggal_surat` date NOT NULL,
  `tanggal_catat` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `tujuan` varchar(100) DEFAULT NULL,
  `isi_singkat` varchar(200) DEFAULT NULL,
  `berkas_scan` varchar(100) DEFAULT NULL,
  `ekspedisi` tinyint(1) DEFAULT '0',
  `tanggal_pengiriman` date DEFAULT NULL,
  `tanda_terima` varchar(200) DEFAULT NULL,
  `keterangan` varchar(500) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_by` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `surat_masuk`
--

DROP TABLE IF EXISTS `surat_masuk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `surat_masuk` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nomor_urut` smallint DEFAULT NULL,
  `tanggal_penerimaan` date NOT NULL,
  `nomor_surat` varchar(35) DEFAULT NULL,
  `kode_surat` varchar(10) DEFAULT NULL,
  `tanggal_surat` date NOT NULL,
  `pengirim` varchar(100) DEFAULT NULL,
  `isi_singkat` varchar(200) DEFAULT NULL,
  `isi_disposisi` varchar(200) DEFAULT NULL,
  `berkas_scan` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `syarat_surat`
--

DROP TABLE IF EXISTS `syarat_surat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `syarat_surat` (
  `id` int NOT NULL AUTO_INCREMENT,
  `surat_format_id` int NOT NULL,
  `ref_syarat_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_surat_format` (`surat_format_id`),
  CONSTRAINT `id_surat_format` FOREIGN KEY (`surat_format_id`) REFERENCES `tweb_surat_format` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sys_traffic`
--

DROP TABLE IF EXISTS `sys_traffic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_traffic` (
  `Tanggal` date NOT NULL,
  `ipAddress` text NOT NULL,
  `Jumlah` int NOT NULL,
  PRIMARY KEY (`Tanggal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `teks_berjalan`
--

DROP TABLE IF EXISTS `teks_berjalan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teks_berjalan` (
  `id` int NOT NULL AUTO_INCREMENT,
  `teks` text,
  `urut` int DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_by` int DEFAULT NULL,
  `status` int NOT NULL DEFAULT '0',
  `tautan` varchar(150) DEFAULT NULL,
  `judul_tautan` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tweb_aset`
--

DROP TABLE IF EXISTS `tweb_aset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tweb_aset` (
  `id_aset` int NOT NULL,
  `golongan` varchar(11) NOT NULL,
  `bidang` varchar(11) NOT NULL,
  `kelompok` varchar(11) NOT NULL,
  `sub_kelompok` varchar(11) NOT NULL,
  `sub_sub_kelompok` varchar(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  PRIMARY KEY (`id_aset`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tweb_cacat`
--

DROP TABLE IF EXISTS `tweb_cacat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tweb_cacat` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tweb_cara_kb`
--

DROP TABLE IF EXISTS `tweb_cara_kb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tweb_cara_kb` (
  `id` tinyint NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) NOT NULL,
  `sex` tinyint DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tweb_desa_pamong`
--

DROP TABLE IF EXISTS `tweb_desa_pamong`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tweb_desa_pamong` (
  `pamong_id` int NOT NULL AUTO_INCREMENT,
  `pamong_nama` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `pamong_nip` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `pamong_nik` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `jabatan` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '0',
  `pamong_status` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `pamong_tgl_terdaftar` date DEFAULT NULL,
  `pamong_ttd` tinyint(1) DEFAULT NULL,
  `foto` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `id_pend` int DEFAULT NULL,
  `pamong_tempatlahir` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `pamong_tanggallahir` date DEFAULT NULL,
  `pamong_sex` tinyint DEFAULT NULL,
  `pamong_pendidikan` int DEFAULT NULL,
  `pamong_agama` int DEFAULT NULL,
  `pamong_nosk` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `pamong_tglsk` date DEFAULT NULL,
  `pamong_masajab` varchar(120) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `urut` int DEFAULT NULL,
  `pamong_niap` varchar(25) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '0',
  `pamong_pangkat` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `pamong_nohenti` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `pamong_tglhenti` date DEFAULT NULL,
  `pamong_ub` tinyint(1) NOT NULL DEFAULT '0',
  `atasan` int DEFAULT NULL,
  `bagan_tingkat` tinyint DEFAULT NULL,
  `bagan_offset` int DEFAULT NULL,
  `bagan_layout` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `bagan_warna` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`pamong_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tweb_golongan_darah`
--

DROP TABLE IF EXISTS `tweb_golongan_darah`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tweb_golongan_darah` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nama` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tweb_keluarga`
--

DROP TABLE IF EXISTS `tweb_keluarga`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tweb_keluarga` (
  `id` int NOT NULL AUTO_INCREMENT,
  `no_kk` varchar(160) DEFAULT NULL,
  `nik_kepala` varchar(200) DEFAULT NULL,
  `tgl_daftar` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `kelas_sosial` int DEFAULT NULL,
  `tgl_cetak_kk` datetime DEFAULT NULL,
  `alamat` varchar(200) DEFAULT NULL,
  `id_cluster` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `nik_kepala` (`nik_kepala`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tweb_keluarga_sejahtera`
--

DROP TABLE IF EXISTS `tweb_keluarga_sejahtera`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tweb_keluarga_sejahtera` (
  `id` int NOT NULL DEFAULT '0',
  `nama` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tweb_penduduk`
--

DROP TABLE IF EXISTS `tweb_penduduk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tweb_penduduk` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) NOT NULL,
  `nik` decimal(16,0) NOT NULL,
  `id_kk` int DEFAULT '0',
  `kk_level` tinyint NOT NULL DEFAULT '0',
  `id_rtm` varchar(30) DEFAULT NULL,
  `rtm_level` int DEFAULT NULL,
  `sex` tinyint unsigned DEFAULT NULL,
  `tempatlahir` varchar(100) DEFAULT NULL,
  `tanggallahir` date DEFAULT NULL,
  `agama_id` int DEFAULT NULL,
  `pendidikan_kk_id` int DEFAULT NULL,
  `pendidikan_sedang_id` int DEFAULT NULL,
  `pekerjaan_id` int DEFAULT NULL,
  `status_kawin` tinyint DEFAULT NULL,
  `warganegara_id` tinyint NOT NULL DEFAULT '1',
  `dokumen_pasport` varchar(45) DEFAULT NULL,
  `dokumen_kitas` varchar(45) DEFAULT NULL,
  `ayah_nik` varchar(16) DEFAULT NULL,
  `ibu_nik` varchar(16) DEFAULT NULL,
  `nama_ayah` varchar(100) DEFAULT NULL,
  `nama_ibu` varchar(100) DEFAULT NULL,
  `foto` varchar(100) DEFAULT NULL,
  `golongan_darah_id` int DEFAULT NULL,
  `id_cluster` int NOT NULL,
  `status` int unsigned DEFAULT NULL,
  `alamat_sebelumnya` varchar(200) DEFAULT NULL,
  `alamat_sekarang` varchar(200) DEFAULT NULL,
  `status_dasar` tinyint NOT NULL DEFAULT '1',
  `hamil` int DEFAULT NULL,
  `cacat_id` int DEFAULT NULL,
  `sakit_menahun_id` int DEFAULT NULL,
  `akta_lahir` varchar(40) DEFAULT NULL,
  `akta_perkawinan` varchar(40) DEFAULT NULL,
  `tanggalperkawinan` date DEFAULT NULL,
  `akta_perceraian` varchar(40) DEFAULT NULL,
  `tanggalperceraian` date DEFAULT NULL,
  `cara_kb_id` tinyint DEFAULT NULL,
  `telepon` varchar(20) DEFAULT NULL,
  `tanggal_akhir_paspor` date DEFAULT NULL,
  `no_kk_sebelumnya` varchar(30) DEFAULT NULL,
  `ktp_el` tinyint DEFAULT NULL,
  `status_rekam` tinyint DEFAULT NULL,
  `waktu_lahir` varchar(5) DEFAULT NULL,
  `tempat_dilahirkan` tinyint DEFAULT NULL,
  `jenis_kelahiran` tinyint DEFAULT NULL,
  `kelahiran_anak_ke` tinyint DEFAULT NULL,
  `penolong_kelahiran` tinyint DEFAULT NULL,
  `berat_lahir` smallint DEFAULT NULL,
  `panjang_lahir` varchar(10) DEFAULT NULL,
  `tag_id_card` varchar(15) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_by` int DEFAULT NULL,
  `id_asuransi` tinyint DEFAULT NULL,
  `no_asuransi` char(100) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `bahasa_id` int DEFAULT NULL,
  `ket` tinytext,
  `negara_asal` varchar(50) DEFAULT NULL,
  `tempat_cetak_ktp` varchar(50) DEFAULT NULL,
  `tanggal_cetak_ktp` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tag_id_card` (`tag_id_card`),
  KEY `id_rtm` (`id_rtm`)
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tweb_penduduk_agama`
--

DROP TABLE IF EXISTS `tweb_penduduk_agama`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tweb_penduduk_agama` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tweb_penduduk_asuransi`
--

DROP TABLE IF EXISTS `tweb_penduduk_asuransi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tweb_penduduk_asuransi` (
  `id` tinyint NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tweb_penduduk_hubungan`
--

DROP TABLE IF EXISTS `tweb_penduduk_hubungan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tweb_penduduk_hubungan` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tweb_penduduk_kawin`
--

DROP TABLE IF EXISTS `tweb_penduduk_kawin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tweb_penduduk_kawin` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tweb_penduduk_mandiri`
--

DROP TABLE IF EXISTS `tweb_penduduk_mandiri`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tweb_penduduk_mandiri` (
  `pin` char(32) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `tanggal_buat` datetime DEFAULT NULL,
  `id_pend` int NOT NULL,
  `ganti_pin` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_pend`),
  CONSTRAINT `id_pend_fk` FOREIGN KEY (`id_pend`) REFERENCES `tweb_penduduk` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tweb_penduduk_map`
--

DROP TABLE IF EXISTS `tweb_penduduk_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tweb_penduduk_map` (
  `id` int NOT NULL,
  `lat` varchar(24) DEFAULT NULL,
  `lng` varchar(24) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tweb_penduduk_pekerjaan`
--

DROP TABLE IF EXISTS `tweb_penduduk_pekerjaan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tweb_penduduk_pekerjaan` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tweb_penduduk_pendidikan`
--

DROP TABLE IF EXISTS `tweb_penduduk_pendidikan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tweb_penduduk_pendidikan` (
  `id` tinyint NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tweb_penduduk_pendidikan_kk`
--

DROP TABLE IF EXISTS `tweb_penduduk_pendidikan_kk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tweb_penduduk_pendidikan_kk` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tweb_penduduk_sex`
--

DROP TABLE IF EXISTS `tweb_penduduk_sex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tweb_penduduk_sex` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tweb_penduduk_status`
--

DROP TABLE IF EXISTS `tweb_penduduk_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tweb_penduduk_status` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tweb_penduduk_umur`
--

DROP TABLE IF EXISTS `tweb_penduduk_umur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tweb_penduduk_umur` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nama` varchar(25) DEFAULT NULL,
  `dari` int DEFAULT NULL,
  `sampai` int DEFAULT NULL,
  `status` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tweb_penduduk_warganegara`
--

DROP TABLE IF EXISTS `tweb_penduduk_warganegara`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tweb_penduduk_warganegara` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tweb_rtm`
--

DROP TABLE IF EXISTS `tweb_rtm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tweb_rtm` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nik_kepala` int NOT NULL,
  `no_kk` varchar(30) NOT NULL,
  `tgl_daftar` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `kelas_sosial` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `no_kk` (`no_kk`),
  UNIQUE KEY `no_kk_2` (`no_kk`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tweb_rtm_hubungan`
--

DROP TABLE IF EXISTS `tweb_rtm_hubungan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tweb_rtm_hubungan` (
  `id` tinyint NOT NULL AUTO_INCREMENT,
  `nama` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tweb_sakit_menahun`
--

DROP TABLE IF EXISTS `tweb_sakit_menahun`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tweb_sakit_menahun` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tweb_status_dasar`
--

DROP TABLE IF EXISTS `tweb_status_dasar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tweb_status_dasar` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tweb_status_ktp`
--

DROP TABLE IF EXISTS `tweb_status_ktp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tweb_status_ktp` (
  `id` tinyint NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) NOT NULL,
  `ktp_el` tinyint NOT NULL,
  `status_rekam` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tweb_surat_atribut`
--

DROP TABLE IF EXISTS `tweb_surat_atribut`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tweb_surat_atribut` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_surat` int NOT NULL,
  `id_tipe` tinyint NOT NULL,
  `nama` varchar(40) NOT NULL,
  `long` tinyint NOT NULL,
  `kode` tinyint NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tweb_surat_format`
--

DROP TABLE IF EXISTS `tweb_surat_format`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tweb_surat_format` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) NOT NULL,
  `url_surat` varchar(100) NOT NULL,
  `kode_surat` varchar(10) DEFAULT NULL,
  `lampiran` varchar(100) DEFAULT NULL,
  `kunci` tinyint(1) NOT NULL DEFAULT '0',
  `favorit` tinyint(1) NOT NULL DEFAULT '0',
  `jenis` tinyint NOT NULL DEFAULT '2',
  `mandiri` tinyint(1) DEFAULT '0',
  `masa_berlaku` int DEFAULT '1',
  `satuan_masa_berlaku` varchar(15) DEFAULT 'M',
  `qr_code` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `url_surat` (`url_surat`)
) ENGINE=InnoDB AUTO_INCREMENT=179 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tweb_wil_clusterdesa`
--

DROP TABLE IF EXISTS `tweb_wil_clusterdesa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tweb_wil_clusterdesa` (
  `id` int NOT NULL AUTO_INCREMENT,
  `rt` varchar(10) NOT NULL DEFAULT '0',
  `rw` varchar(10) NOT NULL DEFAULT '0',
  `dusun` varchar(50) NOT NULL DEFAULT '0',
  `id_kepala` int DEFAULT NULL,
  `lat` varchar(20) DEFAULT NULL,
  `lng` varchar(20) DEFAULT NULL,
  `zoom` int DEFAULT NULL,
  `path` text,
  `map_tipe` varchar(20) DEFAULT NULL,
  `warna` varchar(10) DEFAULT NULL,
  `urut` int DEFAULT NULL,
  `urut_cetak` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `rt` (`rt`,`rw`,`dusun`),
  KEY `id_kepala` (`id_kepala`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `urls`
--

DROP TABLE IF EXISTS `urls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `urls` (
  `id` int NOT NULL AUTO_INCREMENT,
  `url` varchar(255) NOT NULL,
  `alias` varchar(100) NOT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `alias` (`alias`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` mediumint unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `id_grup` int NOT NULL,
  `email` varchar(100) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `active` tinyint unsigned DEFAULT '0',
  `nama` varchar(50) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `foto` varchar(100) NOT NULL,
  `session` varchar(40) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_grup`
--

DROP TABLE IF EXISTS `user_grup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_grup` (
  `id` tinyint NOT NULL,
  `nama` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `widget`
--

DROP TABLE IF EXISTS `widget`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `widget` (
  `id` int NOT NULL AUTO_INCREMENT,
  `isi` text,
  `enabled` int DEFAULT NULL,
  `judul` varchar(100) DEFAULT NULL,
  `jenis_widget` tinyint NOT NULL DEFAULT '3',
  `urut` int DEFAULT NULL,
  `form_admin` varchar(100) DEFAULT NULL,
  `setting` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Final view structure for view `daftar_anggota_grup`
--

/*!50001 DROP VIEW IF EXISTS `daftar_anggota_grup`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`user`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `daftar_anggota_grup` AS select `a`.`id_grup_kontak` AS `id_grup_kontak`,`a`.`id_grup` AS `id_grup`,`c`.`nama_grup` AS `nama_grup`,`b`.`id_kontak` AS `id_kontak`,`b`.`nama` AS `nama`,`b`.`no_hp` AS `no_hp`,`b`.`sex` AS `sex`,`b`.`alamat_sekarang` AS `alamat_sekarang` from ((`anggota_grup_kontak` `a` left join `daftar_kontak` `b` on((`a`.`id_kontak` = `b`.`id_kontak`))) left join `kontak_grup` `c` on((`a`.`id_grup` = `c`.`id_grup`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `daftar_grup`
--

/*!50001 DROP VIEW IF EXISTS `daftar_grup`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`user`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `daftar_grup` AS select `a`.`id_grup` AS `id_grup`,`a`.`nama_grup` AS `nama_grup`,(select count(`anggota_grup_kontak`.`id_kontak`) from `anggota_grup_kontak` where (`a`.`id_grup` = `anggota_grup_kontak`.`id_grup`)) AS `jumlah_anggota` from `kontak_grup` `a` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `daftar_kontak`
--

/*!50001 DROP VIEW IF EXISTS `daftar_kontak`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`user`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `daftar_kontak` AS select `a`.`id_kontak` AS `id_kontak`,`a`.`id_pend` AS `id_pend`,`b`.`nama` AS `nama`,`a`.`no_hp` AS `no_hp`,(case when (`b`.`sex` = '1') then 'Laki-laki' else 'Perempuan' end) AS `sex`,`b`.`alamat_sekarang` AS `alamat_sekarang` from (`kontak` `a` left join `tweb_penduduk` `b` on((`a`.`id_pend` = `b`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `dokumen_hidup`
--

/*!50001 DROP VIEW IF EXISTS `dokumen_hidup`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`user`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `dokumen_hidup` AS select `dokumen`.`id` AS `id`,`dokumen`.`satuan` AS `satuan`,`dokumen`.`nama` AS `nama`,`dokumen`.`enabled` AS `enabled`,`dokumen`.`tgl_upload` AS `tgl_upload`,`dokumen`.`id_pend` AS `id_pend`,`dokumen`.`kategori` AS `kategori`,`dokumen`.`attr` AS `attr`,`dokumen`.`tahun` AS `tahun`,`dokumen`.`kategori_info_publik` AS `kategori_info_publik`,`dokumen`.`updated_at` AS `updated_at`,`dokumen`.`deleted` AS `deleted`,`dokumen`.`id_syarat` AS `id_syarat`,`dokumen`.`id_parent` AS `id_parent`,`dokumen`.`created_at` AS `created_at`,`dokumen`.`created_by` AS `created_by`,`dokumen`.`updated_by` AS `updated_by`,`dokumen`.`dok_warga` AS `dok_warga` from `dokumen` where (`dokumen`.`deleted` <> 1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `keluarga_aktif`
--

/*!50001 DROP VIEW IF EXISTS `keluarga_aktif`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`user`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `keluarga_aktif` AS select `k`.`id` AS `id`,`k`.`no_kk` AS `no_kk`,`k`.`nik_kepala` AS `nik_kepala`,`k`.`tgl_daftar` AS `tgl_daftar`,`k`.`kelas_sosial` AS `kelas_sosial`,`k`.`tgl_cetak_kk` AS `tgl_cetak_kk`,`k`.`alamat` AS `alamat`,`k`.`id_cluster` AS `id_cluster` from (`tweb_keluarga` `k` left join `tweb_penduduk` `p` on((`k`.`nik_kepala` = `p`.`id`))) where (`p`.`status_dasar` = 1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `penduduk_hidup`
--

/*!50001 DROP VIEW IF EXISTS `penduduk_hidup`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`user`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `penduduk_hidup` AS select `tweb_penduduk`.`id` AS `id`,`tweb_penduduk`.`nama` AS `nama`,`tweb_penduduk`.`nik` AS `nik`,`tweb_penduduk`.`id_kk` AS `id_kk`,`tweb_penduduk`.`kk_level` AS `kk_level`,`tweb_penduduk`.`id_rtm` AS `id_rtm`,`tweb_penduduk`.`rtm_level` AS `rtm_level`,`tweb_penduduk`.`sex` AS `sex`,`tweb_penduduk`.`tempatlahir` AS `tempatlahir`,`tweb_penduduk`.`tanggallahir` AS `tanggallahir`,`tweb_penduduk`.`agama_id` AS `agama_id`,`tweb_penduduk`.`pendidikan_kk_id` AS `pendidikan_kk_id`,`tweb_penduduk`.`pendidikan_sedang_id` AS `pendidikan_sedang_id`,`tweb_penduduk`.`pekerjaan_id` AS `pekerjaan_id`,`tweb_penduduk`.`status_kawin` AS `status_kawin`,`tweb_penduduk`.`warganegara_id` AS `warganegara_id`,`tweb_penduduk`.`dokumen_pasport` AS `dokumen_pasport`,`tweb_penduduk`.`dokumen_kitas` AS `dokumen_kitas`,`tweb_penduduk`.`ayah_nik` AS `ayah_nik`,`tweb_penduduk`.`ibu_nik` AS `ibu_nik`,`tweb_penduduk`.`nama_ayah` AS `nama_ayah`,`tweb_penduduk`.`nama_ibu` AS `nama_ibu`,`tweb_penduduk`.`foto` AS `foto`,`tweb_penduduk`.`golongan_darah_id` AS `golongan_darah_id`,`tweb_penduduk`.`id_cluster` AS `id_cluster`,`tweb_penduduk`.`status` AS `status`,`tweb_penduduk`.`alamat_sebelumnya` AS `alamat_sebelumnya`,`tweb_penduduk`.`alamat_sekarang` AS `alamat_sekarang`,`tweb_penduduk`.`status_dasar` AS `status_dasar`,`tweb_penduduk`.`hamil` AS `hamil`,`tweb_penduduk`.`cacat_id` AS `cacat_id`,`tweb_penduduk`.`sakit_menahun_id` AS `sakit_menahun_id`,`tweb_penduduk`.`akta_lahir` AS `akta_lahir`,`tweb_penduduk`.`akta_perkawinan` AS `akta_perkawinan`,`tweb_penduduk`.`tanggalperkawinan` AS `tanggalperkawinan`,`tweb_penduduk`.`akta_perceraian` AS `akta_perceraian`,`tweb_penduduk`.`tanggalperceraian` AS `tanggalperceraian`,`tweb_penduduk`.`cara_kb_id` AS `cara_kb_id`,`tweb_penduduk`.`telepon` AS `telepon`,`tweb_penduduk`.`tanggal_akhir_paspor` AS `tanggal_akhir_paspor`,`tweb_penduduk`.`no_kk_sebelumnya` AS `no_kk_sebelumnya`,`tweb_penduduk`.`ktp_el` AS `ktp_el`,`tweb_penduduk`.`status_rekam` AS `status_rekam`,`tweb_penduduk`.`waktu_lahir` AS `waktu_lahir`,`tweb_penduduk`.`tempat_dilahirkan` AS `tempat_dilahirkan`,`tweb_penduduk`.`jenis_kelahiran` AS `jenis_kelahiran`,`tweb_penduduk`.`kelahiran_anak_ke` AS `kelahiran_anak_ke`,`tweb_penduduk`.`penolong_kelahiran` AS `penolong_kelahiran`,`tweb_penduduk`.`berat_lahir` AS `berat_lahir`,`tweb_penduduk`.`panjang_lahir` AS `panjang_lahir`,`tweb_penduduk`.`tag_id_card` AS `tag_id_card`,`tweb_penduduk`.`created_at` AS `created_at`,`tweb_penduduk`.`created_by` AS `created_by`,`tweb_penduduk`.`updated_at` AS `updated_at`,`tweb_penduduk`.`updated_by` AS `updated_by`,`tweb_penduduk`.`id_asuransi` AS `id_asuransi`,`tweb_penduduk`.`no_asuransi` AS `no_asuransi`,`tweb_penduduk`.`email` AS `email` from `tweb_penduduk` where (`tweb_penduduk`.`status_dasar` = 1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-11-02 20:24:10
