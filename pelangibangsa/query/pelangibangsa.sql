-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 15 Sep 2020 pada 12.15
-- Versi server: 10.4.14-MariaDB
-- Versi PHP: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pelangibangsa`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `agama`
--

CREATE TABLE `agama` (
  `id_agama` char(15) CHARACTER SET latin1 NOT NULL,
  `agama` varchar(25) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `agama`
--

INSERT INTO `agama` (`id_agama`, `agama`) VALUES
('agm01', 'islam'),
('agm02', 'kristen'),
('agm03', 'khatolik'),
('agm04', 'hindu'),
('agm05', 'budha'),
('agm06', 'konghucu');

-- --------------------------------------------------------

--
-- Struktur dari tabel `catatan`
--

CREATE TABLE `catatan` (
  `id_catatan` char(15) CHARACTER SET latin1 NOT NULL,
  `id_siswa` char(15) CHARACTER SET latin1 NOT NULL,
  `catatan` text CHARACTER SET latin1 NOT NULL,
  `id_kelas` char(15) CHARACTER SET latin1 NOT NULL,
  `id_semester` char(15) CHARACTER SET latin1 NOT NULL,
  `tgl_raport` varchar(225) CHARACTER SET latin1 NOT NULL,
  `tahun_ajaran_awal` varchar(225) CHARACTER SET latin1 NOT NULL,
  `tahun_ajaran_akhir` varchar(225) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `catatan`
--

INSERT INTO `catatan` (`id_catatan`, `id_siswa`, `catatan`, `id_kelas`, `id_semester`, `tgl_raport`, `tahun_ajaran_awal`, `tahun_ajaran_akhir`) VALUES
('CTN0001', 'SIS0000001', 'Jadilah orang yang sukses sejati dengan cara mengumpulkan kesuksesan dari hal-hal kecil', 'KLS01', 'SM01', '2020-08-11 04:50:42', '2021', '2022');

-- --------------------------------------------------------

--
-- Struktur dari tabel `data_level_semester`
--

CREATE TABLE `data_level_semester` (
  `id_level_semester` char(15) CHARACTER SET latin1 NOT NULL,
  `id_level_siswa` char(15) CHARACTER SET latin1 NOT NULL,
  `id_semester` char(15) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `data_level_semester`
--

INSERT INTO `data_level_semester` (`id_level_semester`, `id_level_siswa`, `id_semester`) VALUES
('DLS0000001', 'DLA0000001', 'SM01'),
('DLS0000003', 'DLA0000003', 'SM01'),
('DLS0000008', 'DLA0000002', 'SM01'),
('DLS0000009', 'DLA0000004', 'SM01'),
('DLS0000011', 'DLA0000005', 'SM01'),
('DLS0000013', 'DLA0000006', 'SM01'),
('DLS0000015', 'DLA0000007', 'SM01'),
('DLS0000018', 'DLA0000008', 'SM01'),
('DLS0000019', 'DLA0000009', 'SM01'),
('DLS0000005', 'DLA0000001', 'SM02'),
('DLS0000006', 'DLA0000002', 'SM02'),
('DLS0000007', 'DLA0000003', 'SM02'),
('DLS0000010', 'DLA0000004', 'SM02'),
('DLS0000012', 'DLA0000005', 'SM02'),
('DLS0000014', 'DLA0000006', 'SM02'),
('DLS0000016', 'DLA0000007', 'SM02'),
('DLS0000017', 'DLA0000008', 'SM02');

-- --------------------------------------------------------

--
-- Struktur dari tabel `data_level_siswa`
--

CREATE TABLE `data_level_siswa` (
  `id_level_siswa` char(15) CHARACTER SET latin1 NOT NULL,
  `id_siswa` char(15) CHARACTER SET latin1 NOT NULL,
  `id_kelas` char(15) CHARACTER SET latin1 NOT NULL,
  `id_user` char(15) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `data_level_siswa`
--

INSERT INTO `data_level_siswa` (`id_level_siswa`, `id_siswa`, `id_kelas`, `id_user`) VALUES
('DLA0000001', 'SIS0000001', 'KLS01', 'USR0001'),
('DLA0000002', 'SIS0000002', 'KLS02', 'USR0001'),
('DLA0000003', 'SIS0000003', 'KLS03', 'USR0001'),
('DLA0000004', 'SIS0000005', 'KLS04', 'USR0001'),
('DLA0000005', 'SIS0000006', 'KLS05', 'USR0001'),
('DLA0000006', 'SIS0000007', 'KLS06', 'USR0001'),
('DLA0000007', 'SIS0000008', 'KLS01', 'USR0001'),
('DLA0000008', 'SIS0000009', 'KLS01', 'USR0001'),
('DLA0000009', 'SIS0000027', 'KLS01', 'USR0001'),
('DLA0000010', 'SIS0000028', 'KLS01', 'USR0001');

-- --------------------------------------------------------

--
-- Struktur dari tabel `data_sekolah`
--

CREATE TABLE `data_sekolah` (
  `nama_sekolah` varchar(20) NOT NULL,
  `npsn` char(15) NOT NULL,
  `alamat_sekolah` varchar(20) NOT NULL,
  `kode_pos` char(6) NOT NULL,
  `kelurahan_desa` varchar(20) NOT NULL,
  `kecamatan` varchar(20) NOT NULL,
  `kabupaten_kota` varchar(20) NOT NULL,
  `provinsi` varchar(20) NOT NULL,
  `telp` char(15) NOT NULL,
  `website` varchar(30) NOT NULL,
  `kepala_sekolah` varchar(30) NOT NULL,
  `semester` varchar(20) NOT NULL,
  `tahun_pelajaran` varchar(20) NOT NULL,
  `guru_kelas_wali` varchar(30) NOT NULL,
  `nuptk` varchar(20) NOT NULL,
  `tmpt_wkt_pembagian_raport` varchar(225) NOT NULL,
  `email` varchar(30) NOT NULL,
  `id_sekolah` char(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `data_sekolah`
--

INSERT INTO `data_sekolah` (`nama_sekolah`, `npsn`, `alamat_sekolah`, `kode_pos`, `kelurahan_desa`, `kecamatan`, `kabupaten_kota`, `provinsi`, `telp`, `website`, `kepala_sekolah`, `semester`, `tahun_pelajaran`, `guru_kelas_wali`, `nuptk`, `tmpt_wkt_pembagian_raport`, `email`, `id_sekolah`) VALUES
('SDS PELANGI BANGSA', '69944303', 'Jl. Cabe Raya No.81', '15418', 'Pondok Cabe Udik', 'Kec. Pamulang', 'Kota Tangerang Selat', 'Prov. Banten', '-', 'pelangibangsa.sch.id', ' Rina Setyowati', 'Semester 1', '2020-2021', '-', '-', '-', 'pelangibangsa@gmai.com', 'SKH01');

-- --------------------------------------------------------

--
-- Struktur dari tabel `data_siswa`
--

CREATE TABLE `data_siswa` (
  `id_siswa` char(15) CHARACTER SET latin1 NOT NULL,
  `nisn` char(15) CHARACTER SET latin1 NOT NULL,
  `nis` char(15) CHARACTER SET latin1 NOT NULL,
  `nama_siswa` varchar(100) CHARACTER SET latin1 NOT NULL,
  `jk` varchar(10) CHARACTER SET latin1 NOT NULL,
  `tempat_lahir` varchar(50) CHARACTER SET latin1 NOT NULL,
  `tanggal_lahir` varchar(225) CHARACTER SET latin1 NOT NULL,
  `id_agama` char(15) CHARACTER SET latin1 NOT NULL,
  `pend_sebelumnya` varchar(225) CHARACTER SET latin1 NOT NULL,
  `alamat_serta_didik` varchar(225) CHARACTER SET latin1 NOT NULL,
  `nama_ayah` varchar(30) CHARACTER SET latin1 NOT NULL,
  `nama_ibu` varchar(30) CHARACTER SET latin1 NOT NULL,
  `pekerjaan_ayah` varchar(30) CHARACTER SET latin1 NOT NULL,
  `pekerjaan_ibu` varchar(30) CHARACTER SET latin1 NOT NULL,
  `desa_kelurahan` varchar(30) CHARACTER SET latin1 NOT NULL,
  `kecamatan` varchar(30) CHARACTER SET latin1 NOT NULL,
  `kabupaten_kota` varchar(30) CHARACTER SET latin1 NOT NULL,
  `provinsi` varchar(30) CHARACTER SET latin1 NOT NULL,
  `no_telp_hp` char(13) CHARACTER SET latin1 NOT NULL,
  `nama_wali` varchar(30) CHARACTER SET latin1 NOT NULL,
  `pekerjaan_wali` varchar(30) CHARACTER SET latin1 NOT NULL,
  `alamat_wali` varchar(225) CHARACTER SET latin1 NOT NULL,
  `no_telp_hp_wali` char(13) CHARACTER SET latin1 NOT NULL,
  `tgl_masuk_siswa` varchar(225) CHARACTER SET latin1 NOT NULL,
  `tahun_ajaran_awal` varchar(225) CHARACTER SET latin1 NOT NULL,
  `tahun_ajaran_akhir` varchar(225) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `data_siswa`
--

INSERT INTO `data_siswa` (`id_siswa`, `nisn`, `nis`, `nama_siswa`, `jk`, `tempat_lahir`, `tanggal_lahir`, `id_agama`, `pend_sebelumnya`, `alamat_serta_didik`, `nama_ayah`, `nama_ibu`, `pekerjaan_ayah`, `pekerjaan_ibu`, `desa_kelurahan`, `kecamatan`, `kabupaten_kota`, `provinsi`, `no_telp_hp`, `nama_wali`, `pekerjaan_wali`, `alamat_wali`, `no_telp_hp_wali`, `tgl_masuk_siswa`, `tahun_ajaran_awal`, `tahun_ajaran_akhir`) VALUES
('SIS0000001', '-', '-', 'caroline benneta irawan', 'P', 'Tangerang Selatan', '2014-10-29', 'agm03', 'TK', 'Pondok Benda Residence Blok B1 no 1', 'Denny Purna Irwan', 'Inneke Octaviana ', 'Karyawan Swasta ', 'Karyawan Swasta ', 'Pondok benda', 'pamulang ', 'Tangerang Selatan ', 'Banten ', '085886847286', '-', '-', '-', '-', '2020-04-19 11:14:37', '2020', '2021'),
('SIS0000002', '00022020', '00022020', 'Siswa 2', 'L', 'Lampung', '2020-04-01', 'agm01', 'TK', 'Lampung', '-', '-', 'Pedagang', 'Pedagang', 'Lampung', 'Lampung', 'Lampung', 'Sumatra Selatan', '-', '-', '-', '-', '-', '2020-04-19 11:23:37', '2020', '2021'),
('SIS0000003', '00032020', '00032020', 'Darren Luis Cardo', 'L', 'Jakarta', '2020-04-20', 'agm03', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '2020-04-19 12:20:29', '2020', '2021'),
('SIS0000004', '00042020', '00042020', 'Nadim Maskarim', 'L', 'Jakarta', '2020-04-01', 'agm01', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '2020-04-19 12:23:14', '2019', '2020'),
('SIS0000005', '00022022', '00022022', 'Siswa 4', 'P', 'Pamulang', '2013-07-23', 'agm01', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '2020-08-07 03:04:46', '2020', '2021'),
('SIS0000006', '00022023', '00022023', 'Siswa 5', 'L', 'Jakarta', '2020-07-01', 'agm01', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '2020-08-07 03:53:07', '2020', '2021'),
('SIS0000007', '00022024', '00022024', 'Arip hidayat', 'L', 'Tangerang', '2020-06-01', 'agm02', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '2020-08-07 03:53:56', '2020', '2021'),
('SIS0000008', '-', '-', 'Debora Naria Simamora ', 'P', 'Depok ', '2014-02-01', 'agm02', 'TK ', 'Telaga Golf Sawangan Belanda Blok E 10 no 5 ', 'Manatap Simamora ', 'Evi Larona Ginting ', '-', '-', 'sawangan ', 'depok ', 'depok ', 'Jawa Barat ', '081384904906', '-', '-', '-', '-', '2020-08-13 05:10:01', '2020', '2021'),
('SIS0000009', '-', '-', 'Kenzo Aditya Pratama ', 'L', 'ngawi ', '2013-06-08', 'agm01', 'TK ', 'Jl. Cabe Raya, Komplek Apper house  Blok D 8 ', 'Rida Susanto ', 'Sulis ', '-', '-', 'pondok cabe ', 'pamulang ', 'Tangerang Selatan ', 'Banten ', '081284161908', '-', '-', '-', '-', '2020-08-18 08:49:41', '2020', '2021'),
('SIS0000010', '-', '-', 'Levin Ramadhan Mulyadi ', 'L', 'tangerang ', '2014-07-22', 'agm01', 'TK ', 'Jl. Kali suren Parades Tajur Halang Bogor ', 'Mulyadi ', 'Nur Hayati', 'Karyawan Swasta ', 'Karyawan Swasta ', '-', '-', 'bogor ', 'Jawa Barat ', '085888705615', '-', '-', '-', '-', '2020-08-26 01:39:14', '2020', '2021'),
('SIS0000011', '-', '-', 'Levin Ramadhan Mulyadi', 'L', 'tangerang', '2014-07-22', 'agm01', 'TK ', 'Jl. Kali suren Parades Tajur Halang Bogor ', 'Mulyadi ', 'Nur Hayati', 'Karyawan Swasta ', 'Karyawan Swasta ', '-', '-', '-', 'Jawa Barat ', '085888705615', '-', '-', '-', '-', '2020-08-26 01:42:07', '2020', '2021'),
('SIS0000012', '-', '-', 'Levin Ramadhan Mulyadi', 'L', 'tangerang', '2014-07-22', 'agm01', 'TK ', 'Jl. Kali suren Parades Tajur Halang Bogor ', 'Mulyadi ', 'Nur Hayati', 'Karyawan Swasta ', 'Karyawan Swasta ', '-', '-', 'bogor ', 'Jawa Barat ', '085888705615', '-', '-', '-', '-', '2020-08-26 01:47:43', '2020', ''),
('SIS0000013', '-', '-', 'Latisha aquina zega', 'P', 'Tangerang Selat', '2014-11-01', 'agm02', 'TK ', 'Perumahan Permata Mansion cluster jade blok JE 2 no 12 a', 'Yasman zega', 'stefanie halimjah ', 'Karyawan Swasta ', 'Karyawan Swasta ', '-', 'pamulang ', 'tangerang selatan ', 'Banten ', '-', '-', '-', '-', '-', '2020-08-26 01:51:53', '2020', '2021'),
('SIS0000014', '-', '-', 'muhammad fadhil ahrari ', 'L', 'tangerang selat', '2013-03-17', 'agm01', 'TK ', 'Trevista Residence ciputat blok B 6 no 9 ', 'Dwi urip wardoyo ', 'shinta dwi rahmaningsih ', 'Dosen ', 'Karyawan Swasta ', 'cipayung ', 'ciputat', 'tangerang selatan ', 'Banten ', '085886936488', '-', '-', '-', '-', '2020-08-26 01:56:01', '2020 ', '2021'),
('SIS0000015', '-', '-', 'Niputu salsabila Nadhifa', 'P', 'sukabumi ', '2013-11-27', 'agm01', 'TK ', 'Vila Inti Persada Blok C 2 NO 29 Pamulang Timur ', 'i putu gede Suwartana ', 'lessi sawitri', '-', 'Karyawan Swasta ', 'amulang timur', 'pamulang ', 'tangerang selatan', 'Banten ', '087879253954', '-', '-', '-', '-', '2020-08-26 02:00:44', '2020', '2021'),
('SIS0000016', '-', '-', 'Prada Bintang amaru ', 'L', 'tangerang selat', '2014-02-07', 'agm02', 'TK ', 'Vila Inti Persada cluster the regente jl bromo blok B5 no 11', 'Hendry utomo ', 'Natalia Deasy damayanti ', 'seniman ', 'guru', 'pamulang timur', 'pamulang', 'tangerang selatan', 'Banten ', '087808755311', '-', '-', '-', '-', '2020-08-26 02:05:11', '2020', '2021'),
('SIS0000017', '-', '-', 'Raphael tristan manurung', 'L', 'pekanbaru ', '2013-12-11', 'agm02', 'TK ', 'Jl Cabe 3 NO 49 Pondok Cabe Udik ', 'jabes ys Manurung ', 'risda ogesta gultong ', '-', '-', 'pondok cabe udi', 'pamulang', 'tangerang selatan', 'Banten ', '085280399308', '-', '-', '-', '-', '2020-08-26 02:08:48', '2020', '2021'),
('SIS0000018', '-', '-', 'shafiq iman prasetia ', 'L', 'tangerang selat', '2013-08-29', 'agm01', 'TK ', 'komplek wisma mas blok A 5 no 19 rt 5 rw 10 cinangka ', 'budi prasetyo ', 'tia afriani ', '-', '-', 'cinangka ', 'sawangan', 'depok ', 'Jawa Barat ', '081310367652', '-', '-', '-', '-', '2020-08-26 02:11:45', '2020', '2021'),
('SIS0000019', '-', '-', 'syalomita anastasya winarto', 'P', 'tangerang', '2014-11-06', 'agm02', 'TK ', 'jl talas 3 no 157 pondok cabe ilir tangsel ', 'kevin winarto ', 'debby tjandra', '-', '-', 'ponodk cabe ilir', 'pondok cabe ', 'tangerang selatan', 'Banten ', '085899990991', '-', '-', '-', '-', '2020-08-26 02:14:58', '2020', '2021'),
('SIS0000020', '-', '-', 'sashi kamidia abiraputri', 'P', 'tangerang', '2012-08-29', 'agm01', 'TK ', 'sawangan hill blok b 7', 'bintang surya ibnu triputra ', 'irash wahyuni ', '-', '-', 'pondok cabe ', 'pamulang', 'tangerang selatan', 'Banten ', '08999991828', '-', '-', '-', '-', '2020-08-26 02:18:15', '2020', '2021'),
('SIS0000021', '-', '-', 'tamoro davin siahaan ', 'L', 'jakarta ', '2013-12-26', 'agm02', 'TK ', 'perumahan bumi pelita kencana blok b 4 no 14', 'maver untung siahaan ', 'sexsio rauli simajuntak', 'TNI AD', 'ibu rumaha', '', '', '', '', '', '', '', '', '', '2020-08-26 02:20:36', '', ''),
('SIS0000022', '3122414712', '1920.6.048', 'Muhammad keeand rizky mahulett', 'L', 'jakarta ', '2012-08-24', 'agm01', 'TK ', 'Jl gelagah dalam kirai townhouse  no 2', 'frengky .M ', 'Hesti Chaeriah ', 'wirausaha', 'ibu rumah tangga', 'pisangan', 'ciputat timur ', 'Tangerang Selatan ', 'Banten ', '08170041953', '-', '-', '-', '-', '2020-08-27 02:45:00', '2020', '2021'),
('SIS0000023', '3125127425', '1920.6.046', 'hasya aqilah ', 'P', 'jakarta', '2012-05-09', 'agm01', 'TK ', '-', 'putra dev', 'adinda bianca', 'wirausaha', 'ibu rumah tangga', '-', '-', '-', '-', '-', '-', '-', '-', '-', '2020-08-27 02:49:29', '2020', '2021'),
('SIS0000024', '0125112382', '1920.6.049', 'cathrine june aritonang', 'P', 'depok', '2012-06-19', 'agm02', 'TK ', 'komplek citralake blok e4/05 kedaung bojongsari depok ', 'Joni.P. Aritonang', 'Agustina Margaret Hutabarat', 'wirausaha', 'ibu rumah tangga', 'kedaung', 'bojongsari', 'depok ', 'Jawa Barat ', '081314567213', '-', '-', '-', '-', '2020-08-27 02:55:18', '2020', '2021'),
('SIS0000025', '0137792538', '1920.6.50', 'Michelle Adelheid wellykin', 'P', 'depok', '2013-08-31', 'agm03', 'TK ', 'Jl. Sinargih IV Perumahan Hunian tanpa nama blok B34 RT 01 RW 08', 'Meikel Wellykin', 'Restadyan Maryana ', 'Karyawan ', 'ibu rumah tangga', 'cinangka ', 'sawangan', 'depok ', 'Jawa Barat ', '081219193305', '-', '-', '-', '-', '2020-08-27 03:02:28', '2020', '2021'),
('SIS0000026', '0123376782', '1920.6.051', 'Keanu Aflah Shahzad Djaelani ', 'L', 'tangerang selat', '2012-08-27', 'agm01', 'TK ', 'Jl Jeruk Nipis I  Blok F 13/18 Pamulang Estate RT 04 RW 02 ', 'Sareh Wiyono', 'Siti Nurmala Sari ', 'wirausaha', 'ibu rumah tangga', '-', 'pamulang ', 'tangerang selatan', 'Banten ', '-', '-', '-', '-', '-', '2020-08-27 03:09:54', '2020', '2021'),
('SIS0000027', '-', '-', 'siswa baru', 'L', 'pamulang', '2020-08-30', 'agm01', '-', '-', '--', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '2020-08-30 09:03:15', '2020', '2021'),
('SIS0000028', '-', '-', 'siswa baru 2', 'L', 'jakarta', '2020-08-30', 'agm01', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '2020-08-30 09:03:57', '2020', '2021');

--
-- Trigger `data_siswa`
--
DELIMITER $$
CREATE TRIGGER `rubah_agm_siswa` AFTER UPDATE ON `data_siswa` FOR EACH ROW BEGIN
	delete from nilai_agamakd_ki3 where id_siswa = NEW.id_siswa;
	DELETE FROM nilai_agamakd_ki4 WHERE id_siswa = NEW.id_siswa;
    END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `data_siswa_kelas_semester`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `data_siswa_kelas_semester` (
`id_siswa` char(15)
,`nisn` char(15)
,`nis` char(15)
,`nama_siswa` varchar(100)
,`id_agama` char(15)
,`id_kelas` char(15)
,`id_level_siswa` char(15)
,`kelas` varchar(20)
,`id_semester` char(15)
,`semester` varchar(20)
);

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `data_siswa_kelas_semester_2`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `data_siswa_kelas_semester_2` (
`id_siswa` char(15)
,`nisn` char(15)
,`nis` char(15)
,`nama_siswa` varchar(100)
,`id_agama` char(15)
,`id_kelas` char(15)
,`id_level_siswa` char(15)
,`kelas` varchar(20)
,`id_semester` char(15)
,`id_level_semester` char(15)
,`semester` varchar(20)
);

-- --------------------------------------------------------

--
-- Struktur dari tabel `data_siswa_keluar`
--

CREATE TABLE `data_siswa_keluar` (
  `id_siswa_keluar` char(15) CHARACTER SET latin1 NOT NULL,
  `tgl_masuk_siswa` varchar(225) CHARACTER SET latin1 NOT NULL,
  `tgl_keluar_siswa` varchar(225) CHARACTER SET latin1 NOT NULL,
  `id_kelas` char(15) CHARACTER SET latin1 NOT NULL,
  `id_semester` char(15) CHARACTER SET latin1 NOT NULL,
  `id_siswa` char(15) CHARACTER SET latin1 NOT NULL,
  `nisn` char(15) CHARACTER SET latin1 NOT NULL,
  `nis` char(15) CHARACTER SET latin1 NOT NULL,
  `nama_siswa` varchar(225) CHARACTER SET latin1 NOT NULL,
  `jk` varchar(10) CHARACTER SET latin1 NOT NULL,
  `tempat_lahir` varchar(15) CHARACTER SET latin1 NOT NULL,
  `tanggal_lahir` varchar(225) CHARACTER SET latin1 NOT NULL,
  `id_agama` char(15) CHARACTER SET latin1 NOT NULL,
  `pend_sebelumnya` varchar(225) CHARACTER SET latin1 NOT NULL,
  `alamat_serta_didik` varchar(225) CHARACTER SET latin1 NOT NULL,
  `nama_ayah` varchar(30) CHARACTER SET latin1 NOT NULL,
  `nama_ibu` varchar(30) CHARACTER SET latin1 NOT NULL,
  `pekerjaan_ayah` varchar(30) CHARACTER SET latin1 NOT NULL,
  `pekerjaan_ibu` varchar(30) CHARACTER SET latin1 NOT NULL,
  `jalan` varchar(30) CHARACTER SET latin1 NOT NULL,
  `desa_kelurahan` varchar(30) CHARACTER SET latin1 NOT NULL,
  `kecamatan` varchar(30) CHARACTER SET latin1 NOT NULL,
  `kabupaten_kota` varchar(30) CHARACTER SET latin1 NOT NULL,
  `provinsi` varchar(30) CHARACTER SET latin1 NOT NULL,
  `no_telp_hp` char(13) CHARACTER SET latin1 NOT NULL,
  `nama_wali` varchar(30) CHARACTER SET latin1 NOT NULL,
  `pekerjaan_wali` varchar(30) CHARACTER SET latin1 NOT NULL,
  `alamat_wali` varchar(225) CHARACTER SET latin1 NOT NULL,
  `no_telp_hp_wali` char(13) CHARACTER SET latin1 NOT NULL,
  `tahun_ajaran_awal` varchar(225) CHARACTER SET latin1 NOT NULL,
  `tahun_ajaran_akhir` varchar(225) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `data_siswa_keluar`
--

INSERT INTO `data_siswa_keluar` (`id_siswa_keluar`, `tgl_masuk_siswa`, `tgl_keluar_siswa`, `id_kelas`, `id_semester`, `id_siswa`, `nisn`, `nis`, `nama_siswa`, `jk`, `tempat_lahir`, `tanggal_lahir`, `id_agama`, `pend_sebelumnya`, `alamat_serta_didik`, `nama_ayah`, `nama_ibu`, `pekerjaan_ayah`, `pekerjaan_ibu`, `jalan`, `desa_kelurahan`, `kecamatan`, `kabupaten_kota`, `provinsi`, `no_telp_hp`, `nama_wali`, `pekerjaan_wali`, `alamat_wali`, `no_telp_hp_wali`, `tahun_ajaran_awal`, `tahun_ajaran_akhir`) VALUES
('KEL0000001', '2020-04-19 12:23:14', '2020-02-27 09:53:14', 'KLS01', 'SM01', 'Darren Luis Car', '00042020', '00042020', 'Nadim Maskarim', 'L', 'Jakarta', '2020-04-01', 'agm01', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '2019', '2020');

-- --------------------------------------------------------

--
-- Struktur dari tabel `data_siswa_kenaikan`
--

CREATE TABLE `data_siswa_kenaikan` (
  `id_kenaikan` char(15) CHARACTER SET latin1 NOT NULL,
  `id_siswa` char(15) CHARACTER SET latin1 NOT NULL,
  `id_kelas` char(15) CHARACTER SET latin1 NOT NULL,
  `id_kelas_sebelumnya` char(15) CHARACTER SET latin1 NOT NULL,
  `tanggal_kenaikan` varchar(225) CHARACTER SET latin1 NOT NULL,
  `tahun_ajaran_sebelumnya` varchar(225) CHARACTER SET latin1 NOT NULL,
  `tahun_ajaran_awal` varchar(225) CHARACTER SET latin1 NOT NULL,
  `tahun_ajaran_akhir` varchar(225) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `data_siswa_kenaikan`
--

INSERT INTO `data_siswa_kenaikan` (`id_kenaikan`, `id_siswa`, `id_kelas`, `id_kelas_sebelumnya`, `tanggal_kenaikan`, `tahun_ajaran_sebelumnya`, `tahun_ajaran_awal`, `tahun_ajaran_akhir`) VALUES
('NXT000001', 'SIS0000001', 'KLS02', 'KLS01', '2020-08-03 10:42:05', '2019-2020', '2020', '2021'),
('NXT000002', 'SIS0000001', 'KLS01', 'KLS02', '2020-08-03 02:13:32', '2020-2021', '2021', '2022'),
('NXT000003', 'SIS0000002', 'KLS02', 'KLS01', '2020-08-05 10:02:17', '2019-2020', '2020', '2021'),
('NXT000004', 'SIS0000003', 'KLS03', 'KLS01', '2020-08-07 03:00:56', '2019-2020', '2020', '2021'),
('NXT000005', 'SIS0000002', 'KLS01', 'KLS02', '2020-08-26 05:05:05', '2020-2021', '2021', '2022'),
('NXT000006', 'SIS0000002', 'KLS02', 'KLS01', '2020-08-26 05:10:35', '2021-2022', '2022', '2023');

-- --------------------------------------------------------

--
-- Struktur dari tabel `download`
--

CREATE TABLE `download` (
  `id_download` char(15) NOT NULL,
  `deskripsi` varchar(225) NOT NULL,
  `file_name` varchar(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `download`
--

INSERT INTO `download` (`id_download`, `deskripsi`, `file_name`) VALUES
('ID01', 'Panduan penilaian raport', 'Panduan-penilaian-raport.pdf'),
('ID02', 'Panduan raport', 'Panduan-raport.pdf');

-- --------------------------------------------------------

--
-- Struktur dari tabel `ekstrakurikuler`
--

CREATE TABLE `ekstrakurikuler` (
  `id_ekstra` char(15) CHARACTER SET latin1 NOT NULL,
  `no` varchar(6) CHARACTER SET latin1 NOT NULL,
  `kegiatan` varchar(35) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `ekstrakurikuler`
--

INSERT INTO `ekstrakurikuler` (`id_ekstra`, `no`, `kegiatan`) VALUES
('EKS001', '1', 'Pramuka'),
('EKS002', '2', 'Tenis Meja'),
('EKS003', '3', 'Bulu Tangkis'),
('EKS004', '4', 'Catur'),
('EKS005', '5', 'Basket'),
('EKS006', '6', 'Sepak Bola'),
('EKS007', '7', 'Karate'),
('EKS008', '8', 'Lainnya'),
('EKS009', '9', 'Seni Vocal'),
('EKS010', '10', 'DrumBand'),
('EKS011', '11', 'Seni Lukis'),
('EKS012', '12', 'Seni Tari'),
('EKS013', '13', 'Lainnya'),
('EKS014', '14', 'Islam'),
('EKS015', '15', 'Kristen'),
('EKS016', '16', 'Katolik'),
('EKS017', '17', 'Hindu'),
('EKS018', '18', 'Budha'),
('EKS019', '19', 'Konghucu'),
('EKS020', '20', 'Komputer'),
('EKS021', '21', 'Bahasa Inggris'),
('EKS022', '22', 'Lainnya'),
('EKS023', '23', 'Science'),
('EKS024', '24', 'Ngaji');

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `gabunganki3_ki4`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `gabunganki3_ki4` (
`id_siswa` char(15)
,`nama_siswa` varchar(100)
,`id_kelas` char(15)
,`id_semester` char(15)
,`tahun_ajaran_awal` varchar(225)
,`tahun_ajaran_akhir` varchar(225)
,`rata_rata_ki3` decimal(37,0)
,`rata_rata_ki4` decimal(37,0)
,`jumlah` decimal(38,0)
,`rata_rata` decimal(39,0)
);

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `hitung_kd`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `hitung_kd` (
`id_raportkd` char(15)
,`id_siswa` char(15)
,`id_mapel` char(15)
,`id_kelas` char(15)
,`id_semester` char(15)
,`id_kd` char(15)
,`nomor_kd` char(15)
,`deskripsi` varchar(225)
,`tugas1` int(15)
,`tugas2` int(15)
,`tugas3` int(15)
,`tugas4` int(15)
,`tugas5` int(15)
,`ph1` int(15)
,`ph2` int(15)
,`ph3` int(15)
,`ph4` int(15)
,`pts` int(15)
,`pas` int(15)
,`nilai_kd` decimal(24,0)
);

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `hitung_kdagm_ki3`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `hitung_kdagm_ki3` (
`id_raportkd` char(15)
,`id_siswa` char(15)
,`id_mapel` char(15)
,`id_kelas` char(15)
,`id_semester` char(15)
,`id_kd` char(15)
,`nomor_kd` char(15)
,`deskripsi` varchar(225)
,`tugas1` int(15)
,`tugas2` int(15)
,`tugas3` int(15)
,`tugas4` int(15)
,`tugas5` int(15)
,`ph1` int(15)
,`ph2` int(15)
,`ph3` int(15)
,`ph4` int(15)
,`pts` int(15)
,`pas` int(15)
,`nilai_kd` decimal(24,0)
);

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `hitung_kdagm_ki4`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `hitung_kdagm_ki4` (
`id_raportkd` char(15)
,`id_siswa` char(15)
,`id_mapel` char(15)
,`id_kelas` char(15)
,`id_semester` char(15)
,`id_kd` char(15)
,`nomor_kd` char(15)
,`deskripsi` varchar(225)
,`tugas1` int(15)
,`tugas2` int(15)
,`tugas3` int(15)
,`tugas4` int(15)
,`tugas5` int(15)
,`ph1` int(15)
,`ph2` int(15)
,`ph3` int(15)
,`ph4` int(15)
,`pts` int(15)
,`pas` int(15)
,`nilai_kd` decimal(24,0)
);

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `hitung_kdki4`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `hitung_kdki4` (
`id_raportkd` char(15)
,`id_siswa` char(15)
,`id_mapel` char(15)
,`id_kelas` char(15)
,`id_semester` char(15)
,`id_kd` char(15)
,`nomor_kd` char(15)
,`deskripsi` varchar(225)
,`tugas1` char(15)
,`tugas2` char(15)
,`tugas3` char(15)
,`tugas4` char(15)
,`tugas5` char(15)
,`ph1` char(15)
,`ph2` char(15)
,`ph3` char(15)
,`ph4` char(15)
,`pts` char(15)
,`pas` char(15)
,`nilai_kd` double(17,0)
);

-- --------------------------------------------------------

--
-- Struktur dari tabel `jenis_kelamin`
--

CREATE TABLE `jenis_kelamin` (
  `id_kelamin` int(15) NOT NULL,
  `kelamin` varchar(20) CHARACTER SET latin1 NOT NULL,
  `singkatan` varchar(10) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `jenis_kelamin`
--

INSERT INTO `jenis_kelamin` (`id_kelamin`, `kelamin`, `singkatan`) VALUES
(1, 'Laki-laki', 'L'),
(2, 'Perempuan', 'P');

-- --------------------------------------------------------

--
-- Struktur dari tabel `jurnal_sosial`
--

CREATE TABLE `jurnal_sosial` (
  `id_jurnal_so` char(15) CHARACTER SET latin1 NOT NULL,
  `tanggal` datetime NOT NULL,
  `nama_siswa` varchar(225) CHARACTER SET latin1 NOT NULL,
  `ki` int(2) NOT NULL,
  `catatan_perilaku` varchar(225) CHARACTER SET latin1 NOT NULL,
  `butir_sikap` varchar(225) CHARACTER SET latin1 NOT NULL,
  `tindak_lanjut` varchar(225) CHARACTER SET latin1 NOT NULL,
  `sb` varchar(15) CHARACTER SET latin1 NOT NULL,
  `pb` varchar(15) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `jurnal_sosial`
--

INSERT INTO `jurnal_sosial` (`id_jurnal_so`, `tanggal`, `nama_siswa`, `ki`, `catatan_perilaku`, `butir_sikap`, `tindak_lanjut`, `sb`, `pb`) VALUES
('SOS001', '2020-03-04 13:57:10', 'Siswa 10', 1, 'Sangat baik', 'Disiplin', 'Baik', '1', '0');

-- --------------------------------------------------------

--
-- Struktur dari tabel `jurnal_spiritual`
--

CREATE TABLE `jurnal_spiritual` (
  `id_jurnal_sp` char(15) CHARACTER SET latin1 NOT NULL,
  `tanggal` datetime NOT NULL,
  `nama_siswa` varchar(225) CHARACTER SET latin1 NOT NULL,
  `ki` varchar(25) CHARACTER SET latin1 NOT NULL,
  `catatan_perilaku` varchar(225) CHARACTER SET latin1 NOT NULL,
  `butir_sikap` varchar(225) CHARACTER SET latin1 NOT NULL,
  `tindak_lanjut` varchar(225) CHARACTER SET latin1 NOT NULL,
  `sb` varchar(15) CHARACTER SET latin1 NOT NULL,
  `pb` varchar(15) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `jurnal_spiritual`
--

INSERT INTO `jurnal_spiritual` (`id_jurnal_sp`, `tanggal`, `nama_siswa`, `ki`, `catatan_perilaku`, `butir_sikap`, `tindak_lanjut`, `sb`, `pb`) VALUES
('SPR002', '2020-03-04 13:05:10', 'Siswa 11', '1', 'Sungguh baik', '', 'Baik', '1', '0');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kd_agama_ki3`
--

CREATE TABLE `kd_agama_ki3` (
  `id_kd` char(15) CHARACTER SET latin1 NOT NULL,
  `nom` varchar(20) CHARACTER SET latin1 NOT NULL,
  `nomor_kd` varchar(20) CHARACTER SET latin1 NOT NULL,
  `deskripsi` varchar(225) CHARACTER SET latin1 NOT NULL,
  `id_mapel` char(15) CHARACTER SET latin1 NOT NULL,
  `id_agama` char(15) CHARACTER SET latin1 NOT NULL,
  `id_kelas` char(15) CHARACTER SET latin1 NOT NULL,
  `id_semester` char(15) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `kd_agama_ki3`
--

INSERT INTO `kd_agama_ki3` (`id_kd`, `nom`, `nomor_kd`, `deskripsi`, `id_mapel`, `id_agama`, `id_kelas`, `id_semester`) VALUES
('KDA0000000001', '1', '3.1', 'mengetahui huruf-huruf hijaiyyah dan harakatnya secara lengkap', 'MPL01', 'agm01', 'KLS01', 'SM01'),
('KDA0000000002', '2', '3.2', 'memahami pesan-pesan pokok Q.S. al-Fatihah dan Q.S. al-Ikhlas', 'MPL01', 'agm01', 'KLS01', 'SM01'),
('KDA0000000003', '3', '3.3', 'memahami adanya Allah Swt. yang Maha Pengasih dan Maha Penyayang', 'MPL01', 'agm01', 'KLS01', 'SM01'),
('KDA0000000004', '4', '3.4', 'memahami keesaan Allah Swt. berdasarkan pengamatan terhadap dirinya dan makhluk ciptaan-Nya yang dijumpai di sekitar rumah dan sekolah', 'MPL01', 'agm01', 'KLS01', 'SM01'),
('KDA0000000005', '5', '3.5', 'memahami makna al-Asmau al-Husna: ar-Rahman, ar-Rahim, dan al-Malik', 'MPL01', 'agm01', 'KLS01', 'SM01'),
('KDA0000000006', '6', '3.6', ' memahami makna dua kalimat syahadat', 'MPL01', 'agm01', 'KLS01', 'SM01'),
('KDA0000000007', '7', '3.7', ' memahami makna doa sebelum dan sesudah belajar', 'MPL01', 'agm01', 'KLS01', 'SM01'),
('KDA0000000008', '8', '3.8', 'memahami perilaku hormat dan patuh kepada orangtua dan guru', 'MPL01', 'agm01', 'KLS01', 'SM01'),
('KDA0000000009', '9', '3.9', 'memahami berkata yang baik, sopan, dan santun', 'MPL01', 'agm01', 'KLS01', 'SM01'),
('KDA0000000010', '10', '3.10', 'memahami makna bersyukur, pemaaf, jujur, dan percaya diri', 'MPL01', 'agm01', 'KLS01', 'SM01'),
('KDA0000000011', '11', '3.11', 'memahami tata cara bersuci', 'MPL01', 'agm01', 'KLS01', 'SM01'),
('KDA0000000012', '12', '3.12', 'memahami salat dan kegiatan agama yang dianutnya di sekitar rumahnya melalui pengamatan', 'MPL01', 'agm01', 'KLS01', 'SM01'),
('KDA0000000013', '13', '3.13', 'memahami kisah keteladanan Nabi Adam a.s', 'MPL01', 'agm01', 'KLS01', 'SM01'),
('KDA0000000014', '14', '3.14', 'memahami kisah keteladanan Nabi Idris a.s. ', 'MPL01', 'agm01', 'KLS01', 'SM01'),
('KDA0000000015', '15', '3.15', 'memahami kisah keteladanan Nabi Nuh a.s. ', 'MPL01', 'agm01', 'KLS01', 'SM01'),
('KDA0000000016', '16', '3.16', 'memahami kisah keteladanan Nabi Hud a.s. ', 'MPL01', 'agm01', 'KLS01', 'SM01'),
('KDA0000000017', '17', '3.17', 'memahami kisah keteladanan Nabi Muhammad saw. ', 'MPL01', 'agm01', 'KLS01', 'SM01'),
('KDA0000000018', '1', '3.1', 'mengenal dirinya sebagai ciptaan Allah', 'MPL01', 'agm02', 'KLS01', 'SM01'),
('KDA0000000019', '2', '3.2', 'memahami beragam kegunaan anggota tubuhnya sebagai ciptaan Allah', 'MPL01', 'agm02', 'KLS01', 'SM01'),
('KDA0000000020', '3', '3.3', 'mengenal cara mengasihi keluarga dan teman', 'MPL01', 'agm02', 'KLS01', 'SM01'),
('KDA0000000021', '4', '3.4', 'memahami contoh sikap bersyukur dan bertanggung jawab dalam memelihara alam ciptaan Allah', 'MPL01', 'agm02', 'KLS01', 'SM01'),
('KDA0000000022', '1', '3.1', 'mengenal dirinya yang khas sebagai anugerah Allah', 'MPL01', 'agm03', 'KLS01', 'SM01'),
('KDA0000000023', '2', '3.2', 'mengenal anggota tubuh yang dimilikinya sebagai anugerah Allah', 'MPL01', 'agm03', 'KLS01', 'SM01'),
('KDA0000000024', '3', '3.3', ' mengenal lingkungan rumah sebagai tempat yang dianugerahkan Allah untuk bertumbuh dan berkembang', 'MPL01', 'agm03', 'KLS01', 'SM01'),
('KDA0000000025', '4', '3.4', 'mengenal lingkungan sekolah sebagai tempat yang dianugerahkan Allah untuk bertumbuh dan berkembang', 'MPL01', 'agm03', 'KLS01', 'SM01'),
('KDA0000000026', '5', '3.5', 'mengenal Allah sebagai pencipta yang Maha Baik', 'MPL01', 'agm03', 'KLS01', 'SM01'),
('KDA0000000027', '6', '3.6', 'mengenal kisah kelahiran Yesus sebagai wujud kasih Allah yang Mahabaik', 'MPL01', 'agm03', 'KLS01', 'SM01'),
('KDA0000000028', '7', '3.7', ' mengenal doa-doa harian sebagai ungkapan iman kepada Allah', 'MPL01', 'agm03', 'KLS01', 'SM01'),
('KDA0000000029', '8', '3.8', 'mengenal sikap-sikap berdoa sebagai ungkapan syukur kepada Allah', 'MPL01', 'agm03', 'KLS01', 'SM01'),
('KDA0000000030', '1', '3.1', 'mengenal jenis-jenis ciptaan Sang Hyang Widhi', 'MPL01', 'agm04', 'KLS01', 'SM01'),
('KDA0000000031', '2', '3.2', 'memahami ajaran Tri Pramana sebagai kekuatan makhluk hidup', 'MPL01', 'agm04', 'KLS01', 'SM01'),
('KDA0000000032', '3', '3.3', 'mengenal ajaran Tri Kaya Parisudha sebagai tuntunan hidup manusia', 'MPL01', 'agm04', 'KLS01', 'SM01'),
('KDA0000000033', '4', '3.4', 'memahami kitab suci Veda dan buku biasa', 'MPL01', 'agm04', 'KLS01', 'SM01'),
('KDA0000000034', '5', '3.5', 'mengenal ajaran Dharmagita dalam kehidupan sehari-hari', 'MPL01', 'agm04', 'KLS01', 'SM01'),
('KDA0000000035', '6', '3.6', 'memahami mantra guru, gayatri mantra, mantra makan, mantra Saraswati, dan doa tidur', 'MPL01', 'agm04', 'KLS01', 'SM01'),
('KDA0000000036', '7', '3.7', 'memahami sejarah perkembangan agama Hindu pada abad I di Indonesia', 'MPL01', 'agm04', 'KLS01', 'SM01'),
('KDA0000000037', '1', '3.1', 'memahami cara-cara menghormat, salam, dan simbol-simbol agama Buddha', 'MPL01', 'agm05', 'KLS01', 'SM01'),
('KDA0000000038', '2', '3.2', 'menerapkan doa sebelum dan sesudah melakukan kegiatan sehari-hari', 'MPL01', 'agm05', 'KLS01', 'SM01'),
('KDA0000000039', '3', '3.3', 'memahami tempat ibadah, rohaniawan, kitab suci, hari raya, dan Guru Agung agama Buddha', 'MPL01', 'agm05', 'KLS01', 'SM01'),
('KDA0000000040', '4', '3.4', 'memahami keluarga sendiri dan keluarga Pangeran Siddharta', 'MPL01', 'agm05', 'KLS01', 'SM01'),
('KDA0000000041', '1', '3.1', 'memahami konsep Yin Yang pada diri sendiri dan alam sekitar', 'MPL01', 'agm06', 'KLS01', 'SM01'),
('KDA0000000042', '2', '3.2', 'memahami kuasa Tian dalam kehidupan sehari-hari', 'MPL01', 'agm06', 'KLS01', 'SM01'),
('KDA0000000043', '3', '3.3', 'memahami alam sekitar sebagai sarana hidup yang perlu dijaga dan dirawat', 'MPL01', 'agm06', 'KLS01', 'SM01'),
('KDA0000000044', '4', '3.4', 'memahami hubungan kemasyarakatan serta sikap di dalam kemasyarakatan serta sikap dalam keluarga dan di sekolah', 'MPL01', 'agm06', 'KLS01', 'SM01'),
('KDA0000000045', '5', '3.5', 'memahami cara anak berbakti kepada orang tua', 'MPL01', 'agm06', 'KLS01', 'SM01'),
('KDA0000000047', '1', '3.1', 'mengetahui huruf-huruf hijaiyyah dan harakatnya secara lengkap', 'MPL01', 'agm01', 'KLS01', 'SM02'),
('KDA0000000048', '2', '3.2', 'memahami pesan-pesan pokok Q.S. al-Fatihah dan Q.S. al-Ikhlas', 'MPL01', 'agm01', 'KLS01', 'SM02'),
('KDA0000000049', '3', '3.3', 'memahami adanya Allah Swt. yang Maha Pengasih dan Maha Penyayang', 'MPL01', 'agm01', 'KLS01', 'SM02'),
('KDA0000000050', '4', '3.4', 'memahami keesaan Allah Swt. berdasarkan pengamatan terhadap dirinya dan makhluk ciptaan-Nya yang dijumpai di sekitar rumah dan sekolah', 'MPL01', 'agm01', 'KLS01', 'SM02'),
('KDA0000000051', '5', '3.5', 'memahami makna al-Asmau al-Husna: ar-Rahman, ar-Rahim, dan al-Malik', 'MPL01', 'agm01', 'KLS01', 'SM02'),
('KDA0000000052', '6', '3.6', 'memahami makna dua kalimat syahadat', 'MPL01', 'agm01', 'KLS01', 'SM02'),
('KDA0000000053', '7', '3.7', 'memahami makna doa sebelum dan sesudah belajar', 'MPL01', 'agm01', 'KLS01', 'SM02'),
('KDA0000000054', '8', '3.8', 'memahami perilaku hormat dan patuh kepada orangtua dan guru', 'MPL01', 'agm01', 'KLS01', 'SM02'),
('KDA0000000055', '9', '3.9', 'memahami berkata yang baik, sopan, dan santun', 'MPL01', 'agm01', 'KLS01', 'SM02'),
('KDA0000000056', '10', '3.10', 'memahami makna bersyukur, pemaaf, jujur, dan percaya diri', 'MPL01', 'agm01', 'KLS01', 'SM02'),
('KDA0000000057', '11', '3.11', 'memahami tata cara bersuci', 'MPL01', 'agm01', 'KLS01', 'SM02'),
('KDA0000000058', '12', '3.12', 'memahami salat dan kegiatan agama yang dianutnya di sekitar rumahnya melalui pengamatan', 'MPL01', 'agm01', 'KLS01', 'SM02'),
('KDA0000000059', '13', '3.13', 'memahami kisah keteladanan Nabi Adam a.s', 'MPL01', 'agm01', 'KLS01', 'SM02'),
('KDA0000000060', '14', '3.14', 'memahami kisah keteladanan Nabi Idris a.s. ', 'MPL01', 'agm01', 'KLS01', 'SM02'),
('KDA0000000061', '15', '3.15', 'memahami kisah keteladanan Nabi Nuh a.s. ', 'MPL01', 'agm01', 'KLS01', 'SM02'),
('KDA0000000062', '16', '3.16', 'memahami kisah keteladanan Nabi Hud a.s. ', 'MPL01', 'agm01', 'KLS01', 'SM02'),
('KDA0000000063', '17', '3.17', 'memahami kisah keteladanan Nabi Muhammad saw. ', 'MPL01', 'agm01', 'KLS01', 'SM02'),
('KDA0000000064', '1', '3.1', 'mengenal dirinya sebagai ciptaan Allah', 'MPL01', 'agm02', 'KLS01', 'SM02'),
('KDA0000000065', '2', '3.2', 'memahami beragam kegunaan anggota tubuhnya sebagai ciptaan Allah', 'MPL01', 'agm02', 'KLS01', 'SM02'),
('KDA0000000066', '3', '3.3', 'mengenal cara mengasihi keluarga dan teman', 'MPL01', 'agm02', 'KLS01', 'SM02'),
('KDA0000000067', '4', '3.4', 'memahami contoh sikap bersyukur dan bertanggung jawab dalam memelihara alam ciptaan Allah', 'MPL01', 'agm02', 'KLS01', 'SM02'),
('KDA0000000068', '1', '3.1', 'mengenal dirinya yang khas sebagai anugerah Allah', 'MPL01', 'agm03', 'KLS01', 'SM02'),
('KDA0000000069', '2', '3.2', 'mengenal anggota tubuh yang dimilikinya sebagai anugerah Allah', 'MPL01', 'agm03', 'KLS01', 'SM02'),
('KDA0000000070', '3', '3.3', 'mengenal lingkungan rumah sebagai tempat yang dianugerahkan Allah untuk bertumbuh dan berkembang', 'MPL01', 'agm03', 'KLS01', 'SM02'),
('KDA0000000071', '4', '3.4', 'mengenal lingkungan sekolah sebagai tempat yang dianugerahkan Allah untuk bertumbuh dan berkembang', 'MPL01', 'agm03', 'KLS01', 'SM02'),
('KDA0000000072', '5', '3.5', 'mengenal Allah sebagai pencipta yang Maha Baik', 'MPL01', 'agm03', 'KLS01', 'SM02'),
('KDA0000000073', '6', '3.6', 'mengenal kisah kelahiran Yesus sebagai wujud kasih Allah yang Mahabaik', 'MPL01', 'agm03', 'KLS01', 'SM02'),
('KDA0000000074', '7', '3.7', 'mengenal doa-doa harian sebagai ungkapan iman kepada Allah', 'MPL01', 'agm03', 'KLS01', 'SM02'),
('KDA0000000075', '8', '3.8', 'mengenal sikap-sikap berdoa sebagai ungkapan syukur kepada Allah', 'MPL01', 'agm03', 'KLS01', 'SM02'),
('KDA0000000076', '1', '3.1', 'mengenal jenis-jenis ciptaan Sang Hyang Widhi', 'MPL01', 'agm04', 'KLS01', 'SM02'),
('KDA0000000077', '2', '3.2', 'memahami ajaran Tri Pramana sebagai kekuatan makhluk hidup', 'MPL01', 'agm04', 'KLS01', 'SM02'),
('KDA0000000078', '3', '3.3', 'mengenal ajaran Tri Kaya Parisudha sebagai tuntunan hidup manusia', 'MPL01', 'agm04', 'KLS01', 'SM02'),
('KDA0000000079', '4', '3.4', 'memahami kitab suci Veda dan buku biasa', 'MPL01', 'agm04', 'KLS01', 'SM02'),
('KDA0000000080', '5', '3.5', 'mengenal ajaran Dharmagita dalam kehidupan sehari-hari', 'MPL01', 'agm04', 'KLS01', 'SM02'),
('KDA0000000081', '6', '3.6', 'memahami mantra guru, gayatri mantra, mantra makan, mantra Saraswati, dan doa tidur', 'MPL01', 'agm04', 'KLS01', 'SM02'),
('KDA0000000082', '7', '3.7', 'memahami sejarah perkembangan agama Hindu pada abad I di Indonesia', 'MPL01', 'agm04', 'KLS01', 'SM02'),
('KDA0000000083', '1', '3.1', 'memahami cara-cara menghormat, salam, dan simbol-simbol agama Buddha', 'MPL01', 'agm05', 'KLS01', 'SM02'),
('KDA0000000084', '2', '3.2', 'menerapkan doa sebelum dan sesudah melakukan kegiatan sehari-hari', 'MPL01', 'agm05', 'KLS01', 'SM02'),
('KDA0000000085', '3', '3.3', 'memahami tempat ibadah, rohaniawan, kitab suci, hari raya, dan Guru Agung agama Buddha', 'MPL01', 'agm05', 'KLS01', 'SM02'),
('KDA0000000086', '4', '3.4', 'memahami keluarga sendiri dan keluarga Pangeran Siddharta', 'MPL01', 'agm05', 'KLS01', 'SM02'),
('KDA0000000087', '1', '3.1', 'memahami konsep Yin Yang pada diri sendiri dan alam sekitar', 'MPL01', 'agm06', 'KLS01', 'SM02'),
('KDA0000000088', '2', '3.2', 'memahami kuasa Tian dalam kehidupan sehari-hari', 'MPL01', 'agm06', 'KLS01', 'SM02'),
('KDA0000000089', '3', '3.3', 'memahami alam sekitar sebagai sarana hidup yang perlu dijaga dan dirawat', 'MPL01', 'agm06', 'KLS01', 'SM02'),
('KDA0000000090', '4', '3.4', 'memahami hubungan kemasyarakatan serta sikap di dalam kemasyarakatan serta sikap dalam keluarga dan di sekolah', 'MPL01', 'agm06', 'KLS01', 'SM02'),
('KDA0000000091', '5', '3.5', 'memahami cara anak berbakti kepada orang tua', 'MPL01', 'agm06', 'KLS01', 'SM02'),
('KDA0000000092', '6', '3.6', 'mengetahui kisah masa kecil zhisheng Kongzi', 'MPL01', 'agm06', 'KLS01', 'SM02'),
('KDA0000000581', '6', '3.6', 'mengetahui kisah masa kecil zhisheng Kongzi', 'MPL01', 'agm06', 'KLS01', 'SM01'),
('KTM0000000132', '1', '3.1', 'Mengetahui huruf hijaiyyah bersambung sesuai dengan makharijul huruf', 'MPL01', 'agm01', 'KLS02', 'SM01'),
('KTM0000000133', '2', '3.2', 'Memahami pesan-pesan pokok Q.S. an-Nas dan Q.S. al-‘Asr', 'MPL01', 'agm01', 'KLS02', 'SM01'),
('KTM0000000134', '3', '3.3', 'Memahami Hadis yang terkait dengan anjuran menuntut ilmu', 'MPL01', 'agm01', 'KLS02', 'SM01'),
('KTM0000000135', '4', '3.4', 'Memahami Hadis yang terkait dengan perilaku hidup bersih dan sehat', 'MPL01', 'agm01', 'KLS02', 'SM01'),
('KTM0000000136', '5', '3.5', 'Memahami makna al-Asmau al-Husna: al-Quddus, as-Salam, dan al-Khaliq', 'MPL01', 'agm01', 'KLS02', 'SM01'),
('KTM0000000137', '6', '3.6', 'Memahami makna doa sebelum dan sesudah makan', 'MPL01', 'agm01', 'KLS02', 'SM01'),
('KTM0000000138', '7', '3.7', 'Memahami perilaku kasih sayang kepada sesama', 'MPL01', 'agm01', 'KLS02', 'SM01'),
('KTM0000000139', '8', '3.8', 'Memahami sikap kerja sama dan saling tolong menolong', 'MPL01', 'agm01', 'KLS02', 'SM01'),
('KTM0000000140', '9', '3.9', 'Memahami doa sebelum dan sesudah wudu', 'MPL01', 'agm01', 'KLS02', 'SM01'),
('KTM0000000141', '10', '3.10', 'Memahami tata cara salat dan bacaannya', 'MPL01', 'agm01', 'KLS02', 'SM01'),
('KTM0000000142', '11', '3.11', 'Memahami kisah keteladanan Nabi Saleh a.s.', 'MPL01', 'agm01', 'KLS02', 'SM01'),
('KTM0000000143', '12', '3.12', 'Memahami kisah keteladanan Nabi Lut a.s.', 'MPL01', 'agm01', 'KLS02', 'SM01'),
('KTM0000000144', '13', '3.13', 'Memahami kisah keteladanan Nabi Ishaq a.s.', 'MPL01', 'agm01', 'KLS02', 'SM01'),
('KTM0000000145', '14', '3.14', 'Memahami kisah keteladanan Nabi Ya‘qub a.s.', 'MPL01', 'agm01', 'KLS02', 'SM01'),
('KTM0000000146', '15', '3.15', 'Memahami kisah keteladanan Nabi Muhammad saw.', 'MPL01', 'agm01', 'KLS02', 'SM01'),
('KTM0000000147', '1', '3.1', 'Memahami alasan menghormati orang tua dan yang lebih tua berdasarkan Alkitab', 'MPL01', 'agm02', 'KLS02', 'SM01'),
('KTM0000000148', '2', '3.2', 'Memahami pentingnya tanggung jawab dalam keluarga', 'MPL01', 'agm02', 'KLS02', 'SM01'),
('KTM0000000149', '3', '3.3', 'Memahami cara menjaga kerukunan di sekolah dan di lingkungannya', 'MPL01', 'agm02', 'KLS02', 'SM01'),
('KTM0000000150', '4', '3.4', 'Mengenal bentuk disiplin di sekolah, rumah, dan di lingkungan sekitar', 'MPL01', 'agm02', 'KLS02', 'SM01'),
('KTM0000000151', '1', '3.1', 'Memahami peran keluarga sebagai anugerah Allah dalam mengembangkan dirinya', 'MPL01', 'agm03', 'KLS02', 'SM01'),
('KTM0000000152', '2', '3.2', 'Memahami peran teman sebagai anugerah Allah dalam mengembangkan dirinya', 'MPL01', 'agm03', 'KLS02', 'SM01'),
('KTM0000000153', '3', '3.3', 'Memahami karya keselamatan Allah yang dialami oleh tokoh-tokoh Perjanjian Lama', 'MPL01', 'agm03', 'KLS02', 'SM01'),
('KTM0000000154', '4', '3.4', 'Memahami karya keselamatan Allah dalam diri Yesus Kristus yang dikisahkan dalam Perjanjian Baru', 'MPL01', 'agm03', 'KLS02', 'SM01'),
('KTM0000000155', '5', '3.5', 'Mengenal makna iman Kristiani', 'MPL01', 'agm03', 'KLS02', 'SM01'),
('KTM0000000156', '6', '3.6', 'Mengenal makna doa dan macam-macam doa', 'MPL01', 'agm03', 'KLS02', 'SM01'),
('KTM0000000157', '7', '3.7', 'Memahami peran tempat tinggal dan tetangga sebagai anugerah Tuhan yang mendukung pertumbuhan dan perkembangan dirinya', 'MPL01', 'agm03', 'KLS02', 'SM01'),
('KTM0000000158', '8', '3.8', 'Memahami makna hidup rukun dengan tetangga sebagai perwujudan kasih Allah', 'MPL01', 'agm03', 'KLS02', 'SM01'),
('KTM0000000159', '1', '3.1', 'Memahami Atma sebagai sumber hidup bagi makhluk hidup', 'MPL01', 'agm04', 'KLS02', 'SM01'),
('KTM0000000160', '2', '3.2', 'Memahami ajaran Tri Murti sebagai perwujudan Sang Hyang Widhi', 'MPL01', 'agm04', 'KLS02', 'SM01'),
('KTM0000000162', '3', '3.3', 'Mengenal ajaran Tri Mala yang harus dihindari dalam kehidupan sehari-hari', 'MPL01', 'agm04', 'KLS02', 'SM01'),
('KTM0000000163', '4', '3.4', 'Mengenal ajaran Catur Paramitha untuk mencapai kehidupan yang harmonis', 'MPL01', 'agm04', 'KLS02', 'SM01'),
('KTM0000000164', '5', '3.5', 'Memahami tokoh cerita Ramayana dalam kehidupan sehari-hari', 'MPL01', 'agm04', 'KLS02', 'SM01'),
('KTM0000000165', '6', '3.6', 'Memahami perkembangan sejarah agama Hindu di daerah setempat', 'MPL01', 'agm04', 'KLS02', 'SM01'),
('KTM0000000166', '1', '3.1', 'Mengenal sejarah kelahiran dan masa kanak-kanak Pangeran Siddharta', 'MPL01', 'agm05', 'KLS02', 'SM01'),
('KTM0000000167', '2', '3.2', 'Menunjukkan kisah kasih sayang, kejujuran, dan persahabatan', 'MPL01', 'agm05', 'KLS02', 'SM01'),
('KTM0000000168', '3', '3.3', 'Memahami macam-macam peraturan dalam keluarga dan sekolah', 'MPL01', 'agm05', 'KLS02', 'SM01'),
('KTM0000000169', '4', '3.4', 'Mengetahui perbuatan baik dan buruk', 'MPL01', 'agm05', 'KLS02', 'SM01'),
('KTM0000000180', '1', '3.1', 'Memahami manusia dikaruniai benih-benih kebajikan dan nafsu', 'MPL01', 'agm06', 'KLS02', 'SM01'),
('KTM0000000181', '2', '3.2', 'Memahami cara memuliakan Tian dengan bersembahyang, berpantang, berjaga, dan berperilaku bajik', 'MPL01', 'agm06', 'KLS02', 'SM01'),
('KTM0000000182', '3', '3.3', 'Memahami benda-benda ciptaan Tian dan ciptaan manusia', 'MPL01', 'agm06', 'KLS02', 'SM01'),
('KTM0000000183', '4', '3.4', 'Memahami makna keluarga inti, tugas, dan kewajiban tiap anggota keluarga', 'MPL01', 'agm06', 'KLS02', 'SM01'),
('KTM0000000184', '5', '3.5', 'Memahami cara berbakti kepada orang tua', 'MPL01', 'agm06', 'KLS02', 'SM01'),
('KTM0000000185', '6', '3.6', 'Memahami masa kecil Mengzi, Sang Penegak', 'MPL01', 'agm06', 'KLS02', 'SM01'),
('KTM0000000186', '1', '3.1', 'Mengetahui huruf hijaiyyah bersambung sesuai dengan makharijul huruf', 'MPL01', 'agm01', 'KLS02', 'SM02'),
('KTM0000000187', '2', '3.1', 'Memahami pesan-pesan pokok Q.S. an-Nas dan Q.S. al-‘Asr', 'MPL01', 'agm01', 'KLS02', 'SM02'),
('KTM0000000188', '3', '3.1', 'Memahami Hadis yang terkait dengan anjuran menuntut ilmu', 'MPL01', 'agm01', 'KLS02', 'SM02'),
('KTM0000000189', '4', '3.1', 'Memahami Hadis yang terkait dengan perilaku hidup bersih dan sehat', 'MPL01', 'agm01', 'KLS02', 'SM02'),
('KTM0000000190', '5', '3.1', 'Memahami makna al-Asmau al-Husna: al-Quddus, as-Salam, dan al-Khaliq', 'MPL01', 'agm01', 'KLS02', 'SM02'),
('KTM0000000191', '6', '3.1', 'Memahami makna doa sebelum dan sesudah makan', 'MPL01', 'agm01', 'KLS02', 'SM02'),
('KTM0000000192', '7', '3.1', 'Memahami perilaku kasih sayang kepada sesama', 'MPL01', 'agm01', 'KLS02', 'SM02'),
('KTM0000000193', '8', '3.1', 'Memahami sikap kerja sama dan saling tolong menolong', 'MPL01', 'agm01', 'KLS02', 'SM02'),
('KTM0000000194', '9', '3.1', 'Memahami doa sebelum dan sesudah wudu', 'MPL01', 'agm01', 'KLS02', 'SM02'),
('KTM0000000195', '10', '3.1', 'Memahami tata cara salat dan bacaannya', 'MPL01', 'agm01', 'KLS02', 'SM02'),
('KTM0000000196', '11', '3.1', 'Memahami kisah keteladanan Nabi Saleh a.s.', 'MPL01', 'agm01', 'KLS02', 'SM02'),
('KTM0000000197', '12', '3.1', 'Memahami kisah keteladanan Nabi Lut a.s.', 'MPL01', 'agm01', 'KLS02', 'SM02'),
('KTM0000000198', '13', '3.1', 'Memahami kisah keteladanan Nabi Ishaq a.s.', 'MPL01', 'agm01', 'KLS02', 'SM02'),
('KTM0000000199', '14', '3.1', 'Memahami kisah keteladanan Nabi Ya‘qub a.s.', 'MPL01', 'agm01', 'KLS02', 'SM02'),
('KTM0000000200', '15', '3.1', 'Memahami kisah keteladanan Nabi Muhammad saw.', 'MPL01', 'agm01', 'KLS02', 'SM02'),
('KTM0000000201', '1', '3.1', 'Memahami alasan menghormati orang tua dan yang lebih tua berdasarkan Alkitab', 'MPL01', 'agm02', 'KLS02', 'SM02'),
('KTM0000000202', '2', '3.2', 'Memahami pentingnya tanggung jawab dalam keluarga', 'MPL01', 'agm02', 'KLS02', 'SM02'),
('KTM0000000203', '3', '3.3', 'Memahami cara menjaga kerukunan di sekolah dan di lingkungannya', 'MPL01', 'agm02', 'KLS02', 'SM02'),
('KTM0000000204', '4', '3.4', 'Mengenal bentuk disiplin di sekolah, rumah, dan di lingkungan sekitar', 'MPL01', 'agm02', 'KLS02', 'SM02'),
('KTM0000000205', '1', '3.1', 'Memahami peran keluarga sebagai anugerah Allah dalam mengembangkan dirinya', 'MPL01', 'agm03', 'KLS02', 'SM02'),
('KTM0000000206', '2', '3.2', 'Memahami peran teman sebagai anugerah Allah dalam mengembangkan dirinya', 'MPL01', 'agm03', 'KLS02', 'SM02'),
('KTM0000000207', '3', '3.3', 'Memahami karya keselamatan Allah yang dialami oleh tokoh-tokoh Perjanjian Lama', 'MPL01', 'agm03', 'KLS02', 'SM02'),
('KTM0000000208', '4', '3.4', 'Memahami karya keselamatan Allah dalam diri Yesus Kristus yang dikisahkan dalam Perjanjian Baru', 'MPL01', 'agm03', 'KLS02', 'SM02'),
('KTM0000000209', '5', '3.5', 'Mengenal makna iman Kristiani', 'MPL01', 'agm03', 'KLS02', 'SM02'),
('KTM0000000210', '6', '3.6', 'Mengenal makna doa dan macam-macam doa', 'MPL01', 'agm03', 'KLS02', 'SM02'),
('KTM0000000211', '7', '3.7', 'Memahami peran tempat tinggal dan tetangga sebagai anugerah Tuhan yang mendukung pertumbuhan dan perkembangan dirinya', 'MPL01', 'agm03', 'KLS02', 'SM02'),
('KTM0000000212', '8', '3.8', 'Memahami makna hidup rukun dengan tetangga sebagai perwujudan kasih Allah', 'MPL01', 'agm03', 'KLS02', 'SM02'),
('KTM0000000213', '1', '3.1', 'Memahami Atma sebagai sumber hidup bagi makhluk hidup', 'MPL01', 'agm04', 'KLS02', 'SM02'),
('KTM0000000214', '2', '3.2', 'Memahami ajaran Tri Murti sebagai perwujudan Sang Hyang Widhi', 'MPL01', 'agm04', 'KLS02', 'SM02'),
('KTM0000000215', '3', '3.3', 'Mengenal ajaran Tri Mala yang harus dihindari dalam kehidupan sehari-hari', 'MPL01', 'agm04', 'KLS02', 'SM02'),
('KTM0000000216', '4', '3.4', 'Mengenal ajaran Catur Paramitha untuk mencapai kehidupan yang harmonis', 'MPL01', 'agm04', 'KLS02', 'SM02'),
('KTM0000000217', '5', '3.5', 'Memahami tokoh cerita Ramayana dalam kehidupan sehari-hari', 'MPL01', 'agm04', 'KLS02', 'SM02'),
('KTM0000000218', '6', '3.6', 'Memahami perkembangan sejarah agama Hindu di daerah setempat', 'MPL01', 'agm04', 'KLS02', 'SM02'),
('KTM0000000219', '1', '3.1', 'Mengenal sejarah kelahiran dan masa kanak-kanak Pangeran Siddharta', 'MPL01', 'agm05', 'KLS02', 'SM02'),
('KTM0000000220', '2', '3.2', 'Menunjukkan kisah kasih sayang, kejujuran, dan persahabatan', 'MPL01', 'agm05', 'KLS02', 'SM02'),
('KTM0000000221', '3', '3.3', 'Memahami macam-macam peraturan dalam keluarga dan sekolah', 'MPL01', 'agm05', 'KLS02', 'SM02'),
('KTM0000000222', '4', '3.4', 'Mengetahui perbuatan baik dan buruk', 'MPL01', 'agm05', 'KLS02', 'SM02'),
('KTM0000000223', '1', '3.1', 'Memahami manusia dikaruniai benih-benih kebajikan dan nafsu', 'MPL01', 'agm06', 'KLS02', 'SM02'),
('KTM0000000224', '2', '3.2', 'Memahami cara memuliakan Tian dengan bersembahyang, berpantang, berjaga, dan berperilaku bajik', 'MPL01', 'agm06', 'KLS02', 'SM02'),
('KTM0000000225', '3', '3.3', 'Memahami benda-benda ciptaan Tian dan ciptaan manusia', 'MPL01', 'agm06', 'KLS02', 'SM02'),
('KTM0000000226', '4', '3.4', 'Memahami makna keluarga inti, tugas, dan kewajiban tiap anggota keluarga', 'MPL01', 'agm06', 'KLS02', 'SM02'),
('KTM0000000227', '5', '3.5', 'Memahami cara berbakti kepada orang tua', 'MPL01', 'agm06', 'KLS02', 'SM02'),
('KTM0000000228', '6', '3.6', 'Memahami masa kecil Mengzi, Sang Penegak', 'MPL01', 'agm06', 'KLS02', 'SM02'),
('KTM0000000229', '1', '3.1', 'memahami makna Q.S. an-Nasr dan al-Kausar', 'MPL01', 'agm01', 'KLS03', 'SM01'),
('KTM0000000230', '2', '3.2', 'memahami Hadis yang terkait dengan perilaku mandiri, percaya diri, dan bertanggung jawab', 'MPL01', 'agm01', 'KLS03', 'SM01'),
('KTM0000000231', '3', '3.3', 'memahami keesaan Allah Yang Maha Pencipta berdasarkan pengamatan terhadap dirinya dan makhluk ciptaan-Nya yang dijumpai di sekitar rumah dan sekolah', 'MPL01', 'agm01', 'KLS03', 'SM01'),
('KTM0000000232', '4', '3.4', 'memahami makna al-Asmau al-Husna: al-Wahhab, al-‘Alim, dan as-Sami‘', 'MPL01', 'agm01', 'KLS03', 'SM01'),
('KTM0000000233', '5', '3.5', 'memahami perilaku tawaduk, ikhlas, dan mohon pertolongan', 'MPL01', 'agm01', 'KLS03', 'SM01'),
('KTM0000000234', '6', '3.6', 'memahami sikap peduli terhadap sesama sebagai implementasi pemahaman Q.S. al-Kausar', 'MPL01', 'agm01', 'KLS03', 'SM01'),
('KTM0000000235', '7', '3.7', 'memahami sikap bersyukur', 'MPL01', 'agm01', 'KLS03', 'SM01'),
('KTM0000000236', '8', '3.8', 'memahami makna salat sebagai wujud dari pemahaman Q.S. al-Kausar', 'MPL01', 'agm01', 'KLS03', 'SM01'),
('KTM0000000237', '9', '3.9', 'memahami makna zikir dan doa setelah salat', 'MPL01', 'agm01', 'KLS03', 'SM01'),
('KTM0000000238', '10', '3.10', 'memahami hikmah ibadah salat melalui pengamatan dan pengalaman di rumah dan sekolah', 'MPL01', 'agm01', 'KLS03', 'SM01'),
('KTM0000000239', '11', '3.11', 'memahami kisah keteladanan Nabi Yusuf a.s.', 'MPL01', 'agm01', 'KLS03', 'SM01'),
('KTM0000000240', '12', '3.12', 'memahami kisah keteladanan Nabi Syu‘aib a.s.', 'MPL01', 'agm01', 'KLS03', 'SM01'),
('KTM0000000241', '13', '3.13', 'memahami kisah keteladanan Nabi Ibrahim a.s. dan Nabi Ismail a.s.', 'MPL01', 'agm01', 'KLS03', 'SM01'),
('KTM0000000242', '14', '3.14', 'memahami kisah keteladanan nabi Muhammad saw.', 'MPL01', 'agm01', 'KLS03', 'SM01'),
('KTM0000000243', '1', '3.1', 'memahami kehadiran Allah dalam iklim dan gejala-gejala alam', 'MPL01', 'agm02', 'KLS03', 'SM01'),
('KTM0000000244', '2', '3.2', 'memahami contoh tanggung jawab dalam memelihara flora dan fauna di sekitarnya', 'MPL01', 'agm02', 'KLS03', 'SM01'),
('KTM0000000245', '3', '3.3', 'memahami bahwa keberagaman budaya, suku, dan bangsa adalah kekayaan yang dikaruniakan Allah pada manusia', 'MPL01', 'agm02', 'KLS03', 'SM01'),
('KTM0000000246', '4', '3.4', 'memahami pentingnya berperan serta menjaga keutuhan ciptaan Allah', 'MPL01', 'agm02', 'KLS03', 'SM01'),
('KTM0000000247', '1', '3.1', 'memahami pertumbuhan dan perkembangan diri sebagai anugerah Allah', 'MPL01', 'agm03', 'KLS03', 'SM01'),
('KTM0000000248', '2', '3.2', 'memahami bahwa kemampuan membedakan yang baik dan buruk adalah anugerah Allah', 'MPL01', 'agm03', 'KLS03', 'SM01'),
('KTM0000000249', '3', '3.3', 'memahami karya keselamatan Allah yang dialami oleh tokoh-tokoh Perjanjian Lama', 'MPL01', 'agm03', 'KLS03', 'SM01'),
('KTM0000000250', '4', '3.4', 'memahami ajaran Yesus dan karya-Nya melalui kisah dalam Perjanjian baru', 'MPL01', 'agm03', 'KLS03', 'SM01'),
('KTM0000000251', '5', '3.5', 'mengenal tata perayaan sakramen Baptis, Ekaristi, dan Tobat sebagai tanda dan sarana karya keselamatan Allah bagi manusia', 'MPL01', 'agm03', 'KLS03', 'SM01'),
('KTM0000000252', '6', '3.6', 'mengenal nilai-nilai keutamaan Kristiani (iman, harapan, dan kasih) sebagai tanggapan atas karya keselamatan Allah', 'MPL01', 'agm03', 'KLS03', 'SM01'),
('KTM0000000253', '7', '3.7', 'mengenal pemimpin dan tradisi masyarakat yang baik sebagai wujud karya keselamatan Allah', 'MPL01', 'agm03', 'KLS03', 'SM01'),
('KTM0000000254', '8', '3.8', 'memahami pentingnya melestarikan lingkungan hidup sebagai wujud karya keselamatan Allah', 'MPL01', 'agm03', 'KLS03', 'SM01'),
('KTM0000000255', '1', '3.1', 'mengenal ajaran Tri Parartha untuk mencapai keharmonisan hidup', 'MPL01', 'agm04', 'KLS03', 'SM01'),
('KTM0000000256', '2', '3.2', 'mengenal ajaran Daiwi Sampad dan Asuri Sampad yang bersumber pada kitab Bhagavadgita', 'MPL01', 'agm04', 'KLS03', 'SM01'),
('KTM0000000257', '3', '3.3', 'memahami tokoh-tokoh utama Mahabharata dalam rangka meneladani nilai-nilai kepemimpinannya', 'MPL01', 'agm04', 'KLS03', 'SM01'),
('KTM0000000258', '4', '3.4', 'mengenal nama-nama planet/astronomi dalam ajaran Veda', 'MPL01', 'agm04', 'KLS03', 'SM01'),
('KTM0000000259', '5', '3.5', 'mengenal tari sakral dan tari profan dalam kehidupan keagamaan', 'MPL01', 'agm04', 'KLS03', 'SM01'),
('KTM0000000260', '6', '3.6', 'memahami sembahyang dan berdoa dalam ajaran Hindu', 'MPL01', 'agm04', 'KLS03', 'SM01'),
('KTM0000000261', '1', '3.1', 'mengetahui semangat belajar Pangeran Siddharta pada masa bersekolah dan pengorbanan Bodhisattva', 'MPL01', 'agm05', 'KLS03', 'SM01'),
('KTM0000000262', '2', '3.2', 'memahami hari-hari raya agama Buddha', 'MPL01', 'agm05', 'KLS03', 'SM01'),
('KTM0000000263', '3', '3.3', 'memahami kewajiban anak terhadap orang tua dan guru', 'MPL01', 'agm05', 'KLS03', 'SM01'),
('KTM0000000264', '4', '3.4', 'memahami kesalahan, memperbaiki diri, meminta, dan memberi maaf', 'MPL01', 'agm05', 'KLS03', 'SM01'),
('KTM0000000265', '1', '3.1', 'mengetahui pentingnya perilaku bakti dan rendah hati dan menghindari prilaku tidak berbakti dan sombong', 'MPL01', 'agm06', 'KLS03', 'SM01'),
('KTM0000000266', '2', '3.2', 'benjelaskan bahwa watak sejati (Xing) adalah firman Tian (Tianming) dalam diri manusia', 'MPL01', 'agm06', 'KLS03', 'SM01'),
('KTM0000000267', '3', '3.3', 'memahami pentingnya menjaga dan merawat lingkungan sekitar', 'MPL01', 'agm06', 'KLS03', 'SM01'),
('KTM0000000268', '4', '3.4', 'memahami tiga kesukaan yang membawa faedah dan tiga kesukaan yang membawa celaka', 'MPL01', 'agm06', 'KLS03', 'SM01'),
('KTM0000000269', '5', '3.5', 'memahami tingkatan bakti kepada orang tua', 'MPL01', 'agm06', 'KLS03', 'SM01'),
('KTM0000000270', '6', '3.6', 'memahami teladan kebajikan murid utama Zhisheng Kongzi (Yan Hui, Zilu, Zigong, Zengzi)', 'MPL01', 'agm06', 'KLS03', 'SM01'),
('KTM0000000271', '1', '3.1', 'memahami makna Q.S. an-Nasr dan al-Kausar', 'MPL01', 'agm01', 'KLS03', 'SM02'),
('KTM0000000272', '2', '3.2', 'memahami Hadis yang terkait dengan perilaku mandiri, percaya diri, dan bertanggung jawab', 'MPL01', 'agm01', 'KLS03', 'SM02'),
('KTM0000000273', '3', '3.3', 'memahami keesaan Allah Yang Maha Pencipta berdasarkan pengamatan terhadap dirinya dan makhluk ciptaan-Nya yang dijumpai di sekitar rumah dan sekolah', 'MPL01', 'agm01', 'KLS03', 'SM02'),
('KTM0000000274', '4', '3.4', 'memahami makna al-Asmau al-Husna: al-Wahhab, al-‘Alim, dan as-Sami‘', 'MPL01', 'agm01', 'KLS03', 'SM02'),
('KTM0000000275', '5', '3.5', 'memahami perilaku tawaduk, ikhlas, dan mohon pertolongan', 'MPL01', 'agm01', 'KLS03', 'SM02'),
('KTM0000000276', '6', '3.6', 'memahami sikap peduli terhadap sesama sebagai implementasi pemahaman Q.S. al-Kausar', 'MPL01', 'agm01', 'KLS03', 'SM02'),
('KTM0000000277', '7', '3.7', 'memahami sikap bersyukur', 'MPL01', 'agm01', 'KLS03', 'SM02'),
('KTM0000000278', '8', '3.8', 'memahami makna salat sebagai wujud dari pemahaman Q.S. al-Kausar', 'MPL01', 'agm01', 'KLS03', 'SM02'),
('KTM0000000279', '9', '3.9', 'memahami makna zikir dan doa setelah salat', 'MPL01', 'agm01', 'KLS03', 'SM02'),
('KTM0000000280', '10', '3.10', 'memahami hikmah ibadah salat melalui pengamatan dan pengalaman di rumah dan sekolah', 'MPL01', 'agm01', 'KLS03', 'SM02'),
('KTM0000000281', '11', '3.11', 'memahami kisah keteladanan Nabi Yusuf a.s.', 'MPL01', 'agm01', 'KLS03', 'SM02'),
('KTM0000000282', '12', '3.12', 'memahami kisah keteladanan Nabi Syu‘aib a.s.', 'MPL01', 'agm01', 'KLS03', 'SM02'),
('KTM0000000283', '13', '3.13', 'memahami kisah keteladanan Nabi Ibrahim a.s. dan Nabi Ismail a.s.', 'MPL01', 'agm01', 'KLS03', 'SM02'),
('KTM0000000284', '14', '3.14', 'memahami kisah keteladanan nabi Muhammad saw.', 'MPL01', 'agm01', 'KLS03', 'SM02'),
('KTM0000000285', '1', '3.1', 'memahami kehadiran Allah dalam iklim dan gejala-gejala alam', 'MPL01', 'agm02', 'KLS03', 'SM02'),
('KTM0000000286', '2', '3.2', 'memahami contoh tanggung jawab dalam memelihara flora dan fauna di sekitarnya', 'MPL01', 'agm02', 'KLS03', 'SM02'),
('KTM0000000287', '3', '3.3', 'memahami bahwa keberagaman budaya, suku, dan bangsa adalah kekayaan yang dikaruniakan Allah pada manusia', 'MPL01', 'agm02', 'KLS03', 'SM02'),
('KTM0000000288', '4', '3.4', 'memahami pentingnya berperan serta menjaga keutuhan ciptaan Allah', 'MPL01', 'agm02', 'KLS03', 'SM02'),
('KTM0000000289', '1', '3.1', 'memahami pertumbuhan dan perkembangan diri sebagai anugerah Allah', 'MPL01', 'agm03', 'KLS03', 'SM02'),
('KTM0000000290', '2', '3.2', 'memahami bahwa kemampuan membedakan yang baik dan buruk adalah anugerah Allah', 'MPL01', 'agm03', 'KLS03', 'SM02'),
('KTM0000000291', '3', '3.3', 'memahami karya keselamatan Allah yang dialami oleh tokoh-tokoh Perjanjian Lama', 'MPL01', 'agm03', 'KLS03', 'SM02'),
('KTM0000000292', '4', '3.4', 'memahami ajaran Yesus dan karya-Nya melalui kisah dalam Perjanjian baru', 'MPL01', 'agm03', 'KLS03', 'SM02'),
('KTM0000000293', '5', '3.5', 'mengenal tata perayaan sakramen Baptis, Ekaristi, dan Tobat sebagai tanda dan sarana karya keselamatan Allah bagi manusia', 'MPL01', 'agm03', 'KLS03', 'SM02'),
('KTM0000000294', '6', '3.6', 'mengenal nilai-nilai keutamaan Kristiani (iman, harapan, dan kasih) sebagai tanggapan atas karya keselamatan Allah', 'MPL01', 'agm03', 'KLS03', 'SM02'),
('KTM0000000295', '7', '3.7', 'mengenal pemimpin dan tradisi masyarakat yang baik sebagai wujud karya keselamatan Allah', 'MPL01', 'agm03', 'KLS03', 'SM02'),
('KTM0000000296', '8', '3.8', 'memahami pentingnya melestarikan lingkungan hidup sebagai wujud karya keselamatan Allah', 'MPL01', 'agm03', 'KLS03', 'SM02'),
('KTM0000000297', '1', '3.1', 'mengenal ajaran Tri Parartha untuk mencapai keharmonisan hidup', 'MPL01', 'agm04', 'KLS03', 'SM02'),
('KTM0000000298', '2', '3.2', 'mengenal ajaran Daiwi Sampad dan Asuri Sampad yang bersumber pada kitab Bhagavadgita', 'MPL01', 'agm04', 'KLS03', 'SM02'),
('KTM0000000299', '3', '3.3', 'memahami tokoh-tokoh utama Mahabharata dalam rangka meneladani nilai-nilai kepemimpinannya', 'MPL01', 'agm04', 'KLS03', 'SM02'),
('KTM0000000300', '4', '3.4', 'mengenal nama-nama planet/astronomi dalam ajaran Veda', 'MPL01', 'agm04', 'KLS03', 'SM02'),
('KTM0000000301', '5', '3.5', 'mengenal tari sakral dan tari profan dalam kehidupan keagamaan', 'MPL01', 'agm04', 'KLS03', 'SM02'),
('KTM0000000302', '6', '3.6', 'memahami sembahyang dan berdoa dalam ajaran Hindu', 'MPL01', 'agm04', 'KLS03', 'SM02'),
('KTM0000000303', '1', '3.1', 'mengetahui semangat belajar Pangeran Siddharta pada masa bersekolah dan pengorbanan Bodhisattva', 'MPL01', 'agm05', 'KLS03', 'SM02'),
('KTM0000000304', '2', '3.2', 'memahami hari-hari raya agama Buddha', 'MPL01', 'agm05', 'KLS03', 'SM02'),
('KTM0000000305', '3', '3.3', 'memahami kewajiban anak terhadap orang tua dan guru', 'MPL01', 'agm05', 'KLS03', 'SM02'),
('KTM0000000306', '4', '3.4', 'memahami kesalahan, memperbaiki diri, meminta, dan memberi maaf', 'MPL01', 'agm05', 'KLS03', 'SM02'),
('KTM0000000307', '1', '3.1', 'mengetahui pentingnya perilaku bakti dan rendah hati dan menghindari prilaku tidak berbakti dan sombong', 'MPL01', 'agm06', 'KLS03', 'SM02'),
('KTM0000000308', '2', '3.2', 'benjelaskan bahwa watak sejati (Xing) adalah firman Tian (Tianming) dalam diri manusia', 'MPL01', 'agm06', 'KLS03', 'SM02'),
('KTM0000000309', '3', '3.3', 'memahami pentingnya menjaga dan merawat lingkungan sekitar', 'MPL01', 'agm06', 'KLS03', 'SM02'),
('KTM0000000310', '4', '3.4', 'memahami tiga kesukaan yang membawa faedah dan tiga kesukaan yang membawa celaka', 'MPL01', 'agm06', 'KLS03', 'SM02'),
('KTM0000000311', '5', '3.5', 'memahami tingkatan bakti kepada orang tua', 'MPL01', 'agm06', 'KLS03', 'SM02'),
('KTM0000000312', '6', '3.6', 'memahami teladan kebajikan murid utama Zhisheng Kongzi (Yan Hui, Zilu, Zigong, Zengzi)', 'MPL01', 'agm06', 'KLS03', 'SM02'),
('KTM0000000313', '1', '3.1', 'memahami makna Q.S. al-Falaq dan Q.S. al-Fil dengan baik dan benar', 'MPL01', 'agm01', 'KLS04', 'SM01'),
('KTM0000000314', '2', '3.2', 'memahami Allah itu ada melalui pengamatan terhadap makhluk ciptaan-Nya di sekitar rumah dan sekolah', 'MPL01', 'agm01', 'KLS04', 'SM01'),
('KTM0000000315', '3', '3.3', 'memahami makna al-Asmau al-Husna: Al-Basir, Al-‘Adil, dan Al-‘Azim', 'MPL01', 'agm01', 'KLS04', 'SM01'),
('KTM0000000316', '4', '3.4', 'memahami makna iman kepada malaikat-malaikat Allah berdasarkan pengamatan terhadap dirinya dan alam sekitar', 'MPL01', 'agm01', 'KLS04', 'SM01'),
('KTM0000000317', '5', '3.5', 'memahami makna iman kepada Rasul Allah', 'MPL01', 'agm01', 'KLS04', 'SM01'),
('KTM0000000318', '6', '3.6', 'memahami sikap santun dan menghargai teman, baik di rumah, sekolah, maupun di masyarakat sekitar', 'MPL01', 'agm01', 'KLS04', 'SM01'),
('KTM0000000319', '7', '3.7', 'memahami sikap rendah hati', 'MPL01', 'agm01', 'KLS04', 'SM01'),
('KTM0000000320', '8', '3.8', 'memahami perilaku hemat', 'MPL01', 'agm01', 'KLS04', 'SM01'),
('KTM0000000321', '9', '3.9', 'memahami makna perilaku jujur dalam kehidupan sehari-hari', 'MPL01', 'agm01', 'KLS04', 'SM01'),
('KTM0000000322', '10', '3.10', 'memahami makna perilaku amanah dalam kehidupan sehari-hari', 'MPL01', 'agm01', 'KLS04', 'SM01'),
('KTM0000000323', '11', '3.11', 'memahami makna perilaku hormat dan patuh kepada orangtua dan guru', 'MPL01', 'agm01', 'KLS04', 'SM01'),
('KTM0000000324', '12', '3.12', 'memahami manfaat gemar membaca', 'MPL01', 'agm01', 'KLS04', 'SM01'),
('KTM0000000325', '13', '3.13', 'memahami makna sikap pantang menyerah', 'MPL01', 'agm01', 'KLS04', 'SM01'),
('KTM0000000326', '14', '3.14', 'memahami tata cara bersuci dari hadas kecil  sesuai ketentuan syari’at Islam', 'MPL01', 'agm01', 'KLS04', 'SM01'),
('KTM0000000327', '15', '3.15', 'memahami makna ibadah salat', 'MPL01', 'agm01', 'KLS04', 'SM01'),
('KTM0000000328', '16', '3.16', 'memahami kisah keteladanan Nabi Ayyub a.s.', 'MPL01', 'agm01', 'KLS04', 'SM01'),
('KTM0000000329', '17', '3.17', 'memahami kisah keteladanan Nabi Zulkifli a.s.', 'MPL01', 'agm01', 'KLS04', 'SM01'),
('KTM0000000330', '18', '3.18', 'memahami kisah keteladanan Nabi Harun a.s.', 'MPL01', 'agm01', 'KLS04', 'SM01'),
('KTM0000000331', '19', '3.19', 'memahami kisah keteladanan Nabi Musa a.s.', 'MPL01', 'agm01', 'KLS04', 'SM01'),
('KTM0000000332', '20', '3.20', 'memahami kisah keteladanan Nabi Muhammad saw.', 'MPL01', 'agm01', 'KLS04', 'SM01'),
('KTM0000000333', '21', '3.21', 'memahami kisah keteladanan Wali Songo', 'MPL01', 'agm01', 'KLS04', 'SM01'),
('KTM0000000334', '1', '3.1', 'mengenal dirinya sebagai ciptaan Allah', 'MPL01', 'agm02', 'KLS04', 'SM01'),
('KTM0000000335', '2', '3.2', 'memahami beragam kegunaan anggota tubuhnya sebagai ciptaan Allah', 'MPL01', 'agm02', 'KLS04', 'SM01'),
('KTM0000000336', '3', '3.3', 'mengenal cara mengasihi keluarga dan teman', 'MPL01', 'agm02', 'KLS04', 'SM01'),
('KTM0000000337', '4', '3.4', 'memahami contoh sikap bersyukur dan bertanggung jawab dalam memelihara alam ciptaan Allah', 'MPL01', 'agm02', 'KLS04', 'SM01'),
('KTM0000000338', '1', '3.1', 'mengenal dirinya yang khas sebagai anugerah Allah', 'MPL01', 'agm03', 'KLS04', 'SM01'),
('KTM0000000339', '2', '3.2', 'mengenal anggota tubuh yang dimilikinya sebagai anugerah Allah', 'MPL01', 'agm03', 'KLS04', 'SM01'),
('KTM0000000340', '3', '3.3', 'mengenal lingkungan rumah sebagai tempat yang dianugerahkan Allah untuk bertumbuh dan berkembang', 'MPL01', 'agm03', 'KLS04', 'SM01'),
('KTM0000000341', '4', '3.4', 'mengenal lingkungan sekolah sebagai tempat yang dianugerahkan Allah untuk bertumbuh dan berkembang', 'MPL01', 'agm03', 'KLS04', 'SM01'),
('KTM0000000342', '5', '3.5', 'mengenal Allah sebagai pencipta yang Maha Baik', 'MPL01', 'agm03', 'KLS04', 'SM01'),
('KTM0000000343', '6', '3.6', 'mengenal kisah kelahiran Yesus sebagai wujud kasih Allah yang Mahabaik', 'MPL01', 'agm03', 'KLS04', 'SM01'),
('KTM0000000344', '7', '3.7', 'mengenal doa-doa harian sebagai ungkapan iman kepada Allah', 'MPL01', 'agm03', 'KLS04', 'SM01'),
('KTM0000000345', '8', '3.8', 'mengenal sikap-sikap berdoa sebagai ungkapan syukur kepada Allah', 'MPL01', 'agm03', 'KLS04', 'SM01'),
('KTM0000000346', '1', '3.1', 'mengenal jenis-jenis ciptaan Sang Hyang Widhi', 'MPL01', 'agm04', 'KLS04', 'SM01'),
('KTM0000000347', '2', '3.2', 'memahami ajaran Tri Pramana sebagai kekuatan makhluk hidup', 'MPL01', 'agm04', 'KLS04', 'SM01'),
('KTM0000000348', '3', '3.3', 'mengenal ajaran Tri Kaya Parisudha sebagai tuntunan hidup manusia', 'MPL01', 'agm04', 'KLS04', 'SM01'),
('KTM0000000349', '4', '3.4', 'memahami kitab suci Veda dan buku biasa', 'MPL01', 'agm04', 'KLS04', 'SM01'),
('KTM0000000350', '5', '3.5', 'mengenal ajaran Dharmagita dalam kehidupan sehari-hari', 'MPL01', 'agm04', 'KLS04', 'SM01'),
('KTM0000000351', '6', '3.6', 'memahami mantra guru, gayatri mantra, mantra makan, mantra Saraswati, dan doa tidur', 'MPL01', 'agm04', 'KLS04', 'SM01'),
('KTM0000000352', '7', '3.7', 'memahami sejarah perkembangan agama Hindu pada abad I di Indonesia', 'MPL01', 'agm04', 'KLS04', 'SM01'),
('KTM0000000353', '1', '3.1', 'memahami cara-cara menghormat, salam, dan simbol-simbol agama Buddha', 'MPL01', 'agm05', 'KLS04', 'SM01'),
('KTM0000000354', '2', '3.2', 'menerapkan doa sebelum dan sesudah melakukan kegiatan sehari-hari', 'MPL01', 'agm05', 'KLS04', 'SM01'),
('KTM0000000355', '3', '3.3', 'memahami tempat ibadah, rohaniawan, kitab suci, hari raya, dan Guru Agung agama Buddha', 'MPL01', 'agm05', 'KLS04', 'SM01'),
('KTM0000000356', '4', '3.4', 'memahami keluarga sendiri dan keluarga Pangeran Siddharta', 'MPL01', 'agm05', 'KLS04', 'SM01'),
('KTM0000000357', '1', '3.1', 'memahami konsep Yin Yang pada diri sendiri dan alam sekitar', 'MPL01', 'agm06', 'KLS04', 'SM01'),
('KTM0000000358', '2', '3.2', 'memahami kuasa Tian dalam kehidupan sehari-hari', 'MPL01', 'agm06', 'KLS04', 'SM01'),
('KTM0000000359', '3', '3.3', 'memahami alam sekitar sebagai sarana hidup yang perlu dijaga dan dirawat', 'MPL01', 'agm06', 'KLS04', 'SM01'),
('KTM0000000360', '4', '3.4', 'memahami hubungan kemasyarakatan serta sikap di dalam kemasyarakatan serta sikap dalam keluarga dan di sekolah', 'MPL01', 'agm06', 'KLS04', 'SM01'),
('KTM0000000361', '5', '3.5', 'memahami cara anak berbakti kepada orang tua', 'MPL01', 'agm06', 'KLS04', 'SM01'),
('KTM0000000362', '6', '3.6', 'mengetahui kisah masa kecil zhisheng Kongzi', 'MPL01', 'agm06', 'KLS04', 'SM01'),
('KTM0000000363', '1', '3.1', 'memahami makna Q.S. al-Falaq dan Q.S. al-Fil dengan baik dan benar', 'MPL01', 'agm01', 'KLS04', 'SM02'),
('KTM0000000364', '2', '3.2', 'memahami Allah itu ada melalui pengamatan terhadap makhluk ciptaan-Nya di sekitar rumah dan sekolah', 'MPL01', 'agm01', 'KLS04', 'SM02'),
('KTM0000000365', '3', '3.3', 'memahami makna al-Asmau al-Husna: Al-Basir, Al-‘Adil, dan Al-‘Azim', 'MPL01', 'agm01', 'KLS04', 'SM02'),
('KTM0000000366', '4', '3.4', 'memahami makna iman kepada malaikat-malaikat Allah berdasarkan pengamatan terhadap dirinya dan alam sekitar', 'MPL01', 'agm01', 'KLS04', 'SM02'),
('KTM0000000367', '5', '3.5', 'memahami makna iman kepada Rasul Allah', 'MPL01', 'agm01', 'KLS04', 'SM02'),
('KTM0000000368', '6', '3.6', 'memahami sikap santun dan menghargai teman, baik di rumah, sekolah, maupun di masyarakat sekitar', 'MPL01', 'agm01', 'KLS04', 'SM02'),
('KTM0000000369', '7', '3.7', 'memahami sikap rendah hati', 'MPL01', 'agm01', 'KLS04', 'SM02'),
('KTM0000000370', '8', '3.8', 'memahami perilaku hemat', 'MPL01', 'agm01', 'KLS04', 'SM02'),
('KTM0000000371', '9', '3.9', 'memahami makna perilaku jujur dalam kehidupan sehari-hari', 'MPL01', 'agm01', 'KLS04', 'SM02'),
('KTM0000000372', '10', '3.10', 'memahami makna perilaku amanah dalam kehidupan sehari-hari', 'MPL01', 'agm01', 'KLS04', 'SM02'),
('KTM0000000373', '11', '3.11', 'memahami makna perilaku hormat dan patuh kepada orangtua dan guru', 'MPL01', 'agm01', 'KLS04', 'SM02'),
('KTM0000000374', '12', '3.12', 'memahami manfaat gemar membaca', 'MPL01', 'agm01', 'KLS04', 'SM02'),
('KTM0000000375', '13', '3.13', 'memahami makna sikap pantang menyerah', 'MPL01', 'agm01', 'KLS04', 'SM02'),
('KTM0000000376', '14', '3.14', 'memahami tata cara bersuci dari hadas kecil  sesuai ketentuan syari’at Islam', 'MPL01', 'agm01', 'KLS04', 'SM02'),
('KTM0000000377', '15', '3.15', 'memahami makna ibadah salat', 'MPL01', 'agm01', 'KLS04', 'SM02'),
('KTM0000000378', '16', '3.16', 'memahami kisah keteladanan Nabi Ayyub a.s.', 'MPL01', 'agm01', 'KLS04', 'SM02'),
('KTM0000000379', '17', '3.17', 'memahami kisah keteladanan Nabi Zulkifli a.s.', 'MPL01', 'agm01', 'KLS04', 'SM02'),
('KTM0000000380', '18', '3.18', 'memahami kisah keteladanan Nabi Harun a.s.', 'MPL01', 'agm01', 'KLS04', 'SM02'),
('KTM0000000381', '19', '3.19', 'memahami kisah keteladanan Nabi Musa a.s.', 'MPL01', 'agm01', 'KLS04', 'SM02'),
('KTM0000000382', '20', '3.20', 'memahami kisah keteladanan Nabi Muhammad saw.', 'MPL01', 'agm01', 'KLS04', 'SM02'),
('KTM0000000383', '21', '3.21', 'memahami kisah keteladanan Wali Songo', 'MPL01', 'agm01', 'KLS04', 'SM02'),
('KTM0000000384', '1', '3.1', 'mengenal dirinya sebagai ciptaan Allah', 'MPL01', 'agm02', 'KLS04', 'SM02'),
('KTM0000000385', '2', '3.2', 'memahami beragam kegunaan anggota tubuhnya sebagai ciptaan Allah', 'MPL01', 'agm02', 'KLS04', 'SM02'),
('KTM0000000386', '3', '3.3', 'mengenal cara mengasihi keluarga dan teman', 'MPL01', 'agm02', 'KLS04', 'SM02'),
('KTM0000000387', '4', '3.4', 'memahami contoh sikap bersyukur dan bertanggung jawab dalam memelihara alam ciptaan Allah', 'MPL01', 'agm02', 'KLS04', 'SM02'),
('KTM0000000388', '1', '3.1', 'mengenal dirinya yang khas sebagai anugerah Allah', 'MPL01', 'agm03', 'KLS04', 'SM02'),
('KTM0000000389', '2', '3.2', 'mengenal anggota tubuh yang dimilikinya sebagai anugerah Allah', 'MPL01', 'agm03', 'KLS04', 'SM02'),
('KTM0000000390', '3', '3.3', 'mengenal lingkungan rumah sebagai tempat yang dianugerahkan Allah untuk bertumbuh dan berkembang', 'MPL01', 'agm03', 'KLS04', 'SM02'),
('KTM0000000391', '4', '3.4', 'mengenal lingkungan sekolah sebagai tempat yang dianugerahkan Allah untuk bertumbuh dan berkembang', 'MPL01', 'agm03', 'KLS04', 'SM02'),
('KTM0000000392', '5', '3.5', 'mengenal Allah sebagai pencipta yang Maha Baik', 'MPL01', 'agm03', 'KLS04', 'SM02'),
('KTM0000000393', '6', '3.6', 'mengenal kisah kelahiran Yesus sebagai wujud kasih Allah yang Mahabaik', 'MPL01', 'agm03', 'KLS04', 'SM02'),
('KTM0000000394', '7', '3.7', 'mengenal doa-doa harian sebagai ungkapan iman kepada Allah', 'MPL01', 'agm03', 'KLS04', 'SM02'),
('KTM0000000395', '8', '3.8', 'mengenal sikap-sikap berdoa sebagai ungkapan syukur kepada Allah', 'MPL01', 'agm03', 'KLS04', 'SM02'),
('KTM0000000396', '1', '3.1', 'mengenal jenis-jenis ciptaan Sang Hyang Widhi', 'MPL01', 'agm04', 'KLS04', 'SM02'),
('KTM0000000397', '2', '3.2', 'memahami ajaran Tri Pramana sebagai kekuatan makhluk hidup', 'MPL01', 'agm04', 'KLS04', 'SM02'),
('KTM0000000398', '3', '3.3', 'mengenal ajaran Tri Kaya Parisudha sebagai tuntunan hidup manusia', 'MPL01', 'agm04', 'KLS04', 'SM02'),
('KTM0000000399', '4', '3.4', 'memahami kitab suci Veda dan buku biasa', 'MPL01', 'agm04', 'KLS04', 'SM02'),
('KTM0000000400', '5', '3.5', 'mengenal ajaran Dharmagita dalam kehidupan sehari-hari', 'MPL01', 'agm04', 'KLS04', 'SM02'),
('KTM0000000401', '6', '3.6', 'memahami mantra guru, gayatri mantra, mantra makan, mantra Saraswati, dan doa tidur', 'MPL01', 'agm04', 'KLS04', 'SM02'),
('KTM0000000402', '7', '3.7', 'memahami sejarah perkembangan agama Hindu pada abad I di Indonesia', 'MPL01', 'agm04', 'KLS04', 'SM02'),
('KTM0000000403', '1', '3.1', 'memahami cara-cara menghormat, salam, dan simbol-simbol agama Buddha', 'MPL01', 'agm05', 'KLS04', 'SM02'),
('KTM0000000404', '2', '3.2', 'menerapkan doa sebelum dan sesudah melakukan kegiatan sehari-hari', 'MPL01', 'agm05', 'KLS04', 'SM02'),
('KTM0000000405', '3', '3.3', 'memahami tempat ibadah, rohaniawan, kitab suci, hari raya, dan Guru Agung agama Buddha', 'MPL01', 'agm05', 'KLS04', 'SM02'),
('KTM0000000406', '4', '3.4', 'memahami keluarga sendiri dan keluarga Pangeran Siddharta', 'MPL01', 'agm05', 'KLS04', 'SM02'),
('KTM0000000407', '1', '3.1', 'memahami konsep Yin Yang pada diri sendiri dan alam sekitar', 'MPL01', 'agm06', 'KLS04', 'SM02'),
('KTM0000000408', '2', '3.2', 'memahami kuasa Tian dalam kehidupan sehari-hari', 'MPL01', 'agm06', 'KLS04', 'SM02'),
('KTM0000000409', '3', '3.3', 'memahami alam sekitar sebagai sarana hidup yang perlu dijaga dan dirawat', 'MPL01', 'agm06', 'KLS04', 'SM02'),
('KTM0000000410', '4', '3.4', 'memahami hubungan kemasyarakatan serta sikap di dalam kemasyarakatan serta sikap dalam keluarga dan di sekolah', 'MPL01', 'agm06', 'KLS04', 'SM02'),
('KTM0000000411', '5', '3.5', 'memahami cara anak berbakti kepada orang tua', 'MPL01', 'agm06', 'KLS04', 'SM02'),
('KTM0000000412', '6', '3.6', 'mengetahui kisah masa kecil zhisheng Kongzi', 'MPL01', 'agm06', 'KLS04', 'SM02'),
('KTM0000000413', '1', '3.1', 'Memahami makna Q.S. at-T?n dan Q.S. al-M?’?n dengan baik dan tart?l', 'MPL01', 'agm01', 'KLS05', 'SM01'),
('KTM0000000414', '2', '3.2', 'Memahami makna al-Asmau al-Husna: Al-Mumit, Al-Hayy, Al-Qayyum, dan Al-Ahad', 'MPL01', 'agm01', 'KLS05', 'SM01'),
('KTM0000000415', '3', '3.3', 'Memahami nama-nama Rasul Allah dan Rasul Ulul ‘Azmi', 'MPL01', 'agm01', 'KLS05', 'SM01'),
('KTM0000000416', '4', '3.4', 'Memahami makna diturunkannya kitab-kitab suci melalui rasul-rasul-Nya sebagai implementasi rukun iman', 'MPL01', 'agm01', 'KLS05', 'SM01'),
('KTM0000000417', '5', '3.5', 'Memahami makna perilaku jujur dalam kehidupan sehai-hari', 'MPL01', 'agm01', 'KLS05', 'SM01'),
('KTM0000000418', '6', '3.6', 'Memahami makna hormat dan patuh kepada orangtua dan guru', 'MPL01', 'agm01', 'KLS05', 'SM01'),
('KTM0000000419', '7', '3.7', 'Memahami makna saling menghargai sesama manusia', 'MPL01', 'agm01', 'KLS05', 'SM01'),
('KTM0000000420', '8', '3.8', 'Memahami makna sederhana dalam kehidupan sehari-hari', 'MPL01', 'agm01', 'KLS05', 'SM01'),
('KTM0000000421', '9', '3.9', 'Memahami makna ikhlas beramal dalam kehidupan sehari-hari', 'MPL01', 'agm01', 'KLS05', 'SM01'),
('KTM0000000422', '10', '3.10', 'Memahami hikmah puasa Ramadan yang dapat membentuk akhlak mulia', 'MPL01', 'agm01', 'KLS05', 'SM01'),
('KTM0000000423', '11', '3.11', 'Memahami pelaksanaan salat tarawih dan tadarus al-Qur’an', 'MPL01', 'agm01', 'KLS05', 'SM01'),
('KTM0000000424', '12', '3.12', 'Memahami kisah keteladanan Nabi Dawud a.s.', 'MPL01', 'agm01', 'KLS05', 'SM01'),
('KTM0000000425', '13', '3.13', 'Memahami kisah keteladanan Nabi Sulaiman a.s.', 'MPL01', 'agm01', 'KLS05', 'SM01'),
('KTM0000000426', '14', '3.14', 'Memahami kisah keteladanan Nabi Ilyas a.s.', 'MPL01', 'agm01', 'KLS05', 'SM01'),
('KTM0000000427', '15', '3.15', 'Memahami kisah keteladanan Nabi Ilyasa’ a.s.', 'MPL01', 'agm01', 'KLS05', 'SM01'),
('KTM0000000428', '16', '3.16', 'Memahami kisah keteladanan Nabi Muhammad saw.', 'MPL01', 'agm01', 'KLS05', 'SM01'),
('KTM0000000429', '17', '3.17', 'Memahami kisah keteladanan Luqman sebagaimana terdapat dalam al-Qur’an', 'MPL01', 'agm01', 'KLS05', 'SM01'),
('KTM0000000430', '1', '3.1', 'Memahami bahwa semua manusia berdosa sehingga perlu bertobat', 'MPL01', 'agm02', 'KLS05', 'SM01'),
('KTM0000000431', '2', '3.2', 'Memahami karya penyelamatan Allah dalam Yesus Kristus', 'MPL01', 'agm02', 'KLS05', 'SM01'),
('KTM0000000432', '3', '3.3', 'Mengenal peran Roh Kudus dalam kehidupan orang yang sudah diselamatkan', 'MPL01', 'agm02', 'KLS05', 'SM01');
INSERT INTO `kd_agama_ki3` (`id_kd`, `nom`, `nomor_kd`, `deskripsi`, `id_mapel`, `id_agama`, `id_kelas`, `id_semester`) VALUES
('KTM0000000433', '4', '3.4', 'Menerapkan contoh cara hidup manusia baru yang sudah bertobat', 'MPL01', 'agm02', 'KLS05', 'SM01'),
('KTM0000000434', '1', '3.1', 'Memahami diri sebagai perempuan atau laki-laki seturut citra Allah', 'MPL01', 'agm03', 'KLS05', 'SM01'),
('KTM0000000435', '2', '3.2', 'Memahami lawan jenis sebagai partner yang dianugerahkan Allah untuk saling melengkapi', 'MPL01', 'agm03', 'KLS05', 'SM01'),
('KTM0000000436', '3', '3.3', 'Memahami karya keselamatan Allah yang dialami tokoh-tokoh Perjanjian Lama dalam kisah Daud, Salomo, dan Ester', 'MPL01', 'agm03', 'KLS05', 'SM01'),
('KTM0000000437', '4', '3.4', 'Memahami sengsara, wafat, dan kebangkitan Yesus sebagai puncak karya keselamatan Allah', 'MPL01', 'agm03', 'KLS05', 'SM01'),
('KTM0000000438', '5', '3.5', 'Memahami hidup baru dalam Roh Kudus yang terungkap melalui doa-doa', 'MPL01', 'agm03', 'KLS05', 'SM01'),
('KTM0000000439', '6', '3.6', 'Memahami karya Roh Kudus dalam kehidupan menggereja', 'MPL01', 'agm03', 'KLS05', 'SM01'),
('KTM0000000440', '7', '3.7', 'Memahami buah-buah Roh sebagai nilai yang sangat dibutuhkan demi pengembangan kehidupan dalam masyarakat', 'MPL01', 'agm03', 'KLS05', 'SM01'),
('KTM0000000441', '8', '3.8', 'Memahami nilai-nilai kejujuran dan keadilan dalam kehidupan bermasyarakat sebagai perwujudan karya Roh Kudus', 'MPL01', 'agm03', 'KLS05', 'SM01'),
('KTM0000000442', '1', '3.1', 'Memahami kitab suci Veda sebagai sumber hukum Hindu', 'MPL01', 'agm04', 'KLS05', 'SM01'),
('KTM0000000443', '2', '3.2', 'Mengenal ajaran Catur Marga Yoga dalam agama Hindu', 'MPL01', 'agm04', 'KLS05', 'SM01'),
('KTM0000000444', '3', '3.3', 'Memahami kemahakuasaan Sang Hyang Widhi sebagai Cadhu Sakti', 'MPL01', 'agm04', 'KLS05', 'SM01'),
('KTM0000000445', '4', '3.4', 'Mengenal ajaran Catur Guru yang patut dihormati', 'MPL01', 'agm04', 'KLS05', 'SM01'),
('KTM0000000446', '5', '3.5', 'Mengenal tempat-tempat suci dalam agama Hindu', 'MPL01', 'agm04', 'KLS05', 'SM01'),
('KTM0000000447', '1', '3.1', 'Memahami masa bertapa dan gangguan mara', 'MPL01', 'agm05', 'KLS05', 'SM01'),
('KTM0000000448', '2', '3.2', 'Memahami delapan kondisi duniawi dan hakikat perbedaan kehidupan menurut Ajaran Buddha dalam kehidupan sehari-hari', 'MPL01', 'agm05', 'KLS05', 'SM01'),
('KTM0000000449', '3', '3.3', 'Memahami cara-cara berdana yang baik dan benar', 'MPL01', 'agm05', 'KLS05', 'SM01'),
('KTM0000000450', '4', '3.4', 'Memahami empat macam jalan kesuksesan dan empat macam teman sejati', 'MPL01', 'agm05', 'KLS05', 'SM01'),
('KTM0000000451', '1', '3.1', 'Memahami Guishen dalam arti Tian Yang Maha Roh serta adanya nyawa dan roh pada diri manusia', 'MPL01', 'agm06', 'KLS05', 'SM01'),
('KTM0000000452', '2', '3.2', 'Memahami pentingnya sembahyang kepada Tian', 'MPL01', 'agm06', 'KLS05', 'SM01'),
('KTM0000000453', '3', '3.3', 'Memahami makna sembahyang berkaitan dengan perubahan musim dan keharmonisan alam', 'MPL01', 'agm06', 'KLS05', 'SM01'),
('KTM0000000454', '4', '3.4', 'Memahami makna sembahyang kepada leluhur seperti sembahyang Tahun Baru, Zuji (wafat orang tua), Qingming, Zhong Yuan, dan Jing Heping', 'MPL01', 'agm06', 'KLS05', 'SM01'),
('KTM0000000455', '5', '3.5', 'Memahami silsilah keluarga dan marga', 'MPL01', 'agm06', 'KLS05', 'SM01'),
('KTM0000000456', '6', '3.6', 'Mengetahui sejarah suci dan karya-karya para Nabi dan Raja suci', 'MPL01', 'agm06', 'KLS05', 'SM01'),
('KTM0000000457', '1', '3.1', 'Memahami makna Q.S. at-T?n dan Q.S. al-M?’?n dengan baik dan tart?l', 'MPL01', 'agm01', 'KLS05', 'SM02'),
('KTM0000000458', '2', '3.2', 'Memahami makna al-Asmau al-Husna: Al-Mumit, Al-Hayy, Al-Qayyum, dan Al-Ahad', 'MPL01', 'agm01', 'KLS05', 'SM02'),
('KTM0000000459', '3', '3.3', 'Memahami nama-nama Rasul Allah dan Rasul Ulul ‘Azmi', 'MPL01', 'agm01', 'KLS05', 'SM02'),
('KTM0000000460', '4', '3.4', 'Memahami makna diturunkannya kitab-kitab suci melalui rasul-rasul-Nya sebagai implementasi rukun iman', 'MPL01', 'agm01', 'KLS05', 'SM02'),
('KTM0000000461', '5', '3.5', 'Memahami makna perilaku jujur dalam kehidupan sehai-hari', 'MPL01', 'agm01', 'KLS05', 'SM02'),
('KTM0000000462', '6', '3.6', 'Memahami makna hormat dan patuh kepada orangtua dan guru', 'MPL01', 'agm01', 'KLS05', 'SM02'),
('KTM0000000463', '7', '3.7', 'Memahami makna saling menghargai sesama manusia', 'MPL01', 'agm01', 'KLS05', 'SM02'),
('KTM0000000464', '8', '3.8', 'Memahami makna sederhana dalam kehidupan sehari-hari', 'MPL01', 'agm01', 'KLS05', 'SM02'),
('KTM0000000465', '9', '3.9', 'Memahami makna ikhlas beramal dalam kehidupan sehari-hari', 'MPL01', 'agm01', 'KLS05', 'SM02'),
('KTM0000000466', '10', '3.10', 'Memahami hikmah puasa Ramadan yang dapat membentuk akhlak mulia', 'MPL01', 'agm01', 'KLS05', 'SM02'),
('KTM0000000467', '11', '3.11', 'Memahami pelaksanaan salat tarawih dan tadarus al-Qur’an', 'MPL01', 'agm01', 'KLS05', 'SM02'),
('KTM0000000468', '12', '3.12', 'Memahami kisah keteladanan Nabi Dawud a.s.', 'MPL01', 'agm01', 'KLS05', 'SM02'),
('KTM0000000469', '13', '3.13', 'Memahami kisah keteladanan Nabi Sulaiman a.s.', 'MPL01', 'agm01', 'KLS05', 'SM02'),
('KTM0000000470', '14', '3.14', 'Memahami kisah keteladanan Nabi Ilyas a.s.', 'MPL01', 'agm01', 'KLS05', 'SM02'),
('KTM0000000471', '15', '3.15', 'Memahami kisah keteladanan Nabi Ilyasa’ a.s.', 'MPL01', 'agm01', 'KLS05', 'SM02'),
('KTM0000000472', '16', '3.16', 'Memahami kisah keteladanan Nabi Muhammad saw.', 'MPL01', 'agm01', 'KLS05', 'SM02'),
('KTM0000000473', '17', '3.17', 'Memahami kisah keteladanan Luqman sebagaimana terdapat dalam al-Qur’an', 'MPL01', 'agm01', 'KLS05', 'SM02'),
('KTM0000000474', '1', '3.1', 'Memahami bahwa semua manusia berdosa sehingga perlu bertobat', 'MPL01', 'agm02', 'KLS05', 'SM02'),
('KTM0000000475', '2', '3.2', 'Memahami karya penyelamatan Allah dalam Yesus Kristus', 'MPL01', 'agm02', 'KLS05', 'SM02'),
('KTM0000000476', '3', '3.3', 'Mengenal peran Roh Kudus dalam kehidupan orang yang sudah diselamatkan', 'MPL01', 'agm02', 'KLS05', 'SM02'),
('KTM0000000477', '4', '3.4', 'Menerapkan contoh cara hidup manusia baru yang sudah bertobat', 'MPL01', 'agm02', 'KLS05', 'SM02'),
('KTM0000000478', '1', '3.1', 'Memahami diri sebagai perempuan atau laki-laki seturut citra Allah', 'MPL01', 'agm03', 'KLS05', 'SM02'),
('KTM0000000479', '2', '3.2', 'Memahami lawan jenis sebagai partner yang dianugerahkan Allah untuk saling melengkapi', 'MPL01', 'agm03', 'KLS05', 'SM02'),
('KTM0000000480', '3', '3.3', 'Memahami karya keselamatan Allah yang dialami tokoh-tokoh Perjanjian Lama dalam kisah Daud, Salomo, dan Ester', 'MPL01', 'agm03', 'KLS05', 'SM02'),
('KTM0000000481', '4', '3.4', 'Memahami sengsara, wafat, dan kebangkitan Yesus sebagai puncak karya keselamatan Allah', 'MPL01', 'agm03', 'KLS05', 'SM02'),
('KTM0000000482', '5', '3.5', 'Memahami hidup baru dalam Roh Kudus yang terungkap melalui doa-doa', 'MPL01', 'agm03', 'KLS05', 'SM02'),
('KTM0000000483', '6', '3.6', 'Memahami karya Roh Kudus dalam kehidupan menggereja', 'MPL01', 'agm03', 'KLS05', 'SM02'),
('KTM0000000484', '7', '3.7', 'Memahami buah-buah Roh sebagai nilai yang sangat dibutuhkan demi pengembangan kehidupan dalam masyarakat', 'MPL01', 'agm03', 'KLS05', 'SM02'),
('KTM0000000485', '8', '3.8', 'Memahami nilai-nilai kejujuran dan keadilan dalam kehidupan bermasyarakat sebagai perwujudan karya Roh Kudus', 'MPL01', 'agm03', 'KLS05', 'SM02'),
('KTM0000000486', '1', '3.1', 'Memahami kitab suci Veda sebagai sumber hukum Hindu', 'MPL01', 'agm04', 'KLS05', 'SM02'),
('KTM0000000487', '2', '3.2', 'Mengenal ajaran Catur Marga Yoga dalam agama Hindu', 'MPL01', 'agm04', 'KLS05', 'SM02'),
('KTM0000000488', '3', '3.3', 'Memahami kemahakuasaan Sang Hyang Widhi sebagai Cadhu Sakti', 'MPL01', 'agm04', 'KLS05', 'SM02'),
('KTM0000000489', '4', '3.4', 'Mengenal ajaran Catur Guru yang patut dihormati', 'MPL01', 'agm04', 'KLS05', 'SM02'),
('KTM0000000490', '5', '3.5', 'Mengenal tempat-tempat suci dalam agama Hindu', 'MPL01', 'agm04', 'KLS05', 'SM02'),
('KTM0000000491', '1', '3.1', 'Memahami masa bertapa dan gangguan mara', 'MPL01', 'agm05', 'KLS05', 'SM02'),
('KTM0000000492', '2', '3.2', 'Memahami delapan kondisi duniawi dan hakikat perbedaan kehidupan menurut Ajaran Buddha dalam kehidupan sehari-hari', 'MPL01', 'agm05', 'KLS05', 'SM02'),
('KTM0000000493', '3', '3.3', 'Memahami cara-cara berdana yang baik dan benar', 'MPL01', 'agm05', 'KLS05', 'SM02'),
('KTM0000000494', '4', '3.4', 'Memahami empat macam jalan kesuksesan dan empat macam teman sejati', 'MPL01', 'agm05', 'KLS05', 'SM02'),
('KTM0000000495', '1', '3.1', 'Memahami Guishen dalam arti Tian Yang Maha Roh serta adanya nyawa dan roh pada diri manusia', 'MPL01', 'agm06', 'KLS05', 'SM02'),
('KTM0000000496', '2', '3.2', 'Memahami pentingnya sembahyang kepada Tian', 'MPL01', 'agm06', 'KLS05', 'SM02'),
('KTM0000000497', '3', '3.3', 'Memahami makna sembahyang berkaitan dengan perubahan musim dan keharmonisan alam', 'MPL01', 'agm06', 'KLS05', 'SM02'),
('KTM0000000498', '4', '3.4', 'Memahami makna sembahyang kepada leluhur seperti sembahyang Tahun Baru, Zuji (wafat orang tua), Qingming, Zhong Yuan, dan Jing Heping', 'MPL01', 'agm06', 'KLS05', 'SM02'),
('KTM0000000499', '5', '3.5', 'Memahami silsilah keluarga dan marga', 'MPL01', 'agm06', 'KLS05', 'SM02'),
('KTM0000000500', '6', '3.6', 'Mengetahui sejarah suci dan karya-karya para Nabi dan Raja suci', 'MPL01', 'agm06', 'KLS05', 'SM02'),
('KTM0000000501', '1', '3.1', 'memahami makna Q.S. Al-Kafirun, Q.S. Al-Maidah/5:2-3 dan Q.S. al-Hujurat/49:12-13 dengan benar', 'MPL01', 'agm01', 'KLS06', 'SM01'),
('KTM0000000502', '2', '3.2', 'memahami makna al-Asmau al-Husna: As-Samad, Al-Muqtadir, Al-Muqaddim, dan Al-Baqi', 'MPL01', 'agm01', 'KLS06', 'SM01'),
('KTM0000000503', '3', '3.3', 'memahami hikmah beriman kepada hari akhir yang dapat membentuk perilaku akhlak mulia', 'MPL01', 'agm01', 'KLS06', 'SM01'),
('KTM0000000504', '4', '3.4', 'memahami hikmah beriman kepada qadha dan qadar yang dapat membentuk perilaku akhlak mulia', 'MPL01', 'agm01', 'KLS06', 'SM01'),
('KTM0000000505', '5', '3.5', 'memahami perilaku hormat dan patuh kepada orangtua, guru, dan sesama anggota keluarga', 'MPL01', 'agm01', 'KLS06', 'SM01'),
('KTM0000000506', '6', '3.6', 'memahami sikap toleran dan simpatik terhadap sesama sebagai wujud dari pemahaman Q.S. al-Kafirun', 'MPL01', 'agm01', 'KLS06', 'SM01'),
('KTM0000000507', '7', '3.7', 'memahami hikmah zakat, infaq, dan sedekah sebagai implementasi rukun Islam', 'MPL01', 'agm01', 'KLS06', 'SM01'),
('KTM0000000508', '8', '3.8', 'memahami kisah keteladanan Nabi Yunus a.s.', 'MPL01', 'agm01', 'KLS06', 'SM01'),
('KTM0000000509', '9', '3.9', 'memahami kisah keteladanan Nabi Zakariya a.s.', 'MPL01', 'agm01', 'KLS06', 'SM01'),
('KTM0000000510', '10', '3.10', 'memahami kisah keteladanan Nabi Yahya a.s.', 'MPL01', 'agm01', 'KLS06', 'SM01'),
('KTM0000000511', '11', '3.11', 'memahami kisah keteladanan Nabi Isa a.s.', 'MPL01', 'agm01', 'KLS06', 'SM01'),
('KTM0000000512', '12', '3.12', 'memahami kisah Nabi Muhammad saw.', 'MPL01', 'agm01', 'KLS06', 'SM01'),
('KTM0000000513', '13', '3.13', 'memahami kisah keteladanan sahabat-sahabat Nabi Muhammad saw.', 'MPL01', 'agm01', 'KLS06', 'SM01'),
('KTM0000000514', '14', '3.14', 'memahami kisah keteladanan Ashabul Kahfi sebagaimana terdapat dalam al-Qur’an', 'MPL01', 'agm01', 'KLS06', 'SM01'),
('KTM0000000515', '1', '3.1', 'memahami makna ibadah yang berkenan kepada Allah', 'MPL01', 'agm02', 'KLS06', 'SM01'),
('KTM0000000516', '2', '3.2', 'memahami pentingnya menjalin hubungan akrab dengan Allah sebagai wujud ibadah', 'MPL01', 'agm02', 'KLS06', 'SM01'),
('KTM0000000517', '3', '3.3', 'menganalisis makna melayani sesama sebagai ibadah yang berkenan kepada Allah', 'MPL01', 'agm02', 'KLS06', 'SM01'),
('KTM0000000518', '4', '3.4', 'memahami seluruh hidupnya sebagai ibadah sejati kepada Allah', 'MPL01', 'agm02', 'KLS06', 'SM01'),
('KTM0000000519', '1', '3.1', 'memahami diri sebagai warga negara Indonesia yang beraneka ragam sebagai anugerah Allah', 'MPL01', 'agm03', 'KLS06', 'SM01'),
('KTM0000000520', '2', '3.2', 'memahami diri sebagai bagian warga dunia dan melibatkan diri dalam berbagai keprihatinan umat manusia', 'MPL01', 'agm03', 'KLS06', 'SM01'),
('KTM0000000521', '3', '3.3', 'memahami karya keselamatan Allah yang disampaikan melalui para nabi', 'MPL01', 'agm03', 'KLS06', 'SM01'),
('KTM0000000522', '4', '3.4', 'memahami karya keselamatan Allah melalui kata-kata, tindakan, dan pribadi Yesus Kristus', 'MPL01', 'agm03', 'KLS06', 'SM01'),
('KTM0000000523', '5', '3.5', 'memahami tugas dan sifat gereja', 'MPL01', 'agm03', 'KLS06', 'SM01'),
('KTM0000000524', '6', '3.6', 'memahami karya-karya pelayanan gereja sebagai perwujudan karya keselamatan Allah', 'MPL01', 'agm03', 'KLS06', 'SM01'),
('KTM0000000525', '7', '3.7', 'memahami ajaran gereja tentang hati nurani dalam menghadapi tantangan zaman', 'MPL01', 'agm03', 'KLS06', 'SM01'),
('KTM0000000526', '1', '3.1', 'memahami isi pokok Bhagavadgita sebagai tuntunan hidup', 'MPL01', 'agm04', 'KLS06', 'SM01'),
('KTM0000000527', '2', '3.2', 'memahami ajaran Panca Sraddha sebagai dasar meningkatkan keyakinan', 'MPL01', 'agm04', 'KLS06', 'SM01'),
('KTM0000000528', '3', '3.3', 'memahami ajaran Tattvam Asi dalam cerita Itihasa', 'MPL01', 'agm04', 'KLS06', 'SM01'),
('KTM0000000529', '4', '3.4', 'memahami ajaran Sad Ripu sebagai perilaku yang harus dihindari dalam kehidupan sehari-hari', 'MPL01', 'agm04', 'KLS06', 'SM01'),
('KTM0000000530', '5', '3.5', 'memahami ajaran Tri Rna sebagai hutang yang dibawa sejak lahir', 'MPL01', 'agm04', 'KLS06', 'SM01'),
('KTM0000000531', '1', '3.1', 'memahami keajaiban-keajaiban saat Petapa Gotama mencapai Penerangan Sempurna', 'MPL01', 'agm05', 'KLS06', 'SM01'),
('KTM0000000532', '2', '3.2', 'memahami Sepuluh Kesempurnaan (Dasa Paramita) dan kisah perumpamaan populer tentang perilaku bijaksana', 'MPL01', 'agm05', 'KLS06', 'SM01'),
('KTM0000000533', '3', '3.3', 'memahami cara meditasi pernafasan dan cinta kasih', 'MPL01', 'agm05', 'KLS06', 'SM01'),
('KTM0000000534', '4', '3.4', 'memahami tujuan akhir umat Buddha', 'MPL01', 'agm05', 'KLS06', 'SM01'),
('KTM0000000535', '1', '3.1', 'memahami karunia pemberian Tian dan karunia pemberian manusia', 'MPL01', 'agm06', 'KLS06', 'SM01'),
('KTM0000000536', '2', '3.2', 'memahami perilaku Yan Hui yang harus diteladani', 'MPL01', 'agm06', 'KLS06', 'SM01'),
('KTM0000000537', '3', '3.3', 'memahami hikmah dari hukum-hukum yang ada di alam semesta', 'MPL01', 'agm06', 'KLS06', 'SM01'),
('KTM0000000538', '4', '3.4', 'memahami perjuangan Matakin dalam memulihkan hak-hak sipil umat Khonghucu', 'MPL01', 'agm06', 'KLS06', 'SM01'),
('KTM0000000539', '5', '3.5', 'memahami nilai-nilai keteladanan Minshun', 'MPL01', 'agm06', 'KLS06', 'SM01'),
('KTM0000000540', '6', '3.6', 'menjelaskan nilai-nilai kebajikan dalam kisah perjalanan Zhisheng Kongzi sebagai Tianzhi Muduo', 'MPL01', 'agm06', 'KLS06', 'SM01'),
('KTM0000000541', '1', '3.1', 'memahami makna Q.S. Al-Kafirun, Q.S. Al-Maidah/5:2-3 dan Q.S. al-Hujurat/49:12-13 dengan benar', 'MPL01', 'agm01', 'KLS06', 'SM02'),
('KTM0000000542', '2', '3.2', 'memahami makna al-Asmau al-Husna: As-Samad, Al-Muqtadir, Al-Muqaddim, dan Al-Baqi', 'MPL01', 'agm01', 'KLS06', 'SM02'),
('KTM0000000543', '3', '3.3', 'memahami hikmah beriman kepada hari akhir yang dapat membentuk perilaku akhlak mulia', 'MPL01', 'agm01', 'KLS06', 'SM02'),
('KTM0000000544', '4', '3.4', 'memahami hikmah beriman kepada qadha dan qadar yang dapat membentuk perilaku akhlak mulia', 'MPL01', 'agm01', 'KLS06', 'SM02'),
('KTM0000000545', '5', '3.5', 'memahami perilaku hormat dan patuh kepada orangtua, guru, dan sesama anggota keluarga', 'MPL01', 'agm01', 'KLS06', 'SM02'),
('KTM0000000546', '6', '3.6', 'memahami sikap toleran dan simpatik terhadap sesama sebagai wujud dari pemahaman Q.S. al-Kafirun', 'MPL01', 'agm01', 'KLS06', 'SM02'),
('KTM0000000547', '7', '3.7', 'memahami hikmah zakat, infaq, dan sedekah sebagai implementasi rukun Islam', 'MPL01', 'agm01', 'KLS06', 'SM02'),
('KTM0000000548', '8', '3.8', 'memahami kisah keteladanan Nabi Yunus a.s.', 'MPL01', 'agm01', 'KLS06', 'SM02'),
('KTM0000000549', '9', '3.9', 'memahami kisah keteladanan Nabi Zakariya a.s.', 'MPL01', 'agm01', 'KLS06', 'SM02'),
('KTM0000000550', '10', '3.10', 'memahami kisah keteladanan Nabi Yahya a.s.', 'MPL01', 'agm01', 'KLS06', 'SM02'),
('KTM0000000551', '11', '3.11', 'memahami kisah keteladanan Nabi Isa a.s.', 'MPL01', 'agm01', 'KLS06', 'SM02'),
('KTM0000000552', '12', '3.12', 'memahami kisah Nabi Muhammad saw.', 'MPL01', 'agm01', 'KLS06', 'SM02'),
('KTM0000000553', '13', '3.13', 'memahami kisah keteladanan sahabat-sahabat Nabi Muhammad saw.', 'MPL01', 'agm01', 'KLS06', 'SM02'),
('KTM0000000554', '14', '3.14', 'memahami kisah keteladanan Ashabul Kahfi sebagaimana terdapat dalam al-Qur’an', 'MPL01', 'agm01', 'KLS06', 'SM02'),
('KTM0000000555', '1', '3.1', 'memahami makna ibadah yang berkenan kepada Allah', 'MPL01', 'agm02', 'KLS06', 'SM02'),
('KTM0000000556', '2', '3.2', 'memahami pentingnya menjalin hubungan akrab dengan Allah sebagai wujud ibadah', 'MPL01', 'agm02', 'KLS06', 'SM02'),
('KTM0000000557', '3', '3.3', 'menganalisis makna melayani sesama sebagai ibadah yang berkenan kepada Allah', 'MPL01', 'agm02', 'KLS06', 'SM02'),
('KTM0000000558', '4', '3.4', 'memahami seluruh hidupnya sebagai ibadah sejati kepada Allah', 'MPL01', 'agm02', 'KLS06', 'SM02'),
('KTM0000000559', '1', '3.1', 'memahami diri sebagai warga negara Indonesia yang beraneka ragam sebagai anugerah Allah', 'MPL01', 'agm03', 'KLS06', 'SM02'),
('KTM0000000560', '2', '3.2', 'memahami diri sebagai bagian warga dunia dan melibatkan diri dalam berbagai keprihatinan umat manusia', 'MPL01', 'agm03', 'KLS06', 'SM02'),
('KTM0000000561', '3', '3.3', 'memahami karya keselamatan Allah yang disampaikan melalui para nabi', 'MPL01', 'agm03', 'KLS06', 'SM02'),
('KTM0000000562', '4', '3.4', 'memahami karya keselamatan Allah melalui kata-kata, tindakan, dan pribadi Yesus Kristus', 'MPL01', 'agm03', 'KLS06', 'SM02'),
('KTM0000000563', '5', '3.5', 'memahami tugas dan sifat gereja', 'MPL01', 'agm03', 'KLS06', 'SM02'),
('KTM0000000564', '6', '3.6', 'memahami karya-karya pelayanan gereja sebagai perwujudan karya keselamatan Allah', 'MPL01', 'agm03', 'KLS06', 'SM02'),
('KTM0000000565', '7', '3.7', 'memahami ajaran gereja tentang hati nurani dalam menghadapi tantangan zaman', 'MPL01', 'agm03', 'KLS06', 'SM02'),
('KTM0000000566', '1', '3.1', 'memahami isi pokok Bhagavadgita sebagai tuntunan hidup', 'MPL01', 'agm04', 'KLS06', 'SM02'),
('KTM0000000567', '2', '3.2', 'memahami ajaran Panca Sraddha sebagai dasar meningkatkan keyakinan', 'MPL01', 'agm04', 'KLS06', 'SM02'),
('KTM0000000568', '3', '3.3', 'memahami ajaran Tattvam Asi dalam cerita Itihasa', 'MPL01', 'agm04', 'KLS06', 'SM02'),
('KTM0000000569', '4', '3.4', 'memahami ajaran Sad Ripu sebagai perilaku yang harus dihindari dalam kehidupan sehari-hari', 'MPL01', 'agm04', 'KLS06', 'SM02'),
('KTM0000000570', '5', '3.5', 'memahami ajaran Tri Rna sebagai hutang yang dibawa sejak lahir', 'MPL01', 'agm04', 'KLS06', 'SM02'),
('KTM0000000571', '1', '3.1', 'memahami keajaiban-keajaiban saat Petapa Gotama mencapai Penerangan Sempurna', 'MPL01', 'agm05', 'KLS06', 'SM02'),
('KTM0000000572', '2', '3.2', 'memahami Sepuluh Kesempurnaan (Dasa Paramita) dan kisah perumpamaan populer tentang perilaku bijaksana', 'MPL01', 'agm05', 'KLS06', 'SM02'),
('KTM0000000573', '3', '3.3', 'memahami cara meditasi pernafasan dan cinta kasih', 'MPL01', 'agm05', 'KLS06', 'SM02'),
('KTM0000000574', '4', '3.4', 'memahami tujuan akhir umat Buddha', 'MPL01', 'agm05', 'KLS06', 'SM02'),
('KTM0000000575', '1', '3.1', 'memahami karunia pemberian Tian dan karunia pemberian manusia', 'MPL01', 'agm06', 'KLS06', 'SM02'),
('KTM0000000576', '2', '3.2', 'memahami perilaku Yan Hui yang harus diteladani', 'MPL01', 'agm06', 'KLS06', 'SM02'),
('KTM0000000577', '3', '3.3', 'memahami hikmah dari hukum-hukum yang ada di alam semesta', 'MPL01', 'agm06', 'KLS06', 'SM02'),
('KTM0000000578', '4', '3.4', 'memahami perjuangan Matakin dalam memulihkan hak-hak sipil umat Khonghucu', 'MPL01', 'agm06', 'KLS06', 'SM02'),
('KTM0000000579', '5', '3.5', 'memahami nilai-nilai keteladanan Minshun', 'MPL01', 'agm06', 'KLS06', 'SM02'),
('KTM0000000580', '6', '3.6', 'menjelaskan nilai-nilai kebajikan dalam kisah perjalanan Zhisheng Kongzi sebagai Tianzhi Muduo', 'MPL01', 'agm06', 'KLS06', 'SM02');

--
-- Trigger `kd_agama_ki3`
--
DELIMITER $$
CREATE TRIGGER `kd_agmki3_berubah` AFTER UPDATE ON `kd_agama_ki3` FOR EACH ROW BEGIN
	UPDATE nilai_agamakd_ki3 SET nomor_kd = NEW.nomor_kd, deskripsi = NEW.deskripsi WHERE id_kd = OLD.id_kd;
    END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `kd_agama_ki4`
--

CREATE TABLE `kd_agama_ki4` (
  `id_kd` char(15) CHARACTER SET latin1 NOT NULL,
  `nom` varchar(25) CHARACTER SET latin1 NOT NULL,
  `nomor_kd` varchar(25) CHARACTER SET latin1 NOT NULL,
  `deskripsi` varchar(225) CHARACTER SET latin1 NOT NULL,
  `id_mapel` char(15) CHARACTER SET latin1 NOT NULL,
  `id_agama` char(15) CHARACTER SET latin1 NOT NULL,
  `id_kelas` char(15) CHARACTER SET latin1 NOT NULL,
  `id_semester` char(15) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `kd_agama_ki4`
--

INSERT INTO `kd_agama_ki4` (`id_kd`, `nom`, `nomor_kd`, `deskripsi`, `id_mapel`, `id_agama`, `id_kelas`, `id_semester`) VALUES
('KDA0000000001', '1', '4.1', 'melafalkan huruf-huruf hijaiyyah dan harakatnya secara lengkap', 'MPL01', 'agm01', 'KLS01', 'SM01'),
('KDA0000000002', '2', '4.2.1', 'melafalkan Q.S. al-Fatihah dan Q.S. al-Ikhlas dengan benar dan jelas ', 'MPL01', 'agm01', 'KLS01', 'SM01'),
('KDA0000000003', '3', '4.2.2', 'menunjukkan hafalan Q.S. alFatihah dan Q.S. al-Ikhlas dengan benar dan jelas ', 'MPL01', 'agm01', 'KLS01', 'SM01'),
('KDA0000000004', '4', '4.3', 'menunjukkan bukti-bukti adanya Allah Swt. yang Maha Pengasih dan Maha Penyayang', 'MPL01', 'agm01', 'KLS01', 'SM01'),
('KDA0000000005', '5', '4.4', 'menunjukkan bukti-bukti keesaan Allah Swt. berdasarkan pengamatan terhadap dirinya dan makhluk ciptaan-Nya yang dijumpai di sekitar rumah dan sekolah', 'MPL01', 'agm01', 'KLS01', 'SM01'),
('KDA0000000006', '6', '4.5', 'melafalkan al-Asmau al-Husna: ar-Rahman, ar-Rahim, danal-Malik', 'MPL01', 'agm01', 'KLS01', 'SM01'),
('KDA0000000007', '7', '4.6', 'melafalkan dua kalimat syahadat dengan benar dan jelas', 'MPL01', 'agm01', 'KLS01', 'SM01'),
('KDA0000000008', '8', '4.7', 'melafalkan doa sebelum dan sesudah belajar dengan benar dan jelas', 'MPL01', 'agm01', 'KLS01', 'SM01'),
('KDA0000000009', '9', '4.8', 'mencontohkan perilaku hormat dan patuh kepada orangtua dan guru', 'MPL01', 'agm01', 'KLS01', 'SM01'),
('KDA0000000010', '10', '4.9', 'mencontohkan cara berkata yang baik, sopan, dan santun', 'MPL01', 'agm01', 'KLS01', 'SM01'),
('KDA0000000011', '11', '4.10', 'mencontohkan perilaku bersyukur, pemaaf, jujur, dan percaya diri', 'MPL01', 'agm01', 'KLS01', 'SM01'),
('KDA0000000012', '12', '4.11', 'mempraktikkan tata cara bersuci', 'MPL01', 'agm01', 'KLS01', 'SM01'),
('KDA0000000013', '13', '4.12.1', 'melaksanakan salat dan kegiatan agama di sekitar rumahnya melalui pengamatan ', 'MPL01', 'agm01', 'KLS01', 'SM01'),
('KDA0000000014', '14', '4.12.2', 'mencontohkan kegiatan agama di sekitar rumahnya ', 'MPL01', 'agm01', 'KLS01', 'SM01'),
('KDA0000000015', '15', '4.13', 'menceritakan kisah keteladanan Nabi Adam a.s.', 'MPL01', 'agm01', 'KLS01', 'SM01'),
('KDA0000000016', '16', '4.14', 'menceritakan kisah keteladanan Nabi Idris a.s. ', 'MPL01', 'agm01', 'KLS01', 'SM01'),
('KDA0000000017', '17', '4.15', 'menceritakan kisah keteladanan Nabi Nuh a.s. ', 'MPL01', 'agm01', 'KLS01', 'SM01'),
('KDA0000000018', '18', '4.16', 'menceritakan kisah keteladanan Nabi Hud a.s. ', 'MPL01', 'agm01', 'KLS01', 'SM01'),
('KDA0000000019', '19', '4.17', 'menceritakan kisah keteladanan Nabi Muhammad saw. ', 'MPL01', 'agm01', 'KLS01', 'SM01'),
('KDA0000000020', '1', '4.1', 'membuat karya sederhana yang menunjukkan bertanggung jawab terhadap dirinya sebagai ciptaan Allah', 'MPL01', 'agm02', 'KLS01', 'SM01'),
('KDA0000000021', '2', '4.2', 'menyajikan karya berkaitan dangan anggota tubuhnya sebagai ciptaan Allah', 'MPL01', 'agm02', 'KLS01', 'SM01'),
('KDA0000000022', '3', '4.3', ' membuat proyek sederhana yang berkaitan dengan sikap mengasihi keluarga dan teman', 'MPL01', 'agm02', 'KLS01', 'SM01'),
('KDA0000000023', '4', '4.4', 'melakukan tindakan sederhana dalam memelihara alam ciptaan Allah', 'MPL01', 'agm02', 'KLS01', 'SM01'),
('KDA0000000024', '1', '4.1', 'melakukan aktivitas (misalnya mengucapkan doa/berpuisi/bernyanyi) yang mengungkapkan rasa bangga dan syukur atas anugerah dirinya yang khas', 'MPL01', 'agm03', 'KLS01', 'SM01'),
('KDA0000000025', '2', '4.2', 'melakukan aktivitas (misalnya merawat anggota tubuh/menggambar/mewarnai/ menghias gambar anggota tubuh) sebagai ungkapan syukur kepada Allah atas anugerah anggota tubuh', 'MPL01', 'agm03', 'KLS01', 'SM01'),
('KDA0000000026', '3', '4.3', 'melakukan aktivitas (misalnya terlibat dalam tugas-tugas di dalam keluarga, memelihara lingkungan rumah) sebagai tempat bertumbuh dan berkembang', 'MPL01', 'agm03', 'KLS01', 'SM01'),
('KDA0000000027', '4', '4.4', 'melakukan aktivitas (misalnya melaksanakan tugas dari guru, memelihara lingkungan sekolah) sebagai tempat bertumbuh dan berkembang', 'MPL01', 'agm03', 'KLS01', 'SM01'),
('KDA0000000028', '5', '4.5', 'melakukan aktivitas (misalnya menggambar/mewarnai/membuat mozaik) tentang ciptaan Allah', 'MPL01', 'agm03', 'KLS01', 'SM01'),
('KDA0000000029', '6', '4.6', 'melakukan perbuatan kasih sebagai wujud pewartaan kabar gembira tentang kelahiran Yesus', 'MPL01', 'agm03', 'KLS01', 'SM01'),
('KDA0000000030', '7', '4.7', 'melakukan aktivitas (misalnya mempraktikkan/menghias doa harian) sebagai ungkapan iman kepada Allah', 'MPL01', 'agm03', 'KLS01', 'SM01'),
('KDA0000000031', '8', '4.8', 'melakukan aktivitas (misalnya mempraktikkan/mewarnai gambar)', 'MPL01', 'agm03', 'KLS01', 'SM01'),
('KDA0000000032', '1', '4.1', 'menyajikan contoh-contoh ciptaan Sang Hyang Widhi dan karya manusia', 'MPL01', 'agm04', 'KLS01', 'SM01'),
('KDA0000000033', '2', '4.2', 'menyajikan hasil pengamatan tentang makhluk hidup yang memiliki Eka Pramana, Dwi Pramana, dan Tri Pramana', 'MPL01', 'agm04', 'KLS01', 'SM01'),
('KDA0000000034', '3', '4.3', 'menjalankan perilaku masing-masing bagian Tri Kaya Parisudha', 'MPL01', 'agm04', 'KLS01', 'SM01'),
('KDA0000000035', '4', '4.4', 'menyajikan perbedaan antara kitab suci Veda dengan buku biasa', 'MPL01', 'agm04', 'KLS01', 'SM01'),
('KDA0000000036', '5', '4.5', 'menyanyikan Dharmagita atau lagu kerohanian Hindu', 'MPL01', 'agm04', 'KLS01', 'SM01'),
('KDA0000000037', '6', '4.6', 'mendemonstrasikan pengucapan mantra guru, gayatri mantra, mantra makan, mantra Saraswati, dan doa tidur', 'MPL01', 'agm04', 'KLS01', 'SM01'),
('KDA0000000038', '7', '4.7', ' menceritakan secara singkat sejarah perkembangan agama Hindu pada abad I di Indonesia', 'MPL01', 'agm04', 'KLS01', 'SM01'),
('KDA0000000039', '1', '4.1', 'menyajikan cara-cara menghormat, salam, dan simbol-simbol agama Buddha', 'MPL01', 'agm05', 'KLS01', 'SM01'),
('KDA0000000040', '2', '4.2', 'melaksanakan doa sebelum dan sesudah melakukan kegiatan sehari-hari', 'MPL01', 'agm05', 'KLS01', 'SM01'),
('KDA0000000041', '3', '4.3', 'menyajikan pengetahuan faktual tentang tempat ibadah, rohaniawan, kitab suci, peristiwa hari raya dan Guru Agung agama Buddha', 'MPL01', 'agm05', 'KLS01', 'SM01'),
('KDA0000000042', '4', '4.4', 'menyajikan silsilah keluarga sendiri dan keluarga Pangeran Siddharta', 'MPL01', 'agm05', 'KLS01', 'SM01'),
('KDA0000000043', '1', '4.1', 'merawat tubuh pemberian orang tua dan berlatih menjaga keinginan (tidak makan berlebihan, dsb.)', 'MPL01', 'agm06', 'KLS01', 'SM01'),
('KDA0000000044', '2', '4.2', 'mempraktikkan doa sederhana dan bersembahyang pagi-sore kepada Tian pagi-sore', 'MPL01', 'agm06', 'KLS01', 'SM01'),
('KDA0000000045', '3', '4.3', 'mempraktikkan cara makan yang baik (mengucap syukur, makan secukupnya, tidak berlebihan; makan empat sehat lima sempurna; makan pada waktunya, makan tidakbersuara) dan membuang sampah pada tempatnya', 'MPL01', 'agm06', 'KLS01', 'SM01'),
('KDA0000000046', '4', '4.4', 'menceritakan hubungan kemasyarakatan serta sikap di dalam kemasyarakatan, keluarga, dan sekolah (mengucap salam sebelum masuk rumah; ijin kepada orang tua ketika hendak pergi dari rumah; segera menyahut ketika dipanggil orang', 'MPL01', 'agm06', 'KLS01', 'SM01'),
('KDA0000000047', '5', '4.5', 'belajar hidup mandiri (membereskan tempat tidur, meletakkan tas, dan sepatu pada tempatnya; belajar mandi dan gosok gigi sendiri, memakai baju sendiri, makan sendiri).', 'MPL01', 'agm06', 'KLS01', 'SM01'),
('KDA0000000049', '1', '4.1', 'melafalkan huruf-huruf hijaiyyah dan harakatnya secara lengkap', 'MPL01', 'agm01', 'KLS01', 'SM02'),
('KDA0000000050', '2', '4.2.1', 'melafalkan Q.S. al-Fatihah dan Q.S. al-Ikhlas dengan benar dan jelas ', 'MPL01', 'agm01', 'KLS01', 'SM02'),
('KDA0000000051', '3', '4.2.2', 'menunjukkan hafalan Q.S. alFatihah dan Q.S. al-Ikhlas dengan benar dan jelas ', 'MPL01', 'agm01', 'KLS01', 'SM02'),
('KDA0000000052', '4', '4.3', 'menunjukkan bukti-bukti adanya Allah Swt. yang Maha Pengasih dan Maha Penyayang', 'MPL01', 'agm01', 'KLS01', 'SM02'),
('KDA0000000053', '5', '4.4', 'menunjukkan bukti-bukti keesaan Allah Swt. berdasarkan pengamatan terhadap dirinya dan makhluk ciptaan-Nya yang dijumpai di sekitar rumah dan sekolah', 'MPL01', 'agm01', 'KLS01', 'SM02'),
('KDA0000000054', '6', '4.5', 'melafalkan al-Asmau al-Husna: ar-Rahman, ar-Rahim, danal-Malik', 'MPL01', 'agm01', 'KLS01', 'SM02'),
('KDA0000000055', '7', '4.6', 'melafalkan dua kalimat syahadat dengan benar dan jelas', 'MPL01', 'agm01', 'KLS01', 'SM02'),
('KDA0000000056', '8', '4.7', 'melafalkan doa sebelum dan sesudah belajar dengan benar dan jelas', 'MPL01', 'agm01', 'KLS01', 'SM02'),
('KDA0000000057', '9', '4.8', 'mencontohkan perilaku hormat dan patuh kepada orangtua dan guru', 'MPL01', 'agm01', 'KLS01', 'SM02'),
('KDA0000000058', '10', '4.9', 'mencontohkan cara berkata yang baik, sopan, dan santun', 'MPL01', 'agm01', 'KLS01', 'SM02'),
('KDA0000000059', '11', '4.10', 'mencontohkan perilaku bersyukur, pemaaf, jujur, dan percaya diri', 'MPL01', 'agm01', 'KLS01', 'SM02'),
('KDA0000000060', '12', '4.11', 'mempraktikkan tata cara bersuci', 'MPL01', 'agm01', 'KLS01', 'SM02'),
('KDA0000000061', '13', '4.12.1', 'melaksanakan salat dan kegiatan agama di sekitar rumahnya melalui pengamatan ', 'MPL01', 'agm01', 'KLS01', 'SM02'),
('KDA0000000062', '14', '4.12.2', 'mencontohkan kegiatan agama di sekitar rumahnya ', 'MPL01', 'agm01', 'KLS01', 'SM02'),
('KDA0000000063', '15', '4.13', 'menceritakan kisah keteladanan Nabi Adam a.s.', 'MPL01', 'agm01', 'KLS01', 'SM02'),
('KDA0000000064', '16', '4.14', 'menceritakan kisah keteladanan Nabi Idris a.s. ', 'MPL01', 'agm01', 'KLS01', 'SM02'),
('KDA0000000065', '17', '4.15', 'menceritakan kisah keteladanan Nabi Nuh a.s. ', 'MPL01', 'agm01', 'KLS01', 'SM02'),
('KDA0000000066', '18', '4.16', 'menceritakan kisah keteladanan Nabi Hud a.s. ', 'MPL01', 'agm01', 'KLS01', 'SM02'),
('KDA0000000067', '19', '4.17', 'menceritakan kisah keteladanan Nabi Muhammad saw. ', 'MPL01', 'agm01', 'KLS01', 'SM02'),
('KDA0000000068', '1', '4.1', 'membuat karya sederhana yang menunjukkan bertanggung jawab terhadap dirinya sebagai ciptaan Allah', 'MPL01', 'agm02', 'KLS01', 'SM02'),
('KDA0000000069', '2', '4.2', 'menyajikan karya berkaitan dangan anggota tubuhnya sebagai ciptaan Allah', 'MPL01', 'agm02', 'KLS01', 'SM02'),
('KDA0000000070', '3', '4.3', 'membuat proyek sederhana yang berkaitan dengan sikap mengasihi keluarga dan teman', 'MPL01', 'agm02', 'KLS01', 'SM02'),
('KDA0000000071', '4', '4.4', 'melakukan tindakan sederhana dalam memelihara alam ciptaan Allah', 'MPL01', 'agm02', 'KLS01', 'SM02'),
('KDA0000000072', '1', '4.1', 'melakukan aktivitas (misalnya mengucapkan doa/berpuisi/bernyanyi) yang mengungkapkan rasa bangga dan syukur atas anugerah dirinya yang khas', 'MPL01', 'agm03', 'KLS01', 'SM02'),
('KDA0000000073', '2', '4.2', 'melakukan aktivitas (misalnya merawat anggota tubuh/menggambar/mewarnai/ menghias gambar anggota tubuh) sebagai ungkapan syukur kepada Allah atas anugerah anggota tubuh', 'MPL01', 'agm03', 'KLS01', 'SM02'),
('KDA0000000074', '3', '4.3', 'melakukan aktivitas (misalnya terlibat dalam tugas-tugas di dalam keluarga, memelihara lingkungan rumah) sebagai tempat bertumbuh dan berkembang', 'MPL01', 'agm03', 'KLS01', 'SM02'),
('KDA0000000075', '4', '4.4', 'melakukan aktivitas (misalnya melaksanakan tugas dari guru, memelihara lingkungan sekolah) sebagai tempat bertumbuh dan berkembang', 'MPL01', 'agm03', 'KLS01', 'SM02'),
('KDA0000000076', '5', '4.5', 'melakukan aktivitas (misalnya menggambar/mewarnai/membuat mozaik) tentang ciptaan Allah', 'MPL01', 'agm03', 'KLS01', 'SM02'),
('KDA0000000077', '6', '4.6', 'melakukan perbuatan kasih sebagai wujud pewartaan kabar gembira tentang kelahiran Yesus', 'MPL01', 'agm03', 'KLS01', 'SM02'),
('KDA0000000078', '7', '4.7', 'melakukan aktivitas (misalnya mempraktikkan/menghias doa harian) sebagai ungkapan iman kepada Allah', 'MPL01', 'agm03', 'KLS01', 'SM02'),
('KDA0000000079', '8', '4.8', 'melakukan aktivitas (misalnya mempraktikkan/mewarnai gambar)', 'MPL01', 'agm03', 'KLS01', 'SM02'),
('KDA0000000080', '1', '4.1', 'menyajikan contoh-contoh ciptaan Sang Hyang Widhi dan karya manusia', 'MPL01', 'agm04', 'KLS01', 'SM02'),
('KDA0000000081', '2', '4.2', 'menyajikan hasil pengamatan tentang makhluk hidup yang memiliki Eka Pramana, Dwi Pramana, dan Tri Pramana', 'MPL01', 'agm04', 'KLS01', 'SM02'),
('KDA0000000082', '3', '4.3', 'menjalankan perilaku masing-masing bagian Tri Kaya Parisudha', 'MPL01', 'agm04', 'KLS01', 'SM02'),
('KDA0000000083', '4', '4.4', 'menyajikan perbedaan antara kitab suci Veda dengan buku biasa', 'MPL01', 'agm04', 'KLS01', 'SM02'),
('KDA0000000084', '5', '4.5', 'menyanyikan Dharmagita atau lagu kerohanian Hindu', 'MPL01', 'agm04', 'KLS01', 'SM02'),
('KDA0000000085', '6', '4.6', 'mendemonstrasikan pengucapan mantra guru, gayatri mantra, mantra makan, mantra Saraswati, dan doa tidur', 'MPL01', 'agm04', 'KLS01', 'SM02'),
('KDA0000000086', '7', '4.7', 'menceritakan secara singkat sejarah perkembangan agama Hindu pada abad I di Indonesia', 'MPL01', 'agm04', 'KLS01', 'SM02'),
('KDA0000000087', '1', '4.1', 'menyajikan cara-cara menghormat, salam, dan simbol-simbol agama Buddha', 'MPL01', 'agm05', 'KLS01', 'SM02'),
('KDA0000000088', '2', '4.2', 'melaksanakan doa sebelum dan sesudah melakukan kegiatan sehari-hari', 'MPL01', 'agm05', 'KLS01', 'SM02'),
('KDA0000000089', '3', '4.3', 'menyajikan pengetahuan faktual tentang tempat ibadah, rohaniawan, kitab suci, peristiwa hari raya dan Guru Agung agama Buddha', 'MPL01', 'agm05', 'KLS01', 'SM02'),
('KDA0000000090', '4', '4.4', 'menyajikan silsilah keluarga sendiri dan keluarga Pangeran Siddharta', 'MPL01', 'agm05', 'KLS01', 'SM02'),
('KDA0000000091', '1', '4.1', 'merawat tubuh pemberian orang tua dan berlatih menjaga keinginan (tidak makan berlebihan, dsb.)', 'MPL01', 'agm06', 'KLS01', 'SM02'),
('KDA0000000092', '2', '4.2', 'mempraktikkan doa sederhana dan bersembahyang pagi-sore kepada Tian pagi-sore', 'MPL01', 'agm06', 'KLS01', 'SM02'),
('KDA0000000093', '3', '4.3', 'mempraktikkan cara makan yang baik (mengucap syukur, makan secukupnya, tidak berlebihan; makan empat sehat lima sempurna; makan pada waktunya, makan tidakbersuara) dan membuang sampah pada tempatnya', 'MPL01', 'agm06', 'KLS01', 'SM02'),
('KDA0000000094', '4', '4.4', 'menceritakan hubungan kemasyarakatan serta sikap di dalam kemasyarakatan, keluarga, dan sekolah (mengucap salam sebelum masuk rumah; ijin kepada orang tua ketika hendak pergi dari rumah; segera menyahut ketika dipanggil orang', 'MPL01', 'agm06', 'KLS01', 'SM02'),
('KDA0000000095', '5', '4.5', 'belajar hidup mandiri (membereskan tempat tidur, meletakkan tas, dan sepatu pada tempatnya; belajar mandi dan gosok gigi sendiri, memakai baju sendiri, makan sendiri).', 'MPL01', 'agm06', 'KLS01', 'SM02'),
('KDA0000000096', '6', '4.6', 'rajin belajar dan bersembahyang seperti teladan zhisheng Kongzi semasa kecil', 'MPL01', 'agm06', 'KLS01', 'SM02'),
('KDA0000000097', '1', '4.1', 'Melafalkan huruf hijaiyyah bersambung sesuai dengan makharijul huruf', 'MPL01', 'agm01', 'KLS02', 'SM01'),
('KDA0000000098', '2', '4.2.1', 'Melafalkan Q.S. an-Nas dan Q.S. al-‘Asr dengan benar dan jelas', 'MPL01', 'agm01', 'KLS02', 'SM01'),
('KDA0000000099', '3', '4.2.2', 'Menunjukkan hafalan Q.S. an-Nas dan Q.S. al-‘Asr dengan benar dan jelas', 'MPL01', 'agm01', 'KLS02', 'SM01'),
('KDA0000000100', '4', '4.3', 'Menunjukkan perilaku rajin belajar sebagai implementasi pemahaman makna Hadis yang terkait dengan anjuran menuntut ilmu', 'MPL01', 'agm01', 'KLS02', 'SM01'),
('KDA0000000101', '5', '4.4', 'Menunjukkan perilaku hidup bersih dan sehat sebagai implementasi pemahaman makna Hadis tentang kebersihan dan kesehatan', 'MPL01', 'agm01', 'KLS02', 'SM01'),
('KDA0000000102', '6', '4.5', 'Melafalkan al-Asmau al-Husna: al-Quddus, as-Salam, dan al-Khaliq', 'MPL01', 'agm01', 'KLS02', 'SM01'),
('KDA0000000103', '7', '4.6', 'Melafalkan doa sebelum dan sesudah makan', 'MPL01', 'agm01', 'KLS02', 'SM01'),
('KDA0000000104', '8', '4.7', 'Mencontohkan perilaku kasih sayang kepada sesama', 'MPL01', 'agm01', 'KLS02', 'SM01'),
('KDA0000000105', '9', '4.8', 'Mencontohkan sikap kerja sama dan saling tolong menolong', 'MPL01', 'agm01', 'KLS02', 'SM01'),
('KDA0000000106', '10', '4.9', 'Mempraktikkan wudu dan doanya dengan tertib dan benar', 'MPL01', 'agm01', 'KLS02', 'SM01'),
('KDA0000000107', '11', '4.10', 'Mempraktikkan salat dengan tata cara dan bacaan yang benar', 'MPL01', 'agm01', 'KLS02', 'SM01'),
('KDA0000000108', '12', '4.11', 'Menceritakan kisah keteladanan Nabi Saleh a.s.', 'MPL01', 'agm01', 'KLS02', 'SM01'),
('KDA0000000109', '13', '4.12', 'Menceritakan kisah keteladanan Nabi Lut a.s.', 'MPL01', 'agm01', 'KLS02', 'SM01'),
('KDA0000000110', '14', '4.13', 'Menceritakan kisah keteladanan Nabi Ishaq a.s.', 'MPL01', 'agm01', 'KLS02', 'SM01'),
('KDA0000000111', '15', '4.14', 'Menceritakan kisah keteladanan Nabi Ya’qub a.s.', 'MPL01', 'agm01', 'KLS02', 'SM01'),
('KDA0000000112', '16', '4.15', 'Menceritakan kisah keteladanan Nabi Muhammad saw.', 'MPL01', 'agm01', 'KLS02', 'SM01'),
('KDA0000000113', '1', '4.1', 'Mempraktikkan sikap hormat kepada orang tua dan orang yang lebih tua', 'MPL01', 'agm02', 'KLS02', 'SM01'),
('KDA0000000114', '2', '4.2', 'Mempraktikkan tanggung jawab dalam keluarga melalui tindakan sederhana sesuai usianya', 'MPL01', 'agm02', 'KLS02', 'SM01'),
('KDA0000000115', '3', '4.3', 'Menyajikan cara menjaga dan menerapkan hidup rukun di sekolah dan di lingkungannya', 'MPL01', 'agm02', 'KLS02', 'SM01'),
('KDA0000000116', '4', '4.4', 'Menerapkan perilaku disiplin di sekolah, rumah, dan lingkungan sekitar', 'MPL01', 'agm02', 'KLS02', 'SM01'),
('KDA0000000117', '1', '4.1', 'Melakukan aktivitas (misalnya membantu keluarga/membuat karya seni/dan sebagainya) sebagai ungkapan syukur atas peran keluarga dalam mengembangkan dirinya', 'MPL01', 'agm03', 'KLS02', 'SM01'),
('KDA0000000118', '2', '4.2', 'Melakukan aktivitas (misalnya menyusun doa untuk teman, membuat puisi untuk teman, dsb) yang menunjukkan rasa syukur atas peran teman', 'MPL01', 'agm03', 'KLS02', 'SM01'),
('KDA0000000119', '3', '4.3', 'Melakukan aktivitas (misalnya menceritakan kembali, bermain peran, dsb) seperti dalam kisah Perjanjian Lama', 'MPL01', 'agm03', 'KLS02', 'SM01'),
('KDA0000000120', '4', '4.4', 'Melakukan aktivitas (misalnya menceritakan kembali, bermain peran, dsb) seperti yang dikisahkan dalam karya keselamatan Allah pada Perjanjian Baru', 'MPL01', 'agm03', 'KLS02', 'SM01'),
('KDA0000000121', '5', '4.5', 'Melakukan aktivitas (misalnya menyusun doa, membuat puisi, menyanyikan lagu) sebagai ungkapan iman kepada Allah', 'MPL01', 'agm03', 'KLS02', 'SM01'),
('KDA0000000122', '6', '4.6', 'Melakukan aktivitas (misalnya mempraktikkan/menghias doa) yang menunjukkan pemahaman akan makna dan macam-macam doa', 'MPL01', 'agm03', 'KLS02', 'SM01'),
('KDA0000000123', '7', '4.7', 'Melakukan aktivitas dengan melibatkan diri dalam kegiatan lingkungan sosial masyarakat/komunitas basis untuk mendukung pertumbuhan dan perkembangan dirinya', 'MPL01', 'agm03', 'KLS02', 'SM01'),
('KDA0000000124', '8', '4.8', 'Melakukan aktivitas (misalnya menceritakan pengalaman hidup rukun dengan tetangga, membuat doa permohonan dengan tema kerukunan dalam persaudaraan sejati) dalam usaha menjaga kehidupan yang rukun dengan tetangga sebagai perwu', 'MPL01', 'agm03', 'KLS02', 'SM01'),
('KDA0000000125', '1', '4.1', 'Mengilustrasikan Atma sebagai sumber hidup bagi makhluk hidup', 'MPL01', 'agm04', 'KLS02', 'SM01'),
('KDA0000000126', '2', '4.2', 'Menyajikan contoh sujud bhakti kehadapan Sang Hyang Widhi dalam wujud Tri Murti', 'MPL01', 'agm04', 'KLS02', 'SM01'),
('KDA0000000127', '3', '4.3', 'Menyajikan cara menghindari perilaku Tri Mala dalam kehidupan sehari-hari', 'MPL01', 'agm04', 'KLS02', 'SM01'),
('KDA0000000128', '4', '4.4', 'Menerapkan ajaran Catur Paramitha dalam rangka mengharmonisasi kehidupan umat manusia', 'MPL01', 'agm04', 'KLS02', 'SM01'),
('KDA0000000129', '5', '4.5', 'Menceritakan tokoh-tokoh Ramayana yang berperilaku Dharma dan Adharma', 'MPL01', 'agm04', 'KLS02', 'SM01'),
('KDA0000000130', '6', '4.6', 'Menceritakan secara singkat sejarah perkembangan agama Hindu di daerah setempat', 'MPL01', 'agm04', 'KLS02', 'SM01'),
('KDA0000000131', '1', '4.1', 'Menceritakan kembali peristiwa kelahiran dan masa kanak-kanak Pangeran Siddharta', 'MPL01', 'agm05', 'KLS02', 'SM01'),
('KDA0000000132', '1', '4.2', 'Menyajikan pengetahuan faktual kisah kasih sayang, kejujuran, dan persahabatan', 'MPL01', 'agm05', 'KLS02', 'SM01'),
('KDA0000000133', '1', '4.3', 'Menjalankan macam-macam peraturan dalam keluarga dan sekolah', 'MPL01', 'agm05', 'KLS02', 'SM01'),
('KDA0000000134', '1', '4.4', 'Melaksanakan perbuatan baik dan menghindari perbuatan buruk', 'MPL01', 'agm05', 'KLS02', 'SM01'),
('KDA0000000135', '1', '4.1', 'Menceritakan pengalaman pribadi terkait emosi dan kebaikan (guru memandu untuk mendapatkan hikmah dari pengalaman tersebut)', 'MPL01', 'agm06', 'KLS02', 'SM01'),
('KDA0000000136', '2', '4.2', 'Mempraktikkan doa syukur dan jingzuo', 'MPL01', 'agm06', 'KLS02', 'SM01'),
('KDA0000000137', '3', '4.3', 'Menceritakan cara menjaga dan merawat benda-benda ciptaan Tian dan manusia', 'MPL01', 'agm06', 'KLS02', 'SM01'),
('KDA0000000138', '4', '4.4', 'Menceritakan pengalaman keharmonisan dalam keluarga', 'MPL01', 'agm06', 'KLS02', 'SM01'),
('KDA0000000139', '5', '4.5', 'Menuliskan pengalaman membantu orang tua di rumah sebagai wujud rasa bakti', 'MPL01', 'agm06', 'KLS02', 'SM01'),
('KDA0000000140', '6', '4.6', 'Membuat catatan harian tentang mawas diri dan memperbaiki kesalahan', 'MPL01', 'agm06', 'KLS02', 'SM01'),
('KDA0000000141', '1', '4.1', 'Melafalkan huruf hijaiyyah bersambung sesuai dengan makharijul huruf', 'MPL01', 'agm01', 'KLS02', 'SM02'),
('KDA0000000142', '2', '4.2.1', 'Melafalkan Q.S. an-Nas dan Q.S. al-‘Asr dengan benar dan jelas', 'MPL01', 'agm01', 'KLS02', 'SM02'),
('KDA0000000143', '3', '4.2.2', 'Menunjukkan hafalan Q.S. an-Nas dan Q.S. al-‘Asr dengan benar dan jelas', 'MPL01', 'agm01', 'KLS02', 'SM02'),
('KDA0000000144', '4', '4.3', 'Menunjukkan perilaku rajin belajar sebagai implementasi pemahaman makna Hadis yang terkait dengan anjuran menuntut ilmu', 'MPL01', 'agm01', 'KLS02', 'SM02'),
('KDA0000000145', '5', '4.4', 'Menunjukkan perilaku hidup bersih dan sehat sebagai implementasi pemahaman makna Hadis tentang kebersihan dan kesehatan', 'MPL01', 'agm01', 'KLS02', 'SM02'),
('KDA0000000146', '6', '4.5', 'Melafalkan al-Asmau al-Husna: al-Quddus, as-Salam, dan al-Khaliq', 'MPL01', 'agm01', 'KLS02', 'SM02'),
('KDA0000000147', '7', '4.6', 'Melafalkan doa sebelum dan sesudah makan', 'MPL01', 'agm01', 'KLS02', 'SM02'),
('KDA0000000148', '8', '4.7', 'Mencontohkan perilaku kasih sayang kepada sesama', 'MPL01', 'agm01', 'KLS02', 'SM02'),
('KDA0000000149', '9', '4.8', 'Mencontohkan sikap kerja sama dan saling tolong menolong', 'MPL01', 'agm01', 'KLS02', 'SM02'),
('KDA0000000150', '10', '4.9', 'Mempraktikkan wudu dan doanya dengan tertib dan benar', 'MPL01', 'agm01', 'KLS02', 'SM02'),
('KDA0000000151', '11', '4.10', 'Mempraktikkan salat dengan tata cara dan bacaan yang benar', 'MPL01', 'agm01', 'KLS02', 'SM02'),
('KDA0000000152', '12', '4.11', 'Menceritakan kisah keteladanan Nabi Saleh a.s.', 'MPL01', 'agm01', 'KLS02', 'SM02'),
('KDA0000000153', '13', '4.12', 'Menceritakan kisah keteladanan Nabi Lut a.s.', 'MPL01', 'agm01', 'KLS02', 'SM02'),
('KDA0000000154', '14', '4.13', 'Menceritakan kisah keteladanan Nabi Ishaq a.s.', 'MPL01', 'agm01', 'KLS02', 'SM02'),
('KDA0000000155', '15', '4.14', 'Menceritakan kisah keteladanan Nabi Ya’qub a.s.', 'MPL01', 'agm01', 'KLS02', 'SM02'),
('KDA0000000156', '16', '4.15', 'Menceritakan kisah keteladanan Nabi Muhammad saw.', 'MPL01', 'agm01', 'KLS02', 'SM02'),
('KDA0000000157', '1', '4.1', 'Mempraktikkan sikap hormat kepada orang tua dan orang yang lebih tua', 'MPL01', 'agm02', 'KLS02', 'SM02'),
('KDA0000000158', '2', '4.2', 'Mempraktikkan tanggung jawab dalam keluarga melalui tindakan sederhana sesuai usianya', 'MPL01', 'agm02', 'KLS02', 'SM02'),
('KDA0000000159', '3', '4.3', 'Menyajikan cara menjaga dan menerapkan hidup rukun di sekolah dan di lingkungannya', 'MPL01', 'agm02', 'KLS02', 'SM02'),
('KDA0000000160', '4', '4.4', 'Menerapkan perilaku disiplin di sekolah, rumah, dan lingkungan sekitar', 'MPL01', 'agm02', 'KLS02', 'SM02'),
('KDA0000000161', '1', '4.1', 'Melakukan aktivitas (misalnya membantu keluarga/membuat karya seni/dan sebagainya) sebagai ungkapan syukur atas peran keluarga dalam mengembangkan dirinya', 'MPL01', 'agm03', 'KLS02', 'SM02'),
('KDA0000000162', '2', '4.2', 'Melakukan aktivitas (misalnya menyusun doa untuk teman, membuat puisi untuk teman, dsb) yang menunjukkan rasa syukur atas peran teman', 'MPL01', 'agm03', 'KLS02', 'SM02'),
('KDA0000000163', '3', '4.3', 'Melakukan aktivitas (misalnya menceritakan kembali, bermain peran, dsb) seperti dalam kisah Perjanjian Lama', 'MPL01', 'agm03', 'KLS02', 'SM02'),
('KDA0000000164', '4', '4.4', 'Melakukan aktivitas (misalnya menceritakan kembali, bermain peran, dsb) seperti yang dikisahkan dalam karya keselamatan Allah pada Perjanjian Baru', 'MPL01', 'agm03', 'KLS02', 'SM02'),
('KDA0000000165', '5', '4.5', 'Melakukan aktivitas (misalnya menyusun doa, membuat puisi, menyanyikan lagu) sebagai ungkapan iman kepada Allah', 'MPL01', 'agm03', 'KLS02', 'SM02'),
('KDA0000000166', '6', '4.6', 'Melakukan aktivitas (misalnya mempraktikkan/menghias doa) yang menunjukkan pemahaman akan makna dan macam-macam doa', 'MPL01', 'agm03', 'KLS02', 'SM02'),
('KDA0000000167', '7', '4.7', 'Melakukan aktivitas dengan melibatkan diri dalam kegiatan lingkungan sosial masyarakat/komunitas basis untuk mendukung pertumbuhan dan perkembangan dirinya', 'MPL01', 'agm03', 'KLS02', 'SM02'),
('KDA0000000168', '8', '4.8', 'Melakukan aktivitas (misalnya menceritakan pengalaman hidup rukun dengan tetangga, membuat doa permohonan dengan tema kerukunan dalam persaudaraan sejati) dalam usaha menjaga kehidupan yang rukun dengan tetangga sebagai perwu', 'MPL01', 'agm03', 'KLS02', 'SM02'),
('KDA0000000169', '1', '4.1', 'Mengilustrasikan Atma sebagai sumber hidup bagi makhluk hidup', 'MPL01', 'agm04', 'KLS02', 'SM02'),
('KDA0000000170', '2', '4.2', 'Menyajikan contoh sujud bhakti kehadapan Sang Hyang Widhi dalam wujud Tri Murti', 'MPL01', 'agm04', 'KLS02', 'SM02'),
('KDA0000000171', '3', '4.3', 'Menyajikan cara menghindari perilaku Tri Mala dalam kehidupan sehari-hari', 'MPL01', 'agm04', 'KLS02', 'SM02'),
('KDA0000000172', '4', '4.4', 'Menerapkan ajaran Catur Paramitha dalam rangka mengharmonisasi kehidupan umat manusia', 'MPL01', 'agm04', 'KLS02', 'SM02'),
('KDA0000000173', '5', '4.5', 'Menceritakan tokoh-tokoh Ramayana yang berperilaku Dharma dan Adharma', 'MPL01', 'agm04', 'KLS02', 'SM02'),
('KDA0000000174', '6', '4.6', 'Menceritakan secara singkat sejarah perkembangan agama Hindu di daerah setempat', 'MPL01', 'agm04', 'KLS02', 'SM02'),
('KDA0000000175', '1', '4.1', 'Menceritakan kembali peristiwa kelahiran dan masa kanak-kanak Pangeran Siddharta', 'MPL01', 'agm05', 'KLS02', 'SM02'),
('KDA0000000176', '1', '4.2', 'Menyajikan pengetahuan faktual kisah kasih sayang, kejujuran, dan persahabatan', 'MPL01', 'agm05', 'KLS02', 'SM02'),
('KDA0000000177', '1', '4.3', 'Menjalankan macam-macam peraturan dalam keluarga dan sekolah', 'MPL01', 'agm05', 'KLS02', 'SM02'),
('KDA0000000178', '1', '4.4', 'Melaksanakan perbuatan baik dan menghindari perbuatan buruk', 'MPL01', 'agm05', 'KLS02', 'SM02'),
('KDA0000000179', '1', '4.1', 'Menceritakan pengalaman pribadi terkait emosi dan kebaikan (guru memandu untuk mendapatkan hikmah dari pengalaman tersebut)', 'MPL01', 'agm06', 'KLS02', 'SM02'),
('KDA0000000180', '2', '4.2', 'Mempraktikkan doa syukur dan jingzuo', 'MPL01', 'agm06', 'KLS02', 'SM02'),
('KDA0000000181', '3', '4.3', 'Menceritakan cara menjaga dan merawat benda-benda ciptaan Tian dan manusia', 'MPL01', 'agm06', 'KLS02', 'SM02'),
('KDA0000000182', '4', '4.4', 'Menceritakan pengalaman keharmonisan dalam keluarga', 'MPL01', 'agm06', 'KLS02', 'SM02'),
('KDA0000000183', '5', '4.5', 'Menuliskan pengalaman membantu orang tua di rumah sebagai wujud rasa bakti', 'MPL01', 'agm06', 'KLS02', 'SM02'),
('KDA0000000184', '6', '4.6', 'Membuat catatan harian tentang mawas diri dan memperbaiki kesalahan', 'MPL01', 'agm06', 'KLS02', 'SM02'),
('KDA0000000185', '1', '4.1.1', 'membaca kalimat-kalimat dalam Q.S. an-Nasr dan al-Kausar dengan benar', 'MPL01', 'agm01', 'KLS03', 'SM01'),
('KDA0000000186', '2', '4.1.2', 'menulis kalimat-kalimat dalam Q.S. an-Nasr dan al-Kausar dengan benar', 'MPL01', 'agm01', 'KLS03', 'SM01'),
('KDA0000000187', '3', '4.1.3', 'menunjukkan hafalan Q.S. an-Nasr dan al-Kausar dengan lancar', 'MPL01', 'agm01', 'KLS03', 'SM01'),
('KDA0000000188', '4', '4.2', 'mencontohkan perilaku mandiri, percaya diri, dan bertanggung jawab sebagai implementasi makna Hadis yang terkandung', 'MPL01', 'agm01', 'KLS03', 'SM01'),
('KDA0000000189', '5', '4.3', 'melakukan pengamatan terhadap diri dan makhluk ciptaan Allah yang dijumpai di sekitar rumah dan sekolah sebagai implementasi iman terhadap keesaan Allah Yang Maha Pencipta', 'MPL01', 'agm01', 'KLS03', 'SM01'),
('KDA0000000190', '6', '4.4', 'membaca al-Asmau al-Husna: al-Wahhab, al-‘Alim, dan as-Sami‘ dengan jelas dan benar', 'MPL01', 'agm01', 'KLS03', 'SM01'),
('KDA0000000191', '7', '4.5', 'mencontohkan perilaku tawaduk, ikhlas, dan mohon pertolongan', 'MPL01', 'agm01', 'KLS03', 'SM01'),
('KDA0000000192', '8', '4.6', 'mencontohkan perilaku peduli terhadap sesama sebagai implementasi pemahaman Q.S. al-Kausar', 'MPL01', 'agm01', 'KLS03', 'SM01'),
('KDA0000000193', '9', '4.7', 'mencontohkan sikap bersyukur', 'MPL01', 'agm01', 'KLS03', 'SM01'),
('KDA0000000194', '10', '4.8', 'menunjukkan contoh makna salat sebagai wujud dari pemahaman Q.S. al-Kausar', 'MPL01', 'agm01', 'KLS03', 'SM01'),
('KDA0000000195', '11', '4.9', 'mempraktikkan tata cara zikir dan doa setelah salat secara benar', 'MPL01', 'agm01', 'KLS03', 'SM01'),
('KDA0000000196', '12', '4.10', 'menceritakan pengalaman hikmah pelaksanaan ibadah salat di rumah dan sekolah', 'MPL01', 'agm01', 'KLS03', 'SM01'),
('KDA0000000197', '13', '4.11', 'menceritakan kisah keteladanan Nabi Yusuf a.s.', 'MPL01', 'agm01', 'KLS03', 'SM01'),
('KDA0000000198', '14', '4.12', 'menceritakan kisah keteladanan Nabi Syu’aib a.s.', 'MPL01', 'agm01', 'KLS03', 'SM01'),
('KDA0000000199', '15', '4.13', 'menceritakan kisah keteladanan Nabi Ibrahim a.s. dan Nabi Ismail a.s.', 'MPL01', 'agm01', 'KLS03', 'SM01'),
('KDA0000000200', '16', '4.14', 'menceritakan kisah keteladanan Nabi Muhammad saw.', 'MPL01', 'agm01', 'KLS03', 'SM01'),
('KDA0000000201', '1', '4.1', 'menerapkan sikap peduli terhadap iklim dan gejala-gejala alam', 'MPL01', 'agm02', 'KLS03', 'SM01'),
('KDA0000000202', '2', '4.2', 'membuat karya yang berkaitan dengan tanggung jawab dalam memelihara flora dan fauna di sekitarnya', 'MPL01', 'agm02', 'KLS03', 'SM01'),
('KDA0000000203', '3', '4.3', 'membuat proyek yang berkaitan dengan pergaulan sesama manusia walaupun berbeda suku, budaya, bangsa, dan agama', 'MPL01', 'agm02', 'KLS03', 'SM01'),
('KDA0000000204', '4', '4.4', 'melakukan tindakan sederhana sebagai wujud ikut serta menjaga keutuhan ciptaan Allah', 'MPL01', 'agm02', 'KLS03', 'SM01'),
('KDA0000000205', '1', '4.1', 'melakukan aktivitas berkaitan dengan pertumbuhan dan perkembangan dirinya (misalnya menyusun doa syukur/menuliskan perkembangan dirinya/membuat kliping gambar perkembangan diri)', 'MPL01', 'agm03', 'KLS03', 'SM01'),
('KDA0000000206', '2', '4.2', 'melakukan aktivitas (misalnya praktik/projek) yang menunjukkan perbuatan yang baik kepada teman di sekolah', 'MPL01', 'agm03', 'KLS03', 'SM01'),
('KDA0000000207', '3', '4.3', 'melakukan aktivitas (misalnya menceriterakan kembali, membuat puisi, dan bermain peran) tentang tindakan baik tokoh-tokoh Perjanjian Lama', 'MPL01', 'agm03', 'KLS03', 'SM01'),
('KDA0000000208', '4', '4.4', 'melakukan aktivitas sosial dengan memberi bantuan kepada orang yang memerlukan pertolongan seturut teladan Yesus seperti yang dikisahkan dalam Perjanjian Baru', 'MPL01', 'agm03', 'KLS03', 'SM01'),
('KDA0000000209', '5', '4.5', 'melakukan aktivitas (misalnya memperagakan/mempraktikkan/ mendramatisasi) yang berkaitan dengan Tata Perayaan Sakramen Baptis, Ekaristi, dan Tobat', 'MPL01', 'agm03', 'KLS03', 'SM01'),
('KDA0000000210', '6', '4.6', 'melakukan aktivitas (misalnya memperagakan/mempraktikkan/ mendramatisasi nilai-nilai keutamaan Kristiani) sebagai tanggapan atas karya keselamatan Allah di dalam kehidupan sehari-hari', 'MPL01', 'agm03', 'KLS03', 'SM01'),
('KDA0000000211', '7', '4.7', 'melakukan aktivitas (misalnya mengumpulkan gambar, menceritakan biografi) yang menunjukkan rasa hormat terhadap para pemimpin dan tradisi masyarakat yang baik', 'MPL01', 'agm04', 'KLS03', 'SM01'),
('KDA0000000212', '8', '4.8', 'melakukan aktivitas (misalnya menanam dan merawat pohon, menuliskan puisi/doa) dalam kegiatan melestarikan lingkungan alam', 'MPL01', 'agm04', 'KLS03', 'SM01'),
('KDA0000000213', '1', '4.1', 'mempraktikkan ajaran Tri Parartha untuk mencapai keharmonisan hidup', 'MPL01', 'agm04', 'KLS03', 'SM01'),
('KDA0000000214', '2', '4.2', 'mencontohkan ajaran Daiwi Sampad dan Asuri Sampad dalam kitab Bhagavadgita', 'MPL01', 'agm04', 'KLS03', 'SM01'),
('KDA0000000215', '3', '4.3', 'menceritakan secara singkat tokoh-tokoh utama dalam Mahabharata', 'MPL01', 'agm04', 'KLS03', 'SM01'),
('KDA0000000216', '4', '4.4', 'menyajikan nama-nama planet/astronomi dalam ajaran Veda', 'MPL01', 'agm04', 'KLS03', 'SM01'),
('KDA0000000217', '5', '4.5', 'menyajikan tari sakral dan tari profan dalam kehidupan keagamaan', 'MPL01', 'agm04', 'KLS03', 'SM01'),
('KDA0000000218', '6', '4.6', 'menyajikan cara sembahyang dan berdoa dalam ajaran Hindu', 'MPL01', 'agm04', 'KLS03', 'SM01'),
('KDA0000000219', '1', '4.1', 'menceritakan kembali semangat belajar Pangeran Siddharta pada masa bersekolah dan pengorbanan Bodhisattva', 'MPL01', 'agm05', 'KLS03', 'SM01'),
('KDA0000000220', '2', '4.2', 'melaksanakan hari-hari raya agama Buddha', 'MPL01', 'agm05', 'KLS03', 'SM01'),
('KDA0000000221', '3', '4.3', 'menjalankan kewajiban anak terhadap orang tua dan guru', 'MPL01', 'agm05', 'KLS03', 'SM01'),
('KDA0000000222', '4', '4.4', 'mengakui kesalahan, memperbaiki diri, meminta, dan memberi maaf', 'MPL01', 'agm05', 'KLS03', 'SM01'),
('KDA0000000223', '1', '4.1', 'mencari sebuah contoh cerita mengenai prilaku bakti dan rendah hati serta prilaku tidak berbakti dan sombong', 'MPL01', 'agm06', 'KLS03', 'SM01'),
('KDA0000000224', '2', '4.2', 'bembuat karya seni terkait dengan Watak Sejati (Xing)', 'MPL01', 'agm06', 'KLS03', 'SM01'),
('KDA0000000225', '3', '4.3', 'menceritakan pengalaman membersihkan ruang kelas dan kamar tidur sebagai tindakan peduli terhadap lingkungan', 'MPL01', 'agm06', 'KLS03', 'SM01'),
('KDA0000000226', '4', '4.4', 'menceritakan pengalaman terkait dengan tiga kesukaan yang membawa faedah atau menghindari tiga kesukaan yang membawa celaka', 'MPL01', 'agm06', 'KLS03', 'SM01'),
('KDA0000000227', '5', '4.5', 'menyajikan ayat terkait tingkatan bakti dari kitab Bakti (Xiaojing)', 'MPL01', 'agm06', 'KLS03', 'SM01'),
('KDA0000000228', '6', '4.6', 'menceritakan keteladanan murid utama Zhisheng Kongzi yang paling disukai', 'MPL01', 'agm06', 'KLS03', 'SM01'),
('KDA0000000229', '1', '4.1.1', 'membaca kalimat-kalimat dalam Q.S. an-Nasr dan al-Kausar dengan benar', 'MPL01', 'agm01', 'KLS03', 'SM02'),
('KDA0000000230', '2', '4.1.2', 'menulis kalimat-kalimat dalam Q.S. an-Nasr dan al-Kausar dengan benar', 'MPL01', 'agm01', 'KLS03', 'SM02'),
('KDA0000000231', '3', '4.1.3', 'menunjukkan hafalan Q.S. an-Nasr dan al-Kausar dengan lancar', 'MPL01', 'agm01', 'KLS03', 'SM02'),
('KDA0000000232', '4', '4.2', 'mencontohkan perilaku mandiri, percaya diri, dan bertanggung jawab sebagai implementasi makna Hadis yang terkandung', 'MPL01', 'agm01', 'KLS03', 'SM02'),
('KDA0000000233', '5', '4.3', 'melakukan pengamatan terhadap diri dan makhluk ciptaan Allah yang dijumpai di sekitar rumah dan sekolah sebagai implementasi iman terhadap keesaan Allah Yang Maha Pencipta', 'MPL01', 'agm01', 'KLS03', 'SM02'),
('KDA0000000234', '6', '4.4', 'membaca al-Asmau al-Husna: al-Wahhab, al-‘Alim, dan as-Sami‘ dengan jelas dan benar', 'MPL01', 'agm01', 'KLS03', 'SM02'),
('KDA0000000235', '7', '4.5', 'mencontohkan perilaku tawaduk, ikhlas, dan mohon pertolongan', 'MPL01', 'agm01', 'KLS03', 'SM02'),
('KDA0000000236', '8', '4.6', 'mencontohkan perilaku peduli terhadap sesama sebagai implementasi pemahaman Q.S. al-Kausar', 'MPL01', 'agm01', 'KLS03', 'SM02'),
('KDA0000000237', '9', '4.7', 'mencontohkan sikap bersyukur', 'MPL01', 'agm01', 'KLS03', 'SM02'),
('KDA0000000238', '10', '4.8', 'menunjukkan contoh makna salat sebagai wujud dari pemahaman Q.S. al-Kausar', 'MPL01', 'agm01', 'KLS03', 'SM02'),
('KDA0000000239', '11', '4.9', 'mempraktikkan tata cara zikir dan doa setelah salat secara benar', 'MPL01', 'agm01', 'KLS03', 'SM02'),
('KDA0000000240', '12', '4.10', 'menceritakan pengalaman hikmah pelaksanaan ibadah salat di rumah dan sekolah', 'MPL01', 'agm01', 'KLS03', 'SM02'),
('KDA0000000241', '13', '4.11', 'menceritakan kisah keteladanan Nabi Yusuf a.s.', 'MPL01', 'agm01', 'KLS03', 'SM02'),
('KDA0000000242', '14', '4.12', 'menceritakan kisah keteladanan Nabi Syu’aib a.s.', 'MPL01', 'agm01', 'KLS03', 'SM02'),
('KDA0000000243', '15', '4.13', 'menceritakan kisah keteladanan Nabi Ibrahim a.s. dan Nabi Ismail a.s.', 'MPL01', 'agm01', 'KLS03', 'SM02'),
('KDA0000000244', '16', '4.14', 'menceritakan kisah keteladanan Nabi Muhammad saw.', 'MPL01', 'agm01', 'KLS03', 'SM02'),
('KDA0000000245', '1', '4.1', 'menerapkan sikap peduli terhadap iklim dan gejala-gejala alam', 'MPL01', 'agm02', 'KLS03', 'SM02'),
('KDA0000000246', '2', '4.2', 'membuat karya yang berkaitan dengan tanggung jawab dalam memelihara flora dan fauna di sekitarnya', 'MPL01', 'agm02', 'KLS03', 'SM02'),
('KDA0000000247', '3', '4.3', 'membuat proyek yang berkaitan dengan pergaulan sesama manusia walaupun berbeda suku, budaya, bangsa, dan agama', 'MPL01', 'agm02', 'KLS03', 'SM02'),
('KDA0000000248', '4', '4.4', 'melakukan tindakan sederhana sebagai wujud ikut serta menjaga keutuhan ciptaan Allah', 'MPL01', 'agm02', 'KLS03', 'SM02'),
('KDA0000000249', '1', '4.1', 'melakukan aktivitas berkaitan dengan pertumbuhan dan perkembangan dirinya (misalnya menyusun doa syukur/menuliskan perkembangan dirinya/membuat kliping gambar perkembangan diri)', 'MPL01', 'agm03', 'KLS03', 'SM02'),
('KDA0000000250', '2', '4.2', 'melakukan aktivitas (misalnya praktik/projek) yang menunjukkan perbuatan yang baik kepada teman di sekolah', 'MPL01', 'agm03', 'KLS03', 'SM02'),
('KDA0000000251', '3', '4.3', 'melakukan aktivitas (misalnya menceriterakan kembali, membuat puisi, dan bermain peran) tentang tindakan baik tokoh-tokoh Perjanjian Lama', 'MPL01', 'agm03', 'KLS03', 'SM02'),
('KDA0000000252', '4', '4.4', 'melakukan aktivitas sosial dengan memberi bantuan kepada orang yang memerlukan pertolongan seturut teladan Yesus seperti yang dikisahkan dalam Perjanjian Baru', 'MPL01', 'agm03', 'KLS03', 'SM02'),
('KDA0000000253', '5', '4.5', 'melakukan aktivitas (misalnya memperagakan/mempraktikkan/ mendramatisasi) yang berkaitan dengan Tata Perayaan Sakramen Baptis, Ekaristi, dan Tobat', 'MPL01', 'agm03', 'KLS03', 'SM02'),
('KDA0000000254', '6', '4.6', 'melakukan aktivitas (misalnya memperagakan/mempraktikkan/ mendramatisasi nilai-nilai keutamaan Kristiani) sebagai tanggapan atas karya keselamatan Allah di dalam kehidupan sehari-hari', 'MPL01', 'agm03', 'KLS03', 'SM02'),
('KDA0000000255', '7', '4.7', 'melakukan aktivitas (misalnya mengumpulkan gambar, menceritakan biografi) yang menunjukkan rasa hormat terhadap para pemimpin dan tradisi masyarakat yang baik', 'MPL01', 'agm04', 'KLS03', 'SM02'),
('KDA0000000256', '8', '4.8', 'melakukan aktivitas (misalnya menanam dan merawat pohon, menuliskan puisi/doa) dalam kegiatan melestarikan lingkungan alam', 'MPL01', 'agm04', 'KLS03', 'SM02'),
('KDA0000000257', '1', '4.1', 'mempraktikkan ajaran Tri Parartha untuk mencapai keharmonisan hidup', 'MPL01', 'agm04', 'KLS03', 'SM02'),
('KDA0000000258', '2', '4.2', 'mencontohkan ajaran Daiwi Sampad dan Asuri Sampad dalam kitab Bhagavadgita', 'MPL01', 'agm04', 'KLS03', 'SM02'),
('KDA0000000259', '3', '4.3', 'menceritakan secara singkat tokoh-tokoh utama dalam Mahabharata', 'MPL01', 'agm04', 'KLS03', 'SM02'),
('KDA0000000260', '4', '4.4', 'menyajikan nama-nama planet/astronomi dalam ajaran Veda', 'MPL01', 'agm04', 'KLS03', 'SM02'),
('KDA0000000261', '5', '4.5', 'menyajikan tari sakral dan tari profan dalam kehidupan keagamaan', 'MPL01', 'agm04', 'KLS03', 'SM02'),
('KDA0000000262', '6', '4.6', 'menyajikan cara sembahyang dan berdoa dalam ajaran Hindu', 'MPL01', 'agm04', 'KLS03', 'SM02'),
('KDA0000000263', '1', '4.1', 'menceritakan kembali semangat belajar Pangeran Siddharta pada masa bersekolah dan pengorbanan Bodhisattva', 'MPL01', 'agm05', 'KLS03', 'SM02'),
('KDA0000000264', '2', '4.2', 'melaksanakan hari-hari raya agama Buddha', 'MPL01', 'agm05', 'KLS03', 'SM02'),
('KDA0000000265', '3', '4.3', 'menjalankan kewajiban anak terhadap orang tua dan guru', 'MPL01', 'agm05', 'KLS03', 'SM02'),
('KDA0000000266', '4', '4.4', 'mengakui kesalahan, memperbaiki diri, meminta, dan memberi maaf', 'MPL01', 'agm05', 'KLS03', 'SM02'),
('KDA0000000267', '1', '4.1', 'mencari sebuah contoh cerita mengenai prilaku bakti dan rendah hati serta prilaku tidak berbakti dan sombong', 'MPL01', 'agm06', 'KLS03', 'SM02'),
('KDA0000000268', '2', '4.2', 'bembuat karya seni terkait dengan Watak Sejati (Xing)', 'MPL01', 'agm06', 'KLS03', 'SM02'),
('KDA0000000269', '3', '4.3', 'menceritakan pengalaman membersihkan ruang kelas dan kamar tidur sebagai tindakan peduli terhadap lingkungan', 'MPL01', 'agm06', 'KLS03', 'SM02'),
('KDA0000000270', '4', '4.4', 'menceritakan pengalaman terkait dengan tiga kesukaan yang membawa faedah atau menghindari tiga kesukaan yang membawa celaka', 'MPL01', 'agm06', 'KLS03', 'SM02'),
('KDA0000000271', '5', '4.5', 'menyajikan ayat terkait tingkatan bakti dari kitab Bakti (Xiaojing)', 'MPL01', 'agm06', 'KLS03', 'SM02'),
('KDA0000000272', '6', '4.6', 'menceritakan keteladanan murid utama Zhisheng Kongzi yang paling disukai', 'MPL01', 'agm06', 'KLS03', 'SM02'),
('KDA0000000273', '1', '4.1.1', 'membaca Q.S. al-Falaq dan Q.S  alF?l dengan tartil', 'MPL01', 'agm01', 'KLS04', 'SM01'),
('KDA0000000274', '2', '4.1.2', 'menulis kalimat-kalimat dalam Q.S. al-Falaq dan Q.S  al-F?l dengan benar ', 'MPL01', 'agm01', 'KLS04', 'SM01'),
('KDA0000000275', '3', '4.1.3', 'menunjukkan hafalan Q.S. al-Falaq dan Q.S  al-F?l dengan lancar ', 'MPL01', 'agm01', 'KLS04', 'SM01'),
('KDA0000000276', '4', '4.2', 'melakukan pengamatan terhadap makhluk ciptaan Allah di sekitar rumah dan sekolah sebagai upaya mengenal Allah itu ada', 'MPL01', 'agm01', 'KLS04', 'SM01'),
('KDA0000000277', '5', '4.3', 'membaca al-Asmau al-Husna: Al-Basir, Al-‘Adil, dan Al-‘Azim dengan jelas dan benar', 'MPL01', 'agm01', 'KLS04', 'SM01'),
('KDA0000000278', '6', '4.4', 'melakukan pengamatan diri dan alam sekitar sebagai implementasi makna iman kepada malaikat-malaikat Allah', 'MPL01', 'agm01', 'KLS04', 'SM01'),
('KDA0000000279', '7', '4.5', 'mencontohkan makna iman kepada Rasul Allah', 'MPL01', 'agm01', 'KLS04', 'SM01'),
('KDA0000000280', '8', '4.6', 'mencontohkan sikap santun dan menghargai teman, baik di rumah, sekolah, maupun di masyarakat sekitar', 'MPL01', 'agm01', 'KLS04', 'SM01'),
('KDA0000000281', '9', '4.7', 'mencontohkan sikap rendah hati', 'MPL01', 'agm01', 'KLS04', 'SM01'),
('KDA0000000282', '10', '4.8', 'mencontohkan perilaku hemat', 'MPL01', 'agm01', 'KLS04', 'SM01'),
('KDA0000000283', '11', '4.9', 'mencontohkan perilaku jujur dalam kehidupan sehari-hari', 'MPL01', 'agm01', 'KLS04', 'SM01'),
('KDA0000000284', '12', '4.10', 'mencontohkan perilaku amanah dalam kehidupan sehari-hari', 'MPL01', 'agm01', 'KLS04', 'SM01'),
('KDA0000000285', '13', '4.11', 'mencontohkan perilaku hormat dan patuh kepada orangtua dan guru', 'MPL01', 'agm01', 'KLS04', 'SM01'),
('KDA0000000286', '14', '4.12', 'menunjukkan perilaku gemar membaca', 'MPL01', 'agm01', 'KLS04', 'SM01'),
('KDA0000000287', '15', '4.13', 'menunjukkan sikap pantang menyerah', 'MPL01', 'agm01', 'KLS04', 'SM01'),
('KDA0000000288', '16', '4.14', 'mempraktikkan tata cara bersuci dari hadas kecil sesuai ketentuan syari’at Islam', 'MPL01', 'agm01', 'KLS04', 'SM01'),
('KDA0000000289', '17', '4.15.1', 'menunjukkan contoh makna ibadah salat', 'MPL01', 'agm01', 'KLS04', 'SM01'),
('KDA0000000290', '18', '4.15.2', 'menceritakan pengalaman melaksanakan salat di rumah dan masjid lingkungan sekitar rumah ', 'MPL01', 'agm01', 'KLS04', 'SM01'),
('KDA0000000291', '19', '4.16', 'menceritakan kisah keteladan Nabi Ayyub a.s.', 'MPL01', 'agm01', 'KLS04', 'SM01'),
('KDA0000000292', '20', '4.17', 'menceritakan kisah keteladan Nabi Zulkifli a.s.', 'MPL01', 'agm01', 'KLS04', 'SM01'),
('KDA0000000293', '21', '4.18', 'menceritakan kisah keteladan Nabi Harun a.s.', 'MPL01', 'agm01', 'KLS04', 'SM01'),
('KDA0000000294', '22', '4.19', 'menceritakan kisah keteladanan Nabi Musa a.s.', 'MPL01', 'agm01', 'KLS04', 'SM01'),
('KDA0000000295', '23', '4.20', 'menceritakan kisah keteladanan Nabi Muhammad saw.', 'MPL01', 'agm01', 'KLS04', 'SM01'),
('KDA0000000296', '24', '4.21', 'menceritakan kisah keteladanan Wali Songo', 'MPL01', 'agm01', 'KLS04', 'SM01'),
('KDA0000000297', '1', '4.1', 'membuat karya sederhana yang menunjukkan bertanggung jawab terhadap dirinya sebagai ciptaan Allah', 'MPL01', 'agm02', 'KLS04', 'SM01'),
('KDA0000000298', '2', '4.2', 'menyajikan karya berkaitan dangan anggota tubuhnya sebagai ciptaan Allah', 'MPL01', 'agm02', 'KLS04', 'SM01'),
('KDA0000000299', '3', '4.3', 'membuat proyek sederhana yang berkaitan dengan sikap mengasihi keluarga dan teman', 'MPL01', 'agm02', 'KLS04', 'SM01'),
('KDA0000000300', '4', '4.4', 'melakukan tindakan sederhana dalam memelihara alam ciptaan Allah', 'MPL01', 'agm02', 'KLS04', 'SM01'),
('KDA0000000301', '1', '4.1', 'melakukan aktivitas (misalnya mengucapkan doa/berpuisi/bernyanyi) yang mengungkapkan rasa bangga dan syukur atas anugerah dirinya yang khas', 'MPL01', 'agm03', 'KLS04', 'SM01'),
('KDA0000000302', '2', '4.2', 'melakukan aktivitas (misalnya merawat anggota tubuh/menggambar/mewarnai/ menghias gambar anggota tubuh) sebagai ungkapan syukur kepada Allah atas anugerah anggota tubuh', 'MPL01', 'agm03', 'KLS04', 'SM01'),
('KDA0000000303', '3', '4.3', 'melakukan aktivitas (misalnya terlibat dalam tugas-tugas di dalam keluarga, memelihara lingkungan rumah) sebagai tempat bertumbuh dan berkembang', 'MPL01', 'agm03', 'KLS04', 'SM01'),
('KDA0000000304', '4', '4.4', 'melakukan aktivitas (misalnya melaksanakan tugas dari guru, memelihara lingkungan sekolah) sebagai tempat bertumbuh dan berkembang', 'MPL01', 'agm03', 'KLS04', 'SM01'),
('KDA0000000305', '5', '4.5', 'melakukan aktivitas (misalnya menggambar/mewarnai/membuat mozaik) tentang ciptaan Allah', 'MPL01', 'agm03', 'KLS04', 'SM01'),
('KDA0000000306', '6', '4.6', 'melakukan perbuatan kasih sebagai wujud pewartaan kabar gembira tentang kelahiran Yesus', 'MPL01', 'agm03', 'KLS04', 'SM01'),
('KDA0000000307', '7', '4.7', 'melakukan aktivitas (misalnya mempraktikkan/menghias doa harian) sebagai ungkapan iman kepada Allah', 'MPL01', 'agm03', 'KLS04', 'SM01'),
('KDA0000000308', '8', '4.8', 'melakukan aktivitas (misalnya mempraktikkan/mewarnai gambar)', 'MPL01', 'agm03', 'KLS04', 'SM01'),
('KDA0000000309', '1', '4.1', 'menyajikan contoh-contoh ciptaan Sang Hyang Widhi dan karya manusia', 'MPL01', 'agm04', 'KLS04', 'SM01'),
('KDA0000000310', '2', '4.2', 'menyajikan hasil pengamatan tentang makhluk hidup yang memiliki Eka Pramana, Dwi Pramana, dan Tri Pramana', 'MPL01', 'agm04', 'KLS04', 'SM01'),
('KDA0000000311', '3', '4.3', 'menjalankan perilaku masing-masing bagian Tri Kaya Parisudha', 'MPL01', 'agm04', 'KLS04', 'SM01'),
('KDA0000000312', '4', '4.4', 'menyajikan perbedaan antara kitab suci Veda dengan buku biasa', 'MPL01', 'agm04', 'KLS04', 'SM01'),
('KDA0000000313', '5', '4.5', 'menyanyikan Dharmagita atau lagu kerohanian Hindu', 'MPL01', 'agm04', 'KLS04', 'SM01'),
('KDA0000000314', '6', '4.6', 'mendemonstrasikan pengucapan mantra guru, gayatri mantra, mantra makan, mantra Saraswati, dan doa tidur', 'MPL01', 'agm04', 'KLS04', 'SM01'),
('KDA0000000315', '7', '4.7', ' menceritakan secara singkat sejarah perkembangan agama Hindu pada abad I di Indonesia', 'MPL01', 'agm04', 'KLS04', 'SM01'),
('KDA0000000316', '1', '4.1', 'menyajikan cara-cara menghormat, salam, dan simbol-simbol agama Buddha', 'MPL01', 'agm05', 'KLS04', 'SM01'),
('KDA0000000317', '2', '4.2', 'melaksanakan doa sebelum dan sesudah melakukan kegiatan sehari-hari', 'MPL01', 'agm05', 'KLS04', 'SM01'),
('KDA0000000318', '3', '4.3', 'menyajikan pengetahuan faktual tentang tempat ibadah, rohaniawan, kitab suci, peristiwa hari raya dan Guru Agung agama Buddha', 'MPL01', 'agm05', 'KLS04', 'SM01'),
('KDA0000000319', '4', '4.4', 'menyajikan silsilah keluarga sendiri dan keluarga Pangeran Siddharta', 'MPL01', 'agm05', 'KLS04', 'SM01'),
('KDA0000000320', '1', '4.1', 'merawat tubuh pemberian orang tua dan berlatih menjaga keinginan (tidak makan berlebihan, dsb.)', 'MPL01', 'agm06', 'KLS04', 'SM01'),
('KDA0000000321', '2', '4.2', 'mempraktikkan doa sederhana dan bersembahyang pagi-sore kepada Tian pagi-sore', 'MPL01', 'agm06', 'KLS04', 'SM01'),
('KDA0000000322', '3', '4.3', 'mempraktikkan cara makan yang baik (mengucap syukur, makan secukupnya, tidak berlebihan; makan empat sehat lima sempurna; makan pada waktunya, makan tidakbersuara) dan membuang sampah pada tempatnya', 'MPL01', 'agm06', 'KLS04', 'SM01'),
('KDA0000000323', '4', '4.4', 'menceritakan hubungan kemasyarakatan serta sikap di dalam kemasyarakatan, keluarga, dan sekolah (mengucap salam sebelum masuk rumah; ijin kepada orang tua ketika hendak pergi dari rumah; segera menyahut ketika dipanggil orang', 'MPL01', 'agm06', 'KLS04', 'SM01'),
('KDA0000000324', '5', '4.5', 'belajar hidup mandiri (membereskan tempat tidur, meletakkan tas, dan sepatu pada tempatnya; belajar mandi dan gosok gigi sendiri, memakai baju sendiri, makan sendiri).', 'MPL01', 'agm06', 'KLS04', 'SM01'),
('KDA0000000325', '6', '4.6', 'rajin belajar dan bersembahyang seperti teladan zhisheng Kongzi semasa kecil', 'MPL01', 'agm06', 'KLS04', 'SM01'),
('KDA0000000326', '1', '4.1.1', 'membaca Q.S. al-Falaq dan Q.S  alF?l dengan tartil', 'MPL01', 'agm01', 'KLS04', 'SM02');
INSERT INTO `kd_agama_ki4` (`id_kd`, `nom`, `nomor_kd`, `deskripsi`, `id_mapel`, `id_agama`, `id_kelas`, `id_semester`) VALUES
('KDA0000000327', '2', '4.1.2', 'menulis kalimat-kalimat dalam Q.S. al-Falaq dan Q.S  al-F?l dengan benar ', 'MPL01', 'agm01', 'KLS04', 'SM02'),
('KDA0000000328', '3', '4.1.3', 'menunjukkan hafalan Q.S. al-Falaq dan Q.S  al-F?l dengan lancar ', 'MPL01', 'agm01', 'KLS04', 'SM02'),
('KDA0000000329', '4', '4.2', 'melakukan pengamatan terhadap makhluk ciptaan Allah di sekitar rumah dan sekolah sebagai upaya mengenal Allah itu ada', 'MPL01', 'agm01', 'KLS04', 'SM02'),
('KDA0000000330', '5', '4.3', 'membaca al-Asmau al-Husna: Al-Basir, Al-‘Adil, dan Al-‘Azim dengan jelas dan benar', 'MPL01', 'agm01', 'KLS04', 'SM02'),
('KDA0000000331', '6', '4.4', 'melakukan pengamatan diri dan alam sekitar sebagai implementasi makna iman kepada malaikat-malaikat Allah', 'MPL01', 'agm01', 'KLS04', 'SM02'),
('KDA0000000332', '7', '4.5', 'mencontohkan makna iman kepada Rasul Allah', 'MPL01', 'agm01', 'KLS04', 'SM02'),
('KDA0000000333', '8', '4.6', 'mencontohkan sikap santun dan menghargai teman, baik di rumah, sekolah, maupun di masyarakat sekitar', 'MPL01', 'agm01', 'KLS04', 'SM02'),
('KDA0000000334', '9', '4.7', 'mencontohkan sikap rendah hati', 'MPL01', 'agm01', 'KLS04', 'SM02'),
('KDA0000000335', '10', '4.8', 'mencontohkan perilaku hemat', 'MPL01', 'agm01', 'KLS04', 'SM0'),
('KDA0000000336', '11', '4.9', 'mencontohkan perilaku jujur dalam kehidupan sehari-hari', 'MPL01', 'agm01', 'KLS04', 'SM02'),
('KDA0000000337', '12', '4.10', 'mencontohkan perilaku amanah dalam kehidupan sehari-hari', 'MPL01', 'agm01', 'KLS04', 'SM02'),
('KDA0000000338', '13', '4.11', 'mencontohkan perilaku hormat dan patuh kepada orangtua dan guru', 'MPL01', 'agm01', 'KLS04', 'SM02'),
('KDA0000000339', '14', '4.12', 'menunjukkan perilaku gemar membaca', 'MPL01', 'agm01', 'KLS04', 'SM02'),
('KDA0000000340', '15', '4.13', 'menunjukkan sikap pantang menyerah', 'MPL01', 'agm01', 'KLS04', 'SM02'),
('KDA0000000341', '16', '4.14', 'mempraktikkan tata cara bersuci dari hadas kecil sesuai ketentuan syari’at Islam', 'MPL01', 'agm01', 'KLS04', 'SM02'),
('KDA0000000342', '17', '4.15.1', 'menunjukkan contoh makna ibadah salat', 'MPL01', 'agm01', 'KLS04', 'SM02'),
('KDA0000000343', '18', '4.15.2', 'menceritakan pengalaman melaksanakan salat di rumah dan masjid lingkungan sekitar rumah ', 'MPL01', 'agm01', 'KLS04', 'SM02'),
('KDA0000000344', '19', '4.16', 'menceritakan kisah keteladan Nabi Ayyub a.s.', 'MPL01', 'agm01', 'KLS04', 'SM02'),
('KDA0000000345', '20', '4.17', 'menceritakan kisah keteladan Nabi Zulkifli a.s.', 'MPL01', 'agm01', 'KLS04', 'SM02'),
('KDA0000000346', '21', '4.18', 'menceritakan kisah keteladan Nabi Harun a.s.', 'MPL01', 'agm01', 'KLS04', 'SM02'),
('KDA0000000347', '22', '4.19', 'menceritakan kisah keteladanan Nabi Musa a.s.', 'MPL01', 'agm01', 'KLS04', 'SM02'),
('KDA0000000348', '23', '4.20', 'menceritakan kisah keteladanan Nabi Muhammad saw.', 'MPL01', 'agm01', 'KLS04', 'SM02'),
('KDA0000000349', '24', '4.21', 'menceritakan kisah keteladanan Wali Songo', 'MPL01', 'agm01', 'KLS04', 'SM02'),
('KDA0000000350', '1', '4.1', 'membuat karya sederhana yang menunjukkan bertanggung jawab terhadap dirinya sebagai ciptaan Allah', 'MPL01', 'agm02', 'KLS04', 'SM02'),
('KDA0000000351', '2', '4.2', 'menyajikan karya berkaitan dangan anggota tubuhnya sebagai ciptaan Allah', 'MPL01', 'agm02', 'KLS04', 'SM02'),
('KDA0000000352', '3', '4.3', 'membuat proyek sederhana yang berkaitan dengan sikap mengasihi keluarga dan teman', 'MPL01', 'agm02', 'KLS04', 'SM02'),
('KDA0000000353', '4', '4.4', 'melakukan tindakan sederhana dalam memelihara alam ciptaan Allah', 'MPL01', 'agm02', 'KLS04', 'SM02'),
('KDA0000000354', '1', '4.1', 'melakukan aktivitas (misalnya mengucapkan doa/berpuisi/bernyanyi) yang mengungkapkan rasa bangga dan syukur atas anugerah dirinya yang khas', 'MPL01', 'agm03', 'KLS04', 'SM02'),
('KDA0000000355', '2', '4.2', 'melakukan aktivitas (misalnya merawat anggota tubuh/menggambar/mewarnai/ menghias gambar anggota tubuh) sebagai ungkapan syukur kepada Allah atas anugerah anggota tubuh', 'MPL01', 'agm03', 'KLS04', 'SM02'),
('KDA0000000356', '3', '4.3', 'melakukan aktivitas (misalnya terlibat dalam tugas-tugas di dalam keluarga, memelihara lingkungan rumah) sebagai tempat bertumbuh dan berkembang', 'MPL01', 'agm03', 'KLS04', 'SM02'),
('KDA0000000357', '4', '4.4', 'melakukan aktivitas (misalnya melaksanakan tugas dari guru, memelihara lingkungan sekolah) sebagai tempat bertumbuh dan berkembang', 'MPL01', 'agm03', 'KLS04', 'SM02'),
('KDA0000000358', '5', '4.5', 'melakukan aktivitas (misalnya menggambar/mewarnai/membuat mozaik) tentang ciptaan Allah', 'MPL01', 'agm03', 'KLS04', 'SM02'),
('KDA0000000359', '6', '4.6', 'melakukan perbuatan kasih sebagai wujud pewartaan kabar gembira tentang kelahiran Yesus', 'MPL01', 'agm03', 'KLS04', 'SM02'),
('KDA0000000360', '7', '4.7', 'melakukan aktivitas (misalnya mempraktikkan/menghias doa harian) sebagai ungkapan iman kepada Allah', 'MPL01', 'agm03', 'KLS04', 'SM02'),
('KDA0000000361', '8', '4.8', 'melakukan aktivitas (misalnya mempraktikkan/mewarnai gambar)', 'MPL01', 'agm03', 'KLS04', 'SM02'),
('KDA0000000362', '1', '4.1', 'menyajikan contoh-contoh ciptaan Sang Hyang Widhi dan karya manusia', 'MPL01', 'agm04', 'KLS04', 'SM02'),
('KDA0000000363', '2', '4.2', 'menyajikan hasil pengamatan tentang makhluk hidup yang memiliki Eka Pramana, Dwi Pramana, dan Tri Pramana', 'MPL01', 'agm04', 'KLS04', 'SM02'),
('KDA0000000364', '3', '4.3', 'menjalankan perilaku masing-masing bagian Tri Kaya Parisudha', 'MPL01', 'agm04', 'KLS04', 'SM02'),
('KDA0000000365', '4', '4.4', 'menyajikan perbedaan antara kitab suci Veda dengan buku biasa', 'MPL01', 'agm04', 'KLS04', 'SM02'),
('KDA0000000366', '5', '4.5', 'menyanyikan Dharmagita atau lagu kerohanian Hindu', 'MPL01', 'agm04', 'KLS04', 'SM02'),
('KDA0000000367', '6', '4.6', 'mendemonstrasikan pengucapan mantra guru, gayatri mantra, mantra makan, mantra Saraswati, dan doa tidur', 'MPL01', 'agm04', 'KLS04', 'SM02'),
('KDA0000000368', '7', '4.7', ' menceritakan secara singkat sejarah perkembangan agama Hindu pada abad I di Indonesia', 'MPL01', 'agm04', 'KLS04', 'SM02'),
('KDA0000000369', '1', '4.1', 'menyajikan cara-cara menghormat, salam, dan simbol-simbol agama Buddha', 'MPL01', 'agm05', 'KLS04', 'SM02'),
('KDA0000000370', '2', '4.2', 'melaksanakan doa sebelum dan sesudah melakukan kegiatan sehari-hari', 'MPL01', 'agm05', 'KLS04', 'SM02'),
('KDA0000000371', '3', '4.3', 'menyajikan pengetahuan faktual tentang tempat ibadah, rohaniawan, kitab suci, peristiwa hari raya dan Guru Agung agama Buddha', 'MPL01', 'agm05', 'KLS04', 'SM02'),
('KDA0000000372', '4', '4.4', 'menyajikan silsilah keluarga sendiri dan keluarga Pangeran Siddharta', 'MPL01', 'agm05', 'KLS04', 'SM02'),
('KDA0000000373', '1', '4.1', 'merawat tubuh pemberian orang tua dan berlatih menjaga keinginan (tidak makan berlebihan, dsb.)', 'MPL01', 'agm06', 'KLS04', 'SM02'),
('KDA0000000374', '2', '4.2', 'mempraktikkan doa sederhana dan bersembahyang pagi-sore kepada Tian pagi-sore', 'MPL01', 'agm06', 'KLS04', 'SM02'),
('KDA0000000375', '3', '4.3', 'mempraktikkan cara makan yang baik (mengucap syukur, makan secukupnya, tidak berlebihan; makan empat sehat lima sempurna; makan pada waktunya, makan tidakbersuara) dan membuang sampah pada tempatnya', 'MPL01', 'agm06', 'KLS04', 'SM02'),
('KDA0000000376', '4', '4.4', 'menceritakan hubungan kemasyarakatan serta sikap di dalam kemasyarakatan, keluarga, dan sekolah (mengucap salam sebelum masuk rumah; ijin kepada orang tua ketika hendak pergi dari rumah; segera menyahut ketika dipanggil orang', 'MPL01', 'agm06', 'KLS04', 'SM02'),
('KDA0000000377', '5', '4.5', 'belajar hidup mandiri (membereskan tempat tidur, meletakkan tas, dan sepatu pada tempatnya; belajar mandi dan gosok gigi sendiri, memakai baju sendiri, makan sendiri).', 'MPL01', 'agm06', 'KLS04', 'SM02'),
('KDA0000000378', '6', '4.6', 'rajin belajar dan bersembahyang seperti teladan zhisheng Kongzi semasa kecil', 'MPL01', 'agm06', 'KLS04', 'SM02'),
('KDA0000000379', '1', '4.1.1', 'Membaca Q.S. at-T?n dan Q.S. al-M?’?n dengan tart?l', 'MPL01', 'agm01', 'KLS05', 'SM01'),
('KDA0000000380', '2', '4.1.2', 'Menulis kalimat-kalimat dalam Q.S. at-T?n dan Q.S. al-M?’?n dengan benar', 'MPL01', 'agm01', 'KLS05', 'SM01'),
('KDA0000000381', '3', '4.1.3', 'Menunjukkan hafalan Q.S. at-T?n dan Q.S. al-M?’?n dengan lancar', 'MPL01', 'agm01', 'KLS05', 'SM01'),
('KDA0000000382', '4', '4.2', 'Membaca al-Asmau al-Husna: Al-Mumit, Al-Hayy, Al-Qayyum, dan Al-Ahad dengan jelas dan benar', 'MPL01', 'agm01', 'KLS05', 'SM01'),
('KDA0000000383', '5', '4.3', 'Menunjukkan hafalan nama-nama Rasul Allah dan Rasul Ulul ‘Azmi', 'MPL01', 'agm01', 'KLS05', 'SM01'),
('KDA0000000384', '6', '4.4', 'Menunjukkan makna diturunkannya kitab-kitab suci melalui rasul-rasul-Nya sebagai implementasi rukun iman', 'MPL01', 'agm01', 'KLS05', 'SM01'),
('KDA0000000385', '7', '4.5', 'Menunjukkan perilaku jujur dalam kehidupan sehai-hari', 'MPL01', 'agm01', 'KLS05', 'SM01'),
('KDA0000000386', '8', '4.6', 'Mencontohkan perilaku hormat dan patuh kepada orangtua dan guru', 'MPL01', 'agm01', 'KLS05', 'SM01'),
('KDA0000000387', '9', '4.7', 'Mencontohkan sikap saling menghargai sesama manusia', 'MPL01', 'agm01', 'KLS05', 'SM01'),
('KDA0000000388', '10', '4.8', 'Mencontohkan sikap sederhana dalam kehidupan sehari-hari', 'MPL01', 'agm01', 'KLS05', 'SM01'),
('KDA0000000389', '11', '4.9', 'Mencontohkan sikap ikhlas beramal dalam kehidupan sehari- hari', 'MPL01', 'agm01', 'KLS05', 'SM01'),
('KDA0000000390', '12', '4.10', 'Menunjukkan hikmah puasa Ramadan yang dapat membentuk akhlak mulia', 'MPL01', 'agm01', 'KLS05', 'SM01'),
('KDA0000000391', '13', '4.11', 'Mempraktikkan tatacara salat tarawih dan tadarus al-Qur’an', 'MPL01', 'agm01', 'KLS05', 'SM01'),
('KDA0000000392', '14', '4.12', 'Menceritakan kisah keteladanan Nabi Dawud a.s.', 'MPL01', 'agm01', 'KLS05', 'SM01'),
('KDA0000000393', '15', '4.13', 'Menceritakan kisah keteladanan Nabi Sulaiman a.s.', 'MPL01', 'agm01', 'KLS05', 'SM01'),
('KDA0000000394', '16', '4.14', 'Menceritakan kisah keteladanan Nabi Ilyas a.s.', 'MPL01', 'agm01', 'KLS05', 'SM01'),
('KDA0000000395', '17', '4.15', 'Menceritakan kisah keteladanan Nabi Ilyasa’ a.s.', 'MPL01', 'agm01', 'KLS05', 'SM01'),
('KDA0000000396', '18', '4.16', 'Menceritakan kisah keteladanan Nabi Muhammad saw.', 'MPL01', 'agm01', 'KLS05', 'SM01'),
('KDA0000000397', '19', '4.17', 'Menceritakan kisah keteladanan Luqman sebagaimana terdapat dalam al-Qur’an', 'MPL01', 'agm01', 'KLS05', 'SM01'),
('KDA0000000398', '1', '4.1', 'Menyajikan contoh cara hidup manusia yang sudah bertobat', 'MPL01', 'agm02', 'KLS05', 'SM01'),
('KDA0000000399', '2', '4.2', 'Mempraktikkan cara hidup sebagai orang yang sudah diselamatkan Allah di dalam Yesus Kristus', 'MPL01', 'agm02', 'KLS05', 'SM01'),
('KDA0000000400', '3', '4.3', 'Membuat karya-karya kreatif sebagai ungkapan syukur atas pertolongan Roh Kudus dalam hidup orang yang sudah diselamatkan', 'MPL01', 'agm02', 'KLS05', 'SM01'),
('KDA0000000401', '4', '4.4', 'Membuat karya terkait dengan menjadi manusia baru', 'MPL01', 'agm02', 'KLS05', 'SM01'),
('KDA0000000402', '1', '4.1', 'Melakukan aktivitas (misalnya menyusun doa syukur/puisi/slogan/motto/menyanyikan lagu) yang menyatakan tentang dirinya sebagai perempuan atau laki-laki seturut citra Allah', 'MPL01', 'agm03', 'KLS05', 'SM01'),
('KDA0000000403', '2', '4.2', 'Melakukan aktivitas (misalnya kerja sama dalam suatu kegiatan/permainan bersama/menulis releksi/puisi) yang menunjukkan sikap menghormati lawan jenis sebagai anugerah Allah', 'MPL01', 'agm03', 'KLS05', 'SM01'),
('KDA0000000404', '3', '4.3', 'Melakukan aktivitas (misalnya menceritakan kembali/bermain peran/menulis refleksi dan sebagainya) mengenai tokoh-tokoh Perjanjian Lama seperti dalam kisah Daud, Salomo, atau Ester', 'MPL01', 'agm03', 'KLS05', 'SM01'),
('KDA0000000405', '4', '4.4', 'Melakukan aktivas (misalnya membuat gambar salib dari biji-bijian/melukis wajah Yesus , melukiskan salah satu kisah jalan salib), menuliskan refeleksi/puisi, dan sebagainya) yang bertemakan sengsara, wafat, dan kebangkitan Ye', 'MPL01', 'agm03', 'KLS05', 'SM01'),
('KDA0000000406', '5', '4.5', 'Melakukan aktivitas (misalnya menuliskan refleksi/puisi/melukis) yang berkaitan dengan perbuatan-perbuatan yang menunjukkan hidup baru dalam Roh Kudus', 'MPL01', 'agm03', 'KLS05', 'SM01'),
('KDA0000000407', '6', '4.6', 'Melakukan aktivitas (misalnya membuat kliping/menggambar) yang berkaitan dengan kehidupan menggereja sebagai karya Roh Kudus', 'MPL01', 'agm03', 'KLS05', 'SM01'),
('KDA0000000408', '7', '4.7', 'Melakukan aktivitas (misalnya membuat slogan/motto/puisi) tentang kehidupan bersama di masyarakat sebagai karya Roh Kudus', 'MPL01', 'agm03', 'KLS05', 'SM01'),
('KDA0000000409', '8', '4.8', 'Melakukan aktivitas (misalnya menuliskan refleksi/menceritakan kembali/menulis biografi singkat) yang berkaitan dengan tokoh-tokoh yang memperjuangkan keadilan dan kejujuran di masyarakat sebagai wujud karya Roh Kudus', 'MPL01', 'agm03', 'KLS05', 'SM01'),
('KDA0000000410', '1', '4.1', 'Menyajikan contoh-contoh kitab Veda Sruti dan Veda Smerti sebagai sumber hukum Hindu', 'MPL01', 'agm04', 'KLS05', 'SM01'),
('KDA0000000411', '2', '4.2', 'Menerapkan ajaran Catur Marga Yoga sebagai jalan mencapai kesempurnaan hidup', 'MPL01', 'agm04', 'KLS05', 'SM01'),
('KDA0000000412', '3', '4.3', 'Menyajikan ajaran Cadhu Sakti atas kemahakuasaan Sang Hyang Widhi penguasa alam semesta', 'MPL01', 'agm04', 'KLS05', 'SM01'),
('KDA0000000413', '4', '4.4', 'Menerapkan ajaran Catur Guru dalam kehidupan sehari-hari', 'MPL01', 'agm04', 'KLS05', 'SM01'),
('KDA0000000414', '5', '4.5', 'Menyajikan bentuk dan struktur tempat suci dalam agama Hindu', 'MPL01', 'agm04', 'KLS05', 'SM01'),
('KDA0000000415', '1', '4.1', 'Menyajikan pengetahuan faktual tentang masa bertapa dan gagguan mara', 'MPL01', 'agm05', 'KLS05', 'SM01'),
('KDA0000000416', '2', '4.2', 'Menyajikan pengetahuan konseptual tentang delapan kondisi duniawi dan hakikat perbedaan kehidupan menurut Ajaran Buddha', 'MPL01', 'agm05', 'KLS05', 'SM01'),
('KDA0000000417', '3', '4.3', 'Mempraktikkan cara-cara berdana yang baik dan benar', 'MPL01', 'agm05', 'KLS05', 'SM01'),
('KDA0000000418', '4', '4.4', 'Menyajikan empat macam jalan kesuksesan dan empat macam teman sejati', 'MPL01', 'agm05', 'KLS05', 'SM01'),
('KDA0000000419', '1', '4.1', 'Mempraktikkan cara menjaga kebersihan badan dan hati dengan jingzuo', 'MPL01', 'agm06', 'KLS05', 'SM01'),
('KDA0000000420', '2', '4.2', 'Menceritakan pengalaman melaksanakan sembahyang kepada Tian', 'MPL01', 'agm06', 'KLS05', 'SM01'),
('KDA0000000421', '3', '4.3', 'Membuat tulisan terkait nilai-nilai kebajikan yang terkandung dalam sembahyang serta berkaitan dengan perubahan musim dan keharmonisan alam', 'MPL01', 'agm06', 'KLS05', 'SM01'),
('KDA0000000422', '4', '4.4', 'Mempraktikkan cara sembahyang kepada leluhur', 'MPL01', 'agm06', 'KLS05', 'SM01'),
('KDA0000000423', '5', '4.5', 'Menggambarkan silsilah keluarga besar dari pihak ayah dan ibu serta mencari tahu marganya', 'MPL01', 'agm06', 'KLS05', 'SM01'),
('KDA0000000424', '6', '4.6', 'Membuat mindmap tentang nabi purba dan raja suci dengan karya-karyanya', 'MPL01', 'agm06', 'KLS05', 'SM01'),
('KDA0000000425', '1', '4.1.1', 'Membaca Q.S. at-T?n dan Q.S. al-M?’?n dengan tart?l', 'MPL01', 'agm01', 'KLS05', 'SM02'),
('KDA0000000426', '2', '4.1.2', 'Menulis kalimat-kalimat dalam Q.S. at-T?n dan Q.S. al-M?’?n dengan benar', 'MPL01', 'agm01', 'KLS05', 'SM02'),
('KDA0000000427', '3', '4.1.3', 'Menunjukkan hafalan Q.S. at-T?n dan Q.S. al-M?’?n dengan lancar', 'MPL01', 'agm01', 'KLS05', 'SM02'),
('KDA0000000428', '4', '4.2', 'Membaca al-Asmau al-Husna: Al-Mumit, Al-Hayy, Al-Qayyum, dan Al-Ahad dengan jelas dan benar', 'MPL01', 'agm01', 'KLS05', 'SM02'),
('KDA0000000429', '5', '4.3', 'Menunjukkan hafalan nama-nama Rasul Allah dan Rasul Ulul ‘Azmi', 'MPL01', 'agm01', 'KLS05', 'SM02'),
('KDA0000000430', '6', '4.4', 'Menunjukkan makna diturunkannya kitab-kitab suci melalui rasul-rasul-Nya sebagai implementasi rukun iman', 'MPL01', 'agm01', 'KLS05', 'SM02'),
('KDA0000000431', '7', '4.5', 'Menunjukkan perilaku jujur dalam kehidupan sehai-hari', 'MPL01', 'agm01', 'KLS05', 'SM02'),
('KDA0000000432', '8', '4.6', 'Mencontohkan perilaku hormat dan patuh kepada orangtua dan guru', 'MPL01', 'agm01', 'KLS05', 'SM02'),
('KDA0000000433', '9', '4.7', 'Mencontohkan sikap saling menghargai sesama manusia', 'MPL01', 'agm01', 'KLS05', 'SM02'),
('KDA0000000434', '10', '4.8', 'Mencontohkan sikap sederhana dalam kehidupan sehari-hari', 'MPL01', 'agm01', 'KLS05', 'SM02'),
('KDA0000000435', '11', '4.9', 'Mencontohkan sikap ikhlas beramal dalam kehidupan sehari- hari', 'MPL01', 'agm01', 'KLS05', 'SM02'),
('KDA0000000436', '12', '4.10', 'Menunjukkan hikmah puasa Ramadan yang dapat membentuk akhlak mulia', 'MPL01', 'agm01', 'KLS05', 'SM02'),
('KDA0000000437', '13', '4.11', 'Mempraktikkan tatacara salat tarawih dan tadarus al-Qur’an', 'MPL01', 'agm01', 'KLS05', 'SM02'),
('KDA0000000438', '14', '4.12', 'Menceritakan kisah keteladanan Nabi Dawud a.s.', 'MPL01', 'agm01', 'KLS05', 'SM02'),
('KDA0000000439', '15', '4.13', 'Menceritakan kisah keteladanan Nabi Sulaiman a.s.', 'MPL01', 'agm01', 'KLS05', 'SM02'),
('KDA0000000440', '16', '4.14', 'Menceritakan kisah keteladanan Nabi Ilyas a.s.', 'MPL01', 'agm01', 'KLS05', 'SM02'),
('KDA0000000441', '17', '4.15', 'Menceritakan kisah keteladanan Nabi Ilyasa’ a.s.', 'MPL01', 'agm01', 'KLS05', 'SM02'),
('KDA0000000442', '18', '4.16', 'Menceritakan kisah keteladanan Nabi Muhammad saw.', 'MPL01', 'agm01', 'KLS05', 'SM02'),
('KDA0000000443', '19', '4.17', 'Menceritakan kisah keteladanan Luqman sebagaimana terdapat dalam al-Qur’an', 'MPL01', 'agm01', 'KLS05', 'SM02'),
('KDA0000000444', '1', '4.1', 'Menyajikan contoh cara hidup manusia yang sudah bertobat', 'MPL01', 'agm02', 'KLS05', 'SM02'),
('KDA0000000445', '2', '4.2', 'Mempraktikkan cara hidup sebagai orang yang sudah diselamatkan Allah di dalam Yesus Kristus', 'MPL01', 'agm02', 'KLS05', 'SM02'),
('KDA0000000446', '3', '4.3', 'Membuat karya-karya kreatif sebagai ungkapan syukur atas pertolongan Roh Kudus dalam hidup orang yang sudah diselamatkan', 'MPL01', 'agm02', 'KLS05', 'SM02'),
('KDA0000000447', '4', '4.4', 'Membuat karya terkait dengan menjadi manusia baru', 'MPL01', 'agm02', 'KLS05', 'SM02'),
('KDA0000000448', '1', '4.1', 'Melakukan aktivitas (misalnya menyusun doa syukur/puisi/slogan/motto/menyanyikan lagu) yang menyatakan tentang dirinya sebagai perempuan atau laki-laki seturut citra Allah', 'MPL01', 'agm03', 'KLS05', 'SM02'),
('KDA0000000449', '2', '4.2', 'Melakukan aktivitas (misalnya kerja sama dalam suatu kegiatan/permainan bersama/menulis releksi/puisi) yang menunjukkan sikap menghormati lawan jenis sebagai anugerah Allah', 'MPL01', 'agm03', 'KLS05', 'SM02'),
('KDA0000000450', '3', '4.3', 'Melakukan aktivitas (misalnya menceritakan kembali/bermain peran/menulis refleksi dan sebagainya) mengenai tokoh-tokoh Perjanjian Lama seperti dalam kisah Daud, Salomo, atau Ester', 'MPL01', 'agm03', 'KLS05', 'SM02'),
('KDA0000000451', '4', '4.4', 'Melakukan aktivas (misalnya membuat gambar salib dari biji-bijian/melukis wajah Yesus , melukiskan salah satu kisah jalan salib), menuliskan refeleksi/puisi, dan sebagainya) yang bertemakan sengsara, wafat, dan kebangkitan Ye', 'MPL01', 'agm03', 'KLS05', 'SM02'),
('KDA0000000452', '5', '4.5', 'Melakukan aktivitas (misalnya menuliskan refleksi/puisi/melukis) yang berkaitan dengan perbuatan-perbuatan yang menunjukkan hidup baru dalam Roh Kudus', 'MPL01', 'agm03', 'KLS05', 'SM02'),
('KDA0000000453', '6', '4.6', 'Melakukan aktivitas (misalnya membuat kliping/menggambar) yang berkaitan dengan kehidupan menggereja sebagai karya Roh Kudus', 'MPL01', 'agm03', 'KLS05', 'SM02'),
('KDA0000000454', '7', '4.7', 'Melakukan aktivitas (misalnya membuat slogan/motto/puisi) tentang kehidupan bersama di masyarakat sebagai karya Roh Kudus', 'MPL01', 'agm03', 'KLS05', 'SM02'),
('KDA0000000455', '8', '4.8', 'Melakukan aktivitas (misalnya menuliskan refleksi/menceritakan kembali/menulis biografi singkat) yang berkaitan dengan tokoh-tokoh yang memperjuangkan keadilan dan kejujuran di masyarakat sebagai wujud karya Roh Kudus', 'MPL01', 'agm03', 'KLS05', 'SM02'),
('KDA0000000456', '1', '4.1', 'Menyajikan contoh-contoh kitab Veda Sruti dan Veda Smerti sebagai sumber hukum Hindu', 'MPL01', 'agm04', 'KLS05', 'SM02'),
('KDA0000000457', '2', '4.2', 'Menerapkan ajaran Catur Marga Yoga sebagai jalan mencapai kesempurnaan hidup', 'MPL01', 'agm04', 'KLS05', 'SM02'),
('KDA0000000458', '3', '4.3', 'Menyajikan ajaran Cadhu Sakti atas kemahakuasaan Sang Hyang Widhi penguasa alam semesta', 'MPL01', 'agm04', 'KLS05', 'SM02'),
('KDA0000000459', '4', '4.4', 'Menerapkan ajaran Catur Guru dalam kehidupan sehari-hari', 'MPL01', 'agm04', 'KLS05', 'SM02'),
('KDA0000000460', '5', '4.5', 'Menyajikan bentuk dan struktur tempat suci dalam agama Hindu', 'MPL01', 'agm04', 'KLS05', 'SM02'),
('KDA0000000461', '1', '4.1', 'Menyajikan pengetahuan faktual tentang masa bertapa dan gagguan mara', 'MPL01', 'agm05', 'KLS05', 'SM02'),
('KDA0000000462', '2', '4.2', 'Menyajikan pengetahuan konseptual tentang delapan kondisi duniawi dan hakikat perbedaan kehidupan menurut Ajaran Buddha', 'MPL01', 'agm05', 'KLS05', 'SM02'),
('KDA0000000463', '3', '4.3', 'Mempraktikkan cara-cara berdana yang baik dan benar', 'MPL01', 'agm05', 'KLS05', 'SM02'),
('KDA0000000464', '4', '4.4', 'Menyajikan empat macam jalan kesuksesan dan empat macam teman sejati', 'MPL01', 'agm05', 'KLS05', 'SM02'),
('KDA0000000465', '1', '4.1', 'Mempraktikkan cara menjaga kebersihan badan dan hati dengan jingzuo', 'MPL01', 'agm06', 'KLS05', 'SM02'),
('KDA0000000466', '2', '4.2', 'Menceritakan pengalaman melaksanakan sembahyang kepada Tian', 'MPL01', 'agm06', 'KLS05', 'SM02'),
('KDA0000000467', '3', '4.3', 'Membuat tulisan terkait nilai-nilai kebajikan yang terkandung dalam sembahyang serta berkaitan dengan perubahan musim dan keharmonisan alam', 'MPL01', 'agm06', 'KLS05', 'SM02'),
('KDA0000000468', '4', '4.4', 'Mempraktikkan cara sembahyang kepada leluhur', 'MPL01', 'agm06', 'KLS05', 'SM02'),
('KDA0000000469', '5', '4.5', 'Menggambarkan silsilah keluarga besar dari pihak ayah dan ibu serta mencari tahu marganya', 'MPL01', 'agm06', 'KLS05', 'SM02'),
('KDA0000000470', '6', '4.6', 'Membuat mindmap tentang nabi purba dan raja suci dengan karya-karyanya', 'MPL01', 'agm06', 'KLS05', 'SM02'),
('KDA0000000471', '1', '4.1.1', 'membaca Q.S. Al-Kafirun, Q.S. Al-Maidah/5:2-3 dan Q.S. al-Hujurat/49:12-13 dengan jelas dan benar', 'MPL01', 'agm01', 'KLS06', 'SM01'),
('KDA0000000472', '2', '4.1.2', 'menulis Q.S. Al-Kafirun, Q.S. Al-Maidah/5:2-3 dan Q.S. al-Hujurat/49:12-13 dengan benar', 'MPL01', 'agm01', 'KLS06', 'SM01'),
('KDA0000000473', '3', '4.1.3', 'menunjukkan hafalan Q.S. Al-Kafirun, Q.S. Al-Maidah/5:2-3 dan Q.S. al-Hujurat/49:12-13 dengan benar', 'MPL01', 'agm01', 'KLS06', 'SM01'),
('KDA0000000474', '4', '4.2', 'membaca al-Asmau al-Husna: As-Samad, Al-Muqtadir, Al-Muqaddim, dan Al-Baqi dengan jelas dan benar', 'MPL01', 'agm01', 'KLS06', 'SM01'),
('KDA0000000475', '5', '4.3', 'menunjukkan contoh hikmah beriman kepada hari akhir yang dapat membentuk perilaku akhlak mulia', 'MPL01', 'agm01', 'KLS06', 'SM01'),
('KDA0000000476', '6', '4.4', 'menunjukkan hikmah beriman kepada qadha dan qadar yang dapat membentuk perilaku akhlak mulia', 'MPL01', 'agm01', 'KLS06', 'SM01'),
('KDA0000000477', '7', '4.5', 'mencontohkan perilaku hormat dan patuh kepada orangtua, guru, dan sesama anggota keluarga', 'MPL01', 'agm01', 'KLS06', 'SM01'),
('KDA0000000478', '8', '4.6', 'menunjukkan sikap toleran dan simpatik terhadap sesama sebagai wujud dari pemahaman Q.S. al-Kafirun', 'MPL01', 'agm01', 'KLS06', 'SM01'),
('KDA0000000479', '9', '4.7', 'menunjukkan hikmah zakat, infaq, dan sedekah sebagai implementasi rukun Islam', 'MPL01', 'agm01', 'KLS06', 'SM01'),
('KDA0000000480', '10', '4.8', 'menceritakan kisah keteladanan Nabi Yunus a.s.', 'MPL01', 'agm01', 'KLS06', 'SM01'),
('KDA0000000481', '11', '4.9', 'menceritakan kisah keteladanan Nabi Zakariya a.s.', 'MPL01', 'agm01', 'KLS06', 'SM01'),
('KDA0000000482', '12', '4.10', 'menceritakan kisah keteladanan Nabi Yahya a.s.', 'MPL01', 'agm01', 'KLS06', 'SM01'),
('KDA0000000483', '13', '4.11', 'menceritakan kisah keteladanan Nabi Isa a.s.', 'MPL01', 'agm01', 'KLS06', 'SM01'),
('KDA0000000484', '14', '4.12', 'menceritakan kisah keteladanan Nabi Muhammad saw.', 'MPL01', 'agm01', 'KLS06', 'SM01'),
('KDA0000000485', '15', '4.13', 'menceritakan kisah keteladanan sahabat-sahabat Nabi Muhammad saw.', 'MPL01', 'agm01', 'KLS06', 'SM01'),
('KDA0000000486', '16', '4.14', 'menceritakan kisah keteladanan Ashabul Kahfi sebagaimana terdapat dalam al-Qur’an', 'MPL01', 'agm01', 'KLS06', 'SM01'),
('KDA0000000487', '1', '4.1', 'menyajikan contoh ibadah yang berkenan kepada Allah', 'MPL01', 'agm02', 'KLS06', 'SM01'),
('KDA0000000488', '2', '4.2', 'mempraktikkan kesetiaan beribadah, berdoa, dan membaca Alkitab', 'MPL01', 'agm02', 'KLS06', 'SM01'),
('KDA0000000489', '3', '4.3', 'mendemonstrasikan berbagai bentuk pelayanan terhadap sesama sebagai ibadah yang sejati kepada Allah', 'MPL01', 'agm02', 'KLS06', 'SM01'),
('KDA0000000490', '4', '4.4', 'membuat proyek yang melibatkan seluruh hidupnya sebagai ibadah yang sejati kepada Allah', 'MPL01', 'agm02', 'KLS06', 'SM01'),
('KDA0000000491', '1', '4.1', 'melakukan aktivitas (misalnya menceritakan/menuliskan refleksi/puisi) mengenai rasa bangga yang dimiliki sebagai warga negara Indonesia yang beranekaragam', 'MPL01', 'agm03', 'KLS06', 'SM01'),
('KDA0000000492', '2', '4.2', 'melakukan aktivitas (misalnya membuat slogan/motto/menggambar/puisi) yang melukiskan suasana keprihatinan sebagai warga dunia', 'MPL01', 'agm03', 'KLS06', 'SM01'),
('KDA0000000493', '3', '4.3', 'melakukan aktivitas (misalnya menuliskan refleksi/puisi/bermain peran) tentang karya keselamatan Allah yang diwartakan para nabi', 'MPL01', 'agm03', 'KLS06', 'SM01'),
('KDA0000000494', '4', '4.4', 'melakukan aktifitas (menuliskan refleksi/puisi, dan sebagainya) tentang karya keselamatan Allah dalam diri Yesus Kristus', 'MPL01', 'agm03', 'KLS06', 'SM01'),
('KDA0000000495', '5', '4.5', 'melakukan aktifitas (misalnya membuat rangkuman/merencanakan kegiatan) yang berkaitan dengan tugas dan sifat gereja', 'MPL01', 'agm03', 'KLS06', 'SM01'),
('KDA0000000496', '6', '4.6', 'melakukan aktifitas (misalnya membuat rangkuman/merencanakan kegiatan/mewawancarai tokoh gereja) yang berkaitan dengan tugas pelayanan gereja', 'MPL01', 'agm03', 'KLS06', 'SM01'),
('KDA0000000497', '7', '4.7', 'melakukan aktivitas (misalnya menuliskan refleksi/membuat kliping/membuat slogan/merumuskan doa) berkaitan dengan ajaran gereja tentang hati nurani', 'MPL01', 'agm03', 'KLS06', 'SM01'),
('KDA0000000498', '1', '4.1', 'menyajikan dengan cara melantunkan sloka-sloka dalam Bhagavadgita', 'MPL01', 'agm04', 'KLS06', 'SM01'),
('KDA0000000499', '2', '4.2', 'menyajikan contoh Panca Sraddha dalam kehidupan', 'MPL01', 'agm04', 'KLS06', 'SM01'),
('KDA0000000500', '3', '4.3', 'menyajikan cerita Tattvam Asi yang tertuang dalam Itihasa', 'MPL01', 'agm04', 'KLS06', 'SM01'),
('KDA0000000501', '4', '4.4', 'menyajikan contoh perilaku Sad Ripu yang harus dikendalikan', 'MPL01', 'agm04', 'KLS06', 'SM01'),
('KDA0000000502', '5', '4.5', 'menerapkan ajaran Tri Rna dalam kehidupan sehari-hari', 'MPL01', 'agm04', 'KLS06', 'SM01'),
('KDA0000000503', '1', '4.1', 'menyajikan pengetahuan faktual tentang keajaiban-keajaiban saat Petapa Gotama mencapai Penerangan Sempurna', 'MPL01', 'agm05', 'KLS06', 'SM01'),
('KDA0000000504', '2', '4.2', 'menyajikan pengetahuan konseptual tentang Sepuluh Kesempurnaan (Dasa Paramita) dan kisah perumpamaan populer tentang perilaku bijaksana', 'MPL01', 'agm05', 'KLS06', 'SM01'),
('KDA0000000505', '3', '4.3', 'mempraktikkan meditasi pernapasan dan cinta kasih', 'MPL01', 'agm05', 'KLS06', 'SM01'),
('KDA0000000506', '4', '4.4', 'menyajikan pengetahuan konseptual tentang tujuan akhir umat Buddha', 'MPL01', 'agm05', 'KLS06', 'SM01'),
('KDA0000000507', '1', '4.1', 'menceritakan contoh-contoh karunia Tian dan karunia pemberian manusia yang diterima oleh keluarga', 'MPL01', 'agm06', 'KLS06', 'SM01'),
('KDA0000000508', '2', '4.2', 'menceritakan contoh kisah keteladanan hidup seperti Yanhui', 'MPL01', 'agm06', 'KLS06', 'SM01'),
('KDA0000000509', '3', '4.3', 'membuat visualisasi ayat yang berhubungan dengan alam semesta (ayat telah ditentukan)', 'MPL01', 'agm06', 'KLS06', 'SM01'),
('KDA0000000510', '4', '4.4', 'menuliskan arti lambang Matakin dan makna yang terkandung di dalamnya', 'MPL01', 'agm06', 'KLS06', 'SM01'),
('KDA0000000511', '5', '4.5', 'menceritakan pengalaman pribadi yang sesuai dengan keteladanan Minshun', 'MPL01', 'agm06', 'KLS06', 'SM01'),
('KDA0000000512', '6', '4.6', 'menuliskan hal-hal dalam kisah perjalanan Zhisheng Kongzi yang paling berkesan', 'MPL01', 'agm06', 'KLS06', 'SM01'),
('KDA0000000513', '1', '4.1.1', 'membaca Q.S. Al-Kafirun, Q.S. Al-Maidah/5:2-3 dan Q.S. al-Hujurat/49:12-13 dengan jelas dan benar', 'MPL01', 'agm01', 'KLS06', 'SM02'),
('KDA0000000514', '2', '4.1.2', 'menulis Q.S. Al-Kafirun, Q.S. Al-Maidah/5:2-3 dan Q.S. al-Hujurat/49:12-13 dengan benar', 'MPL01', 'agm01', 'KLS06', 'SM02'),
('KDA0000000515', '3', '4.1.3', 'menunjukkan hafalan Q.S. Al-Kafirun, Q.S. Al-Maidah/5:2-3 dan Q.S. al-Hujurat/49:12-13 dengan benar', 'MPL01', 'agm01', 'KLS06', 'SM02'),
('KDA0000000516', '4', '4.2', 'membaca al-Asmau al-Husna: As-Samad, Al-Muqtadir, Al-Muqaddim, dan Al-Baqi dengan jelas dan benar', 'MPL01', 'agm01', 'KLS06', 'SM02'),
('KDA0000000517', '5', '4.3', 'menunjukkan contoh hikmah beriman kepada hari akhir yang dapat membentuk perilaku akhlak mulia', 'MPL01', 'agm01', 'KLS06', 'SM02'),
('KDA0000000518', '6', '4.4', 'menunjukkan hikmah beriman kepada qadha dan qadar yang dapat membentuk perilaku akhlak mulia', 'MPL01', 'agm01', 'KLS06', 'SM02'),
('KDA0000000519', '7', '4.5', 'mencontohkan perilaku hormat dan patuh kepada orangtua, guru, dan sesama anggota keluarga', 'MPL01', 'agm01', 'KLS06', 'SM02'),
('KDA0000000520', '8', '4.6', 'menunjukkan sikap toleran dan simpatik terhadap sesama sebagai wujud dari pemahaman Q.S. al-Kafirun', 'MPL01', 'agm01', 'KLS06', 'SM02'),
('KDA0000000521', '9', '4.7', 'menunjukkan hikmah zakat, infaq, dan sedekah sebagai implementasi rukun Islam', 'MPL01', 'agm01', 'KLS06', 'SM02'),
('KDA0000000522', '10', '4.8', 'menceritakan kisah keteladanan Nabi Yunus a.s.', 'MPL01', 'agm01', 'KLS06', 'SM02'),
('KDA0000000523', '11', '4.9', 'menceritakan kisah keteladanan Nabi Zakariya a.s.', 'MPL01', 'agm01', 'KLS06', 'SM02'),
('KDA0000000524', '12', '4.10', 'menceritakan kisah keteladanan Nabi Yahya a.s.', 'MPL01', 'agm01', 'KLS06', 'SM02'),
('KDA0000000525', '13', '4.11', 'menceritakan kisah keteladanan Nabi Isa a.s.', 'MPL01', 'agm01', 'KLS06', 'SM02'),
('KDA0000000526', '14', '4.12', 'menceritakan kisah keteladanan Nabi Muhammad saw.', 'MPL01', 'agm01', 'KLS06', 'SM02'),
('KDA0000000527', '15', '4.13', 'menceritakan kisah keteladanan sahabat-sahabat Nabi Muhammad saw.', 'MPL01', 'agm01', 'KLS06', 'SM02'),
('KDA0000000528', '16', '4.14', 'menceritakan kisah keteladanan Ashabul Kahfi sebagaimana terdapat dalam al-Qur’an', 'MPL01', 'agm01', 'KLS06', 'SM02'),
('KDA0000000529', '1', '4.1', 'menyajikan contoh ibadah yang berkenan kepada Allah', 'MPL01', 'agm02', 'KLS06', 'SM02'),
('KDA0000000530', '2', '4.2', 'mempraktikkan kesetiaan beribadah, berdoa, dan membaca Alkitab', 'MPL01', 'agm02', 'KLS06', 'SM02'),
('KDA0000000531', '3', '4.3', 'mendemonstrasikan berbagai bentuk pelayanan terhadap sesama sebagai ibadah yang sejati kepada Allah', 'MPL01', 'agm02', 'KLS06', 'SM02'),
('KDA0000000532', '4', '4.4', 'membuat proyek yang melibatkan seluruh hidupnya sebagai ibadah yang sejati kepada Allah', 'MPL01', 'agm02', 'KLS06', 'SM02'),
('KDA0000000533', '1', '4.1', 'melakukan aktivitas (misalnya menceritakan/menuliskan refleksi/puisi) mengenai rasa bangga yang dimiliki sebagai warga negara Indonesia yang beranekaragam', 'MPL01', 'agm03', 'KLS06', 'SM02'),
('KDA0000000534', '2', '4.2', 'melakukan aktivitas (misalnya membuat slogan/motto/menggambar/puisi) yang melukiskan suasana keprihatinan sebagai warga dunia', 'MPL01', 'agm03', 'KLS06', 'SM02'),
('KDA0000000535', '3', '4.3', 'melakukan aktivitas (misalnya menuliskan refleksi/puisi/bermain peran) tentang karya keselamatan Allah yang diwartakan para nabi', 'MPL01', 'agm03', 'KLS06', 'SM02'),
('KDA0000000536', '4', '4.4', 'melakukan aktifitas (menuliskan refleksi/puisi, dan sebagainya) tentang karya keselamatan Allah dalam diri Yesus Kristus', 'MPL01', 'agm03', 'KLS06', 'SM02'),
('KDA0000000537', '5', '4.5', 'melakukan aktifitas (misalnya membuat rangkuman/merencanakan kegiatan) yang berkaitan dengan tugas dan sifat gereja', 'MPL01', 'agm03', 'KLS06', 'SM02'),
('KDA0000000538', '6', '4.6', 'melakukan aktifitas (misalnya membuat rangkuman/merencanakan kegiatan/mewawancarai tokoh gereja) yang berkaitan dengan tugas pelayanan gereja', 'MPL01', 'agm03', 'KLS06', 'SM02'),
('KDA0000000539', '7', '4.7', 'melakukan aktivitas (misalnya menuliskan refleksi/membuat kliping/membuat slogan/merumuskan doa) berkaitan dengan ajaran gereja tentang hati nurani', 'MPL01', 'agm03', 'KLS06', 'SM02'),
('KDA0000000540', '1', '4.1', 'menyajikan dengan cara melantunkan sloka-sloka dalam Bhagavadgita', 'MPL01', 'agm04', 'KLS06', 'SM02'),
('KDA0000000541', '2', '4.2', 'menyajikan contoh Panca Sraddha dalam kehidupan', 'MPL01', 'agm04', 'KLS06', 'SM02'),
('KDA0000000542', '3', '4.3', 'menyajikan cerita Tattvam Asi yang tertuang dalam Itihasa', 'MPL01', 'agm04', 'KLS06', 'SM02'),
('KDA0000000543', '4', '4.4', 'menyajikan contoh perilaku Sad Ripu yang harus dikendalikan', 'MPL01', 'agm04', 'KLS06', 'SM02'),
('KDA0000000544', '5', '4.5', 'menerapkan ajaran Tri Rna dalam kehidupan sehari-hari', 'MPL01', 'agm04', 'KLS06', 'SM02'),
('KDA0000000545', '1', '4.1', 'menyajikan pengetahuan faktual tentang keajaiban-keajaiban saat Petapa Gotama mencapai Penerangan Sempurna', 'MPL01', 'agm05', 'KLS06', 'SM02'),
('KDA0000000546', '2', '4.2', 'menyajikan pengetahuan konseptual tentang Sepuluh Kesempurnaan (Dasa Paramita) dan kisah perumpamaan populer tentang perilaku bijaksana', 'MPL01', 'agm05', 'KLS06', 'SM02'),
('KDA0000000547', '3', '4.3', 'mempraktikkan meditasi pernapasan dan cinta kasih', 'MPL01', 'agm05', 'KLS06', 'SM02'),
('KDA0000000548', '4', '4.4', 'menyajikan pengetahuan konseptual tentang tujuan akhir umat Buddha', 'MPL01', 'agm05', 'KLS06', 'SM02'),
('KDA0000000549', '1', '4.1', 'menceritakan contoh-contoh karunia Tian dan karunia pemberian manusia yang diterima oleh keluarga', 'MPL01', 'agm06', 'KLS06', 'SM02'),
('KDA0000000550', '2', '4.2', 'menceritakan contoh kisah keteladanan hidup seperti Yanhui', 'MPL01', 'agm06', 'KLS06', 'SM02'),
('KDA0000000551', '3', '4.3', 'membuat visualisasi ayat yang berhubungan dengan alam semesta (ayat telah ditentukan)', 'MPL01', 'agm06', 'KLS06', 'SM02'),
('KDA0000000552', '4', '4.4', 'menuliskan arti lambang Matakin dan makna yang terkandung di dalamnya', 'MPL01', 'agm06', 'KLS06', 'SM02'),
('KDA0000000553', '5', '4.5', 'menceritakan pengalaman pribadi yang sesuai dengan keteladanan Minshun', 'MPL01', 'agm06', 'KLS06', 'SM02'),
('KDA0000000554', '6', '4.6', 'menuliskan hal-hal dalam kisah perjalanan Zhisheng Kongzi yang paling berkesan', 'MPL01', 'agm06', 'KLS06', 'SM02'),
('KDA0000000555', '6', '4.6', 'rajin belajar dan bersembahyang seperti teladan zhisheng Kongzi semasa kecil', 'MPL01', 'agm06', 'KLS01', 'SM01');

--
-- Trigger `kd_agama_ki4`
--
DELIMITER $$
CREATE TRIGGER `kd_agmki4_berubah` AFTER UPDATE ON `kd_agama_ki4` FOR EACH ROW BEGIN
	UPDATE nilai_agamakd_ki4 SET nomor_kd = NEW.nomor_kd, deskripsi = NEW.deskripsi WHERE id_kd = OLD.id_kd;
    END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `kd_keterampilan`
--

CREATE TABLE `kd_keterampilan` (
  `id_kd` char(15) CHARACTER SET latin1 NOT NULL,
  `nom` varchar(20) CHARACTER SET latin1 NOT NULL,
  `nomor_kd` varchar(20) CHARACTER SET latin1 NOT NULL,
  `deskripsi` varchar(225) CHARACTER SET latin1 NOT NULL,
  `id_mapel` char(15) CHARACTER SET latin1 NOT NULL,
  `id_kelas` char(15) CHARACTER SET latin1 NOT NULL,
  `id_semester` char(15) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `kd_keterampilan`
--

INSERT INTO `kd_keterampilan` (`id_kd`, `nom`, `nomor_kd`, `deskripsi`, `id_mapel`, `id_kelas`, `id_semester`) VALUES
('KTM0000000001', '1', '4.1', 'menceritakan simbol-simbol sila Pancasila pada Lambang Garuda sila Pancasila', 'MPL02', 'KLS01', 'SM01'),
('KTM0000000002', '2', '4.2', 'menceritakan kegiatan sesuai dengan aturan yang berlaku dalam kehidupan sehari-hari di rumah', 'MPL02', 'KLS01', 'SM01'),
('KTM0000000003', '3', '4.3', 'menceritakan pengalaman kebersamaan dalam keberagaman kehidupan individu di rumah', 'MPL02', 'KLS01', 'SM01'),
('KTM0000000004', '4', '4.4', 'menceritakan pengalaman kerjasama dalam keberagaman di rumah', 'MPL02', 'KLS01', 'SM01'),
('KTM0000000005', '1', '4.1', 'mempraktikkan kegiatan persiapan membaca permulaan dengan benar', 'MPL03', 'KLS01', 'SM01'),
('KTM0000000006', '2', '4.2', 'mempraktikkan kegiatan persiapan menulis permulaan dengan benar', 'MPL03', 'KLS01', 'SM01'),
('KTM0000000007', '3', '4.3', 'melafalkan bunyi vokal dan konsonan dalam kata bahasa Indonesia atau bahasa daerah', 'MPL03', 'KLS01', 'SM01'),
('KTM0000000008', '4', '4.4', 'menyampaikan penjelasan  tentang anggota tubuh dan panca indera serta perawatannya menggunakan kosakata bahasa Indonesia dengan bantuan bahasa daerah secara lisan dan/atau tulis', 'MPL03', 'KLS01', 'SM01'),
('KTM0000000009', '5', '4.5', 'mengemukakan penjelasan tentang cara memelihara kesehatan dengan pelafalan kosakata Bahasa Indonesia yang tepat dan dibantu dengan bahasa daerah', 'MPL03', 'KLS01', 'SM01'),
('KTM0000000010', '6', '4.6', 'menggunakan kosakata bahasa Indonesia dengan ejaan yang tepat dan dibantu dengan bahasa daerah mengenai berbagai jenis benda di lingkungan sekitar dalam teks tulis sederhana', 'MPL03', 'KLS01', 'SM01'),
('KTM0000000011', '7', '4.7', 'menyampaikan penjelasan dengan kosakata Bahasa Indonesia dan dibantu dengan bahasa daerah mengenai peristiwa siang dan malam dalam teks tulis dan gambar', 'MPL03', 'KLS01', 'SM01'),
('KTM0000000012', '8', '4.8', 'mempraktikan ungkapan terima kasih, permintaan maaf, tolong, dan pemberian pujian, dengan menggunakan bahasa yang santun kepada orang lain secara lisan dan tulis', 'MPL03', 'KLS01', 'SM01'),
('KTM0000000013', '9', '4.9', 'menggunakan kosakata dan ungkapan yang tepat untuk perkenalan diri, keluarga, dan orang-orang di tempat tinggalnya secara sederhana dalam bentuk lisan dan tulis', 'MPL03', 'KLS01', 'SM01'),
('KTM0000000014', '10', '4.10', 'menggunakan kosakata yang tepat dalam percakapan tentang hubungan kekeluargaan dengan menggunakan bantuan gambar/bagan silsilah keluarga', 'MPL03', 'KLS01', 'SM01'),
('KTM0000000015', '11', '4.11', 'melisankan puisi anak atau syair lagu (berisi ungkapan kekaguman, kebanggaan, hormat kepada orang tua, kasih sayang, atau persahabatan) sebagai bentuk ungkapan diri', 'MPL03', 'KLS01', 'SM01'),
('KTM0000000016', '1', '4.1', 'menyajikan bilangan cacah sampai dengan 99 yang bersesuaian dengan banyak anggota kumpulan objek yang disajikan', 'MPL04', 'KLS01', 'SM01'),
('KTM0000000017', '2', '4.2', 'menuliskan lambang bilangan sampai dua angka yang menyatakan banyak anggota suatu kumpulan objek dengan ide nilai tempat', 'MPL04', 'KLS01', 'SM01'),
('KTM0000000018', '3', '4.3', 'mengurutkan bilangan-bilangan sampai dua angka dari bilangan terkecil ke bilangan terbesar atau sebaliknya dengan menggunakan kumpulan benda-benda konkret', 'MPL04', 'KLS01', 'SM01'),
('KTM0000000019', '4', '4.4', 'menyelesaikan masalah kehidupan sehari-hari yang berkaitan dengan penjumlahan dan pengurangan bilangan yang melibatkan bilangan cacah sampai dengan 99', 'MPL04', 'KLS01', 'SM01'),
('KTM0000000020', '5', '4.5', 'memprediksi dan membuat pola bilangan yang berkaitan dengan kumpulan benda/gambar/gerakan atau lainnya', 'MPL04', 'KLS01', 'SM01'),
('KTM0000000021', '6', '4.6', 'mengelompokkan bangun ruang dan bangun datar berdasarkan sifat tertentu dengan menggunakan berbagai benda konkret', 'MPL04', 'KLS01', 'SM01'),
('KTM0000000022', '7', '4.7', 'menyusun bangun-bangun datar untuk membentuk pola pengubinan', 'MPL04', 'KLS01', 'SM01'),
('KTM0000000023', '8', '4.8', 'melakukan pengukuran panjang dan berat dalam satuan tidak baku dengan menggunakan benda/situasi konkret', 'MPL04', 'KLS01', 'SM01'),
('KTM0000000024', '9', '4.9', 'mengurutkan benda/kejadian/ keadaan berdasarkan panjang, berat, lamanya waktu, dan suhu', 'MPL04', 'KLS01', 'SM01'),
('KTM0000000025', '1', '4.1', 'membuat karya ekspresi dua dan tiga dimensi', 'MPL05', 'KLS01', 'SM01'),
('KTM0000000026', '2', '4.2', 'menirukan elemen musik melalui lagu', 'MPL05', 'KLS01', 'SM01'),
('KTM0000000027', '3', '4.3', 'meragakan gerak anggota tubuh melalui tari', 'MPL05', 'KLS01', 'SM01'),
('KTM0000000028', '4', '4.4', 'membuat karya dari bahan alam', 'MPL05', 'KLS01', 'SM01'),
('KTM0000000029', '1', '4.1', 'mempraktikkan gerak dasar lokomotor sesuai dengan konsep tubuh, ruang, usaha, dan keterhubungan dalam berbagai bentuk permainan sederhana dan atau tradisional', 'MPL06', 'KLS01', 'SM01'),
('KTM0000000030', '2', '4.2', 'mempraktikkan gerak dasar non-lokomotor sesuai dengan konsep tubuh, ruang, usaha, dan keterhubungan dalam berbagai bentuk permainan sederhana dan atau tradisional', 'MPL06', 'KLS01', 'SM01'),
('KTM0000000031', '3', '4.3', 'mempraktikkan pola gerak dasar manipulatif sesuai dengan konsep tubuh, ruang, usaha, dan keterhubungan dalam berbagai bentuk permainan sederhana dan atau tradisional', 'MPL06', 'KLS01', 'SM01'),
('KTM0000000032', '4', '4.4', 'mempraktikkan sikap tubuh (duduk, membaca, berdiri, jalan), dan bergerak secara lentur serta seimbang dalam rangka pembentukan tubuh melalui permainan sederhana dan atau tradisional', 'MPL06', 'KLS01', 'SM01'),
('KTM0000000033', '5', '4.5', 'mempraktikkan berbagai pola gerak dominan (bertumpu, bergantung, keseimbangan, berpindah/lokomotor, tolakan, putaran, ayunan, melayang, dan mendarat) dalam aktivitas senam lantai', 'MPL06', 'KLS01', 'SM01'),
('KTM0000000034', '6', '4.6', 'mempraktikkan gerak dasar lokomotor dan non-lokomotor sesuai dengan irama (ketukan) tanpa/dengan musik dalam aktivitas gerak berirama', 'MPL06', 'KLS01', 'SM01'),
('KTM0000000035', '7', '4.7', 'mempraktikkan berbagai pengenalan aktivitas air dan menjaga keselamatan diri/orang lain dalam aktivitas air***', 'MPL06', 'KLS01', 'SM01'),
('KTM0000000036', '8', '4.8', 'menceritakan bagian-bagian tubuh, bagian tubuh yang boleh dan tidak boleh disentuh orang lain, cara menjaga kebersihannya, dan kebersihan pakaian', 'MPL06', 'KLS01', 'SM01'),
('KTM0000000037', '9', '4.9', 'menceritakan cara menjaga kebersihan lingkungan (tempat tidur, rumah, kelas, lingkungan sekolah).', 'MPL06', 'KLS01', 'SM01'),
('KTM0000000038', '1', '4.1', 'KD Mulok 1 Aspek Keterampilan 4.1', 'MPL07', 'KLS01', 'SM01'),
('KTM0000000039', '2', '4.2', 'KD Mulok 1 Aspek Keterampilan 4.2', 'MPL07', 'KLS01', 'SM01'),
('KTM0000000040', '3', '4.3', 'KD Mulok 1 Aspek Keterampilan 4.3', 'MPL07', 'KLS01', 'SM01'),
('KTM0000000041', '4', '4.4', 'KD Mulok 1 Aspek Keterampilan 4.4', 'MPL07', 'KLS01', 'SM01'),
('KTM0000000042', '5', '4.5', 'KD Mulok 1 Aspek Keterampilan 4.5', 'MPL07', 'KLS01', 'SM01'),
('KTM0000000043', '6', '4.6', 'KD Mulok 1 Aspek Keterampilan 4.6', 'MPL07', 'KLS01', 'SM01'),
('KTM0000000044', '7', '4.7', 'KD Mulok 1 Aspek Keterampilan 4.7', 'MPL07', 'KLS01', 'SM01'),
('KTM0000000045', '8', '4.8', 'KD Mulok 1 Aspek Keterampilan 4.8', 'MPL07', 'KLS01', 'SM01'),
('KTM0000000046', '9', '4.9', 'KD Mulok 1 Aspek Keterampilan 4.9', 'MPL07', 'KLS01', 'SM01'),
('KTM0000000047', '10', '4.10', 'KD Mulok 1 Aspek Keterampilan 4.10', 'MPL07', 'KLS01', 'SM01'),
('KTM0000000048', '1', '4.1', 'KD Mulok 2 Aspek Keterampilan 4.1', 'MPL08', 'KLS01', 'SM01'),
('KTM0000000049', '2', '4.2', 'KD Mulok 2 Aspek Keterampilan 4.2', 'MPL08', 'KLS01', 'SM01'),
('KTM0000000050', '3', '4.3', 'KD Mulok 2 Aspek Keterampilan 4.3', 'MPL08', 'KLS01', 'SM01'),
('KTM0000000051', '4', '4.4', 'KD Mulok 2 Aspek Keterampilan 4.4', 'MPL08', 'KLS01', 'SM01'),
('KTM0000000052', '5', '4.5', 'KD Mulok 2 Aspek Keterampilan 4.5', 'MPL08', 'KLS01', 'SM01'),
('KTM0000000053', '6', '4.6', 'KD Mulok 2 Aspek Keterampilan 4.6', 'MPL08', 'KLS01', 'SM01'),
('KTM0000000054', '7', '4.7', 'KD Mulok 2 Aspek Keterampilan 4.7', 'MPL08', 'KLS01', 'SM01'),
('KTM0000000055', '8', '4.8', 'KD Mulok 2 Aspek Keterampilan 4.8', 'MPL08', 'KLS01', 'SM01'),
('KTM0000000056', '9', '4.9', 'KD Mulok 2 Aspek Keterampilan 4.9', 'MPL08', 'KLS01', 'SM01'),
('KTM0000000057', '10', '4.10', 'KD Mulok 2 Aspek Keterampilan 4.10', 'MPL08', 'KLS01', 'SM01'),
('KTM0000000058', '1', '4.1', 'KD Mulok 3 Aspek Keterampilan 4.1', 'MPL09', 'KLS01', 'SM01'),
('KTM0000000059', '2', '4.2', 'KD Mulok 3 Aspek Keterampilan 4.2', 'MPL09', 'KLS01', 'SM01'),
('KTM0000000060', '3', '4.3', 'KD Mulok 3 Aspek Keterampilan 4.3', 'MPL09', 'KLS01', 'SM01'),
('KTM0000000061', '4', '4.4', 'KD Mulok 3 Aspek Keterampilan 4.4', 'MPL09', 'KLS01', 'SM01'),
('KTM0000000062', '5', '4.5', 'KD Mulok 3 Aspek Keterampilan 4.5', 'MPL09', 'KLS01', 'SM01'),
('KTM0000000063', '6', '4.6', 'KD Mulok 3 Aspek Keterampilan 4.6', 'MPL09', 'KLS01', 'SM01'),
('KTM0000000064', '7', '4.7', 'KD Mulok 3 Aspek Keterampilan 4.7', 'MPL09', 'KLS01', 'SM01'),
('KTM0000000065', '8', '4.8', 'KD Mulok 3 Aspek Keterampilan 4.8', 'MPL09', 'KLS01', 'SM01'),
('KTM0000000066', '9', '4.9', 'KD Mulok 3 Aspek Keterampilan 4.9', 'MPL09', 'KLS01', 'SM01'),
('KTM0000000068', '1', '4.1', 'menceritakan simbol-simbol sila Pancasila pada Lambang Garuda sila Pancasila', 'MPL02', 'KLS01', 'SM02'),
('KTM0000000069', '2', '4.2', 'menceritakan kegiatan sesuai dengan aturan yang berlaku dalam kehidupan sehari-hari di rumah', 'MPL02', 'KLS01', 'SM02'),
('KTM0000000070', '3', '4.3', 'menceritakan pengalaman kebersamaan dalam keberagaman kehidupan individu di rumah', 'MPL02', 'KLS01', 'SM02'),
('KTM0000000071', '4', '4.4', 'menceritakan pengalaman kerjasama dalam keberagaman di rumah', 'MPL02', 'KLS01', 'SM02'),
('KTM0000000072', '1', '4.1', 'mempraktikkan kegiatan persiapan membaca permulaan dengan benar', 'MPL03', 'KLS01', 'SM02'),
('KTM0000000073', '2', '4.2', 'mempraktikkan kegiatan persiapan menulis permulaan dengan benar', 'MPL03', 'KLS01', 'SM02'),
('KTM0000000074', '3', '4.3', 'melafalkan bunyi vokal dan konsonan dalam kata bahasa Indonesia atau bahasa daerah', 'MPL03', 'KLS01', 'SM02'),
('KTM0000000075', '4', '4.4', 'menyampaikan penjelasan  tentang anggota tubuh dan panca indera serta perawatannya menggunakan kosakata bahasa Indonesia dengan bantuan bahasa daerah secara lisan dan/atau tulis', 'MPL03', 'KLS01', 'SM02'),
('KTM0000000076', '5', '4.5', 'mengemukakan penjelasan tentang cara memelihara kesehatan dengan pelafalan kosakata Bahasa Indonesia yang tepat dan dibantu dengan bahasa daerah', 'MPL03', 'KLS01', 'SM02'),
('KTM0000000077', '6', '4.6', 'menggunakan kosakata bahasa Indonesia dengan ejaan yang tepat dan dibantu dengan bahasa daerah mengenai berbagai jenis benda di lingkungan sekitar dalam teks tulis sederhana', 'MPL03', 'KLS01', 'SM02'),
('KTM0000000078', '7', '4.7', 'menyampaikan penjelasan dengan kosakata Bahasa Indonesia dan dibantu dengan bahasa daerah mengenai peristiwa siang dan malam dalam teks tulis dan gambar', 'MPL03', 'KLS01', 'SM02'),
('KTM0000000079', '8', '4.8', 'mempraktikan ungkapan terima kasih, permintaan maaf, tolong, dan pemberian pujian, dengan menggunakan bahasa yang santun kepada orang lain secara lisan dan tulis', 'MPL03', 'KLS01', 'SM02'),
('KTM0000000080', '9', '4.9', 'menggunakan kosakata dan ungkapan yang tepat untuk perkenalan diri, keluarga, dan orang-orang di tempat tinggalnya secara sederhana dalam bentuk lisan dan tulis', 'MPL03', 'KLS01', 'SM02'),
('KTM0000000081', '10', '4.10', 'menggunakan kosakata yang tepat dalam percakapan tentang hubungan kekeluargaan dengan menggunakan bantuan gambar/bagan silsilah keluarga', 'MPL03', 'KLS01', 'SM02'),
('KTM0000000082', '11', '4.11', 'melisankan puisi anak atau syair lagu (berisi ungkapan kekaguman, kebanggaan, hormat kepada orang tua, kasih sayang, atau persahabatan) sebagai bentuk ungkapan diri', 'MPL03', 'KLS01', 'SM02'),
('KTM0000000083', '1', '4.1', 'menyajikan bilangan cacah sampai dengan 99 yang bersesuaian dengan banyak anggota kumpulan objek yang disajikan', 'MPL04', 'KLS01', 'SM02'),
('KTM0000000084', '2', '4.2', 'menuliskan lambang bilangan sampai dua angka yang menyatakan banyak anggota suatu kumpulan objek dengan ide nilai tempat', 'MPL04', 'KLS01', 'SM02'),
('KTM0000000085', '3', '4.3', 'mengurutkan bilangan-bilangan sampai dua angka dari bilangan terkecil ke bilangan terbesar atau sebaliknya dengan menggunakan kumpulan benda-benda konkret', 'MPL04', 'KLS01', 'SM02'),
('KTM0000000086', '4', '4.4', 'menyelesaikan masalah kehidupan sehari-hari yang berkaitan dengan penjumlahan dan pengurangan bilangan yang melibatkan bilangan cacah sampai dengan 99', 'MPL04', 'KLS01', 'SM02'),
('KTM0000000087', '5', '4.5', 'memprediksi dan membuat pola bilangan yang berkaitan dengan kumpulan benda/gambar/gerakan atau lainnya', 'MPL04', 'KLS01', 'SM02'),
('KTM0000000088', '6', '4.6', 'mengelompokkan bangun ruang dan bangun datar berdasarkan sifat tertentu dengan menggunakan berbagai benda konkret', 'MPL04', 'KLS01', 'SM02'),
('KTM0000000089', '7', '4.7', 'menyusun bangun-bangun datar untuk membentuk pola pengubinan', 'MPL04', 'KLS01', 'SM02'),
('KTM0000000090', '8', '4.8', 'melakukan pengukuran panjang dan berat dalam satuan tidak baku dengan menggunakan benda/situasi konkret', 'MPL04', 'KLS01', 'SM02'),
('KTM0000000091', '9', '4.9', 'mengurutkan benda/kejadian/ keadaan berdasarkan panjang, berat, lamanya waktu, dan suhu', 'MPL04', 'KLS01', 'SM02'),
('KTM0000000092', '1', '4.1', 'membuat karya ekspresi dua dan tiga dimensi', 'MPL05', 'KLS01', 'SM02'),
('KTM0000000093', '2', '4.2', 'menirukan elemen musik melalui lagu', 'MPL05', 'KLS01', 'SM02'),
('KTM0000000094', '3', '4.3', 'meragakan gerak anggota tubuh melalui tari', 'MPL05', 'KLS01', 'SM02'),
('KTM0000000095', '4', '4.4', 'membuat karya dari bahan alam', 'MPL05', 'KLS01', 'SM02'),
('KTM0000000096', '1', '4.1', 'mempraktikkan gerak dasar lokomotor sesuai dengan konsep tubuh, ruang, usaha, dan keterhubungan dalam berbagai bentuk permainan sederhana dan atau tradisional', 'MPL06', 'KLS01', 'SM02'),
('KTM0000000097', '2', '4.2', 'mempraktikkan gerak dasar non-lokomotor sesuai dengan konsep tubuh, ruang, usaha, dan keterhubungan dalam berbagai bentuk permainan sederhana dan atau tradisional', 'MPL06', 'KLS01', 'SM02'),
('KTM0000000098', '3', '4.3', 'mempraktikkan pola gerak dasar manipulatif sesuai dengan konsep tubuh, ruang, usaha, dan keterhubungan dalam berbagai bentuk permainan sederhana dan atau tradisional', 'MPL06', 'KLS01', 'SM02'),
('KTM0000000099', '4', '4.4', 'mempraktikkan sikap tubuh (duduk, membaca, berdiri, jalan), dan bergerak secara lentur serta seimbang dalam rangka pembentukan tubuh melalui permainan sederhana dan atau tradisional', 'MPL06', 'KLS01', 'SM02'),
('KTM0000000100', '5', '4.5', 'mempraktikkan berbagai pola gerak dominan (bertumpu, bergantung, keseimbangan, berpindah/lokomotor, tolakan, putaran, ayunan, melayang, dan mendarat) dalam aktivitas senam lantai', 'MPL06', 'KLS01', 'SM02'),
('KTM0000000101', '6', '4.6', 'mempraktikkan gerak dasar lokomotor dan non-lokomotor sesuai dengan irama (ketukan) tanpa/dengan musik dalam aktivitas gerak berirama', 'MPL06', 'KLS01', 'SM02'),
('KTM0000000102', '7', '4.7', 'mempraktikkan berbagai pengenalan aktivitas air dan menjaga keselamatan diri/orang lain dalam aktivitas air***', 'MPL06', 'KLS01', 'SM02'),
('KTM0000000103', '8', '4.8', 'menceritakan bagian-bagian tubuh, bagian tubuh yang boleh dan tidak boleh disentuh orang lain, cara menjaga kebersihannya, dan kebersihan pakaian', 'MPL06', 'KLS01', 'SM02'),
('KTM0000000104', '9', '4.9', 'menceritakan cara menjaga kebersihan lingkungan (tempat tidur, rumah, kelas, lingkungan sekolah).', 'MPL06', 'KLS01', 'SM02'),
('KTM0000000105', '1', '4.1', 'KD Mulok 1 Aspek Keterampilan 4.1', 'MPL07', 'KLS01', 'SM02'),
('KTM0000000106', '2', '4.2', 'KD Mulok 1 Aspek Keterampilan 4.2', 'MPL07', 'KLS01', 'SM02'),
('KTM0000000107', '3', '4.3', 'KD Mulok 1 Aspek Keterampilan 4.3', 'MPL07', 'KLS01', 'SM02'),
('KTM0000000108', '4', '4.4', 'KD Mulok 1 Aspek Keterampilan 4.4', 'MPL07', 'KLS01', 'SM02'),
('KTM0000000109', '5', '4.5', 'KD Mulok 1 Aspek Keterampilan 4.5', 'MPL07', 'KLS01', 'SM02'),
('KTM0000000110', '6', '4.6', 'KD Mulok 1 Aspek Keterampilan 4.6', 'MPL07', 'KLS01', 'SM02'),
('KTM0000000111', '7', '4.7', 'KD Mulok 1 Aspek Keterampilan 4.7', 'MPL07', 'KLS01', 'SM02'),
('KTM0000000112', '8', '4.8', 'KD Mulok 1 Aspek Keterampilan 4.8', 'MPL07', 'KLS01', 'SM02'),
('KTM0000000113', '9', '4.9', 'KD Mulok 1 Aspek Keterampilan 4.9', 'MPL07', 'KLS01', 'SM02'),
('KTM0000000114', '10', '4.10', 'KD Mulok 1 Aspek Keterampilan 4.10', 'MPL07', 'KLS01', 'SM02'),
('KTM0000000115', '1', '4.1', 'KD Mulok 2 Aspek Keterampilan 4.1', 'MPL08', 'KLS01', 'SM02'),
('KTM0000000116', '2', '4.2', 'KD Mulok 2 Aspek Keterampilan 4.2', 'MPL08', 'KLS01', 'SM02'),
('KTM0000000117', '3', '4.3', 'KD Mulok 2 Aspek Keterampilan 4.3', 'MPL08', 'KLS01', 'SM02'),
('KTM0000000118', '4', '4.4', 'KD Mulok 2 Aspek Keterampilan 4.4', 'MPL08', 'KLS01', 'SM02'),
('KTM0000000119', '5', '4.5', 'KD Mulok 2 Aspek Keterampilan 4.5', 'MPL08', 'KLS01', 'SM02'),
('KTM0000000120', '6', '4.6', 'KD Mulok 2 Aspek Keterampilan 4.6', 'MPL08', 'KLS01', 'SM02'),
('KTM0000000121', '7', '4.7', 'KD Mulok 2 Aspek Keterampilan 4.7', 'MPL08', 'KLS01', 'SM02'),
('KTM0000000122', '8', '4.8', 'KD Mulok 2 Aspek Keterampilan 4.8', 'MPL08', 'KLS01', 'SM02'),
('KTM0000000123', '9', '4.9', 'KD Mulok 2 Aspek Keterampilan 4.9', 'MPL08', 'KLS01', 'SM02'),
('KTM0000000124', '10', '4.10', 'KD Mulok 2 Aspek Keterampilan 4.10', 'MPL08', 'KLS01', 'SM02'),
('KTM0000000125', '1', '4.1', 'KD Mulok 3 Aspek Keterampilan 4.1', 'MPL09', 'KLS01', 'SM02'),
('KTM0000000126', '2', '4.2', 'KD Mulok 3 Aspek Keterampilan 4.2', 'MPL09', 'KLS01', 'SM02'),
('KTM0000000127', '3', '4.3', 'KD Mulok 3 Aspek Keterampilan 4.3', 'MPL09', 'KLS01', 'SM02'),
('KTM0000000128', '4', '4.4', 'KD Mulok 3 Aspek Keterampilan 4.4', 'MPL09', 'KLS01', 'SM02'),
('KTM0000000129', '5', '4.5', 'KD Mulok 3 Aspek Keterampilan 4.5', 'MPL09', 'KLS01', 'SM02'),
('KTM0000000130', '6', '4.6', 'KD Mulok 3 Aspek Keterampilan 4.6', 'MPL09', 'KLS01', 'SM02'),
('KTM0000000131', '7', '4.7', 'KD Mulok 3 Aspek Keterampilan 4.7', 'MPL09', 'KLS01', 'SM02'),
('KTM0000000132', '8', '4.8', 'KD Mulok 3 Aspek Keterampilan 4.8', 'MPL09', 'KLS01', 'SM02'),
('KTM0000000133', '9', '4.9', 'KD Mulok 3 Aspek Keterampilan 4.9', 'MPL09', 'KLS01', 'SM02'),
('KTM0000000134', '10', '4.10', 'KD Mulok 3 Aspek Keterampilan 4.10', 'MPL09', 'KLS01', 'SM02'),
('KTM0000000135', '1', '4.1', 'Menjelaskan hubungan gambar pada lambang Negara dengan sila-sila Pancasila', 'MPL02', 'KLS02', 'SM01'),
('KTM0000000136', '2', '4.2', 'Menceritakan kegiatan sesuai aturan dan tata tertib yang berlaku di sekolah', 'MPL02', 'KLS02', 'SM01'),
('KTM0000000137', '3', '4.3', 'Mengelompokkan jenis-jenis keberagaman karakteristik individu di sekolah', 'MPL02', 'KLS02', 'SM01'),
('KTM0000000138', '4', '4.4', 'Menceritakan pengalaman melakukan kegiatan yang mencerminkan persatuan dalam keberagaman di sekolah', 'MPL02', 'KLS02', 'SM01'),
('KTM0000000139', '1', '4.1', 'Menirukan ungkapan, ajakan, perintah, penolakan dalam cerita atau lagu anak-anak dengan bahasa yang santun', 'MPL03', 'KLS02', 'SM01'),
('KTM0000000140', '2', '4.2', 'Melaporkan penggunaan kosakata Bahasa Indonesia yang tepat atau bahasa daerah hasil pengamatan tentang keragaman benda berdasarkan bentuk dan wujudnya dalam bentuk teks tulis, lisan, dan visual', 'MPL03', 'KLS02', 'SM01'),
('KTM0000000141', '3', '4.3', 'Melaporkan penggunaan kosakata Bahasa Indonesia yang tepat atau bahasa daerah hasil pengamatan tentang lingkungan geografis, kehidupan ekonomi, sosial dan budaya di lingkungan sekitar dalam bentuk teks tulis, lisan, dan visua', 'MPL03', 'KLS02', 'SM01'),
('KTM0000000142', '4', '4.4', 'Menyajikan penggunaan kosakata bahasa Indonesia yang tepat atau bahasa daerah hasil pengamatan tentang lingkungan sehat dan lingkungan tidak sehat di lingkungan sekitar serta cara menjaga kesehatan lingkungan dalam bentuk tek', 'MPL03', 'KLS02', 'SM01'),
('KTM0000000143', '5', '4.5', 'Membacakan teks puisi anak tentang alam dan lingkungan dalam bahasa Indonesia dengan lafal, intonasi, dan ekspresi yang tepat sebagai bentuk ungkapan diri', 'MPL03', 'KLS02', 'SM01'),
('KTM0000000144', '6', '4.6', 'Menyampaikan ungkapan-ungkapan santun (menggunakan kata “maaf”, “tolong”) untuk hidup rukun dalam kemajemukan', 'MPL03', 'KLS02', 'SM01'),
('KTM0000000145', '7', '4.7', 'Menulis dengan tulisan tegak bersambung menggunakan huruf kapital (awal kalimat, nama bulan, hari, dan nama diri) serta tanda titik pada kalimat berita dan tanda tanya pada kalimat tanya dengan benar', 'MPL03', 'KLS02', 'SM01'),
('KTM0000000146', '8', '4.8', 'Menceritakan kembali teks dongeng binatang (fabel) yang menggambarkan sikap hidup rukun yang telah dibaca secara nyaring sebagai bentuk ungkapan diri', 'MPL03', 'KLS02', 'SM01'),
('KTM0000000147', '9', '4.9', 'Menirukan kata sapaan dalam dongeng secara lisan dan tulis', 'MPL03', 'KLS02', 'SM01'),
('KTM0000000148', '10', '4.10', 'Menulis teks dengan menggunakan huruf kapital (nama Tuhan, nama agama, nama orang), serta tanda titik dan tanda tanya pada akhir kalimat dengan benar', 'MPL03', 'KLS02', 'SM01'),
('KTM0000000149', '1', '4.1', 'Membaca dan menyajikan bilangan cacah dan lambangnya berdasarkan nilai tempat dengan menggunakan model konkret', 'MPL04', 'KLS02', 'SM01'),
('KTM0000000150', '2', '4.2', 'Mengurutkan bilangan-bilangan dari bilangan terkecil ke bilangan terbesar atau sebaliknya', 'MPL04', 'KLS02', 'SM01'),
('KTM0000000151', '3', '4.3', 'Menyelesaikan masalah penjumlahan dan pengurangan bilangan yang melibatkan bilangan cacah sampai dengan 999 dalam kehidupan sehari-hari serta mengaitkan penjumlahan dan pengurangan', 'MPL04', 'KLS02', 'SM01'),
('KTM0000000152', '4', '4.4', 'Menyelesaikan masalah perkalian dan pembagian yang melibatkan bilangan cacah dengan hasil kali sampai dengan 100 dalam kehidupan sehari-hari serta mengaitkan perkalian dan pembagian', 'MPL04', 'KLS02', 'SM01'),
('KTM0000000153', '5', '4.5', 'Mengurutkan nilai mata uang serta mendemonstrasikan berbagai kesetaraan pecahan mata uang', 'MPL04', 'KLS02', 'SM01'),
('KTM0000000154', '6', '4.6', 'Melakukan pengukuran panjang (termasuk jarak), berat, dan waktu dalam satuan baku, yang berkaitan dengan kehidupan sehari-hari', 'MPL04', 'KLS02', 'SM01'),
('KTM0000000155', '7', '4.7', 'Menyajikan pecahan 1/2, 1/3 , dan 1/4 yang bersesuaian dengan bagian dari keseluruhan suatu benda konkret dalam kehidupan sehari-hari', 'MPL04', 'KLS02', 'SM01'),
('KTM0000000156', '8', '4.8', 'Mengidentifikasi ruas garis dengan menggunakan model konkret bangun datar dan bangun ruang', 'MPL04', 'KLS02', 'SM01'),
('KTM0000000157', '9', '4.9', 'Mengklasifikasi bangun datar dan bangun ruang berdasarkan ciri-cirinya', 'MPL04', 'KLS02', 'SM01'),
('KTM0000000158', '10', '4.10', 'Memprediksi pola barisan bangun datar dan bangun ruang menggunakan gambar atau benda konkret', 'MPL04', 'KLS02', 'SM01'),
('KTM0000000159', '1', '4.1', 'membuat karya ekspresi dua dan tiga dimensi', 'MPL05', 'KLS02', 'SM01'),
('KTM0000000160', '2', '4.2', 'menirukan elemen musik melalui lagu', 'MPL05', 'KLS02', 'SM01'),
('KTM0000000161', '3', '4.3', 'meragakan gerak anggota tubuh melalui tari', 'MPL05', 'KLS02', 'SM01'),
('KTM0000000162', '4', '4.4', 'membuat karya dari bahan alam', 'MPL05', 'KLS02', 'SM01'),
('KTM0000000163', '1', '4.1', 'mempraktikkan gerak dasar lokomotor sesuai dengan konsep tubuh, ruang, usaha, dan keterhubungan dalam berbagai bentuk permainan sederhana dan atau tradisional', 'MPL06', 'KLS02', 'SM01'),
('KTM0000000164', '2', '4.2', 'mempraktikkan gerak dasar non-lokomotor sesuai dengan konsep tubuh, ruang, usaha, dan keterhubungan dalam berbagai bentuk permainan sederhana dan atau tradisional', 'MPL06', 'KLS02', 'SM01'),
('KTM0000000165', '3', '4.3', 'mempraktikkan pola gerak dasar manipulatif sesuai dengan konsep tubuh, ruang, usaha, dan keterhubungan dalam berbagai bentuk permainan sederhana dan atau tradisional', 'MPL06', 'KLS02', 'SM01'),
('KTM0000000166', '4', '4.4', 'mempraktikkan sikap tubuh (duduk, membaca, berdiri, jalan), dan bergerak secara lentur serta seimbang dalam rangka pembentukan tubuh melalui permainan sederhana dan atau tradisional', 'MPL06', 'KLS02', 'SM01'),
('KTM0000000167', '5', '4.5', 'mempraktikkan berbagai pola gerak dominan (bertumpu, bergantung, keseimbangan, berpindah/lokomotor, tolakan, putaran, ayunan, melayang, dan mendarat) dalam aktivitas senam lantai', 'MPL06', 'KLS02', 'SM01'),
('KTM0000000168', '6', '4.6', 'mempraktikkan gerak dasar lokomotor dan non-lokomotor sesuai dengan irama (ketukan) tanpa/dengan musik dalam aktivitas gerak berirama', 'MPL06', 'KLS02', 'SM01'),
('KTM0000000169', '7', '4.7', 'mempraktikkan berbagai pengenalan aktivitas air dan menjaga keselamatan diri/orang lain dalam aktivitas air***', 'MPL06', 'KLS02', 'SM01'),
('KTM0000000170', '8', '4.8', 'menceritakan bagian-bagian tubuh, bagian tubuh yang boleh dan tidak boleh disentuh orang lain, cara menjaga kebersihannya, dan kebersihan pakaian', 'MPL06', 'KLS02', 'SM01'),
('KTM0000000171', '9', '4.9', 'menceritakan cara menjaga kebersihan lingkungan (tempat tidur, rumah, kelas, lingkungan sekolah).', 'MPL06', 'KLS02', 'SM01'),
('KTM0000000172', '1', '4.1', 'Menjelaskan hubungan gambar pada lambang Negara dengan sila-sila Pancasila', 'MPL02', 'KLS02', 'SM012'),
('KTM0000000173', '2', '4.2', 'Menceritakan kegiatan sesuai aturan dan tata tertib yang berlaku di sekolah', 'MPL02', 'KLS02', 'SM02'),
('KTM0000000174', '3', '4.3', 'Mengelompokkan jenis-jenis keberagaman karakteristik individu di sekolah', 'MPL02', 'KLS02', 'SM02'),
('KTM0000000175', '4', '4.4', 'Menceritakan pengalaman melakukan kegiatan yang mencerminkan persatuan dalam keberagaman di sekolah', 'MPL02', 'KLS02', 'SM02'),
('KTM0000000176', '1', '4.1', 'Menirukan ungkapan, ajakan, perintah, penolakan dalam cerita atau lagu anak-anak dengan bahasa yang santun', 'MPL03', 'KLS02', 'SM02'),
('KTM0000000177', '2', '4.2', 'Melaporkan penggunaan kosakata Bahasa Indonesia yang tepat atau bahasa daerah hasil pengamatan tentang keragaman benda berdasarkan bentuk dan wujudnya dalam bentuk teks tulis, lisan, dan visual', 'MPL03', 'KLS02', 'SM02'),
('KTM0000000178', '3', '4.3', 'Melaporkan penggunaan kosakata Bahasa Indonesia yang tepat atau bahasa daerah hasil pengamatan tentang lingkungan geografis, kehidupan ekonomi, sosial dan budaya di lingkungan sekitar dalam bentuk teks tulis, lisan, dan visua', 'MPL03', 'KLS02', 'SM02'),
('KTM0000000179', '4', '4.4', 'Menyajikan penggunaan kosakata bahasa Indonesia yang tepat atau bahasa daerah hasil pengamatan tentang lingkungan sehat dan lingkungan tidak sehat di lingkungan sekitar serta cara menjaga kesehatan lingkungan dalam bentuk tek', 'MPL03', 'KLS02', 'SM02'),
('KTM0000000180', '5', '4.5', 'Membacakan teks puisi anak tentang alam dan lingkungan dalam bahasa Indonesia dengan lafal, intonasi, dan ekspresi yang tepat sebagai bentuk ungkapan diri', 'MPL03', 'KLS02', 'SM02'),
('KTM0000000181', '6', '4.6', 'Menyampaikan ungkapan-ungkapan santun (menggunakan kata “maaf”, “tolong”) untuk hidup rukun dalam kemajemukan', 'MPL03', 'KLS02', 'SM02'),
('KTM0000000182', '7', '4.7', 'Menulis dengan tulisan tegak bersambung menggunakan huruf kapital (awal kalimat, nama bulan, hari, dan nama diri) serta tanda titik pada kalimat berita dan tanda tanya pada kalimat tanya dengan benar', 'MPL03', 'KLS02', 'SM02'),
('KTM0000000183', '8', '4.8', 'Menceritakan kembali teks dongeng binatang (fabel) yang menggambarkan sikap hidup rukun yang telah dibaca secara nyaring sebagai bentuk ungkapan diri', 'MPL03', 'KLS02', 'SM02'),
('KTM0000000184', '9', '4.9', 'Menirukan kata sapaan dalam dongeng secara lisan dan tulis', 'MPL03', 'KLS02', 'SM02'),
('KTM0000000185', '10', '4.10', 'Menulis teks dengan menggunakan huruf kapital (nama Tuhan, nama agama, nama orang), serta tanda titik dan tanda tanya pada akhir kalimat dengan benar', 'MPL03', 'KLS02', 'SM02'),
('KTM0000000186', '1', '4.1', 'Membaca dan menyajikan bilangan cacah dan lambangnya berdasarkan nilai tempat dengan menggunakan model konkret', 'MPL04', 'KLS02', 'SM02'),
('KTM0000000187', '2', '4.2', 'Mengurutkan bilangan-bilangan dari bilangan terkecil ke bilangan terbesar atau sebaliknya', 'MPL04', 'KLS02', 'SM02'),
('KTM0000000188', '3', '4.3', 'Menyelesaikan masalah penjumlahan dan pengurangan bilangan yang melibatkan bilangan cacah sampai dengan 999 dalam kehidupan sehari-hari serta mengaitkan penjumlahan dan pengurangan', 'MPL04', 'KLS02', 'SM02'),
('KTM0000000189', '4', '4.4', 'Menyelesaikan masalah perkalian dan pembagian yang melibatkan bilangan cacah dengan hasil kali sampai dengan 100 dalam kehidupan sehari-hari serta mengaitkan perkalian dan pembagian', 'MPL04', 'KLS02', 'SM02'),
('KTM0000000190', '5', '4.5', 'Mengurutkan nilai mata uang serta mendemonstrasikan berbagai kesetaraan pecahan mata uang', 'MPL04', 'KLS02', 'SM02'),
('KTM0000000191', '6', '4.6', 'Melakukan pengukuran panjang (termasuk jarak), berat, dan waktu dalam satuan baku, yang berkaitan dengan kehidupan sehari-hari', 'MPL04', 'KLS02', 'SM02'),
('KTM0000000192', '7', '4.7', 'Menyajikan pecahan 1/2, 1/3 , dan 1/4 yang bersesuaian dengan bagian dari keseluruhan suatu benda konkret dalam kehidupan sehari-hari', 'MPL04', 'KLS02', 'SM02'),
('KTM0000000193', '8', '4.8', 'Mengidentifikasi ruas garis dengan menggunakan model konkret bangun datar dan bangun ruang', 'MPL04', 'KLS02', 'SM02'),
('KTM0000000194', '9', '4.9', 'Mengklasifikasi bangun datar dan bangun ruang berdasarkan ciri-cirinya', 'MPL04', 'KLS02', 'SM02'),
('KTM0000000195', '10', '4.10', 'Memprediksi pola barisan bangun datar dan bangun ruang menggunakan gambar atau benda konkret', 'MPL04', 'KLS02', 'SM02'),
('KTM0000000196', '1', '4.1', 'membuat karya ekspresi dua dan tiga dimensi', 'MPL05', 'KLS02', 'SM02'),
('KTM0000000197', '2', '4.2', 'menirukan elemen musik melalui lagu', 'MPL05', 'KLS02', 'SM02'),
('KTM0000000198', '3', '4.3', 'meragakan gerak anggota tubuh melalui tari', 'MPL05', 'KLS02', 'SM02'),
('KTM0000000199', '4', '4.4', 'membuat karya dari bahan alam', 'MPL05', 'KLS02', 'SM02'),
('KTM0000000200', '1', '4.1', 'mempraktikkan gerak dasar lokomotor sesuai dengan konsep tubuh, ruang, usaha, dan keterhubungan dalam berbagai bentuk permainan sederhana dan atau tradisional', 'MPL06', 'KLS02', 'SM02'),
('KTM0000000201', '2', '4.2', 'mempraktikkan gerak dasar non-lokomotor sesuai dengan konsep tubuh, ruang, usaha, dan keterhubungan dalam berbagai bentuk permainan sederhana dan atau tradisional', 'MPL06', 'KLS02', 'SM02'),
('KTM0000000202', '3', '4.3', 'mempraktikkan pola gerak dasar manipulatif sesuai dengan konsep tubuh, ruang, usaha, dan keterhubungan dalam berbagai bentuk permainan sederhana dan atau tradisional', 'MPL06', 'KLS02', 'SM02'),
('KTM0000000203', '4', '4.4', 'mempraktikkan sikap tubuh (duduk, membaca, berdiri, jalan), dan bergerak secara lentur serta seimbang dalam rangka pembentukan tubuh melalui permainan sederhana dan atau tradisional', 'MPL06', 'KLS02', 'SM02'),
('KTM0000000204', '5', '4.5', 'mempraktikkan berbagai pola gerak dominan (bertumpu, bergantung, keseimbangan, berpindah/lokomotor, tolakan, putaran, ayunan, melayang, dan mendarat) dalam aktivitas senam lantai', 'MPL06', 'KLS02', 'SM02'),
('KTM0000000205', '6', '4.6', 'mempraktikkan gerak dasar lokomotor dan non-lokomotor sesuai dengan irama (ketukan) tanpa/dengan musik dalam aktivitas gerak berirama', 'MPL06', 'KLS02', 'SM02'),
('KTM0000000206', '7', '4.7', 'mempraktikkan berbagai pengenalan aktivitas air dan menjaga keselamatan diri/orang lain dalam aktivitas air***', 'MPL06', 'KLS02', 'SM02'),
('KTM0000000207', '8', '4.8', 'menceritakan bagian-bagian tubuh, bagian tubuh yang boleh dan tidak boleh disentuh orang lain, cara menjaga kebersihannya, dan kebersihan pakaian', 'MPL06', 'KLS02', 'SM02'),
('KTM0000000208', '9', '4.9', 'menceritakan cara menjaga kebersihan lingkungan (tempat tidur, rumah, kelas, lingkungan sekolah).', 'MPL06', 'KLS02', 'SM02'),
('KTM0000000209', '1', '4.1', 'Menceritakan arti gambar pada lambang negara “Garuda Pancasila”', 'MPL02', 'KLS03', 'SM01'),
('KTM0000000210', '2', '4.2', 'Menyajikan hasil identifikasi kewajiban dan hak sebagai anggota keluarga dan warga sekolah', 'MPL02', 'KLS03', 'SM01'),
('KTM0000000211', '3', '4.3', 'Menyajikan makna keberagaman karakteristik individu di lingkungan sekitar', 'MPL02', 'KLS03', 'SM01'),
('KTM0000000212', '4', '4.4', 'Menyajikan bentuk-bentuk kebersatuan dalam keberagaman di lingkungan sekitar', 'MPL02', 'KLS03', 'SM01'),
('KTM0000000213', '1', '4.1', 'Menyajikan hasil informasi tentang konsep perubahan wujud benda dalam kehidupan sehari-hari dalam bentuk lisan, tulis, dan visual menggunakan kosakata baku dan kalimat efektif', 'MPL03', 'KLS03', 'SM01'),
('KTM0000000214', '2', '4.2', 'Menyajikan hasil penggalian informasi tentang konsep sumber dan bentuk energi dalam bentuk tulis dan visual menggunakan kosakata baku dan kalimat efektif', 'MPL03', 'KLS03', 'SM01'),
('KTM0000000215', '3', '4.3', 'Menyajikan hasil penggalian informasi tentang konsep perubahan cuaca dan pengaruhnya terhadap kehidupan manusia dalam bentuk tulis menggunakan kosakata baku dan kalimat efektif', 'MPL03', 'KLS03', 'SM01'),
('KTM0000000216', '4', '4.4', 'Menyajikan laporan tentang konsep ciri-ciri, kebutuhan (makanan dan tempat hidup), pertumbuhan dan perkembangan makhluk hidup yang ada di lingkungan setempat secara tertulis menggunakan kosakata baku dan kalimat efektif', 'MPL03', 'KLS03', 'SM01'),
('KTM0000000217', '5', '4.5', 'Menyajikan hasil wawancara tentang cara-cara perawatan tumbuhan dan hewan dalam bentuk tulis dan visual menggunakan kosakata baku dan kalimat efektif', 'MPL03', 'KLS03', 'SM01'),
('KTM0000000218', '6', '4.6', 'Meringkas informasi tentang perkembangan teknologi produksi, komunikasi, dan transportasi di lingkungan setempat secara tertulis menggunakan kosakata baku dan kalimat efektif', 'MPL03', 'KLS03', 'SM01'),
('KTM0000000219', '7', '4.7', 'Menjelaskan konsep delapan arah mata angin dan pemanfaatannya dalam denah dalam bentuk tulis dan visual menggunakan kosakata baku dan kalimat efektif', 'MPL03', 'KLS03', 'SM01'),
('KTM0000000220', '8', '4.8', 'Memeragakan pesan dalam dongeng sebagai bentuk ungkapan diri menggunakan kosakata baku dan kalimat efektif', 'MPL03', 'KLS03', 'SM01'),
('KTM0000000221', '9', '4.9', 'Menyajikan hasil identifikasi tentang lambang/simbol (rambu lalu lintas, pramuka, dan lambang negara) beserta artinya dalam bentuk visual dan tulis menggunakan kosakata baku dan kalimat efektif', 'MPL03', 'KLS03', 'SM01'),
('KTM0000000222', '10', '4.10', 'Memeragakan ungkapan atau kalimat saran, masukan, dan penyelesaian masalah (sederhana) sebagai bentuk ungkapan diri menggunakan kosakata baku dan kalimat efektif yang dibuat sendiri', 'MPL03', 'KLS03', 'SM01'),
('KTM0000000223', '1', '4.1', 'Menyelesaikan masalah yang melibatkan penggunaan sifat-sifat operasi hitung pada bilangan cacah', 'MPL04', 'KLS03', 'SM01'),
('KTM0000000224', '2', '4.2', 'Menggunakan bilangan cacah dan pecahan sederhana (seperti 1/2, 1/3 , dan 1/4 ) yang disajikan pada garis bilangan', 'MPL04', 'KLS03', 'SM01'),
('KTM0000000225', '3', '4.3', 'Menilai apakah suatu bilangan dapat dinyatakan sebagai jumlah, selisih, hasil kali, atau hasil bagi dua bilangan cacah', 'MPL04', 'KLS03', 'SM01'),
('KTM0000000226', '4', '4.4', 'Menyajikan pecahan sebagai bagian dari keseluruhan menggunakan benda-benda konkret', 'MPL04', 'KLS03', 'SM01'),
('KTM0000000227', '5', '4.5', 'Menyelesaikan masalah penjumlahan dan pengurangan pecahan berpenyebut sama', 'MPL04', 'KLS03', 'SM01'),
('KTM0000000228', '6', '4.6', 'Menyelesaikan masalah yang berkaitan lama waktu suatu kejadian berlangsung', 'MPL04', 'KLS03', 'SM01'),
('KTM0000000229', '7', '4.7', 'Menyelesaikan masalah yang berkaitan dengan hubungan antarsatuan baku untuk panjang, berat, dan waktu yang umumnya digunakan dalam kehidupan sehari-hari', 'MPL04', 'KLS03', 'SM01'),
('KTM0000000230', '8', '4.8', 'Menyelesaikan masalah luas dan volume dalam satuan tidak baku dengan menggunakan benda konkret', 'MPL04', 'KLS03', 'SM01'),
('KTM0000000231', '9', '4.9', 'Mengidentifikasi simetri lipat dan simetri putar pada bangun datar menggunakan benda konkret', 'MPL04', 'KLS03', 'SM01'),
('KTM0000000232', '10', '4.10', 'Menyajikan dan menyelesaikan masalah yang berkaitan dengan keliling bangun datar', 'MPL04', 'KLS03', 'SM01'),
('KTM0000000233', '11', '4.11', 'Mengidentifikasi jenis sudut, (sudut siku-siku, sudut lancip, dan sudut tumpul), dan satuan pengukuran tidak baku', 'MPL04', 'KLS03', 'SM01'),
('KTM0000000234', '12', '4.12', 'Mengelompokkan berbagai bangun datar berdasarkan sifat-sifat yang dimiliki', 'MPL04', 'KLS03', 'SM01'),
('KTM0000000235', '13', '4.13', 'Menyajikan data berkaitan dengan diri peserta didik yang disajikan dalam diagram gambar', 'MPL04', 'KLS03', 'SM01'),
('KTM0000000236', '1', '4.1', 'membuat karya dekoratif', 'MPL05', 'KLS03', 'SM01'),
('KTM0000000237', '2', '4.2', 'menampilkan bentuk dan variasi irama melalui lagu', 'MPL05', 'KLS03', 'SM01'),
('KTM0000000238', '3', '4.3', 'meragakan dinamika gerak tari', 'MPL05', 'KLS03', 'SM01'),
('KTM0000000239', '4', '4.4', 'membuat karya dengan teknik potong, lipat, dan sambung', 'MPL05', 'KLS03', 'SM01'),
('KTM0000000240', '1', '4.1', 'Mempraktikkan gerak kombinasi gerak dasar lokomotor sesuai dengan konsep tubuh, ruang, usaha, dan keterhubungan dalam berbagai bentuk permainan sederhana dan atau tradisional', 'MPL06', 'KLS03', 'SM01'),
('KTM0000000241', '2', '4.2', 'Mempraktikkan gerak kombinasi gerak dasar non-lokomotor sesuai dengan konsep tubuh, ruang, usaha, dan keterhubungan dalam berbagai bentuk permainan sederhana dan atau tradisional', 'MPL06', 'KLS03', 'SM01'),
('KTM0000000242', '3', '4.3', 'Mempraktikkan kombinasi gerak dasar manipulatif sesuai dengan konsep tubuh, ruang, usaha, dan keterhubungan dalam berbagai bentuk permainan sederhana dan atau tradisional', 'MPL06', 'KLS03', 'SM01'),
('KTM0000000243', '4', '4.4', 'Mempraktikkan bergerak secara seimbang, lentur, lincah, dan berdaya tahan dalam rangka pengembangan kebugaran jasmani melalui permainan sederhana dan atau tradisional', 'MPL06', 'KLS03', 'SM01'),
('KTM0000000244', '5', '4.5', 'Mempraktikkan kombinasi berbagai pola gerak dominan (bertumpu, bergantung, keseimbangan, berpindah/lokomotor, tolakan, putaran, ayunan, melayang, dan mendarat) dalam aktivitas senam lantai', 'MPL06', 'KLS03', 'SM01'),
('KTM0000000245', '6', '4.6', 'Mempraktikkan penggunaan kombinasi gerak dasar lokomotor, non-lokomotor dan manipulatif sesuai dengan irama (ketukan) tanpa/dengan musik dalam aktivitas gerak berirama', 'MPL06', 'KLS03', 'SM01'),
('KTM0000000246', '7', '4.7', 'Mempraktikkan gerak dasar mengambang (water trappen) dan meluncur di air serta menjaga keselamatan diri/orang lain dalam aktivitas air***', 'MPL06', 'KLS03', 'SM01'),
('KTM0000000247', '8', '4.8', 'Menceritakan bentuk dan manfaat istirahat dan pengisian waktu luang untuk menjaga kesehatan', 'MPL06', 'KLS03', 'SM01'),
('KTM0000000248', '9', '4.9', 'Menceritakan perlunya memilih makanan bergizi dan jajanan sehat untuk menjaga kesehatan tubuh', 'MPL06', 'KLS03', 'SM01'),
('KTM0000000249', '1', '4.1', 'Menceritakan arti gambar pada lambang negara “Garuda Pancasila”', 'MPL02', 'KLS03', 'SM02'),
('KTM0000000250', '2', '4.2', 'Menyajikan hasil identifikasi kewajiban dan hak sebagai anggota keluarga dan warga sekolah', 'MPL02', 'KLS03', 'SM02'),
('KTM0000000251', '3', '4.3', 'Menyajikan makna keberagaman karakteristik individu di lingkungan sekitar', 'MPL02', 'KLS03', 'SM02'),
('KTM0000000252', '4', '4.4', 'Menyajikan bentuk-bentuk kebersatuan dalam keberagaman di lingkungan sekitar', 'MPL02', 'KLS03', 'SM02'),
('KTM0000000253', '1', '4.1', 'Menyajikan hasil informasi tentang konsep perubahan wujud benda dalam kehidupan sehari-hari dalam bentuk lisan, tulis, dan visual menggunakan kosakata baku dan kalimat efektif', 'MPL03', 'KLS03', 'SM02'),
('KTM0000000254', '2', '4.2', 'Menyajikan hasil penggalian informasi tentang konsep sumber dan bentuk energi dalam bentuk tulis dan visual menggunakan kosakata baku dan kalimat efektif', 'MPL03', 'KLS03', 'SM02'),
('KTM0000000255', '3', '4.3', 'Menyajikan hasil penggalian informasi tentang konsep perubahan cuaca dan pengaruhnya terhadap kehidupan manusia dalam bentuk tulis menggunakan kosakata baku dan kalimat efektif', 'MPL03', 'KLS03', 'SM02'),
('KTM0000000256', '4', '4.4', 'Menyajikan laporan tentang konsep ciri-ciri, kebutuhan (makanan dan tempat hidup), pertumbuhan dan perkembangan makhluk hidup yang ada di lingkungan setempat secara tertulis menggunakan kosakata baku dan kalimat efektif', 'MPL03', 'KLS03', 'SM02'),
('KTM0000000257', '5', '4.5', 'Menyajikan hasil wawancara tentang cara-cara perawatan tumbuhan dan hewan dalam bentuk tulis dan visual menggunakan kosakata baku dan kalimat efektif', 'MPL03', 'KLS03', 'SM02'),
('KTM0000000258', '6', '4.6', 'Meringkas informasi tentang perkembangan teknologi produksi, komunikasi, dan transportasi di lingkungan setempat secara tertulis menggunakan kosakata baku dan kalimat efektif', 'MPL03', 'KLS03', 'SM02'),
('KTM0000000259', '7', '4.7', 'Menjelaskan konsep delapan arah mata angin dan pemanfaatannya dalam denah dalam bentuk tulis dan visual menggunakan kosakata baku dan kalimat efektif', 'MPL03', 'KLS03', 'SM02'),
('KTM0000000260', '8', '4.8', 'Memeragakan pesan dalam dongeng sebagai bentuk ungkapan diri menggunakan kosakata baku dan kalimat efektif', 'MPL03', 'KLS03', 'SM02'),
('KTM0000000261', '9', '4.9', 'Menyajikan hasil identifikasi tentang lambang/simbol (rambu lalu lintas, pramuka, dan lambang negara) beserta artinya dalam bentuk visual dan tulis menggunakan kosakata baku dan kalimat efektif', 'MPL03', 'KLS03', 'SM02'),
('KTM0000000262', '10', '4.10', 'Memeragakan ungkapan atau kalimat saran, masukan, dan penyelesaian masalah (sederhana) sebagai bentuk ungkapan diri menggunakan kosakata baku dan kalimat efektif yang dibuat sendiri', 'MPL03', 'KLS03', 'SM02'),
('KTM0000000263', '1', '4.1', 'Menyelesaikan masalah yang melibatkan penggunaan sifat-sifat operasi hitung pada bilangan cacah', 'MPL04', 'KLS03', 'SM02'),
('KTM0000000264', '2', '4.2', 'Menggunakan bilangan cacah dan pecahan sederhana (seperti 1/2, 1/3 , dan 1/4 ) yang disajikan pada garis bilangan', 'MPL04', 'KLS03', 'SM02'),
('KTM0000000265', '3', '4.3', 'Menilai apakah suatu bilangan dapat dinyatakan sebagai jumlah, selisih, hasil kali, atau hasil bagi dua bilangan cacah', 'MPL04', 'KLS03', 'SM02'),
('KTM0000000266', '4', '4.4', 'Menyajikan pecahan sebagai bagian dari keseluruhan menggunakan benda-benda konkret', 'MPL04', 'KLS03', 'SM02'),
('KTM0000000267', '5', '4.5', 'Menyelesaikan masalah penjumlahan dan pengurangan pecahan berpenyebut sama', 'MPL04', 'KLS03', 'SM02'),
('KTM0000000268', '6', '4.6', 'Menyelesaikan masalah yang berkaitan lama waktu suatu kejadian berlangsung', 'MPL04', 'KLS03', 'SM02'),
('KTM0000000269', '7', '4.7', 'Menyelesaikan masalah yang berkaitan dengan hubungan antarsatuan baku untuk panjang, berat, dan waktu yang umumnya digunakan dalam kehidupan sehari-hari', 'MPL04', 'KLS03', 'SM02'),
('KTM0000000270', '8', '4.8', 'Menyelesaikan masalah luas dan volume dalam satuan tidak baku dengan menggunakan benda konkret', 'MPL04', 'KLS03', 'SM02'),
('KTM0000000271', '9', '4.9', 'Mengidentifikasi simetri lipat dan simetri putar pada bangun datar menggunakan benda konkret', 'MPL04', 'KLS03', 'SM02'),
('KTM0000000272', '10', '4.10', 'Menyajikan dan menyelesaikan masalah yang berkaitan dengan keliling bangun datar', 'MPL04', 'KLS03', 'SM02'),
('KTM0000000273', '11', '4.11', 'Mengidentifikasi jenis sudut, (sudut siku-siku, sudut lancip, dan sudut tumpul), dan satuan pengukuran tidak baku', 'MPL04', 'KLS03', 'SM02'),
('KTM0000000274', '12', '4.12', 'Mengelompokkan berbagai bangun datar berdasarkan sifat-sifat yang dimiliki', 'MPL04', 'KLS03', 'SM02'),
('KTM0000000275', '13', '4.13', 'Menyajikan data berkaitan dengan diri peserta didik yang disajikan dalam diagram gambar', 'MPL04', 'KLS03', 'SM02'),
('KTM0000000276', '1', '4.1', 'membuat karya dekoratif', 'MPL05', 'KLS03', 'SM02'),
('KTM0000000277', '2', '4.2', 'menampilkan bentuk dan variasi irama melalui lagu', 'MPL05', 'KLS03', 'SM02'),
('KTM0000000278', '3', '4.3', 'meragakan dinamika gerak tari', 'MPL05', 'KLS03', 'SM02'),
('KTM0000000279', '4', '4.4', 'membuat karya dengan teknik potong, lipat, dan sambung', 'MPL05', 'KLS03', 'SM02'),
('KTM0000000280', '1', '4.1', 'Mempraktikkan gerak kombinasi gerak dasar lokomotor sesuai dengan konsep tubuh, ruang, usaha, dan keterhubungan dalam berbagai bentuk permainan sederhana dan atau tradisional', 'MPL06', 'KLS03', 'SM02'),
('KTM0000000281', '2', '4.2', 'Mempraktikkan gerak kombinasi gerak dasar non-lokomotor sesuai dengan konsep tubuh, ruang, usaha, dan keterhubungan dalam berbagai bentuk permainan sederhana dan atau tradisional', 'MPL06', 'KLS03', 'SM02'),
('KTM0000000282', '3', '4.3', 'Mempraktikkan kombinasi gerak dasar manipulatif sesuai dengan konsep tubuh, ruang, usaha, dan keterhubungan dalam berbagai bentuk permainan sederhana dan atau tradisional', 'MPL06', 'KLS03', 'SM02'),
('KTM0000000283', '4', '4.4', 'Mempraktikkan bergerak secara seimbang, lentur, lincah, dan berdaya tahan dalam rangka pengembangan kebugaran jasmani melalui permainan sederhana dan atau tradisional', 'MPL06', 'KLS03', 'SM02'),
('KTM0000000284', '5', '4.5', 'Mempraktikkan kombinasi berbagai pola gerak dominan (bertumpu, bergantung, keseimbangan, berpindah/lokomotor, tolakan, putaran, ayunan, melayang, dan mendarat) dalam aktivitas senam lantai', 'MPL06', 'KLS03', 'SM02'),
('KTM0000000285', '6', '4.6', 'Mempraktikkan penggunaan kombinasi gerak dasar lokomotor, non-lokomotor dan manipulatif sesuai dengan irama (ketukan) tanpa/dengan musik dalam aktivitas gerak berirama', 'MPL06', 'KLS03', 'SM02'),
('KTM0000000286', '7', '4.7', 'Mempraktikkan gerak dasar mengambang (water trappen) dan meluncur di air serta menjaga keselamatan diri/orang lain dalam aktivitas air***', 'MPL06', 'KLS03', 'SM02'),
('KTM0000000287', '8', '4.8', 'Menceritakan bentuk dan manfaat istirahat dan pengisian waktu luang untuk menjaga kesehatan', 'MPL06', 'KLS03', 'SM02'),
('KTM0000000288', '9', '4.9', 'Menceritakan perlunya memilih makanan bergizi dan jajanan sehat untuk menjaga kesehatan tubuh', 'MPL06', 'KLS03', 'SM02'),
('KTM0000000289', '1', '4.1', 'menjelaskan makna hubungan simbol dengan sila-sila Pancasila sebagai satu kesatuan dalam kehidupan sehari-hari', 'MPL02', 'KLS04', 'SM01'),
('KTM0000000290', '2', '4.2', 'menyajikan hasil identifikasi pelaksanaan kewajiban dan hak sebagai warga masyarakat dalam kehidupan sehari-hari', 'MPL02', 'KLS04', 'SM01'),
('KTM0000000291', '3', '4.3', 'mengemukakan manfaat keberagaman karakteristik individu dalam kehidupan sehari-hari', 'MPL02', 'KLS04', 'SM01'),
('KTM0000000292', '4', '4.4', 'menyajikan berbagai bentuk keberagaman suku bangsa, sosial, dan budaya di Indonesia yang terikat persatuan dan kesatuan', 'MPL02', 'KLS04', 'SM01'),
('KTM0000000293', '1', '4.1', 'menata informasi yang didapat dari teks berdasarkan keterhubungan antargagasan ke dalam kerangka tulis', 'MPL03', 'KLS04', 'SM01'),
('KTM0000000294', '2', '4.2', 'menyajikan hasil pencermatan tentang keterhubungan antargagasan ke dalam tulisan', 'MPL03', 'KLS04', 'SM01'),
('KTM0000000295', '3', '4.3', 'melaporkan hasil wawancara menggunakan kosakata baku dan kalimat efektif dalam bentuk teks tulis', 'MPL03', 'KLS04', 'SM01'),
('KTM0000000296', '4', '4.4', 'menyajikan teks petunjuk penggunaan alat dalam bentuk teks tulis dan visual menggunakan kosakata baku dan kalimat efektif', 'MPL03', 'KLS04', 'SM01'),
('KTM0000000297', '5', '4.5', 'mengomunikasikan secara lisan dan tulisan pendapat pribadi tentang isi buku sastra yang dipilih sendiri dan dibaca yang didukung oleh alasan ', 'MPL03', 'KLS04', 'SM01'),
('KTM0000000298', '6', '4.6', 'melisankan puisi hasil karya pribadi dengan lafal, intonasi, dan ekspresi yang tepat sebagai bentuk ungkapan diri', 'MPL03', 'KLS04', 'SM01'),
('KTM0000000299', '7', '4.7', 'menyampaikan pengetahuan baru dari teks nonfiksi ke dalam tulisan dengan bahasa sendiri', 'MPL03', 'KLS04', 'SM01'),
('KTM0000000300', '8', '4.8', 'menyampaikan hasil membandingkan pengetahuan lama dengan pengetahuan baru secara tertulis dengan bahasa sendiri dari teks nonfiksi', 'MPL03', 'KLS04', 'SM01'),
('KTM0000000301', '9', '4.9', 'menyampaikan hasil identifikasi tentang yang ingin diperjuangkan atau dipertentangkan antartokoh pada cerita fiksi', 'MPL03', 'KLS04', 'SM01'),
('KTM0000000302', '10', '4.10', 'menyajikan cara-cara yang dilakukan oleh tokoh cerita fiksi dalam memperjuangkan atau mempertentangkan hal-hal yang diinginkan', 'MPL03', 'KLS04', 'SM01'),
('KTM0000000303', '1', '4.1', 'mengidentifikasi  pecahan-pecahan senilai  dengan gambar  dan model konkret', 'MPL04', 'KLS04', 'SM01'),
('KTM0000000304', '2', '4.2', 'mengidentifikasi berbagai bentuk pecahan (biasa, campuran, desimal, dan persen) dan hubungan di antaranya ', 'MPL04', 'KLS04', 'SM01'),
('KTM0000000305', '3', '4.3', 'menyelesaikan masalah  penaksiran dari jumlah, selisih, hasil kali, dan hasil bagi dua bilangan cacah maupun pecahan', 'MPL04', 'KLS04', 'SM01'),
('KTM0000000306', '4', '4.4', 'mengidentifikasi faktor dan kelipatan suatu bilangan', 'MPL04', 'KLS04', 'SM01'),
('KTM0000000307', '5', '4.5', 'mengidentifikasi bilangan prima', 'MPL04', 'KLS04', 'SM01'),
('KTM0000000308', '6', '4.6', 'menyelesaikan masalah yang berkaitan dengan faktor persekutuan, faktor persekutuan terbesar (FPB), kelipatan persekutuan, dan kelipatan persekutuan terkecil (KPK) dari dua bilangan berkaitan dengan kehidupan sehari-hari', 'MPL04', 'KLS04', 'SM01'),
('KTM0000000309', '7', '4.7', 'menyelesaikan masalah  pembulatan hasil pengukuran panjang dan berat ke satuan terdekat', 'MPL04', 'KLS04', 'SM01'),
('KTM0000000310', '8', '4.8', 'mengidentifikasi segibanyak beraturan dan segibanyak tidak beraturan', 'MPL04', 'KLS04', 'SM01'),
('KTM0000000311', '9', '4.9', 'menyelesaikan masalah berkaitan dengan  keliling dan luas daerah persegi, persegipanjang, dan segitiga', 'MPL04', 'KLS04', 'SM01');
INSERT INTO `kd_keterampilan` (`id_kd`, `nom`, `nomor_kd`, `deskripsi`, `id_mapel`, `id_kelas`, `id_semester`) VALUES
('KTM0000000312', '10', '4.10', 'mengidentifikasi hubungan antar garis (sejajar, berpotongan, berhimpit) menggunakan model konkret', 'MPL04', 'KLS04', 'SM01'),
('KTM0000000313', '11', '4.11', 'membaca data diri siswa dan lingkungannya yang disajikan dalam bentuk diagram batang ', 'MPL04', 'KLS04', 'SM01'),
('KTM0000000314', '12', '4.12', 'mengukur sudut pada bangun datar dalam satuan baku dengan menggunakan busur derajat', 'MPL04', 'KLS04', 'SM01'),
('KTM0000000315', '1', '4.1', 'menggambar dan membentuk tiga dimensi', 'MPL05', 'KLS04', 'SM01'),
('KTM0000000316', '2', '4.2', 'menyanyikan lagu dengan memperhatikan tempo dan tinggi rendah nada ', 'MPL05', 'KLS04', 'SM01'),
('KTM0000000317', '3', '4.3', 'meragakan gerak tari kreasi daerah', 'MPL05', 'KLS04', 'SM01'),
('KTM0000000318', '4', '4.4', 'membuat karya kolase, montase, aplikasi, dan mozaik ', 'MPL05', 'KLS04', 'SM01'),
('KTM0000000319', '1', '4.1', 'mempraktikkan variasi gerak dasar lokomotor, non-lokomotor, dan manipulatif sesuai dengan konsep tubuh, ruang, usaha, dan keterhubungan dalam permainan bola besar sederhana dan/atau tradisional', 'MPL06', 'KLS04', 'SM01'),
('KTM0000000320', '2', '4.2', 'mempraktikkan variasi gerak dasar lokomotor, non-lokomotor, dan manipulatif sesuai dengan konsep tubuh, ruang, usaha, dan keterhubungan dalam permainan bola kecil sederhana dan/atau tradisional', 'MPL06', 'KLS04', 'SM01'),
('KTM0000000321', '3', '4.3', 'mempraktikkan variasi pola dasar  jalan, lari,  lompat, dan lempar melalui permainan/olahraga yang dimodifikasi dan/atau olahraga tradisional', 'MPL06', 'KLS04', 'SM01'),
('KTM0000000322', '4', '4.4', 'mempraktikkan gerak dasar lokomotor dan non lokomotor untuk membentuk gerak dasar seni beladiri', 'MPL06', 'KLS04', 'SM01'),
('KTM0000000323', '5', '4.5', 'mempraktikkan berbagai aktivitas kebugaran jasmani melalui berbagai bentuk latihan; daya tahan, kekuatan, kecepatan, dan kelincahan  untuk mencapai berat badan ideal ', 'MPL06', 'KLS04', 'SM01'),
('KTM0000000324', '6', '4.6', 'mempraktikkan variasi dan kombinasi berbagai pola gerak dominan  (bertumpu, bergantung, keseimbangan, berpindah/ lokomotor, tolakan, putaran, ayunan, melayang, dan mendarat) dalam aktivitas senam lantai', 'MPL06', 'KLS04', 'SM01'),
('KTM0000000325', '7', '4.7', 'mempraktikkan variasi gerak dasar  langkah dan ayunan lengan mengikuti irama (ketukan) tanpa/dengan musik dalam aktivitas gerak berirama', 'MPL06', 'KLS04', 'SM01'),
('KTM0000000326', '8', '4.8', 'mempraktikkan gerak dasar satu gaya renang ', 'MPL06', 'KLS04', 'SM01'),
('KTM0000000327', '9', '4.9', 'memaparkan jenis cidera dan cara penanggulangannya secara sederhana saat melakukan aktivitas fisik dan dalam kehidupan sehari-hari', 'MPL06', 'KLS04', 'SM01'),
('KTM0000000328', '10', '4.10', 'memaparkan perilaku terpuji dalam pergaulan sehari-hari (antarteman sebaya, orang yang lebih tua, dan orang yang lebih muda)', 'MPL06', 'KLS04', 'SM01'),
('KTM0000000329', '1', '4.1', 'menjelaskan makna hubungan simbol dengan sila-sila Pancasila sebagai satu kesatuan dalam kehidupan sehari-hari', 'MPL02', 'KLS04', 'SM02'),
('KTM0000000330', '2', '4.2', 'menyajikan hasil identifikasi pelaksanaan kewajiban dan hak sebagai warga masyarakat dalam kehidupan sehari-hari', 'MPL02', 'KLS04', 'SM02'),
('KTM0000000331', '3', '4.3', 'mengemukakan manfaat keberagaman karakteristik individu dalam kehidupan sehari-hari', 'MPL02', 'KLS04', 'SM02'),
('KTM0000000332', '4', '4.4', 'menyajikan berbagai bentuk keberagaman suku bangsa, sosial, dan budaya di Indonesia yang terikat persatuan dan kesatuan', 'MPL02', 'KLS04', 'SM02'),
('KTM0000000333', '1', '4.1', 'menata informasi yang didapat dari teks berdasarkan keterhubungan antargagasan ke dalam kerangka tulis', 'MPL03', 'KLS04', 'SM02'),
('KTM0000000334', '2', '4.2', 'menyajikan hasil pencermatan tentang keterhubungan antargagasan ke dalam tulisan', 'MPL03', 'KLS04', 'SM02'),
('KTM0000000335', '3', '4.3', 'melaporkan hasil wawancara menggunakan kosakata baku dan kalimat efektif dalam bentuk teks tulis', 'MPL03', 'KLS04', 'SM02'),
('KTM0000000336', '4', '4.4', 'menyajikan teks petunjuk penggunaan alat dalam bentuk teks tulis dan visual menggunakan kosakata baku dan kalimat efektif', 'MPL03', 'KLS04', 'SM02'),
('KTM0000000337', '5', '4.5', 'mengomunikasikan secara lisan dan tulisan pendapat pribadi tentang isi buku sastra yang dipilih sendiri dan dibaca yang didukung oleh alasan ', 'MPL03', 'KLS04', 'SM02'),
('KTM0000000338', '6', '4.6', 'melisankan puisi hasil karya pribadi dengan lafal, intonasi, dan ekspresi yang tepat sebagai bentuk ungkapan diri', 'MPL03', 'KLS04', 'SM02'),
('KTM0000000339', '7', '4.7', 'menyampaikan pengetahuan baru dari teks nonfiksi ke dalam tulisan dengan bahasa sendiri', 'MPL03', 'KLS04', 'SM02'),
('KTM0000000340', '8', '4.8', 'menyampaikan hasil membandingkan pengetahuan lama dengan pengetahuan baru secara tertulis dengan bahasa sendiri dari teks nonfiksi', 'MPL03', 'KLS04', 'SM02'),
('KTM0000000341', '9', '4.9', 'menyampaikan hasil identifikasi tentang yang ingin diperjuangkan atau dipertentangkan antartokoh pada cerita fiksi', 'MPL03', 'KLS04', 'SM02'),
('KTM0000000342', '10', '4.10', 'menyajikan cara-cara yang dilakukan oleh tokoh cerita fiksi dalam memperjuangkan atau mempertentangkan hal-hal yang diinginkan', 'MPL03', 'KLS04', 'SM02'),
('KTM0000000343', '1', '4.1', 'mengidentifikasi  pecahan-pecahan senilai  dengan gambar  dan model konkret', 'MPL04', 'KLS04', 'SM02'),
('KTM0000000344', '2', '4.2', 'mengidentifikasi berbagai bentuk pecahan (biasa, campuran, desimal, dan persen) dan hubungan di antaranya ', 'MPL04', 'KLS04', 'SM02'),
('KTM0000000345', '3', '4.3', 'menyelesaikan masalah  penaksiran dari jumlah, selisih, hasil kali, dan hasil bagi dua bilangan cacah maupun pecahan', 'MPL04', 'KLS04', 'SM02'),
('KTM0000000346', '4', '4.4', 'mengidentifikasi faktor dan kelipatan suatu bilangan', 'MPL04', 'KLS04', 'SM02'),
('KTM0000000347', '5', '4.5', 'mengidentifikasi bilangan prima', 'MPL04', 'KLS04', 'SM02'),
('KTM0000000348', '6', '4.6', 'menyelesaikan masalah yang berkaitan dengan faktor persekutuan, faktor persekutuan terbesar (FPB), kelipatan persekutuan, dan kelipatan persekutuan terkecil (KPK) dari dua bilangan berkaitan dengan kehidupan sehari-hari', 'MPL04', 'KLS04', 'SM02'),
('KTM0000000349', '7', '4.7', 'menyelesaikan masalah  pembulatan hasil pengukuran panjang dan berat ke satuan terdekat', 'MPL04', 'KLS04', 'SM02'),
('KTM0000000350', '8', '4.8', 'mengidentifikasi segibanyak beraturan dan segibanyak tidak beraturan', 'MPL04', 'KLS04', 'SM02'),
('KTM0000000351', '9', '4.9', 'menyelesaikan masalah berkaitan dengan  keliling dan luas daerah persegi, persegipanjang, dan segitiga', 'MPL04', 'KLS04', 'SM02'),
('KTM0000000352', '10', '4.10', 'mengidentifikasi hubungan antar garis (sejajar, berpotongan, berhimpit) menggunakan model konkret', 'MPL04', 'KLS04', 'SM02'),
('KTM0000000353', '11', '4.11', 'membaca data diri siswa dan lingkungannya yang disajikan dalam bentuk diagram batang ', 'MPL04', 'KLS04', 'SM02'),
('KTM0000000354', '12', '4.12', 'mengukur sudut pada bangun datar dalam satuan baku dengan menggunakan busur derajat', 'MPL04', 'KLS04', 'SM02'),
('KTM0000000355', '1', '4.1', 'menggambar dan membentuk tiga dimensi', 'MPL05', 'KLS04', 'SM02'),
('KTM0000000356', '2', '4.2', 'menyanyikan lagu dengan memperhatikan tempo dan tinggi rendah nada ', 'MPL05', 'KLS04', 'SM02'),
('KTM0000000357', '3', '4.3', 'meragakan gerak tari kreasi daerah', 'MPL05', 'KLS04', 'SM02'),
('KTM0000000358', '4', '4.4', 'membuat karya kolase, montase, aplikasi, dan mozaik ', 'MPL05', 'KLS04', 'SM02'),
('KTM0000000359', '1', '4.1', 'mempraktikkan variasi gerak dasar lokomotor, non-lokomotor, dan manipulatif sesuai dengan konsep tubuh, ruang, usaha, dan keterhubungan dalam permainan bola besar sederhana dan/atau tradisional', 'MPL06', 'KLS04', 'SM02'),
('KTM0000000360', '2', '4.2', 'mempraktikkan variasi gerak dasar lokomotor, non-lokomotor, dan manipulatif sesuai dengan konsep tubuh, ruang, usaha, dan keterhubungan dalam permainan bola kecil sederhana dan/atau tradisional', 'MPL06', 'KLS04', 'SM02'),
('KTM0000000361', '3', '4.3', 'mempraktikkan variasi pola dasar  jalan, lari,  lompat, dan lempar melalui permainan/olahraga yang dimodifikasi dan/atau olahraga tradisional', 'MPL06', 'KLS04', 'SM02'),
('KTM0000000362', '4', '4.4', 'mempraktikkan gerak dasar lokomotor dan non lokomotor untuk membentuk gerak dasar seni beladiri', 'MPL06', 'KLS04', 'SM02'),
('KTM0000000363', '5', '4.5', 'mempraktikkan berbagai aktivitas kebugaran jasmani melalui berbagai bentuk latihan; daya tahan, kekuatan, kecepatan, dan kelincahan  untuk mencapai berat badan ideal ', 'MPL06', 'KLS04', 'SM02'),
('KTM0000000364', '6', '4.6', 'mempraktikkan variasi dan kombinasi berbagai pola gerak dominan  (bertumpu, bergantung, keseimbangan, berpindah/ lokomotor, tolakan, putaran, ayunan, melayang, dan mendarat) dalam aktivitas senam lantai', 'MPL06', 'KLS04', 'SM02'),
('KTM0000000365', '7', '4.7', 'mempraktikkan variasi gerak dasar  langkah dan ayunan lengan mengikuti irama (ketukan) tanpa/dengan musik dalam aktivitas gerak berirama', 'MPL06', 'KLS04', 'SM02'),
('KTM0000000366', '8', '4.8', 'mempraktikkan gerak dasar satu gaya renang ', 'MPL06', 'KLS04', 'SM02'),
('KTM0000000367', '9', '4.9', 'memaparkan jenis cidera dan cara penanggulangannya secara sederhana saat melakukan aktivitas fisik dan dalam kehidupan sehari-hari', 'MPL06', 'KLS04', 'SM02'),
('KTM0000000368', '10', '4.10', 'memaparkan perilaku terpuji dalam pergaulan sehari-hari (antarteman sebaya, orang yang lebih tua, dan orang yang lebih muda)', 'MPL06', 'KLS04', 'SM02'),
('KTM0000000369', '1', '4.1', 'Menyajikan hasil identifikasi nilai-nilai Pancasila dalam kehidupan sehari-hari', 'MPL02', 'KLS05', 'SM01'),
('KTM0000000370', '2', '4.2', 'Menjelaskan hak, kewajiban, dan tanggung jawab sebagai warga masyarakat dalam kehidupan sehari-hari', 'MPL02', 'KLS05', 'SM01'),
('KTM0000000371', '3', '4.3', 'Menyelenggarakan kegiatan yang mendukung keberagaman sosial budaya masyarakat', 'MPL02', 'KLS05', 'SM01'),
('KTM0000000372', '4', '4.4', 'Menyajikan hasil penggalian tentang manfaat persatuan dan kesatuan untuk membangun kerukunan.', 'MPL02', 'KLS05', 'SM01'),
('KTM0000000373', '1', '4.1', 'Menyajikan hasil identifikasi pokok pikiran dalam teks tulis dan lisan secara lisan, tulis, dan visual', 'MPL03', 'KLS05', 'SM01'),
('KTM0000000374', '2', '4.2', 'Menyajikan hasil klasifikasi informasi yang didapat dari buku yang dikelompokkan dalam aspek: apa, di mana, kapan, siapa, mengapa, dan bagaimana menggunakan kosakata baku', 'MPL03', 'KLS05', 'SM01'),
('KTM0000000375', '3', '4.3', 'Menyajikan ringkasan teks penjelasan (eksplanasi) dari media cetak atau elektronik dengan menggunakan kosakata baku dan kalimat efektif secara lisan, tulis, dan visual', 'MPL03', 'KLS05', 'SM01'),
('KTM0000000376', '4', '4.4', 'Memeragakan kembali informasi yang disampaikan paparan iklan dari media cetak atau elektronik dengan bantuan lisan, tulis, dan visual', 'MPL03', 'KLS05', 'SM01'),
('KTM0000000377', '5', '4.5', 'Memaparkan informasi penting dari teks narasi sejarah menggunakan aspek: apa, di mana, kapan, siapa, mengapa, dan bagaimana serta kosakata baku dan kalimat efektif', 'MPL03', 'KLS05', 'SM01'),
('KTM0000000378', '6', '4.6', 'Melisankan pantun hasil karya pribadi dengan lafal, intonasi, dan ekspresi yang tepat sebagai bentuk ungkapan diri', 'MPL03', 'KLS05', 'SM01'),
('KTM0000000379', '7', '4.7', 'Menyajikan konsep-konsep yang saling berkaitan pada teks nonfiksi ke dalam tulisan dengan bahasa sendiri', 'MPL03', 'KLS05', 'SM01'),
('KTM0000000380', '8', '4.8', 'Menyajikan kembali peristiwa atau tindakan dengan memperhatikan latar cerita yang terdapat pada teks fiksi', 'MPL03', 'KLS05', 'SM01'),
('KTM0000000381', '9', '4.9', 'Membuat surat undangan (ulang tahun, kegiatan sekolah, kenaikan kelas, dll.) dengan kalimat efektif dan memperhati-kan penggunaan ejaan', 'MPL03', 'KLS05', 'SM01'),
('KTM0000000382', '1', '4.1', 'Menyelesaikan masalah yang berkaitan dengan penjumlahan dan pengurangan dua pecahan dengan penyebut berbeda', 'MPL04', 'KLS05', 'SM01'),
('KTM0000000383', '2', '4.2', 'Menyelesaikan masalah yang berkaitan dengan perkalian dan pembagian pecahan dan desimal', 'MPL04', 'KLS05', 'SM01'),
('KTM0000000384', '3', '4.3', 'menyelesaikan masalah yang berkaitan dengan perbandingan dua besaran yang berbeda (kecepatan, debit)', 'MPL04', 'KLS05', 'SM01'),
('KTM0000000385', '4', '4.4', 'Menyelesaikan masalah yang berkaitan dengan skala pada denah', 'MPL04', 'KLS05', 'SM01'),
('KTM0000000386', '5', '4.5', 'Menyelesaikan masalah yang berkaitan dengan volume bangun ruang dengan menggunakan satuan volume (seperti kubus satuan) melibatkan pangkat tiga dan akar pangkat tiga', 'MPL04', 'KLS05', 'SM01'),
('KTM0000000387', '6', '4.6', 'Membuat jaring-jaring bangun ruang sederhana (kubus dan balok)', 'MPL04', 'KLS05', 'SM01'),
('KTM0000000388', '7', '4.7', 'Menganalisis data yang berkaitan dengan diri peserta didik atau lingkungan sekitar serta cara pengumpulannya', 'MPL04', 'KLS05', 'SM01'),
('KTM0000000389', '8', '4.8', 'Mengorganisasikan dan menyajikan data yang berkaitan dengan diri peserta didik dan membandingkan dengan data dari lingkungan sekitar dalam bentuk daftar, tabel, diagram gambar (piktogram), diagram batang, atau diagram garis', 'MPL04', 'KLS05', 'SM01'),
('KTM0000000390', '1', '4.1', 'Membuat gambar cerita', 'MPL05', 'KLS05', 'SM01'),
('KTM0000000391', '1', '4.2', 'Menyanyikan lagu-lagu dalam berbagai tangga nada dengan iringan musik', 'MPL05', 'KLS05', 'SM01'),
('KTM0000000392', '1', '4.3', 'Mempraktikkan pola lantai pada gerak tari kreasi dearah', 'MPL05', 'KLS05', 'SM01'),
('KTM0000000393', '1', '4.4', 'Membuat karya seni rupa daerah', 'MPL05', 'KLS05', 'SM01'),
('KTM0000000394', '1', '4.1', 'Mempraktikkan kombinasi gerak lokomotor, non-lokomotor, dan manipulatif sesuai dengan konsep tubuh, ruang, usaha, dan keterhubungan dalam berbagai permainan bola besar sederhana dan atau tradisional*', 'MPL06', 'KLS05', 'SM01'),
('KTM0000000395', '2', '4.2', 'Mempraktikkan kombinasi gerak dasar lokomotor, non-lokomotor, dan manipulatif sesuai dengan konsep tubuh, ruang, usaha, dan keterhubungan dalam berbagai permainan bola kecil sederhana dan atau tradisional*', 'MPL06', 'KLS05', 'SM01'),
('KTM0000000396', '3', '4.3', 'Mempraktikkan kombinasi gerak dasar jalan, lari, lompat, dan lempar melalui permainan/olahraga yang dimodifikasi dan atau olahraga tradisional', 'MPL06', 'KLS05', 'SM01'),
('KTM0000000397', '4', '4.4', 'Mempraktikkan variasi gerak dasar lokomotor dan non lokomotor untuk membentuk gerak dasar seni beladiri**', 'MPL06', 'KLS05', 'SM01'),
('KTM0000000398', '5', '4.5', 'Mempraktikkan aktivitas latihan daya tahan jantung (cardio respiratory) untuk pengembangan kebugaran jasmani', 'MPL06', 'KLS05', 'SM01'),
('KTM0000000399', '6', '4.6', 'Mempraktikkan kombinasi pola gerak dominan (bertumpu, bergantung, keseimbangan, berpindah/lokomotor, tolakan, putaran, ayunan, melayang, dan mendarat) untuk membentuk keterampilan dasar senam menggunakan alat', 'MPL06', 'KLS05', 'SM01'),
('KTM0000000400', '7', '4.7', 'Mempraktikkan pengunaan kombinasi gerak dasar langkah dan ayunan lengan mengikuti irama (ketukan) tanpa/dengan musik dalam aktivitas gerak berirama', 'MPL06', 'KLS05', 'SM01'),
('KTM0000000401', '8', '4.8', 'Mempraktikkan salah satu gaya renang dengan koordinasi yang baik pada jarak tertentu ***', 'MPL06', 'KLS05', 'SM01'),
('KTM0000000402', '9', '4.9', 'Menerapkan konsep pemeliharaan diri dan orang lain dari penyakit menular dan tidak menular', 'MPL06', 'KLS05', 'SM01'),
('KTM0000000403', '10', '4.10', 'Memaparkan bahaya merokok, meminum minuman keras, dan mengonsumsi narkotika, zat-zat aditif (NAPZA) dan obat berbahaya lainnya terhadap kesehatan tubuh', 'MPL06', 'KLS05', 'SM01'),
('KTM0000000404', '1', '4.1', 'Menyajikan hasil identifikasi nilai-nilai Pancasila dalam kehidupan sehari-hari', 'MPL02', 'KLS05', 'SM02'),
('KTM0000000405', '2', '4.2', 'Menjelaskan hak, kewajiban, dan tanggung jawab sebagai warga masyarakat dalam kehidupan sehari-hari', 'MPL02', 'KLS05', 'SM02'),
('KTM0000000406', '3', '4.3', 'Menyelenggarakan kegiatan yang mendukung keberagaman sosial budaya masyarakat', 'MPL02', 'KLS05', 'SM02'),
('KTM0000000407', '4', '4.4', 'Menyajikan hasil penggalian tentang manfaat persatuan dan kesatuan untuk membangun kerukunan.', 'MPL02', 'KLS05', 'SM02'),
('KTM0000000408', '1', '4.1', 'Menyajikan hasil identifikasi pokok pikiran dalam teks tulis dan lisan secara lisan, tulis, dan visual', 'MPL03', 'KLS05', 'SM02'),
('KTM0000000409', '2', '4.2', 'Menyajikan hasil klasifikasi informasi yang didapat dari buku yang dikelompokkan dalam aspek: apa, di mana, kapan, siapa, mengapa, dan bagaimana menggunakan kosakata baku', 'MPL03', 'KLS05', 'SM02'),
('KTM0000000410', '3', '4.3', 'Menyajikan ringkasan teks penjelasan (eksplanasi) dari media cetak atau elektronik dengan menggunakan kosakata baku dan kalimat efektif secara lisan, tulis, dan visual', 'MPL03', 'KLS05', 'SM02'),
('KTM0000000411', '4', '4.4', 'Memeragakan kembali informasi yang disampaikan paparan iklan dari media cetak atau elektronik dengan bantuan lisan, tulis, dan visual', 'MPL03', 'KLS05', 'SM02'),
('KTM0000000412', '5', '4.5', 'Memaparkan informasi penting dari teks narasi sejarah menggunakan aspek: apa, di mana, kapan, siapa, mengapa, dan bagaimana serta kosakata baku dan kalimat efektif', 'MPL03', 'KLS05', 'SM02'),
('KTM0000000413', '6', '4.6', 'Melisankan pantun hasil karya pribadi dengan lafal, intonasi, dan ekspresi yang tepat sebagai bentuk ungkapan diri', 'MPL03', 'KLS05', 'SM02'),
('KTM0000000414', '7', '4.7', 'Menyajikan konsep-konsep yang saling berkaitan pada teks nonfiksi ke dalam tulisan dengan bahasa sendiri', 'MPL03', 'KLS05', 'SM02'),
('KTM0000000415', '8', '4.8', 'Menyajikan kembali peristiwa atau tindakan dengan memperhatikan latar cerita yang terdapat pada teks fiksi', 'MPL03', 'KLS05', 'SM02'),
('KTM0000000416', '9', '4.9', 'Membuat surat undangan (ulang tahun, kegiatan sekolah, kenaikan kelas, dll.) dengan kalimat efektif dan memperhati-kan penggunaan ejaan', 'MPL03', 'KLS05', 'SM02'),
('KTM0000000417', '1', '4.1', 'Menyelesaikan masalah yang berkaitan dengan penjumlahan dan pengurangan dua pecahan dengan penyebut berbeda', 'MPL04', 'KLS05', 'SM02'),
('KTM0000000418', '2', '4.2', 'Menyelesaikan masalah yang berkaitan dengan perkalian dan pembagian pecahan dan desimal', 'MPL04', 'KLS05', 'SM02'),
('KTM0000000419', '3', '4.3', 'menyelesaikan masalah yang berkaitan dengan perbandingan dua besaran yang berbeda (kecepatan, debit)', 'MPL04', 'KLS05', 'SM02'),
('KTM0000000420', '4', '4.4', 'Menyelesaikan masalah yang berkaitan dengan skala pada denah', 'MPL04', 'KLS05', 'SM02'),
('KTM0000000421', '5', '4.5', 'Menyelesaikan masalah yang berkaitan dengan volume bangun ruang dengan menggunakan satuan volume (seperti kubus satuan) melibatkan pangkat tiga dan akar pangkat tiga', 'MPL04', 'KLS05', 'SM02'),
('KTM0000000422', '6', '4.6', 'Membuat jaring-jaring bangun ruang sederhana (kubus dan balok)', 'MPL04', 'KLS05', 'SM02'),
('KTM0000000423', '7', '4.7', 'Menganalisis data yang berkaitan dengan diri peserta didik atau lingkungan sekitar serta cara pengumpulannya', 'MPL04', 'KLS05', 'SM02'),
('KTM0000000424', '8', '4.8', 'Mengorganisasikan dan menyajikan data yang berkaitan dengan diri peserta didik dan membandingkan dengan data dari lingkungan sekitar dalam bentuk daftar, tabel, diagram gambar (piktogram), diagram batang, atau diagram garis', 'MPL04', 'KLS05', 'SM02'),
('KTM0000000425', '1', '4.1', 'Membuat gambar cerita', 'MPL05', 'KLS05', 'SM02'),
('KTM0000000426', '1', '4.2', 'Menyanyikan lagu-lagu dalam berbagai tangga nada dengan iringan musik', 'MPL05', 'KLS05', 'SM02'),
('KTM0000000427', '1', '4.3', 'Mempraktikkan pola lantai pada gerak tari kreasi dearah', 'MPL05', 'KLS05', 'SM02'),
('KTM0000000428', '1', '4.4', 'Membuat karya seni rupa daerah', 'MPL05', 'KLS05', 'SM02'),
('KTM0000000429', '1', '4.1', 'Mempraktikkan kombinasi gerak lokomotor, non-lokomotor, dan manipulatif sesuai dengan konsep tubuh, ruang, usaha, dan keterhubungan dalam berbagai permainan bola besar sederhana dan atau tradisional*', 'MPL06', 'KLS05', 'SM02'),
('KTM0000000430', '2', '4.2', 'Mempraktikkan kombinasi gerak dasar lokomotor, non-lokomotor, dan manipulatif sesuai dengan konsep tubuh, ruang, usaha, dan keterhubungan dalam berbagai permainan bola kecil sederhana dan atau tradisional*', 'MPL06', 'KLS05', 'SM02'),
('KTM0000000431', '3', '4.3', 'Mempraktikkan kombinasi gerak dasar jalan, lari, lompat, dan lempar melalui permainan/olahraga yang dimodifikasi dan atau olahraga tradisional', 'MPL06', 'KLS05', 'SM02'),
('KTM0000000432', '4', '4.4', 'Mempraktikkan variasi gerak dasar lokomotor dan non lokomotor untuk membentuk gerak dasar seni beladiri**', 'MPL06', 'KLS05', 'SM02'),
('KTM0000000433', '5', '4.5', 'Mempraktikkan aktivitas latihan daya tahan jantung (cardio respiratory) untuk pengembangan kebugaran jasmani', 'MPL06', 'KLS05', 'SM02'),
('KTM0000000434', '6', '4.6', 'Mempraktikkan kombinasi pola gerak dominan (bertumpu, bergantung, keseimbangan, berpindah/lokomotor, tolakan, putaran, ayunan, melayang, dan mendarat) untuk membentuk keterampilan dasar senam menggunakan alat', 'MPL06', 'KLS05', 'SM02'),
('KTM0000000435', '7', '4.7', 'Mempraktikkan pengunaan kombinasi gerak dasar langkah dan ayunan lengan mengikuti irama (ketukan) tanpa/dengan musik dalam aktivitas gerak berirama', 'MPL06', 'KLS05', 'SM02'),
('KTM0000000436', '8', '4.8', 'Mempraktikkan salah satu gaya renang dengan koordinasi yang baik pada jarak tertentu ***', 'MPL06', 'KLS05', 'SM02'),
('KTM0000000437', '9', '4.9', 'Menerapkan konsep pemeliharaan diri dan orang lain dari penyakit menular dan tidak menular', 'MPL06', 'KLS05', 'SM02'),
('KTM0000000438', '10', '4.10', 'Memaparkan bahaya merokok, meminum minuman keras, dan mengonsumsi narkotika, zat-zat aditif (NAPZA) dan obat berbahaya lainnya terhadap kesehatan tubuh', 'MPL06', 'KLS05', 'SM02'),
('KTM0000000439', '1', '4.1', 'Menyajikan hasil analisis pelaksanaan nilai-nilai Pancasila dalam kehidupan sehari-hari', 'MPL02', 'KLS06', 'SM01'),
('KTM0000000440', '2', '4.2', 'Menyajikan hasil analisis pelaksanaan kewajiban, ha, dan tanggung jawab sebagai warga masyarakat beserta dampaknya dalam kehidupan sehari-hari', 'MPL02', 'KLS06', 'SM01'),
('KTM0000000441', '3', '4.3', 'Mengampanyekan manfaat keanekaragaman sosial, budaya, dan ekonomi', 'MPL02', 'KLS06', 'SM01'),
('KTM0000000442', '4', '4.4', 'Menyajikan hasil telaah persatuan dan kesatuan terhadap kehidupan berbangsa dan bernegara beserta dampaknya', 'MPL02', 'KLS06', 'SM01'),
('KTM0000000443', '1', '4.1', 'Menyajikan simpulan secara lisan dan tulis dari teks laporan hasil pengamatan atau wawancara yang diperkuat oleh bukti', 'MPL03', 'KLS06', 'SM01'),
('KTM0000000444', '2', '4.2', 'Menyajikan hasil penggalian informasi dari teks penjelasan (eksplanasi) ilmiah secara lisan, tulis, dan visual dengan menggunakan kosakata baku dan kalimat efektif', 'MPL03', 'KLS06', 'SM01'),
('KTM0000000445', '3', '4.3', 'Menyampaikan pidato hasil karya pribadi dengan menggunakan kosakata baku dan kalimat efektif sebagai bentuk ungkapan diri', 'MPL03', 'KLS06', 'SM01'),
('KTM0000000446', '4', '4.4', 'Memaparkan informasi penting dari buku sejarah secara lisan, tulis, dan visual dengan menggunakan aspek: apa, di mana, kapan, siapa, mengapa, dan bagaimana serta memperhatikan penggunaan kosakata baku dan kalimat efektif', 'MPL03', 'KLS06', 'SM01'),
('KTM0000000447', '5', '4.5', 'Mengubah teks puisi ke dalam teks prosa dengan tetap memperhatikan makna isi teks puisi', 'MPL03', 'KLS06', 'SM01'),
('KTM0000000448', '6', '4.6', 'Mengisi teks formulir (pendaftaran, kartu anggota, pengiriman uang melalui bank/kantor pos, daftar riwayat hidup, dll.) sesuai petunjuk pengisiannya', 'MPL03', 'KLS06', 'SM01'),
('KTM0000000449', '7', '4.7', 'Menyampaikan kemungkinan informasi yang diperoleh berdasarkan membaca judul teks nonfiksi secara lisan, tulis, dan visual', 'MPL03', 'KLS06', 'SM01'),
('KTM0000000450', '8', '4.8', 'Menyampaikan hasil membandingkan informasi yang diharapkan dengan informasi yang diperoleh setelah membaca teks nonfiksi secara lisan, tulis, dan visual', 'MPL03', 'KLS06', 'SM01'),
('KTM0000000451', '9', '4.9', 'Menyampaikan penjelasan tentang tuturan dan tindakan tokoh serta penceritaan penulis dalam teks fiksi secara lisan, tulis, dan visual', 'MPL03', 'KLS06', 'SM01'),
('KTM0000000452', '10', '4.10', 'Menyajikan hasil pengaitan peristiwa yang dialami tokoh dalam cerita fiksi dengan pengalaman pribadi secara lisan, tulis, dan visual', 'MPL03', 'KLS06', 'SM01'),
('KTM0000000453', '1', '4.1', 'Menggunakan konsep bilangan bulat negatif (termasuk mengggunakan garis bilangan) untuk menyatakan situasi sehari-hari', 'MPL04', 'KLS06', 'SM01'),
('KTM0000000454', '2', '4.2', 'Menyelesaikan masalah yang berkaitan dengan operasi penjumlahan, pengurangan, perkalian, dan pembagian yang melibatkan bilangan bulat negatif dalam kehidupan sehari-hari', 'MPL04', 'KLS06', 'SM01'),
('KTM0000000455', '3', '4.3', 'Menyelesaikan masalah yang berkaitan operasi hitung campuran yang melibatkan bilangan cacah, pecahan dan/atau desimal dalam berbagai bentuk sesuai urutan operasi', 'MPL04', 'KLS06', 'SM01'),
('KTM0000000456', '4', '4.4', 'Mengidentifikasi titik pusat, jari-jari, diameter, busur, tali busur, tembereng, dan juring', 'MPL04', 'KLS06', 'SM01'),
('KTM0000000457', '5', '4.5', 'Menaksir keliling dan luas lingkaran serta menggunakannya untuk menyelesaikan masalah', 'MPL04', 'KLS06', 'SM01'),
('KTM0000000458', '6', '4.6', 'Mengidentifikasi prisma, tabung, limas, kerucut, dan bola', 'MPL04', 'KLS06', 'SM01'),
('KTM0000000459', '7', '4.7', 'Mengidentifikasi bangun ruang yang merupakan gabungan dari beberapa bangun ruang, serta luas permukaan dan volumenya', 'MPL04', 'KLS06', 'SM01'),
('KTM0000000460', '8', '4.8', 'Menyelesaikan masalah yang berkaitan dengan modus, median, dan mean dari data tunggal dalam penyelesaian masalah', 'MPL04', 'KLS06', 'SM01'),
('KTM0000000461', '1', '4.1', 'membuat reklame', 'MPL05', 'KLS06', 'SM01'),
('KTM0000000462', '2', '4.2', 'memainkan interval nada melalui lagu dan alat musik', 'MPL05', 'KLS06', 'SM01'),
('KTM0000000463', '3', '4.3', 'menampilkan tari kreasi daerah', 'MPL05', 'KLS06', 'SM01'),
('KTM0000000464', '4', '4.4', 'membuat patung', 'MPL05', 'KLS06', 'SM01'),
('KTM0000000465', '1', '4.1', 'Mempraktikkan variasi dan kombinasi gerak dasar lokomotor, non-lokomotor, dan manipulatif dengan kontrol yang baik dalam permainan bola besar sederhana dan atau tradisional*', 'MPL06', 'KLS06', 'SM01'),
('KTM0000000466', '2', '4.2', 'Mempraktikkan variasi dan kombinasi gerak dasar lokomotor, non-lokomotor, dan manipulatif dengan kontrol yang baik dalam permainan bola kecil sederhana dan atau tradisional*', 'MPL06', 'KLS06', 'SM01'),
('KTM0000000467', '3', '4.3', 'Mempraktikkan variasi dan kombinasi gerak dasar jalan, lari, lompat, dan lempar dengan kontrol yang baik melalui permainan dan atau olahraga tradisional', 'MPL06', 'KLS06', 'SM01'),
('KTM0000000468', '4', '4.4', 'Mempraktikkan variasi dan kombinasi gerak dasar lokomotor, non lokomotor, dan manipulatif untuk membentuk gerak dasar seni beladiri**', 'MPL06', 'KLS06', 'SM01'),
('KTM0000000469', '5', '4.5', 'Mempratikkan latihan kebugaran jasmani dan pengukuran tingkat kebugaran jasmani pribadi secara sederhana (contoh: menghitung denyut nadi, menghitung kemampuan melakukan push up, menghitung kelenturan tungkai)', 'MPL06', 'KLS06', 'SM01'),
('KTM0000000470', '6', '4.6', 'Mempraktikkan rangkaian tiga pola gerak dominan (bertumpu, bergantung, keseimbangan, berpindah/lokomotor, tolakan, putaran, ayunan, melayang, dan mendarat) dengan konsisten, tepat dan terkontrol dalam aktivitas senam', 'MPL06', 'KLS06', 'SM01'),
('KTM0000000471', '7', '4.7', 'Mempraktikkan penggunaan variasi dan kombinasi gerak dasar rangkaian langkah dan ayunan lengan mengikuti irama (ketukan) tanpa/dengan musik dalam aktivitas gerak berirama', 'MPL06', 'KLS06', 'SM01'),
('KTM0000000472', '8', '4.8', 'Mempraktikkan keterampilan salah satu gaya renang dan dasar-dasar penyelamatan diri***', 'MPL06', 'KLS06', 'SM01'),
('KTM0000000473', '9', '4.9', 'Memaparkan perlunya pemeliharaan kebersihan alat reproduksi', 'MPL06', 'KLS06', 'SM01'),
('KTM0000000474', '1', '4.1', 'Menyajikan hasil analisis pelaksanaan nilai-nilai Pancasila dalam kehidupan sehari-hari', 'MPL02', 'KLS06', 'SM02'),
('KTM0000000475', '2', '4.2', 'Menyajikan hasil analisis pelaksanaan kewajiban, ha, dan tanggung jawab sebagai warga masyarakat beserta dampaknya dalam kehidupan sehari-hari', 'MPL02', 'KLS06', 'SM02'),
('KTM0000000476', '3', '4.3', 'Mengampanyekan manfaat keanekaragaman sosial, budaya, dan ekonomi', 'MPL02', 'KLS06', 'SM02'),
('KTM0000000477', '4', '4.4', 'Menyajikan hasil telaah persatuan dan kesatuan terhadap kehidupan berbangsa dan bernegara beserta dampaknya', 'MPL02', 'KLS06', 'SM02'),
('KTM0000000478', '1', '4.1', 'Menyajikan simpulan secara lisan dan tulis dari teks laporan hasil pengamatan atau wawancara yang diperkuat oleh bukti', 'MPL03', 'KLS06', 'SM02'),
('KTM0000000479', '2', '4.2', 'Menyajikan hasil penggalian informasi dari teks penjelasan (eksplanasi) ilmiah secara lisan, tulis, dan visual dengan menggunakan kosakata baku dan kalimat efektif', 'MPL03', 'KLS06', 'SM02'),
('KTM0000000480', '3', '4.3', 'Menyampaikan pidato hasil karya pribadi dengan menggunakan kosakata baku dan kalimat efektif sebagai bentuk ungkapan diri', 'MPL03', 'KLS06', 'SM02'),
('KTM0000000481', '4', '4.4', 'Memaparkan informasi penting dari buku sejarah secara lisan, tulis, dan visual dengan menggunakan aspek: apa, di mana, kapan, siapa, mengapa, dan bagaimana serta memperhatikan penggunaan kosakata baku dan kalimat efektif', 'MPL03', 'KLS06', 'SM02'),
('KTM0000000482', '5', '4.5', 'Mengubah teks puisi ke dalam teks prosa dengan tetap memperhatikan makna isi teks puisi', 'MPL03', 'KLS06', 'SM02'),
('KTM0000000483', '6', '4.6', 'Mengisi teks formulir (pendaftaran, kartu anggota, pengiriman uang melalui bank/kantor pos, daftar riwayat hidup, dll.) sesuai petunjuk pengisiannya', 'MPL03', 'KLS06', 'SM02'),
('KTM0000000484', '7', '4.7', 'Menyampaikan kemungkinan informasi yang diperoleh berdasarkan membaca judul teks nonfiksi secara lisan, tulis, dan visual', 'MPL03', 'KLS06', 'SM02'),
('KTM0000000485', '8', '4.8', 'Menyampaikan hasil membandingkan informasi yang diharapkan dengan informasi yang diperoleh setelah membaca teks nonfiksi secara lisan, tulis, dan visual', 'MPL03', 'KLS06', 'SM02'),
('KTM0000000486', '9', '4.9', 'Menyampaikan penjelasan tentang tuturan dan tindakan tokoh serta penceritaan penulis dalam teks fiksi secara lisan, tulis, dan visual', 'MPL03', 'KLS06', 'SM02'),
('KTM0000000487', '10', '4.10', 'Menyajikan hasil pengaitan peristiwa yang dialami tokoh dalam cerita fiksi dengan pengalaman pribadi secara lisan, tulis, dan visual', 'MPL03', 'KLS06', 'SM02'),
('KTM0000000488', '1', '4.1', 'Menggunakan konsep bilangan bulat negatif (termasuk mengggunakan garis bilangan) untuk menyatakan situasi sehari-hari', 'MPL04', 'KLS06', 'SM02'),
('KTM0000000489', '2', '4.2', 'Menyelesaikan masalah yang berkaitan dengan operasi penjumlahan, pengurangan, perkalian, dan pembagian yang melibatkan bilangan bulat negatif dalam kehidupan sehari-hari', 'MPL04', 'KLS06', 'SM02'),
('KTM0000000490', '3', '4.3', 'Menyelesaikan masalah yang berkaitan operasi hitung campuran yang melibatkan bilangan cacah, pecahan dan/atau desimal dalam berbagai bentuk sesuai urutan operasi', 'MPL04', 'KLS06', 'SM02'),
('KTM0000000491', '4', '4.4', 'Mengidentifikasi titik pusat, jari-jari, diameter, busur, tali busur, tembereng, dan juring', 'MPL04', 'KLS06', 'SM02'),
('KTM0000000492', '5', '4.5', 'Menaksir keliling dan luas lingkaran serta menggunakannya untuk menyelesaikan masalah', 'MPL04', 'KLS06', 'SM02'),
('KTM0000000493', '6', '4.6', 'Mengidentifikasi prisma, tabung, limas, kerucut, dan bola', 'MPL04', 'KLS06', 'SM02'),
('KTM0000000494', '7', '4.7', 'Mengidentifikasi bangun ruang yang merupakan gabungan dari beberapa bangun ruang, serta luas permukaan dan volumenya', 'MPL04', 'KLS06', 'SM02'),
('KTM0000000495', '8', '4.8', 'Menyelesaikan masalah yang berkaitan dengan modus, median, dan mean dari data tunggal dalam penyelesaian masalah', 'MPL04', 'KLS06', 'SM02'),
('KTM0000000496', '1', '4.1', 'membuat reklame', 'MPL05', 'KLS06', 'SM02'),
('KTM0000000497', '2', '4.2', 'memainkan interval nada melalui lagu dan alat musik', 'MPL05', 'KLS06', 'SM02'),
('KTM0000000498', '3', '4.3', 'menampilkan tari kreasi daerah', 'MPL05', 'KLS06', 'SM02'),
('KTM0000000499', '4', '4.4', 'membuat patung', 'MPL05', 'KLS06', 'SM02'),
('KTM0000000500', '1', '4.1', 'Mempraktikkan variasi dan kombinasi gerak dasar lokomotor, non-lokomotor, dan manipulatif dengan kontrol yang baik dalam permainan bola besar sederhana dan atau tradisional*', 'MPL06', 'KLS06', 'SM02'),
('KTM0000000501', '2', '4.2', 'Mempraktikkan variasi dan kombinasi gerak dasar lokomotor, non-lokomotor, dan manipulatif dengan kontrol yang baik dalam permainan bola kecil sederhana dan atau tradisional*', 'MPL06', 'KLS06', 'SM02'),
('KTM0000000502', '3', '4.3', 'Mempraktikkan variasi dan kombinasi gerak dasar jalan, lari, lompat, dan lempar dengan kontrol yang baik melalui permainan dan atau olahraga tradisional', 'MPL06', 'KLS06', 'SM02'),
('KTM0000000503', '4', '4.4', 'Mempraktikkan variasi dan kombinasi gerak dasar lokomotor, non lokomotor, dan manipulatif untuk membentuk gerak dasar seni beladiri**', 'MPL06', 'KLS06', 'SM02'),
('KTM0000000504', '5', '4.5', 'Mempratikkan latihan kebugaran jasmani dan pengukuran tingkat kebugaran jasmani pribadi secara sederhana (contoh: menghitung denyut nadi, menghitung kemampuan melakukan push up, menghitung kelenturan tungkai)', 'MPL06', 'KLS06', 'SM02'),
('KTM0000000505', '6', '4.6', 'Mempraktikkan rangkaian tiga pola gerak dominan (bertumpu, bergantung, keseimbangan, berpindah/lokomotor, tolakan, putaran, ayunan, melayang, dan mendarat) dengan konsisten, tepat dan terkontrol dalam aktivitas senam', 'MPL06', 'KLS06', 'SM02'),
('KTM0000000506', '7', '4.7', 'Mempraktikkan penggunaan variasi dan kombinasi gerak dasar rangkaian langkah dan ayunan lengan mengikuti irama (ketukan) tanpa/dengan musik dalam aktivitas gerak berirama', 'MPL06', 'KLS06', 'SM02'),
('KTM0000000507', '8', '4.8', 'Mempraktikkan keterampilan salah satu gaya renang dan dasar-dasar penyelamatan diri***', 'MPL06', 'KLS06', 'SM02'),
('KTM0000000508', '9', '4.9', 'Memaparkan perlunya pemeliharaan kebersihan alat reproduksi', 'MPL06', 'KLS06', 'SM02'),
('KTM0000000509', '10', '4.10', 'KD Mulok 3 Aspek Keterampilan 4.10', 'MPL09', 'KLS01', 'SM01');

--
-- Trigger `kd_keterampilan`
--
DELIMITER $$
CREATE TRIGGER `kd_ki4_berubah` AFTER UPDATE ON `kd_keterampilan` FOR EACH ROW BEGIN
	UPDATE nilai_raportkd_ki4 SET nomor_kd = NEW.nomor_kd, deskripsi = NEW.deskripsi WHERE id_kd = OLD.id_kd;
    END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `kd_pengetahuan`
--

CREATE TABLE `kd_pengetahuan` (
  `id_kd` char(15) CHARACTER SET latin1 NOT NULL,
  `nom` varchar(20) CHARACTER SET latin1 NOT NULL,
  `nomor_kd` varchar(20) CHARACTER SET latin1 NOT NULL,
  `deskripsi` varchar(225) CHARACTER SET latin1 NOT NULL,
  `id_mapel` char(15) CHARACTER SET latin1 NOT NULL,
  `id_kelas` char(15) CHARACTER SET latin1 NOT NULL,
  `id_semester` char(15) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `kd_pengetahuan`
--

INSERT INTO `kd_pengetahuan` (`id_kd`, `nom`, `nomor_kd`, `deskripsi`, `id_mapel`, `id_kelas`, `id_semester`) VALUES
('KTM0000000001', '1', '3.1', 'mengenal simbol sila-sila Pancasila dalam lambang negara “Garuda Pancasila”', 'MPL02', 'KLS01', 'SM01'),
('KTM0000000002', '2', '3.2', 'mengidentifikasi aturan yang berlaku dalam kehidupan sehari-hari di rumah', 'MPL02', 'KLS01', 'SM01'),
('KTM0000000003', '3', '3.3', 'mengidentifikasi keberagaman karateristik individu di rumah', 'MPL02', 'KLS01', 'SM01'),
('KTM0000000004', '4', '3.4', 'mengidentifikasi bentuk kerjasama dalam keberagaman di rumah', 'MPL02', 'KLS01', 'SM01'),
('KTM0000000005', '1', '3.1', 'menjelaskan kegiatan persiapan membaca permulaan ', 'MPL03', 'KLS01', 'SM01'),
('KTM0000000006', '2', '3.2', 'mengemuka-kan kegiatan persiapan menulis permulaan  yang benar secara lisan', 'MPL03', 'KLS01', 'SM01'),
('KTM0000000007', '3', '3.3', 'menguraikan lambang bunyi vokal dan konsonan dalam kata bahasa Indonesia atau bahasa daerahatau bahasa daerah', 'MPL03', 'KLS01', 'SM01'),
('KTM0000000008', '4', '3.4', 'menentukan kosakata tentang anggota tubuh dan pancaindra serta perawatannya melalui teks pendek dan eksplorasi lingkungan', 'MPL03', 'KLS01', 'SM01'),
('KTM0000000009', '5', '3.5', 'mengenal kosakata tentang cara memelihara kesehatan melalui teks pendek  dan/atau eksplorasi lingkungan', 'MPL03', 'KLS01', 'SM01'),
('KTM0000000010', '6', '3.6', 'menguraikan kosakata tentang berbagai jenis benda di lingkungan sekitar melalui teks pendek dan/atau eksplorasi lingkungan', 'MPL03', 'KLS01', 'SM01'),
('KTM0000000011', '7', '3.7', 'menentukan kosakata yang berkaitan dengan peristiwa siang dan malam melalui teks pendek dan/atau eksplorasi lingkungan', 'MPL03', 'KLS01', 'SM01'),
('KTM0000000012', '8', '3.8', 'merinci ungkapan penyampaian terima kasih, permintaan maaf, tolong, dan pemberian pujian, ajakan, pemberitahuan, perintah, dan petunjuk kepada orang lain dengan menggunakan bahasa yang santun secara lisan dan tulisan yang dap', 'MPL03', 'KLS01', 'SM01'),
('KTM0000000013', '9', '3.9', 'merinci kosakata dan ungkapan perkenalan diri, keluarga, dan orang-orang di tempat tinggalnya secara lisan dan tulis yang dapat dibantu dengan kosakata bahasa daerah', 'MPL03', 'KLS01', 'SM01'),
('KTM0000000014', '10', '3.10', 'menguraikan kosakata hubungan kekeluargaan melalui gambar/bagan silsilah keluarga dalam bahasa Indonesia atau bahasa daerah', 'MPL03', 'KLS01', 'SM01'),
('KTM0000000015', '11', '3.11', 'mencermati puisi anak/syair lagu  yang diperdengarkan dengan tujuan untuk kesenangan', 'MPL03', 'KLS01', 'SM01'),
('KTM0000000016', '1', '3.1', 'menjelaskan makna bilangan cacah sampai dengan 99 sebagai banyak anggota suatu kumpulan objek', 'MPL04', 'KLS01', 'SM01'),
('KTM0000000017', '2', '3.2', 'menjelaskan bilangan sampai dua angka dan nilai tempat penyusun lambang bilangan menggunakan kumpulan benda konkret serta cara membacanya', 'MPL04', 'KLS01', 'SM01'),
('KTM0000000018', '3', '3.3', 'membandingkan dua bilangan sampai dua angka dengan menggunakan kumpulan benda-benda konkret', 'MPL04', 'KLS01', 'SM01'),
('KTM0000000019', '4', '3.4', 'menjelaskan dan melakukan penjumlahan dan pengurangan bilangan yang melibatkan bilangan cacah sampai dengan 99 dalam kehidupan sehari-hari serta mengaitkan penjumlahan dan pengurangan', 'MPL04', 'KLS01', 'SM01'),
('KTM0000000020', '5', '3.5', 'mengenal pola bilangan yang berkaitan dengan kumpulan benda/gambar/gerakan atau lainnya', 'MPL04', 'KLS01', 'SM01'),
('KTM0000000021', '6', '3.6', 'mengenal bangun ruang dan bangun datar dengan menggunakan berbagai benda konkret', 'MPL04', 'KLS01', 'SM01'),
('KTM0000000022', '7', '3.7', 'mengidentifikasi bangun datar yang dapat disusun membentuk pola pengubinan', 'MPL04', 'KLS01', 'SM01'),
('KTM0000000023', '8', '3.8', 'mengenal dan menentukan panjang dan berat dengan satuan tidak baku menggunakan benda/situasi konkret', 'MPL04', 'KLS01', 'SM01'),
('KTM0000000024', '9', '3.9', 'membandingkan panjang, berat, lamanya waktu, dan suhu menggunakan benda/ situasi konkret', 'MPL04', 'KLS01', 'SM01'),
('KTM0000000025', '1', '3.1', 'mengenal karya ekspresi dua dan tiga dimensi', 'MPL05', 'KLS01', 'SM01'),
('KTM0000000026', '2', '3.2', 'mengenal elemen musik melalui lagu', 'MPL05', 'KLS01', 'SM01'),
('KTM0000000027', '3', '3.3', 'mengenal gerak anggota tubuh melalui tari', 'MPL05', 'KLS01', 'SM01'),
('KTM0000000028', '4', '3.4', 'mengenal bahan alam dalam berkarya', 'MPL05', 'KLS01', 'SM01'),
('KTM0000000029', '1', '3.1', 'memahami gerak dasar lokomotor sesuai dengan konsep tubuh, ruang, usaha, dan keterhubungan dalam berbagai bentuk permainan sederhana dan atau tradisional', 'MPL06', 'KLS01', 'SM01'),
('KTM0000000030', '2', '3.2', 'memahami gerak dasar non-lokomotor sesuai dengan konsep tubuh, ruang, usaha, dan keterhubungan dalam berbagai bentuk permainan sederhana dan atau tradisional', 'MPL06', 'KLS01', 'SM01'),
('KTM0000000031', '3', '3.3', 'memahami pola gerak dasar manipulatif sesuai dengan konsep tubuh, ruang, usaha, dan keterhubungan dalam berbagai bentuk permainan sederhana dan atau tradisional', 'MPL06', 'KLS01', 'SM01'),
('KTM0000000032', '4', '3.4', 'memahami menjaga sikap tubuh (duduk, membaca, berdiri, jalan), dan bergerak secara lentur serta seimbang dalam rangka pembentukan tubuh melalui permainan sederhana dan atau tradisional', 'MPL06', 'KLS01', 'SM01'),
('KTM0000000033', '5', '3.5', 'memahami berbagai gerak dominan (bertumpu, bergantung, keseimbangan, berpindah/lokomotor, tolakan, putaran, ayunan, melayang, dan mendarat) dalam aktivitas senam lantai', 'MPL06', 'KLS01', 'SM01'),
('KTM0000000034', '6', '3.6', 'memahami gerak dasar lokomotor dan non-lokomotor sesuai dengan irama (ketukan) tanpa/dengan musik dalam aktivitas gerak berirama', 'MPL06', 'KLS01', 'SM01'),
('KTM0000000035', '7', '3.7', 'memahami berbagai pengenalan aktivitas air dan menjaga keselamatan diri/orang lain dalam', 'MPL06', 'KLS01', 'SM01'),
('KTM0000000036', '8', '3.8', 'memahami bagian-bagian tubuh, bagian tubuh yang boleh dan tidak boleh disentuh orang lain, cara menjaga kebersihannya, dan kebersihan pakaian', 'MPL06', 'KLS01', 'SM01'),
('KTM0000000037', '1', '3.1', 'KD Mulok 1 Aspek Pengetahuan 3.1', 'MPL07', 'KLS01', 'SM01'),
('KTM0000000038', '2', '3.2', 'KD Mulok 1 Aspek Pengetahuan 3.2', 'MPL07', 'KLS01', 'SM01'),
('KTM0000000039', '3', '3.3', 'KD Mulok 1 Aspek Pengetahuan 3.3', 'MPL07', 'KLS01', 'SM01'),
('KTM0000000040', '4', '3.4', 'KD Mulok 1 Aspek Pengetahuan 3.4', 'MPL07', 'KLS01', 'SM01'),
('KTM0000000041', '5', '3.5', 'KD Mulok 1 Aspek Pengetahuan 3.5', 'MPL07', 'KLS01', 'SM01'),
('KTM0000000042', '6', '3.6', 'KD Mulok 1 Aspek Pengetahuan 3.6', 'MPL07', 'KLS01', 'SM01'),
('KTM0000000043', '7', '3.7', 'KD Mulok 1 Aspek Pengetahuan 3.7', 'MPL07', 'KLS01', 'SM01'),
('KTM0000000044', '8', '3.8', 'KD Mulok 1 Aspek Pengetahuan 3.8', 'MPL07', 'KLS01', 'SM01'),
('KTM0000000045', '9', '3.9', 'KD Mulok 1 Aspek Pengetahuan 3.9', 'MPL07', 'KLS01', 'SM01'),
('KTM0000000046', '10', '3.10', 'KD Mulok 1 Aspek Pengetahuan 3.10', 'MPL07', 'KLS01', 'SM01'),
('KTM0000000047', '1', '3.1', 'KD Mulok 2 Aspek Pengetahuan 3.1', 'MPL08', 'KLS01', 'SM01'),
('KTM0000000048', '2', '3.2', 'KD Mulok 2 Aspek Pengetahuan 3.2', 'MPL08', 'KLS01', 'SM01'),
('KTM0000000049', '3', '3.3', 'KD Mulok 2 Aspek Pengetahuan 3.3', 'MPL08', 'KLS01', 'SM01'),
('KTM0000000050', '4', '3.4', 'KD Mulok 2 Aspek Pengetahuan 3.4', 'MPL08', 'KLS01', 'SM01'),
('KTM0000000051', '5', '3.5', 'KD Mulok 2 Aspek Pengetahuan 3.5', 'MPL08', 'KLS01', 'SM01'),
('KTM0000000052', '6', '3.6', 'KD Mulok 2 Aspek Pengetahuan 3.6', 'MPL08', 'KLS01', 'SM01'),
('KTM0000000053', '7', '3.7', 'KD Mulok 2 Aspek Pengetahuan 3.7', 'MPL08', 'KLS01', 'SM01'),
('KTM0000000054', '8', '3.8', 'KD Mulok 2 Aspek Pengetahuan 3.8', 'MPL08', 'KLS01', 'SM01'),
('KTM0000000055', '9', '3.9', 'KD Mulok 2 Aspek Pengetahuan 3.9', 'MPL08', 'KLS01', 'SM01'),
('KTM0000000056', '10', '3.10', 'KD Mulok 2 Aspek Pengetahuan 3.10', 'MPL08', 'KLS01', 'SM01'),
('KTM0000000057', '1', '3.1', 'KD Mulok 3 Aspek Pengetahuan 3.1', 'MPL09', 'KLS01', 'SM01'),
('KTM0000000058', '2', '3.2', 'KD Mulok 3 Aspek Pengetahuan 3.2', 'MPL09', 'KLS01', 'SM01'),
('KTM0000000059', '3', '3.3', 'KD Mulok 3 Aspek Pengetahuan 3.3', 'MPL09', 'KLS01', 'SM01'),
('KTM0000000060', '4', '3.4', 'KD Mulok 3 Aspek Pengetahuan 3.4', 'MPL09', 'KLS01', 'SM01'),
('KTM0000000061', '5', '3.5', 'KD Mulok 3 Aspek Pengetahuan 3.5', 'MPL09', 'KLS01', 'SM01'),
('KTM0000000062', '6', '3.6', 'KD Mulok 3 Aspek Pengetahuan 3.6', 'MPL09', 'KLS01', 'SM01'),
('KTM0000000063', '7', '3.7', 'KD Mulok 3 Aspek Pengetahuan 3.7', 'MPL09', 'KLS01', 'SM01'),
('KTM0000000064', '8', '3.8', 'KD Mulok 3 Aspek Pengetahuan 3.8', 'MPL09', 'KLS01', 'SM01'),
('KTM0000000065', '9', '3.9', 'KD Mulok 3 Aspek Pengetahuan 3.9', 'MPL09', 'KLS01', 'SM01'),
('KTM0000000067', '1', '3.1', 'mengenal simbol sila-sila Pancasila dalam lambang negara “Garuda Pancasila”', 'MPL02', 'KLS01', 'SM02'),
('KTM0000000068', '2', '3.2', 'mengidentifikasi aturan yang berlaku dalam kehidupan sehari-hari di rumah', 'MPL02', 'KLS01', 'SM02'),
('KTM0000000069', '3', '3.3', 'mengidentifikasi keberagaman karateristik individu di rumah', 'MPL02', 'KLS01', 'SM02'),
('KTM0000000070', '4', '3.4', 'mengidentifikasi bentuk kerjasama dalam keberagaman di rumah', 'MPL02', 'KLS01', 'SM02'),
('KTM0000000071', '1', '3.1', 'menjelaskan kegiatan persiapan membaca permulaan ', 'MPL03', 'KLS01', 'SM02'),
('KTM0000000072', '2', '3.2', 'mengemuka-kan kegiatan persiapan menulis permulaan  yang benar secara lisan', 'MPL03', 'KLS01', 'SM02'),
('KTM0000000073', '3', '3.3', 'menguraikan lambang bunyi vokal dan konsonan dalam kata bahasa Indonesia atau bahasa daerahatau bahasa daerah', 'MPL03', 'KLS01', 'SM02'),
('KTM0000000074', '4', '3.4', 'menentukan kosakata tentang anggota tubuh dan pancaindra serta perawatannya melalui teks pendek dan eksplorasi lingkungan', 'MPL03', 'KLS01', 'SM02'),
('KTM0000000075', '5', '3.5', 'mengenal kosakata tentang cara memelihara kesehatan melalui teks pendek  dan/atau eksplorasi lingkungan', 'MPL03', 'KLS01', 'SM02'),
('KTM0000000076', '6', '3.6', 'menguraikan kosakata tentang berbagai jenis benda di lingkungan sekitar melalui teks pendek dan/atau eksplorasi lingkungan', 'MPL03', 'KLS01', 'SM02'),
('KTM0000000077', '7', '3.7', 'menentukan kosakata yang berkaitan dengan peristiwa siang dan malam melalui teks pendek dan/atau eksplorasi lingkungan', 'MPL03', 'KLS01', 'SM02'),
('KTM0000000078', '8', '3.8', 'merinci ungkapan penyampaian terima kasih, permintaan maaf, tolong, dan pemberian pujian, ajakan, pemberitahuan, perintah, dan petunjuk kepada orang lain dengan menggunakan bahasa yang santun secara lisan dan tulisan yang dap', 'MPL03', 'KLS01', 'SM02'),
('KTM0000000079', '9', '3.9', 'merinci kosakata dan ungkapan perkenalan diri, keluarga, dan orang-orang di tempat tinggalnya secara lisan dan tulis yang dapat dibantu dengan kosakata bahasa daerah', 'MPL03', 'KLS01', 'SM02'),
('KTM0000000080', '10', '3.10', 'menguraikan kosakata hubungan kekeluargaan melalui gambar/bagan silsilah keluarga dalam bahasa Indonesia atau bahasa daerah', 'MPL03', 'KLS01', 'SM02'),
('KTM0000000081', '11', '3.11', 'mencermati puisi anak/syair lagu  yang diperdengarkan dengan tujuan untuk kesenangan', 'MPL03', 'KLS01', 'SM02'),
('KTM0000000082', '1', '3.1', 'menjelaskan makna bilangan cacah sampai dengan 99 sebagai banyak anggota suatu kumpulan objek', 'MPL04', 'KLS01', 'SM02'),
('KTM0000000083', '2', '3.2', 'menjelaskan bilangan sampai dua angka dan nilai tempat penyusun lambang bilangan menggunakan kumpulan benda konkret serta cara membacanya', 'MPL04', 'KLS01', 'SM02'),
('KTM0000000084', '3', '3.3', 'membandingkan dua bilangan sampai dua angka dengan menggunakan kumpulan benda-benda konkret', 'MPL04', 'KLS01', 'SM02'),
('KTM0000000085', '4', '3.4', 'menjelaskan dan melakukan penjumlahan dan pengurangan bilangan yang melibatkan bilangan cacah sampai dengan 99 dalam kehidupan sehari-hari serta mengaitkan penjumlahan dan pengurangan', 'MPL04', 'KLS01', 'SM02'),
('KTM0000000086', '5', '3.5', 'mengenal pola bilangan yang berkaitan dengan kumpulan benda/gambar/gerakan atau lainnya', 'MPL04', 'KLS01', 'SM02'),
('KTM0000000087', '6', '3.6', 'mengenal bangun ruang dan bangun datar dengan menggunakan berbagai benda konkret', 'MPL04', 'KLS01', 'SM02'),
('KTM0000000088', '7', '3.7', 'mengidentifikasi bangun datar yang dapat disusun membentuk pola pengubinan', 'MPL04', 'KLS01', 'SM02'),
('KTM0000000089', '8', '3.8', 'mengenal dan menentukan panjang dan berat dengan satuan tidak baku menggunakan benda/situasi konkret', 'MPL04', 'KLS01', 'SM02'),
('KTM0000000090', '9', '3.9', 'membandingkan panjang, berat, lamanya waktu, dan suhu menggunakan benda/ situasi konkret', 'MPL04', 'KLS01', 'SM02'),
('KTM0000000091', '1', '3.1', 'mengenal karya ekspresi dua dan tiga dimensi', 'MPL05', 'KLS01', 'SM02'),
('KTM0000000092', '2', '3.2', 'mengenal elemen musik melalui lagu', 'MPL05', 'KLS01', 'SM02'),
('KTM0000000093', '3', '3.3', 'mengenal gerak anggota tubuh melalui tari', 'MPL05', 'KLS01', 'SM02'),
('KTM0000000094', '4', '3.4', 'mengenal bahan alam dalam berkarya', 'MPL05', 'KLS01', 'SM02'),
('KTM0000000095', '1', '3.1', 'memahami gerak dasar lokomotor sesuai dengan konsep tubuh, ruang, usaha, dan keterhubungan dalam berbagai bentuk permainan sederhana dan atau tradisional', 'MPL06', 'KLS01', 'SM02'),
('KTM0000000096', '2', '3.2', 'memahami gerak dasar non-lokomotor sesuai dengan konsep tubuh, ruang, usaha, dan keterhubungan dalam berbagai bentuk permainan sederhana dan atau tradisional', 'MPL06', 'KLS01', 'SM02'),
('KTM0000000097', '3', '3.3', 'memahami pola gerak dasar manipulatif sesuai dengan konsep tubuh, ruang, usaha, dan keterhubungan dalam berbagai bentuk permainan sederhana dan atau tradisional', 'MPL06', 'KLS01', 'SM02'),
('KTM0000000098', '4', '3.4', 'memahami menjaga sikap tubuh (duduk, membaca, berdiri, jalan), dan bergerak secara lentur serta seimbang dalam rangka pembentukan tubuh melalui permainan sederhana dan atau tradisional', 'MPL06', 'KLS01', 'SM02'),
('KTM0000000099', '5', '3.5', 'memahami berbagai gerak dominan (bertumpu, bergantung, keseimbangan, berpindah/lokomotor, tolakan, putaran, ayunan, melayang, dan mendarat) dalam aktivitas senam lantai', 'MPL06', 'KLS01', 'SM02'),
('KTM0000000100', '6', '3.6', 'memahami gerak dasar lokomotor dan non-lokomotor sesuai dengan irama (ketukan) tanpa/dengan musik dalam aktivitas gerak berirama', 'MPL06', 'KLS01', 'SM02'),
('KTM0000000101', '7', '3.7', 'memahami berbagai pengenalan aktivitas air dan menjaga keselamatan diri/orang lain dalam', 'MPL06', 'KLS01', 'SM02'),
('KTM0000000102', '8', '3.8', 'memahami bagian-bagian tubuh, bagian tubuh yang boleh dan tidak boleh disentuh orang lain, cara menjaga kebersihannya, dan kebersihan pakaian', 'MPL06', 'KLS01', 'SM02'),
('KTM0000000103', '1', '3.1', 'KD Mulok 1 Aspek Pengetahuan 3.1', 'MPL07', 'KLS01', 'SM02'),
('KTM0000000104', '2', '3.2', 'KD Mulok 1 Aspek Pengetahuan 3.2', 'MPL07', 'KLS01', 'SM02'),
('KTM0000000105', '3', '3.3', 'KD Mulok 1 Aspek Pengetahuan 3.3', 'MPL07', 'KLS01', 'SM02'),
('KTM0000000106', '4', '3.4', 'KD Mulok 1 Aspek Pengetahuan 3.4', 'MPL07', 'KLS01', 'SM02'),
('KTM0000000107', '5', '3.5', 'KD Mulok 1 Aspek Pengetahuan 3.5', 'MPL07', 'KLS01', 'SM02'),
('KTM0000000108', '6', '3.6', 'KD Mulok 1 Aspek Pengetahuan 3.6', 'MPL07', 'KLS01', 'SM02'),
('KTM0000000109', '7', '3.7', 'KD Mulok 1 Aspek Pengetahuan 3.7', 'MPL07', 'KLS01', 'SM02'),
('KTM0000000110', '8', '3.8', 'KD Mulok 1 Aspek Pengetahuan 3.8', 'MPL07', 'KLS01', 'SM02'),
('KTM0000000111', '9', '3.9', 'KD Mulok 1 Aspek Pengetahuan 3.9', 'MPL07', 'KLS01', 'SM02'),
('KTM0000000112', '10', '3.10', 'KD Mulok 1 Aspek Pengetahuan 3.10', 'MPL07', 'KLS01', 'SM02'),
('KTM0000000113', '1', '3.1', 'KD Mulok 2 Aspek Pengetahuan 3.1', 'MPL08', 'KLS01', 'SM02'),
('KTM0000000114', '2', '3.2', 'KD Mulok 2 Aspek Pengetahuan 3.2', 'MPL08', 'KLS01', 'SM02'),
('KTM0000000115', '3', '3.3', 'KD Mulok 2 Aspek Pengetahuan 3.3', 'MPL08', 'KLS01', 'SM02'),
('KTM0000000116', '4', '3.4', 'KD Mulok 2 Aspek Pengetahuan 3.4', 'MPL08', 'KLS01', 'SM02'),
('KTM0000000117', '5', '3.5', 'KD Mulok 2 Aspek Pengetahuan 3.5', 'MPL08', 'KLS01', 'SM02'),
('KTM0000000118', '6', '3.6', 'KD Mulok 2 Aspek Pengetahuan 3.6', 'MPL08', 'KLS01', 'SM02'),
('KTM0000000119', '7', '3.7', 'KD Mulok 2 Aspek Pengetahuan 3.7', 'MPL08', 'KLS01', 'SM02'),
('KTM0000000120', '8', '3.8', 'KD Mulok 2 Aspek Pengetahuan 3.8', 'MPL08', 'KLS01', 'SM02'),
('KTM0000000121', '9', '3.9', 'KD Mulok 2 Aspek Pengetahuan 3.9', 'MPL08', 'KLS01', 'SM02'),
('KTM0000000122', '10', '3.10', 'KD Mulok 2 Aspek Pengetahuan 3.10', 'MPL08', 'KLS01', 'SM02'),
('KTM0000000123', '1', '3.1', 'KD Mulok 3 Aspek Pengetahuan 3.1', 'MPL09', 'KLS01', 'SM02'),
('KTM0000000124', '2', '3.2', 'KD Mulok 3 Aspek Pengetahuan 3.2', 'MPL09', 'KLS01', 'SM02'),
('KTM0000000125', '3', '3.3', 'KD Mulok 3 Aspek Pengetahuan 3.3', 'MPL09', 'KLS01', 'SM02'),
('KTM0000000126', '4', '3.4', 'KD Mulok 3 Aspek Pengetahuan 3.4', 'MPL09', 'KLS01', 'SM02'),
('KTM0000000127', '5', '3.5', 'KD Mulok 3 Aspek Pengetahuan 3.5', 'MPL09', 'KLS01', 'SM02'),
('KTM0000000128', '6', '3.6', 'KD Mulok 3 Aspek Pengetahuan 3.6', 'MPL09', 'KLS01', 'SM02'),
('KTM0000000129', '7', '3.7', 'KD Mulok 3 Aspek Pengetahuan 3.7', 'MPL09', 'KLS01', 'SM02'),
('KTM0000000130', '8', '3.8', 'KD Mulok 3 Aspek Pengetahuan 3.8', 'MPL09', 'KLS01', 'SM02'),
('KTM0000000131', '9', '3.9', 'KD Mulok 3 Aspek Pengetahuan 3.9', 'MPL09', 'KLS01', 'SM02'),
('KTM0000000132', '10', '3.10', 'KD Mulok 3 Aspek Pengetahuan 3.10', 'MPL09', 'KLS01', 'SM02'),
('KTM0000000133', '1', '3.1', 'Mengidentifikasi hubungan antara simbol dan sila-sila Pancasila dalam lambang negara “Garuda Pancasila”', 'MPL02', 'KLS02', 'SM01'),
('KTM0000000134', '2', '3.2', 'Mengidentifikasi aturan dan tata tertib yang berlaku di sekolah', 'MPL02', 'KLS02', 'SM01'),
('KTM0000000135', '3', '3.3', 'Mengidentifikasi jenis-jenis keberagaman karakteristik individu di sekolah', 'MPL02', 'KLS02', 'SM01'),
('KTM0000000136', '4', '3.4', 'Memahami makna bersatu dalam keberagaman di sekolah', 'MPL02', 'KLS02', 'SM01'),
('KTM0000000137', '1', '3.1', 'Merinci ungkapan, ajakan, perintah, penolakan yang terdapat dalam teks cerita atau lagu yang menggambarkan sikap hidup rukun', 'MPL03', 'KLS02', 'SM01'),
('KTM0000000138', '2', '3.2', 'Menguraikan kosakata dan konsep tentang keragaman benda berdasarkan bentuk dan wujudnya dalam bahasa Indonesia atau bahasa daerah melalui teks tulis, lisan, visual, dan/atau eksplorasi lingkungan.', 'MPL03', 'KLS02', 'SM01'),
('KTM0000000139', '3', '3.3', 'Menentukan kosakata dan konsep tentang lingkungan geografis, kehidupan ekonomi, sosial dan budaya di lingkungan sekitar dalam bahasa Indonesia atau bahasa daerah melalui teks tulis, lisan, visual, dan/atau eksplorasi lingkung', 'MPL03', 'KLS02', 'SM01'),
('KTM0000000140', '4', '3.4', 'Menenetukan kosakata dan konsep tentang lingkungan sehat dan lingkungan tidak sehat di lingkungan sekitar serta cara menjaga kesehatan lingkungan dalam Bahasa Indonesia atau bahasa daerah melalui teks tulis, lisan, visual, da', 'MPL03', 'KLS02', 'SM01'),
('KTM0000000141', '5', '3.5', 'Mencermati puisi anak dalam bahasa Indonesia atau bahasa daerah melalui teks tulis dan lisan', 'MPL03', 'KLS02', 'SM01'),
('KTM0000000142', '6', '3.6', 'Mencermati ungkapan permintaan maaf dan tolong melalui teks tentang budaya santun sebagai gambaran sikap hidup rukun dalam kemajemukan masyarakat Indonesia', 'MPL03', 'KLS02', 'SM01'),
('KTM0000000143', '7', '3.7', 'Mencermati tulisan tegak bersambung dalam cerita dengan memperhatikan penggunaan huruf kapital (awal kalimat, nama bulan dan hari, nama orang) serta mengenal tanda titik pada kalimat berita dan tanda tanya pada kalimat tanya', 'MPL03', 'KLS02', 'SM01'),
('KTM0000000144', '8', '3.8', 'Menggali informasi dari dongeng binatang (fabel) tentang sikap hidup rukun dari teks lisan dan tulis dengan tujuan untuk kesenangan', 'MPL03', 'KLS02', 'SM01'),
('KTM0000000145', '9', '3.9', 'Menentukan kata sapaan dalam dongeng secara lisan dan tulis', 'MPL03', 'KLS02', 'SM01'),
('KTM0000000146', '10', '3.10', 'Mencermati penggunaan huruf kapital (nama Tuhan nama orang, nama agama) serta tanda titik dan tanda tanya dalam kalimat yang benar', 'MPL03', 'KLS02', 'SM01'),
('KTM0000000147', '1', '3.1', 'Menjelaskan makna bilangan cacah dan menentukan lambangnya berdasarkan nilai tempat dengan menggunakan model konkret serta cara membacanya', 'MPL04', 'KLS02', 'SM01'),
('KTM0000000148', '2', '3.2', 'Membandingkan dua bilangan cacah', 'MPL04', 'KLS02', 'SM01'),
('KTM0000000149', '3', '3.3', 'Menjelaskan dan melakukan penjumlahan dan pengurangan bilangan yang melibatkan bilangan cacah sampai dengan 999 dalam kehidupan sehari-hari serta mengaitkan penjumlahan dan pengurangan', 'MPL04', 'KLS02', 'SM01'),
('KTM0000000150', '4', '3.4', 'Menjelaskan perkalian dan pembagian yang melibatkan bilangan cacah dengan hasil kali sampai dengan 100 dalam kehidupan sehari-hari serta mengaitkan perkalian dan pembagian', 'MPL04', 'KLS02', 'SM01'),
('KTM0000000151', '5', '3.5', 'Menjelaskan nilai dan kesetaraan pecahan mata uang', 'MPL04', 'KLS02', 'SM01'),
('KTM0000000152', '6', '3.6', 'Menjelaskan dan menentukan panjang (termasuk jarak), berat, dan waktu dalam satuan baku, yang berkaitan dengan kehidupan sehari-hari', 'MPL04', 'KLS02', 'SM01'),
('KTM0000000153', '7', '3.7', 'Menjelaskan pecahan 1/2, 1/3 , dan 1/4 menggunakan benda-benda konkret dalam kehidupan sehari-hari', 'MPL04', 'KLS02', 'SM01'),
('KTM0000000154', '8', '3.8', 'Menjelaskan ruas garis dengan menggunakan model konkret bangun datar dan bangun ruang', 'MPL04', 'KLS02', 'SM01'),
('KTM0000000155', '9', '3.9', 'Menjelaskan bangun datar dan bangun ruang berdasarkan ciri-cirinya', 'MPL04', 'KLS02', 'SM01'),
('KTM0000000156', '10', '3.10', 'Menjelaskan pola barisan bangun datar dan bangun ruang menggunakan gambar atau benda konkret', 'MPL04', 'KLS02', 'SM01'),
('KTM0000000157', '1', '3.1', 'Mengenal karya imajinatif dua dan tiga dimensi', 'MPL05', 'KLS02', 'SM01'),
('KTM0000000158', '2', '3.2', 'Mengenal pola irama sederhana melalui lagu anak-anak', 'MPL05', 'KLS02', 'SM01'),
('KTM0000000159', '3', '3.3', 'Mengenal gerak keseharian dan alam dalam tari', 'MPL05', 'KLS02', 'SM01'),
('KTM0000000160', '4', '3.4', 'Mengenal pengolahan bahan alam dan buatan dalam berkarya', 'MPL05', 'KLS02', 'SM01'),
('KTM0000000161', '1', '3.1', 'Memahami variasi gerak dasar lokomotor sesuai dengan konsep tubuh, ruang, usaha, dan keterhubungan dalam berbagai bentuk permainan sederhana dan atau tradisional', 'MPL06', 'KLS02', 'SM01'),
('KTM0000000162', '2', '3.2', 'Memahami variasi gerak dasar non-lokomotor sesuai dengan konsep tubuh, ruang, usaha, dan keterhubungan dalam berbagai bentuk permainan sederhana dan atau tradisional', 'MPL06', 'KLS02', 'SM01'),
('KTM0000000163', '3', '3.3', 'Memahami variasi gerak dasar manipulatif sesuai dengan konsep tubuh, ruang, usaha, dan keterhubungan dalam berbagai bentuk permainan sederhana dan atau tradisional', 'MPL06', 'KLS02', 'SM01'),
('KTM0000000164', '4', '3.4', 'Memahami bergerak secara seimbang, lentur, dan kuat dalam rangka pengembangan kebugaran jasmani melalui permainan sederhana dan atau tradisional', 'MPL06', 'KLS02', 'SM01'),
('KTM0000000165', '5', '3.5', 'Memahami variasi berbagai pola gerak dominan (bertumpu, bergantung, keseimbangan, berpindah/lokomotor tolakan, putaran, ayunan, melayang, dan mendarat) dalam aktivitas senam lantai', 'MPL06', 'KLS02', 'SM01'),
('KTM0000000166', '6', '3.6', 'Memahami penggunaan variasi gerak dasar lokomotor dan non-lokomotor sesuai dengan irama (ketukan) tanpa/dengan musik dalam aktivitas gerak berirama', 'MPL06', 'KLS02', 'SM01'),
('KTM0000000167', '7', '3.7', 'Memahami prosedur penggunaan gerak dasar lokomotor, non-lokomotor,dan manipulatif dalam bentuk permainan, dan menjaga keselamatan diri/orang lain dalam aktivitas air ***', 'MPL06', 'KLS02', 'SM01'),
('KTM0000000168', '8', '3.8', 'Memahami manfaat pemanasan dan pendinginan, serta berbagai hal yang harus dilakukan dan dihindari sebelum, selama, dan setelah melakukan aktivitas fisik', 'MPL06', 'KLS02', 'SM01'),
('KTM0000000169', '9', '3.9', 'Memahami cara menjaga kebersihan lingkungan (tempat tidur, rumah, kelas, lingkungan sekolah, dan lain-lain)', 'MPL06', 'KLS02', 'SM01'),
('KTM0000000170', '1', '3.1', 'Mengidentifikasi hubungan antara simbol dan sila-sila Pancasila dalam lambang negara “Garuda Pancasila”', 'MPL02', 'KLS02', 'SM02'),
('KTM0000000171', '2', '3.2', 'Mengidentifikasi aturan dan tata tertib yang berlaku di sekolah', 'MPL02', 'KLS02', 'SM02'),
('KTM0000000172', '3', '3.3', 'Mengidentifikasi jenis-jenis keberagaman karakteristik individu di sekolah', 'MPL02', 'KLS02', 'SM02'),
('KTM0000000173', '4', '3.4', 'Memahami makna bersatu dalam keberagaman di sekolah', 'MPL02', 'KLS02', 'SM02'),
('KTM0000000174', '1', '3.1', 'Merinci ungkapan, ajakan, perintah, penolakan yang terdapat dalam teks cerita atau lagu yang menggambarkan sikap hidup rukun', 'MPL03', 'KLS02', 'SM02'),
('KTM0000000175', '2', '3.2', 'Menguraikan kosakata dan konsep tentang keragaman benda berdasarkan bentuk dan wujudnya dalam bahasa Indonesia atau bahasa daerah melalui teks tulis, lisan, visual, dan/atau eksplorasi lingkungan.', 'MPL03', 'KLS02', 'SM02'),
('KTM0000000176', '3', '3.3', 'Menentukan kosakata dan konsep tentang lingkungan geografis, kehidupan ekonomi, sosial dan budaya di lingkungan sekitar dalam bahasa Indonesia atau bahasa daerah melalui teks tulis, lisan, visual, dan/atau eksplorasi lingkung', 'MPL03', 'KLS02', 'SM02'),
('KTM0000000177', '4', '3.4', 'Menenetukan kosakata dan konsep tentang lingkungan sehat dan lingkungan tidak sehat di lingkungan sekitar serta cara menjaga kesehatan lingkungan dalam Bahasa Indonesia atau bahasa daerah melalui teks tulis, lisan, visual, da', 'MPL03', 'KLS02', 'SM02'),
('KTM0000000178', '5', '3.5', 'Mencermati puisi anak dalam bahasa Indonesia atau bahasa daerah melalui teks tulis dan lisan', 'MPL03', 'KLS02', 'SM02'),
('KTM0000000179', '6', '3.6', 'Mencermati ungkapan permintaan maaf dan tolong melalui teks tentang budaya santun sebagai gambaran sikap hidup rukun dalam kemajemukan masyarakat Indonesia', 'MPL03', 'KLS02', 'SM02'),
('KTM0000000180', '7', '3.7', 'Mencermati tulisan tegak bersambung dalam cerita dengan memperhatikan penggunaan huruf kapital (awal kalimat, nama bulan dan hari, nama orang) serta mengenal tanda titik pada kalimat berita dan tanda tanya pada kalimat tanya', 'MPL03', 'KLS02', 'SM02'),
('KTM0000000181', '8', '3.8', 'Menggali informasi dari dongeng binatang (fabel) tentang sikap hidup rukun dari teks lisan dan tulis dengan tujuan untuk kesenangan', 'MPL03', 'KLS02', 'SM02'),
('KTM0000000182', '9', '3.9', 'Menentukan kata sapaan dalam dongeng secara lisan dan tulis', 'MPL03', 'KLS02', 'SM01'),
('KTM0000000183', '10', '3.10', 'Mencermati penggunaan huruf kapital (nama Tuhan nama orang, nama agama) serta tanda titik dan tanda tanya dalam kalimat yang benar', 'MPL03', 'KLS02', 'SM02'),
('KTM0000000184', '1', '3.1', 'Menjelaskan makna bilangan cacah dan menentukan lambangnya berdasarkan nilai tempat dengan menggunakan model konkret serta cara membacanya', 'MPL04', 'KLS02', 'SM02'),
('KTM0000000185', '2', '3.2', 'Membandingkan dua bilangan cacah', 'MPL04', 'KLS02', 'SM02'),
('KTM0000000186', '3', '3.3', 'Menjelaskan dan melakukan penjumlahan dan pengurangan bilangan yang melibatkan bilangan cacah sampai dengan 999 dalam kehidupan sehari-hari serta mengaitkan penjumlahan dan pengurangan', 'MPL04', 'KLS02', 'SM02'),
('KTM0000000187', '4', '3.4', 'Menjelaskan perkalian dan pembagian yang melibatkan bilangan cacah dengan hasil kali sampai dengan 100 dalam kehidupan sehari-hari serta mengaitkan perkalian dan pembagian', 'MPL04', 'KLS02', 'SM02'),
('KTM0000000188', '5', '3.5', 'Menjelaskan nilai dan kesetaraan pecahan mata uang', 'MPL04', 'KLS02', 'SM02'),
('KTM0000000189', '6', '3.6', 'Menjelaskan dan menentukan panjang (termasuk jarak), berat, dan waktu dalam satuan baku, yang berkaitan dengan kehidupan sehari-hari', 'MPL04', 'KLS02', 'SM02'),
('KTM0000000190', '7', '3.7', 'Menjelaskan pecahan 1/2, 1/3 , dan 1/4 menggunakan benda-benda konkret dalam kehidupan sehari-hari', 'MPL04', 'KLS02', 'SM02'),
('KTM0000000191', '8', '3.8', 'Menjelaskan ruas garis dengan menggunakan model konkret bangun datar dan bangun ruang', 'MPL04', 'KLS02', 'SM02'),
('KTM0000000192', '9', '3.9', 'Menjelaskan bangun datar dan bangun ruang berdasarkan ciri-cirinya', 'MPL04', 'KLS02', 'SM02'),
('KTM0000000193', '10', '3.10', 'Menjelaskan pola barisan bangun datar dan bangun ruang menggunakan gambar atau benda konkret', 'MPL04', 'KLS02', 'SM02'),
('KTM0000000194', '1', '3.1', 'Mengenal karya imajinatif dua dan tiga dimensi', 'MPL05', 'KLS02', 'SM02'),
('KTM0000000195', '2', '3.2', 'Mengenal pola irama sederhana melalui lagu anak-anak', 'MPL05', 'KLS02', 'SM02'),
('KTM0000000196', '3', '3.3', 'Mengenal gerak keseharian dan alam dalam tari', 'MPL05', 'KLS02', 'SM02'),
('KTM0000000197', '4', '3.4', 'Mengenal pengolahan bahan alam dan buatan dalam berkarya', 'MPL05', 'KLS02', 'SM02'),
('KTM0000000198', '1', '3.1', 'Memahami variasi gerak dasar lokomotor sesuai dengan konsep tubuh, ruang, usaha, dan keterhubungan dalam berbagai bentuk permainan sederhana dan atau tradisional', 'MPL06', 'KLS02', 'SM02'),
('KTM0000000199', '2', '3.2', 'Memahami variasi gerak dasar non-lokomotor sesuai dengan konsep tubuh, ruang, usaha, dan keterhubungan dalam berbagai bentuk permainan sederhana dan atau tradisional', 'MPL06', 'KLS02', 'SM02'),
('KTM0000000200', '3', '3.3', 'Memahami variasi gerak dasar manipulatif sesuai dengan konsep tubuh, ruang, usaha, dan keterhubungan dalam berbagai bentuk permainan sederhana dan atau tradisional', 'MPL06', 'KLS02', 'SM02'),
('KTM0000000201', '4', '3.4', 'Memahami bergerak secara seimbang, lentur, dan kuat dalam rangka pengembangan kebugaran jasmani melalui permainan sederhana dan atau tradisional', 'MPL06', 'KLS02', 'SM02'),
('KTM0000000202', '5', '3.5', 'Memahami variasi berbagai pola gerak dominan (bertumpu, bergantung, keseimbangan, berpindah/lokomotor tolakan, putaran, ayunan, melayang, dan mendarat) dalam aktivitas senam lantai', 'MPL06', 'KLS02', 'SM02'),
('KTM0000000203', '6', '3.6', 'Memahami penggunaan variasi gerak dasar lokomotor dan non-lokomotor sesuai dengan irama (ketukan) tanpa/dengan musik dalam aktivitas gerak berirama', 'MPL06', 'KLS02', 'SM02'),
('KTM0000000204', '7', '3.7', 'Memahami prosedur penggunaan gerak dasar lokomotor, non-lokomotor,dan manipulatif dalam bentuk permainan, dan menjaga keselamatan diri/orang lain dalam aktivitas air ***', 'MPL06', 'KLS02', 'SM02'),
('KTM0000000205', '8', '3.8', 'Memahami manfaat pemanasan dan pendinginan, serta berbagai hal yang harus dilakukan dan dihindari sebelum, selama, dan setelah melakukan aktivitas fisik', 'MPL06', 'KLS02', 'SM02'),
('KTM0000000206', '9', '3.9', 'Memahami cara menjaga kebersihan lingkungan (tempat tidur, rumah, kelas, lingkungan sekolah, dan lain-lain)', 'MPL06', 'KLS02', 'SM02'),
('KTM0000000207', '1', '3.1', 'Memahami arti gambar pada lambang negara “Garuda Pancasila”', 'MPL02', 'KLS03', 'SM01'),
('KTM0000000208', '2', '3.2', 'Mengidentifikasi kewajiban dan hak sebagai anggota keluarga dan warga sekolah', 'MPL02', 'KLS03', 'SM01'),
('KTM0000000209', '3', '3.3', 'Menjelaskan makna keberagaman karakteristik individu di lingkungan sekitar', 'MPL02', 'KLS03', 'SM01'),
('KTM0000000210', '4', '3.4', 'Memahami makna bersatu dalam keberagaman di lingkungan sekitar', 'MPL02', 'KLS03', 'SM01'),
('KTM0000000211', '1', '3.1', 'Menggali informasi tentang konsep perubahan wujud benda dalam kehidupan sehari-hari yang disajikan dalam bentuk lisan, tulis, visual, dan/atau eksplorasi lingkungan', 'MPL03', 'KLS03', 'SM01'),
('KTM0000000212', '2', '3.2', 'Menggali informasi tentang sumber dan bentuk energi yang disajikan dalam bentuk lisan, tulis, visual, dan/atau eksplorasi lingkungan', 'MPL03', 'KLS03', 'SM01'),
('KTM0000000213', '3', '3.3', 'Menggali informasi tentang perubahan cuaca dan pengaruhnya terhadap kehidupan manusia yang disajikan dalam bentuk lisan, tulis, visual, dan/atau eksplorasi lingkungan', 'MPL03', 'KLS03', 'SM01'),
('KTM0000000214', '4', '3.4', 'Mencermati kosakata dalam teks tentang konsep ciri-ciri, kebutuhan (makanan dan tempat hidup), pertumbuhan, dan perkembangan makhluk hidup yang ada di lingkungan setempat yang disajikan dalam bentuk lisan, tulis, visual, dan/', 'MPL03', 'KLS03', 'SM01'),
('KTM0000000215', '5', '3.5', 'Menggali informasi tentang cara-cara perawatan tumbuhan dan hewan melalui wawancara dan/atau eksplorasi lingkungan', 'MPL03', 'KLS03', 'SM01'),
('KTM0000000216', '6', '3.6', 'Mencermati isi teks informasi tentang perkembangan teknologi produksi, komunikasi, dan transportasi di lingkungan setempat', 'MPL03', 'KLS03', 'SM01'),
('KTM0000000217', '7', '3.7', 'Mencermati informasi tentang konsep delapan arah mata angin dan pemanfaatannya dalam denah dalam teks lisan, tulis, visual, dan/atau eksplorasi lingkungan', 'MPL03', 'KLS03', 'SM01'),
('KTM0000000218', '8', '3.8', 'Menguraikan pesan dalam dongeng yang disajikan secara lisan, tulis, dan visual dengan tujuan untuk kesenangan', 'MPL03', 'KLS03', 'SM01'),
('KTM0000000219', '9', '3.9', 'Mengidentifi-kasi lambang/ simbol (rambu lalu lintas, pramuka, dan lambang negara) beserta artinya dalam teks lisan, tulis, visual, dan/atau eksplorasi lingkungan', 'MPL03', 'KLS03', 'SM01'),
('KTM0000000220', '10', '3.10', 'Mencermati ungkapan atau kalimat saran, masukan, dan penyelesaian masalah (sederhana) dalam teks tulis.', 'MPL03', 'KLS03', 'SM01'),
('KTM0000000221', '1', '3.1', 'Menjelaskan sifat-sifat operasi hitung pada bilangan cacah', 'MPL04', 'KLS03', 'SM01'),
('KTM0000000222', '2', '3.2', 'Menjelaskan bilangan cacah dan pecahan sederhana (seperti 1/2, 1/3 , dan 1/4) yang disajikan pada garis bilangan', 'MPL04', 'KLS03', 'SM01'),
('KTM0000000223', '3', '3.3', 'Menyatakan suatu bilangan sebagai jumlah, selisih, hasil kali, atau hasil bagi dua bilangan cacah', 'MPL04', 'KLS03', 'SM01'),
('KTM0000000224', '4', '3.4', 'Menggeneralisasi ide pecahan sebagai bagian dari keseluruhan menggunakan benda-benda konkret', 'MPL04', 'KLS03', 'SM01'),
('KTM0000000225', '5', '3.5', 'Menjelaskan dan melakukan penjumlahan dan pengurangan pecahan berpenyebut sama', 'MPL04', 'KLS03', 'SM01'),
('KTM0000000226', '6', '3.6', 'Menjelaskan dan menentukan lama waktu suatu kejadian berlangsung', 'MPL04', 'KLS03', 'SM01'),
('KTM0000000227', '7', '3.7', 'Mendeskripsikan dan menentukan hubungan antar satuan baku untuk panjang, berat, dan waktu yang umumnya digunakan dalam kehidupan sehari-hari', 'MPL04', 'KLS03', 'SM01'),
('KTM0000000228', '8', '3.8', 'Menjelaskan dan menentukan luas dan volume dalam satuan tidak baku dengan menggunakan benda konkret', 'MPL04', 'KLS03', 'SM01'),
('KTM0000000229', '9', '3.9', 'Menjelaskan simetri lipat dan simetri putar pada bangun datar menggunakan benda konkret', 'MPL04', 'KLS03', 'SM01'),
('KTM0000000230', '10', '3.10', 'Menjelaskan dan menentukan keliling bangun datar', 'MPL04', 'KLS03', 'SM01'),
('KTM0000000231', '11', '3.11', 'Menjelaskan sudut, jenis sudut (sudut siku-siku, sudut lancip, dan sudut tumpul), dan satuan pengukuran tidak baku', 'MPL04', 'KLS03', 'SM01'),
('KTM0000000232', '12', '3.12', 'Menganalisis berbagai bangun datar berdasarkan sifat-sifat yang dimiliki', 'MPL04', 'KLS03', 'SM01'),
('KTM0000000233', '13', '3.13', 'Menjelaskan data berkaitan dengan diri peserta didik yang disajikan dalam diagram gambar', 'MPL04', 'KLS03', 'SM01'),
('KTM0000000234', '1', '3.1', 'mengetahui unsur-unsur rupa dalam karya dekoratif', 'MPL05', 'KLS03', 'SM01'),
('KTM0000000235', '2', '3.2', 'mengetahui bentuk dan variasi pola irama dalam lagu', 'MPL05', 'KLS03', 'SM01'),
('KTM0000000236', '3', '3.3', 'mengetahui dinamika gerak tari', 'MPL05', 'KLS03', 'SM01'),
('KTM0000000237', '4', '3.4', 'mengetahui teknik potong, lipat, dan sambung', 'MPL05', 'KLS03', 'SM01'),
('KTM0000000238', '1', '3.1', 'Memahami kombinasi gerak dasar lokomotor sesuai dengan konsep tubuh, ruang, usaha, dan keterhubungan dalam berbagai bentuk permainan sederhana dan atau tradisional', 'MPL06', 'KLS03', 'SM01'),
('KTM0000000239', '2', '3.2', 'Memahami kombinasi gerak dasar non-lokomotor sesuai dengan konsep tubuh, ruang, usaha, dan keterhubungan dalam berbagai bentuk permainan sederhana dan atau tradisional', 'MPL06', 'KLS03', 'SM01'),
('KTM0000000240', '3', '3.3', 'Memahami kombinasi gerak dasar manipulatif sesuai dengan konsep tubuh, ruang, usaha, dan keterhubungan dalam berbagai bentuk permainan sederhana dan atau tradisional', 'MPL06', 'KLS03', 'SM01'),
('KTM0000000241', '4', '3.4', 'Memahami bergerak secara seimbang, lentur, lincah, dan berdaya tahan dalam rangka pengembangan kebugaran jasmani melalui permainan sederhana dan atau tradisional', 'MPL06', 'KLS03', 'SM01'),
('KTM0000000242', '5', '3.5', 'Memahami kombinasi berbagai pola gerak dominan (bertumpu, bergantung, keseimbangan, berpindah/lokomotor, tolakan, putaran, ayunan, melayang, dan, dan mendarat) dalam aktivitas senam lantai', 'MPL06', 'KLS03', 'SM01'),
('KTM0000000243', '6', '3.6', 'Memahami penggunaan kombinasi gerak dasar lokomotor, non-lokomotor dan manipulatif sesuai dengan irama (ketukan) tanpa/dengan musik dalam aktivitas gerak berirama', 'MPL06', 'KLS03', 'SM01'),
('KTM0000000244', '7', '3.7', 'Memahami prosedur gerak dasar mengambang (water trappen) dan meluncur di air serta menjaga keselamatan diri/orang lain dalam aktivitas air***', 'MPL06', 'KLS03', 'SM01'),
('KTM0000000245', '8', '3.8', 'Memahami bentuk dan manfaat istirahat dan pengisian waktu luang untuk menjaga kesehatan', 'MPL06', 'KLS03', 'SM01'),
('KTM0000000246', '9', '3.9', 'Memahami perlunya memilih makanan bergizi dan jajanan sehat untuk menjaga kesehatan tubuh', 'MPL06', 'KLS03', 'SM01'),
('KTM0000000247', '1', '3.1', 'Memahami arti gambar pada lambang negara “Garuda Pancasila”', 'MPL02', 'KLS03', 'SM02'),
('KTM0000000248', '2', '3.2', 'Mengidentifikasi kewajiban dan hak sebagai anggota keluarga dan warga sekolah', 'MPL02', 'KLS03', 'SM02'),
('KTM0000000249', '3', '3.3', 'Menjelaskan makna keberagaman karakteristik individu di lingkungan sekitar', 'MPL02', 'KLS03', 'SM02'),
('KTM0000000250', '4', '3.4', 'Memahami makna bersatu dalam keberagaman di lingkungan sekitar', 'MPL02', 'KLS03', 'SM02'),
('KTM0000000251', '1', '3.1', 'Menggali informasi tentang konsep perubahan wujud benda dalam kehidupan sehari-hari yang disajikan dalam bentuk lisan, tulis, visual, dan/atau eksplorasi lingkungan', 'MPL03', 'KLS03', 'SM02'),
('KTM0000000252', '2', '3.2', 'Menggali informasi tentang sumber dan bentuk energi yang disajikan dalam bentuk lisan, tulis, visual, dan/atau eksplorasi lingkungan', 'MPL03', 'KLS03', 'SM02'),
('KTM0000000253', '3', '3.3', 'Menggali informasi tentang perubahan cuaca dan pengaruhnya terhadap kehidupan manusia yang disajikan dalam bentuk lisan, tulis, visual, dan/atau eksplorasi lingkungan', 'MPL03', 'KLS03', 'SM02'),
('KTM0000000254', '4', '3.4', 'Mencermati kosakata dalam teks tentang konsep ciri-ciri, kebutuhan (makanan dan tempat hidup), pertumbuhan, dan perkembangan makhluk hidup yang ada di lingkungan setempat yang disajikan dalam bentuk lisan, tulis, visual, dan/', 'MPL03', 'KLS03', 'SM02'),
('KTM0000000255', '5', '3.5', 'Menggali informasi tentang cara-cara perawatan tumbuhan dan hewan melalui wawancara dan/atau eksplorasi lingkungan', 'MPL03', 'KLS03', 'SM02'),
('KTM0000000256', '6', '3.6', 'Mencermati isi teks informasi tentang perkembangan teknologi produksi, komunikasi, dan transportasi di lingkungan setempat', 'MPL03', 'KLS03', 'SM02'),
('KTM0000000257', '7', '3.7', 'Mencermati informasi tentang konsep delapan arah mata angin dan pemanfaatannya dalam denah dalam teks lisan, tulis, visual, dan/atau eksplorasi lingkungan', 'MPL03', 'KLS03', 'SM02'),
('KTM0000000258', '8', '3.8', 'Menguraikan pesan dalam dongeng yang disajikan secara lisan, tulis, dan visual dengan tujuan untuk kesenangan', 'MPL03', 'KLS03', 'SM02'),
('KTM0000000259', '9', '3.9', 'Mengidentifi-kasi lambang/ simbol (rambu lalu lintas, pramuka, dan lambang negara) beserta artinya dalam teks lisan, tulis, visual, dan/atau eksplorasi lingkungan', 'MPL03', 'KLS03', 'SM02'),
('KTM0000000260', '10', '3.10', 'Mencermati ungkapan atau kalimat saran, masukan, dan penyelesaian masalah (sederhana) dalam teks tulis.', 'MPL03', 'KLS03', 'SM02'),
('KTM0000000261', '1', '3.1', 'Menjelaskan sifat-sifat operasi hitung pada bilangan cacah', 'MPL04', 'KLS03', 'SM02'),
('KTM0000000262', '2', '3.2', 'Menjelaskan bilangan cacah dan pecahan sederhana (seperti 1/2, 1/3 , dan 1/4) yang disajikan pada garis bilangan', 'MPL04', 'KLS03', 'SM02'),
('KTM0000000263', '3', '3.3', 'Menyatakan suatu bilangan sebagai jumlah, selisih, hasil kali, atau hasil bagi dua bilangan cacah', 'MPL04', 'KLS03', 'SM02'),
('KTM0000000264', '4', '3.4', 'Menggeneralisasi ide pecahan sebagai bagian dari keseluruhan menggunakan benda-benda konkret', 'MPL04', 'KLS03', 'SM02'),
('KTM0000000265', '5', '3.5', 'Menjelaskan dan melakukan penjumlahan dan pengurangan pecahan berpenyebut sama', 'MPL04', 'KLS03', 'SM02'),
('KTM0000000266', '6', '3.6', 'Menjelaskan dan menentukan lama waktu suatu kejadian berlangsung', 'MPL04', 'KLS03', 'SM02'),
('KTM0000000267', '7', '3.7', 'Mendeskripsikan dan menentukan hubungan antar satuan baku untuk panjang, berat, dan waktu yang umumnya digunakan dalam kehidupan sehari-hari', 'MPL04', 'KLS03', 'SM02'),
('KTM0000000268', '8', '3.8', 'Menjelaskan dan menentukan luas dan volume dalam satuan tidak baku dengan menggunakan benda konkret', 'MPL04', 'KLS03', 'SM02'),
('KTM0000000269', '9', '3.9', 'Menjelaskan simetri lipat dan simetri putar pada bangun datar menggunakan benda konkret', 'MPL04', 'KLS03', 'SM02'),
('KTM0000000270', '10', '3.10', 'Menjelaskan dan menentukan keliling bangun datar', 'MPL04', 'KLS03', 'SM02'),
('KTM0000000271', '11', '3.11', 'Menjelaskan sudut, jenis sudut (sudut siku-siku, sudut lancip, dan sudut tumpul), dan satuan pengukuran tidak baku', 'MPL04', 'KLS03', 'SM02'),
('KTM0000000272', '12', '3.12', 'Menganalisis berbagai bangun datar berdasarkan sifat-sifat yang dimiliki', 'MPL04', 'KLS03', 'SM02'),
('KTM0000000273', '13', '3.13', 'Menjelaskan data berkaitan dengan diri peserta didik yang disajikan dalam diagram gambar', 'MPL04', 'KLS03', 'SM02'),
('KTM0000000274', '1', '3.1', 'mengetahui unsur-unsur rupa dalam karya dekoratif', 'MPL05', 'KLS03', 'SM02'),
('KTM0000000275', '2', '3.2', 'mengetahui bentuk dan variasi pola irama dalam lagu', 'MPL05', 'KLS03', 'SM02'),
('KTM0000000276', '3', '3.3', 'mengetahui dinamika gerak tari', 'MPL05', 'KLS03', 'SM02'),
('KTM0000000277', '4', '3.4', 'mengetahui teknik potong, lipat, dan sambung', 'MPL05', 'KLS03', 'SM02'),
('KTM0000000278', '1', '3.1', 'Memahami kombinasi gerak dasar lokomotor sesuai dengan konsep tubuh, ruang, usaha, dan keterhubungan dalam berbagai bentuk permainan sederhana dan atau tradisional', 'MPL06', 'KLS03', 'SM02'),
('KTM0000000279', '2', '3.2', 'Memahami kombinasi gerak dasar non-lokomotor sesuai dengan konsep tubuh, ruang, usaha, dan keterhubungan dalam berbagai bentuk permainan sederhana dan atau tradisional', 'MPL06', 'KLS03', 'SM02'),
('KTM0000000280', '3', '3.3', 'Memahami kombinasi gerak dasar manipulatif sesuai dengan konsep tubuh, ruang, usaha, dan keterhubungan dalam berbagai bentuk permainan sederhana dan atau tradisional', 'MPL06', 'KLS03', 'SM02'),
('KTM0000000281', '4', '3.4', 'Memahami bergerak secara seimbang, lentur, lincah, dan berdaya tahan dalam rangka pengembangan kebugaran jasmani melalui permainan sederhana dan atau tradisional', 'MPL06', 'KLS03', 'SM02'),
('KTM0000000282', '5', '3.5', 'Memahami kombinasi berbagai pola gerak dominan (bertumpu, bergantung, keseimbangan, berpindah/lokomotor, tolakan, putaran, ayunan, melayang, dan, dan mendarat) dalam aktivitas senam lantai', 'MPL06', 'KLS03', 'SM02'),
('KTM0000000283', '6', '3.6', 'Memahami penggunaan kombinasi gerak dasar lokomotor, non-lokomotor dan manipulatif sesuai dengan irama (ketukan) tanpa/dengan musik dalam aktivitas gerak berirama', 'MPL06', 'KLS03', 'SM02'),
('KTM0000000284', '7', '3.7', 'Memahami prosedur gerak dasar mengambang (water trappen) dan meluncur di air serta menjaga keselamatan diri/orang lain dalam aktivitas air***', 'MPL06', 'KLS03', 'SM02'),
('KTM0000000285', '8', '3.8', 'Memahami bentuk dan manfaat istirahat dan pengisian waktu luang untuk menjaga kesehatan', 'MPL06', 'KLS03', 'SM02'),
('KTM0000000286', '9', '3.9', 'Memahami perlunya memilih makanan bergizi dan jajanan sehat untuk menjaga kesehatan tubuh', 'MPL06', 'KLS03', 'SM02'),
('KTM0000000287', '1', '3.1', 'memahami makna hubungan simbol dengan sila-sila Pancasila', 'MPL02', 'KLS04', 'SM01'),
('KTM0000000288', '2', '3.2', 'mengidentifikasi pelaksanaan kewajiban dan hak sebagai warga masyarakat dalam kehidupan sehari-hari', 'MPL02', 'KLS04', 'SM01'),
('KTM0000000289', '3', '3.3', 'menjelaskan manfaat keberagaman karakteristik individu dalam kehidupan sehari-hari', 'MPL02', 'KLS04', 'SM01'),
('KTM0000000290', '4', '3.4', 'mengidentifikasi berbagai bentuk keberagaman suku bangsa, sosial, dan budaya di Indonesia yang terikat persatuan dan kesatua', 'MPL02', 'KLS04', 'SM01'),
('KTM0000000291', '1', '3.1', 'mencermati gagasan pokok dan gagasan pendukung yang diperoleh dari teks lisan, tulis, atau visual', 'MPL03', 'KLS04', 'SM01'),
('KTM0000000292', '2', '3.2', 'mencermati keterhubungan antargagasan yang didapat dari teks lisan, tulis, atau visual', 'MPL03', 'KLS04', 'SM01'),
('KTM0000000293', '3', '3.3', 'menggali informasi dari seorang tokoh melalui wawancara menggunakan daftar pertanyaan', 'MPL03', 'KLS04', 'SM01'),
('KTM0000000294', '4', '3.4', 'membandingkan teks petunjuk penggunaan dua alat yang sama dan berbeda', 'MPL03', 'KLS04', 'SM01'),
('KTM0000000295', '5', '3.5', 'menguraikan pendapat pribadi tentang isi buku sastra (cerita, dongeng, dan sebagainya)', 'MPL03', 'KLS04', 'SM01'),
('KTM0000000296', '6', '3.6', 'menggali isi dan amanat puisi yang disajikan secara lisan dan tulis dengan tujuan untuk kesenangan', 'MPL03', 'KLS04', 'SM01'),
('KTM0000000297', '7', '3.7', 'menggali pengetahuan baru yang terdapat pada teks nonfiksi', 'MPL03', 'KLS04', 'SM01'),
('KTM0000000298', '8', '3.8', 'membandingkan hal yang sudah diketahui dengan yang baru diketahui dari teks nonfiksi', 'MPL03', 'KLS04', 'SM01'),
('KTM0000000299', '9', '3.9', 'mencermati tokoh-tokoh yang terdapat pada teks fiksi', 'MPL03', 'KLS04', 'SM01'),
('KTM0000000300', '10', '3.10', 'membandingkan watak masing-masing tokoh pada teks fiksi', 'MPL03', 'KLS04', 'SM01'),
('KTM0000000301', '1', '3.1', 'Menjelaskan pecahan-pecahan senilai dengan gambar dan model konkret', 'MPL04', 'KLS04', 'SM01'),
('KTM0000000302', '2', '3.2', 'Menjelaskan berbagai bentuk pecahan (biasa, campuran, desimal, dan persen) dan hubungan di antaranya', 'MPL04', 'KLS04', 'SM01'),
('KTM0000000303', '3', '3.3', 'Menjelaskan dan melakukan penaksiran dari jumlah, selisih, hasil kali, dan hasil bagi dua bilangan cacah maupun pecahan dan desimal', 'MPL04', 'KLS04', 'SM01'),
('KTM0000000304', '4', '3.4', 'Menjelaskan faktor dan kelipatan suatu bilangan', 'MPL04', 'KLS04', 'SM01'),
('KTM0000000305', '5', '3.5', 'Menjelaskan bilangan prima', 'MPL04', 'KLS04', 'SM01'),
('KTM0000000306', '6', '3.6', 'Menjelaskan dan menentukan faktor persekutuan, faktor persekutuan terbesar (FPB), kelipatan persekutuan, dan kelipatan persekutuan terkecil (KPK) dari dua bilangan berkaitan dengan kehidupan sehari-hari', 'MPL04', 'KLS04', 'SM01'),
('KTM0000000307', '7', '3.7', 'Menjelaskan dan melakukan pembulatan hasil pengukuran panjang dan berat ke satuan terdekat', 'MPL04', 'KLS04', 'SM01'),
('KTM0000000308', '8', '3.8', 'Menganalisis sifat-sifat segibanyak beraturan dan segibanyak tidak beraturan', 'MPL04', 'KLS04', 'SM01'),
('KTM0000000309', '9', '3.9', 'Menjelaskan dan menentukan keliling dan luas persegi, persegipanjang, dan segitiga serta hubungan pangkat dua dengan akar pangkat dua', 'MPL04', 'KLS04', 'SM01'),
('KTM0000000310', '10', '3.10', 'Menjelaskan hubungan antar garis (sejajar, berpotongan, berhimpit) menggunakan model konkret', 'MPL04', 'KLS04', 'SM01'),
('KTM0000000311', '11', '3.11', 'Menjelaskan data diri peserta didik dan lingkungannya yang disajikan dalam bentuk diagram batang', 'MPL04', 'KLS04', 'SM01'),
('KTM0000000312', '12', '3.12', 'Menjelaskan dan menentukan ukuran sudut pada bangun datar dalam satuan baku dengan menggunakan busur derajat', 'MPL04', 'KLS04', 'SM01'),
('KTM0000000313', '1', '3.1', 'mengetahui gambar dan bentuk tiga dimensi', 'MPL05', 'KLS04', 'SM01'),
('KTM0000000314', '2', '3.2', 'mengetahui tanda tempo dan tinggi rendah nada', 'MPL05', 'KLS04', 'SM01'),
('KTM0000000315', '3', '3.3', 'mengetahui gerak tari kreasi daerah', 'MPL05', 'KLS04', 'SM01'),
('KTM0000000316', '4', '3.4', 'mengetahui karya seni rupa teknik tempel ', 'MPL05', 'KLS04', 'SM01'),
('KTM0000000317', '1', '3.1', 'memahami variasi gerak dasar lokomotor, non-lokomotor, dan manipulatif sesuai dengan konsep tubuh, ruang, usaha, dan keterhubungan dalam permainan bola kecil sederhana dan atau tradisional', 'MPL06', 'KLS04', 'SM01'),
('KTM0000000318', '2', '3.2', 'memahami variasi gerak dasar lokomotor, non-lokomotor, dan manipulatif sesuai dengan konsep tubuh, ruang, usaha, dan keterhubungan dalam permainan bola kecil sederhana dan atau tradisional', 'MPL06', 'KLS04', 'SM01'),
('KTM0000000319', '3', '3.3', 'memahami variasi gerak dasar jalan, lari, lompat, dan lempar melalui permainan/olahraga yang dimodifikasi dan atau olahraga tradisional', 'MPL06', 'KLS04', 'SM01'),
('KTM0000000320', '4', '3.4', 'menerapkan gerak dasar lokomotor dan non-lokomotor untuk membentuk gerak dasar seni beladiri', 'MPL06', 'KLS04', 'SM01'),
('KTM0000000321', '5', '3.5', 'memahami berbagai bentuk aktivitas kebugaran jasmani melalui berbagai latihan; daya tahan, kekuatan, kecepatan, dan kelincahan untuk mencapai berat badan ideal', 'MPL06', 'KLS04', 'SM01'),
('KTM0000000322', '6', '3.6', 'menerapkan variasi dan kombinasi berbagai pola gerak dominan (bertumpu, bergantung, keseimbangan, berpindah/lokomotor, tolakan, putaran, ayunan, melayang, dan mendarat) dalam aktivitas senam lantai', 'MPL06', 'KLS04', 'SM01'),
('KTM0000000323', '7', '3.7', 'menerapkan variasi gerak dasar langkah dan ayunan lengan mengikuti irama (ketukan) tanpa/dengan musik dalam aktivitas gerak berirama', 'MPL06', 'KLS04', 'SM01');
INSERT INTO `kd_pengetahuan` (`id_kd`, `nom`, `nomor_kd`, `deskripsi`, `id_mapel`, `id_kelas`, `id_semester`) VALUES
('KTM0000000324', '8', '3.8', 'memahami gerak dasar satu gaya renang', 'MPL06', 'KLS04', 'SM01'),
('KTM0000000325', '9', '3.9', 'memahami jenis cidera dan cara penanggulangannya secara sederhana saat melakukan aktivitas fisik dan dalam kehidupan sehari-hari', 'MPL06', 'KLS04', 'SM01'),
('KTM0000000326', '10', '3.10', 'menganalisis perilaku terpuji dalam pergaulan sehari-hari (antar teman sebaya, orang yang lebih tua, dan orang yang lebih muda)', 'MPL06', 'KLS04', 'SM01'),
('KTM0000000327', '1', '3.1', 'memahami makna hubungan simbol dengan sila-sila Pancasila', 'MPL02', 'KLS04', 'SM02'),
('KTM0000000328', '2', '3.2', 'mengidentifikasi pelaksanaan kewajiban dan hak sebagai warga masyarakat dalam kehidupan sehari-hari', 'MPL02', 'KLS04', 'SM02'),
('KTM0000000329', '3', '3.3', 'menjelaskan manfaat keberagaman karakteristik individu dalam kehidupan sehari-hari', 'MPL02', 'KLS04', 'SM02'),
('KTM0000000400', '4', '3.4', 'mengidentifikasi berbagai bentuk keberagaman suku bangsa, sosial, dan budaya di Indonesia yang terikat persatuan dan kesatua', 'MPL02', 'KLS04', 'SM02'),
('KTM0000000401', '1', '3.1', 'mencermati gagasan pokok dan gagasan pendukung yang diperoleh dari teks lisan, tulis, atau visual', 'MPL03', 'KLS04', 'SM02'),
('KTM0000000402', '2', '3.2', 'mencermati keterhubungan antargagasan yang didapat dari teks lisan, tulis, atau visual', 'MPL03', 'KLS04', 'SM02'),
('KTM0000000403', '3', '3.3', 'menggali informasi dari seorang tokoh melalui wawancara menggunakan daftar pertanyaan', 'MPL03', 'KLS04', 'SM02'),
('KTM0000000404', '4', '3.4', 'membandingkan teks petunjuk penggunaan dua alat yang sama dan berbeda', 'MPL03', 'KLS04', 'SM02'),
('KTM0000000405', '5', '3.5', 'menguraikan pendapat pribadi tentang isi buku sastra (cerita, dongeng, dan sebagainya)', 'MPL03', 'KLS04', 'SM02'),
('KTM0000000406', '6', '3.6', 'menggali isi dan amanat puisi yang disajikan secara lisan dan tulis dengan tujuan untuk kesenangan', 'MPL03', 'KLS04', 'SM02'),
('KTM0000000407', '7', '3.7', 'menggali pengetahuan baru yang terdapat pada teks nonfiksi', 'MPL03', 'KLS04', 'SM02'),
('KTM0000000408', '8', '3.8', 'membandingkan hal yang sudah diketahui dengan yang baru diketahui dari teks nonfiksi', 'MPL03', 'KLS04', 'SM02'),
('KTM0000000409', '9', '3.9', 'mencermati tokoh-tokoh yang terdapat pada teks fiksi', 'MPL03', 'KLS04', 'SM02'),
('KTM0000000410', '10', '3.10', 'membandingkan watak masing-masing tokoh pada teks fiksi', 'MPL03', 'KLS04', 'SM02'),
('KTM0000000411', '1', '3.1', 'Menjelaskan pecahan-pecahan senilai dengan gambar dan model konkret', 'MPL04', 'KLS04', 'SM02'),
('KTM0000000412', '2', '3.2', 'Menjelaskan berbagai bentuk pecahan (biasa, campuran, desimal, dan persen) dan hubungan di antaranya', 'MPL04', 'KLS04', 'SM02'),
('KTM0000000413', '3', '3.3', 'Menjelaskan dan melakukan penaksiran dari jumlah, selisih, hasil kali, dan hasil bagi dua bilangan cacah maupun pecahan dan desimal', 'MPL04', 'KLS04', 'SM02'),
('KTM0000000414', '4', '3.4', 'Menjelaskan faktor dan kelipatan suatu bilangan', 'MPL04', 'KLS04', 'SM02'),
('KTM0000000415', '5', '3.5', 'Menjelaskan bilangan prima', 'MPL04', 'KLS04', 'SM02'),
('KTM0000000416', '6', '3.6', 'Menjelaskan dan menentukan faktor persekutuan, faktor persekutuan terbesar (FPB), kelipatan persekutuan, dan kelipatan persekutuan terkecil (KPK) dari dua bilangan berkaitan dengan kehidupan sehari-hari', 'MPL04', 'KLS04', 'SM02'),
('KTM0000000417', '7', '3.7', 'Menjelaskan dan melakukan pembulatan hasil pengukuran panjang dan berat ke satuan terdekat', 'MPL04', 'KLS04', 'SM02'),
('KTM0000000418', '8', '3.8', 'Menganalisis sifat-sifat segibanyak beraturan dan segibanyak tidak beraturan', 'MPL04', 'KLS04', 'SM02'),
('KTM0000000419', '9', '3.9', 'Menjelaskan dan menentukan keliling dan luas persegi, persegipanjang, dan segitiga serta hubungan pangkat dua dengan akar pangkat dua', 'MPL04', 'KLS04', 'SM02'),
('KTM0000000420', '10', '3.10', 'Menjelaskan hubungan antar garis (sejajar, berpotongan, berhimpit) menggunakan model konkret', 'MPL04', 'KLS04', 'SM02'),
('KTM0000000421', '11', '3.11', 'Menjelaskan data diri peserta didik dan lingkungannya yang disajikan dalam bentuk diagram batang', 'MPL04', 'KLS04', 'SM02'),
('KTM0000000422', '12', '3.12', 'Menjelaskan dan menentukan ukuran sudut pada bangun datar dalam satuan baku dengan menggunakan busur derajat', 'MPL04', 'KLS04', 'SM02'),
('KTM0000000423', '1', '3.1', 'mengetahui gambar dan bentuk tiga dimensi', 'MPL05', 'KLS04', 'SM02'),
('KTM0000000424', '2', '3.2', 'mengetahui tanda tempo dan tinggi rendah nada', 'MPL05', 'KLS04', 'SM02'),
('KTM0000000425', '3', '3.3', 'mengetahui gerak tari kreasi daerah', 'MPL05', 'KLS04', 'SM02'),
('KTM0000000426', '4', '3.4', 'mengetahui karya seni rupa teknik tempel ', 'MPL05', 'KLS04', 'SM02'),
('KTM0000000427', '1', '3.1', 'memahami variasi gerak dasar lokomotor, non-lokomotor, dan manipulatif sesuai dengan konsep tubuh, ruang, usaha, dan keterhubungan dalam permainan bola kecil sederhana dan atau tradisional', 'MPL06', 'KLS04', 'SM02'),
('KTM0000000428', '2', '3.2', 'memahami variasi gerak dasar lokomotor, non-lokomotor, dan manipulatif sesuai dengan konsep tubuh, ruang, usaha, dan keterhubungan dalam permainan bola kecil sederhana dan atau tradisional', 'MPL06', 'KLS04', 'SM02'),
('KTM0000000429', '3', '3.3', 'memahami variasi gerak dasar jalan, lari, lompat, dan lempar melalui permainan/olahraga yang dimodifikasi dan atau olahraga tradisional', 'MPL06', 'KLS04', 'SM02'),
('KTM0000000430', '4', '3.4', 'menerapkan gerak dasar lokomotor dan non-lokomotor untuk membentuk gerak dasar seni beladiri', 'MPL06', 'KLS04', 'SM02'),
('KTM0000000431', '5', '3.5', 'memahami berbagai bentuk aktivitas kebugaran jasmani melalui berbagai latihan; daya tahan, kekuatan, kecepatan, dan kelincahan untuk mencapai berat badan ideal', 'MPL06', 'KLS04', 'SM02'),
('KTM0000000432', '6', '3.6', 'menerapkan variasi dan kombinasi berbagai pola gerak dominan (bertumpu, bergantung, keseimbangan, berpindah/lokomotor, tolakan, putaran, ayunan, melayang, dan mendarat) dalam aktivitas senam lantai', 'MPL06', 'KLS04', 'SM02'),
('KTM0000000433', '7', '3.7', 'menerapkan variasi gerak dasar langkah dan ayunan lengan mengikuti irama (ketukan) tanpa/dengan musik dalam aktivitas gerak berirama', 'MPL06', 'KLS04', 'SM02'),
('KTM0000000434', '8', '3.8', 'memahami gerak dasar satu gaya renang', 'MPL06', 'KLS04', 'SM02'),
('KTM0000000435', '9', '3.9', 'memahami jenis cidera dan cara penanggulangannya secara sederhana saat melakukan aktivitas fisik dan dalam kehidupan sehari-hari', 'MPL06', 'KLS04', 'SM02'),
('KTM0000000436', '10', '3.10', 'menganalisis perilaku terpuji dalam pergaulan sehari-hari (antar teman sebaya, orang yang lebih tua, dan orang yang lebih muda)', 'MPL06', 'KLS04', 'SM02'),
('KTM0000000437', '1', '3.1', 'Mengidentifikasi nilai-nilai Pancasila dalam kehidupan sehari-hari', 'MPL02', 'KLS05', 'SM01'),
('KTM0000000438', '2', '3.2', 'Memahami hak, kewajiban dan tanggung jawab sebagai warga dalam kehidupan sehari-hari', 'MPL02', 'KLS05', 'SM01'),
('KTM0000000439', '3', '3.3', 'Menelaah keberagaman sosial budaya masyarakat', 'MPL02', 'KLS05', 'SM01'),
('KTM0000000440', '4', '3.4', 'Menggali manfaat persatuan dan kesatuan untuk membangun kerukunan hidup', 'MPL02', 'KLS05', 'SM01'),
('KTM0000000441', '1', '3.1', 'Menentukan pokok pikiran dalam teks lisan dan tulis', 'MPL03', 'KLS05', 'SM01'),
('KTM0000000442', '2', '3.2', 'Mengklasifikasi informasi yang didapat dari buku ke dalam aspek: apa, di mana, kapan, siapa, mengapa, dan bagaimana', 'MPL03', 'KLS05', 'SM01'),
('KTM0000000443', '3', '3.3', 'Meringkas teks penjelasan (eksplanasi) dari media cetak atau elektronik', 'MPL03', 'KLS05', 'SM01'),
('KTM0000000444', '4', '3.4', 'Menganalisis informasi yang disampaikan paparan iklan dari media cetak atau elektronik', 'MPL03', 'KLS05', 'SM01'),
('KTM0000000445', '5', '3.5', 'Menggali informasi penting dari teks narasi sejarah yang disajikan secara lisan dan tulis menggunakan aspek: apa, di mana, kapan, siapa, mengapa, dan bagaimana', 'MPL03', 'KLS05', 'SM01'),
('KTM0000000446', '6', '3.6', 'Menggali isi dan amanat pantun yang disajikan secara lisan dan tulis dengan tujuan untuk kesenangan', 'MPL03', 'KLS05', 'SM01'),
('KTM0000000447', '7', '3.7', 'Menguraikan konsep-konsep yang saling berkaitan pada teks nonfiksi', 'MPL03', 'KLS05', 'SM01'),
('KTM0000000448', '8', '3.8', 'Menguraikan urutan peristiwa atau tindakan yang terdapat pada teks nonfiksi', 'MPL03', 'KLS05', 'SM01'),
('KTM0000000449', '9', '3.9', 'Mencermati penggunaan kalimat efektif dan ejaan dalam surat undangan (ulang tahun, kegiatan sekolah, kenaikan kelas, dll.)', 'MPL03', 'KLS05', 'SM01'),
('KTM0000000450', '1', '3.1', 'Menjelaskan dan melakukan penjumlahan dan pengurangan dua pecahan dengan penyebut berbeda', 'MPL04', 'KLS05', 'SM01'),
('KTM0000000451', '2', '3.2', 'Menjelaskan dan melakukan perkalian dan pembagian pecahan dan desimal', 'MPL04', 'KLS05', 'SM01'),
('KTM0000000452', '3', '3.3', 'Menjelaskan perbandingan dua besaran yang berbeda (kecepatan sebagai perbandingan jarak dengan waktu, debit sebagai perbandingan volume dan waktu)', 'MPL04', 'KLS05', 'SM01'),
('KTM0000000453', '4', '3.4', 'Menjelaskan skala melalui denah', 'MPL04', 'KLS05', 'SM01'),
('KTM0000000454', '5', '3.5', 'Menjelaskan, dan menentukan volume bangun ruang dengan menggunakan satuan volume (seperti kubus satuan) serta hubungan pangkat tiga dengan akar pangkat tiga', 'MPL04', 'KLS05', 'SM01'),
('KTM0000000455', '6', '3.6', 'Menjelaskan dan menemukan jaring-jaring bangun ruang sederhana (kubus dan balok)', 'MPL04', 'KLS05', 'SM01'),
('KTM0000000456', '7', '3.7', 'Menjelaskan data yang berkaitan dengan diri peserta didik atau lingkungan sekitar serta cara pengumpulannya', 'MPL04', 'KLS05', 'SM01'),
('KTM0000000457', '8', '3.8', 'Menjelaskan penyajian data yang berkaitan dengan diri peserta didik dan membandingkan dengan data dari lingkungan sekitar dalam bentuk daftar, tabel, diagram gambar (piktogram), diagram batang, atau diagram garis', 'MPL04', 'KLS05', 'SM01'),
('KTM0000000458', '1', '3.1', 'Memahami gambar cerita', 'MPL05', 'KLS05', 'SM01'),
('KTM0000000459', '2', '3.2', 'Memahami tangga nada', 'MPL05', 'KLS05', 'SM01'),
('KTM0000000460', '3', '3.3', 'Memahami pola lantai dalam tari kreasi daerah', 'MPL05', 'KLS05', 'SM01'),
('KTM0000000461', '4', '3.4', 'Memahami karya seni rupa daerah', 'MPL05', 'KLS05', 'SM01'),
('KTM0000000462', '1', '3.1', 'Memahami kombinasi gerak lokomotor, non-lokomotor, dan manipulatif sesuai dengan konsep tubuh, ruang, usaha, dan keterhubungan dalam berbagai permainan bola besar sederhana dan atau tradisional*', 'MPL06', 'KLS05', 'SM01'),
('KTM0000000463', '2', '3.2', 'Memahami kombinasi gerak dasar lokomotor, non-lokomotor, dan manipulatif sesuai dengan konsep tubuh, ruang, usaha, dan keterhubungan dalam berbagai permainan bola kecil sederhana dan atau tradisional*', 'MPL06', 'KLS05', 'SM01'),
('KTM0000000464', '3', '3.3', 'Memahami kombinasi gerak dasar jalan, lari, lompat, dan lempar melalui permainan/olahraga yang dimodifikasi dan atau olahraga tradisional', 'MPL06', 'KLS05', 'SM01'),
('KTM0000000465', '4', '3.4', 'Menerapkan variasi gerak dasar lokomotor dan non lokomotor untuk membentuk gerak dasar seni beladiri**', 'MPL06', 'KLS05', 'SM01'),
('KTM0000000466', '5', '3.5', 'Memahami aktivitas latihan daya tahan jantung (cardio respiratory) untuk pengembangan kebugaran jasmani', 'MPL06', 'KLS05', 'SM01'),
('KTM0000000467', '6', '3.6', 'Memahami kombinasi pola gerak dominan (bertumpu, bergantung, keseimbangan, berpindah/lokomotor, tolakan, putaran, ayunan, melayang, dan mendarat) untuk membentuk keterampilan dasar senam menggunakan alat', 'MPL06', 'KLS05', 'SM01'),
('KTM0000000468', '7', '3.7', 'Memahami penggunaan kombinasi gerak dasar langkah dan ayunan lengan mengikuti irama (ketukan) tanpa/dengan musik dalam aktivitas gerak berirama', 'MPL06', 'KLS05', 'SM01'),
('KTM0000000469', '8', '3.8', 'Memahami salah satu gaya renang dengan koordinasi yang baik pada jarak tertentu***', 'MPL06', 'KLS05', 'SM01'),
('KTM0000000470', '9', '3.9', 'Memahami konsep pemeliharaan diri dan orang lain dari penyakit menular dan tidak menular', 'MPL06', 'KLS05', 'SM01'),
('KTM0000000471', '10', '3.10', 'Memahami bahaya merokok, minuman keras, dan narkotika, zat-zat aditif (NAPZA) dan obat berbahaya lainnya terhadap kesehatan tubuh', 'MPL06', 'KLS05', 'SM01'),
('KTM0000000472', '1', '3.1', 'Mengidentifikasi nilai-nilai Pancasila dalam kehidupan sehari-hari', 'MPL02', 'KLS05', 'SM02'),
('KTM0000000473', '2', '3.2', 'Memahami hak, kewajiban dan tanggung jawab sebagai warga dalam kehidupan sehari-hari', 'MPL02', 'KLS05', 'SM02'),
('KTM0000000474', '3', '3.3', 'Menelaah keberagaman sosial budaya masyarakat', 'MPL02', 'KLS05', 'SM02'),
('KTM0000000475', '4', '3.4', 'Menggali manfaat persatuan dan kesatuan untuk membangun kerukunan hidup', 'MPL02', 'KLS05', 'SM02'),
('KTM0000000476', '1', '3.1', 'Menentukan pokok pikiran dalam teks lisan dan tulis', 'MPL03', 'KLS05', 'SM02'),
('KTM0000000477', '2', '3.2', 'Mengklasifikasi informasi yang didapat dari buku ke dalam aspek: apa, di mana, kapan, siapa, mengapa, dan bagaimana', 'MPL03', 'KLS05', 'SM02'),
('KTM0000000478', '3', '3.3', 'Meringkas teks penjelasan (eksplanasi) dari media cetak atau elektronik', 'MPL03', 'KLS05', 'SM02'),
('KTM0000000479', '4', '3.4', 'Menganalisis informasi yang disampaikan paparan iklan dari media cetak atau elektronik', 'MPL03', 'KLS05', 'SM02'),
('KTM0000000480', '5', '3.5', 'Menggali informasi penting dari teks narasi sejarah yang disajikan secara lisan dan tulis menggunakan aspek: apa, di mana, kapan, siapa, mengapa, dan bagaimana', 'MPL03', 'KLS05', 'SM02'),
('KTM0000000481', '6', '3.6', 'Menggali isi dan amanat pantun yang disajikan secara lisan dan tulis dengan tujuan untuk kesenangan', 'MPL03', 'KLS05', 'SM02'),
('KTM0000000482', '7', '3.7', 'Menguraikan konsep-konsep yang saling berkaitan pada teks nonfiksi', 'MPL03', 'KLS05', 'SM02'),
('KTM0000000483', '8', '3.8', 'Menguraikan urutan peristiwa atau tindakan yang terdapat pada teks nonfiksi', 'MPL03', 'KLS05', 'SM02'),
('KTM0000000484', '9', '3.9', 'Mencermati penggunaan kalimat efektif dan ejaan dalam surat undangan (ulang tahun, kegiatan sekolah, kenaikan kelas, dll.)', 'MPL03', 'KLS05', 'SM02'),
('KTM0000000485', '1', '3.1', 'Menjelaskan dan melakukan penjumlahan dan pengurangan dua pecahan dengan penyebut berbeda', 'MPL04', 'KLS05', 'SM02'),
('KTM0000000486', '2', '3.2', 'Menjelaskan dan melakukan perkalian dan pembagian pecahan dan desimal', 'MPL04', 'KLS05', 'SM02'),
('KTM0000000487', '3', '3.3', 'Menjelaskan perbandingan dua besaran yang berbeda (kecepatan sebagai perbandingan jarak dengan waktu, debit sebagai perbandingan volume dan waktu)', 'MPL04', 'KLS05', 'SM02'),
('KTM0000000488', '4', '3.4', 'Menjelaskan skala melalui denah', 'MPL04', 'KLS05', 'SM02'),
('KTM0000000489', '5', '3.5', 'Menjelaskan, dan menentukan volume bangun ruang dengan menggunakan satuan volume (seperti kubus satuan) serta hubungan pangkat tiga dengan akar pangkat tiga', 'MPL04', 'KLS05', 'SM02'),
('KTM0000000490', '6', '3.6', 'Menjelaskan dan menemukan jaring-jaring bangun ruang sederhana (kubus dan balok)', 'MPL04', 'KLS05', 'SM02'),
('KTM0000000491', '7', '3.7', 'Menjelaskan data yang berkaitan dengan diri peserta didik atau lingkungan sekitar serta cara pengumpulannya', 'MPL04', 'KLS05', 'SM02'),
('KTM0000000492', '8', '3.8', 'Menjelaskan penyajian data yang berkaitan dengan diri peserta didik dan membandingkan dengan data dari lingkungan sekitar dalam bentuk daftar, tabel, diagram gambar (piktogram), diagram batang, atau diagram garis', 'MPL04', 'KLS05', 'SM02'),
('KTM0000000493', '1', '3.1', 'Memahami gambar cerita', 'MPL05', 'KLS05', 'SM02'),
('KTM0000000494', '2', '3.2', 'Memahami tangga nada', 'MPL05', 'KLS05', 'SM02'),
('KTM0000000495', '3', '3.3', 'Memahami pola lantai dalam tari kreasi daerah', 'MPL05', 'KLS05', 'SM02'),
('KTM0000000496', '4', '3.4', 'Memahami karya seni rupa daerah', 'MPL05', 'KLS05', 'SM02'),
('KTM0000000497', '1', '3.1', 'Memahami kombinasi gerak lokomotor, non-lokomotor, dan manipulatif sesuai dengan konsep tubuh, ruang, usaha, dan keterhubungan dalam berbagai permainan bola besar sederhana dan atau tradisional*', 'MPL06', 'KLS05', 'SM02'),
('KTM0000000498', '2', '3.2', 'Memahami kombinasi gerak dasar lokomotor, non-lokomotor, dan manipulatif sesuai dengan konsep tubuh, ruang, usaha, dan keterhubungan dalam berbagai permainan bola kecil sederhana dan atau tradisional*', 'MPL06', 'KLS05', 'SM02'),
('KTM0000000499', '3', '3.3', 'Memahami kombinasi gerak dasar jalan, lari, lompat, dan lempar melalui permainan/olahraga yang dimodifikasi dan atau olahraga tradisional', 'MPL06', 'KLS05', 'SM02'),
('KTM0000000500', '4', '3.4', 'Menerapkan variasi gerak dasar lokomotor dan non lokomotor untuk membentuk gerak dasar seni beladiri**', 'MPL06', 'KLS05', 'SM02'),
('KTM0000000501', '5', '3.5', 'Memahami aktivitas latihan daya tahan jantung (cardio respiratory) untuk pengembangan kebugaran jasmani', 'MPL06', 'KLS05', 'SM02'),
('KTM0000000502', '6', '3.6', 'Memahami kombinasi pola gerak dominan (bertumpu, bergantung, keseimbangan, berpindah/lokomotor, tolakan, putaran, ayunan, melayang, dan mendarat) untuk membentuk keterampilan dasar senam menggunakan alat', 'MPL06', 'KLS05', 'SM02'),
('KTM0000000503', '7', '3.7', 'Memahami penggunaan kombinasi gerak dasar langkah dan ayunan lengan mengikuti irama (ketukan) tanpa/dengan musik dalam aktivitas gerak berirama', 'MPL06', 'KLS05', 'SM02'),
('KTM0000000504', '8', '3.8', 'Memahami salah satu gaya renang dengan koordinasi yang baik pada jarak tertentu***', 'MPL06', 'KLS05', 'SM02'),
('KTM0000000505', '9', '3.9', 'Memahami konsep pemeliharaan diri dan orang lain dari penyakit menular dan tidak menular', 'MPL06', 'KLS05', 'SM02'),
('KTM0000000506', '10', '3.10', 'Memahami bahaya merokok, minuman keras, dan narkotika, zat-zat aditif (NAPZA) dan obat berbahaya lainnya terhadap kesehatan tubuh', 'MPL06', 'KLS05', 'SM02'),
('KTM0000000507', '1', '3.1', 'Menganalisis penerapan nilai-nilai Pancasila dalam kehdupan sehari-hari', 'MPL02', 'KLS06', 'SM01'),
('KTM0000000508', '2', '3.2', 'Menganalisis pelaksanaan kewajiban, hak, dan tanggung jawab sebagai warga negara beserta dampaknya dalam kehidupan sehari-hari', 'MPL02', 'KLS06', 'SM01'),
('KTM0000000509', '3', '3.3', 'Menelaah keberagaman sosial, budaya, dan ekonomi masyarakat', 'MPL02', 'KLS06', 'SM01'),
('KTM0000000510', '4', '3.4', 'Menelaah persatuan dan kesatuan terhadap kehidupan berbangsa dan bernegara beserta dampaknya', 'MPL02', 'KLS06', 'SM01'),
('KTM0000000511', '1', '3.1', 'Menyimpulkan informasi berdasarkan teks laporan hasil pengamatan yang didengar dan dibaca', 'MPL03', 'KLS06', 'SM01'),
('KTM0000000512', '2', '3.2', 'Menggali isi teks penjelasan (eksplanasi) ilmiah yang didengar dan dibaca', 'MPL03', 'KLS06', 'SM01'),
('KTM0000000513', '3', '3.3', 'Menggali isi teks pidato yang didengar dan dibaca', 'MPL03', 'KLS06', 'SM01'),
('KTM0000000514', '4', '3.4', 'Menggali informasi penting dari buku sejarah menggunakan aspek: apa, di mana, kapan, siapa, mengapa, dan bagaimana', 'MPL03', 'KLS06', 'SM01'),
('KTM0000000515', '5', '3.5', 'Membandingkan karakteristik teks puisi dan teks prosa', 'MPL03', 'KLS06', 'SM01'),
('KTM0000000516', '6', '3.6', 'Mencermati petunjuk dan isi teks formulir (pendaftaran, kartu anggota, pengiriman uang melalui bank/kantor pos, daftar riwayat hidup, dsb.)', 'MPL03', 'KLS06', 'SM01'),
('KTM0000000517', '7', '3.7', 'Memperkirakan informasi yang dapat diperoleh dari teks nonfiksi sebelum membaca (hanya berdasarkan membaca judulnya saja)', 'MPL03', 'KLS06', 'SM01'),
('KTM0000000518', '8', '3.8', 'Menggali informasi yang terdapat pada teks nonfiksi', 'MPL03', 'KLS06', 'SM01'),
('KTM0000000519', '9', '3.9', 'Menelusuri tuturan dan tindakan tokoh serta penceritaan penulis dalam teks fiksi', 'MPL03', 'KLS06', 'SM01'),
('KTM0000000520', '10', '3.10', 'Mengaitkan peristiwa yang dialami tokoh dalam cerita fiksi dengan pengalaman pribadi', 'MPL03', 'KLS06', 'SM01'),
('KTM0000000521', '1', '3.1', 'Menjelaskan bilangan bulat negatif (termasuk menggunakan garis bilangan)', 'MPL04', 'KLS06', 'SM01'),
('KTM0000000522', '2', '3.2', 'Menjelaskan dan melakukan operasi penjumlahan, pengurangan, perkalian, dan pembagian yang melibatkan bilangan bulat negatif', 'MPL04', 'KLS06', 'SM01'),
('KTM0000000523', '3', '3.3', 'Menjelaskan dan melakukan operasi hitung campuran yang melibatkan bilangan cacah, pecahan dan/atau desimal dalam berbagai bentuk sesuai urutan operasi', 'MPL04', 'KLS06', 'SM01'),
('KTM0000000524', '4', '3.4', 'Menjelaskan titik pusat, jari-jari, diameter, busur, tali busur, tembereng, dan juring', 'MPL04', 'KLS06', 'SM01'),
('KTM0000000525', '5', '3.5', 'Menjelaskan taksiran keliling dan luas lingkaran', 'MPL04', 'KLS06', 'SM01'),
('KTM0000000526', '6', '3.6', 'Membandingkan prisma, tabung, limas, kerucut, dan bola.', 'MPL04', 'KLS06', 'SM01'),
('KTM0000000527', '7', '3.7', 'Menjelaskan bangun ruang yang merupakan gabungan dari beberapa bangun ruang, serta luas permukaan dan volumenya', 'MPL04', 'KLS06', 'SM01'),
('KTM0000000528', '8', '3.8', 'Menjelaskan dan membandingkan modus, median, dan mean dari data tunggal untuk menentukan nilai mana yang paling tepat mewakili data', 'MPL04', 'KLS06', 'SM01'),
('KTM0000000529', '1', '3.1', 'memahami reklame', 'MPL05', 'KLS06', 'SM01'),
('KTM0000000530', '2', '3.2', 'memahami interval nada melalui lagu dan alat musik', 'MPL05', 'KLS06', 'SM01'),
('KTM0000000531', '3', '3.3', 'memahami penampilan tari kreasi daerah', 'MPL05', 'KLS06', 'SM01'),
('KTM0000000532', '4', '3.4', 'memahami patung', 'MPL05', 'KLS06', 'SM01'),
('KTM0000000533', '1', '3.1', 'Memahami variasi dan kombinasi gerak dasar lokomotor, non-lokomotor, dan manipulatif dengan kontrol yang baik dalam permainan bola besar sederhana dan atau tradisional*', 'MPL06', 'KLS06', 'SM01'),
('KTM0000000534', '2', '3.2', 'Memahami variasi dan kombinasi gerak dasar lokomotor, non-lokomotor, dan manipulatif dengan kontrol yang baik dalam permainan bola kecil sederhana dan atau tradisional*', 'MPL06', 'KLS06', 'SM01'),
('KTM0000000535', '3', '3.3', 'Memahami variasi dan kombinasi gerak dasar jalan, lari, lompat, dan lempar dengan kontrol yang baik melalui permainan dan atau olahraga tradisional', 'MPL06', 'KLS06', 'SM01'),
('KTM0000000536', '4', '3.4', 'Memahami variasi dan kombinasi gerak dasar lokomotor, non lokomotor, dan manipulatif untuk membentuk gerak dasar seni beladiri**', 'MPL06', 'KLS06', 'SM01'),
('KTM0000000537', '5', '3.5', 'Memahami latihan kebugaran jasmani dan pengukuran tingkat kebugaran jasmani pribadi secara sederhana (contoh: menghitung denyut nadi, menghitung kemampuan melakukan push up, menghitung kelenturan tungkai)', 'MPL06', 'KLS06', 'SM01'),
('KTM0000000538', '6', '3.6', 'Memahami rangkaian tiga pola gerak dominan (bertumpu, bergantung, keseimbangan, berpindah/lokomotor, tolakan, putaran, ayunan, melayang, dan mendarat) dengan konsisten, tepat dan terkontrol dalam aktivitas senam', 'MPL06', 'KLS06', 'SM01'),
('KTM0000000539', '7', '3.7', 'Memahami penggunaan variasi dan kombinasi gerak dasar rangkaian langkah dan ayunan lengan mengikuti irama (ketukan) tanpa/dengan musik dalam aktivitas gerak berirama', 'MPL06', 'KLS06', 'SM01'),
('KTM0000000540', '8', '3.8', 'Memahami keterampilan salah satu gaya renang dan dasar-dasar penyelamatan diri***', 'MPL06', 'KLS06', 'SM01'),
('KTM0000000541', '9', '3.9', 'Memahami perlunya pemeliharaan kebersihan alat reproduksi', 'MPL06', 'KLS06', 'SM01'),
('KTM0000000542', '1', '3.1', 'Menganalisis penerapan nilai-nilai Pancasila dalam kehdupan sehari-hari', 'MPL02', 'KLS06', 'SM02'),
('KTM0000000543', '2', '3.2', 'Menganalisis pelaksanaan kewajiban, hak, dan tanggung jawab sebagai warga negara beserta dampaknya dalam kehidupan sehari-hari', 'MPL02', 'KLS06', 'SM02'),
('KTM0000000544', '3', '3.3', 'Menelaah keberagaman sosial, budaya, dan ekonomi masyarakat', 'MPL02', 'KLS06', 'SM02'),
('KTM0000000545', '4', '3.4', 'Menelaah persatuan dan kesatuan terhadap kehidupan berbangsa dan bernegara beserta dampaknya', 'MPL02', 'KLS06', 'SM02'),
('KTM0000000546', '1', '3.1', 'Menyimpulkan informasi berdasarkan teks laporan hasil pengamatan yang didengar dan dibaca', 'MPL03', 'KLS06', 'SM02'),
('KTM0000000547', '2', '3.2', 'Menggali isi teks penjelasan (eksplanasi) ilmiah yang didengar dan dibaca', 'MPL03', 'KLS06', 'SM02'),
('KTM0000000548', '3', '3.3', 'Menggali isi teks pidato yang didengar dan dibaca', 'MPL03', 'KLS06', 'SM02'),
('KTM0000000549', '4', '3.4', 'Menggali informasi penting dari buku sejarah menggunakan aspek: apa, di mana, kapan, siapa, mengapa, dan bagaimana', 'MPL03', 'KLS06', 'SM02'),
('KTM0000000550', '5', '3.5', 'Membandingkan karakteristik teks puisi dan teks prosa', 'MPL03', 'KLS06', 'SM02'),
('KTM0000000551', '6', '3.6', 'Mencermati petunjuk dan isi teks formulir (pendaftaran, kartu anggota, pengiriman uang melalui bank/kantor pos, daftar riwayat hidup, dsb.)', 'MPL03', 'KLS06', 'SM02'),
('KTM0000000552', '7', '3.7', 'Memperkirakan informasi yang dapat diperoleh dari teks nonfiksi sebelum membaca (hanya berdasarkan membaca judulnya saja)', 'MPL03', 'KLS06', 'SM02'),
('KTM0000000553', '8', '3.8', 'Menggali informasi yang terdapat pada teks nonfiksi', 'MPL03', 'KLS06', 'SM02'),
('KTM0000000554', '9', '3.9', 'Menelusuri tuturan dan tindakan tokoh serta penceritaan penulis dalam teks fiksi', 'MPL03', 'KLS06', 'SM02'),
('KTM0000000555', '10', '3.10', 'Mengaitkan peristiwa yang dialami tokoh dalam cerita fiksi dengan pengalaman pribadi', 'MPL03', 'KLS06', 'SM02'),
('KTM0000000556', '1', '3.1', 'Menjelaskan bilangan bulat negatif (termasuk menggunakan garis bilangan)', 'MPL04', 'KLS06', 'SM02'),
('KTM0000000557', '2', '3.2', 'Menjelaskan dan melakukan operasi penjumlahan, pengurangan, perkalian, dan pembagian yang melibatkan bilangan bulat negatif', 'MPL04', 'KLS06', 'SM02'),
('KTM0000000558', '3', '3.3', 'Menjelaskan dan melakukan operasi hitung campuran yang melibatkan bilangan cacah, pecahan dan/atau desimal dalam berbagai bentuk sesuai urutan operasi', 'MPL04', 'KLS06', 'SM02'),
('KTM0000000559', '4', '3.4', 'Menjelaskan titik pusat, jari-jari, diameter, busur, tali busur, tembereng, dan juring', 'MPL04', 'KLS06', 'SM02'),
('KTM0000000560', '5', '3.5', 'Menjelaskan taksiran keliling dan luas lingkaran', 'MPL04', 'KLS06', 'SM02'),
('KTM0000000561', '6', '3.6', 'Membandingkan prisma, tabung, limas, kerucut, dan bola.', 'MPL04', 'KLS06', 'SM02'),
('KTM0000000562', '7', '3.7', 'Menjelaskan bangun ruang yang merupakan gabungan dari beberapa bangun ruang, serta luas permukaan dan volumenya', 'MPL04', 'KLS06', 'SM02'),
('KTM0000000563', '8', '3.8', 'Menjelaskan dan membandingkan modus, median, dan mean dari data tunggal untuk menentukan nilai mana yang paling tepat mewakili data', 'MPL04', 'KLS06', 'SM02'),
('KTM0000000564', '1', '3.1', 'memahami reklame', 'MPL05', 'KLS06', 'SM02'),
('KTM0000000565', '2', '3.2', 'memahami interval nada melalui lagu dan alat musik', 'MPL05', 'KLS06', 'SM02'),
('KTM0000000566', '3', '3.3', 'memahami penampilan tari kreasi daerah', 'MPL05', 'KLS06', 'SM02'),
('KTM0000000567', '4', '3.4', 'memahami patung', 'MPL05', 'KLS06', 'SM02'),
('KTM0000000568', '1', '3.1', 'Memahami variasi dan kombinasi gerak dasar lokomotor, non-lokomotor, dan manipulatif dengan kontrol yang baik dalam permainan bola besar sederhana dan atau tradisional*', 'MPL06', 'KLS06', 'SM02'),
('KTM0000000569', '2', '3.2', 'Memahami variasi dan kombinasi gerak dasar lokomotor, non-lokomotor, dan manipulatif dengan kontrol yang baik dalam permainan bola kecil sederhana dan atau tradisional*', 'MPL06', 'KLS06', 'SM02'),
('KTM0000000570', '3', '3.3', 'Memahami variasi dan kombinasi gerak dasar jalan, lari, lompat, dan lempar dengan kontrol yang baik melalui permainan dan atau olahraga tradisional', 'MPL06', 'KLS06', 'SM02'),
('KTM0000000571', '4', '3.4', 'Memahami variasi dan kombinasi gerak dasar lokomotor, non lokomotor, dan manipulatif untuk membentuk gerak dasar seni beladiri**', 'MPL06', 'KLS06', 'SM02'),
('KTM0000000572', '5', '3.5', 'Memahami latihan kebugaran jasmani dan pengukuran tingkat kebugaran jasmani pribadi secara sederhana (contoh: menghitung denyut nadi, menghitung kemampuan melakukan push up, menghitung kelenturan tungkai)', 'MPL06', 'KLS06', 'SM02'),
('KTM0000000573', '6', '3.6', 'Memahami rangkaian tiga pola gerak dominan (bertumpu, bergantung, keseimbangan, berpindah/lokomotor, tolakan, putaran, ayunan, melayang, dan mendarat) dengan konsisten, tepat dan terkontrol dalam aktivitas senam', 'MPL06', 'KLS06', 'SM02'),
('KTM0000000574', '7', '3.7', 'Memahami penggunaan variasi dan kombinasi gerak dasar rangkaian langkah dan ayunan lengan mengikuti irama (ketukan) tanpa/dengan musik dalam aktivitas gerak berirama', 'MPL06', 'KLS06', 'SM02'),
('KTM0000000575', '8', '3.8', 'Memahami keterampilan salah satu gaya renang dan dasar-dasar penyelamatan diri***', 'MPL06', 'KLS06', 'SM02'),
('KTM0000000576', '9', '3.9', 'Memahami perlunya pemeliharaan kebersihan alat reproduksi', 'MPL06', 'KLS06', 'SM02'),
('KTM0000000577', '10', '3.10', 'KD Mulok 3 Aspek Pengetahuan 3.10', 'MPL09', 'KLS01', 'SM01');

--
-- Trigger `kd_pengetahuan`
--
DELIMITER $$
CREATE TRIGGER `kd_ki3_berubah` AFTER UPDATE ON `kd_pengetahuan` FOR EACH ROW BEGIN
	UPDATE nilai_raportkd_ki3 set nomor_kd = NEW.nomor_kd, deskripsi = NEW.deskripsi where id_kd = OLD.id_kd;
    END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `kelas`
--

CREATE TABLE `kelas` (
  `id_kelas` char(15) CHARACTER SET latin1 NOT NULL,
  `kelas` varchar(20) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `kelas`
--

INSERT INTO `kelas` (`id_kelas`, `kelas`) VALUES
('KLS01', 'Kelas I'),
('KLS02', 'Kelas II'),
('KLS03', 'Kelas III'),
('KLS04', 'Kelas IV'),
('KLS05', 'Kelas V'),
('KLS06', 'Kelas VI');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kelompok_mapel`
--

CREATE TABLE `kelompok_mapel` (
  `no` int(11) NOT NULL,
  `kelompok` char(5) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `kelompok_mapel`
--

INSERT INTO `kelompok_mapel` (`no`, `kelompok`) VALUES
(1, 'A'),
(2, 'B'),
(3, 'C');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kesehatan`
--

CREATE TABLE `kesehatan` (
  `id_kesehatan` char(15) CHARACTER SET latin1 NOT NULL,
  `no` varchar(6) CHARACTER SET latin1 NOT NULL,
  `aspek_fisik` varchar(35) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `kesehatan`
--

INSERT INTO `kesehatan` (`id_kesehatan`, `no`, `aspek_fisik`) VALUES
('KSH001', '1', 'Pendengaran telinga'),
('KSH002', '2', 'Penglihatan mata'),
('KSH003', '3', 'Kesehatan gigi'),
('KSH004', '4', 'Kesehatan lainnya');

-- --------------------------------------------------------

--
-- Struktur dari tabel `ketidakhadiran`
--

CREATE TABLE `ketidakhadiran` (
  `id_kehadiran` char(15) CHARACTER SET latin1 NOT NULL,
  `id_siswa` char(15) CHARACTER SET latin1 NOT NULL,
  `sakit` varchar(25) CHARACTER SET latin1 NOT NULL,
  `ijin` varchar(25) CHARACTER SET latin1 NOT NULL,
  `tanpa_keterangan` varchar(25) CHARACTER SET latin1 NOT NULL,
  `total_tidak_masuk` varchar(25) CHARACTER SET latin1 NOT NULL,
  `id_kelas` char(15) CHARACTER SET latin1 NOT NULL,
  `id_semester` char(15) CHARACTER SET latin1 NOT NULL,
  `tgl_raport` varchar(225) CHARACTER SET latin1 NOT NULL,
  `tahun_ajaran_awal` varchar(225) CHARACTER SET latin1 NOT NULL,
  `tahun_ajaran_akhir` varchar(225) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `ketidakhadiran`
--

INSERT INTO `ketidakhadiran` (`id_kehadiran`, `id_siswa`, `sakit`, `ijin`, `tanpa_keterangan`, `total_tidak_masuk`, `id_kelas`, `id_semester`, `tgl_raport`, `tahun_ajaran_awal`, `tahun_ajaran_akhir`) VALUES
('HDR0001', 'SIS0000001', '1', '2', '3', '6', 'KLS01', 'SM01', '2020-08-27 05:11:23', '2020', '2021'),
('HDR0002', 'SIS0000001', '1', '2', '3', '6', 'KLS01', 'SM02', '2020-08-28 12:09:23', '2020', '2021'),
('HDR0003', 'SIS0000008', '1', '2', '2', '5', 'KLS01', 'SM01', '2020-08-28 12:30:16', '2020', '2021'),
('HDR0004', 'SIS0000008', '1', '2', '1', '4', 'KLS01', 'SM02', '2020-08-28 12:33:40', '2020', '2021'),
('HDR0005', 'SIS0000007', '1', '2', '1', '4', 'KLS06', 'SM02', '2020-08-31 05:15:58', '2020', '2021'),
('HDR0006', 'SIS0000007', '1', '2', '2', '5', 'KLS06', 'SM01', '2020-08-31 05:30:50', '2020', '2021'),
('HDR0007', 'SIS0000003', '1', '2', '1', '4', 'KLS03', 'SM01', '2020-09-08 10:36:28', '2020', '2021');

-- --------------------------------------------------------

--
-- Struktur dari tabel `mapel`
--

CREATE TABLE `mapel` (
  `id_mapel` char(15) CHARACTER SET latin1 NOT NULL,
  `nama_mapel` varchar(225) CHARACTER SET latin1 NOT NULL,
  `kelompok` varchar(5) CHARACTER SET latin1 NOT NULL,
  `singkat_mapel` varchar(20) CHARACTER SET latin1 NOT NULL,
  `pengetahuan` int(10) NOT NULL,
  `keterampilan` int(10) NOT NULL,
  `tema` varchar(10) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `mapel`
--

INSERT INTO `mapel` (`id_mapel`, `nama_mapel`, `kelompok`, `singkat_mapel`, `pengetahuan`, `keterampilan`, `tema`) VALUES
('MPL01', 'Pendidikan agama & budi pekerti', 'A', 'Agama', 70, 75, ''),
('MPL02', 'Pendidikan pancasila dan kewarganegaraan', 'A', 'PPkn', 70, 75, ''),
('MPL03', 'Bahasa indonesia ku', 'A', 'B. Indo', 70, 70, ''),
('MPL04', 'Matematika', 'A', 'MTK', 70, 70, 'on'),
('MPL05', 'Seni budaya dan prakarya', 'A', 'SBdP', 75, 75, ''),
('MPL06', 'Pendidikan jasmani, olahraga, dan kesehatan', 'A', 'PJOK', 75, 75, ''),
('MPL07', '(Mulok 1) Bahasa inggris', 'B', 'B. Ing', 75, 75, ''),
('MPL08', '(Mulok 2) (Science)', 'B', '(Science)', 70, 70, ''),
('MPL09', '(Mulok 3) Baca Tulis Quran', 'A', 'BTQ', 70, 70, ''),
('MPL10', 'ILMU PENGETAHUAN SOSIAL', 'A', 'IPS', 70, 75, 'on');

-- --------------------------------------------------------

--
-- Struktur dari tabel `master_level`
--

CREATE TABLE `master_level` (
  `id_master` char(15) CHARACTER SET latin1 NOT NULL,
  `id_user` char(15) CHARACTER SET latin1 NOT NULL,
  `id_position` char(15) CHARACTER SET latin1 NOT NULL,
  `id_kelas` char(15) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `master_level`
--

INSERT INTO `master_level` (`id_master`, `id_user`, `id_position`, `id_kelas`) VALUES
('MST0000010', 'USR0002', 'PS03', 'KLS01'),
('MST0000009', 'USR0015', 'PS03', 'KLS01'),
('MST0000012', 'USR0016', 'PS03', 'KLS02'),
('MST0000011', 'USR0017', 'PS03', 'KLS01');

-- --------------------------------------------------------

--
-- Struktur dari tabel `message`
--

CREATE TABLE `message` (
  `id_message` char(15) CHARACTER SET latin1 NOT NULL,
  `date_message` varchar(225) CHARACTER SET latin1 NOT NULL,
  `message` varchar(225) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `nilai_agamakd_ki3`
--

CREATE TABLE `nilai_agamakd_ki3` (
  `id_raportkd` char(15) CHARACTER SET latin1 NOT NULL,
  `id_siswa` char(15) CHARACTER SET latin1 NOT NULL,
  `id_mapel` char(15) CHARACTER SET latin1 NOT NULL,
  `id_kelas` char(15) CHARACTER SET latin1 NOT NULL,
  `id_semester` char(15) CHARACTER SET latin1 NOT NULL,
  `nama_mapel` varchar(225) CHARACTER SET latin1 NOT NULL,
  `id_kd` char(15) CHARACTER SET latin1 NOT NULL,
  `nomor_kd` char(15) CHARACTER SET latin1 NOT NULL,
  `deskripsi` varchar(225) CHARACTER SET latin1 NOT NULL,
  `tugas1` int(15) NOT NULL,
  `tugas2` int(15) NOT NULL,
  `tugas3` int(15) NOT NULL,
  `tugas4` int(15) NOT NULL,
  `tugas5` int(15) NOT NULL,
  `ph1` int(15) NOT NULL,
  `ph2` int(15) NOT NULL,
  `ph3` int(15) NOT NULL,
  `ph4` int(15) NOT NULL,
  `pts` int(15) NOT NULL,
  `pas` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Trigger `nilai_agamakd_ki3`
--
DELIMITER $$
CREATE TRIGGER `nilai_agmki3_berubah` AFTER UPDATE ON `nilai_agamakd_ki3` FOR EACH ROW BEGIN
	DELETE FROM nilai_raport_ki3 WHERE id_mapel = OLD.id_mapel and id_siswa = OLD.id_siswa;
    END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `nilai_agamakd_ki4`
--

CREATE TABLE `nilai_agamakd_ki4` (
  `id_raportkd` char(15) CHARACTER SET latin1 NOT NULL,
  `id_siswa` char(15) CHARACTER SET latin1 NOT NULL,
  `id_mapel` char(15) CHARACTER SET latin1 NOT NULL,
  `id_kelas` char(15) CHARACTER SET latin1 NOT NULL,
  `id_semester` char(15) CHARACTER SET latin1 NOT NULL,
  `nama_mapel` varchar(225) CHARACTER SET latin1 NOT NULL,
  `id_kd` char(15) CHARACTER SET latin1 NOT NULL,
  `nomor_kd` char(15) CHARACTER SET latin1 NOT NULL,
  `deskripsi` varchar(225) CHARACTER SET latin1 NOT NULL,
  `tugas1` int(15) NOT NULL,
  `tugas2` int(15) NOT NULL,
  `tugas3` int(15) NOT NULL,
  `tugas4` int(15) NOT NULL,
  `tugas5` int(15) NOT NULL,
  `ph1` int(15) NOT NULL,
  `ph2` int(15) NOT NULL,
  `ph3` int(15) NOT NULL,
  `ph4` int(15) NOT NULL,
  `pts` int(15) NOT NULL,
  `pas` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Trigger `nilai_agamakd_ki4`
--
DELIMITER $$
CREATE TRIGGER `nilai_agmki4_berubah` AFTER UPDATE ON `nilai_agamakd_ki4` FOR EACH ROW BEGIN
	DELETE FROM nilai_raport_ki4 WHERE id_mapel = OLD.id_mapel and id_siswa = OLD.id_siswa;
    END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `nilai_akhir_agamakd_ki3`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `nilai_akhir_agamakd_ki3` (
`id_raportkd` char(15)
,`id_siswa` char(15)
,`id_mapel` char(15)
,`nama_mapel` varchar(225)
,`id_agama` char(15)
,`id_kd` char(15)
,`nomor_kd` varchar(20)
,`deskripsi` varchar(225)
,`tugas1` int(15)
,`tugas2` int(15)
,`tugas3` int(15)
,`tugas4` int(15)
,`tugas5` int(15)
,`ph1` int(15)
,`ph2` int(15)
,`ph3` int(15)
,`ph4` int(15)
,`pts` int(15)
,`pas` int(15)
);

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `nilai_akhir_agamakd_ki4`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `nilai_akhir_agamakd_ki4` (
`id_raportkd` char(15)
,`id_siswa` char(15)
,`id_mapel` char(15)
,`nama_mapel` varchar(225)
,`id_agama` char(15)
,`id_kd` char(15)
,`nomor_kd` varchar(25)
,`deskripsi` varchar(225)
,`tugas1` int(15)
,`tugas2` int(15)
,`tugas3` int(15)
,`tugas4` int(15)
,`tugas5` int(15)
,`ph1` int(15)
,`ph2` int(15)
,`ph3` int(15)
,`ph4` int(15)
,`pts` int(15)
,`pas` int(15)
);

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `nilai_akhir_raportkd_ki3`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `nilai_akhir_raportkd_ki3` (
`id_raportkd` char(15)
,`id_siswa` char(15)
,`id_mapel` char(15)
,`id_kelas` char(15)
,`id_semester` char(15)
,`nama_mapel` varchar(225)
,`id_kd` char(15)
,`nomor_kd` varchar(20)
,`deskripsi` varchar(225)
,`tugas1` int(15)
,`tugas2` int(15)
,`tugas3` int(15)
,`tugas4` int(15)
,`tugas5` int(15)
,`ph1` int(15)
,`ph2` int(15)
,`ph3` int(15)
,`ph4` int(15)
,`pts` int(15)
,`pas` int(15)
);

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `nilai_akhir_raportkd_ki4`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `nilai_akhir_raportkd_ki4` (
`id_raportkd` char(15)
,`id_siswa` char(15)
,`id_mapel` char(15)
,`id_kelas` char(15)
,`id_semester` char(15)
,`nama_mapel` varchar(225)
,`id_kd` char(15)
,`nomor_kd` varchar(20)
,`deskripsi` varchar(225)
,`tugas1` char(15)
,`tugas2` char(15)
,`tugas3` char(15)
,`tugas4` char(15)
,`tugas5` char(15)
,`ph1` char(15)
,`ph2` char(15)
,`ph3` char(15)
,`ph4` char(15)
,`pts` char(15)
,`pas` char(15)
);

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `nilai_akhir_raport_ki3`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `nilai_akhir_raport_ki3` (
`id_nilairaport` char(15)
,`id_siswa` char(15)
,`id_kelas` char(15)
,`id_semester` char(15)
,`id_mapel` char(15)
,`nama_mapel` varchar(225)
,`nilai` int(15)
,`predikat` char(15)
,`deskripsi` text
);

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `nilai_akhir_raport_ki4`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `nilai_akhir_raport_ki4` (
`id_nilairaport` char(15)
,`id_siswa` char(15)
,`id_mapel` char(15)
,`nama_mapel` varchar(225)
,`nilai` int(15)
,`predikat` char(15)
,`deskripsi` text
);

-- --------------------------------------------------------

--
-- Struktur dari tabel `nilai_ki3`
--

CREATE TABLE `nilai_ki3` (
  `id_nilai` char(15) CHARACTER SET latin1 NOT NULL,
  `id_siswa` char(15) CHARACTER SET latin1 NOT NULL,
  `id_kd` char(15) CHARACTER SET latin1 NOT NULL,
  `tema_1` varchar(225) CHARACTER SET latin1 DEFAULT NULL,
  `tema_2` varchar(225) CHARACTER SET latin1 DEFAULT NULL,
  `tema_3` varchar(225) CHARACTER SET latin1 DEFAULT NULL,
  `tema_4` varchar(225) CHARACTER SET latin1 DEFAULT NULL,
  `nph` char(15) CHARACTER SET latin1 NOT NULL,
  `npts` char(15) CHARACTER SET latin1 NOT NULL,
  `npas` char(15) CHARACTER SET latin1 NOT NULL,
  `nilai_akhir_kd` char(15) CHARACTER SET latin1 NOT NULL,
  `keterangan` char(15) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `nilai_ki4`
--

CREATE TABLE `nilai_ki4` (
  `id_nilai` char(15) CHARACTER SET latin1 NOT NULL,
  `id_siswa` char(15) CHARACTER SET latin1 NOT NULL,
  `id_kd` char(15) CHARACTER SET latin1 NOT NULL,
  `tema_1` varchar(225) CHARACTER SET latin1 NOT NULL,
  `tema_2` varchar(225) CHARACTER SET latin1 NOT NULL,
  `tema_3` varchar(225) CHARACTER SET latin1 NOT NULL,
  `tema_4` varchar(225) CHARACTER SET latin1 NOT NULL,
  `nph` char(15) CHARACTER SET latin1 NOT NULL,
  `npts` char(15) CHARACTER SET latin1 NOT NULL,
  `npas` char(15) CHARACTER SET latin1 NOT NULL,
  `nilai_akhir_kd` char(15) CHARACTER SET latin1 NOT NULL,
  `keterangan` char(15) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `nilai_pengetahuan`
--

CREATE TABLE `nilai_pengetahuan` (
  `id_nilai` char(15) CHARACTER SET latin1 NOT NULL,
  `nilai` char(25) CHARACTER SET latin1 NOT NULL,
  `id_tema` char(15) CHARACTER SET latin1 NOT NULL,
  `id_kd` char(15) CHARACTER SET latin1 NOT NULL,
  `id_siswa` char(15) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `nilai_raportkd_ki3`
--

CREATE TABLE `nilai_raportkd_ki3` (
  `id_raportkd` char(15) CHARACTER SET latin1 NOT NULL,
  `id_siswa` char(15) CHARACTER SET latin1 NOT NULL,
  `id_mapel` char(15) CHARACTER SET latin1 NOT NULL,
  `id_kelas` char(15) CHARACTER SET latin1 NOT NULL,
  `id_semester` char(15) CHARACTER SET latin1 NOT NULL,
  `nama_mapel` varchar(225) CHARACTER SET latin1 NOT NULL,
  `id_kd` char(15) CHARACTER SET latin1 NOT NULL,
  `nomor_kd` char(15) CHARACTER SET latin1 NOT NULL,
  `deskripsi` varchar(225) CHARACTER SET latin1 NOT NULL,
  `tugas1` int(15) NOT NULL,
  `tugas2` int(15) NOT NULL,
  `tugas3` int(15) NOT NULL,
  `tugas4` int(15) NOT NULL,
  `tugas5` int(15) NOT NULL,
  `ph1` int(15) NOT NULL,
  `ph2` int(15) NOT NULL,
  `ph3` int(15) NOT NULL,
  `ph4` int(15) NOT NULL,
  `pts` int(15) NOT NULL,
  `pas` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `nilai_raportkd_ki3`
--

INSERT INTO `nilai_raportkd_ki3` (`id_raportkd`, `id_siswa`, `id_mapel`, `id_kelas`, `id_semester`, `nama_mapel`, `id_kd`, `nomor_kd`, `deskripsi`, `tugas1`, `tugas2`, `tugas3`, `tugas4`, `tugas5`, `ph1`, `ph2`, `ph3`, `ph4`, `pts`, `pas`) VALUES
('KI30000001', 'SIS0000001', 'MPL02', 'KLS01', 'SM01', 'Pendidikan pancasila dan kewarganegaraan', 'KTM0000000001', '3.1', 'mengenal simbol sila-sila Pancasila dalam lambang negara “Garuda Pancasila”', 70, 0, 0, 0, 0, 80, 80, 80, 90, 80, 80),
('KI30000002', 'SIS0000001', 'MPL02', 'KLS01', 'SM01', 'Pendidikan pancasila dan kewarganegaraan', 'KTM0000000002', '3.2', 'mengidentifikasi aturan yang berlaku dalam kehidupan sehari-hari di rumah', 90, 90, 90, 90, 90, 90, 80, 90, 80, 80, 80);

--
-- Trigger `nilai_raportkd_ki3`
--
DELIMITER $$
CREATE TRIGGER `nilai_ki3_berubah` AFTER UPDATE ON `nilai_raportkd_ki3` FOR EACH ROW BEGIN
	delete from nilai_raport_ki3 where id_mapel = OLD.id_mapel and id_siswa = OLD.id_siswa;
    END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `nilai_raportkd_ki4`
--

CREATE TABLE `nilai_raportkd_ki4` (
  `id_raportkd` char(15) CHARACTER SET latin1 NOT NULL,
  `id_siswa` char(15) CHARACTER SET latin1 NOT NULL,
  `id_mapel` char(15) CHARACTER SET latin1 NOT NULL,
  `id_kelas` char(15) CHARACTER SET latin1 NOT NULL,
  `id_semester` char(15) CHARACTER SET latin1 NOT NULL,
  `nama_mapel` varchar(225) CHARACTER SET latin1 NOT NULL,
  `id_kd` char(15) CHARACTER SET latin1 NOT NULL,
  `nomor_kd` char(15) CHARACTER SET latin1 NOT NULL,
  `deskripsi` varchar(225) CHARACTER SET latin1 NOT NULL,
  `tugas1` char(15) CHARACTER SET latin1 NOT NULL,
  `tugas2` char(15) CHARACTER SET latin1 NOT NULL,
  `tugas3` char(15) CHARACTER SET latin1 NOT NULL,
  `tugas4` char(15) CHARACTER SET latin1 NOT NULL,
  `tugas5` char(15) CHARACTER SET latin1 NOT NULL,
  `ph1` char(15) CHARACTER SET latin1 NOT NULL,
  `ph2` char(15) CHARACTER SET latin1 NOT NULL,
  `ph3` char(15) CHARACTER SET latin1 NOT NULL,
  `ph4` char(15) CHARACTER SET latin1 NOT NULL,
  `pts` char(15) CHARACTER SET latin1 NOT NULL,
  `pas` char(15) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Trigger `nilai_raportkd_ki4`
--
DELIMITER $$
CREATE TRIGGER `nilai_ki4_berubah` AFTER UPDATE ON `nilai_raportkd_ki4` FOR EACH ROW BEGIN
	DELETE FROM nilai_raport_ki4 WHERE id_mapel = OLD.id_mapel and id_siswa = OLD.id_siswa;
    END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `nilai_raport_ki3`
--

CREATE TABLE `nilai_raport_ki3` (
  `id_nilairaport` char(15) CHARACTER SET latin1 NOT NULL,
  `id_siswa` char(15) CHARACTER SET latin1 NOT NULL,
  `id_mapel` char(15) CHARACTER SET latin1 NOT NULL,
  `id_kelas` char(15) CHARACTER SET latin1 NOT NULL,
  `id_semester` char(15) CHARACTER SET latin1 NOT NULL,
  `nama_mapel` varchar(225) CHARACTER SET latin1 NOT NULL,
  `nilai` int(15) DEFAULT NULL,
  `predikat` char(15) CHARACTER SET latin1 NOT NULL,
  `deskripsi` text CHARACTER SET latin1 NOT NULL,
  `tgl_raport` varchar(225) CHARACTER SET latin1 NOT NULL,
  `tahun_ajaran_awal` varchar(225) CHARACTER SET latin1 NOT NULL,
  `tahun_ajaran_akhir` varchar(225) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `nilai_raport_ki3`
--

INSERT INTO `nilai_raport_ki3` (`id_nilairaport`, `id_siswa`, `id_mapel`, `id_kelas`, `id_semester`, `nama_mapel`, `nilai`, `predikat`, `deskripsi`, `tgl_raport`, `tahun_ajaran_awal`, `tahun_ajaran_akhir`) VALUES
('KI-30000001', 'SIS0000001', 'MPL01', 'KLS01', 'SM01', 'Pendidikan agama & budi pekerti', 72, 'C', 'Ananda caroline benneta irawan  Cukup baik dalam mengenal sikap-sikap berdoa sebagai ungkapan syukur kepada Allah  dan Cukup baik dalam mengenal lingkungan sekolah sebagai tempat yang dianugerahkan Allah untuk bertumbuh dan berkembang .', '2020-08-27 05:50:34', '2020', '2021'),
('KI-30000002', 'SIS0000001', 'MPL02', 'KLS01', 'SM01', 'Pendidikan pancasila dan kewarganegaraan', 71, 'C', 'Ananda caroline benneta irawan  Cukup baik dalam mengidentifikasi bentuk kerjasama dalam keberagaman di rumah  dan Cukup baik dalam mengidentifikasi bentuk kerjasama dalam keberagaman di rumah .', '2020-08-27 05:56:41', '2020', '2021'),
('KI-30000003', 'SIS0000001', 'MPL03', 'KLS01', 'SM01', 'Bahasa indonesia ku', 74, 'C', 'Ananda caroline benneta irawan  Cukup baik dalam mencermati puisi anak/syair lagu  yang diperdengarkan dengan tujuan untuk kesenangan  dan Cukup baik dalam menguraikan lambang bunyi vokal dan konsonan dalam kata bahasa Indonesia atau bahasa daerahatau bahasa daerah .', '2020-08-28 12:00:15', '2020', '2021'),
('KI-30000004', 'SIS0000001', 'MPL04', 'KLS01', 'SM01', 'Matematika', 73, 'C', 'Ananda caroline benneta irawan  Cukup baik dalam membandingkan panjang, berat, lamanya waktu, dan suhu menggunakan benda/ situasi konkret  dan Baik dalam mengenal bangun ruang dan bangun datar dengan menggunakan berbagai benda konkret .', '2020-08-28 12:00:51', '2020', '2021'),
('KI-30000005', 'SIS0000001', 'MPL05', 'KLS01', 'SM01', 'Seni budaya dan prakarya', 74, 'D', 'Ananda caroline benneta irawan  Cukup baik dalam mengenal bahan alam dalam berkarya  dan Cukup baik dalam mengenal bahan alam dalam berkarya .', '2020-08-28 12:01:17', '2020', '2021'),
('KI-30000006', 'SIS0000001', 'MPL06', 'KLS01', 'SM01', 'Pendidikan jasmani, olahraga, dan kesehatan', 71, 'D', 'Ananda caroline benneta irawan  Perlu bimbingan dalam memahami bagian-bagian tubuh, bagian tubuh yang boleh dan tidak boleh disentuh orang lain, cara menjaga kebersihannya, dan kebersihan pakaian  dan Baik dalam memahami gerak dasar lokomotor dan non-lokomotor sesuai dengan irama (ketukan) tanpa/dengan musik dalam aktivitas gerak berirama .', '2020-08-28 12:01:36', '2020', '2021'),
('KI-30000007', 'SIS0000001', 'MPL07', 'KLS01', 'SM01', '(Mulok 1) Bahasa inggris', 79, 'C', 'Ananda caroline benneta irawan  Perlu bimbingan dalam KD Mulok 1 Aspek Pengetahuan 3.10  dan Cukup baik dalam KD Mulok 1 Aspek Pengetahuan 3.9 .', '2020-08-28 12:02:15', '2020', '2021'),
('KI-30000008', 'SIS0000001', 'MPL01', 'KLS01', 'SM02', 'Pendidikan agama & budi pekerti', 73, 'C', 'Ananda caroline benneta irawan  Cukup baik dalam mengenal kisah kelahiran Yesus sebagai wujud kasih Allah yang Mahabaik  dan Baik dalam mengenal sikap-sikap berdoa sebagai ungkapan syukur kepada Allah .', '2020-08-28 12:10:22', '2020', '2021'),
('KI-30000009', 'SIS0000001', 'MPL02', 'KLS01', 'SM02', 'Pendidikan pancasila dan kewarganegaraan', 83, 'B', 'Ananda caroline benneta irawan  Cukup baik dalam mengidentifikasi bentuk kerjasama dalam keberagaman di rumah  dan Cukup baik dalam mengidentifikasi bentuk kerjasama dalam keberagaman di rumah .', '2020-08-28 12:11:40', '2020', '2021'),
('KI-30000010', 'SIS0000001', 'MPL03', 'KLS01', 'SM02', 'Bahasa indonesia ku', 81, 'B', 'Ananda caroline benneta irawan  Cukup baik dalam menguraikan kosakata tentang berbagai jenis benda di lingkungan sekitar melalui teks pendek dan/atau eksplorasi lingkungan  dan Baik dalam merinci ungkapan penyampaian terima kasih, permintaan maaf, tolong, dan pemberian pujian, ajakan, pemberitahuan, perintah, dan petunjuk kepada orang lain dengan menggunakan bahasa yang santun secara lisan dan tulisan yang dap .', '2020-08-28 12:11:57', '2020', '2021'),
('KI-30000011', 'SIS0000001', 'MPL04', 'KLS01', 'SM02', 'Matematika', 83, 'B', 'Ananda caroline benneta irawan  Cukup baik dalam mengenal dan menentukan panjang dan berat dengan satuan tidak baku menggunakan benda/situasi konkret  dan Baik dalam membandingkan panjang, berat, lamanya waktu, dan suhu menggunakan benda/ situasi konkret .', '2020-08-28 12:12:24', '2020', '2021'),
('KI-30000012', 'SIS0000001', 'MPL05', 'KLS01', 'SM02', 'Seni budaya dan prakarya', 83, 'C', 'Ananda caroline benneta irawan  Cukup baik dalam mengenal bahan alam dalam berkarya  dan Cukup baik dalam mengenal bahan alam dalam berkarya .', '2020-08-28 12:12:47', '2020', '2021'),
('KI-30000013', 'SIS0000001', 'MPL06', 'KLS01', 'SM02', 'Pendidikan jasmani, olahraga, dan kesehatan', 80, 'C', 'Ananda caroline benneta irawan  Cukup baik dalam memahami bagian-bagian tubuh, bagian tubuh yang boleh dan tidak boleh disentuh orang lain, cara menjaga kebersihannya, dan kebersihan pakaian  dan Cukup baik dalam memahami bagian-bagian tubuh, bagian tubuh yang boleh dan tidak boleh disentuh orang lain, cara menjaga kebersihannya, dan kebersihan pakaian .', '2020-08-28 12:13:03', '2020', '2021'),
('KI-30000014', 'SIS0000001', 'MPL07', 'KLS01', 'SM02', '(Mulok 1) Bahasa inggris', 74, 'D', 'Ananda caroline benneta irawan  Cukup baik dalam KD Mulok 1 Aspek Pengetahuan 3.10  dan Baik dalam KD Mulok 1 Aspek Pengetahuan 3.7 .', '2020-08-28 12:13:46', '2020', '2021'),
('KI-30000015', 'SIS0000008', 'MPL01', 'KLS01', 'SM01', 'Pendidikan agama & budi pekerti', 80, 'C', 'Ananda Debora Naria Simamora  Cukup baik dalam memahami contoh sikap bersyukur dan bertanggung jawab dalam memelihara alam ciptaan Allah  dan Cukup baik dalam memahami contoh sikap bersyukur dan bertanggung jawab dalam memelihara alam ciptaan Allah .', '2020-08-28 12:22:42', '2020', '2021'),
('KI-30000016', 'SIS0000008', 'MPL02', 'KLS01', 'SM01', 'Pendidikan pancasila dan kewarganegaraan', 80, 'C', 'Ananda Debora Naria Simamora  Cukup baik dalam mengidentifikasi bentuk kerjasama dalam keberagaman di rumah  dan Cukup baik dalam mengidentifikasi bentuk kerjasama dalam keberagaman di rumah .', '2020-08-28 12:24:16', '2020', '2021'),
('KI-30000017', 'SIS0000008', 'MPL03', 'KLS01', 'SM01', 'Bahasa indonesia ku', 80, 'B', 'Ananda Debora Naria Simamora  Cukup baik dalam mencermati puisi anak/syair lagu  yang diperdengarkan dengan tujuan untuk kesenangan  dan Baik dalam menentukan kosakata yang berkaitan dengan peristiwa siang dan malam melalui teks pendek dan/atau eksplorasi lingkungan .', '2020-08-28 12:24:43', '2020', '2021'),
('KI-30000018', 'SIS0000008', 'MPL04', 'KLS01', 'SM01', 'Matematika', 86, 'B', 'Ananda Debora Naria Simamora  Cukup baik dalam membandingkan panjang, berat, lamanya waktu, dan suhu menggunakan benda/ situasi konkret  dan Cukup baik dalam membandingkan panjang, berat, lamanya waktu, dan suhu menggunakan benda/ situasi konkret .', '2020-08-28 12:25:09', '2020', '2021'),
('KI-30000019', 'SIS0000008', 'MPL05', 'KLS01', 'SM01', 'Seni budaya dan prakarya', 80, 'C', 'Ananda Debora Naria Simamora  Cukup baik dalam mengenal bahan alam dalam berkarya  dan Cukup baik dalam mengenal bahan alam dalam berkarya .', '2020-08-28 12:25:31', '2020', '2021'),
('KI-30000020', 'SIS0000008', 'MPL06', 'KLS01', 'SM01', 'Pendidikan jasmani, olahraga, dan kesehatan', 87, 'B', 'Ananda Debora Naria Simamora  Cukup baik dalam memahami gerak dasar lokomotor dan non-lokomotor sesuai dengan irama (ketukan) tanpa/dengan musik dalam aktivitas gerak berirama  dan Baik dalam memahami bagian-bagian tubuh, bagian tubuh yang boleh dan tidak boleh disentuh orang lain, cara menjaga kebersihannya, dan kebersihan pakaian .', '2020-08-28 12:25:45', '2020', '2021'),
('KI-30000021', 'SIS0000008', 'MPL07', 'KLS01', 'SM01', '(Mulok 1) Bahasa inggris', 81, 'C', 'Ananda Debora Naria Simamora  Cukup baik dalam KD Mulok 1 Aspek Pengetahuan 3.9  dan Sangat baik dalam KD Mulok 1 Aspek Pengetahuan 3.10 .', '2020-08-28 12:26:07', '2020', '2021'),
('KI-30000022', 'SIS0000008', 'MPL01', 'KLS01', 'SM02', 'Pendidikan agama & budi pekerti', 82, 'B', 'Ananda Debora Naria Simamora  Cukup baik dalam mengenal cara mengasihi keluarga dan teman  dan Cukup baik dalam memahami contoh sikap bersyukur dan bertanggung jawab dalam memelihara alam ciptaan Allah .', '2020-08-28 12:36:11', '2020', '2021'),
('KI-30000023', 'SIS0000007', 'MPL01', 'KLS06', 'SM02', 'Pendidikan agama & budi pekerti', 81, 'B', 'Ananda Arip hidayat Cukup baik dalam memahami seluruh hidupnya sebagai ibadah sejati kepada Allah  dan Baik dalam menganalisis makna melayani sesama sebagai ibadah yang berkenan kepada Allah .', '2020-08-31 04:56:30', '2020', '2021'),
('KI-30000024', 'SIS0000007', 'MPL02', 'KLS06', 'SM02', 'Pendidikan pancasila dan kewarganegaraan', 80, 'C', 'Ananda Arip hidayat Cukup baik dalam Menelaah persatuan dan kesatuan terhadap kehidupan berbangsa dan bernegara beserta dampaknya  dan Cukup baik dalam Menelaah persatuan dan kesatuan terhadap kehidupan berbangsa dan bernegara beserta dampaknya .', '2020-08-31 04:56:44', '2020', '2021'),
('KI-30000025', 'SIS0000007', 'MPL03', 'KLS06', 'SM02', 'Bahasa indonesia ku', 80, 'B', 'Ananda Arip hidayat Cukup baik dalam Memperkirakan informasi yang dapat diperoleh dari teks nonfiksi sebelum membaca (hanya berdasarkan membaca judulnya saja)  dan Baik dalam Menggali informasi penting dari buku sejarah menggunakan aspek: apa, di mana, kapan, siapa, mengapa, dan bagaimana .', '2020-08-31 04:57:04', '2020', '2021'),
('KI-30000026', 'SIS0000007', 'MPL04', 'KLS06', 'SM02', 'Matematika', 82, 'B', 'Ananda Arip hidayat Cukup baik dalam Menjelaskan dan membandingkan modus, median, dan mean dari data tunggal untuk menentukan nilai mana yang paling tepat mewakili data  dan Baik dalam Menjelaskan bangun ruang yang merupakan gabungan dari beberapa bangun ruang, serta luas permukaan dan volumenya .', '2020-08-31 04:57:34', '2020', '2021'),
('KI-30000027', 'SIS0000007', 'MPL05', 'KLS06', 'SM02', 'Seni budaya dan prakarya', 81, 'C', 'Ananda Arip hidayat Cukup baik dalam memahami patung  dan Baik dalam memahami penampilan tari kreasi daerah .', '2020-08-31 04:57:54', '2020', '2021'),
('KI-30000028', 'SIS0000007', 'MPL06', 'KLS06', 'SM02', 'Pendidikan jasmani, olahraga, dan kesehatan', 83, 'B', 'Ananda Arip hidayat Cukup baik dalam Memahami perlunya pemeliharaan kebersihan alat reproduksi  dan Baik dalam Memahami keterampilan salah satu gaya renang dan dasar-dasar penyelamatan diri*** .', '2020-08-31 04:58:12', '2020', '2021'),
('KI-30000029', 'SIS0000007', 'MPL01', 'KLS06', 'SM01', 'Pendidikan agama & budi pekerti', 81, 'B', 'Ananda Arip hidayat Cukup baik dalam memahami seluruh hidupnya sebagai ibadah sejati kepada Allah  dan Baik dalam menganalisis makna melayani sesama sebagai ibadah yang berkenan kepada Allah .', '2020-08-31 05:24:43', '2020', '2021'),
('KI-30000030', 'SIS0000007', 'MPL02', 'KLS06', 'SM01', 'Pendidikan pancasila dan kewarganegaraan', 84, 'B', 'Ananda Arip hidayat Cukup baik dalam Menelaah persatuan dan kesatuan terhadap kehidupan berbangsa dan bernegara beserta dampaknya  dan Baik dalam Menganalisis pelaksanaan kewajiban, hak, dan tanggung jawab sebagai warga negara beserta dampaknya dalam kehidupan sehari-hari .', '2020-08-31 05:24:57', '2020', '2021'),
('KI-30000031', 'SIS0000007', 'MPL03', 'KLS06', 'SM01', 'Bahasa indonesia ku', 93, 'A', 'Ananda Arip hidayat Cukup baik dalam Menggali informasi yang terdapat pada teks nonfiksi  dan Baik dalam Mengaitkan peristiwa yang dialami tokoh dalam cerita fiksi dengan pengalaman pribadi .', '2020-08-31 05:25:11', '2020', '2021'),
('KI-30000032', 'SIS0000007', 'MPL04', 'KLS06', 'SM01', 'Matematika', 81, 'B', 'Ananda Arip hidayat Cukup baik dalam Menjelaskan bangun ruang yang merupakan gabungan dari beberapa bangun ruang, serta luas permukaan dan volumenya  dan Baik dalam Membandingkan prisma, tabung, limas, kerucut, dan bola. .', '2020-08-31 05:25:39', '2020', '2021'),
('KI-30000033', 'SIS0000007', 'MPL05', 'KLS06', 'SM01', 'Seni budaya dan prakarya', 86, 'B', 'Ananda Arip hidayat Cukup baik dalam memahami patung  dan Sangat baik dalam memahami penampilan tari kreasi daerah .', '2020-08-31 05:26:01', '2020', '2021'),
('KI-30000034', 'SIS0000007', 'MPL06', 'KLS06', 'SM01', 'Pendidikan jasmani, olahraga, dan kesehatan', 84, 'B', 'Ananda Arip hidayat Cukup baik dalam Memahami keterampilan salah satu gaya renang dan dasar-dasar penyelamatan diri***  dan Baik dalam Memahami perlunya pemeliharaan kebersihan alat reproduksi .', '2020-08-31 05:26:15', '2020', '2021'),
('KI-30000035', 'SIS0000003', 'MPL01', 'KLS03', 'SM01', 'Pendidikan agama & budi pekerti', 90, 'B', 'Ananda Siswa 3 Cukup baik dalam memahami karya keselamatan Allah yang dialami oleh tokoh-tokoh Perjanjian Lama  dan Baik dalam memahami pentingnya melestarikan lingkungan hidup sebagai wujud karya keselamatan Allah .', '2020-09-08 10:28:50', '2020', '2021'),
('KI-30000036', 'SIS0000003', 'MPL02', 'KLS03', 'SM01', 'Pendidikan pancasila dan kewarganegaraan', 84, 'B', 'Ananda Siswa 3 Cukup baik dalam Memahami makna bersatu dalam keberagaman di lingkungan sekitar  dan Baik dalam Menjelaskan makna keberagaman karakteristik individu di lingkungan sekitar .', '2020-09-08 10:29:21', '2020', '2021'),
('KI-30000037', 'SIS0000003', 'MPL03', 'KLS03', 'SM01', 'Bahasa indonesia ku', 75, 'C', 'Ananda Siswa 3 Cukup baik dalam Mencermati ungkapan atau kalimat saran, masukan, dan penyelesaian masalah (sederhana) dalam teks tulis.  dan Baik dalam Mencermati informasi tentang konsep delapan arah mata angin dan pemanfaatannya dalam denah dalam teks lisan, tulis, visual, dan/atau eksplorasi lingkungan .', '2020-09-08 10:29:40', '2020', '2021'),
('KI-30000038', 'SIS0000003', 'MPL04', 'KLS03', 'SM01', 'Matematika', 0, 'D', 'Ananda Siswa 3 Perlu bimbingan dalam Menjelaskan data berkaitan dengan diri peserta didik yang disajikan dalam diagram gambar  dan Perlu bimbingan dalam Menjelaskan data berkaitan dengan diri peserta didik yang disajikan dalam diagram gambar .', '2020-09-08 10:30:11', '2020', '2021'),
('KI-30000039', 'SIS0000003', 'MPL05', 'KLS03', 'SM01', 'Seni budaya dan prakarya', 87, 'B', 'Ananda Siswa 3 Baik dalam mengetahui teknik potong, lipat, dan sambung  dan Baik dalam mengetahui teknik potong, lipat, dan sambung .', '2020-09-08 10:30:47', '2020', '2021'),
('KI-30000040', 'SIS0000003', 'MPL06', 'KLS03', 'SM01', 'Pendidikan jasmani, olahraga, dan kesehatan', 83, 'B', 'Ananda Siswa 3 Cukup baik dalam Memahami perlunya memilih makanan bergizi dan jajanan sehat untuk menjaga kesehatan tubuh  dan Baik dalam Memahami kombinasi berbagai pola gerak dominan (bertumpu, bergantung, keseimbangan, berpindah/lokomotor, tolakan, putaran, ayunan, melayang, dan, dan mendarat) dalam aktivitas senam lantai .', '2020-09-08 10:31:08', '2020', '2021');

-- --------------------------------------------------------

--
-- Struktur dari tabel `nilai_raport_ki4`
--

CREATE TABLE `nilai_raport_ki4` (
  `id_nilairaport` char(15) CHARACTER SET latin1 NOT NULL,
  `id_siswa` char(15) CHARACTER SET latin1 NOT NULL,
  `id_mapel` char(15) CHARACTER SET latin1 NOT NULL,
  `id_kelas` char(15) CHARACTER SET latin1 NOT NULL,
  `id_semester` char(15) CHARACTER SET latin1 NOT NULL,
  `nama_mapel` varchar(225) CHARACTER SET latin1 NOT NULL,
  `nilai` int(15) DEFAULT NULL,
  `predikat` char(15) CHARACTER SET latin1 NOT NULL,
  `deskripsi` text CHARACTER SET latin1 NOT NULL,
  `tgl_raport` varchar(225) CHARACTER SET latin1 NOT NULL,
  `tahun_ajaran_awal` varchar(225) CHARACTER SET latin1 NOT NULL,
  `tahun_ajaran_akhir` varchar(225) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `nilai_raport_ki4`
--

INSERT INTO `nilai_raport_ki4` (`id_nilairaport`, `id_siswa`, `id_mapel`, `id_kelas`, `id_semester`, `nama_mapel`, `nilai`, `predikat`, `deskripsi`, `tgl_raport`, `tahun_ajaran_awal`, `tahun_ajaran_akhir`) VALUES
('KI-40000001', 'SIS0000001', 'MPL01', 'KLS01', 'SM01', 'Pendidikan agama & budi pekerti', 71, 'D', 'Ananda caroline benneta irawan  Perlu bimbingan dalam melakukan aktivitas (misalnya mempraktikkan/menghias doa harian) sebagai ungkapan iman kepada Allah  dan Cukup baik dalam melakukan aktivitas (misalnya mempraktikkan/mewarnai gambar) .', '2020-08-27 06:06:59', '2020', '2021'),
('KI-40000002', 'SIS0000001', 'MPL02', 'KLS01', 'SM01', 'Pendidikan pancasila dan kewarganegaraan', 86, 'B', 'Ananda caroline benneta irawan  Cukup baik dalam menceritakan pengalaman kerjasama dalam keberagaman di rumah  dan Cukup baik dalam menceritakan pengalaman kerjasama dalam keberagaman di rumah .', '2020-08-27 11:40:11', '2020', '2021'),
('KI-40000003', 'SIS0000001', 'MPL03', 'KLS01', 'SM01', 'Bahasa indonesia ku', 80, 'B', 'Ananda caroline benneta irawan  Cukup baik dalam menyampaikan penjelasan dengan kosakata Bahasa Indonesia dan dibantu dengan bahasa daerah mengenai peristiwa siang dan malam dalam teks tulis dan gambar  dan Baik dalam menggunakan kosakata dan ungkapan yang tepat untuk perkenalan diri, keluarga, dan orang-orang di tempat tinggalnya secara sederhana dalam bentuk lisan dan tulis .', '2020-08-28 12:02:48', '2020', '2021'),
('KI-40000004', 'SIS0000001', 'MPL04', 'KLS01', 'SM01', 'Matematika', 77, 'C', 'Ananda caroline benneta irawan  Cukup baik dalam mengurutkan benda/kejadian/ keadaan berdasarkan panjang, berat, lamanya waktu, dan suhu  dan Cukup baik dalam mengurutkan benda/kejadian/ keadaan berdasarkan panjang, berat, lamanya waktu, dan suhu .', '2020-08-28 12:03:21', '2020', '2021'),
('KI-40000005', 'SIS0000001', 'MPL05', 'KLS01', 'SM01', 'Seni budaya dan prakarya', 80, 'C', 'Ananda caroline benneta irawan  Cukup baik dalam membuat karya dari bahan alam  dan Cukup baik dalam membuat karya dari bahan alam .', '2020-08-28 12:03:52', '2020', '2021'),
('KI-40000006', 'SIS0000001', 'MPL06', 'KLS01', 'SM01', 'Pendidikan jasmani, olahraga, dan kesehatan', 80, 'C', 'Ananda caroline benneta irawan  Cukup baik dalam menceritakan cara menjaga kebersihan lingkungan (tempat tidur, rumah, kelas, lingkungan sekolah).  dan Baik dalam menceritakan bagian-bagian tubuh, bagian tubuh yang boleh dan tidak boleh disentuh orang lain, cara menjaga kebersihannya, dan kebersihan pakaian .', '2020-08-28 12:04:10', '2020', '2021'),
('KI-40000007', 'SIS0000001', 'MPL07', 'KLS01', 'SM01', '(Mulok 1) Bahasa inggris', 82, 'C', 'Ananda caroline benneta irawan  Perlu bimbingan dalam KD Mulok 1 Aspek Keterampilan 4.7  dan Sangat baik dalam KD Mulok 1 Aspek Keterampilan 4.3 .', '2020-08-28 12:04:33', '2020', '2021'),
('KI-40000008', 'SIS0000001', 'MPL01', 'KLS01', 'SM02', 'Pendidikan agama & budi pekerti', 82, 'C', 'Ananda caroline benneta irawan  Cukup baik dalam melakukan perbuatan kasih sebagai wujud pewartaan kabar gembira tentang kelahiran Yesus  dan Sangat baik dalam melakukan aktivitas (misalnya mempraktikkan/menghias doa harian) sebagai ungkapan iman kepada Allah .', '2020-08-28 12:10:46', '2020', '2021'),
('KI-40000009', 'SIS0000001', 'MPL02', 'KLS01', 'SM02', 'Pendidikan pancasila dan kewarganegaraan', 87, 'B', 'Ananda caroline benneta irawan  Cukup baik dalam menceritakan pengalaman kerjasama dalam keberagaman di rumah  dan Baik dalam menceritakan pengalaman kebersamaan dalam keberagaman kehidupan individu di rumah .', '2020-08-28 12:14:08', '2020', '2021'),
('KI-40000010', 'SIS0000001', 'MPL03', 'KLS01', 'SM02', 'Bahasa indonesia ku', 84, 'B', 'Ananda caroline benneta irawan  Cukup baik dalam melisankan puisi anak atau syair lagu (berisi ungkapan kekaguman, kebanggaan, hormat kepada orang tua, kasih sayang, atau persahabatan) sebagai bentuk ungkapan diri  dan Sangat baik dalam melafalkan bunyi vokal dan konsonan dalam kata bahasa Indonesia atau bahasa daerah .', '2020-08-28 12:14:25', '2020', '2021'),
('KI-40000011', 'SIS0000001', 'MPL04', 'KLS01', 'SM02', 'Matematika', 80, 'B', 'Ananda caroline benneta irawan  Cukup baik dalam memprediksi dan membuat pola bilangan yang berkaitan dengan kumpulan benda/gambar/gerakan atau lainnya  dan Sangat baik dalam mengurutkan benda/kejadian/ keadaan berdasarkan panjang, berat, lamanya waktu, dan suhu .', '2020-08-28 12:14:51', '2020', '2021'),
('KI-40000012', 'SIS0000001', 'MPL05', 'KLS01', 'SM02', 'Seni budaya dan prakarya', 80, 'C', 'Ananda caroline benneta irawan  Cukup baik dalam membuat karya dari bahan alam  dan Cukup baik dalam membuat karya dari bahan alam .', '2020-08-28 12:15:16', '2020', '2021'),
('KI-40000013', 'SIS0000001', 'MPL06', 'KLS01', 'SM02', 'Pendidikan jasmani, olahraga, dan kesehatan', 80, 'C', 'Ananda caroline benneta irawan  Cukup baik dalam menceritakan cara menjaga kebersihan lingkungan (tempat tidur, rumah, kelas, lingkungan sekolah).  dan Baik dalam menceritakan bagian-bagian tubuh, bagian tubuh yang boleh dan tidak boleh disentuh orang lain, cara menjaga kebersihannya, dan kebersihan pakaian .', '2020-08-28 12:15:33', '2020', '2021'),
('KI-40000014', 'SIS0000001', 'MPL07', 'KLS01', 'SM02', '(Mulok 1) Bahasa inggris', 80, 'C', 'Ananda caroline benneta irawan  Cukup baik dalam KD Mulok 1 Aspek Keterampilan 4.9  dan Baik dalam KD Mulok 1 Aspek Keterampilan 4.10 .', '2020-08-28 12:15:55', '2020', '2021'),
('KI-40000015', 'SIS0000008', 'MPL01', 'KLS01', 'SM01', 'Pendidikan agama & budi pekerti', 80, 'C', 'Ananda Debora Naria Simamora  Cukup baik dalam melakukan tindakan sederhana dalam memelihara alam ciptaan Allah  dan Cukup baik dalam melakukan tindakan sederhana dalam memelihara alam ciptaan Allah .', '2020-08-28 12:24:29', '2020', '2021'),
('KI-40000016', 'SIS0000008', 'MPL02', 'KLS01', 'SM01', 'Pendidikan pancasila dan kewarganegaraan', 80, 'C', 'Ananda Debora Naria Simamora  Cukup baik dalam menceritakan pengalaman kerjasama dalam keberagaman di rumah  dan Cukup baik dalam menceritakan pengalaman kerjasama dalam keberagaman di rumah .', '2020-08-28 12:26:35', '2020', '2021'),
('KI-40000017', 'SIS0000008', 'MPL03', 'KLS01', 'SM01', 'Bahasa indonesia ku', 80, 'B', 'Ananda Debora Naria Simamora  Cukup baik dalam melisankan puisi anak atau syair lagu (berisi ungkapan kekaguman, kebanggaan, hormat kepada orang tua, kasih sayang, atau persahabatan) sebagai bentuk ungkapan diri  dan Baik dalam menyampaikan penjelasan dengan kosakata Bahasa Indonesia dan dibantu dengan bahasa daerah mengenai peristiwa siang dan malam dalam teks tulis dan gambar .', '2020-08-28 12:26:52', '2020', '2021'),
('KI-40000018', 'SIS0000008', 'MPL04', 'KLS01', 'SM01', 'Matematika', 80, 'C', 'Ananda Debora Naria Simamora  Cukup baik dalam mengurutkan benda/kejadian/ keadaan berdasarkan panjang, berat, lamanya waktu, dan suhu  dan Cukup baik dalam mengurutkan benda/kejadian/ keadaan berdasarkan panjang, berat, lamanya waktu, dan suhu .', '2020-08-28 12:27:14', '2020', '2021'),
('KI-40000019', 'SIS0000008', 'MPL05', 'KLS01', 'SM01', 'Seni budaya dan prakarya', 80, 'C', 'Ananda Debora Naria Simamora  Cukup baik dalam membuat karya dari bahan alam  dan Cukup baik dalam membuat karya dari bahan alam .', '2020-08-28 12:27:35', '2020', '2021'),
('KI-40000020', 'SIS0000008', 'MPL06', 'KLS01', 'SM01', 'Pendidikan jasmani, olahraga, dan kesehatan', 77, 'C', 'Ananda Debora Naria Simamora  Cukup baik dalam menceritakan cara menjaga kebersihan lingkungan (tempat tidur, rumah, kelas, lingkungan sekolah).  dan Cukup baik dalam menceritakan cara menjaga kebersihan lingkungan (tempat tidur, rumah, kelas, lingkungan sekolah). .', '2020-08-28 12:27:51', '2020', '2021'),
('KI-40000021', 'SIS0000008', 'MPL07', 'KLS01', 'SM01', '(Mulok 1) Bahasa inggris', 85, 'B', 'Ananda Debora Naria Simamora  Cukup baik dalam KD Mulok 1 Aspek Keterampilan 4.10  dan Sangat baik dalam KD Mulok 1 Aspek Keterampilan 4.7 .', '2020-08-28 12:28:12', '2020', '2021'),
('KI-40000022', 'SIS0000008', 'MPL01', 'KLS01', 'SM02', 'Pendidikan agama & budi pekerti', 80, 'C', 'Ananda Debora Naria Simamora  Cukup baik dalam melakukan tindakan sederhana dalam memelihara alam ciptaan Allah  dan Cukup baik dalam melakukan tindakan sederhana dalam memelihara alam ciptaan Allah .', '2020-08-28 12:36:27', '2020', '2021'),
('KI-40000023', 'SIS0000007', 'MPL01', 'KLS06', 'SM02', 'Pendidikan agama & budi pekerti', 81, 'C', 'Ananda Arip hidayat Cukup baik dalam membuat proyek yang melibatkan seluruh hidupnya sebagai ibadah yang sejati kepada Allah  dan Baik dalam mendemonstrasikan berbagai bentuk pelayanan terhadap sesama sebagai ibadah yang sejati kepada Allah .', '2020-08-31 04:58:39', '2020', '2021'),
('KI-40000024', 'SIS0000007', 'MPL03', 'KLS06', 'SM02', 'Bahasa indonesia ku', 80, 'C', 'Ananda Arip hidayat Cukup baik dalam Menyajikan hasil pengaitan peristiwa yang dialami tokoh dalam cerita fiksi dengan pengalaman pribadi secara lisan, tulis, dan visual  dan Cukup baik dalam Menyampaikan penjelasan tentang tuturan dan tindakan tokoh serta penceritaan penulis dalam teks fiksi secara lisan, tulis, dan visual .', '2020-08-31 04:58:55', '2020', '2021'),
('KI-40000025', 'SIS0000007', 'MPL04', 'KLS06', 'SM02', 'Matematika', 80, 'C', 'Ananda Arip hidayat Cukup baik dalam Mengidentifikasi bangun ruang yang merupakan gabungan dari beberapa bangun ruang, serta luas permukaan dan volumenya  dan Baik dalam Menyelesaikan masalah yang berkaitan dengan modus, median, dan mean dari data tunggal dalam penyelesaian masalah .', '2020-08-31 04:59:19', '2020', '2021'),
('KI-40000026', 'SIS0000007', 'MPL02', 'KLS06', 'SM02', 'Pendidikan pancasila dan kewarganegaraan', 80, 'C', 'Ananda Arip hidayat Cukup baik dalam Menyajikan hasil telaah persatuan dan kesatuan terhadap kehidupan berbangsa dan bernegara beserta dampaknya  dan Cukup baik dalam Menyajikan hasil telaah persatuan dan kesatuan terhadap kehidupan berbangsa dan bernegara beserta dampaknya .', '2020-08-31 04:59:44', '2020', '2021'),
('KI-40000027', 'SIS0000007', 'MPL05', 'KLS06', 'SM02', 'Seni budaya dan prakarya', 80, 'C', 'Ananda Arip hidayat Cukup baik dalam membuat patung  dan Cukup baik dalam membuat patung .', '2020-08-31 04:59:58', '2020', '2021'),
('KI-40000028', 'SIS0000007', 'MPL06', 'KLS06', 'SM02', 'Pendidikan jasmani, olahraga, dan kesehatan', 78, 'C', 'Ananda Arip hidayat Perlu bimbingan dalam Mempraktikkan penggunaan variasi dan kombinasi gerak dasar rangkaian langkah dan ayunan lengan mengikuti irama (ketukan) tanpa/dengan musik dalam aktivitas gerak berirama  dan Baik dalam Memaparkan perlunya pemeliharaan kebersihan alat reproduksi .', '2020-08-31 05:00:14', '2020', '2021'),
('KI-40000029', 'SIS0000007', 'MPL01', 'KLS06', 'SM01', 'Pendidikan agama & budi pekerti', 81, 'C', 'Ananda Arip hidayat Cukup baik dalam membuat proyek yang melibatkan seluruh hidupnya sebagai ibadah yang sejati kepada Allah  dan Baik dalam mempraktikkan kesetiaan beribadah, berdoa, dan membaca Alkitab .', '2020-08-31 05:26:39', '2020', '2021'),
('KI-40000030', 'SIS0000007', 'MPL02', 'KLS06', 'SM01', 'Pendidikan pancasila dan kewarganegaraan', 79, 'C', 'Ananda Arip hidayat Cukup baik dalam Menyajikan hasil analisis pelaksanaan kewajiban, ha, dan tanggung jawab sebagai warga masyarakat beserta dampaknya dalam kehidupan sehari-hari  dan Baik dalam Menyajikan hasil telaah persatuan dan kesatuan terhadap kehidupan berbangsa dan bernegara beserta dampaknya .', '2020-08-31 05:26:54', '2020', '2021'),
('KI-40000031', 'SIS0000007', 'MPL03', 'KLS06', 'SM01', 'Bahasa indonesia ku', 84, 'B', 'Ananda Arip hidayat Cukup baik dalam Mengisi teks formulir (pendaftaran, kartu anggota, pengiriman uang melalui bank/kantor pos, daftar riwayat hidup, dll.) sesuai petunjuk pengisiannya  dan Sangat baik dalam Menyampaikan hasil membandingkan informasi yang diharapkan dengan informasi yang diperoleh setelah membaca teks nonfiksi secara lisan, tulis, dan visual .', '2020-08-31 05:27:11', '2020', '2021'),
('KI-40000032', 'SIS0000007', 'MPL04', 'KLS06', 'SM01', 'Matematika', 92, 'A', 'Ananda Arip hidayat Cukup baik dalam Menaksir keliling dan luas lingkaran serta menggunakannya untuk menyelesaikan masalah  dan Sangat baik dalam Menyelesaikan masalah yang berkaitan operasi hitung campuran yang melibatkan bilangan cacah, pecahan dan/atau desimal dalam berbagai bentuk sesuai urutan operasi .', '2020-08-31 05:27:35', '2020', '2021'),
('KI-40000033', 'SIS0000007', 'MPL05', 'KLS06', 'SM01', 'Seni budaya dan prakarya', 83, 'C', 'Ananda Arip hidayat Cukup baik dalam membuat patung  dan Cukup baik dalam membuat patung .', '2020-08-31 05:28:02', '2020', '2021'),
('KI-40000034', 'SIS0000007', 'MPL06', 'KLS06', 'SM01', 'Pendidikan jasmani, olahraga, dan kesehatan', 79, 'C', 'Ananda Arip hidayat Cukup baik dalam Memaparkan perlunya pemeliharaan kebersihan alat reproduksi  dan Sangat baik dalam Mempraktikkan penggunaan variasi dan kombinasi gerak dasar rangkaian langkah dan ayunan lengan mengikuti irama (ketukan) tanpa/dengan musik dalam aktivitas gerak berirama .', '2020-08-31 05:28:24', '2020', '2021'),
('KI-40000035', 'SIS0000003', 'MPL01', 'KLS03', 'SM01', 'Pendidikan agama & budi pekerti', 78, 'C', 'Ananda Siswa 3 Cukup baik dalam melakukan aktivitas (misalnya memperagakan/mempraktikkan/ mendramatisasi) yang berkaitan dengan Tata Perayaan Sakramen Baptis, Ekaristi, dan Tobat  dan Baik dalam melakukan aktivitas sosial dengan memberi bantuan kepada orang yang memerlukan pertolongan seturut teladan Yesus seperti yang dikisahkan dalam Perjanjian Baru .', '2020-09-08 10:31:36', '2020', '2021'),
('KI-40000036', 'SIS0000003', 'MPL02', 'KLS03', 'SM01', 'Pendidikan pancasila dan kewarganegaraan', 81, 'C', 'Ananda Siswa 3 Cukup baik dalam Menyajikan bentuk-bentuk kebersatuan dalam keberagaman di lingkungan sekitar  dan Baik dalam Menyajikan hasil identifikasi kewajiban dan hak sebagai anggota keluarga dan warga sekolah .', '2020-09-08 10:31:59', '2020', '2021'),
('KI-40000037', 'SIS0000003', 'MPL03', 'KLS03', 'SM01', 'Bahasa indonesia ku', 84, 'B', 'Ananda Siswa 3 Cukup baik dalam Memeragakan ungkapan atau kalimat saran, masukan, dan penyelesaian masalah (sederhana) sebagai bentuk ungkapan diri menggunakan kosakata baku dan kalimat efektif yang dibuat sendiri  dan Baik dalam Menyajikan laporan tentang konsep ciri-ciri, kebutuhan (makanan dan tempat hidup), pertumbuhan dan perkembangan makhluk hidup yang ada di lingkungan setempat secara tertulis menggunakan kosakata baku dan kalimat efektif .', '2020-09-08 10:32:18', '2020', '2021'),
('KI-40000038', 'SIS0000003', 'MPL04', 'KLS03', 'SM01', 'Matematika', 82, 'B', 'Ananda Siswa 3 Cukup baik dalam Menyajikan data berkaitan dengan diri peserta didik yang disajikan dalam diagram gambar  dan Baik dalam Mengelompokkan berbagai bangun datar berdasarkan sifat-sifat yang dimiliki .', '2020-09-08 10:32:42', '2020', '2021'),
('KI-40000039', 'SIS0000003', 'MPL05', 'KLS03', 'SM01', 'Seni budaya dan prakarya', 82, 'C', 'Ananda Siswa 3 Cukup baik dalam meragakan dinamika gerak tari  dan Baik dalam membuat karya dengan teknik potong, lipat, dan sambung .', '2020-09-08 10:33:11', '2020', '2021'),
('KI-40000040', 'SIS0000003', 'MPL06', 'KLS03', 'SM01', 'Pendidikan jasmani, olahraga, dan kesehatan', 82, 'C', 'Ananda Siswa 3 Cukup baik dalam Menceritakan perlunya memilih makanan bergizi dan jajanan sehat untuk menjaga kesehatan tubuh  dan Baik dalam Menceritakan bentuk dan manfaat istirahat dan pengisian waktu luang untuk menjaga kesehatan .', '2020-09-08 10:33:30', '2020', '2021');

-- --------------------------------------------------------

--
-- Struktur dari tabel `nilai_raport_sosial`
--

CREATE TABLE `nilai_raport_sosial` (
  `id_nilairaport_so` char(15) CHARACTER SET latin1 NOT NULL,
  `id_siswa` char(15) CHARACTER SET latin1 NOT NULL,
  `nilai` char(115) CHARACTER SET latin1 NOT NULL,
  `predikat` char(15) CHARACTER SET latin1 NOT NULL,
  `deskripsi` text CHARACTER SET latin1 NOT NULL,
  `id_kelas` char(15) CHARACTER SET latin1 NOT NULL,
  `id_semester` char(15) CHARACTER SET latin1 NOT NULL,
  `tgl_raport` varchar(225) CHARACTER SET latin1 NOT NULL,
  `tahun_ajaran_awal` varchar(225) CHARACTER SET latin1 NOT NULL,
  `tahun_ajaran_akhir` varchar(225) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `nilai_raport_sosial`
--

INSERT INTO `nilai_raport_sosial` (`id_nilairaport_so`, `id_siswa`, `nilai`, `predikat`, `deskripsi`, `id_kelas`, `id_semester`, `tgl_raport`, `tahun_ajaran_awal`, `tahun_ajaran_akhir`) VALUES
('SOS0000006', 'SIS0000008', 'B', 'baik', 'Ananda Debora Naria Simamora ,  Dengan bimbingan dan pendampingan yang lebih, akan mampu meningkatkan  dalam jujur,, dan  Dengan bimbingan dan pendampingan yang lebih, akan mampu meningkatkan  dalam disiplin,, dan  Dengan bimbingan dan pendampingan yang lebih, akan mampu meningkatkan  dalam percaya diri,, dan  Dengan bimbingan dan pendampingan yang lebih, akan mampu meningkatkan  dalam santun,. ', 'KLS01', 'SM01', '2020-08-28 12:22:24', '2020', '2021'),
('SOS0000007', 'SIS0000008', 'B', 'baik', 'Ananda Debora Naria Simamora ,  Baik dalam jujur,, dan  Baik dalam disiplin,, dan Sangat baik dalam percaya diri,, dan  Dengan bimbingan dan pendampingan yang lebih, akan mampu meningkatkan  dalam santun,. ', 'KLS01', 'SM02', '2020-08-28 12:31:26', '2020', '2021'),
('SOS0000008', 'SIS0000001', 'B', 'baik', 'Ananda caroline benneta irawan ,  Baik dalam jujur, dan  Dengan bimbingan dan pendampingan yang lebih, akan mampu meningkatkan  dalam disiplin, dan Sangat baik dalam percaya diri, dan  Dengan bimbingan dan pendampingan yang lebih, akan mampu meningkatkan  dalam santun. ', 'KLS01', 'SM01', '2020-08-28 02:55:20', '2020', '2021'),
('SOS0000009', 'SIS0000001', 'A', 'Sangat baik', 'Ananda caroline benneta irawan ,  Baik dalam jujur, dan  Baik dalam disiplin, dan  Dengan bimbingan dan pendampingan yang lebih, akan mampu meningkatkan  dalam percaya diri, dan  Baik dalam santun. ', 'KLS01', 'SM02', '2020-08-28 03:07:02', '2020', '2021'),
('SOS0000010', 'SIS0000007', 'A', 'Sangat baik', 'Ananda Arip hidayat,  Baik dalam jujur, dan  Baik dalam disiplin, dan  Baik dalam percaya diri, dan  Baik dalam santun. ', 'KLS06', 'SM02', '2020-08-31 05:00:46', '2020', '2021'),
('SOS0000011', 'SIS0000007', 'B', 'baik', 'Ananda Arip hidayat,  Dengan bimbingan dan pendampingan yang lebih, akan mampu meningkatkan  dalam jujur, dan  Dengan bimbingan dan pendampingan yang lebih, akan mampu meningkatkan  dalam disiplin, dan  Dengan bimbingan dan pendampingan yang lebih, akan mampu meningkatkan  dalam percaya diri, dan  Dengan bimbingan dan pendampingan yang lebih, akan mampu meningkatkan  dalam santun. ', 'KLS06', 'SM01', '2020-08-31 05:28:54', '2020', '2021'),
('SOS0000012', 'SIS0000003', 'A', 'Sangat baik', 'Ananda Siswa 3, Sangat baik dalam jujur, dan  Baik dalam disiplin, dan  Baik dalam percaya diri, dan  Baik dalam santun. ', 'KLS03', 'SM01', '2020-09-08 10:34:05', '2020', '2021');

-- --------------------------------------------------------

--
-- Struktur dari tabel `nilai_raport_spiritual`
--

CREATE TABLE `nilai_raport_spiritual` (
  `id_nilairaport_sp` char(15) CHARACTER SET latin1 NOT NULL,
  `id_siswa` char(15) CHARACTER SET latin1 NOT NULL,
  `nilai` char(10) CHARACTER SET latin1 NOT NULL,
  `predikat` char(15) CHARACTER SET latin1 NOT NULL,
  `deskripsi` text CHARACTER SET latin1 NOT NULL,
  `id_kelas` char(15) CHARACTER SET latin1 NOT NULL,
  `id_semester` char(15) CHARACTER SET latin1 NOT NULL,
  `tgl_raport` varchar(225) CHARACTER SET latin1 NOT NULL,
  `tahun_ajaran_awal` varchar(225) CHARACTER SET latin1 NOT NULL,
  `tahun_ajaran_akhir` varchar(225) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `nilai_raport_spiritual`
--

INSERT INTO `nilai_raport_spiritual` (`id_nilairaport_sp`, `id_siswa`, `nilai`, `predikat`, `deskripsi`, `id_kelas`, `id_semester`, `tgl_raport`, `tahun_ajaran_awal`, `tahun_ajaran_akhir`) VALUES
('SPT0000006', 'SIS0000008', 'B', 'baik', 'Ananda Debora Naria Simamora ,  Baik dalam Ketaatan beribadah sesuai agamannya, dan  Baik dalam Berperilaku syukur, dan  Dengan bimbingan dan pendampingan yang lebih, akan mampu meningkatkan  dalam Berdoa sebelum dan sesudah melakukan kegiatan, dan  Dengan bimbingan dan pendampingan yang lebih, akan mampu meningkatkan  dalam Bertoleransi dalam beribadah. ', 'KLS01', 'SM01', '2020-08-28 12:22:11', '2020', '2021'),
('SPT0000007', 'SIS0000008', 'B', 'baik', 'Ananda Debora Naria Simamora ,  Dengan bimbingan dan pendampingan yang lebih, akan mampu meningkatkan  dalam Ketaatan beribadah sesuai agamannya, dan  Dengan bimbingan dan pendampingan yang lebih, akan mampu meningkatkan  dalam Berperilaku syukur, dan  Dengan bimbingan dan pendampingan yang lebih, akan mampu meningkatkan  dalam Berdoa sebelum dan sesudah melakukan kegiatan, dan  Dengan bimbingan dan pendampingan yang lebih, akan mampu meningkatkan  dalam Bertoleransi dalam beribadah. ', 'KLS01', 'SM02', '2020-08-28 12:31:14', '2020', '2021'),
('SPT0000008', 'SIS0000001', 'B', 'baik', 'Ananda caroline benneta irawan ,  Dengan bimbingan dan pendampingan yang lebih, akan mampu meningkatkan  dalam Ketaatan beribadah sesuai agamannya, dan  Baik dalam Berperilaku syukur, dan Sangat baik dalam Berdoa sebelum dan sesudah melakukan kegiatan, dan  Dengan bimbingan dan pendampingan yang lebih, akan mampu meningkatkan  dalam Bertoleransi dalam beribadah. ', 'KLS01', 'SM01', '2020-08-28 02:56:36', '2020', '2021'),
('SPT0000009', 'SIS0000001', 'A', 'Sangat baik', 'Ananda caroline benneta irawan ,  Dengan bimbingan dan pendampingan yang lebih, akan mampu meningkatkan  dalam Ketaatan beribadah sesuai agamannya, dan Sangat baik dalam Berperilaku syukur, dan  Dengan bimbingan dan pendampingan yang lebih, akan mampu meningkatkan  dalam Berdoa sebelum dan sesudah melakukan kegiatan, dan  Baik dalam Bertoleransi dalam beribadah. ', 'KLS01', 'SM02', '2020-08-28 03:07:25', '2020', '2021'),
('SPT0000010', 'SIS0000007', 'B', 'baik', 'Ananda Arip hidayat,  Baik dalam Ketaatan beribadah sesuai agamannya, dan  Dengan bimbingan dan pendampingan yang lebih, akan mampu meningkatkan  dalam Berperilaku syukur, dan  Baik dalam Berdoa sebelum dan sesudah melakukan kegiatan, dan  Dengan bimbingan dan pendampingan yang lebih, akan mampu meningkatkan  dalam Bertoleransi dalam beribadah. ', 'KLS06', 'SM02', '2020-08-31 05:00:33', '2020', '2021'),
('SPT0000011', 'SIS0000007', 'A', 'Sangat baik', 'Ananda Arip hidayat,  Baik dalam Ketaatan beribadah sesuai agamannya, dan  Baik dalam Berperilaku syukur, dan  Baik dalam Berdoa sebelum dan sesudah melakukan kegiatan, dan  Baik dalam Bertoleransi dalam beribadah. ', 'KLS06', 'SM01', '2020-08-31 05:28:44', '2020', '2021'),
('SPT0000012', 'SIS0000003', 'A', 'Sangat baik', 'Ananda Siswa 3, Sangat baik dalam Ketaatan beribadah sesuai agamannya, dan  Baik dalam Berperilaku syukur, dan  Baik dalam Berdoa sebelum dan sesudah melakukan kegiatan, dan Sangat baik dalam Bertoleransi dalam beribadah. ', 'KLS03', 'SM01', '2020-09-08 10:33:52', '2020', '2021');

-- --------------------------------------------------------

--
-- Struktur dari tabel `per_ekstrakurikuler`
--

CREATE TABLE `per_ekstrakurikuler` (
  `id_siswa` char(15) CHARACTER SET latin1 NOT NULL,
  `id_kelas` char(15) CHARACTER SET latin1 NOT NULL,
  `id_semester` char(15) CHARACTER SET latin1 NOT NULL,
  `id_ekstra` char(15) CHARACTER SET latin1 NOT NULL,
  `kegiatan` varchar(225) CHARACTER SET latin1 NOT NULL,
  `predikat` varchar(1) NOT NULL,
  `keterangan` varchar(225) CHARACTER SET latin1 NOT NULL,
  `tgl_raport` varchar(225) CHARACTER SET latin1 NOT NULL,
  `tahun_ajaran_awal` varchar(225) CHARACTER SET latin1 NOT NULL,
  `tahun_ajaran_akhir` varchar(225) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `per_ekstrakurikuler`
--

INSERT INTO `per_ekstrakurikuler` (`id_siswa`, `id_kelas`, `id_semester`, `id_ekstra`, `kegiatan`, `predikat`, `keterangan`, `tgl_raport`, `tahun_ajaran_awal`, `tahun_ajaran_akhir`) VALUES
('SIS0000001', 'KLS01', 'SM02', 'EKS001', 'Pramuka', 'A', 'Ananda caroline benneta irawan  Suci Dalam Pikiran ku, Suci Dalam Perkataan, dapat di percaya. dan Ananda memperoleh predikat : A', '2020-08-28 12:07:29', '2020', '2021'),
('SIS0000001', 'KLS01', 'SM02', 'EKS005', 'Basket', 'A', 'Ananda caroline benneta irawan  Passing, Passing, Memegang bola. dan Ananda memperoleh predikat : A', '2020-08-28 12:07:29', '2020', '2021'),
('SIS0000001', 'KLS01', 'SM02', 'EKS010', 'DrumBand', 'A', 'Ananda caroline benneta irawan  Gripping, Single stroke satu tangan, Single stroke satu tangan. dan Ananda memperoleh predikat : A', '2020-08-28 12:07:29', '2020', '2021'),
('SIS0000001', 'KLS01', 'SM02', 'EKS020', 'Komputer', 'A', 'Ananda caroline benneta irawan  mengetik teks, mengetik teks, mengetik teks. dan Ananda memperoleh predikat : A', '2020-08-28 12:07:29', '2020', '2021'),
('SIS0000008', 'KLS01', 'SM01', 'EKS001', 'Pramuka', 'A', 'Ananda Debora Naria Simamora  Suci Dalam Pikiran ku, Suci Dalam Pikiran ku, Suci Dalam Perkataan. dan Ananda memperoleh predikat : A', '2020-08-28 12:28:46', '2020', '2021'),
('SIS0000008', 'KLS01', 'SM01', 'EKS002', 'Tenis Meja', 'A', 'Ananda Debora Naria Simamora  Chop, Chop, Chop. dan Ananda memperoleh predikat : A', '2020-08-28 12:28:46', '2020', '2021'),
('SIS0000008', 'KLS01', 'SM01', 'EKS010', 'DrumBand', 'B', 'Ananda Debora Naria Simamora  Gripping, Single stroke satu tangan, Single stroke dua tangan. dan Ananda memperoleh predikat : B', '2020-08-28 12:28:46', '2020', '2021'),
('SIS0000008', 'KLS01', 'SM01', 'EKS020', 'Komputer', 'A', 'Ananda Debora Naria Simamora  menggambar bangun datar, mengetik teks, mewarnai gambar. dan Ananda memperoleh predikat : A', '2020-08-28 12:28:46', '2020', '2021'),
('SIS0000008', 'KLS01', 'SM02', 'EKS001', 'Pramuka', 'B', 'Ananda Debora Naria Simamora  Suci Dalam Pikiran ku, Suci Dalam Perkataan, Cinta pada alam ku. dan Ananda memperoleh predikat : B', '2020-08-28 12:31:50', '2020', '2021'),
('SIS0000008', 'KLS01', 'SM02', 'EKS004', 'Catur', 'B', 'Ananda Debora Naria Simamora  Menyusun buah catur, Rokade, Membuka permainan. dan Ananda memperoleh predikat : B', '2020-08-28 12:31:50', '2020', '2021'),
('SIS0000008', 'KLS01', 'SM02', 'EKS009', 'Seni Vocal', 'A', 'Ananda Debora Naria Simamora  artikulasi, artikulasi, Intonasi. dan Ananda memperoleh predikat : A', '2020-08-28 12:31:50', '2020', '2021'),
('SIS0000008', 'KLS01', 'SM02', 'EKS020', 'Komputer', 'A', 'Ananda Debora Naria Simamora  menggambar bangun datar, mengetik teks, mewarnai gambar. dan Ananda memperoleh predikat : A', '2020-08-28 12:31:50', '2020', '2021'),
('SIS0000007', 'KLS06', 'SM02', 'EKS001', 'Pramuka', 'C', 'Ananda Arip hidayat Sangat baik  dalam Cinta tanah air, Baik dapat di percaya, dan Cukup baik komunikatif.', '2020-08-31 05:13:47', '2020', '2021'),
('SIS0000007', 'KLS06', 'SM02', 'EKS002', 'Tenis Meja', 'C', 'Ananda Arip hidayat Sangat baik dalam Topspin, Bail Chop, dan Cukup baik Drive.', '2020-08-31 05:13:47', '2020', '2021'),
('SIS0000007', 'KLS06', 'SM02', 'EKS009', 'Seni Vocal', 'B', 'Ananda Arip hidayat Sangat baik dalam Intonasi, Bail artikulasi, dan Cukup baik resonasi.', '2020-08-31 05:13:47', '2020', '2021'),
('SIS0000007', 'KLS06', 'SM02', 'EKS020', 'Komputer', 'C', 'Ananda Arip hidayat Sangat baik dalam menggambar bangun datar, Bail mengetik teks, dan Cukup baik mewarnai gambar.', '2020-08-31 05:13:47', '2020', '2021'),
('SIS0000001', 'KLS01', 'SM01', 'EKS001', 'Pramuka', 'C', 'Ananda caroline benneta irawan Sangat baik  dalam dapat di percaya, Baik Cinta pada alam ku, dan Cukup baik Cinta sesama manusia.', '2020-08-31 05:21:01', '2020', '2021'),
('SIS0000001', 'KLS01', 'SM01', 'EKS003', 'Bulu Tangkis', 'C', 'Ananda caroline benneta irawan Sangat baik dalam Overhead, Bail Smash, dan Cukup baik Dropshot.', '2020-08-31 05:21:01', '2020', '2021'),
('SIS0000001', 'KLS01', 'SM01', 'EKS009', 'Seni Vocal', 'B', 'Ananda caroline benneta irawan Sangat baik dalam artikulasi, Bail Intonasi, dan Bail resonasi.', '2020-08-31 05:21:01', '2020', '2021'),
('SIS0000001', 'KLS01', 'SM01', 'EKS020', 'Komputer', 'C', 'Ananda caroline benneta irawan Sangat baik dalam menggambar bangun datar, Bail mengetik teks, dan Cukup baik mewarnai gambar.', '2020-08-31 05:21:01', '2020', '2021'),
('SIS0000007', 'KLS06', 'SM01', 'EKS001', 'Pramuka', 'C', 'Ananda Arip hidayat Sangat baik  dalam dapat di percaya, Baik Cinta pada alam ku, dan Cukup baik Cinta tanah air.', '2020-08-31 05:29:17', '2020', '2021'),
('SIS0000007', 'KLS06', 'SM01', 'EKS003', 'Bulu Tangkis', 'C', 'Ananda Arip hidayat Sangat baik dalam Overhead, Bail Smash, dan Cukup baik Dropshot.', '2020-08-31 05:29:17', '2020', '2021'),
('SIS0000007', 'KLS06', 'SM01', 'EKS009', 'Seni Vocal', 'B', 'Ananda Arip hidayat Sangat baik dalam Intonasi, Bail artikulasi, dan Cukup baik resonasi.', '2020-08-31 05:29:17', '2020', '2021'),
('SIS0000007', 'KLS06', 'SM01', 'EKS020', 'Komputer', 'C', 'Ananda Arip hidayat Sangat baik dalam menggambar bangun datar, Bail menggambar bangun datar, dan Cukup baik mewarnai gambar.', '2020-08-31 05:29:17', '2020', '2021'),
('SIS0000003', 'KLS03', 'SM01', 'EKS001', 'Pramuka', 'A', 'Ananda Siswa 3 Cukup baik dalam Suci Dalam Perkataan, Baik Suci Dalam Perbuatan, dan Sangat baik Cinta pada alam ku.', '2020-09-08 10:34:30', '2020', '2021'),
('SIS0000003', 'KLS03', 'SM01', 'EKS003', 'Bulu Tangkis', 'A', 'Ananda Siswa 3 Cukup baik dalam Overhead, Bail Smash, dan Sangat baik Dropshot.', '2020-09-08 10:34:30', '2020', '2021'),
('SIS0000003', 'KLS03', 'SM01', 'EKS009', 'Seni Vocal', 'B', 'Ananda Siswa 3 Sangat baik dalam artikulasi, Bail artikulasi, dan Cukup baik pernapasan.', '2020-09-08 10:34:30', '2020', '2021'),
('SIS0000003', 'KLS03', 'SM01', 'EKS023', 'Science', 'C', 'Ananda Siswa 3 Sangat baik dalam Muatan Nilai 9, Bail Muatan Nilai 9, dan Cukup baik Muatan Nilai 8.', '2020-09-08 10:34:30', '2020', '2021');

-- --------------------------------------------------------

--
-- Struktur dari tabel `per_kesehatan`
--

CREATE TABLE `per_kesehatan` (
  `id_siswa` char(15) CHARACTER SET latin1 NOT NULL,
  `id_kelas` char(15) CHARACTER SET latin1 NOT NULL,
  `id_semester` char(15) CHARACTER SET latin1 NOT NULL,
  `id_kesehatan` char(15) CHARACTER SET latin1 NOT NULL,
  `aspek_fisik` varchar(225) CHARACTER SET latin1 NOT NULL,
  `keterangan` varchar(225) CHARACTER SET latin1 NOT NULL,
  `tgl_raport` varchar(225) CHARACTER SET latin1 NOT NULL,
  `tahun_ajaran_awal` varchar(225) CHARACTER SET latin1 NOT NULL,
  `tahun_ajaran_akhir` varchar(225) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `per_kesehatan`
--

INSERT INTO `per_kesehatan` (`id_siswa`, `id_kelas`, `id_semester`, `id_kesehatan`, `aspek_fisik`, `keterangan`, `tgl_raport`, `tahun_ajaran_awal`, `tahun_ajaran_akhir`) VALUES
('SIS0000001', 'KLS01', 'SM01', 'KSH001', 'Pendengaran telinga', 'Keras', '2020-08-27 05:06:37', '2020', '2021'),
('SIS0000001', 'KLS01', 'SM01', 'KSH002', 'Penglihatan mata', 'Jelas', '2020-08-27 05:06:37', '2020', '2021'),
('SIS0000001', 'KLS01', 'SM01', 'KSH003', 'Kesehatan gigi', 'Baik', '2020-08-27 05:06:37', '2020', '2021'),
('SIS0000001', 'KLS01', 'SM01', 'KSH004', 'Kesehatan lainnya', 'Baik ', '2020-08-27 05:06:37', '2020', '2021'),
('SIS0000001', 'KLS01', 'SM02', 'KSH001', 'Pendengaran telinga', 'Jernih', '2020-08-28 12:08:24', '2020', '2021'),
('SIS0000001', 'KLS01', 'SM02', 'KSH002', 'Penglihatan mata', 'Jernih', '2020-08-28 12:08:24', '2020', '2021'),
('SIS0000001', 'KLS01', 'SM02', 'KSH003', 'Kesehatan gigi', 'Jernih', '2020-08-28 12:08:24', '2020', '2021'),
('SIS0000001', 'KLS01', 'SM02', 'KSH004', 'Kesehatan lainnya', 'Jernih', '2020-08-28 12:08:24', '2020', '2021'),
('SIS0000008', 'KLS01', 'SM01', 'KSH001', 'Pendengaran telinga', 'Jernih', '2020-08-28 12:29:31', '2020', '2021'),
('SIS0000008', 'KLS01', 'SM01', 'KSH002', 'Penglihatan mata', 'Jernih', '2020-08-28 12:29:31', '2020', '2021'),
('SIS0000008', 'KLS01', 'SM01', 'KSH003', 'Kesehatan gigi', 'Jernih', '2020-08-28 12:29:31', '2020', '2021'),
('SIS0000008', 'KLS01', 'SM01', 'KSH004', 'Kesehatan lainnya', 'Jernih', '2020-08-28 12:29:31', '2020', '2021'),
('SIS0000008', 'KLS01', 'SM02', 'KSH001', 'Pendengaran telinga', 'Jernih', '2020-08-28 12:32:35', '2020', '2021'),
('SIS0000008', 'KLS01', 'SM02', 'KSH002', 'Penglihatan mata', 'Jernih', '2020-08-28 12:32:35', '2020', '2021'),
('SIS0000008', 'KLS01', 'SM02', 'KSH003', 'Kesehatan gigi', 'Jernih', '2020-08-28 12:32:35', '2020', '2021'),
('SIS0000008', 'KLS01', 'SM02', 'KSH004', 'Kesehatan lainnya', 'Jernih', '2020-08-28 12:32:35', '2020', '2021'),
('SIS0000007', 'KLS06', 'SM02', 'KSH001', 'Pendengaran telinga', 'Jernih', '2020-08-31 05:14:49', '2020', '2021'),
('SIS0000007', 'KLS06', 'SM02', 'KSH002', 'Penglihatan mata', 'Jernih', '2020-08-31 05:14:49', '2020', '2021'),
('SIS0000007', 'KLS06', 'SM02', 'KSH003', 'Kesehatan gigi', 'Jernih', '2020-08-31 05:14:49', '2020', '2021'),
('SIS0000007', 'KLS06', 'SM02', 'KSH004', 'Kesehatan lainnya', '-', '2020-08-31 05:14:49', '2020', '2021'),
('SIS0000007', 'KLS06', 'SM01', 'KSH001', 'Pendengaran telinga', 'Jernih', '2020-08-31 05:30:07', '2020', '2021'),
('SIS0000007', 'KLS06', 'SM01', 'KSH002', 'Penglihatan mata', 'Jernih', '2020-08-31 05:30:07', '2020', '2021'),
('SIS0000007', 'KLS06', 'SM01', 'KSH003', 'Kesehatan gigi', 'Jernih', '2020-08-31 05:30:07', '2020', '2021'),
('SIS0000007', 'KLS06', 'SM01', 'KSH004', 'Kesehatan lainnya', 'Jernih', '2020-08-31 05:30:07', '2020', '2021'),
('SIS0000003', 'KLS03', 'SM01', 'KSH001', 'Pendengaran telinga', 'Jernih', '2020-09-08 10:35:22', '2020', '2021'),
('SIS0000003', 'KLS03', 'SM01', 'KSH002', 'Penglihatan mata', 'Jernih', '2020-09-08 10:35:22', '2020', '2021'),
('SIS0000003', 'KLS03', 'SM01', 'KSH003', 'Kesehatan gigi', 'Jernih', '2020-09-08 10:35:22', '2020', '2021'),
('SIS0000003', 'KLS03', 'SM01', 'KSH004', 'Kesehatan lainnya', 'Jernih', '2020-09-08 10:35:22', '2020', '2021');

-- --------------------------------------------------------

--
-- Struktur dari tabel `per_prestasi`
--

CREATE TABLE `per_prestasi` (
  `id_siswa` char(15) CHARACTER SET latin1 NOT NULL,
  `id_kelas` char(15) CHARACTER SET latin1 NOT NULL,
  `id_semester` char(15) CHARACTER SET latin1 NOT NULL,
  `id_prestasi` char(15) CHARACTER SET latin1 NOT NULL,
  `jenis_prestasi` varchar(225) CHARACTER SET latin1 NOT NULL,
  `keterangan` varchar(225) CHARACTER SET latin1 NOT NULL,
  `tgl_raport` varchar(225) CHARACTER SET latin1 NOT NULL,
  `tahun_ajaran_awal` varchar(225) CHARACTER SET latin1 NOT NULL,
  `tahun_ajaran_akhir` varchar(225) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `per_prestasi`
--

INSERT INTO `per_prestasi` (`id_siswa`, `id_kelas`, `id_semester`, `id_prestasi`, `jenis_prestasi`, `keterangan`, `tgl_raport`, `tahun_ajaran_awal`, `tahun_ajaran_akhir`) VALUES
('SIS0000001', 'KLS01', 'SM01', 'PRS001', 'Olahraga pagi', 'Juara II', '2020-08-27 05:07:26', '2020', '2021'),
('SIS0000001', 'KLS01', 'SM01', 'PRS002', 'Kesenian tari', 'Juara II', '2020-08-27 05:07:26', '2020', '2021'),
('SIS0000001', 'KLS01', 'SM01', 'PRS003', 'Keagamaan', '-', '2020-08-27 05:07:26', '2020', '2021'),
('SIS0000001', 'KLS01', 'SM01', 'PRS004', 'OSN', 'Juara II', '2020-08-27 05:07:26', '2020', '2021'),
('SIS0000001', 'KLS01', 'SM02', 'PRS001', 'Olahraga pagi', 'Juara II', '2020-08-28 12:09:05', '2020', '2021'),
('SIS0000001', 'KLS01', 'SM02', 'PRS002', 'Kesenian tari', 'Juara II', '2020-08-28 12:09:05', '2020', '2021'),
('SIS0000001', 'KLS01', 'SM02', 'PRS003', 'Keagamaan', 'Juara II', '2020-08-28 12:09:05', '2020', '2021'),
('SIS0000001', 'KLS01', 'SM02', 'PRS004', 'OSN', '-', '2020-08-28 12:09:05', '2020', '2021'),
('SIS0000008', 'KLS01', 'SM01', 'PRS001', 'Olahraga pagi', 'Juara II', '2020-08-28 12:29:47', '2020', '2021'),
('SIS0000008', 'KLS01', 'SM01', 'PRS002', 'Kesenian tari', 'Juara II', '2020-08-28 12:29:47', '2020', '2021'),
('SIS0000008', 'KLS01', 'SM01', 'PRS003', 'Keagamaan', 'Juara II', '2020-08-28 12:29:47', '2020', '2021'),
('SIS0000008', 'KLS01', 'SM01', 'PRS004', 'OSN', '-', '2020-08-28 12:29:47', '2020', '2021'),
('SIS0000008', 'KLS01', 'SM02', 'PRS001', 'Olahraga pagi', 'Juara II', '2020-08-28 12:32:49', '2020', '2021'),
('SIS0000008', 'KLS01', 'SM02', 'PRS002', 'Kesenian tari', 'Juara II', '2020-08-28 12:32:49', '2020', '2021'),
('SIS0000008', 'KLS01', 'SM02', 'PRS003', 'Keagamaan', 'Juara II', '2020-08-28 12:32:49', '2020', '2021'),
('SIS0000008', 'KLS01', 'SM02', 'PRS004', 'OSN', '-', '2020-08-28 12:32:49', '2020', '2021'),
('SIS0000007', 'KLS06', 'SM02', 'PRS001', 'Olahraga pagi', 'Juara II', '2020-08-31 05:15:27', '2020', '2021'),
('SIS0000007', 'KLS06', 'SM02', 'PRS002', 'Kesenian tari', 'Juara II', '2020-08-31 05:15:27', '2020', '2021'),
('SIS0000007', 'KLS06', 'SM02', 'PRS003', 'Keagamaan', 'Juara II', '2020-08-31 05:15:27', '2020', '2021'),
('SIS0000007', 'KLS06', 'SM02', 'PRS004', 'OSN', 'Juara II', '2020-08-31 05:15:27', '2020', '2021'),
('SIS0000007', 'KLS06', 'SM01', 'PRS001', 'Olahraga pagi', 'Juara II', '2020-08-31 05:30:25', '2020', '2021'),
('SIS0000007', 'KLS06', 'SM01', 'PRS002', 'Kesenian tari', 'Juara II', '2020-08-31 05:30:25', '2020', '2021'),
('SIS0000007', 'KLS06', 'SM01', 'PRS003', 'Keagamaan', 'Juara II', '2020-08-31 05:30:25', '2020', '2021'),
('SIS0000007', 'KLS06', 'SM01', 'PRS004', 'OSN', 'Juara II', '2020-08-31 05:30:25', '2020', '2021'),
('SIS0000003', 'KLS03', 'SM01', 'PRS001', 'Olahraga pagi', 'Juara II', '2020-09-08 10:35:51', '2020', '2021'),
('SIS0000003', 'KLS03', 'SM01', 'PRS002', 'Kesenian tari', 'Juara II', '2020-09-08 10:35:51', '2020', '2021'),
('SIS0000003', 'KLS03', 'SM01', 'PRS003', 'Keagamaan', 'Juara II', '2020-09-08 10:35:51', '2020', '2021'),
('SIS0000003', 'KLS03', 'SM01', 'PRS004', 'OSN', '-', '2020-09-08 10:35:51', '2020', '2021');

-- --------------------------------------------------------

--
-- Struktur dari tabel `position`
--

CREATE TABLE `position` (
  `id_position` char(15) CHARACTER SET latin1 NOT NULL,
  `name_position` varchar(20) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `position`
--

INSERT INTO `position` (`id_position`, `name_position`) VALUES
('PS01', 'Staff Tu'),
('PS02', 'Kepala Sekolah'),
('PS03', 'Guru Kelas'),
('PS04', 'Guru Mapel');

-- --------------------------------------------------------

--
-- Struktur dari tabel `prestasi`
--

CREATE TABLE `prestasi` (
  `id_prestasi` char(15) CHARACTER SET latin1 NOT NULL,
  `no` varchar(6) CHARACTER SET latin1 NOT NULL,
  `jenis_prestasi` varchar(35) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `prestasi`
--

INSERT INTO `prestasi` (`id_prestasi`, `no`, `jenis_prestasi`) VALUES
('PRS001', '1', 'Olahraga pagi'),
('PRS002', '2', 'Kesenian tari'),
('PRS003', '3', 'Keagamaan'),
('PRS004', '4', 'OSN');

-- --------------------------------------------------------

--
-- Struktur dari tabel `roles_mapel`
--

CREATE TABLE `roles_mapel` (
  `id_roles_mpl` int(15) NOT NULL,
  `id_kelas` char(15) CHARACTER SET latin1 NOT NULL,
  `id_semester` char(15) CHARACTER SET latin1 NOT NULL,
  `id_mapel` char(15) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `roles_mapel`
--

INSERT INTO `roles_mapel` (`id_roles_mpl`, `id_kelas`, `id_semester`, `id_mapel`) VALUES
(1, 'KLS01', 'SM01', 'MPL01'),
(2, 'KLS01', 'SM01', 'MPL02'),
(3, 'KLS01', 'SM01', 'MPL03'),
(4, 'KLS01', 'SM01', 'MPL04'),
(5, 'KLS01', 'SM01', 'MPL05'),
(6, 'KLS01', 'SM01', 'MPL06'),
(7, 'KLS01', 'SM01', 'MPL07'),
(116, 'KLS01', 'SM01', 'MPL10'),
(9, 'KLS01', 'SM02', 'MPL01'),
(10, 'KLS01', 'SM02', 'MPL02'),
(11, 'KLS01', 'SM02', 'MPL03'),
(12, 'KLS01', 'SM02', 'MPL04'),
(13, 'KLS01', 'SM02', 'MPL05'),
(14, 'KLS01', 'SM02', 'MPL06'),
(15, 'KLS01', 'SM02', 'MPL07'),
(17, 'KLS02', 'SM01', 'MPL01'),
(18, 'KLS02', 'SM01', 'MPL02'),
(19, 'KLS02', 'SM01', 'MPL03'),
(20, 'KLS02', 'SM01', 'MPL04'),
(21, 'KLS02', 'SM01', 'MPL05'),
(22, 'KLS02', 'SM01', 'MPL06'),
(25, 'KLS02', 'SM02', 'MPL01'),
(26, 'KLS02', 'SM02', 'MPL02'),
(27, 'KLS02', 'SM02', 'MPL03'),
(28, 'KLS02', 'SM02', 'MPL04'),
(29, 'KLS02', 'SM02', 'MPL05'),
(30, 'KLS02', 'SM02', 'MPL06'),
(33, 'KLS03', 'SM01', 'MPL01'),
(34, 'KLS03', 'SM01', 'MPL02'),
(35, 'KLS03', 'SM01', 'MPL03'),
(36, 'KLS03', 'SM01', 'MPL04'),
(37, 'KLS03', 'SM01', 'MPL05'),
(38, 'KLS03', 'SM01', 'MPL06'),
(117, 'KLS03', 'SM01', 'MPL07'),
(41, 'KLS03', 'SM02', 'MPL01'),
(42, 'KLS03', 'SM02', 'MPL02'),
(43, 'KLS03', 'SM02', 'MPL03'),
(44, 'KLS03', 'SM02', 'MPL04'),
(45, 'KLS03', 'SM02', 'MPL05'),
(46, 'KLS03', 'SM02', 'MPL06'),
(49, 'KLS04', 'SM01', 'MPL01'),
(50, 'KLS04', 'SM01', 'MPL02'),
(51, 'KLS04', 'SM01', 'MPL03'),
(52, 'KLS04', 'SM01', 'MPL04'),
(53, 'KLS04', 'SM01', 'MPL05'),
(54, 'KLS04', 'SM01', 'MPL06'),
(57, 'KLS04', 'SM02', 'MPL01'),
(58, 'KLS04', 'SM02', 'MPL02'),
(59, 'KLS04', 'SM02', 'MPL03'),
(60, 'KLS04', 'SM02', 'MPL04'),
(61, 'KLS04', 'SM02', 'MPL05'),
(62, 'KLS04', 'SM02', 'MPL06'),
(65, 'KLS05', 'SM01', 'MPL01'),
(66, 'KLS05', 'SM01', 'MPL02'),
(67, 'KLS05', 'SM01', 'MPL03'),
(68, 'KLS05', 'SM01', 'MPL04'),
(69, 'KLS05', 'SM01', 'MPL05'),
(70, 'KLS05', 'SM01', 'MPL06'),
(73, 'KLS05', 'SM02', 'MPL01'),
(74, 'KLS05', 'SM02', 'MPL02'),
(75, 'KLS05', 'SM02', 'MPL03'),
(76, 'KLS05', 'SM02', 'MPL04'),
(77, 'KLS05', 'SM02', 'MPL05'),
(78, 'KLS05', 'SM02', 'MPL06'),
(81, 'KLS06', 'SM01', 'MPL01'),
(82, 'KLS06', 'SM01', 'MPL02'),
(83, 'KLS06', 'SM01', 'MPL03'),
(84, 'KLS06', 'SM01', 'MPL04'),
(85, 'KLS06', 'SM01', 'MPL05'),
(86, 'KLS06', 'SM01', 'MPL06'),
(89, 'KLS06', 'SM02', 'MPL01'),
(90, 'KLS06', 'SM02', 'MPL02'),
(91, 'KLS06', 'SM02', 'MPL03'),
(92, 'KLS06', 'SM02', 'MPL04'),
(93, 'KLS06', 'SM02', 'MPL05'),
(94, 'KLS06', 'SM02', 'MPL06');

-- --------------------------------------------------------

--
-- Struktur dari tabel `saran`
--

CREATE TABLE `saran` (
  `id_saran` char(15) CHARACTER SET latin1 NOT NULL,
  `id_siswa` char(15) CHARACTER SET latin1 NOT NULL,
  `saran` text CHARACTER SET latin1 NOT NULL,
  `id_kelas` char(15) CHARACTER SET latin1 NOT NULL,
  `id_semester` char(15) CHARACTER SET latin1 NOT NULL,
  `tgl_raport` varchar(225) CHARACTER SET latin1 NOT NULL,
  `tahun_ajaran_awal` varchar(225) CHARACTER SET latin1 NOT NULL,
  `tahun_ajaran_akhir` varchar(225) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `saran`
--

INSERT INTO `saran` (`id_saran`, `id_siswa`, `saran`, `id_kelas`, `id_semester`, `tgl_raport`, `tahun_ajaran_awal`, `tahun_ajaran_akhir`) VALUES
('SRN0001', 'SIS0000001', '(1). Ananda Siswa 1 mendapatkan nilai raya-rata pengetahuan 81 dan nilai rata-rata keterampilan 82 dengan rata-rata kompetensi pengetahuan dan keterampilan : 82 dan mendapatkan perinkat /Ranking : 2. \r\n(2). Andanda Siswa 1 memiliki berat badan : 90cm dan berat badan : 45kg \r\n(3). Ketidak hadiran ananda Siswa 1 dengan Sakit : 1kali Ijin : 2kali Tanpa keterangan : 1kali dan total sebanyak : 4kali.', 'KLS01', 'SM01', '2020-08-24 01:25:57', '2021', '2022');

-- --------------------------------------------------------

--
-- Struktur dari tabel `satuan_kkm`
--

CREATE TABLE `satuan_kkm` (
  `id_kkm` int(15) NOT NULL,
  `sa` int(15) NOT NULL,
  `satuan_p` int(15) NOT NULL,
  `p_interval` int(15) NOT NULL,
  `sb` int(15) NOT NULL,
  `ba` int(15) NOT NULL,
  `bb` int(15) NOT NULL,
  `ca` int(15) NOT NULL,
  `cb` int(15) NOT NULL,
  `pa` int(15) NOT NULL,
  `pb` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `satuan_kkm`
--

INSERT INTO `satuan_kkm` (`id_kkm`, `sa`, `satuan_p`, `p_interval`, `sb`, `ba`, `bb`, `ca`, `cb`, `pa`, `pb`) VALUES
(1, 90, 70, 10, 100, 80, 89, 70, 79, 0, 69);

-- --------------------------------------------------------

--
-- Struktur dari tabel `semester`
--

CREATE TABLE `semester` (
  `id_semester` char(15) CHARACTER SET latin1 NOT NULL,
  `semester` varchar(20) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `semester`
--

INSERT INTO `semester` (`id_semester`, `semester`) VALUES
('SM01', 'Semester 1'),
('SM02', 'Semester 2');

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `show_mapel_perkelas`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `show_mapel_perkelas` (
`id_mapel` char(15)
,`nama_mapel` varchar(225)
,`singkat_mapel` varchar(20)
,`kelompok` varchar(5)
,`pengetahuan` int(10)
,`keterampilan` int(10)
,`id_kelas` char(15)
,`id_semester` char(15)
);

-- --------------------------------------------------------

--
-- Struktur dari tabel `sikap_sosial`
--

CREATE TABLE `sikap_sosial` (
  `id_sosial` char(15) CHARACTER SET latin1 NOT NULL,
  `butir_sikap` varchar(225) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `sikap_sosial`
--

INSERT INTO `sikap_sosial` (`id_sosial`, `butir_sikap`) VALUES
('SS001', 'jujur'),
('SS002', 'disiplin'),
('SS003', 'percaya diri'),
('SS004', 'santun');

-- --------------------------------------------------------

--
-- Struktur dari tabel `sikap_spiritual`
--

CREATE TABLE `sikap_spiritual` (
  `id_spiritual` char(15) CHARACTER SET latin1 NOT NULL,
  `butir_sikap` varchar(225) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `sikap_spiritual`
--

INSERT INTO `sikap_spiritual` (`id_spiritual`, `butir_sikap`) VALUES
('ST001', 'Ketaatan beribadah sesuai agamannya'),
('ST002', 'Berperilaku syukur'),
('ST003', 'Berdoa sebelum dan sesudah melakukan kegiatan'),
('ST004', 'Bertoleransi dalam beribadah');

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `simple_siswa_kelas_semester`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `simple_siswa_kelas_semester` (
`id_siswa` char(15)
,`nama_siswa` varchar(100)
,`id_kelas` char(15)
,`semester` varchar(20)
);

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `siswa_kelas`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `siswa_kelas` (
`id_level_siswa` char(15)
,`id_siswa` char(15)
,`nisn` char(15)
,`nis` char(15)
,`nama_siswa` varchar(100)
,`jk` varchar(10)
,`tempat_lahir` varchar(50)
,`tanggal_lahir` varchar(225)
,`id_agama` char(15)
,`pend_sebelumnya` varchar(225)
,`alamat_serta_didik` varchar(225)
,`nama_ayah` varchar(30)
,`nama_ibu` varchar(30)
,`pekerjaan_ayah` varchar(30)
,`pekerjaan_ibu` varchar(30)
,`desa_kelurahan` varchar(30)
,`kecamatan` varchar(30)
,`kabupaten_kota` varchar(30)
,`provinsi` varchar(30)
,`no_telp_hp` char(13)
,`nama_wali` varchar(30)
,`pekerjaan_wali` varchar(30)
,`alamat_wali` varchar(225)
,`no_telp_hp_wali` char(13)
,`id_kelas` char(15)
,`kelas` varchar(20)
,`tahun_ajaran_awal` varchar(225)
,`tahun_ajaran_akhir` varchar(225)
);

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `siswa_kelas_semester`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `siswa_kelas_semester` (
`id_level_semester` char(15)
,`id_siswa` char(15)
,`nisn` char(15)
,`nis` char(15)
,`nama_siswa` varchar(100)
,`kelas` varchar(20)
,`semester` varchar(20)
,`jk` varchar(10)
,`tempat_lahir` varchar(50)
,`tanggal_lahir` varchar(225)
,`id_agama` char(15)
,`pend_sebelumnya` varchar(225)
,`alamat_serta_didik` varchar(225)
,`nama_ayah` varchar(30)
,`nama_ibu` varchar(30)
,`pekerjaan_ayah` varchar(30)
,`pekerjaan_ibu` varchar(30)
);

-- --------------------------------------------------------

--
-- Struktur dari tabel `sub_tema`
--

CREATE TABLE `sub_tema` (
  `Kode_sub_tm` char(15) CHARACTER SET latin1 NOT NULL,
  `Type_tm` char(10) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_ekskul_pil1`
--

CREATE TABLE `tb_ekskul_pil1` (
  `id_siswa` char(15) CHARACTER SET latin1 NOT NULL,
  `id_kelas` char(15) CHARACTER SET latin1 NOT NULL,
  `id_semester` char(15) CHARACTER SET latin1 NOT NULL,
  `id_ekskul_pil1` char(15) CHARACTER SET latin1 NOT NULL,
  `id_ekstra` char(15) CHARACTER SET latin1 NOT NULL,
  `kegiatan` varchar(225) CHARACTER SET latin1 NOT NULL,
  `predikat` varchar(1) NOT NULL,
  `keterangan` varchar(225) CHARACTER SET latin1 NOT NULL,
  `tgl_raport` varchar(225) CHARACTER SET latin1 NOT NULL,
  `tahun_ajaran_awal` varchar(225) CHARACTER SET latin1 NOT NULL,
  `tahun_ajaran_akhir` varchar(225) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_ekskul_pil1`
--

INSERT INTO `tb_ekskul_pil1` (`id_siswa`, `id_kelas`, `id_semester`, `id_ekskul_pil1`, `id_ekstra`, `kegiatan`, `predikat`, `keterangan`, `tgl_raport`, `tahun_ajaran_awal`, `tahun_ajaran_akhir`) VALUES
('SIS0000001', 'KLS01', 'SM02', 'EKSPA0000005', 'EKS005', 'Basket', 'A', 'Ananda caroline benneta irawan  Passing, Passing, Memegang bola. dan Ananda memperoleh predikat : A', '2020-08-28 12:07:29', '2020', '2021'),
('SIS0000008', 'KLS01', 'SM01', 'EKSPA0000006', 'EKS002', 'Tenis Meja', 'A', 'Ananda Debora Naria Simamora  Chop, Chop, Chop. dan Ananda memperoleh predikat : A', '2020-08-28 12:28:46', '2020', '2021'),
('SIS0000008', 'KLS01', 'SM02', 'EKSPA0000007', 'EKS004', 'Catur', 'B', 'Ananda Debora Naria Simamora  Menyusun buah catur, Rokade, Membuka permainan. dan Ananda memperoleh predikat : B', '2020-08-28 12:31:50', '2020', '2021'),
('SIS0000007', 'KLS06', 'SM02', 'EKSPA0000009', 'EKS002', 'Tenis Meja', 'C', 'Ananda Arip hidayat Sangat baik dalam Topspin, Bail Chop, dan Cukup baik Drive.', '2020-08-31 05:13:47', '2020', '2021'),
('SIS0000001', 'KLS01', 'SM01', 'EKSPA0000010', 'EKS003', 'Bulu Tangkis', 'C', 'Ananda caroline benneta irawan Sangat baik dalam Overhead, Bail Smash, dan Cukup baik Dropshot.', '2020-08-31 05:21:01', '2020', '2021'),
('SIS0000007', 'KLS06', 'SM01', 'EKSPA0000011', 'EKS003', 'Bulu Tangkis', 'C', 'Ananda Arip hidayat Sangat baik dalam Overhead, Bail Smash, dan Cukup baik Dropshot.', '2020-08-31 05:29:17', '2020', '2021'),
('SIS0000003', 'KLS03', 'SM01', 'EKSPA0000012', 'EKS003', 'Bulu Tangkis', 'A', 'Ananda Siswa 3 Cukup baik dalam Overhead, Bail Smash, dan Sangat baik Dropshot.', '2020-09-08 10:34:30', '2020', '2021');

--
-- Trigger `tb_ekskul_pil1`
--
DELIMITER $$
CREATE TRIGGER `per_ekskul_from pil1` AFTER INSERT ON `tb_ekskul_pil1` FOR EACH ROW BEGIN
	INSERT INTO per_ekstrakurikuler 
	SET id_siswa = NEW.id_siswa, id_kelas = NEW.id_kelas, 
	id_semester = NEW.id_semester, id_ekstra = NEW.id_ekstra, 
	kegiatan = NEW.kegiatan, predikat = NEW.predikat,
	keterangan = NEW.keterangan, 
	tgl_raport = NEW.tgl_raport, 
	tahun_ajaran_awal = NEW.tahun_ajaran_awal, tahun_ajaran_akhir = NEW.tahun_ajaran_akhir;
    END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_ekskul_pil2`
--

CREATE TABLE `tb_ekskul_pil2` (
  `id_siswa` char(15) CHARACTER SET latin1 NOT NULL,
  `id_kelas` char(15) CHARACTER SET latin1 NOT NULL,
  `id_semester` char(15) CHARACTER SET latin1 NOT NULL,
  `id_ekskul_pil2` char(15) CHARACTER SET latin1 NOT NULL,
  `id_ekstra` char(15) CHARACTER SET latin1 NOT NULL,
  `kegiatan` varchar(225) CHARACTER SET latin1 NOT NULL,
  `predikat` varchar(1) NOT NULL,
  `keterangan` varchar(225) CHARACTER SET latin1 NOT NULL,
  `tgl_raport` varchar(225) CHARACTER SET latin1 NOT NULL,
  `tahun_ajaran_awal` varchar(225) CHARACTER SET latin1 NOT NULL,
  `tahun_ajaran_akhir` varchar(225) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_ekskul_pil2`
--

INSERT INTO `tb_ekskul_pil2` (`id_siswa`, `id_kelas`, `id_semester`, `id_ekskul_pil2`, `id_ekstra`, `kegiatan`, `predikat`, `keterangan`, `tgl_raport`, `tahun_ajaran_awal`, `tahun_ajaran_akhir`) VALUES
('SIS0000001', 'KLS01', 'SM02', 'EKSPB0000005', 'EKS010', 'DrumBand', 'A', 'Ananda caroline benneta irawan  Gripping, Single stroke satu tangan, Single stroke satu tangan. dan Ananda memperoleh predikat : A', '2020-08-28 12:07:29', '2020', '2021'),
('SIS0000008', 'KLS01', 'SM01', 'EKSPB0000006', 'EKS010', 'DrumBand', 'B', 'Ananda Debora Naria Simamora  Gripping, Single stroke satu tangan, Single stroke dua tangan. dan Ananda memperoleh predikat : B', '2020-08-28 12:28:46', '2020', '2021'),
('SIS0000008', 'KLS01', 'SM02', 'EKSPB0000007', 'EKS009', 'Seni Vocal', 'A', 'Ananda Debora Naria Simamora  artikulasi, artikulasi, Intonasi. dan Ananda memperoleh predikat : A', '2020-08-28 12:31:50', '2020', '2021'),
('SIS0000007', 'KLS06', 'SM02', 'EKSPB0000009', 'EKS009', 'Seni Vocal', 'B', 'Ananda Arip hidayat Sangat baik dalam Intonasi, Bail artikulasi, dan Cukup baik resonasi.', '2020-08-31 05:13:47', '2020', '2021'),
('SIS0000001', 'KLS01', 'SM01', 'EKSPB0000010', 'EKS009', 'Seni Vocal', 'B', 'Ananda caroline benneta irawan Sangat baik dalam artikulasi, Bail Intonasi, dan Bail resonasi.', '2020-08-31 05:21:01', '2020', '2021'),
('SIS0000007', 'KLS06', 'SM01', 'EKSPB0000011', 'EKS009', 'Seni Vocal', 'B', 'Ananda Arip hidayat Sangat baik dalam Intonasi, Bail artikulasi, dan Cukup baik resonasi.', '2020-08-31 05:29:17', '2020', '2021'),
('SIS0000003', 'KLS03', 'SM01', 'EKSPB0000012', 'EKS009', 'Seni Vocal', 'B', 'Ananda Siswa 3 Sangat baik dalam artikulasi, Bail artikulasi, dan Cukup baik pernapasan.', '2020-09-08 10:34:30', '2020', '2021');

--
-- Trigger `tb_ekskul_pil2`
--
DELIMITER $$
CREATE TRIGGER `per_ekskul_from_pil2` AFTER INSERT ON `tb_ekskul_pil2` FOR EACH ROW BEGIN
	INSERT INTO per_ekstrakurikuler 
	SET id_siswa = NEW.id_siswa, id_kelas = NEW.id_kelas, 
	id_semester = NEW.id_semester, id_ekstra = NEW.id_ekstra, 
	kegiatan = NEW.kegiatan, predikat = NEW.predikat,
	keterangan = NEW.keterangan, 
	tgl_raport = NEW.tgl_raport, 
	tahun_ajaran_awal = NEW.tahun_ajaran_awal, tahun_ajaran_akhir = NEW.tahun_ajaran_akhir;
    END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_ekskul_pil3`
--

CREATE TABLE `tb_ekskul_pil3` (
  `id_siswa` char(15) CHARACTER SET latin1 NOT NULL,
  `id_kelas` char(15) CHARACTER SET latin1 NOT NULL,
  `id_semester` char(15) CHARACTER SET latin1 NOT NULL,
  `id_ekskul_pil3` char(15) CHARACTER SET latin1 NOT NULL,
  `id_ekstra` char(15) CHARACTER SET latin1 NOT NULL,
  `kegiatan` varchar(225) CHARACTER SET latin1 NOT NULL,
  `predikat` varchar(1) NOT NULL,
  `keterangan` varchar(225) CHARACTER SET latin1 NOT NULL,
  `tgl_raport` varchar(225) CHARACTER SET latin1 NOT NULL,
  `tahun_ajaran_awal` varchar(225) CHARACTER SET latin1 NOT NULL,
  `tahun_ajaran_akhir` varchar(225) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_ekskul_pil3`
--

INSERT INTO `tb_ekskul_pil3` (`id_siswa`, `id_kelas`, `id_semester`, `id_ekskul_pil3`, `id_ekstra`, `kegiatan`, `predikat`, `keterangan`, `tgl_raport`, `tahun_ajaran_awal`, `tahun_ajaran_akhir`) VALUES
('SIS0000001', 'KLS01', 'SM02', 'EKSPC0000005', 'EKS020', 'Komputer', 'A', 'Ananda caroline benneta irawan  mengetik teks, mengetik teks, mengetik teks. dan Ananda memperoleh predikat : A', '2020-08-28 12:07:29', '2020', '2021'),
('SIS0000008', 'KLS01', 'SM01', 'EKSPC0000006', 'EKS020', 'Komputer', 'A', 'Ananda Debora Naria Simamora  menggambar bangun datar, mengetik teks, mewarnai gambar. dan Ananda memperoleh predikat : A', '2020-08-28 12:28:46', '2020', '2021'),
('SIS0000008', 'KLS01', 'SM02', 'EKSPC0000007', 'EKS020', 'Komputer', 'A', 'Ananda Debora Naria Simamora  menggambar bangun datar, mengetik teks, mewarnai gambar. dan Ananda memperoleh predikat : A', '2020-08-28 12:31:50', '2020', '2021'),
('SIS0000007', 'KLS06', 'SM02', 'EKSPC0000009', 'EKS020', 'Komputer', 'C', 'Ananda Arip hidayat Sangat baik dalam menggambar bangun datar, Bail mengetik teks, dan Cukup baik mewarnai gambar.', '2020-08-31 05:13:47', '2020', '2021'),
('SIS0000001', 'KLS01', 'SM01', 'EKSPC0000010', 'EKS020', 'Komputer', 'C', 'Ananda caroline benneta irawan Sangat baik dalam menggambar bangun datar, Bail mengetik teks, dan Cukup baik mewarnai gambar.', '2020-08-31 05:21:01', '2020', '2021'),
('SIS0000007', 'KLS06', 'SM01', 'EKSPC0000011', 'EKS020', 'Komputer', 'C', 'Ananda Arip hidayat Sangat baik dalam menggambar bangun datar, Bail menggambar bangun datar, dan Cukup baik mewarnai gambar.', '2020-08-31 05:29:17', '2020', '2021'),
('SIS0000003', 'KLS03', 'SM01', 'EKSPC0000012', 'EKS023', 'Science', 'C', 'Ananda Siswa 3 Sangat baik dalam Muatan Nilai 9, Bail Muatan Nilai 9, dan Cukup baik Muatan Nilai 8.', '2020-09-08 10:34:30', '2020', '2021');

--
-- Trigger `tb_ekskul_pil3`
--
DELIMITER $$
CREATE TRIGGER `per_ekskul_from_pil3` AFTER INSERT ON `tb_ekskul_pil3` FOR EACH ROW BEGIN
	INSERT INTO per_ekstrakurikuler 
	SET id_siswa = NEW.id_siswa, id_kelas = NEW.id_kelas, 
	id_semester = NEW.id_semester, id_ekstra = NEW.id_ekstra, 
	kegiatan = NEW.kegiatan, predikat = NEW.predikat,
	keterangan = NEW.keterangan, 
	tgl_raport = NEW.tgl_raport, 
	tahun_ajaran_awal = NEW.tahun_ajaran_awal, tahun_ajaran_akhir = NEW.tahun_ajaran_akhir;
    END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_ekskul_wajib`
--

CREATE TABLE `tb_ekskul_wajib` (
  `id_siswa` char(15) CHARACTER SET latin1 NOT NULL,
  `id_kelas` char(15) CHARACTER SET latin1 NOT NULL,
  `id_semester` char(15) CHARACTER SET latin1 NOT NULL,
  `id_ekskul_wajib` char(15) CHARACTER SET latin1 NOT NULL,
  `id_ekstra` char(15) CHARACTER SET latin1 NOT NULL,
  `kegiatan` varchar(225) CHARACTER SET latin1 NOT NULL,
  `predikat` varchar(1) NOT NULL,
  `keterangan` varchar(225) CHARACTER SET latin1 NOT NULL,
  `tgl_raport` varchar(225) CHARACTER SET latin1 NOT NULL,
  `tahun_ajaran_awal` varchar(225) CHARACTER SET latin1 NOT NULL,
  `tahun_ajaran_akhir` varchar(225) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_ekskul_wajib`
--

INSERT INTO `tb_ekskul_wajib` (`id_siswa`, `id_kelas`, `id_semester`, `id_ekskul_wajib`, `id_ekstra`, `kegiatan`, `predikat`, `keterangan`, `tgl_raport`, `tahun_ajaran_awal`, `tahun_ajaran_akhir`) VALUES
('SIS0000001', 'KLS01', 'SM02', 'EKSWJ0000005', 'EKS001', 'Pramuka', 'A', 'Ananda caroline benneta irawan  Suci Dalam Pikiran ku, Suci Dalam Perkataan, dapat di percaya. dan Ananda memperoleh predikat : A', '2020-08-28 12:07:29', '2020', '2021'),
('SIS0000008', 'KLS01', 'SM01', 'EKSWJ0000006', 'EKS001', 'Pramuka', 'A', 'Ananda Debora Naria Simamora  Suci Dalam Pikiran ku, Suci Dalam Pikiran ku, Suci Dalam Perkataan. dan Ananda memperoleh predikat : A', '2020-08-28 12:28:46', '2020', '2021'),
('SIS0000008', 'KLS01', 'SM02', 'EKSWJ0000007', 'EKS001', 'Pramuka', 'B', 'Ananda Debora Naria Simamora  Suci Dalam Pikiran ku, Suci Dalam Perkataan, Cinta pada alam ku. dan Ananda memperoleh predikat : B', '2020-08-28 12:31:50', '2020', '2021'),
('SIS0000007', 'KLS06', 'SM02', 'EKSWJ0000009', 'EKS001', 'Pramuka', 'C', 'Ananda Arip hidayat Sangat baik  dalam Cinta tanah air, Baik dapat di percaya, dan Cukup baik komunikatif.', '2020-08-31 05:13:47', '2020', '2021'),
('SIS0000001', 'KLS01', 'SM01', 'EKSWJ0000010', 'EKS001', 'Pramuka', 'C', 'Ananda caroline benneta irawan Sangat baik  dalam dapat di percaya, Baik Cinta pada alam ku, dan Cukup baik Cinta sesama manusia.', '2020-08-31 05:21:01', '2020', '2021'),
('SIS0000007', 'KLS06', 'SM01', 'EKSWJ0000011', 'EKS001', 'Pramuka', 'C', 'Ananda Arip hidayat Sangat baik  dalam dapat di percaya, Baik Cinta pada alam ku, dan Cukup baik Cinta tanah air.', '2020-08-31 05:29:17', '2020', '2021'),
('SIS0000003', 'KLS03', 'SM01', 'EKSWJ0000012', 'EKS001', 'Pramuka', 'A', 'Ananda Siswa 3 Cukup baik dalam Suci Dalam Perkataan, Baik Suci Dalam Perbuatan, dan Sangat baik Cinta pada alam ku.', '2020-09-08 10:34:30', '2020', '2021');

--
-- Trigger `tb_ekskul_wajib`
--
DELIMITER $$
CREATE TRIGGER `per_ekskul_from_wajib` AFTER INSERT ON `tb_ekskul_wajib` FOR EACH ROW BEGIN
	insert into per_ekstrakurikuler 
	set id_siswa = NEW.id_siswa, id_kelas = NEW.id_kelas, 
	id_semester = NEW.id_semester, id_ekstra = NEW.id_ekstra, 
	kegiatan = NEW.kegiatan, predikat = NEW.predikat,
	keterangan = NEW.keterangan, 
	tgl_raport = NEW.tgl_raport, 
	tahun_ajaran_awal = NEW.tahun_ajaran_awal, tahun_ajaran_akhir = NEW.tahun_ajaran_akhir;
    END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_muatan_nilai`
--

CREATE TABLE `tb_muatan_nilai` (
  `id_muatan` int(15) NOT NULL,
  `id_ekstra` char(15) CHARACTER SET latin1 NOT NULL,
  `teknik_muatan` char(225) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_muatan_nilai`
--

INSERT INTO `tb_muatan_nilai` (`id_muatan`, `id_ekstra`, `teknik_muatan`) VALUES
(1, 'EKS001', 'Suci Dalam Pikiran ku'),
(2, 'EKS001', 'Suci Dalam Perkataan'),
(3, 'EKS001', 'Suci Dalam Perbuatan'),
(4, 'EKS001', 'Cinta pada alam ku'),
(5, 'EKS001', 'dapat di percaya'),
(6, 'EKS001', 'Cinta tanah air'),
(7, 'EKS001', 'Cinta sesama manusia'),
(8, 'EKS001', 'sadar kewajiban dan hak'),
(9, 'EKS001', 'komunikatif'),
(10, 'EKS001', 'sportif'),
(11, 'EKS001', 'Pantang menyerah'),
(12, 'EKS001', 'rela berkorban'),
(13, 'EKS001', 'Cinta tradisi'),
(14, 'EKS001', 'Cermat'),
(15, 'EKS001', 'Sopan, santun'),
(16, 'EKS001', 'Partisipatif'),
(17, 'EKS001', 'Tanggap'),
(18, 'EKS001', 'Terampil'),
(19, 'EKS001', 'Mandiri'),
(20, 'EKS001', 'Ksatria'),
(21, 'EKS001', 'Taat aturan'),
(22, 'EKS001', 'menghargai'),
(23, 'EKS001', 'cakap'),
(24, 'EKS001', 'cekatan'),
(25, 'EKS001', 'kreatif'),
(26, 'EKS001', 'inovatif'),
(27, 'EKS001', 'produktif'),
(28, 'EKS001', 'bijaksana'),
(29, 'EKS001', 'bersahaja'),
(30, 'EKS001', 'terbuka'),
(31, 'EKS002', 'Topspin'),
(32, 'EKS002', 'Chop'),
(33, 'EKS002', 'Drive'),
(34, 'EKS002', 'Push'),
(35, 'EKS003', 'Overhead'),
(36, 'EKS003', 'Smash'),
(37, 'EKS003', 'Dropshot'),
(38, 'EKS003', 'Netting'),
(39, 'EKS004', 'Menyusun buah catur'),
(40, 'EKS004', 'Membuka permainan'),
(41, 'EKS004', 'Menentukan tingkah permainan'),
(42, 'EKS004', 'Langkah buah catur'),
(43, 'EKS004', 'Promosi poin'),
(44, 'EKS004', 'Melawan Poin'),
(45, 'EKS004', 'Rokade'),
(46, 'EKS004', 'Skakmat'),
(47, 'EKS004', 'Melindungi raja'),
(48, 'EKS005', 'Memegang bola'),
(49, 'EKS005', 'Passing'),
(50, 'EKS005', 'Catching'),
(51, 'EKS005', 'Dribilling'),
(52, 'EKS005', 'Shooting'),
(53, 'EKS005', 'Rebound'),
(54, 'EKS005', 'Fade Away'),
(55, 'EKS005', 'Hook Shot'),
(56, 'EKS005', 'Crossover'),
(57, 'EKS005', 'Slam Dung'),
(58, 'EKS006', 'Menendang bola'),
(59, 'EKS006', 'Menggiring bola'),
(60, 'EKS006', 'Menghentikan bola'),
(61, 'EKS006', 'mengumpan bola'),
(62, 'EKS006', 'Menyundul bola'),
(63, 'EKS006', 'lemparan ke dalam'),
(64, 'EKS006', 'menyapu bola'),
(65, 'EKS006', 'tendangan pojok'),
(66, 'EKS007', 'Kuhon'),
(67, 'EKS007', 'Kumite'),
(68, 'EKS007', 'Kata'),
(69, 'EKS007', 'Dachi'),
(70, 'EKS007', 'Zuki'),
(71, 'EKS007', 'Geri'),
(72, 'EKS007', 'Uke'),
(73, 'EKS008', 'Teknik dasar 1'),
(74, 'EKS008', 'Teknik dasar 2'),
(75, 'EKS008', 'Teknik dasar 3'),
(76, 'EKS008', 'Teknik dasar 4'),
(77, 'EKS008', 'Teknik dasar 5'),
(78, 'EKS009', 'Intonasi'),
(79, 'EKS009', 'artikulasi'),
(80, 'EKS009', 'resonasi'),
(81, 'EKS009', 'pernapasan'),
(82, 'EKS009', 'pembawaan'),
(83, 'EKS010', 'Gripping'),
(84, 'EKS010', 'Single stroke satu tangan'),
(85, 'EKS010', 'Single stroke dua tangan'),
(86, 'EKS010', 'gabungan single stroke satu tangan dengan dua tangan'),
(87, 'EKS011', 'aquarel'),
(88, 'EKS011', 'plaket'),
(89, 'EKS011', 'spray'),
(90, 'EKS011', 'pointilis'),
(91, 'EKS011', 'tempera'),
(92, 'EKS012', 'Keindahan gerak'),
(93, 'EKS012', 'Kesesuaian dengan musik'),
(94, 'EKS012', 'ekspresi'),
(95, 'EKS013', 'Teknik dasar 1'),
(96, 'EKS013', 'Teknik dasar 2'),
(97, 'EKS013', 'Teknik dasar 3'),
(98, 'EKS013', 'Teknik dasar 4'),
(99, 'EKS013', 'Teknik dasar 5'),
(100, 'EKS013', 'Teknik dasar 6'),
(101, 'EKS014', 'Hafal bacaan sholat'),
(102, 'EKS014', 'mampu melakukan wudlu dengan benar'),
(103, 'EKS014', 'mampu melakukan gerakan sholat dengan benar'),
(104, 'EKS014', 'Hafal 5 surat Al-Quran sesuai makhroj dan tajwidnya'),
(105, 'EKS014', 'Hafal doa harian'),
(106, 'EKS015', 'Mampu melakukan kompetensi 1 kristen'),
(107, 'EKS015', 'Kompetensi 2 Kristen'),
(108, 'EKS015', 'Kompetensi 3 Kristen'),
(109, 'EKS016', 'Mampu melakukan kompetensi 1 Katolik'),
(110, 'EKS016', 'kompetensi 2 Katolik'),
(111, 'EKS015', 'Kompetensi 3 Katolik'),
(112, 'EKS017', 'Mampu melakukan kompetensi 1 Hindu'),
(113, 'EKS017', 'Kompetensi 2 Hindu'),
(114, 'EKS017', 'Kompetensi 3 Hindu'),
(115, 'EKS018', 'Mampu melakukan kompetensi 1 Budha'),
(116, 'EKS018', 'Mampu melakukan kompetensi 2 Budha'),
(117, 'EKS018', 'Mampu melakukan kompetensi 3 Budha'),
(118, 'EKS019', 'Mampu melakukan kompetensi 1 Konghucu'),
(119, 'EKS019', 'Kompetensi 2 Konghucu'),
(120, 'EKS019', 'Kompetensi 3 Konghucu'),
(121, 'EKS020', 'menggambar bangun datar'),
(122, 'EKS020', 'mengetik teks'),
(123, 'EKS020', 'mewarnai gambar'),
(124, 'EKS021', 'menyebutkan abjad'),
(125, 'EKS021', 'menyebutkan bilangan s.d 20'),
(126, 'EKS021', 'menyebutkan anggota tubuh'),
(127, 'EKS021', 'manyebutkan angota keluarga'),
(128, 'EKS021', 'menyebutkan nama-nama hari'),
(129, 'EKS021', 'menyebutkan nama-nama bulan'),
(130, 'EKS022', 'Kompetensi dasar 1'),
(131, 'EKS022', 'Kompetensi dasar 2'),
(132, 'EKS022', 'Kompetensi dasar 3'),
(133, 'EKS022', 'Kompetensi dasar 4'),
(134, 'EKS022', 'Kompetensi dasar 5'),
(135, 'EKS022', 'Kompetensi dasar 6'),
(136, 'EKS022', 'Kompetensi dasar 7'),
(137, 'EKS022', 'Kompetensi dasar 8'),
(138, 'EKS022', 'Kompetensi dasar 9'),
(152, 'EKS022', 'Kompetensi dasar 10'),
(153, 'EKS023', 'Muatan Nilai 1'),
(154, 'EKS023', 'Muatan Nilai 2'),
(155, 'EKS023', 'Muatan Nilai 3'),
(156, 'EKS023', 'Muatan Nilai 4'),
(157, 'EKS023', 'Muatan Nilai 5'),
(158, 'EKS023', 'Muatan Nilai 6'),
(159, 'EKS023', 'Muatan Nilai 7'),
(160, 'EKS023', 'Muatan Nilai 8'),
(161, 'EKS023', 'Muatan Nilai 9'),
(162, 'EKS023', 'Muatan Nilai 10'),
(164, 'EKS024', 'Muatan');

-- --------------------------------------------------------

--
-- Struktur dari tabel `test`
--

CREATE TABLE `test` (
  `id_nilai` char(15) CHARACTER SET latin1 NOT NULL,
  `nilai` char(10) CHARACTER SET latin1 NOT NULL,
  `Tema1` varchar(225) CHARACTER SET latin1 DEFAULT NULL,
  `predikat` varchar(10) CHARACTER SET latin1 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `test`
--

INSERT INTO `test` (`id_nilai`, `nilai`, `Tema1`, `predikat`) VALUES
('', '', NULL, 'SB'),
('a1', '90', '90', 'SB'),
('a3', '80', '80', 'PB'),
('a4', '70', '80', 'PB');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tinggi_berat_badan`
--

CREATE TABLE `tinggi_berat_badan` (
  `id_tbb` char(15) CHARACTER SET latin1 NOT NULL,
  `id_siswa` char(15) CHARACTER SET latin1 NOT NULL,
  `tinggi_badan` char(15) CHARACTER SET latin1 NOT NULL,
  `berat_badan` char(15) CHARACTER SET latin1 NOT NULL,
  `id_kelas` char(15) CHARACTER SET latin1 NOT NULL,
  `id_semester` char(15) CHARACTER SET latin1 NOT NULL,
  `tgl_raport` varchar(225) CHARACTER SET latin1 NOT NULL,
  `tahun_ajaran_awal` varchar(225) CHARACTER SET latin1 NOT NULL,
  `tahun_ajaran_akhir` varchar(225) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tinggi_berat_badan`
--

INSERT INTO `tinggi_berat_badan` (`id_tbb`, `id_siswa`, `tinggi_badan`, `berat_badan`, `id_kelas`, `id_semester`, `tgl_raport`, `tahun_ajaran_awal`, `tahun_ajaran_akhir`) VALUES
('TBB0001', 'SIS0000001', '90', '45', 'KLS01', 'SM01', '2020-08-27 05:09:01', '2020', '2021'),
('TBB0002', 'SIS0000001', '90', '50', 'KLS01', 'SM02', '2020-08-28 12:08:45', '2020', '2021'),
('TBB0003', 'SIS0000008', '90', '45', 'KLS01', 'SM01', '2020-08-28 12:30:03', '2020', '2021'),
('TBB0004', 'SIS0000008', '80', '43', 'KLS01', 'SM02', '2020-08-28 12:33:07', '2020', '2021'),
('TBB0005', 'SIS0000007', '90', '45', 'KLS06', 'SM02', '2020-08-31 05:15:40', '2020', '2021'),
('TBB0006', 'SIS0000007', '80', '50', 'KLS06', 'SM01', '2020-08-31 05:30:37', '2020', '2021'),
('TBB0007', 'SIS0000003', '90', '50', 'KLS03', 'SM01', '2020-09-08 10:36:11', '2020', '2021');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id_user` char(15) CHARACTER SET latin1 NOT NULL,
  `username` varchar(35) CHARACTER SET latin1 NOT NULL,
  `nama_depan` varchar(20) CHARACTER SET latin1 NOT NULL,
  `nama_belakang` varchar(20) CHARACTER SET latin1 NOT NULL,
  `nuptk` varchar(15) CHARACTER SET latin1 NOT NULL,
  `tempat_lahir` varchar(50) CHARACTER SET latin1 NOT NULL,
  `tanggal_lahir` varchar(225) CHARACTER SET latin1 NOT NULL,
  `alamat` varchar(225) CHARACTER SET latin1 NOT NULL,
  `email` varchar(50) CHARACTER SET latin1 NOT NULL,
  `password` varchar(225) CHARACTER SET latin1 NOT NULL,
  `confirm_password` varchar(225) CHARACTER SET latin1 NOT NULL,
  `id_position` varchar(25) CHARACTER SET latin1 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id_user`, `username`, `nama_depan`, `nama_belakang`, `nuptk`, `tempat_lahir`, `tanggal_lahir`, `alamat`, `email`, `password`, `confirm_password`, `id_position`) VALUES
('USR0001', 'admin', 'Akhmad', 'Admin', '20201902', 'Pamulang', '2020-04-02', 'Pamulang', 'admin@gmail.com', '4441e5d70b3657900fa57e66db407e0b', '4441e5d70b3657900fa57e66db407e0b', 'PS01'),
('USR0002', 'walas01', 'indria ayu ', 'christyanti', '-', 'tomohon ', '1984-06-03', 'jl kp pondok salak no 68 ', 'Walas01@gmail.com', 'c2ef4fa790cf2f10a04b4eaf41b477fb', 'c2ef4fa790cf2f10a04b4eaf41b477fb', 'PS03'),
('USR0003', 'kepsek01', 'Devi Eka', 'Nur Annisa', '', 'pekanbaru ', '1987-11-15', 'felicia residence blok E 10 Rawa Kalong, Gunung Sindur ', 'devichanasha@gmail.com', '0d05c5e436aeddd26683b2bb05e12eab', '0d05c5e436aeddd26683b2bb05e12eab', 'PS02'),
('USR0010', 'admin1010', 'admin1', 'Administrator1', '', 'Tanggerang', '2020-04-03', 'Tangerang', 'admin1@gmail.com', '4466ff1a0aaba80e8deabbb82ba05b2c', '4466ff1a0aaba80e8deabbb82ba05b2c', 'PS01'),
('USR0015', 'akuadmin', 'Andini', 'Aisyah', '', 'Jakarta', '2020-04-28', 'Jakarta', 'dini@gmail.com', 'b723f69a66c50bb2d6c77bccaf3866cd', 'b723f69a66c50bb2d6c77bccaf3866cd', 'PS04'),
('USR0016', 'dia2020', '-', '-', '-', '-', '2020-08-28', '-', 'dia2020@gmail.com', '6898fb83ec030ba27e4a1f2c68f660a8', '6898fb83ec030ba27e4a1f2c68f660a8', 'PS03'),
('USR0017', 'username_sample', 'sample', 'username_sample', '-', 'Pamulang', '2020-08-28', 'Tangsel', 'sample@gmail.com', '5f4a3b52c8d89f2746cdab39e5aa1c3d', '5f4a3b52c8d89f2746cdab39e5aa1c3d', 'PS03');

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `view_data_siswa`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `view_data_siswa` (
`id_siswa` char(15)
,`nisn` char(15)
,`nis` char(15)
,`nama_siswa` varchar(100)
,`jk` varchar(10)
,`tempat_lahir` varchar(50)
,`tanggal_lahir` varchar(225)
,`agama` varchar(25)
,`pend_sebelumnya` varchar(225)
,`alamat_serta_didik` varchar(225)
,`nama_ayah` varchar(30)
,`nama_ibu` varchar(30)
,`pekerjaan_ayah` varchar(30)
,`pekerjaan_ibu` varchar(30)
,`desa_kelurahan` varchar(30)
,`kecamatan` varchar(30)
,`kabupaten_kota` varchar(30)
,`provinsi` varchar(30)
,`no_telp_hp` char(13)
,`nama_wali` varchar(30)
,`pekerjaan_wali` varchar(30)
,`no_telp_hp_wali` char(13)
,`id_agama` char(15)
);

-- --------------------------------------------------------

--
-- Struktur untuk view `data_siswa_kelas_semester`
--
DROP TABLE IF EXISTS `data_siswa_kelas_semester`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `data_siswa_kelas_semester`  AS  (select distinct `z`.`id_siswa` AS `id_siswa`,`z`.`nisn` AS `nisn`,`z`.`nis` AS `nis`,`z`.`nama_siswa` AS `nama_siswa`,`z`.`id_agama` AS `id_agama`,`x`.`id_kelas` AS `id_kelas`,`x`.`id_level_siswa` AS `id_level_siswa`,`a`.`kelas` AS `kelas`,`y`.`id_semester` AS `id_semester`,`b`.`semester` AS `semester` from ((((`data_level_siswa` `x` join `data_level_semester` `y` on(`y`.`id_level_siswa` = `y`.`id_level_siswa`)) join `data_siswa` `z` on(`z`.`id_siswa` = `x`.`id_siswa`)) join `kelas` `a` on(`a`.`id_kelas` = `x`.`id_kelas`)) join `semester` `b` on(`b`.`id_semester` = `y`.`id_semester`))) ;

-- --------------------------------------------------------

--
-- Struktur untuk view `data_siswa_kelas_semester_2`
--
DROP TABLE IF EXISTS `data_siswa_kelas_semester_2`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `data_siswa_kelas_semester_2`  AS  (select `x`.`id_siswa` AS `id_siswa`,`x`.`nisn` AS `nisn`,`x`.`nis` AS `nis`,`x`.`nama_siswa` AS `nama_siswa`,`x`.`id_agama` AS `id_agama`,`y`.`id_kelas` AS `id_kelas`,`y`.`id_level_siswa` AS `id_level_siswa`,`a`.`kelas` AS `kelas`,`z`.`id_semester` AS `id_semester`,`z`.`id_level_semester` AS `id_level_semester`,`b`.`semester` AS `semester` from ((((`data_siswa` `x` join `data_level_siswa` `y` on(`y`.`id_siswa` = `x`.`id_siswa`)) join `kelas` `a` on(`a`.`id_kelas` = `y`.`id_kelas`)) join `data_level_semester` `z` on(`z`.`id_level_siswa` = `y`.`id_level_siswa`)) join `semester` `b` on(`b`.`id_semester` = `z`.`id_semester`))) ;

-- --------------------------------------------------------

--
-- Struktur untuk view `gabunganki3_ki4`
--
DROP TABLE IF EXISTS `gabunganki3_ki4`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `gabunganki3_ki4`  AS  (select `x`.`id_siswa` AS `id_siswa`,`x`.`nama_siswa` AS `nama_siswa`,`y`.`id_kelas` AS `id_kelas`,`y`.`id_semester` AS `id_semester`,`y`.`tahun_ajaran_awal` AS `tahun_ajaran_awal`,`y`.`tahun_ajaran_akhir` AS `tahun_ajaran_akhir`,round(sum(`y`.`nilai`) / count(`y`.`id_mapel`),0) AS `rata_rata_ki3`,round(sum(`z`.`nilai`) / count(`z`.`id_mapel`),0) AS `rata_rata_ki4`,round(sum(`y`.`nilai`) / count(`y`.`id_mapel`),0) + round(sum(`z`.`nilai`) / count(`z`.`id_mapel`),0) AS `jumlah`,round((round(sum(`y`.`nilai`) / count(`y`.`id_mapel`),0) + round(sum(`z`.`nilai`) / count(`z`.`id_mapel`),0)) / 2,0) AS `rata_rata` from ((`data_siswa` `x` join `nilai_raport_ki3` `y` on(`y`.`id_siswa` = `x`.`id_siswa`)) join `nilai_raport_ki4` `z` on(`z`.`id_siswa` = `x`.`id_siswa`)) group by `y`.`id_nilairaport`) ;

-- --------------------------------------------------------

--
-- Struktur untuk view `hitung_kd`
--
DROP TABLE IF EXISTS `hitung_kd`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `hitung_kd`  AS  (select distinct `x`.`id_raportkd` AS `id_raportkd`,`x`.`id_siswa` AS `id_siswa`,`x`.`id_mapel` AS `id_mapel`,`x`.`id_kelas` AS `id_kelas`,`x`.`id_semester` AS `id_semester`,`x`.`id_kd` AS `id_kd`,`x`.`nomor_kd` AS `nomor_kd`,`x`.`deskripsi` AS `deskripsi`,`x`.`tugas1` AS `tugas1`,`x`.`tugas2` AS `tugas2`,`x`.`tugas3` AS `tugas3`,`x`.`tugas4` AS `tugas4`,`x`.`tugas5` AS `tugas5`,`x`.`ph1` AS `ph1`,`x`.`ph2` AS `ph2`,`x`.`ph3` AS `ph3`,`x`.`ph4` AS `ph4`,`x`.`pts` AS `pts`,`x`.`pas` AS `pas`,round((((`x`.`tugas1` + `x`.`tugas2` + `x`.`tugas3` + `x`.`tugas4` + `x`.`tugas5` + (`x`.`ph1` + `x`.`ph2` + `x`.`ph3` + `x`.`ph4`)) * 2 + `x`.`pts` + `x`.`pas`) / 5 - `y`.`pengetahuan`) / 3,0) AS `nilai_kd` from (`nilai_raportkd_ki3` `x` join `mapel` `y` on(`y`.`id_mapel` = `x`.`id_mapel`))) ;

-- --------------------------------------------------------

--
-- Struktur untuk view `hitung_kdagm_ki3`
--
DROP TABLE IF EXISTS `hitung_kdagm_ki3`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `hitung_kdagm_ki3`  AS  (select distinct `x`.`id_raportkd` AS `id_raportkd`,`x`.`id_siswa` AS `id_siswa`,`x`.`id_mapel` AS `id_mapel`,`x`.`id_kelas` AS `id_kelas`,`x`.`id_semester` AS `id_semester`,`x`.`id_kd` AS `id_kd`,`x`.`nomor_kd` AS `nomor_kd`,`x`.`deskripsi` AS `deskripsi`,`x`.`tugas1` AS `tugas1`,`x`.`tugas2` AS `tugas2`,`x`.`tugas3` AS `tugas3`,`x`.`tugas4` AS `tugas4`,`x`.`tugas5` AS `tugas5`,`x`.`ph1` AS `ph1`,`x`.`ph2` AS `ph2`,`x`.`ph3` AS `ph3`,`x`.`ph4` AS `ph4`,`x`.`pts` AS `pts`,`x`.`pas` AS `pas`,round((((`x`.`tugas1` + `x`.`tugas2` + `x`.`tugas3` + `x`.`tugas4` + `x`.`tugas5` + (`x`.`ph1` + `x`.`ph2` + `x`.`ph3` + `x`.`ph4`)) * 2 + `x`.`pts` + `x`.`pas`) / 5 - `y`.`pengetahuan`) / 3,0) AS `nilai_kd` from (`nilai_agamakd_ki3` `x` join `mapel` `y` on(`y`.`id_mapel` = `x`.`id_mapel`))) ;

-- --------------------------------------------------------

--
-- Struktur untuk view `hitung_kdagm_ki4`
--
DROP TABLE IF EXISTS `hitung_kdagm_ki4`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `hitung_kdagm_ki4`  AS  (select distinct `x`.`id_raportkd` AS `id_raportkd`,`x`.`id_siswa` AS `id_siswa`,`x`.`id_mapel` AS `id_mapel`,`x`.`id_kelas` AS `id_kelas`,`x`.`id_semester` AS `id_semester`,`x`.`id_kd` AS `id_kd`,`x`.`nomor_kd` AS `nomor_kd`,`x`.`deskripsi` AS `deskripsi`,`x`.`tugas1` AS `tugas1`,`x`.`tugas2` AS `tugas2`,`x`.`tugas3` AS `tugas3`,`x`.`tugas4` AS `tugas4`,`x`.`tugas5` AS `tugas5`,`x`.`ph1` AS `ph1`,`x`.`ph2` AS `ph2`,`x`.`ph3` AS `ph3`,`x`.`ph4` AS `ph4`,`x`.`pts` AS `pts`,`x`.`pas` AS `pas`,round((((`x`.`tugas1` + `x`.`tugas2` + `x`.`tugas3` + `x`.`tugas4` + `x`.`tugas5` + (`x`.`ph1` + `x`.`ph2` + `x`.`ph3` + `x`.`ph4`)) * 2 + `x`.`pts` + `x`.`pas`) / 5 - `y`.`keterampilan`) / 3,0) AS `nilai_kd` from (`nilai_agamakd_ki4` `x` join `mapel` `y` on(`y`.`id_mapel` = `x`.`id_mapel`))) ;

-- --------------------------------------------------------

--
-- Struktur untuk view `hitung_kdki4`
--
DROP TABLE IF EXISTS `hitung_kdki4`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `hitung_kdki4`  AS  (select distinct `x`.`id_raportkd` AS `id_raportkd`,`x`.`id_siswa` AS `id_siswa`,`x`.`id_mapel` AS `id_mapel`,`x`.`id_kelas` AS `id_kelas`,`x`.`id_semester` AS `id_semester`,`x`.`id_kd` AS `id_kd`,`x`.`nomor_kd` AS `nomor_kd`,`x`.`deskripsi` AS `deskripsi`,`x`.`tugas1` AS `tugas1`,`x`.`tugas2` AS `tugas2`,`x`.`tugas3` AS `tugas3`,`x`.`tugas4` AS `tugas4`,`x`.`tugas5` AS `tugas5`,`x`.`ph1` AS `ph1`,`x`.`ph2` AS `ph2`,`x`.`ph3` AS `ph3`,`x`.`ph4` AS `ph4`,`x`.`pts` AS `pts`,`x`.`pas` AS `pas`,round((((`x`.`tugas1` + `x`.`tugas2` + `x`.`tugas3` + `x`.`tugas4` + `x`.`tugas5` + (`x`.`ph1` + `x`.`ph2` + `x`.`ph3` + `x`.`ph4`)) * 2 + `x`.`pts` + `x`.`pas`) / 5 - `y`.`keterampilan`) / 3,0) AS `nilai_kd` from (`nilai_raportkd_ki4` `x` join `mapel` `y` on(`y`.`id_mapel` = `x`.`id_mapel`))) ;

-- --------------------------------------------------------

--
-- Struktur untuk view `nilai_akhir_agamakd_ki3`
--
DROP TABLE IF EXISTS `nilai_akhir_agamakd_ki3`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `nilai_akhir_agamakd_ki3`  AS  (select `b`.`id_raportkd` AS `id_raportkd`,`z`.`id_siswa` AS `id_siswa`,`x`.`id_mapel` AS `id_mapel`,`x`.`nama_mapel` AS `nama_mapel`,`c`.`id_agama` AS `id_agama`,`y`.`id_kd` AS `id_kd`,`y`.`nomor_kd` AS `nomor_kd`,`y`.`deskripsi` AS `deskripsi`,`b`.`tugas1` AS `tugas1`,`b`.`tugas2` AS `tugas2`,`b`.`tugas3` AS `tugas3`,`b`.`tugas4` AS `tugas4`,`b`.`tugas5` AS `tugas5`,`b`.`ph1` AS `ph1`,`b`.`ph2` AS `ph2`,`b`.`ph3` AS `ph3`,`b`.`ph4` AS `ph4`,`b`.`pts` AS `pts`,`b`.`pas` AS `pas` from (((`kd_agama_ki3` `y` left join (`mapel` `x` left join `nilai_agamakd_ki3` `b` on(`x`.`id_mapel` = `b`.`id_mapel`)) on(`y`.`id_mapel` = `x`.`id_mapel`)) join `agama` `c` on(`c`.`id_agama` = `y`.`id_agama`)) join `data_siswa` `z`)) ;

-- --------------------------------------------------------

--
-- Struktur untuk view `nilai_akhir_agamakd_ki4`
--
DROP TABLE IF EXISTS `nilai_akhir_agamakd_ki4`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `nilai_akhir_agamakd_ki4`  AS  (select `b`.`id_raportkd` AS `id_raportkd`,`z`.`id_siswa` AS `id_siswa`,`x`.`id_mapel` AS `id_mapel`,`x`.`nama_mapel` AS `nama_mapel`,`c`.`id_agama` AS `id_agama`,`y`.`id_kd` AS `id_kd`,`y`.`nomor_kd` AS `nomor_kd`,`y`.`deskripsi` AS `deskripsi`,`b`.`tugas1` AS `tugas1`,`b`.`tugas2` AS `tugas2`,`b`.`tugas3` AS `tugas3`,`b`.`tugas4` AS `tugas4`,`b`.`tugas5` AS `tugas5`,`b`.`ph1` AS `ph1`,`b`.`ph2` AS `ph2`,`b`.`ph3` AS `ph3`,`b`.`ph4` AS `ph4`,`b`.`pts` AS `pts`,`b`.`pas` AS `pas` from (((`kd_agama_ki4` `y` left join (`mapel` `x` left join `nilai_agamakd_ki4` `b` on(`x`.`id_mapel` = `b`.`id_mapel`)) on(`y`.`id_mapel` = `x`.`id_mapel`)) join `agama` `c` on(`c`.`id_agama` = `y`.`id_agama`)) join `data_siswa` `z`)) ;

-- --------------------------------------------------------

--
-- Struktur untuk view `nilai_akhir_raportkd_ki3`
--
DROP TABLE IF EXISTS `nilai_akhir_raportkd_ki3`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `nilai_akhir_raportkd_ki3`  AS  (select `b`.`id_raportkd` AS `id_raportkd`,`z`.`id_siswa` AS `id_siswa`,`x`.`id_mapel` AS `id_mapel`,`y`.`id_kelas` AS `id_kelas`,`y`.`id_semester` AS `id_semester`,`x`.`nama_mapel` AS `nama_mapel`,`y`.`id_kd` AS `id_kd`,`y`.`nomor_kd` AS `nomor_kd`,`y`.`deskripsi` AS `deskripsi`,`b`.`tugas1` AS `tugas1`,`b`.`tugas2` AS `tugas2`,`b`.`tugas3` AS `tugas3`,`b`.`tugas4` AS `tugas4`,`b`.`tugas5` AS `tugas5`,`b`.`ph1` AS `ph1`,`b`.`ph2` AS `ph2`,`b`.`ph3` AS `ph3`,`b`.`ph4` AS `ph4`,`b`.`pts` AS `pts`,`b`.`pas` AS `pas` from ((`kd_pengetahuan` `y` left join (`mapel` `x` left join `nilai_raportkd_ki3` `b` on(`x`.`id_mapel` = `b`.`id_mapel`)) on(`y`.`id_mapel` = `x`.`id_mapel`)) join `data_siswa` `z`)) ;

-- --------------------------------------------------------

--
-- Struktur untuk view `nilai_akhir_raportkd_ki4`
--
DROP TABLE IF EXISTS `nilai_akhir_raportkd_ki4`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `nilai_akhir_raportkd_ki4`  AS  (select `b`.`id_raportkd` AS `id_raportkd`,`z`.`id_siswa` AS `id_siswa`,`x`.`id_mapel` AS `id_mapel`,`y`.`id_kelas` AS `id_kelas`,`y`.`id_semester` AS `id_semester`,`x`.`nama_mapel` AS `nama_mapel`,`y`.`id_kd` AS `id_kd`,`y`.`nomor_kd` AS `nomor_kd`,`y`.`deskripsi` AS `deskripsi`,`b`.`tugas1` AS `tugas1`,`b`.`tugas2` AS `tugas2`,`b`.`tugas3` AS `tugas3`,`b`.`tugas4` AS `tugas4`,`b`.`tugas5` AS `tugas5`,`b`.`ph1` AS `ph1`,`b`.`ph2` AS `ph2`,`b`.`ph3` AS `ph3`,`b`.`ph4` AS `ph4`,`b`.`pts` AS `pts`,`b`.`pas` AS `pas` from ((`kd_keterampilan` `y` left join (`mapel` `x` left join `nilai_raportkd_ki4` `b` on(`x`.`id_mapel` = `b`.`id_mapel`)) on(`y`.`id_mapel` = `x`.`id_mapel`)) join `data_siswa` `z`)) ;

-- --------------------------------------------------------

--
-- Struktur untuk view `nilai_akhir_raport_ki3`
--
DROP TABLE IF EXISTS `nilai_akhir_raport_ki3`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `nilai_akhir_raport_ki3`  AS  (select `x`.`id_nilairaport` AS `id_nilairaport`,`z`.`id_siswa` AS `id_siswa`,`x`.`id_kelas` AS `id_kelas`,`x`.`id_semester` AS `id_semester`,`y`.`id_mapel` AS `id_mapel`,`y`.`nama_mapel` AS `nama_mapel`,`x`.`nilai` AS `nilai`,`x`.`predikat` AS `predikat`,`x`.`deskripsi` AS `deskripsi` from ((`mapel` `y` left join `nilai_raport_ki3` `x` on(`y`.`id_mapel` = `x`.`id_mapel`)) join `data_siswa` `z`)) ;

-- --------------------------------------------------------

--
-- Struktur untuk view `nilai_akhir_raport_ki4`
--
DROP TABLE IF EXISTS `nilai_akhir_raport_ki4`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `nilai_akhir_raport_ki4`  AS  (select `x`.`id_nilairaport` AS `id_nilairaport`,`z`.`id_siswa` AS `id_siswa`,`y`.`id_mapel` AS `id_mapel`,`y`.`nama_mapel` AS `nama_mapel`,`x`.`nilai` AS `nilai`,`x`.`predikat` AS `predikat`,`x`.`deskripsi` AS `deskripsi` from ((`mapel` `y` left join `nilai_raport_ki4` `x` on(`y`.`id_mapel` = `x`.`id_mapel`)) join `data_siswa` `z`)) ;

-- --------------------------------------------------------

--
-- Struktur untuk view `show_mapel_perkelas`
--
DROP TABLE IF EXISTS `show_mapel_perkelas`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `show_mapel_perkelas`  AS  (select `y`.`id_mapel` AS `id_mapel`,`y`.`nama_mapel` AS `nama_mapel`,`y`.`singkat_mapel` AS `singkat_mapel`,`y`.`kelompok` AS `kelompok`,`y`.`pengetahuan` AS `pengetahuan`,`y`.`keterampilan` AS `keterampilan`,`x`.`id_kelas` AS `id_kelas`,`x`.`id_semester` AS `id_semester` from (`roles_mapel` `x` join `mapel` `y` on(`y`.`id_mapel` = `x`.`id_mapel`))) ;

-- --------------------------------------------------------

--
-- Struktur untuk view `simple_siswa_kelas_semester`
--
DROP TABLE IF EXISTS `simple_siswa_kelas_semester`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `simple_siswa_kelas_semester`  AS  (select `z`.`id_siswa` AS `id_siswa`,`z`.`nama_siswa` AS `nama_siswa`,`c`.`id_kelas` AS `id_kelas`,`b`.`semester` AS `semester` from ((((`data_level_siswa` `x` join `data_level_semester` `y` on(`y`.`id_level_siswa` = `x`.`id_level_siswa`)) join `data_siswa` `z` on(`z`.`id_siswa` = `x`.`id_siswa`)) join `kelas` `c` on(`c`.`id_kelas` = `x`.`id_kelas`)) join `semester` `b` on(`b`.`id_semester` = `y`.`id_semester`))) ;

-- --------------------------------------------------------

--
-- Struktur untuk view `siswa_kelas`
--
DROP TABLE IF EXISTS `siswa_kelas`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `siswa_kelas`  AS  (select `x`.`id_level_siswa` AS `id_level_siswa`,`x`.`id_siswa` AS `id_siswa`,`y`.`nisn` AS `nisn`,`y`.`nis` AS `nis`,`y`.`nama_siswa` AS `nama_siswa`,`y`.`jk` AS `jk`,`y`.`tempat_lahir` AS `tempat_lahir`,`y`.`tanggal_lahir` AS `tanggal_lahir`,`y`.`id_agama` AS `id_agama`,`y`.`pend_sebelumnya` AS `pend_sebelumnya`,`y`.`alamat_serta_didik` AS `alamat_serta_didik`,`y`.`nama_ayah` AS `nama_ayah`,`y`.`nama_ibu` AS `nama_ibu`,`y`.`pekerjaan_ayah` AS `pekerjaan_ayah`,`y`.`pekerjaan_ibu` AS `pekerjaan_ibu`,`y`.`desa_kelurahan` AS `desa_kelurahan`,`y`.`kecamatan` AS `kecamatan`,`y`.`kabupaten_kota` AS `kabupaten_kota`,`y`.`provinsi` AS `provinsi`,`y`.`no_telp_hp` AS `no_telp_hp`,`y`.`nama_wali` AS `nama_wali`,`y`.`pekerjaan_wali` AS `pekerjaan_wali`,`y`.`alamat_wali` AS `alamat_wali`,`y`.`no_telp_hp_wali` AS `no_telp_hp_wali`,`x`.`id_kelas` AS `id_kelas`,`z`.`kelas` AS `kelas`,`y`.`tahun_ajaran_awal` AS `tahun_ajaran_awal`,`y`.`tahun_ajaran_akhir` AS `tahun_ajaran_akhir` from ((`data_level_siswa` `x` join `data_siswa` `y` on(`y`.`id_siswa` = `x`.`id_siswa`)) join `kelas` `z` on(`z`.`id_kelas` = `x`.`id_kelas`))) ;

-- --------------------------------------------------------

--
-- Struktur untuk view `siswa_kelas_semester`
--
DROP TABLE IF EXISTS `siswa_kelas_semester`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `siswa_kelas_semester`  AS  (select `y`.`id_level_semester` AS `id_level_semester`,`z`.`id_siswa` AS `id_siswa`,`z`.`nisn` AS `nisn`,`z`.`nis` AS `nis`,`z`.`nama_siswa` AS `nama_siswa`,`c`.`kelas` AS `kelas`,`b`.`semester` AS `semester`,`z`.`jk` AS `jk`,`z`.`tempat_lahir` AS `tempat_lahir`,`z`.`tanggal_lahir` AS `tanggal_lahir`,`z`.`id_agama` AS `id_agama`,`z`.`pend_sebelumnya` AS `pend_sebelumnya`,`z`.`alamat_serta_didik` AS `alamat_serta_didik`,`z`.`nama_ayah` AS `nama_ayah`,`z`.`nama_ibu` AS `nama_ibu`,`z`.`pekerjaan_ayah` AS `pekerjaan_ayah`,`z`.`pekerjaan_ibu` AS `pekerjaan_ibu` from ((((`data_level_siswa` `x` join `data_level_semester` `y` on(`y`.`id_level_siswa` = `x`.`id_level_siswa`)) join `data_siswa` `z` on(`z`.`id_siswa` = `x`.`id_siswa`)) join `kelas` `c` on(`c`.`id_kelas` = `x`.`id_kelas`)) join `semester` `b` on(`b`.`id_semester` = `y`.`id_semester`))) ;

-- --------------------------------------------------------

--
-- Struktur untuk view `view_data_siswa`
--
DROP TABLE IF EXISTS `view_data_siswa`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_data_siswa`  AS  (select `x`.`id_siswa` AS `id_siswa`,`x`.`nisn` AS `nisn`,`x`.`nis` AS `nis`,`x`.`nama_siswa` AS `nama_siswa`,`x`.`jk` AS `jk`,`x`.`tempat_lahir` AS `tempat_lahir`,`x`.`tanggal_lahir` AS `tanggal_lahir`,`y`.`agama` AS `agama`,`x`.`pend_sebelumnya` AS `pend_sebelumnya`,`x`.`alamat_serta_didik` AS `alamat_serta_didik`,`x`.`nama_ayah` AS `nama_ayah`,`x`.`nama_ibu` AS `nama_ibu`,`x`.`pekerjaan_ayah` AS `pekerjaan_ayah`,`x`.`pekerjaan_ibu` AS `pekerjaan_ibu`,`x`.`desa_kelurahan` AS `desa_kelurahan`,`x`.`kecamatan` AS `kecamatan`,`x`.`kabupaten_kota` AS `kabupaten_kota`,`x`.`provinsi` AS `provinsi`,`x`.`no_telp_hp` AS `no_telp_hp`,`x`.`nama_wali` AS `nama_wali`,`x`.`pekerjaan_wali` AS `pekerjaan_wali`,`x`.`no_telp_hp_wali` AS `no_telp_hp_wali`,`x`.`id_agama` AS `id_agama` from (`data_siswa` `x` join `agama` `y` on(`y`.`id_agama` = `x`.`id_agama`)) group by `x`.`id_siswa`) ;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `agama`
--
ALTER TABLE `agama`
  ADD PRIMARY KEY (`id_agama`);

--
-- Indeks untuk tabel `catatan`
--
ALTER TABLE `catatan`
  ADD PRIMARY KEY (`id_catatan`);

--
-- Indeks untuk tabel `data_level_semester`
--
ALTER TABLE `data_level_semester`
  ADD PRIMARY KEY (`id_level_semester`,`id_level_siswa`),
  ADD KEY `data_level_semester_ibfk_1` (`id_level_siswa`),
  ADD KEY `data_level_semester_ibfk_2` (`id_semester`);

--
-- Indeks untuk tabel `data_level_siswa`
--
ALTER TABLE `data_level_siswa`
  ADD PRIMARY KEY (`id_level_siswa`),
  ADD KEY `data_level_siswa_ibfk_1` (`id_siswa`),
  ADD KEY `data_level_siswa_ibfk_2` (`id_kelas`);

--
-- Indeks untuk tabel `data_sekolah`
--
ALTER TABLE `data_sekolah`
  ADD PRIMARY KEY (`id_sekolah`),
  ADD UNIQUE KEY `id_sekolah` (`id_sekolah`);

--
-- Indeks untuk tabel `data_siswa`
--
ALTER TABLE `data_siswa`
  ADD PRIMARY KEY (`id_siswa`),
  ADD KEY `data_siswa_ibfk_1` (`id_agama`);

--
-- Indeks untuk tabel `data_siswa_keluar`
--
ALTER TABLE `data_siswa_keluar`
  ADD PRIMARY KEY (`id_siswa_keluar`);

--
-- Indeks untuk tabel `data_siswa_kenaikan`
--
ALTER TABLE `data_siswa_kenaikan`
  ADD PRIMARY KEY (`id_kenaikan`);

--
-- Indeks untuk tabel `download`
--
ALTER TABLE `download`
  ADD PRIMARY KEY (`id_download`);

--
-- Indeks untuk tabel `ekstrakurikuler`
--
ALTER TABLE `ekstrakurikuler`
  ADD PRIMARY KEY (`id_ekstra`);

--
-- Indeks untuk tabel `jenis_kelamin`
--
ALTER TABLE `jenis_kelamin`
  ADD PRIMARY KEY (`id_kelamin`);

--
-- Indeks untuk tabel `jurnal_sosial`
--
ALTER TABLE `jurnal_sosial`
  ADD PRIMARY KEY (`id_jurnal_so`);

--
-- Indeks untuk tabel `jurnal_spiritual`
--
ALTER TABLE `jurnal_spiritual`
  ADD PRIMARY KEY (`id_jurnal_sp`);

--
-- Indeks untuk tabel `kd_agama_ki3`
--
ALTER TABLE `kd_agama_ki3`
  ADD PRIMARY KEY (`id_kd`),
  ADD KEY `id_kelas` (`id_kelas`,`id_semester`),
  ADD KEY `kd_agama_ki3_ibfk_1` (`id_agama`);

--
-- Indeks untuk tabel `kd_agama_ki4`
--
ALTER TABLE `kd_agama_ki4`
  ADD PRIMARY KEY (`id_kd`),
  ADD KEY `kd_agama_ki4_ibfk_1` (`id_agama`);

--
-- Indeks untuk tabel `kd_keterampilan`
--
ALTER TABLE `kd_keterampilan`
  ADD PRIMARY KEY (`id_kd`),
  ADD KEY `key` (`id_mapel`);

--
-- Indeks untuk tabel `kd_pengetahuan`
--
ALTER TABLE `kd_pengetahuan`
  ADD PRIMARY KEY (`id_kd`),
  ADD KEY `id_kelas` (`id_kelas`,`id_semester`),
  ADD KEY `kd_pengetahuan_ibfk_1` (`id_mapel`);
ALTER TABLE `kd_pengetahuan` ADD FULLTEXT KEY `deskripsi` (`deskripsi`);

--
-- Indeks untuk tabel `kelas`
--
ALTER TABLE `kelas`
  ADD PRIMARY KEY (`id_kelas`);

--
-- Indeks untuk tabel `kelompok_mapel`
--
ALTER TABLE `kelompok_mapel`
  ADD PRIMARY KEY (`no`);

--
-- Indeks untuk tabel `kesehatan`
--
ALTER TABLE `kesehatan`
  ADD PRIMARY KEY (`id_kesehatan`);

--
-- Indeks untuk tabel `ketidakhadiran`
--
ALTER TABLE `ketidakhadiran`
  ADD PRIMARY KEY (`id_kehadiran`);

--
-- Indeks untuk tabel `mapel`
--
ALTER TABLE `mapel`
  ADD PRIMARY KEY (`id_mapel`);

--
-- Indeks untuk tabel `master_level`
--
ALTER TABLE `master_level`
  ADD PRIMARY KEY (`id_master`),
  ADD KEY `id_user` (`id_user`,`id_position`,`id_kelas`),
  ADD KEY `id_position` (`id_position`),
  ADD KEY `id_kelas` (`id_kelas`);

--
-- Indeks untuk tabel `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`id_message`);

--
-- Indeks untuk tabel `nilai_agamakd_ki3`
--
ALTER TABLE `nilai_agamakd_ki3`
  ADD PRIMARY KEY (`id_raportkd`),
  ADD KEY `nilai_agamakd_ki3_ibfk_1` (`id_kd`),
  ADD KEY `nilai_agamakd_ki3_ibfk_2` (`id_siswa`),
  ADD KEY `id_mapel` (`id_mapel`);

--
-- Indeks untuk tabel `nilai_agamakd_ki4`
--
ALTER TABLE `nilai_agamakd_ki4`
  ADD PRIMARY KEY (`id_raportkd`),
  ADD KEY `nilai_agamakd_ki4_ibfk_1` (`id_kd`);

--
-- Indeks untuk tabel `nilai_ki3`
--
ALTER TABLE `nilai_ki3`
  ADD PRIMARY KEY (`id_nilai`);

--
-- Indeks untuk tabel `nilai_ki4`
--
ALTER TABLE `nilai_ki4`
  ADD PRIMARY KEY (`id_nilai`);

--
-- Indeks untuk tabel `nilai_pengetahuan`
--
ALTER TABLE `nilai_pengetahuan`
  ADD PRIMARY KEY (`id_nilai`),
  ADD KEY `id_kd` (`id_kd`),
  ADD KEY `nilai_pengetahuan_ibfk_1` (`id_siswa`),
  ADD KEY `id_tema` (`id_tema`);

--
-- Indeks untuk tabel `nilai_raportkd_ki3`
--
ALTER TABLE `nilai_raportkd_ki3`
  ADD PRIMARY KEY (`id_raportkd`),
  ADD UNIQUE KEY `id_raportkd` (`id_raportkd`),
  ADD KEY `id_kd` (`id_kd`),
  ADD KEY `id_mapel` (`id_mapel`);

--
-- Indeks untuk tabel `nilai_raportkd_ki4`
--
ALTER TABLE `nilai_raportkd_ki4`
  ADD PRIMARY KEY (`id_raportkd`),
  ADD KEY `nilai_raportkd_ki4_ibfk_1` (`id_kd`);

--
-- Indeks untuk tabel `nilai_raport_ki3`
--
ALTER TABLE `nilai_raport_ki3`
  ADD PRIMARY KEY (`id_nilairaport`),
  ADD KEY `id_siswa` (`id_siswa`,`id_mapel`),
  ADD KEY `id_mapel` (`id_mapel`);

--
-- Indeks untuk tabel `nilai_raport_ki4`
--
ALTER TABLE `nilai_raport_ki4`
  ADD PRIMARY KEY (`id_nilairaport`);

--
-- Indeks untuk tabel `nilai_raport_sosial`
--
ALTER TABLE `nilai_raport_sosial`
  ADD PRIMARY KEY (`id_nilairaport_so`,`id_siswa`);

--
-- Indeks untuk tabel `nilai_raport_spiritual`
--
ALTER TABLE `nilai_raport_spiritual`
  ADD PRIMARY KEY (`id_nilairaport_sp`);

--
-- Indeks untuk tabel `position`
--
ALTER TABLE `position`
  ADD PRIMARY KEY (`id_position`);

--
-- Indeks untuk tabel `prestasi`
--
ALTER TABLE `prestasi`
  ADD PRIMARY KEY (`id_prestasi`);

--
-- Indeks untuk tabel `roles_mapel`
--
ALTER TABLE `roles_mapel`
  ADD PRIMARY KEY (`id_roles_mpl`),
  ADD KEY `id_kelas` (`id_kelas`,`id_semester`,`id_mapel`),
  ADD KEY `roles_mapel_ibfk_2` (`id_semester`),
  ADD KEY `roles_mapel_ibfk_3` (`id_mapel`);

--
-- Indeks untuk tabel `saran`
--
ALTER TABLE `saran`
  ADD PRIMARY KEY (`id_saran`);

--
-- Indeks untuk tabel `satuan_kkm`
--
ALTER TABLE `satuan_kkm`
  ADD PRIMARY KEY (`id_kkm`);

--
-- Indeks untuk tabel `semester`
--
ALTER TABLE `semester`
  ADD PRIMARY KEY (`id_semester`);

--
-- Indeks untuk tabel `sikap_sosial`
--
ALTER TABLE `sikap_sosial`
  ADD PRIMARY KEY (`id_sosial`);

--
-- Indeks untuk tabel `sikap_spiritual`
--
ALTER TABLE `sikap_spiritual`
  ADD PRIMARY KEY (`id_spiritual`);

--
-- Indeks untuk tabel `sub_tema`
--
ALTER TABLE `sub_tema`
  ADD PRIMARY KEY (`Kode_sub_tm`);

--
-- Indeks untuk tabel `tb_ekskul_pil1`
--
ALTER TABLE `tb_ekskul_pil1`
  ADD PRIMARY KEY (`id_ekskul_pil1`),
  ADD KEY `id_ekstra` (`id_ekstra`);

--
-- Indeks untuk tabel `tb_ekskul_pil2`
--
ALTER TABLE `tb_ekskul_pil2`
  ADD PRIMARY KEY (`id_ekskul_pil2`),
  ADD KEY `id_ekstra` (`id_ekstra`);

--
-- Indeks untuk tabel `tb_ekskul_pil3`
--
ALTER TABLE `tb_ekskul_pil3`
  ADD PRIMARY KEY (`id_ekskul_pil3`),
  ADD KEY `id_ekstra` (`id_ekstra`);

--
-- Indeks untuk tabel `tb_ekskul_wajib`
--
ALTER TABLE `tb_ekskul_wajib`
  ADD PRIMARY KEY (`id_ekskul_wajib`),
  ADD KEY `id_ekstra` (`id_ekstra`);

--
-- Indeks untuk tabel `tb_muatan_nilai`
--
ALTER TABLE `tb_muatan_nilai`
  ADD PRIMARY KEY (`id_muatan`),
  ADD KEY `id_ekstra` (`id_ekstra`);

--
-- Indeks untuk tabel `test`
--
ALTER TABLE `test`
  ADD PRIMARY KEY (`id_nilai`);

--
-- Indeks untuk tabel `tinggi_berat_badan`
--
ALTER TABLE `tinggi_berat_badan`
  ADD PRIMARY KEY (`id_tbb`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`),
  ADD KEY `id_position` (`id_position`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `jenis_kelamin`
--
ALTER TABLE `jenis_kelamin`
  MODIFY `id_kelamin` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `kelompok_mapel`
--
ALTER TABLE `kelompok_mapel`
  MODIFY `no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `roles_mapel`
--
ALTER TABLE `roles_mapel`
  MODIFY `id_roles_mpl` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=118;

--
-- AUTO_INCREMENT untuk tabel `satuan_kkm`
--
ALTER TABLE `satuan_kkm`
  MODIFY `id_kkm` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `tb_muatan_nilai`
--
ALTER TABLE `tb_muatan_nilai`
  MODIFY `id_muatan` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=165;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `data_level_semester`
--
ALTER TABLE `data_level_semester`
  ADD CONSTRAINT `data_level_semester_ibfk_1` FOREIGN KEY (`id_level_siswa`) REFERENCES `data_level_siswa` (`id_level_siswa`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `data_level_semester_ibfk_2` FOREIGN KEY (`id_semester`) REFERENCES `semester` (`id_semester`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `data_level_siswa`
--
ALTER TABLE `data_level_siswa`
  ADD CONSTRAINT `data_level_siswa_ibfk_1` FOREIGN KEY (`id_siswa`) REFERENCES `data_siswa` (`id_siswa`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `data_level_siswa_ibfk_2` FOREIGN KEY (`id_kelas`) REFERENCES `kelas` (`id_kelas`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `data_siswa`
--
ALTER TABLE `data_siswa`
  ADD CONSTRAINT `data_siswa_ibfk_1` FOREIGN KEY (`id_agama`) REFERENCES `agama` (`id_agama`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `kd_agama_ki3`
--
ALTER TABLE `kd_agama_ki3`
  ADD CONSTRAINT `kd_agama_ki3_ibfk_1` FOREIGN KEY (`id_agama`) REFERENCES `agama` (`id_agama`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `kd_agama_ki4`
--
ALTER TABLE `kd_agama_ki4`
  ADD CONSTRAINT `kd_agama_ki4_ibfk_1` FOREIGN KEY (`id_agama`) REFERENCES `agama` (`id_agama`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `kd_keterampilan`
--
ALTER TABLE `kd_keterampilan`
  ADD CONSTRAINT `kd_keterampilan_ibfk_1` FOREIGN KEY (`id_mapel`) REFERENCES `mapel` (`id_mapel`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `kd_pengetahuan`
--
ALTER TABLE `kd_pengetahuan`
  ADD CONSTRAINT `kd_pengetahuan_ibfk_1` FOREIGN KEY (`id_mapel`) REFERENCES `mapel` (`id_mapel`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `master_level`
--
ALTER TABLE `master_level`
  ADD CONSTRAINT `master_level_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`),
  ADD CONSTRAINT `master_level_ibfk_2` FOREIGN KEY (`id_position`) REFERENCES `position` (`id_position`),
  ADD CONSTRAINT `master_level_ibfk_3` FOREIGN KEY (`id_kelas`) REFERENCES `kelas` (`id_kelas`);

--
-- Ketidakleluasaan untuk tabel `nilai_agamakd_ki3`
--
ALTER TABLE `nilai_agamakd_ki3`
  ADD CONSTRAINT `nilai_agamakd_ki3_ibfk_1` FOREIGN KEY (`id_kd`) REFERENCES `kd_agama_ki3` (`id_kd`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `nilai_agamakd_ki4`
--
ALTER TABLE `nilai_agamakd_ki4`
  ADD CONSTRAINT `nilai_agamakd_ki4_ibfk_1` FOREIGN KEY (`id_kd`) REFERENCES `kd_agama_ki4` (`id_kd`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `nilai_pengetahuan`
--
ALTER TABLE `nilai_pengetahuan`
  ADD CONSTRAINT `nilai_pengetahuan_ibfk_1` FOREIGN KEY (`id_siswa`) REFERENCES `data_siswa` (`id_siswa`) ON DELETE CASCADE,
  ADD CONSTRAINT `nilai_pengetahuan_ibfk_2` FOREIGN KEY (`id_kd`) REFERENCES `kd_pengetahuan` (`id_kd`) ON DELETE CASCADE,
  ADD CONSTRAINT `nilai_pengetahuan_ibfk_3` FOREIGN KEY (`id_tema`) REFERENCES `message` (`id_message`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `nilai_raportkd_ki3`
--
ALTER TABLE `nilai_raportkd_ki3`
  ADD CONSTRAINT `nilai_raportkd_ki3_ibfk_1` FOREIGN KEY (`id_kd`) REFERENCES `kd_pengetahuan` (`id_kd`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `nilai_raportkd_ki4`
--
ALTER TABLE `nilai_raportkd_ki4`
  ADD CONSTRAINT `nilai_raportkd_ki4_ibfk_1` FOREIGN KEY (`id_kd`) REFERENCES `kd_keterampilan` (`id_kd`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `roles_mapel`
--
ALTER TABLE `roles_mapel`
  ADD CONSTRAINT `roles_mapel_ibfk_1` FOREIGN KEY (`id_kelas`) REFERENCES `kelas` (`id_kelas`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `roles_mapel_ibfk_2` FOREIGN KEY (`id_semester`) REFERENCES `semester` (`id_semester`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `roles_mapel_ibfk_3` FOREIGN KEY (`id_mapel`) REFERENCES `mapel` (`id_mapel`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`id_position`) REFERENCES `position` (`id_position`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
