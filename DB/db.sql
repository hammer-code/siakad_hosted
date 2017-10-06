/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

CREATE DATABASE IF NOT EXISTS `db_baru_siakad` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `db_baru_siakad`;

CREATE TABLE IF NOT EXISTS `agama` (
  `id_agama` int(11) NOT NULL COMMENT 'admin',
  `agama` varchar(255) NOT NULL,
  PRIMARY KEY (`id_agama`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='priv. admin';

/*!40000 ALTER TABLE `agama` DISABLE KEYS */;
/*!40000 ALTER TABLE `agama` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `login_alumni` (
  `id_alumni` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `level` enum('alm') NOT NULL,
  PRIMARY KEY (`id_alumni`),
  CONSTRAINT `FK__tb_mhs_lulus` FOREIGN KEY (`id_alumni`) REFERENCES `tb_alumni` (`nim`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*!40000 ALTER TABLE `login_alumni` DISABLE KEYS */;
/*!40000 ALTER TABLE `login_alumni` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `login_dosen` (
  `id_login_dosen` int(11) NOT NULL AUTO_INCREMENT,
  `id_kelas_dosen` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `level` enum('dosen','pengampu') NOT NULL DEFAULT 'dosen',
  PRIMARY KEY (`id_login_dosen`),
  KEY `FK_login_dosen_tb_kelas_dosen` (`id_kelas_dosen`),
  CONSTRAINT `FK_login_dosen_tb_kelas_dosen` FOREIGN KEY (`id_kelas_dosen`) REFERENCES `tb_kelas_dosen` (`id_kelas_dosen`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*!40000 ALTER TABLE `login_dosen` DISABLE KEYS */;
/*!40000 ALTER TABLE `login_dosen` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `login_mhs` (
  `id_user` int(10) NOT NULL AUTO_INCREMENT,
  `id_krs` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `level` enum('mhs') NOT NULL,
  `val_periode` enum('Y','N') NOT NULL DEFAULT 'N',
  PRIMARY KEY (`id_user`),
  KEY `FK_login_mhs_tb_mhs_krs` (`id_krs`),
  CONSTRAINT `FK_login_mhs_tb_mhs_krs` FOREIGN KEY (`id_krs`) REFERENCES `tb_mhs_krs` (`id_krs`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1232 DEFAULT CHARSET=latin1;

/*!40000 ALTER TABLE `login_mhs` DISABLE KEYS */;
/*!40000 ALTER TABLE `login_mhs` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `login_peg` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` text NOT NULL,
  `nama` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='siakad_iank';

/*!40000 ALTER TABLE `login_peg` DISABLE KEYS */;
REPLACE INTO `login_peg` (`uid`, `username`, `password`, `nama`) VALUES
	(1, 'admin', 'a7049b935acdae28e1dc588d9e99fc6345cb0c2989a5b53a5b80027524334b570861f7fc663e822e6eaec774c6e7af04a415217a158e4277ce33955a972e686fGPeXm5iwK/ZX1tp6EyCLpxdjHULH4nrHRPoW', 'IANK'),
	(10, 'iank', 'bda782fbef0c73aef93826b97ea5116552272b85eb1233c439e739dfc5fca08e0959ffb99eef80e8f38209733f028cbfefb997d0b9d6a432027524747016cdcf/7aLef/xH1NuFOA8Yz+gl5jsnRqi', 'IANK');
/*!40000 ALTER TABLE `login_peg` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `tb_alumni` (
  `nim` varchar(50) NOT NULL,
  `alamat` text NOT NULL,
  `no_hp` text NOT NULL,
  `pekerjaan` text NOT NULL,
  PRIMARY KEY (`nim`),
  CONSTRAINT `FK_tb_alumni_tb_mhs_lulus` FOREIGN KEY (`nim`) REFERENCES `tb_mhs_lulus` (`id_mhs`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*!40000 ALTER TABLE `tb_alumni` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_alumni` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `tb_bap` (
  `id_bap` int(11) NOT NULL AUTO_INCREMENT,
  `nama_bap` varchar(50) NOT NULL,
  `perihal` mediumtext NOT NULL,
  `deskripsi` mediumtext,
  `pengirim` int(11) NOT NULL,
  `tujuan` int(11) NOT NULL,
  `status` enum('Y','N','P') NOT NULL DEFAULT 'P',
  PRIMARY KEY (`id_bap`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*!40000 ALTER TABLE `tb_bap` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_bap` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `tb_cd_khs` (
  `id_cd_khs` int(11) NOT NULL AUTO_INCREMENT,
  `waktu_buka` datetime NOT NULL,
  `waktu_tutup` datetime NOT NULL,
  `id_kurikulum` int(11) NOT NULL,
  PRIMARY KEY (`id_cd_khs`),
  KEY `FK_tb_cd_khs_tb_kurikulum` (`id_kurikulum`),
  CONSTRAINT `FK_tb_cd_khs_tb_kurikulum` FOREIGN KEY (`id_kurikulum`) REFERENCES `tb_kurikulum` (`id_kurikulum`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

/*!40000 ALTER TABLE `tb_cd_khs` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_cd_khs` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `tb_cd_krs` (
  `id_cd_krs` int(11) NOT NULL AUTO_INCREMENT,
  `waktu_buka` datetime NOT NULL,
  `waktu_tutup` datetime NOT NULL,
  `id_kurikulum` int(11) NOT NULL,
  PRIMARY KEY (`id_cd_krs`),
  KEY `FK_tb_cd_krs_tb_kurikulum` (`id_kurikulum`),
  CONSTRAINT `FK_tb_cd_krs_tb_kurikulum` FOREIGN KEY (`id_kurikulum`) REFERENCES `tb_kurikulum` (`id_kurikulum`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

/*!40000 ALTER TABLE `tb_cd_krs` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_cd_krs` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `tb_dosen` (
  `nidn` varchar(50) NOT NULL,
  `nm_dosen` text NOT NULL,
  `program_studi` int(11) NOT NULL,
  PRIMARY KEY (`nidn`),
  KEY `FK__tb_prodi` (`program_studi`),
  CONSTRAINT `FK__tb_prodi` FOREIGN KEY (`program_studi`) REFERENCES `tb_prodi` (`id_prodi`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*!40000 ALTER TABLE `tb_dosen` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_dosen` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `tb_dosen_absensi` (
  `id_absensi` int(11) NOT NULL AUTO_INCREMENT,
  `id_kelas_dosen` int(11) NOT NULL,
  `tgl_masuk` date NOT NULL,
  `jam_masuk` time NOT NULL,
  `status_kehadiran` enum('Y','N') NOT NULL,
  `pembahasan` mediumtext NOT NULL,
  PRIMARY KEY (`id_absensi`),
  KEY `FK_tb_dosen_absensi_tb_kelas_dosen` (`id_kelas_dosen`),
  CONSTRAINT `FK_tb_dosen_absensi_tb_kelas_dosen` FOREIGN KEY (`id_kelas_dosen`) REFERENCES `tb_kelas_dosen` (`id_kelas_dosen`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Belum Dikorek';

/*!40000 ALTER TABLE `tb_dosen_absensi` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_dosen_absensi` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `tb_dosen_pembimbing` (
  `id_pembimbing` int(11) NOT NULL AUTO_INCREMENT,
  `id_dosen` varchar(50) NOT NULL DEFAULT '0',
  `status` enum('1','2') NOT NULL,
  PRIMARY KEY (`id_pembimbing`),
  UNIQUE KEY `id_dosen` (`id_dosen`),
  CONSTRAINT `FK__tb_dosen` FOREIGN KEY (`id_dosen`) REFERENCES `tb_dosen` (`nidn`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*!40000 ALTER TABLE `tb_dosen_pembimbing` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_dosen_pembimbing` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `tb_dosen_penguji` (
  `id_dosen_penguji` int(11) NOT NULL AUTO_INCREMENT,
  `id_proposal_maju` int(11) NOT NULL DEFAULT '0',
  `id_dosen` varchar(50) NOT NULL,
  `jabatan_penguji` enum('1','2','3','4','5') NOT NULL,
  PRIMARY KEY (`id_dosen_penguji`),
  KEY `FK_tb_dosen_penguji_tb_proposal_maju` (`id_proposal_maju`),
  KEY `id_dosen` (`id_dosen`),
  CONSTRAINT `FK_tb_dosen_penguji_tb_dosen` FOREIGN KEY (`id_dosen`) REFERENCES `tb_dosen` (`nidn`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_tb_dosen_penguji_tb_proposal_maju` FOREIGN KEY (`id_proposal_maju`) REFERENCES `tb_proposal_maju` (`id_proposal_maju`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*!40000 ALTER TABLE `tb_dosen_penguji` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_dosen_penguji` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `tb_dosen_wali` (
  `id_dosen_wali` int(11) NOT NULL AUTO_INCREMENT,
  `id_dosen` varchar(50) NOT NULL,
  `tanggal_diangkat` date NOT NULL,
  PRIMARY KEY (`id_dosen_wali`),
  UNIQUE KEY `id_dosen` (`id_dosen`),
  CONSTRAINT `FK_tb_dosen_wali_tb_dosen` FOREIGN KEY (`id_dosen`) REFERENCES `tb_dosen` (`nidn`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*!40000 ALTER TABLE `tb_dosen_wali` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_dosen_wali` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `tb_jadwal` (
  `id_jadwal` int(11) NOT NULL AUTO_INCREMENT,
  `id_kurikulum` int(11) NOT NULL DEFAULT '0',
  `id_kelas_dosen` int(11) NOT NULL DEFAULT '0',
  `id_ruang` int(11) NOT NULL DEFAULT '0',
  `nm_jam` varchar(50) NOT NULL DEFAULT '0',
  `nm_hari` enum('Senin','Selasa','Rabu','Kamis','Jumat','Belum Diisi') NOT NULL DEFAULT 'Belum Diisi',
  PRIMARY KEY (`id_jadwal`),
  KEY `FK_tb_jadwal_tb_kelas_dosen` (`id_kelas_dosen`),
  KEY `FK_tb_jadwal_tb_ruangan` (`id_ruang`),
  KEY `FK_tb_jadwal_tb_kurikulum` (`id_kurikulum`),
  CONSTRAINT `FK_tb_jadwal_tb_kelas_dosen` FOREIGN KEY (`id_kelas_dosen`) REFERENCES `tb_kelas_dosen` (`id_kelas_dosen`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_tb_jadwal_tb_kurikulum` FOREIGN KEY (`id_kurikulum`) REFERENCES `tb_kurikulum` (`id_kurikulum`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_tb_jadwal_tb_ruangan` FOREIGN KEY (`id_ruang`) REFERENCES `tb_ruangan` (`id_ruangan`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

/*!40000 ALTER TABLE `tb_jadwal` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_jadwal` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `tb_jenis_keluar` (
  `id_jenis_keluar` int(10) NOT NULL,
  `nm_jenis_keluar` varchar(50) NOT NULL,
  PRIMARY KEY (`id_jenis_keluar`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*!40000 ALTER TABLE `tb_jenis_keluar` DISABLE KEYS */;
REPLACE INTO `tb_jenis_keluar` (`id_jenis_keluar`, `nm_jenis_keluar`) VALUES
	(0, 'Lainnya'),
	(1, 'Lulus'),
	(2, 'Mutasi');
/*!40000 ALTER TABLE `tb_jenis_keluar` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `tb_kab_kota` (
  `id_kabupaten` int(11) NOT NULL,
  `kode_kabupaten` varchar(50) NOT NULL,
  `nm_kabupaten` varchar(50) NOT NULL,
  `kode_wil_kab` varchar(50) NOT NULL,
  `id_provinsi` int(11) NOT NULL,
  PRIMARY KEY (`id_kabupaten`),
  KEY `FK_tb_kab_kota_tb_provinsi` (`id_provinsi`),
  CONSTRAINT `FK_tb_kab_kota_tb_provinsi` FOREIGN KEY (`id_provinsi`) REFERENCES `tb_provinsi` (`id_provinsi`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*!40000 ALTER TABLE `tb_kab_kota` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_kab_kota` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `tb_kampus` (
  `id_kampus` int(11) NOT NULL,
  `kode_kampus` varchar(50) NOT NULL,
  `nm_kampus` varchar(150) NOT NULL,
  `no_tlp` varchar(50) NOT NULL,
  `no_faximile` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `website` varchar(50) NOT NULL,
  `alamat` varchar(50) NOT NULL,
  `id_kabupaten` int(11) NOT NULL,
  PRIMARY KEY (`id_kampus`),
  UNIQUE KEY `kode_kampus` (`kode_kampus`),
  KEY `FK_tb_kampus_tb_kab_kota` (`id_kabupaten`),
  CONSTRAINT `FK_tb_kampus_tb_kab_kota` FOREIGN KEY (`id_kabupaten`) REFERENCES `tb_kab_kota` (`id_kabupaten`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*!40000 ALTER TABLE `tb_kampus` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_kampus` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `tb_kariawan` (
  `nik` varchar(20) NOT NULL DEFAULT '',
  `nama` varchar(50) NOT NULL,
  `id_kampus` int(11) NOT NULL,
  `jen_kel` enum('L','P') NOT NULL,
  `tmp_lahir` varchar(50) NOT NULL,
  `tgl_lahir` date NOT NULL,
  `agama` int(11) NOT NULL,
  `jabatan` varchar(250) DEFAULT NULL,
  `alamat` mediumtext,
  `no_hp` mediumtext,
  `email` mediumtext,
  `s1_nm_sklh` varchar(100) DEFAULT NULL,
  `s1_jur` varchar(50) DEFAULT NULL,
  `s1_thn_lulus` varchar(4) DEFAULT NULL,
  `s1_kota` varchar(50) DEFAULT NULL,
  `s2_nm_sklh` mediumtext,
  `s2_jur` varchar(50) DEFAULT NULL,
  `s2_thn_lulus` varchar(4) DEFAULT NULL,
  `s2_kota` varchar(50) DEFAULT NULL,
  `s3_nm_sklh` mediumtext,
  `s3_jur` varchar(50) DEFAULT NULL,
  `s3_thn_lulus` varchar(4) DEFAULT NULL,
  `s3_kota` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`nik`),
  KEY `FK_tb_kariawan_agama` (`agama`),
  KEY `FK_tb_kariawan_tb_kampus` (`id_kampus`),
  CONSTRAINT `FK_tb_kariawan_agama` FOREIGN KEY (`agama`) REFERENCES `agama` (`id_agama`) ON UPDATE CASCADE,
  CONSTRAINT `FK_tb_kariawan_tb_kampus` FOREIGN KEY (`id_kampus`) REFERENCES `tb_kampus` (`id_kampus`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*!40000 ALTER TABLE `tb_kariawan` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_kariawan` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `tb_kelas_dosen` (
  `id_kelas_dosen` int(11) NOT NULL AUTO_INCREMENT,
  `id_kelas_kuliah` int(11) NOT NULL DEFAULT '0',
  `id_dosen` varchar(50) NOT NULL DEFAULT '0',
  `r_t_muka` int(11) NOT NULL,
  `t_muka` int(11) NOT NULL,
  `status_upload` enum('Y','N') NOT NULL DEFAULT 'N',
  `validasi_baak` enum('Y','N') NOT NULL DEFAULT 'N',
  PRIMARY KEY (`id_kelas_dosen`),
  KEY `FK__tb_mhs_data_krs` (`id_kelas_kuliah`),
  KEY `FK_tb_kelas_dosen_tb_dosen` (`id_dosen`),
  CONSTRAINT `FK_tb_kelas_dosen_tb_dosen` FOREIGN KEY (`id_dosen`) REFERENCES `tb_dosen` (`nidn`) ON UPDATE CASCADE,
  CONSTRAINT `FK_tb_kelas_dosen_tb_kelas_kul` FOREIGN KEY (`id_kelas_kuliah`) REFERENCES `tb_kelas_kul` (`id_kelas`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=490 DEFAULT CHARSET=latin1 COMMENT='get data dari tb_mhs_data_krs berdasarkan kurikulum yang diambil dari field id_kelas kemudian isi tabel ini';

/*!40000 ALTER TABLE `tb_kelas_dosen` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_kelas_dosen` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `tb_kelas_kul` (
  `id_kelas` int(11) NOT NULL AUTO_INCREMENT,
  `nm_kelas` varchar(50) NOT NULL DEFAULT '0',
  `id_matkul` varchar(50) NOT NULL DEFAULT '0',
  `id_kurikulum` int(11) NOT NULL DEFAULT '0',
  `id_prodi` int(11) DEFAULT '0',
  `status_upload` enum('Y','N') NOT NULL DEFAULT 'N',
  PRIMARY KEY (`id_kelas`),
  KEY `FK_tb_kelas_kul_tb_matkul` (`id_matkul`),
  KEY `FK_tb_kelas_kul_tb_kurikulum` (`id_kurikulum`),
  KEY `FK_tb_kelas_kul_tb_prodi` (`id_prodi`),
  CONSTRAINT `FK_tb_kelas_kul_tb_kurikulum` FOREIGN KEY (`id_kurikulum`) REFERENCES `tb_kurikulum` (`id_kurikulum`) ON UPDATE CASCADE,
  CONSTRAINT `FK_tb_kelas_kul_tb_mk_kurikulum` FOREIGN KEY (`id_matkul`) REFERENCES `tb_mk_kurikulum` (`kode_mk`) ON UPDATE CASCADE,
  CONSTRAINT `FK_tb_kelas_kul_tb_prodi` FOREIGN KEY (`id_prodi`) REFERENCES `tb_prodi` (`id_prodi`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1874 DEFAULT CHARSET=latin1 COMMENT='get prodi dan get mata kuliah berdasarkan kurikulum sebelum memasukan data, || seharusnya bukan id_mk_kur bukan id_matkul di tabel mk_kurikulum';

/*!40000 ALTER TABLE `tb_kelas_kul` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_kelas_kul` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `tb_keu_biaya` (
  `kode_biaya` varchar(6) NOT NULL,
  `kode_jns_bayar` varchar(5) NOT NULL,
  `jml_biaya` int(11) NOT NULL,
  `angkatan` year(4) DEFAULT NULL,
  `tgl_aktif` date DEFAULT NULL,
  PRIMARY KEY (`kode_biaya`),
  KEY `FK_biaya_jenis_bayar` (`kode_jns_bayar`),
  CONSTRAINT `FK_tb_keu_biaya_tb_keu_jenis_bayar` FOREIGN KEY (`kode_jns_bayar`) REFERENCES `tb_keu_jenis_bayar` (`kode_jns_bayar`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*!40000 ALTER TABLE `tb_keu_biaya` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_keu_biaya` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `tb_keu_jenis_bayar` (
  `kode_jns_bayar` varchar(5) NOT NULL,
  `nama_jns_bayar` varchar(255) NOT NULL,
  `status` enum('A','P') NOT NULL,
  PRIMARY KEY (`kode_jns_bayar`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*!40000 ALTER TABLE `tb_keu_jenis_bayar` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_keu_jenis_bayar` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `tb_keu_pembayaran` (
  `kode_bayar` varchar(50) NOT NULL,
  `kode_biaya` varchar(6) NOT NULL DEFAULT '0',
  `nim` varchar(10) NOT NULL,
  `nik` varchar(10) NOT NULL,
  `jumlah_bayar` int(11) NOT NULL,
  `tgl_byr` date NOT NULL,
  `keterangan` mediumtext,
  `no_referensi` varchar(50) NOT NULL,
  PRIMARY KEY (`kode_bayar`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='SELECT\r\nm1.kode_bayar,\r\nm1.kode_biaya,\r\nm1.nim,\r\nm2.nama,\r\nm1.jumlah_bayar,\r\nm1.tgl_byr,\r\nm1.keterangan,\r\nm1.no_referensi,\r\nm2.smt_masuk,\r\nm2.nm_kurikulum,\r\nm2.id_kurikulum,\r\nm2.ta \r\nFROM pembayaran m1\r\nJOIN db_siakad.v_mhs_krs m2 ON m1.kode_bayar=m2.kode_pembayaran';

/*!40000 ALTER TABLE `tb_keu_pembayaran` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_keu_pembayaran` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `tb_kurikulum` (
  `id_kurikulum` int(10) NOT NULL AUTO_INCREMENT,
  `nm_kurikulum` varchar(50) NOT NULL DEFAULT '0',
  `ta` varchar(50) NOT NULL DEFAULT '0',
  `kd_prodi` int(11) NOT NULL DEFAULT '0',
  `status` enum('1','0') NOT NULL DEFAULT '0',
  `status_upload` enum('Y','N') NOT NULL DEFAULT 'N',
  PRIMARY KEY (`id_kurikulum`),
  KEY `FK_tb_kurikulum_tb_prodi` (`kd_prodi`),
  CONSTRAINT `FK_tb_kurikulum_tb_prodi` FOREIGN KEY (`kd_prodi`) REFERENCES `tb_prodi` (`id_prodi`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

/*!40000 ALTER TABLE `tb_kurikulum` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_kurikulum` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `tb_mata_kuliah` (
  `kode_mk` varchar(50) NOT NULL,
  `nm_mk` text NOT NULL,
  `sks` int(11) NOT NULL,
  `semester` int(11) unsigned NOT NULL,
  `status_upload` enum('Y','N') NOT NULL DEFAULT 'N',
  `id_kampus` int(11) NOT NULL,
  PRIMARY KEY (`kode_mk`),
  KEY `FK_tb_mata_kuliah_tb_kampus` (`id_kampus`),
  CONSTRAINT `FK_tb_mata_kuliah_tb_kampus` FOREIGN KEY (`id_kampus`) REFERENCES `tb_kampus` (`id_kampus`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Selesai Input';

/*!40000 ALTER TABLE `tb_mata_kuliah` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_mata_kuliah` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `tb_mhs` (
  `nim` varchar(50) NOT NULL,
  `nm_mhs` varchar(50) NOT NULL,
  `tpt_lhr` varchar(50) NOT NULL,
  `tgl_lahir` date NOT NULL,
  `jenkel` enum('L','P') NOT NULL,
  `agama` int(5) NOT NULL,
  `kelurahan` varchar(50) NOT NULL,
  `wilayah` varchar(50) NOT NULL,
  `nm_ibu` varchar(50) NOT NULL,
  `kd_prodi` int(11) NOT NULL,
  `tgl_masuk` date NOT NULL,
  `smt_masuk` varchar(10) NOT NULL,
  `status_mhs` int(4) NOT NULL,
  `status_awal` enum('1','2') NOT NULL,
  `email` text,
  `no_ktp` varchar(50) DEFAULT NULL,
  `status_upload` enum('Y','N') DEFAULT 'N',
  PRIMARY KEY (`nim`),
  KEY `FK_tb_mhs_agama` (`agama`),
  KEY `FK_tb_mhs_tb_prodi` (`kd_prodi`),
  KEY `FK_tb_mhs_tb_status_mhs` (`status_mhs`),
  CONSTRAINT `FK_tb_mhs_agama` FOREIGN KEY (`agama`) REFERENCES `agama` (`id_agama`) ON UPDATE CASCADE,
  CONSTRAINT `FK_tb_mhs_tb_prodi` FOREIGN KEY (`kd_prodi`) REFERENCES `tb_prodi` (`id_prodi`) ON UPDATE CASCADE,
  CONSTRAINT `FK_tb_mhs_tb_status_mhs` FOREIGN KEY (`status_mhs`) REFERENCES `tb_status_mhs` (`id_status`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Selesai Input';

/*!40000 ALTER TABLE `tb_mhs` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_mhs` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `tb_mhs_data_krs` (
  `id_data_krs` int(50) NOT NULL AUTO_INCREMENT,
  `id_krs` int(50) NOT NULL,
  `id_kelas` int(11) NOT NULL,
  `status_upload` enum('Y','N') NOT NULL DEFAULT 'N',
  `status_nilai` enum('Y','N') NOT NULL DEFAULT 'N',
  `status_komplain` enum('Y','N') NOT NULL DEFAULT 'N',
  PRIMARY KEY (`id_data_krs`),
  KEY `FK_tb_mhs_data_krs_tb_mhs_krs` (`id_krs`),
  KEY `FK_tb_mhs_data_krs_tb_kelas_kul` (`id_kelas`),
  CONSTRAINT `FK_tb_mhs_data_krs_tb_kelas_kul` FOREIGN KEY (`id_kelas`) REFERENCES `tb_kelas_kul` (`id_kelas`) ON UPDATE CASCADE,
  CONSTRAINT `FK_tb_mhs_data_krs_tb_mhs_krs` FOREIGN KEY (`id_krs`) REFERENCES `tb_mhs_krs` (`id_krs`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13423 DEFAULT CHARSET=utf8 COMMENT='get id krs dari tb_mhs_krs kemudian get kelas berdasarkan kurikulum dari tb_mhs_krs ';

/*!40000 ALTER TABLE `tb_mhs_data_krs` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_mhs_data_krs` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `tb_mhs_krs` (
  `id_krs` int(11) NOT NULL AUTO_INCREMENT,
  `id_mhs` varchar(50) NOT NULL,
  `kode_pembayaran` varchar(50) NOT NULL,
  `id_kurikulum` int(11) NOT NULL,
  `status_ambil` enum('Y','T') NOT NULL DEFAULT 'T',
  `status_cetak` enum('Y','N') NOT NULL DEFAULT 'N',
  `status_cek` enum('Y','N') NOT NULL DEFAULT 'N',
  `status_buka` enum('Y','N') NOT NULL DEFAULT 'N',
  `token` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_krs`),
  UNIQUE KEY `kode_pembayaran` (`kode_pembayaran`),
  KEY `FK__tb_mhs` (`id_mhs`),
  KEY `FK_tb_mhs_krs_tb_kurikulum` (`id_kurikulum`),
  CONSTRAINT `FK__tb_mhs` FOREIGN KEY (`id_mhs`) REFERENCES `tb_mhs` (`nim`) ON UPDATE CASCADE,
  CONSTRAINT `FK_tb_mhs_krs_tb_kurikulum` FOREIGN KEY (`id_kurikulum`) REFERENCES `tb_kurikulum` (`id_kurikulum`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2565 DEFAULT CHARSET=latin1;

/*!40000 ALTER TABLE `tb_mhs_krs` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_mhs_krs` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `tb_mhs_lulus` (
  `id_mhs` varchar(50) NOT NULL,
  `id_jns_keluar` int(10) DEFAULT NULL,
  `tgl_keluar` date DEFAULT NULL,
  `jalur_skripsi` enum('1','0') DEFAULT NULL,
  `judul_skripsi` text,
  `bln_awal_bim` date DEFAULT NULL,
  `bln_akhir_bim` date DEFAULT NULL,
  `sk_yudisium` varchar(50) DEFAULT NULL,
  `tgl_yudisium` date DEFAULT NULL,
  `IPK` varchar(50) DEFAULT NULL,
  `no_ijazah` varchar(50) DEFAULT NULL,
  `ket` text,
  `status_upload` enum('Y','N') NOT NULL DEFAULT 'N',
  PRIMARY KEY (`id_mhs`),
  KEY `FK_tb_mhs_lulus_tb_jenis_keluar` (`id_jns_keluar`),
  CONSTRAINT `FK_tb_mhs_lulus_tb_jenis_keluar` FOREIGN KEY (`id_jns_keluar`) REFERENCES `tb_jenis_keluar` (`id_jenis_keluar`) ON UPDATE CASCADE,
  CONSTRAINT `FK_tb_mhs_lulus_tb_mhs` FOREIGN KEY (`id_mhs`) REFERENCES `tb_mhs` (`nim`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Selesai Input';

/*!40000 ALTER TABLE `tb_mhs_lulus` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_mhs_lulus` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `tb_mhs_transfer` (
  `id_trans` int(10) NOT NULL AUTO_INCREMENT,
  `id_mhs` varchar(50) NOT NULL DEFAULT '0',
  `sks_diakui` int(10) NOT NULL DEFAULT '0',
  `pt_asal` varchar(50) DEFAULT '0',
  `prodi_asal` varchar(50) DEFAULT '0',
  `status_upload` enum('Y','N') NOT NULL DEFAULT 'N',
  PRIMARY KEY (`id_trans`),
  UNIQUE KEY `id_mhs` (`id_mhs`),
  CONSTRAINT `FK_tb_mhs_transfer_tb_mhs` FOREIGN KEY (`id_mhs`) REFERENCES `tb_mhs` (`nim`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=148 DEFAULT CHARSET=latin1 COMMENT='Sdh Input';

/*!40000 ALTER TABLE `tb_mhs_transfer` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_mhs_transfer` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `tb_mhs_wali` (
  `id_mhs_wali` int(11) NOT NULL AUTO_INCREMENT,
  `id_dosen_wali` int(11) NOT NULL,
  `id_mhs` varchar(50) NOT NULL,
  PRIMARY KEY (`id_mhs_wali`),
  KEY `FK_tb_mhs_wali_tb_dosen_wali` (`id_dosen_wali`),
  KEY `FK_tb_mhs_wali_tb_mhs` (`id_mhs`),
  CONSTRAINT `FK_tb_mhs_wali_tb_dosen_wali` FOREIGN KEY (`id_dosen_wali`) REFERENCES `tb_dosen_wali` (`id_dosen_wali`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_tb_mhs_wali_tb_mhs` FOREIGN KEY (`id_mhs`) REFERENCES `tb_mhs` (`nim`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*!40000 ALTER TABLE `tb_mhs_wali` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_mhs_wali` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `tb_mk_kurikulum` (
  `id_kur_mk` int(11) NOT NULL AUTO_INCREMENT,
  `kode_mk` varchar(50) NOT NULL,
  `id_kurikulum` int(11) NOT NULL,
  `silabus` enum('Y','N') NOT NULL DEFAULT 'N',
  `modul` enum('Y','N') NOT NULL DEFAULT 'N',
  `status_upload` enum('Y','N') NOT NULL DEFAULT 'N',
  PRIMARY KEY (`id_kur_mk`),
  KEY `kode_mk` (`kode_mk`),
  KEY `FK_tb_mk_kurikulum_tb_kurikulum` (`id_kurikulum`),
  CONSTRAINT `FK_tb_mk_kurikulum_tb_kurikulum` FOREIGN KEY (`id_kurikulum`) REFERENCES `tb_kurikulum` (`id_kurikulum`) ON UPDATE CASCADE,
  CONSTRAINT `FK_tb_mk_kurikulum_tb_mata_kuliah` FOREIGN KEY (`kode_mk`) REFERENCES `tb_mata_kuliah` (`kode_mk`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=637 DEFAULT CHARSET=latin1;

/*!40000 ALTER TABLE `tb_mk_kurikulum` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_mk_kurikulum` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `tb_modul` (
  `id_modul` int(11) NOT NULL AUTO_INCREMENT,
  `id_mk_kurikulum` int(11) NOT NULL DEFAULT '0',
  `url_file` text NOT NULL,
  PRIMARY KEY (`id_modul`),
  KEY `FK_tb_modul_tb_mk_kurikulum` (`id_mk_kurikulum`),
  CONSTRAINT `FK_tb_modul_tb_mk_kurikulum` FOREIGN KEY (`id_mk_kurikulum`) REFERENCES `tb_mk_kurikulum` (`id_kur_mk`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*!40000 ALTER TABLE `tb_modul` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_modul` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `tb_nilai` (
  `id_nilai` int(10) NOT NULL AUTO_INCREMENT,
  `id_krs` int(10) NOT NULL DEFAULT '0',
  `nilai_angka` varchar(50) NOT NULL DEFAULT '0',
  `nilai_index` float NOT NULL,
  `nilai_huruf` varchar(10) NOT NULL DEFAULT '0',
  `status_upload` enum('Y','N') NOT NULL DEFAULT 'N',
  PRIMARY KEY (`id_nilai`),
  KEY `FK_tb_nilai_tb_mhs_data_krs` (`id_krs`),
  CONSTRAINT `FK_tb_nilai_tb_mhs_data_krs` FOREIGN KEY (`id_krs`) REFERENCES `tb_mhs_data_krs` (`id_data_krs`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*!40000 ALTER TABLE `tb_nilai` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_nilai` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `tb_nilai_trans` (
  `id_nilai_trans` int(11) NOT NULL AUTO_INCREMENT,
  `id_mhs_trans` int(11) NOT NULL,
  `id_mk` varchar(50) NOT NULL,
  `kode_mk_asal` varchar(50) NOT NULL,
  `nm_mk_asal` text NOT NULL,
  `sks_asal` int(11) NOT NULL,
  `sks_diakui` int(11) NOT NULL,
  `nilai_huruf_asal` varchar(2) NOT NULL,
  `nilai_huruf_diakui` varchar(2) NOT NULL,
  `nilai_angka_diakui` int(11) NOT NULL,
  PRIMARY KEY (`id_nilai_trans`),
  KEY `FK_tb_nilai_trans_tb_mata_kuliah` (`id_mk`),
  KEY `FK_tb_nilai_trans_tb_mhs_transfer` (`id_mhs_trans`),
  CONSTRAINT `FK_tb_nilai_trans_tb_mata_kuliah` FOREIGN KEY (`id_mk`) REFERENCES `tb_mata_kuliah` (`kode_mk`) ON UPDATE CASCADE,
  CONSTRAINT `FK_tb_nilai_trans_tb_mhs_transfer` FOREIGN KEY (`id_mhs_trans`) REFERENCES `tb_mhs_transfer` (`id_trans`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*!40000 ALTER TABLE `tb_nilai_trans` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_nilai_trans` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `tb_pengumuman` (
  `id_pengumuman` int(11) NOT NULL AUTO_INCREMENT,
  `judul` varchar(50) NOT NULL,
  `tentang` text NOT NULL,
  `tanggal` datetime NOT NULL,
  `status` enum('Y','N') NOT NULL,
  PRIMARY KEY (`id_pengumuman`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

/*!40000 ALTER TABLE `tb_pengumuman` DISABLE KEYS */;
REPLACE INTO `tb_pengumuman` (`id_pengumuman`, `judul`, `tentang`, `tanggal`, `status`) VALUES
	(1, 'Belanja Mata Kuliah', 'WAKTU PENGISIAN KARTU RENCANA STUDI MAHASISWA ANGK. 2016 TA 2016/2017 DIMULAI PADA HARI KAMIS TANGGAL 23 SEPTEMBER 2016\r\n<br>SILAHKAN MENGUNJUNGI\r\n<ul>\r\n	<li>http://siakad.stmikadhiguna.ac.id/siakad/sihas untuk akses public</li>\r\n	<li>http://10.10.10.4/siakad/sihas untuk akses lokal kampus</li>\r\n</ul>\r\n\r\n<br> UNTUK MENDAPATKAN AKUN SILAHKAN MEMVALIDASI NIM DI BAAK DENGAN MEMBAWA SLIP PEMBAYARAN DARI KEUANGAN\r\n\r\n<br>Distribusi AKUN dapat dilihat pada tanggal 23 September 2016', '2016-09-19 00:00:00', 'N'),
	(2, 'Nomor Induk Mahasiswa Ang. 2016 Terbit', 'Berhubung Nomor Induk Mahasiswa Angkatan 2016 Telah Terbit Maka Untuk Proses Kelancaran Belanja Mata Kuliah Khususnya Pada Mahasiswa Semester 1 Tahun 20161 Semester Ganjil (periode 20161) Maka Kami Menyampaikan : \r\nAgar melakukan registrasi kembali kepihak keuangan dan melakukan validasi kepihak BAAK agar mendapatkan hak akses dengan membawa tanda bukti sah dari pihak keuangan.', '2016-09-19 23:20:55', 'N'),
	(3, 'Kendala Pengisian Belanja Mata Kuliah di SIHAS', 'Jika Mempunya Kendala Pengisian KRS Silahkan Menghubungi ADMIN SIHAS (Sofyan Saputra) || 081244224077', '2016-09-20 00:00:00', 'N'),
	(4, 'PANDUAN PENGISIAN KRS', 'CARA MENGISI KARTU RENCANA STUDI (KRS)\r\nSETELAH MELAKUKAN VALIDASI \r\nKUNJUNGI http://siakad.stmikadhiguna.ac.id/siakad/sihas jika akses diluar kampus\r\nKunjungi 10.10.10.4/siakad/sihas jika akses didalam kampus\r\n<ul>\r\n	<li>KEMUDIAN MASUKAN NIM PADA KOLOM USERNAME DAN NIM PADA KOLOM PASSWORD</li>\r\n	<li>SETELAH BERANDA MUNCUL SOROT MOUSE KE AKTIFITAS MATA KULIAH->KRS</li>\r\n	<li>KEMUDIAN LIHAT LIST KRS  nim 5720116001 MASIH MEMPUNYAI 1 DAFTAR KRS PERHATIKAN PERIODE JIKA HIJAU BERARTI KRS BERADA DI PERIODE AKTIF</li>\r\n	<li>KEMUDIAN KLIK ACTION</li>\r\n	<li>KEMUDIAN SOROT MOUSE KE BAGIAN KURIKULUM : PILIH KURIKULUM AKTIF CONTOH SAAT INI KURIKULUM ADALAH KURIKULUM 20161 -> KLIK SET KURIKULUM</li>\r\n	<li>KEMUDIAN PILIH KELAS YANG SESUAI DENGAN KELAS ANDA BESERTA MATA KULIAH HANYA SEMESTER SATU HAL INI DITANDAI DENGAN : PENDIDIKAN AGAMA ISLAM | <b><i>SI.I.1</i></b> | 20161 <br>SI/TI : Menandakan JURUSAN<br>I : Menandakan SEMESTER<br>1 : Menandakan KELAS</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>SESUAIKAN BELANJA MATA KULIAH ANDA CEK KEMBALI JIKA TERDAPAT MATA KULIAH DAN KELAS YANG SAMA</li>\r\n	<li>JIKA PENGISIAN SELESAI SILAHKAN LOGOUT</li>\r\n</ul>\r\n\r\n\r\n\r\n\r\n\r\n', '2016-09-20 00:00:00', 'N'),
	(5, 'Pemberitahuan', 'Untuk Mahasiswa Semester 1 Periode 20161, Yang Kartu Rencana Studi nya Masih Bermasalah Agar segera melakukan perbaikan datanya, Berhubung Pengisian KRS akan Segera Ditutup Khusus Untuk Semester 1', '2016-10-11 17:37:00', 'N'),
	(6, 'Pengumuman Belanja Mata Kuliah', 'Bagi Mahasiswa STMIK Adhi Guna Yang belum Mengurus Kartu Rencana Studi Agar Segera Melakukan Pengurusan KRS, Jika tidak melakukan Pengurusan Dalam Waktu Yang Telah Ditentukan Maka Status Pada Pangkalan Data di Non Aktifkan', '2016-10-21 14:05:37', 'N'),
	(7, 'Pembukaan Kembali Kartu Rencana Studi Mahasiswa', 'Disampaikan Kepada Seluruh Mahasiswa Bahwa Batas Pengambilan KRS di Undur Hingga Tanggal 23 November 2016 Pukul 17.00, Bagi Mahasiswa Yang Belum Memenuhi Segala Persyaratan Pada Semester Ini Diharapkan Segera Memenuhi Persyaratan Tersebut', '2016-11-21 11:40:56', 'N'),
	(8, 'Kartu Mahasiswa', 'Disampaikan Kepada Seluruh Mahasiswa Angkatan 2016 Agar segera mengambil Kartu Tanda Mahasiswa (KTM) dengan Membawa Slip Pembayaran Semester Berjalan Dan Slip Pembayaran Pembangunan Yang Telah Dilunasi, terimakasih<br>baak ', '2017-01-24 00:00:00', 'N'),
	(9, 'BELANJA MATA KULIAH PERIODE 2016 GENAP', 'Waktu Pengisian KRS dapat dilakukan dimulai Hari Senin Tanggal 20 Februari 2017, Bagi Mahasiswa Yang Tidak Melakukan Pengurusan KRS setelah waktu yang telah ditentukan maka akan dianggap non aktif, Terima Kasih', '2017-02-16 15:00:00', 'N'),
	(10, 'PENUTUPAN PENGISIAN KARTU RENCANA STUDI', 'Disampaikan Kepada seluruh Mahasiswa STMIK Adhi Guna Pengambilan Kartu Rencana Studi Periode Ganjil Terakhir Pada Tanggal 25 November 2017, KRS Akan ditutup Setelah Tanggal Tersebut.', '2017-09-11 10:22:56', 'Y'),
	(11, 'Pengambilan KRS Semester Genap 2017', 'Berhubung Adanya Perubahan Kurikulum Dan Seluruh Mata Kuliah , Proses Pengambilang KRS Dapat Dilaksanakan paling Tidak Minggu Depan', '2017-09-25 10:00:00', 'Y');
/*!40000 ALTER TABLE `tb_pengumuman` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `tb_prodi` (
  `id_prodi` int(11) NOT NULL,
  `kode_kampus` varchar(50) NOT NULL,
  `id_kampus` mediumtext NOT NULL,
  `nm_prodi` varchar(50) NOT NULL,
  `nm_ketua` varchar(50) NOT NULL,
  PRIMARY KEY (`id_prodi`),
  UNIQUE KEY `kode_kampus` (`kode_kampus`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*!40000 ALTER TABLE `tb_prodi` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_prodi` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `tb_proposal` (
  `id_mhs_proposal` int(11) NOT NULL AUTO_INCREMENT,
  `id_mhs` varchar(50) NOT NULL DEFAULT '0',
  `judul` text NOT NULL,
  `id_pembimbing_1` int(11) NOT NULL,
  `id_pembimbing_2` int(11) NOT NULL,
  `tgl_daftar` datetime NOT NULL,
  `tgl_kadaluarsa` datetime NOT NULL,
  `status_daftar` enum('Y','N') DEFAULT 'N',
  PRIMARY KEY (`id_mhs_proposal`),
  KEY `FK_tb_mhs_proposal_tb_mhs` (`id_mhs`),
  KEY `FK_tb_proposal_tb_dosen_pembimbing` (`id_pembimbing_1`),
  KEY `FK_tb_proposal_tb_dosen_pembimbing_2` (`id_pembimbing_2`),
  CONSTRAINT `FK_tb_mhs_proposal_tb_mhs` FOREIGN KEY (`id_mhs`) REFERENCES `tb_mhs` (`nim`) ON UPDATE CASCADE,
  CONSTRAINT `FK_tb_proposal_tb_dosen_pembimbing` FOREIGN KEY (`id_pembimbing_1`) REFERENCES `tb_dosen_pembimbing` (`id_pembimbing`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_tb_proposal_tb_dosen_pembimbing_2` FOREIGN KEY (`id_pembimbing_2`) REFERENCES `tb_dosen_pembimbing` (`id_pembimbing`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*!40000 ALTER TABLE `tb_proposal` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_proposal` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `tb_proposal_maju` (
  `id_proposal_maju` int(11) NOT NULL AUTO_INCREMENT,
  `id_proposal` int(11) NOT NULL,
  `kode_bayar` varchar(50) NOT NULL,
  `bebas_pustaka` enum('Y','N') NOT NULL DEFAULT 'N',
  `bebas_smt` enum('Y','N') NOT NULL DEFAULT 'N',
  `status_kliring` enum('Y','N') NOT NULL DEFAULT 'N',
  `valid_prodi` enum('Y','N') NOT NULL DEFAULT 'N',
  `tgl_daftar` date NOT NULL,
  `tgl_maju` date NOT NULL,
  PRIMARY KEY (`id_proposal_maju`),
  UNIQUE KEY `kode_bayar` (`kode_bayar`),
  KEY `FK_tb_proposal_maju_tb_proposal` (`id_proposal`),
  CONSTRAINT `FK_tb_proposal_maju_tb_proposal` FOREIGN KEY (`id_proposal`) REFERENCES `tb_proposal` (`id_mhs_proposal`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*!40000 ALTER TABLE `tb_proposal_maju` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_proposal_maju` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `tb_provinsi` (
  `id_provinsi` int(11) NOT NULL AUTO_INCREMENT,
  `kode_provinsi` varchar(50) NOT NULL DEFAULT '0',
  `nm_provinsi` varchar(50) NOT NULL DEFAULT '0',
  `kode_wil_prov` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_provinsi`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*!40000 ALTER TABLE `tb_provinsi` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_provinsi` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `tb_ruangan` (
  `id_ruangan` int(11) NOT NULL AUTO_INCREMENT,
  `nm_ruangan` varchar(50) NOT NULL DEFAULT '0',
  `ket` enum('T','P') NOT NULL DEFAULT 'T',
  PRIMARY KEY (`id_ruangan`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*!40000 ALTER TABLE `tb_ruangan` DISABLE KEYS */;
REPLACE INTO `tb_ruangan` (`id_ruangan`, `nm_ruangan`, `ket`) VALUES
	(1, 'Ruang 1', 'T'),
	(2, 'Ruang 2', 'T'),
	(3, 'Ruang 3', 'T'),
	(4, 'Ruang 4', 'T');
/*!40000 ALTER TABLE `tb_ruangan` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `tb_setting` (
  `id_sett` int(2) NOT NULL AUTO_INCREMENT,
  `id_kampus` int(11) NOT NULL,
  `kode_feed` varchar(50) NOT NULL DEFAULT '0',
  `pass_feed` varchar(50) NOT NULL DEFAULT '0',
  `role` enum('M','P','A') NOT NULL DEFAULT 'P',
  `url_ws` enum('L','P') NOT NULL DEFAULT 'L',
  `mode` enum('LIVE','SANDBOX') NOT NULL,
  `link` varchar(50) NOT NULL,
  PRIMARY KEY (`id_sett`),
  KEY `FK_tb_setting_tb_kampus` (`id_kampus`),
  CONSTRAINT `FK_tb_setting_tb_kampus` FOREIGN KEY (`id_kampus`) REFERENCES `tb_kampus` (`id_kampus`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*!40000 ALTER TABLE `tb_setting` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_setting` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `tb_skripsi` (
  `id_skripsi` int(11) NOT NULL AUTO_INCREMENT,
  `id_proposal_maju` int(11) NOT NULL,
  `bebas_pustaka` enum('Y','N') NOT NULL DEFAULT 'N',
  `bebas_smt` enum('Y','N') NOT NULL DEFAULT 'N',
  `kliring_nilai` enum('Y','N') NOT NULL DEFAULT 'N',
  `valid_prodi` enum('Y','N') NOT NULL DEFAULT 'N',
  `bebas_proposal` enum('Y','N') NOT NULL DEFAULT 'N',
  `tgl_daftar` date NOT NULL,
  `tgl_maju` date NOT NULL,
  PRIMARY KEY (`id_skripsi`),
  KEY `FK__tb_proposal_maju` (`id_proposal_maju`),
  CONSTRAINT `FK__tb_proposal_maju` FOREIGN KEY (`id_proposal_maju`) REFERENCES `tb_proposal_maju` (`id_proposal_maju`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*!40000 ALTER TABLE `tb_skripsi` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_skripsi` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `tb_status_mhs` (
  `id_status` int(11) NOT NULL AUTO_INCREMENT,
  `nm_status` char(2) NOT NULL,
  `ket` mediumtext NOT NULL,
  `id_kampus` int(11) NOT NULL,
  PRIMARY KEY (`id_status`),
  KEY `FK_tb_status_mhs_tb_kampus` (`id_kampus`),
  CONSTRAINT `FK_tb_status_mhs_tb_kampus` FOREIGN KEY (`id_kampus`) REFERENCES `tb_kampus` (`id_kampus`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*!40000 ALTER TABLE `tb_status_mhs` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_status_mhs` ENABLE KEYS */;

CREATE TABLE `v_bayar_smt` (
	`nim` VARCHAR(10) NOT NULL COLLATE 'utf8_general_ci',
	`kode_bayar` VARCHAR(50) NOT NULL COLLATE 'utf8_general_ci',
	`statusbayar` VARCHAR(22) NOT NULL COLLATE 'utf8mb4_general_ci',
	`nama_jns_bayar` VARCHAR(255) NOT NULL COLLATE 'latin1_swedish_ci',
	`keterangan` MEDIUMTEXT NULL COLLATE 'utf8_general_ci'
) ENGINE=MyISAM;

CREATE TABLE `v_count_down` (
	`id_cd_krs` INT(11) NOT NULL,
	`waktu_buka` DATETIME NOT NULL,
	`waktu_tutup` DATETIME NOT NULL,
	`ta` VARCHAR(50) NOT NULL COLLATE 'utf8_general_ci',
	`kd_prodi` INT(11) NOT NULL
) ENGINE=MyISAM;

CREATE TABLE `v_count_down_khs` (
	`id_cd_krs` INT(11) NOT NULL,
	`waktu_buka` DATETIME NOT NULL,
	`waktu_tutup` DATETIME NOT NULL,
	`ta` VARCHAR(50) NOT NULL COLLATE 'utf8_general_ci',
	`kd_prodi` INT(11) NOT NULL
) ENGINE=MyISAM;

CREATE TABLE `v_data_krs` (
	`status_komplain` ENUM('Y','N') NOT NULL COLLATE 'utf8_general_ci',
	`id_data_krs` INT(50) NOT NULL,
	`id_kurikulum` INT(10) NOT NULL,
	`status_nilai` ENUM('Y','N') NOT NULL COLLATE 'utf8_general_ci',
	`id_kelas` INT(11) NOT NULL,
	`nim` VARCHAR(50) NOT NULL COLLATE 'latin1_swedish_ci',
	`nm_mhs` VARCHAR(50) NOT NULL COLLATE 'latin1_swedish_ci',
	`id_matkul` VARCHAR(50) NOT NULL COLLATE 'latin1_swedish_ci',
	`nm_mk` TEXT NOT NULL COLLATE 'latin1_swedish_ci',
	`sks` INT(11) NOT NULL,
	`nm_kelas` VARCHAR(50) NOT NULL COLLATE 'latin1_swedish_ci',
	`ta` VARCHAR(50) NOT NULL COLLATE 'utf8_general_ci',
	`id_prodi` INT(11) NOT NULL,
	`nm_prodi` VARCHAR(50) NOT NULL COLLATE 'utf8_general_ci',
	`id_krs` INT(11) NOT NULL,
	`nm_dosen` TEXT NOT NULL COLLATE 'latin1_swedish_ci',
	`status_upload` ENUM('Y','N') NOT NULL COLLATE 'utf8_general_ci'
) ENGINE=MyISAM;

CREATE TABLE `v_dosen_pembimbing` (
	`id_pembimbing` INT(11) NOT NULL,
	`id_dosen` VARCHAR(50) NOT NULL COLLATE 'latin1_swedish_ci',
	`nm_dosen` TEXT NOT NULL COLLATE 'latin1_swedish_ci',
	`status` ENUM('1','2') NOT NULL COLLATE 'latin1_swedish_ci'
) ENGINE=MyISAM;

CREATE TABLE `v_dosen_penguji` (
	`id_dosen_penguji` INT(11) NOT NULL,
	`id_proposal_maju` INT(11) NOT NULL,
	`id_dosen` VARCHAR(50) NOT NULL COLLATE 'latin1_swedish_ci',
	`penguji` TEXT NOT NULL COLLATE 'latin1_swedish_ci',
	`jabatan_penguji` ENUM('1','2','3','4','5') NOT NULL COLLATE 'latin1_swedish_ci',
	`id_proposal` INT(11) NOT NULL,
	`nm_prodi` VARCHAR(50) NOT NULL COLLATE 'utf8_general_ci',
	`judul` TEXT NOT NULL COLLATE 'latin1_swedish_ci',
	`id_pembimbing_1` INT(11) NOT NULL,
	`pembimbing_1` TEXT NOT NULL COLLATE 'latin1_swedish_ci',
	`id_pembimbing_2` INT(11) NOT NULL,
	`pembimbing_2` TEXT NOT NULL COLLATE 'latin1_swedish_ci'
) ENGINE=MyISAM;

CREATE TABLE `v_dosen_wali` (
	`id_dosen_wali` INT(11) NOT NULL,
	`id_dosen` VARCHAR(50) NOT NULL COLLATE 'latin1_swedish_ci',
	`nm_dosen` TEXT NOT NULL COLLATE 'latin1_swedish_ci',
	`tanggal_diangkat` DATE NOT NULL
) ENGINE=MyISAM;

CREATE TABLE `v_jadwal` (
	`id_jadwal` INT(11) NOT NULL,
	`id_kurikulum` INT(11) NOT NULL,
	`kd_prodi` INT(11) NOT NULL,
	`nm_hari` ENUM('Senin','Selasa','Rabu','Kamis','Jumat','Belum Diisi') NOT NULL COLLATE 'latin1_swedish_ci',
	`nm_jam` VARCHAR(50) NOT NULL COLLATE 'latin1_swedish_ci',
	`kode_mk` VARCHAR(50) NOT NULL COLLATE 'latin1_swedish_ci',
	`nm_mk` TEXT NOT NULL COLLATE 'latin1_swedish_ci',
	`sks` INT(11) NOT NULL,
	`nm_kelas` VARCHAR(50) NOT NULL COLLATE 'latin1_swedish_ci',
	`nm_dosen` TEXT NOT NULL COLLATE 'latin1_swedish_ci',
	`nm_ruangan` VARCHAR(50) NOT NULL COLLATE 'latin1_swedish_ci'
) ENGINE=MyISAM;

CREATE TABLE `v_kelas_dosen` (
	`id_kelas_dosen` INT(11) NOT NULL,
	`validasi_baak` ENUM('Y','N') NOT NULL COLLATE 'latin1_swedish_ci',
	`id_kurikulum` INT(10) NOT NULL,
	`id_kelas_kuliah` INT(11) NOT NULL,
	`nidn` VARCHAR(50) NOT NULL COLLATE 'latin1_swedish_ci',
	`nm_dosen` TEXT NOT NULL COLLATE 'latin1_swedish_ci',
	`kode_mk` VARCHAR(50) NOT NULL COLLATE 'latin1_swedish_ci',
	`nm_mk` TEXT NOT NULL COLLATE 'latin1_swedish_ci',
	`nm_kelas` VARCHAR(50) NOT NULL COLLATE 'latin1_swedish_ci',
	`r_t_muka` INT(11) NOT NULL,
	`t_muka` INT(11) NOT NULL,
	`ta` VARCHAR(50) NOT NULL COLLATE 'utf8_general_ci',
	`id_prodi` INT(11) NOT NULL,
	`nm_prodi` VARCHAR(50) NOT NULL COLLATE 'utf8_general_ci'
) ENGINE=MyISAM;

CREATE TABLE `v_kelas_kuliah` (
	`id_kelas` INT(11) NOT NULL,
	`id_kurikulum` INT(11) NOT NULL,
	`kode_mk` VARCHAR(50) NOT NULL COLLATE 'latin1_swedish_ci',
	`sks` INT(11) NOT NULL,
	`nm_mk` TEXT NOT NULL COLLATE 'latin1_swedish_ci',
	`ta` VARCHAR(50) NOT NULL COLLATE 'utf8_general_ci',
	`nm_kelas` VARCHAR(50) NOT NULL COLLATE 'latin1_swedish_ci',
	`id_prodi` INT(11) NOT NULL,
	`nm_prodi` VARCHAR(50) NOT NULL COLLATE 'utf8_general_ci'
) ENGINE=MyISAM;

CREATE TABLE `v_list_proposal` (
	`id_mhs_proposal` INT(11) NOT NULL,
	`nim` VARCHAR(50) NOT NULL COLLATE 'latin1_swedish_ci',
	`nm_mhs` VARCHAR(50) NOT NULL COLLATE 'latin1_swedish_ci',
	`id_pembimbing_1` INT(11) NOT NULL,
	`pembimbing_1` TEXT NOT NULL COLLATE 'latin1_swedish_ci',
	`id_pembimbing_2` INT(11) NOT NULL,
	`pembimbing_2` TEXT NOT NULL COLLATE 'latin1_swedish_ci',
	`id_prodi` INT(11) NOT NULL,
	`nm_prodi` VARCHAR(50) NOT NULL COLLATE 'utf8_general_ci',
	`judul` TEXT NOT NULL COLLATE 'latin1_swedish_ci',
	`setor_judul` DATETIME NOT NULL,
	`tgl_kadaluarsa` DATETIME NOT NULL
) ENGINE=MyISAM;

CREATE TABLE `v_mhs_aktif` (
	`nim` VARCHAR(50) NOT NULL COLLATE 'latin1_swedish_ci',
	`no_ktp` VARCHAR(50) NULL COLLATE 'latin1_swedish_ci',
	`email` TEXT NULL COLLATE 'latin1_swedish_ci',
	`nm_mhs` VARCHAR(50) NOT NULL COLLATE 'latin1_swedish_ci',
	`tpt_lhr` VARCHAR(50) NOT NULL COLLATE 'latin1_swedish_ci',
	`tgl_lahir` DATE NOT NULL,
	`jenkel` ENUM('L','P') NOT NULL COLLATE 'latin1_swedish_ci',
	`agama` VARCHAR(255) NOT NULL COLLATE 'utf8_general_ci',
	`id_agama` INT(11) NOT NULL COMMENT 'admin',
	`alamat` VARCHAR(50) NOT NULL COLLATE 'latin1_swedish_ci',
	`wilayah` VARCHAR(50) NOT NULL COLLATE 'latin1_swedish_ci',
	`kd_prodi` INT(11) NOT NULL,
	`nm_prodi` VARCHAR(50) NOT NULL COLLATE 'utf8_general_ci',
	`tgl_masuk` DATE NOT NULL,
	`smt_masuk` VARCHAR(10) NOT NULL COLLATE 'latin1_swedish_ci',
	`nm_status` CHAR(2) NOT NULL COLLATE 'utf8_general_ci',
	`keterangan` MEDIUMTEXT NOT NULL COLLATE 'utf8_general_ci'
) ENGINE=MyISAM;

CREATE TABLE `v_mhs_krs` (
	`status_buka` ENUM('Y','N') NOT NULL COLLATE 'latin1_swedish_ci',
	`id_krs` INT(11) NOT NULL,
	`status_cetak` ENUM('Y','N') NOT NULL COLLATE 'latin1_swedish_ci',
	`nim` VARCHAR(50) NOT NULL COLLATE 'latin1_swedish_ci',
	`smt_masuk` VARCHAR(10) NOT NULL COLLATE 'latin1_swedish_ci',
	`nama` VARCHAR(50) NOT NULL COLLATE 'latin1_swedish_ci',
	`kode_pembayaran` VARCHAR(50) NOT NULL COLLATE 'latin1_swedish_ci',
	`nm_kurikulum` VARCHAR(50) NOT NULL COLLATE 'utf8_general_ci',
	`id_kurikulum` INT(10) NOT NULL,
	`ta` VARCHAR(50) NOT NULL COLLATE 'utf8_general_ci',
	`status_ambil` ENUM('Y','T') NOT NULL COLLATE 'latin1_swedish_ci',
	`status_cek` ENUM('Y','N') NOT NULL COLLATE 'latin1_swedish_ci',
	`kd_prodi` INT(11) NOT NULL,
	`nm_prodi` VARCHAR(50) NOT NULL COLLATE 'utf8_general_ci'
) ENGINE=MyISAM;

CREATE TABLE `v_mhs_lulus` (
	`nim` VARCHAR(50) NOT NULL COLLATE 'latin1_swedish_ci',
	`nm_mhs` VARCHAR(50) NOT NULL COLLATE 'latin1_swedish_ci',
	`tpt_lhr` VARCHAR(50) NOT NULL COLLATE 'latin1_swedish_ci',
	`tgl_lahir` DATE NOT NULL,
	`jenkel` ENUM('L','P') NOT NULL COLLATE 'latin1_swedish_ci',
	`alamat` VARCHAR(50) NOT NULL COLLATE 'latin1_swedish_ci',
	`wilayah` VARCHAR(50) NOT NULL COLLATE 'latin1_swedish_ci',
	`tgl_masuk` DATE NOT NULL,
	`smt_masuk` VARCHAR(10) NOT NULL COLLATE 'latin1_swedish_ci',
	`nm_jenis_keluar` VARCHAR(50) NOT NULL COLLATE 'utf8_general_ci',
	`tgl_keluar` DATE NULL,
	`jalur_skripsi` ENUM('1','0') NULL COLLATE 'latin1_swedish_ci',
	`judul_skripsi` TEXT NULL COLLATE 'latin1_swedish_ci',
	`bln_awal_bim` DATE NULL,
	`bln_akhir_bim` DATE NULL,
	`sk_yudisium` VARCHAR(50) NULL COLLATE 'latin1_swedish_ci',
	`IPK` VARCHAR(50) NULL COLLATE 'latin1_swedish_ci',
	`no_ijazah` VARCHAR(50) NULL COLLATE 'latin1_swedish_ci',
	`ket` TEXT NULL COLLATE 'latin1_swedish_ci'
) ENGINE=MyISAM;

CREATE TABLE `v_mhs_transfer` (
	`id_trans` INT(10) NOT NULL,
	`nim` VARCHAR(50) NOT NULL COLLATE 'latin1_swedish_ci',
	`nama` VARCHAR(50) NOT NULL COLLATE 'latin1_swedish_ci',
	`prodi_asal` VARCHAR(50) NULL COLLATE 'latin1_swedish_ci',
	`pt_asal` VARCHAR(50) NULL COLLATE 'latin1_swedish_ci',
	`sks_diakui` INT(10) NOT NULL
) ENGINE=MyISAM;

CREATE TABLE `v_mhs_wali` (
	`id_mhs_wali` INT(11) NOT NULL,
	`id_dosen_wali` INT(11) NOT NULL,
	`id_mhs` VARCHAR(50) NOT NULL COLLATE 'latin1_swedish_ci',
	`nm_mhs` VARCHAR(50) NOT NULL COLLATE 'latin1_swedish_ci',
	`id_dosen` VARCHAR(50) NOT NULL COLLATE 'latin1_swedish_ci',
	`nm_dosen` TEXT NOT NULL COLLATE 'latin1_swedish_ci',
	`tanggal_diangkat` DATE NOT NULL,
	`kd_prodi` INT(11) NOT NULL,
	`nm_prodi` VARCHAR(50) NOT NULL COLLATE 'utf8_general_ci'
) ENGINE=MyISAM;

CREATE TABLE `v_mk_kurikulum` (
	`id_kur_mk` INT(11) NOT NULL,
	`silabus` ENUM('Y','N') NOT NULL COLLATE 'latin1_swedish_ci',
	`modul` ENUM('Y','N') NOT NULL COLLATE 'latin1_swedish_ci',
	`kode_mk` VARCHAR(50) NOT NULL COLLATE 'latin1_swedish_ci',
	`nm_mk` TEXT NOT NULL COLLATE 'latin1_swedish_ci',
	`sks` INT(11) NOT NULL,
	`semester` INT(11) UNSIGNED NOT NULL,
	`id_kurikulum` INT(11) NOT NULL,
	`nm_kurikulum` VARCHAR(50) NOT NULL COLLATE 'utf8_general_ci',
	`ta` VARCHAR(50) NOT NULL COLLATE 'utf8_general_ci',
	`kd_prodi` INT(11) NOT NULL,
	`nm_prodi` VARCHAR(50) NOT NULL COLLATE 'utf8_general_ci'
) ENGINE=MyISAM;

CREATE TABLE `v_nilai` (
	`id_nilai` INT(10) NOT NULL,
	`id_krs` INT(50) NOT NULL,
	`nim` VARCHAR(50) NOT NULL COLLATE 'latin1_swedish_ci',
	`smt_masuk` VARCHAR(10) NOT NULL COLLATE 'latin1_swedish_ci',
	`status_awal` ENUM('1','2') NOT NULL COLLATE 'latin1_swedish_ci',
	`nm_mhs` VARCHAR(50) NOT NULL COLLATE 'latin1_swedish_ci',
	`kode_mk` VARCHAR(50) NOT NULL COLLATE 'latin1_swedish_ci',
	`nm_mk` TEXT NOT NULL COLLATE 'latin1_swedish_ci',
	`sks` INT(11) NOT NULL,
	`ta` VARCHAR(50) NOT NULL COLLATE 'utf8_general_ci',
	`nm_kelas` VARCHAR(50) NOT NULL COLLATE 'latin1_swedish_ci',
	`nilai_angka` VARCHAR(50) NOT NULL COLLATE 'utf8_general_ci',
	`nilai_huruf` VARCHAR(10) NOT NULL COLLATE 'utf8_general_ci',
	`nilai_index` FLOAT NOT NULL,
	`id_prodi` INT(11) NOT NULL,
	`nm_prodi` VARCHAR(50) NOT NULL COLLATE 'utf8_general_ci'
) ENGINE=MyISAM;

CREATE TABLE `v_nilai_transfer` (
	`id_nilai_trans` INT(11) NOT NULL,
	`nim` VARCHAR(50) NOT NULL COLLATE 'latin1_swedish_ci',
	`id_mk` VARCHAR(50) NOT NULL COLLATE 'latin1_swedish_ci',
	`nm_mk_now` TEXT NOT NULL COLLATE 'latin1_swedish_ci',
	`kd_prodi` INT(11) NOT NULL,
	`kode_mk_asal` VARCHAR(50) NOT NULL COLLATE 'latin1_swedish_ci',
	`nm_mk_asal` TEXT NOT NULL COLLATE 'latin1_swedish_ci',
	`sks_asal` INT(11) NOT NULL,
	`sks_diakui` INT(11) NOT NULL,
	`nilai_huruf_asal` VARCHAR(2) NOT NULL COLLATE 'latin1_swedish_ci',
	`nilai_huruf_diakui` VARCHAR(2) NOT NULL COLLATE 'latin1_swedish_ci',
	`nilai_angka_diakui` INT(11) NOT NULL
) ENGINE=MyISAM;

CREATE TABLE `v_proposal` (
	`id_mhs_proposal` INT(11) NOT NULL,
	`nim` VARCHAR(50) NOT NULL COLLATE 'latin1_swedish_ci',
	`nm_mhs` VARCHAR(50) NOT NULL COLLATE 'latin1_swedish_ci',
	`id_pembimbing_1` INT(11) NOT NULL,
	`pembimbing_1` TEXT NOT NULL COLLATE 'latin1_swedish_ci',
	`id_pembimbing_2` INT(11) NOT NULL,
	`pembimbing_2` TEXT NOT NULL COLLATE 'latin1_swedish_ci',
	`id_prodi` INT(11) NOT NULL,
	`nm_prodi` VARCHAR(50) NOT NULL COLLATE 'utf8_general_ci',
	`judul` TEXT NOT NULL COLLATE 'latin1_swedish_ci',
	`setor_judul` DATETIME NOT NULL,
	`tgl_kadaluarsa` DATETIME NOT NULL
) ENGINE=MyISAM;

CREATE TABLE `v_proposal_maju` (
	`status_kliring` ENUM('Y','N') NOT NULL COLLATE 'latin1_swedish_ci',
	`id_proposal_maju` INT(11) NOT NULL,
	`id_mhs_proposal` INT(11) NOT NULL,
	`nim` VARCHAR(50) NOT NULL COLLATE 'latin1_swedish_ci',
	`nm_mhs` VARCHAR(50) NOT NULL COLLATE 'latin1_swedish_ci',
	`id_pembimbing_1` INT(11) NOT NULL,
	`pembimbing_1` TEXT NOT NULL COLLATE 'latin1_swedish_ci',
	`nidn_pembimbing_1` VARCHAR(50) NOT NULL COLLATE 'latin1_swedish_ci',
	`id_pembimbing_2` INT(11) NOT NULL,
	`nidn_pembimbing_2` VARCHAR(50) NOT NULL COLLATE 'latin1_swedish_ci',
	`pembimbing_2` TEXT NOT NULL COLLATE 'latin1_swedish_ci',
	`id_prodi` INT(11) NOT NULL,
	`nm_prodi` VARCHAR(50) NOT NULL COLLATE 'utf8_general_ci',
	`judul` TEXT NOT NULL COLLATE 'latin1_swedish_ci',
	`bebas_pustaka` ENUM('Y','N') NOT NULL COLLATE 'latin1_swedish_ci',
	`bebas_smt` ENUM('Y','N') NOT NULL COLLATE 'latin1_swedish_ci',
	`tgl_daftar` DATE NOT NULL,
	`tgl_maju` DATE NOT NULL,
	`kode_bayar` VARCHAR(50) NOT NULL COLLATE 'latin1_swedish_ci'
) ENGINE=MyISAM;

CREATE TABLE `v_rasio_mhs_aktif` (
	`mahasiswa_aktif` BIGINT(21) NOT NULL,
	`ta` VARCHAR(50) NOT NULL COLLATE 'utf8_general_ci',
	`kd_prodi` INT(11) NOT NULL,
	`nm_prodi` VARCHAR(50) NOT NULL COLLATE 'utf8_general_ci',
	`smt_masuk` VARCHAR(10) NOT NULL COLLATE 'latin1_swedish_ci',
	`total_mhs` BIGINT(21) NULL
) ENGINE=MyISAM;

CREATE TABLE `v_skripsi` (
	`id_skripsi` INT(11) NOT NULL,
	`bebas_pustaka` ENUM('Y','N') NOT NULL COLLATE 'latin1_swedish_ci',
	`tgl_maju` DATE NOT NULL,
	`bebas_smt` ENUM('Y','N') NOT NULL COLLATE 'latin1_swedish_ci',
	`bebas_proposal` ENUM('Y','N') NOT NULL COLLATE 'latin1_swedish_ci',
	`kliring_nilai` ENUM('Y','N') NOT NULL COLLATE 'latin1_swedish_ci',
	`valid_prodi` ENUM('Y','N') NOT NULL COLLATE 'latin1_swedish_ci',
	`tgl_daftar` DATE NOT NULL,
	`id_proposal_maju` INT(11) NOT NULL,
	`id_pembimbing_1` INT(11) NOT NULL,
	`pembimbing_1` TEXT NOT NULL COLLATE 'latin1_swedish_ci',
	`id_pembimbing_2` INT(11) NOT NULL,
	`pembimbing_2` TEXT NOT NULL COLLATE 'latin1_swedish_ci',
	`nim` VARCHAR(50) NOT NULL COLLATE 'latin1_swedish_ci',
	`nm_mhs` VARCHAR(50) NOT NULL COLLATE 'latin1_swedish_ci',
	`nm_prodi` VARCHAR(50) NOT NULL COLLATE 'utf8_general_ci',
	`judul` TEXT NOT NULL COLLATE 'latin1_swedish_ci'
) ENGINE=MyISAM;

CREATE TABLE `v_sync_data_krs` (
	`id_data_krs` INT(50) NOT NULL,
	`nim` VARCHAR(50) NOT NULL COLLATE 'latin1_swedish_ci',
	`nm_mhs` VARCHAR(50) NOT NULL COLLATE 'latin1_swedish_ci',
	`id_matkul` VARCHAR(50) NOT NULL COLLATE 'latin1_swedish_ci',
	`nm_mk` TEXT NOT NULL COLLATE 'latin1_swedish_ci',
	`nm_kelas` VARCHAR(50) NOT NULL COLLATE 'latin1_swedish_ci',
	`ta` VARCHAR(50) NOT NULL COLLATE 'utf8_general_ci',
	`id_prodi` INT(11) NOT NULL,
	`nm_prodi` VARCHAR(50) NOT NULL COLLATE 'utf8_general_ci',
	`status_upload` ENUM('Y','N') NOT NULL COLLATE 'utf8_general_ci'
) ENGINE=MyISAM;

CREATE TABLE `v_sync_kelas_dosen` (
	`nidn` VARCHAR(50) NOT NULL COLLATE 'latin1_swedish_ci',
	`nm_dosen` TEXT NOT NULL COLLATE 'latin1_swedish_ci',
	`kode_mk` VARCHAR(50) NOT NULL COLLATE 'latin1_swedish_ci',
	`nm_mk` TEXT NOT NULL COLLATE 'latin1_swedish_ci',
	`nm_kelas` VARCHAR(50) NOT NULL COLLATE 'latin1_swedish_ci',
	`r_t_muka` INT(11) NOT NULL,
	`t_muka` INT(11) NOT NULL,
	`ta` VARCHAR(50) NOT NULL COLLATE 'utf8_general_ci',
	`id_prodi` INT(11) NOT NULL,
	`nm_prodi` VARCHAR(50) NOT NULL COLLATE 'utf8_general_ci'
) ENGINE=MyISAM;

CREATE TABLE `v_sync_kelas_kuliah` (
	`id_kelas` INT(11) NOT NULL,
	`kode_mk` VARCHAR(50) NOT NULL COLLATE 'latin1_swedish_ci',
	`nm_mk` TEXT NOT NULL COLLATE 'latin1_swedish_ci',
	`ta` VARCHAR(50) NOT NULL COLLATE 'utf8_general_ci',
	`nm_kelas` VARCHAR(50) NOT NULL COLLATE 'latin1_swedish_ci',
	`id_prodi` INT(11) NOT NULL,
	`nm_prodi` VARCHAR(50) NOT NULL COLLATE 'utf8_general_ci',
	`status_upload` ENUM('Y','N') NOT NULL COLLATE 'latin1_swedish_ci'
) ENGINE=MyISAM;

CREATE TABLE `v_sync_mhs` (
	`nim` VARCHAR(50) NOT NULL COLLATE 'latin1_swedish_ci',
	`nm_mhs` VARCHAR(50) NOT NULL COLLATE 'latin1_swedish_ci',
	`tpt_lhr` VARCHAR(50) NOT NULL COLLATE 'latin1_swedish_ci',
	`tgl_lahir` DATE NOT NULL,
	`jenkel` ENUM('L','P') NOT NULL COLLATE 'latin1_swedish_ci',
	`nm_ibu` VARCHAR(50) NOT NULL COLLATE 'latin1_swedish_ci',
	`agama` INT(11) NOT NULL COMMENT 'admin',
	`alamat` VARCHAR(50) NOT NULL COLLATE 'latin1_swedish_ci',
	`wilayah` VARCHAR(50) NOT NULL COLLATE 'latin1_swedish_ci',
	`nm_prodi` VARCHAR(50) NOT NULL COLLATE 'utf8_general_ci',
	`tgl_masuk` DATE NOT NULL,
	`smt_masuk` VARCHAR(10) NOT NULL COLLATE 'latin1_swedish_ci',
	`nm_status` CHAR(2) NOT NULL COLLATE 'utf8_general_ci',
	`keterangan` MEDIUMTEXT NOT NULL COLLATE 'utf8_general_ci',
	`status_upload` ENUM('Y','N') NULL COLLATE 'latin1_swedish_ci',
	`id_prodi` INT(11) NOT NULL,
	`status_awal` ENUM('1','2') NOT NULL COLLATE 'latin1_swedish_ci'
) ENGINE=MyISAM;

CREATE TABLE `v_sync_mhs_lulus` (
	`nim` VARCHAR(50) NOT NULL COLLATE 'latin1_swedish_ci',
	`nm_mhs` VARCHAR(50) NOT NULL COLLATE 'latin1_swedish_ci',
	`tpt_lhr` VARCHAR(50) NOT NULL COLLATE 'latin1_swedish_ci',
	`tgl_lahir` DATE NOT NULL,
	`jenkel` ENUM('L','P') NOT NULL COLLATE 'latin1_swedish_ci',
	`alamat` VARCHAR(50) NOT NULL COLLATE 'latin1_swedish_ci',
	`wilayah` VARCHAR(50) NOT NULL COLLATE 'latin1_swedish_ci',
	`tgl_masuk` DATE NOT NULL,
	`smt_masuk` VARCHAR(10) NOT NULL COLLATE 'latin1_swedish_ci',
	`id_jenis_keluar` INT(10) NOT NULL,
	`tgl_keluar` DATE NULL,
	`jalur_skripsi` ENUM('1','0') NULL COLLATE 'latin1_swedish_ci',
	`judul_skripsi` TEXT NULL COLLATE 'latin1_swedish_ci',
	`bln_awal_bim` DATE NULL,
	`bln_akhir_bim` DATE NULL,
	`sk_yudisium` VARCHAR(50) NULL COLLATE 'latin1_swedish_ci',
	`IPK` VARCHAR(50) NULL COLLATE 'latin1_swedish_ci',
	`no_ijazah` VARCHAR(50) NULL COLLATE 'latin1_swedish_ci',
	`ket` TEXT NULL COLLATE 'latin1_swedish_ci',
	`status_upload` ENUM('Y','N') NOT NULL COLLATE 'latin1_swedish_ci'
) ENGINE=MyISAM;

CREATE TABLE `v_sync_mk_kurikulum` (
	`id_kur_mk` INT(11) NOT NULL,
	`kode_mk` VARCHAR(50) NOT NULL COLLATE 'latin1_swedish_ci',
	`nm_mk` TEXT NOT NULL COLLATE 'latin1_swedish_ci',
	`sks` INT(11) NOT NULL,
	`semester` INT(11) UNSIGNED NOT NULL,
	`id_kurikulum` INT(11) NOT NULL,
	`nm_kurikulum` VARCHAR(50) NOT NULL COLLATE 'utf8_general_ci',
	`ta` VARCHAR(50) NOT NULL COLLATE 'utf8_general_ci',
	`kd_prodi` INT(11) NOT NULL,
	`nm_prodi` VARCHAR(50) NOT NULL COLLATE 'utf8_general_ci'
) ENGINE=MyISAM;

CREATE TABLE `v_sync_nilai` (
	`id_nilai` INT(10) NOT NULL,
	`nim` VARCHAR(50) NOT NULL COLLATE 'latin1_swedish_ci',
	`nm_mhs` VARCHAR(50) NOT NULL COLLATE 'latin1_swedish_ci',
	`kode_mk` VARCHAR(50) NOT NULL COLLATE 'latin1_swedish_ci',
	`nm_mk` TEXT NOT NULL COLLATE 'latin1_swedish_ci',
	`ta` VARCHAR(50) NOT NULL COLLATE 'utf8_general_ci',
	`nm_kelas` VARCHAR(50) NOT NULL COLLATE 'latin1_swedish_ci',
	`nilai_angka` VARCHAR(50) NOT NULL COLLATE 'utf8_general_ci',
	`nilai_huruf` VARCHAR(10) NOT NULL COLLATE 'utf8_general_ci',
	`nilai_index` FLOAT NOT NULL,
	`id_prodi` INT(11) NOT NULL,
	`nm_prodi` VARCHAR(50) NOT NULL COLLATE 'utf8_general_ci',
	`status_upload` ENUM('Y','N') NOT NULL COLLATE 'utf8_general_ci'
) ENGINE=MyISAM;

CREATE TABLE `z_login_mhs` (
	`id_user` INT(10) NOT NULL,
	`kode_bayar` VARCHAR(50) NOT NULL COLLATE 'latin1_swedish_ci',
	`username` VARCHAR(50) NOT NULL COLLATE 'latin1_swedish_ci',
	`password` VARCHAR(50) NOT NULL COLLATE 'latin1_swedish_ci',
	`level` ENUM('mhs') NOT NULL COLLATE 'latin1_swedish_ci',
	`val_periode` ENUM('Y','N') NOT NULL COLLATE 'latin1_swedish_ci',
	`status_cek` ENUM('Y','N') NOT NULL COLLATE 'latin1_swedish_ci',
	`nim` VARCHAR(50) NOT NULL COLLATE 'latin1_swedish_ci',
	`nm_mhs` VARCHAR(50) NOT NULL COLLATE 'latin1_swedish_ci',
	`status_mhs` INT(4) NOT NULL,
	`ta` VARCHAR(50) NOT NULL COLLATE 'utf8_general_ci',
	`id_prodi` INT(11) NOT NULL
) ENGINE=MyISAM;

CREATE TABLE `z_mhs_krs` (
	`id_krs` INT(11) NOT NULL,
	`nim` VARCHAR(50) NOT NULL COLLATE 'latin1_swedish_ci',
	`nama` VARCHAR(50) NOT NULL COLLATE 'latin1_swedish_ci',
	`kode_pembayaran` VARCHAR(50) NOT NULL COLLATE 'latin1_swedish_ci',
	`nm_kurikulum` VARCHAR(50) NOT NULL COLLATE 'utf8_general_ci',
	`ta` VARCHAR(50) NOT NULL COLLATE 'utf8_general_ci',
	`status_ambil` ENUM('Y','T') NOT NULL COLLATE 'latin1_swedish_ci',
	`status_cek` ENUM('Y','N') NOT NULL COLLATE 'latin1_swedish_ci'
) ENGINE=MyISAM;

DROP TABLE IF EXISTS `v_bayar_smt`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_bayar_smt` AS select `view_pembayaran`.`nim` AS `nim`,`view_pembayaran`.`kode_bayar` AS `kode_bayar`,`view_pembayaran`.`statusbayar` AS `statusbayar`,`view_pembayaran`.`nama_jns_bayar` AS `nama_jns_bayar`,`view_pembayaran`.`keterangan` AS `keterangan` from `db_siami`.`view_pembayaran` where ((`view_pembayaran`.`nama_jns_bayar` = 'Semester') and (`view_pembayaran`.`statusbayar` = 'Lunas'));

DROP TABLE IF EXISTS `v_count_down`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_count_down` AS select `m1`.`id_cd_krs` AS `id_cd_krs`,`m1`.`waktu_buka` AS `waktu_buka`,`m1`.`waktu_tutup` AS `waktu_tutup`,`m2`.`ta` AS `ta`,`m2`.`kd_prodi` AS `kd_prodi` from (`tb_cd_krs` `m1` join `tb_kurikulum` `m2` on((`m1`.`id_kurikulum` = `m2`.`id_kurikulum`)));

DROP TABLE IF EXISTS `v_count_down_khs`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_count_down_khs` AS select `m1`.`id_cd_khs` AS `id_cd_krs`,`m1`.`waktu_buka` AS `waktu_buka`,`m1`.`waktu_tutup` AS `waktu_tutup`,`m2`.`ta` AS `ta`,`m2`.`kd_prodi` AS `kd_prodi` from (`tb_cd_khs` `m1` join `tb_kurikulum` `m2` on((`m1`.`id_kurikulum` = `m2`.`id_kurikulum`)));

DROP TABLE IF EXISTS `v_data_krs`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_data_krs` AS select `m1`.`status_komplain` AS `status_komplain`,`m1`.`id_data_krs` AS `id_data_krs`,`m7`.`id_kurikulum` AS `id_kurikulum`,`m1`.`status_nilai` AS `status_nilai`,`m1`.`id_kelas` AS `id_kelas`,`m3`.`nim` AS `nim`,`m3`.`nm_mhs` AS `nm_mhs`,`m4`.`id_matkul` AS `id_matkul`,`m5`.`nm_mk` AS `nm_mk`,`m5`.`sks` AS `sks`,`m4`.`nm_kelas` AS `nm_kelas`,`m7`.`ta` AS `ta`,`m6`.`id_prodi` AS `id_prodi`,`m6`.`nm_prodi` AS `nm_prodi`,`m2`.`id_krs` AS `id_krs`,`m9`.`nm_dosen` AS `nm_dosen`,`m1`.`status_upload` AS `status_upload` from ((((((((`tb_mhs_data_krs` `m1` join `tb_mhs_krs` `m2` on((`m1`.`id_krs` = `m2`.`id_krs`))) join `tb_mhs` `m3` on((`m2`.`id_mhs` = `m3`.`nim`))) join `tb_kelas_kul` `m4` on((`m1`.`id_kelas` = `m4`.`id_kelas`))) join `tb_mata_kuliah` `m5` on((`m4`.`id_matkul` = `m5`.`kode_mk`))) join `tb_prodi` `m6` on((`m4`.`id_prodi` = `m6`.`id_prodi`))) join `tb_kurikulum` `m7` on((`m4`.`id_kurikulum` = `m7`.`id_kurikulum`))) join `tb_kelas_dosen` `m8` on((`m4`.`id_kelas` = `m8`.`id_kelas_kuliah`))) join `tb_dosen` `m9` on((`m8`.`id_dosen` = `m9`.`nidn`)));

DROP TABLE IF EXISTS `v_dosen_pembimbing`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_dosen_pembimbing` AS select `m1`.`id_pembimbing` AS `id_pembimbing`,`m1`.`id_dosen` AS `id_dosen`,`m2`.`nm_dosen` AS `nm_dosen`,`m1`.`status` AS `status` from (`tb_dosen_pembimbing` `m1` join `tb_dosen` `m2` on((`m1`.`id_dosen` = `m2`.`nidn`)));

DROP TABLE IF EXISTS `v_dosen_penguji`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_dosen_penguji` AS select `m9`.`id_dosen_penguji` AS `id_dosen_penguji`,`m9`.`id_proposal_maju` AS `id_proposal_maju`,`m9`.`id_dosen` AS `id_dosen`,`m10`.`nm_dosen` AS `penguji`,`m9`.`jabatan_penguji` AS `jabatan_penguji`,`m8`.`id_proposal` AS `id_proposal`,`m7`.`nm_prodi` AS `nm_prodi`,`m1`.`judul` AS `judul`,`m2`.`id_pembimbing` AS `id_pembimbing_1`,`m3`.`nm_dosen` AS `pembimbing_1`,`m4`.`id_pembimbing` AS `id_pembimbing_2`,`m5`.`nm_dosen` AS `pembimbing_2` from (((((((((`tb_dosen_penguji` `m9` join `tb_proposal_maju` `m8` on((`m9`.`id_proposal_maju` = `m8`.`id_proposal_maju`))) join `tb_proposal` `m1` on((`m8`.`id_proposal` = `m1`.`id_mhs_proposal`))) join `tb_dosen_pembimbing` `m2` on((`m1`.`id_pembimbing_1` = `m2`.`id_pembimbing`))) join `tb_dosen` `m3` on((`m2`.`id_dosen` = `m3`.`nidn`))) join `tb_dosen_pembimbing` `m4` on((`m1`.`id_pembimbing_2` = `m4`.`id_pembimbing`))) join `tb_dosen` `m5` on((`m4`.`id_dosen` = `m5`.`nidn`))) join `tb_mhs` `m6` on((`m1`.`id_mhs` = `m6`.`nim`))) join `tb_prodi` `m7` on((`m6`.`kd_prodi` = `m7`.`id_prodi`))) join `tb_dosen` `m10` on((`m9`.`id_dosen` = `m10`.`nidn`)));

DROP TABLE IF EXISTS `v_dosen_wali`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_dosen_wali` AS select `m1`.`id_dosen_wali` AS `id_dosen_wali`,`m1`.`id_dosen` AS `id_dosen`,`m2`.`nm_dosen` AS `nm_dosen`,`m1`.`tanggal_diangkat` AS `tanggal_diangkat` from (`tb_dosen_wali` `m1` join `tb_dosen` `m2` on((`m1`.`id_dosen` = `m2`.`nidn`)));

DROP TABLE IF EXISTS `v_jadwal`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_jadwal` AS select `m1`.`id_jadwal` AS `id_jadwal`,`m1`.`id_kurikulum` AS `id_kurikulum`,`m7`.`kd_prodi` AS `kd_prodi`,`m1`.`nm_hari` AS `nm_hari`,`m1`.`nm_jam` AS `nm_jam`,`m5`.`kode_mk` AS `kode_mk`,`m5`.`nm_mk` AS `nm_mk`,`m5`.`sks` AS `sks`,`m3`.`nm_kelas` AS `nm_kelas`,`m4`.`nm_dosen` AS `nm_dosen`,`m6`.`nm_ruangan` AS `nm_ruangan` from ((((((`tb_jadwal` `m1` join `tb_kelas_dosen` `m2` on((`m1`.`id_kelas_dosen` = `m2`.`id_kelas_dosen`))) join `tb_kelas_kul` `m3` on((`m2`.`id_kelas_kuliah` = `m3`.`id_kelas`))) join `tb_dosen` `m4` on((`m2`.`id_dosen` = `m4`.`nidn`))) join `tb_mata_kuliah` `m5` on((`m3`.`id_matkul` = `m5`.`kode_mk`))) join `tb_ruangan` `m6` on((`m1`.`id_ruang` = `m6`.`id_ruangan`))) join `tb_kurikulum` `m7` on((`m1`.`id_kurikulum` = `m7`.`id_kurikulum`)));

DROP TABLE IF EXISTS `v_kelas_dosen`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_kelas_dosen` AS select `m1`.`id_kelas_dosen` AS `id_kelas_dosen`,`m1`.`validasi_baak` AS `validasi_baak`,`m5`.`id_kurikulum` AS `id_kurikulum`,`m1`.`id_kelas_kuliah` AS `id_kelas_kuliah`,`m3`.`nidn` AS `nidn`,`m3`.`nm_dosen` AS `nm_dosen`,`m4`.`kode_mk` AS `kode_mk`,`m4`.`nm_mk` AS `nm_mk`,`m2`.`nm_kelas` AS `nm_kelas`,`m1`.`r_t_muka` AS `r_t_muka`,`m1`.`t_muka` AS `t_muka`,`m5`.`ta` AS `ta`,`m6`.`id_prodi` AS `id_prodi`,`m6`.`nm_prodi` AS `nm_prodi` from (((((`tb_kelas_dosen` `m1` join `tb_kelas_kul` `m2` on((`m1`.`id_kelas_kuliah` = `m2`.`id_kelas`))) join `tb_dosen` `m3` on((`m1`.`id_dosen` = `m3`.`nidn`))) join `tb_mata_kuliah` `m4` on((`m2`.`id_matkul` = `m4`.`kode_mk`))) join `tb_kurikulum` `m5` on((`m2`.`id_kurikulum` = `m5`.`id_kurikulum`))) join `tb_prodi` `m6` on((`m2`.`id_prodi` = `m6`.`id_prodi`)));

DROP TABLE IF EXISTS `v_kelas_kuliah`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_kelas_kuliah` AS select `m1`.`id_kelas` AS `id_kelas`,`m1`.`id_kurikulum` AS `id_kurikulum`,`m2`.`kode_mk` AS `kode_mk`,`m2`.`sks` AS `sks`,`m2`.`nm_mk` AS `nm_mk`,`m3`.`ta` AS `ta`,`m1`.`nm_kelas` AS `nm_kelas`,`m4`.`id_prodi` AS `id_prodi`,`m4`.`nm_prodi` AS `nm_prodi` from (((`tb_kelas_kul` `m1` join `tb_mata_kuliah` `m2` on((`m1`.`id_matkul` = `m2`.`kode_mk`))) join `tb_kurikulum` `m3` on((`m1`.`id_kurikulum` = `m3`.`id_kurikulum`))) join `tb_prodi` `m4` on((`m1`.`id_prodi` = `m4`.`id_prodi`)));

DROP TABLE IF EXISTS `v_list_proposal`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_list_proposal` AS select `m1`.`id_mhs_proposal` AS `id_mhs_proposal`,`m6`.`nim` AS `nim`,`m6`.`nm_mhs` AS `nm_mhs`,`m1`.`id_pembimbing_1` AS `id_pembimbing_1`,`m3`.`nm_dosen` AS `pembimbing_1`,`m1`.`id_pembimbing_2` AS `id_pembimbing_2`,`m5`.`nm_dosen` AS `pembimbing_2`,`m7`.`id_prodi` AS `id_prodi`,`m7`.`nm_prodi` AS `nm_prodi`,`m1`.`judul` AS `judul`,`m1`.`tgl_daftar` AS `setor_judul`,`m1`.`tgl_kadaluarsa` AS `tgl_kadaluarsa` from ((((((`tb_proposal` `m1` join `tb_dosen_pembimbing` `m2` on((`m1`.`id_pembimbing_1` = `m2`.`id_pembimbing`))) join `tb_dosen` `m3` on((`m2`.`id_dosen` = `m3`.`nidn`))) join `tb_dosen_pembimbing` `m4` on((`m1`.`id_pembimbing_2` = `m4`.`id_pembimbing`))) join `tb_dosen` `m5` on((`m4`.`id_dosen` = `m5`.`nidn`))) join `tb_mhs` `m6` on((`m1`.`id_mhs` = `m6`.`nim`))) join `tb_prodi` `m7` on((`m6`.`kd_prodi` = `m7`.`id_prodi`))) where (`m1`.`status_daftar` = 'N');

DROP TABLE IF EXISTS `v_mhs_aktif`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_mhs_aktif` AS select `m1`.`nim` AS `nim`,`m1`.`no_ktp` AS `no_ktp`,`m1`.`email` AS `email`,`m1`.`nm_mhs` AS `nm_mhs`,`m1`.`tpt_lhr` AS `tpt_lhr`,`m1`.`tgl_lahir` AS `tgl_lahir`,`m1`.`jenkel` AS `jenkel`,`m2`.`agama` AS `agama`,`m2`.`id_agama` AS `id_agama`,`m1`.`kelurahan` AS `alamat`,`m1`.`wilayah` AS `wilayah`,`m3`.`id_prodi` AS `kd_prodi`,`m3`.`nm_prodi` AS `nm_prodi`,`m1`.`tgl_masuk` AS `tgl_masuk`,`m1`.`smt_masuk` AS `smt_masuk`,`m4`.`nm_status` AS `nm_status`,`m4`.`ket` AS `keterangan` from (((`tb_mhs` `m1` join `agama` `m2` on((`m1`.`agama` = `m2`.`id_agama`))) join `tb_prodi` `m3` on((`m1`.`kd_prodi` = `m3`.`id_prodi`))) join `tb_status_mhs` `m4` on((`m1`.`status_mhs` = `m4`.`id_status`))) where (`m4`.`nm_status` = 'A') order by `m1`.`smt_masuk`;

DROP TABLE IF EXISTS `v_mhs_krs`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_mhs_krs` AS select `m1`.`status_buka` AS `status_buka`,`m1`.`id_krs` AS `id_krs`,`m1`.`status_cetak` AS `status_cetak`,`m1`.`id_mhs` AS `nim`,`m2`.`smt_masuk` AS `smt_masuk`,`m2`.`nm_mhs` AS `nama`,`m1`.`kode_pembayaran` AS `kode_pembayaran`,`m3`.`nm_kurikulum` AS `nm_kurikulum`,`m3`.`id_kurikulum` AS `id_kurikulum`,`m3`.`ta` AS `ta`,`m1`.`status_ambil` AS `status_ambil`,`m1`.`status_cek` AS `status_cek`,`m3`.`kd_prodi` AS `kd_prodi`,`m4`.`nm_prodi` AS `nm_prodi` from (((`tb_mhs_krs` `m1` join `tb_mhs` `m2` on((`m1`.`id_mhs` = `m2`.`nim`))) join `tb_kurikulum` `m3` on((`m1`.`id_kurikulum` = `m3`.`id_kurikulum`))) join `tb_prodi` `m4` on((`m3`.`kd_prodi` = `m4`.`id_prodi`)));

DROP TABLE IF EXISTS `v_mhs_lulus`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_mhs_lulus` AS select `m2`.`nim` AS `nim`,`m2`.`nm_mhs` AS `nm_mhs`,`m2`.`tpt_lhr` AS `tpt_lhr`,`m2`.`tgl_lahir` AS `tgl_lahir`,`m2`.`jenkel` AS `jenkel`,`m2`.`kelurahan` AS `alamat`,`m2`.`wilayah` AS `wilayah`,`m2`.`tgl_masuk` AS `tgl_masuk`,`m2`.`smt_masuk` AS `smt_masuk`,`m3`.`nm_jenis_keluar` AS `nm_jenis_keluar`,`m1`.`tgl_keluar` AS `tgl_keluar`,`m1`.`jalur_skripsi` AS `jalur_skripsi`,`m1`.`judul_skripsi` AS `judul_skripsi`,`m1`.`bln_awal_bim` AS `bln_awal_bim`,`m1`.`bln_akhir_bim` AS `bln_akhir_bim`,`m1`.`sk_yudisium` AS `sk_yudisium`,`m1`.`IPK` AS `IPK`,`m1`.`no_ijazah` AS `no_ijazah`,`m1`.`ket` AS `ket` from ((`tb_mhs_lulus` `m1` join `tb_mhs` `m2` on((`m1`.`id_mhs` = `m2`.`nim`))) join `tb_jenis_keluar` `m3` on((`m1`.`id_jns_keluar` = `m3`.`id_jenis_keluar`))) order by `m2`.`smt_masuk` desc;

DROP TABLE IF EXISTS `v_mhs_transfer`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_mhs_transfer` AS select `m1`.`id_trans` AS `id_trans`,`m1`.`id_mhs` AS `nim`,`m2`.`nm_mhs` AS `nama`,`m1`.`prodi_asal` AS `prodi_asal`,`m1`.`pt_asal` AS `pt_asal`,`m1`.`sks_diakui` AS `sks_diakui` from (`tb_mhs_transfer` `m1` join `tb_mhs` `m2` on((`m1`.`id_mhs` = `m2`.`nim`)));

DROP TABLE IF EXISTS `v_mhs_wali`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_mhs_wali` AS select `m1`.`id_mhs_wali` AS `id_mhs_wali`,`m2`.`id_dosen_wali` AS `id_dosen_wali`,`m1`.`id_mhs` AS `id_mhs`,`m3`.`nm_mhs` AS `nm_mhs`,`m2`.`id_dosen` AS `id_dosen`,`m4`.`nm_dosen` AS `nm_dosen`,`m2`.`tanggal_diangkat` AS `tanggal_diangkat`,`m3`.`kd_prodi` AS `kd_prodi`,`m5`.`nm_prodi` AS `nm_prodi` from ((((`tb_mhs_wali` `m1` join `tb_dosen_wali` `m2` on((`m1`.`id_dosen_wali` = `m2`.`id_dosen_wali`))) join `tb_mhs` `m3` on((`m1`.`id_mhs` = `m3`.`nim`))) join `tb_dosen` `m4` on((`m2`.`id_dosen` = `m4`.`nidn`))) join `tb_prodi` `m5` on((`m3`.`kd_prodi` = `m5`.`id_prodi`)));

DROP TABLE IF EXISTS `v_mk_kurikulum`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_mk_kurikulum` AS select `m1`.`id_kur_mk` AS `id_kur_mk`,`m1`.`silabus` AS `silabus`,`m1`.`modul` AS `modul`,`m1`.`kode_mk` AS `kode_mk`,`m2`.`nm_mk` AS `nm_mk`,`m2`.`sks` AS `sks`,`m2`.`semester` AS `semester`,`m1`.`id_kurikulum` AS `id_kurikulum`,`m3`.`nm_kurikulum` AS `nm_kurikulum`,`m3`.`ta` AS `ta`,`m3`.`kd_prodi` AS `kd_prodi`,`m4`.`nm_prodi` AS `nm_prodi` from (((`tb_mk_kurikulum` `m1` join `tb_mata_kuliah` `m2` on((`m1`.`kode_mk` = `m2`.`kode_mk`))) join `tb_kurikulum` `m3` on((`m1`.`id_kurikulum` = `m3`.`id_kurikulum`))) join `tb_prodi` `m4` on((`m3`.`kd_prodi` = `m4`.`id_prodi`)));

DROP TABLE IF EXISTS `v_nilai`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_nilai` AS select `m1`.`id_nilai` AS `id_nilai`,`m2`.`id_krs` AS `id_krs`,`m5`.`nim` AS `nim`,`m5`.`smt_masuk` AS `smt_masuk`,`m5`.`status_awal` AS `status_awal`,`m5`.`nm_mhs` AS `nm_mhs`,`m6`.`kode_mk` AS `kode_mk`,`m6`.`nm_mk` AS `nm_mk`,`m6`.`sks` AS `sks`,`m7`.`ta` AS `ta`,`m3`.`nm_kelas` AS `nm_kelas`,`m1`.`nilai_angka` AS `nilai_angka`,`m1`.`nilai_huruf` AS `nilai_huruf`,`m1`.`nilai_index` AS `nilai_index`,`m8`.`id_prodi` AS `id_prodi`,`m8`.`nm_prodi` AS `nm_prodi` from (((((((`tb_nilai` `m1` join `tb_mhs_data_krs` `m2` on((`m1`.`id_krs` = `m2`.`id_data_krs`))) join `tb_kelas_kul` `m3` on((`m2`.`id_kelas` = `m3`.`id_kelas`))) join `tb_mhs_krs` `m4` on((`m2`.`id_krs` = `m4`.`id_krs`))) join `tb_mhs` `m5` on((`m4`.`id_mhs` = `m5`.`nim`))) join `tb_mata_kuliah` `m6` on((`m3`.`id_matkul` = `m6`.`kode_mk`))) join `tb_kurikulum` `m7` on((`m3`.`id_kurikulum` = `m7`.`id_kurikulum`))) join `tb_prodi` `m8` on((`m3`.`id_prodi` = `m8`.`id_prodi`)));

DROP TABLE IF EXISTS `v_nilai_transfer`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `v_nilai_transfer` AS select `m1`.`id_nilai_trans` AS `id_nilai_trans`,`m4`.`nim` AS `nim`,`m1`.`id_mk` AS `id_mk`,`m3`.`nm_mk` AS `nm_mk_now`,`m4`.`kd_prodi` AS `kd_prodi`,`m1`.`kode_mk_asal` AS `kode_mk_asal`,`m1`.`nm_mk_asal` AS `nm_mk_asal`,`m1`.`sks_asal` AS `sks_asal`,`m1`.`sks_diakui` AS `sks_diakui`,`m1`.`nilai_huruf_asal` AS `nilai_huruf_asal`,`m1`.`nilai_huruf_diakui` AS `nilai_huruf_diakui`,`m1`.`nilai_angka_diakui` AS `nilai_angka_diakui` from (((`tb_nilai_trans` `m1` join `tb_mhs_transfer` `m2` on((`m1`.`id_mhs_trans` = `m2`.`id_trans`))) join `tb_mata_kuliah` `m3` on((`m1`.`id_mk` = `m3`.`kode_mk`))) join `tb_mhs` `m4` on((`m2`.`id_mhs` = `m4`.`nim`)));

DROP TABLE IF EXISTS `v_proposal`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_proposal` AS select `m1`.`id_mhs_proposal` AS `id_mhs_proposal`,`m6`.`nim` AS `nim`,`m6`.`nm_mhs` AS `nm_mhs`,`m1`.`id_pembimbing_1` AS `id_pembimbing_1`,`m3`.`nm_dosen` AS `pembimbing_1`,`m1`.`id_pembimbing_2` AS `id_pembimbing_2`,`m5`.`nm_dosen` AS `pembimbing_2`,`m7`.`id_prodi` AS `id_prodi`,`m7`.`nm_prodi` AS `nm_prodi`,`m1`.`judul` AS `judul`,`m1`.`tgl_daftar` AS `setor_judul`,`m1`.`tgl_kadaluarsa` AS `tgl_kadaluarsa` from ((((((`tb_proposal` `m1` join `tb_dosen_pembimbing` `m2` on((`m1`.`id_pembimbing_1` = `m2`.`id_pembimbing`))) join `tb_dosen` `m3` on((`m2`.`id_dosen` = `m3`.`nidn`))) join `tb_dosen_pembimbing` `m4` on((`m1`.`id_pembimbing_2` = `m4`.`id_pembimbing`))) join `tb_dosen` `m5` on((`m4`.`id_dosen` = `m5`.`nidn`))) join `tb_mhs` `m6` on((`m1`.`id_mhs` = `m6`.`nim`))) join `tb_prodi` `m7` on((`m6`.`kd_prodi` = `m7`.`id_prodi`)));

DROP TABLE IF EXISTS `v_proposal_maju`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_proposal_maju` AS select `m8`.`status_kliring` AS `status_kliring`,`m8`.`id_proposal_maju` AS `id_proposal_maju`,`m1`.`id_mhs_proposal` AS `id_mhs_proposal`,`m6`.`nim` AS `nim`,`m6`.`nm_mhs` AS `nm_mhs`,`m1`.`id_pembimbing_1` AS `id_pembimbing_1`,`m3`.`nm_dosen` AS `pembimbing_1`,`m3`.`nidn` AS `nidn_pembimbing_1`,`m1`.`id_pembimbing_2` AS `id_pembimbing_2`,`m5`.`nidn` AS `nidn_pembimbing_2`,`m5`.`nm_dosen` AS `pembimbing_2`,`m7`.`id_prodi` AS `id_prodi`,`m7`.`nm_prodi` AS `nm_prodi`,`m1`.`judul` AS `judul`,`m8`.`bebas_pustaka` AS `bebas_pustaka`,`m8`.`bebas_smt` AS `bebas_smt`,`m8`.`tgl_daftar` AS `tgl_daftar`,`m8`.`tgl_maju` AS `tgl_maju`,`m8`.`kode_bayar` AS `kode_bayar` from (((((((`tb_proposal_maju` `m8` join `tb_proposal` `m1` on((`m8`.`id_proposal` = `m1`.`id_mhs_proposal`))) join `tb_dosen_pembimbing` `m2` on((`m1`.`id_pembimbing_1` = `m2`.`id_pembimbing`))) join `tb_dosen` `m3` on((`m2`.`id_dosen` = `m3`.`nidn`))) join `tb_dosen_pembimbing` `m4` on((`m1`.`id_pembimbing_2` = `m4`.`id_pembimbing`))) join `tb_dosen` `m5` on((`m4`.`id_dosen` = `m5`.`nidn`))) join `tb_mhs` `m6` on((`m1`.`id_mhs` = `m6`.`nim`))) join `tb_prodi` `m7` on((`m6`.`kd_prodi` = `m7`.`id_prodi`)));

DROP TABLE IF EXISTS `v_rasio_mhs_aktif`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_rasio_mhs_aktif` AS select count(0) AS `mahasiswa_aktif`,`m1`.`ta` AS `ta`,`m1`.`kd_prodi` AS `kd_prodi`,`m1`.`nm_prodi` AS `nm_prodi`,`m1`.`smt_masuk` AS `smt_masuk`,(select count(0) from `tb_mhs` `m2` where ((`m2`.`smt_masuk` = `m1`.`smt_masuk`) and (`m2`.`kd_prodi` = `m1`.`kd_prodi`))) AS `total_mhs` from `v_mhs_krs` `m1` where (`m1`.`status_ambil` = 'Y') group by `m1`.`kd_prodi`,`m1`.`ta`,`m1`.`smt_masuk` order by `m1`.`ta` desc,`m1`.`kd_prodi` desc,`m1`.`smt_masuk`;

DROP TABLE IF EXISTS `v_skripsi`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_skripsi` AS select `m9`.`id_skripsi` AS `id_skripsi`,`m9`.`bebas_pustaka` AS `bebas_pustaka`,`m9`.`tgl_maju` AS `tgl_maju`,`m9`.`bebas_smt` AS `bebas_smt`,`m9`.`bebas_proposal` AS `bebas_proposal`,`m9`.`kliring_nilai` AS `kliring_nilai`,`m9`.`valid_prodi` AS `valid_prodi`,`m9`.`tgl_daftar` AS `tgl_daftar`,`m8`.`id_proposal_maju` AS `id_proposal_maju`,`m1`.`id_pembimbing_1` AS `id_pembimbing_1`,`m3`.`nm_dosen` AS `pembimbing_1`,`m1`.`id_pembimbing_2` AS `id_pembimbing_2`,`m5`.`nm_dosen` AS `pembimbing_2`,`m6`.`nim` AS `nim`,`m6`.`nm_mhs` AS `nm_mhs`,`m7`.`nm_prodi` AS `nm_prodi`,`m1`.`judul` AS `judul` from ((((((((`tb_skripsi` `m9` join `tb_proposal_maju` `m8` on((`m9`.`id_proposal_maju` = `m8`.`id_proposal_maju`))) join `tb_proposal` `m1` on((`m8`.`id_proposal` = `m1`.`id_mhs_proposal`))) join `tb_dosen_pembimbing` `m2` on((`m1`.`id_pembimbing_1` = `m2`.`id_pembimbing`))) join `tb_dosen` `m3` on((`m2`.`id_dosen` = `m3`.`nidn`))) join `tb_dosen_pembimbing` `m4` on((`m1`.`id_pembimbing_2` = `m4`.`id_pembimbing`))) join `tb_dosen` `m5` on((`m4`.`id_dosen` = `m5`.`nidn`))) join `tb_mhs` `m6` on((`m1`.`id_mhs` = `m6`.`nim`))) join `tb_prodi` `m7` on((`m6`.`kd_prodi` = `m7`.`id_prodi`)));

DROP TABLE IF EXISTS `v_sync_data_krs`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_sync_data_krs` AS select `m1`.`id_data_krs` AS `id_data_krs`,`m3`.`nim` AS `nim`,`m3`.`nm_mhs` AS `nm_mhs`,`m4`.`id_matkul` AS `id_matkul`,`m5`.`nm_mk` AS `nm_mk`,`m4`.`nm_kelas` AS `nm_kelas`,`m7`.`ta` AS `ta`,`m6`.`id_prodi` AS `id_prodi`,`m6`.`nm_prodi` AS `nm_prodi`,`m1`.`status_upload` AS `status_upload` from ((((((`tb_mhs_data_krs` `m1` join `tb_mhs_krs` `m2` on((`m1`.`id_krs` = `m2`.`id_krs`))) join `tb_mhs` `m3` on((`m2`.`id_mhs` = `m3`.`nim`))) join `tb_kelas_kul` `m4` on((`m1`.`id_kelas` = `m4`.`id_kelas`))) join `tb_mata_kuliah` `m5` on((`m4`.`id_matkul` = `m5`.`kode_mk`))) join `tb_prodi` `m6` on((`m4`.`id_prodi` = `m6`.`id_prodi`))) join `tb_kurikulum` `m7` on((`m4`.`id_kurikulum` = `m7`.`id_kurikulum`))) where (`m1`.`status_upload` = 'N');

DROP TABLE IF EXISTS `v_sync_kelas_dosen`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_sync_kelas_dosen` AS select `m3`.`nidn` AS `nidn`,`m3`.`nm_dosen` AS `nm_dosen`,`m4`.`kode_mk` AS `kode_mk`,`m4`.`nm_mk` AS `nm_mk`,`m2`.`nm_kelas` AS `nm_kelas`,`m1`.`r_t_muka` AS `r_t_muka`,`m1`.`t_muka` AS `t_muka`,`m5`.`ta` AS `ta`,`m6`.`id_prodi` AS `id_prodi`,`m6`.`nm_prodi` AS `nm_prodi` from (((((`tb_kelas_dosen` `m1` join `tb_kelas_kul` `m2` on((`m1`.`id_kelas_kuliah` = `m2`.`id_kelas`))) join `tb_dosen` `m3` on((`m1`.`id_dosen` = `m3`.`nidn`))) join `tb_mata_kuliah` `m4` on((`m2`.`id_matkul` = `m4`.`kode_mk`))) join `tb_kurikulum` `m5` on((`m2`.`id_kurikulum` = `m5`.`id_kurikulum`))) join `tb_prodi` `m6` on((`m2`.`id_prodi` = `m6`.`id_prodi`))) where ((`m1`.`status_upload` = 'N') and (`m1`.`validasi_baak` = 'Y'));

DROP TABLE IF EXISTS `v_sync_kelas_kuliah`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_sync_kelas_kuliah` AS select `m1`.`id_kelas` AS `id_kelas`,`m2`.`kode_mk` AS `kode_mk`,`m2`.`nm_mk` AS `nm_mk`,`m3`.`ta` AS `ta`,`m1`.`nm_kelas` AS `nm_kelas`,`m4`.`id_prodi` AS `id_prodi`,`m4`.`nm_prodi` AS `nm_prodi`,`m1`.`status_upload` AS `status_upload` from (((`tb_kelas_kul` `m1` join `tb_mata_kuliah` `m2` on((`m1`.`id_matkul` = `m2`.`kode_mk`))) join `tb_kurikulum` `m3` on((`m1`.`id_kurikulum` = `m3`.`id_kurikulum`))) join `tb_prodi` `m4` on((`m1`.`id_prodi` = `m4`.`id_prodi`))) where (`m1`.`status_upload` = 'N');

DROP TABLE IF EXISTS `v_sync_mhs`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_sync_mhs` AS select `m1`.`nim` AS `nim`,`m1`.`nm_mhs` AS `nm_mhs`,`m1`.`tpt_lhr` AS `tpt_lhr`,`m1`.`tgl_lahir` AS `tgl_lahir`,`m1`.`jenkel` AS `jenkel`,`m1`.`nm_ibu` AS `nm_ibu`,`m2`.`id_agama` AS `agama`,`m1`.`kelurahan` AS `alamat`,`m1`.`wilayah` AS `wilayah`,`m3`.`nm_prodi` AS `nm_prodi`,`m1`.`tgl_masuk` AS `tgl_masuk`,`m1`.`smt_masuk` AS `smt_masuk`,`m4`.`nm_status` AS `nm_status`,`m4`.`ket` AS `keterangan`,`m1`.`status_upload` AS `status_upload`,`m3`.`id_prodi` AS `id_prodi`,`m1`.`status_awal` AS `status_awal` from (((`tb_mhs` `m1` join `agama` `m2` on((`m1`.`agama` = `m2`.`id_agama`))) join `tb_prodi` `m3` on((`m1`.`kd_prodi` = `m3`.`id_prodi`))) join `tb_status_mhs` `m4` on((`m1`.`status_mhs` = `m4`.`id_status`))) where (`m1`.`status_upload` = 'N');

DROP TABLE IF EXISTS `v_sync_mhs_lulus`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_sync_mhs_lulus` AS select `m2`.`nim` AS `nim`,`m2`.`nm_mhs` AS `nm_mhs`,`m2`.`tpt_lhr` AS `tpt_lhr`,`m2`.`tgl_lahir` AS `tgl_lahir`,`m2`.`jenkel` AS `jenkel`,`m2`.`kelurahan` AS `alamat`,`m2`.`wilayah` AS `wilayah`,`m2`.`tgl_masuk` AS `tgl_masuk`,`m2`.`smt_masuk` AS `smt_masuk`,`m3`.`id_jenis_keluar` AS `id_jenis_keluar`,`m1`.`tgl_keluar` AS `tgl_keluar`,`m1`.`jalur_skripsi` AS `jalur_skripsi`,`m1`.`judul_skripsi` AS `judul_skripsi`,`m1`.`bln_awal_bim` AS `bln_awal_bim`,`m1`.`bln_akhir_bim` AS `bln_akhir_bim`,`m1`.`sk_yudisium` AS `sk_yudisium`,`m1`.`IPK` AS `IPK`,`m1`.`no_ijazah` AS `no_ijazah`,`m1`.`ket` AS `ket`,`m1`.`status_upload` AS `status_upload` from ((`tb_mhs_lulus` `m1` join `tb_mhs` `m2` on((`m1`.`id_mhs` = `m2`.`nim`))) join `tb_jenis_keluar` `m3` on((`m1`.`id_jns_keluar` = `m3`.`id_jenis_keluar`))) where (`m1`.`status_upload` = 'N');

DROP TABLE IF EXISTS `v_sync_mk_kurikulum`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_sync_mk_kurikulum` AS select `m1`.`id_kur_mk` AS `id_kur_mk`,`m1`.`kode_mk` AS `kode_mk`,`m2`.`nm_mk` AS `nm_mk`,`m2`.`sks` AS `sks`,`m2`.`semester` AS `semester`,`m1`.`id_kurikulum` AS `id_kurikulum`,`m3`.`nm_kurikulum` AS `nm_kurikulum`,`m3`.`ta` AS `ta`,`m3`.`kd_prodi` AS `kd_prodi`,`m4`.`nm_prodi` AS `nm_prodi` from (((`tb_mk_kurikulum` `m1` join `tb_mata_kuliah` `m2` on((`m1`.`kode_mk` = `m2`.`kode_mk`))) join `tb_kurikulum` `m3` on((`m1`.`id_kurikulum` = `m3`.`id_kurikulum`))) join `tb_prodi` `m4` on((`m3`.`kd_prodi` = `m4`.`id_prodi`))) where (`m1`.`status_upload` = 'N');

DROP TABLE IF EXISTS `v_sync_nilai`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_sync_nilai` AS select `m1`.`id_nilai` AS `id_nilai`,`m5`.`nim` AS `nim`,`m5`.`nm_mhs` AS `nm_mhs`,`m6`.`kode_mk` AS `kode_mk`,`m6`.`nm_mk` AS `nm_mk`,`m7`.`ta` AS `ta`,`m3`.`nm_kelas` AS `nm_kelas`,`m1`.`nilai_angka` AS `nilai_angka`,`m1`.`nilai_huruf` AS `nilai_huruf`,`m1`.`nilai_index` AS `nilai_index`,`m8`.`id_prodi` AS `id_prodi`,`m8`.`nm_prodi` AS `nm_prodi`,`m1`.`status_upload` AS `status_upload` from (((((((`tb_nilai` `m1` join `tb_mhs_data_krs` `m2` on((`m1`.`id_krs` = `m2`.`id_data_krs`))) join `tb_kelas_kul` `m3` on((`m2`.`id_kelas` = `m3`.`id_kelas`))) join `tb_mhs_krs` `m4` on((`m2`.`id_krs` = `m4`.`id_krs`))) join `tb_mhs` `m5` on((`m4`.`id_mhs` = `m5`.`nim`))) join `tb_mata_kuliah` `m6` on((`m3`.`id_matkul` = `m6`.`kode_mk`))) join `tb_kurikulum` `m7` on((`m3`.`id_kurikulum` = `m7`.`id_kurikulum`))) join `tb_prodi` `m8` on((`m3`.`id_prodi` = `m8`.`id_prodi`))) where (`m1`.`status_upload` = 'N');

DROP TABLE IF EXISTS `z_login_mhs`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `z_login_mhs` AS select `m1`.`id_user` AS `id_user`,`m2`.`kode_pembayaran` AS `kode_bayar`,`m1`.`username` AS `username`,`m1`.`password` AS `password`,`m1`.`level` AS `level`,`m1`.`val_periode` AS `val_periode`,`m2`.`status_cek` AS `status_cek`,`m3`.`nim` AS `nim`,`m3`.`nm_mhs` AS `nm_mhs`,`m3`.`status_mhs` AS `status_mhs`,`m4`.`ta` AS `ta`,`m5`.`id_prodi` AS `id_prodi` from ((((`login_mhs` `m1` join `tb_mhs_krs` `m2` on((`m1`.`id_krs` = `m2`.`id_krs`))) join `tb_mhs` `m3` on((`m2`.`id_mhs` = `m3`.`nim`))) join `tb_kurikulum` `m4` on((`m2`.`id_kurikulum` = `m4`.`id_kurikulum`))) join `tb_prodi` `m5` on((`m4`.`kd_prodi` = `m5`.`id_prodi`)));

DROP TABLE IF EXISTS `z_mhs_krs`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `z_mhs_krs` AS select `m1`.`id_krs` AS `id_krs`,`m1`.`id_mhs` AS `nim`,`m2`.`nm_mhs` AS `nama`,`m1`.`kode_pembayaran` AS `kode_pembayaran`,`m3`.`nm_kurikulum` AS `nm_kurikulum`,`m3`.`ta` AS `ta`,`m1`.`status_ambil` AS `status_ambil`,`m1`.`status_cek` AS `status_cek` from ((`tb_mhs_krs` `m1` join `tb_mhs` `m2` on((`m1`.`id_mhs` = `m2`.`nim`))) join `tb_kurikulum` `m3` on((`m1`.`id_kurikulum` = `m3`.`id_kurikulum`)));

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
