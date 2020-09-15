<?php 
include "../../../connect.php";

		$sqlsiswa = mysqli_query($koneksi, "SELECT max(id_siswa_keluar) AS maxCode FROM data_siswa_keluar");
        $dtsiswa = mysqli_fetch_array($sqlsiswa);
        $datsiswa = $dtsiswa['maxCode'];
        $nOsis = (int) substr($datsiswa, 3, 7);
        $nOsis++; 
        $charsis = "KEL";
        $datsiswa = $charsis . sprintf("%07s", $nOsis);
        
        date_default_timezone_set('Asia/Jakarta'); 
        $date_keluar = date("Y-m-d h:i:s");

if (isset($_GET['nis'])) {
	$nis = $_GET['nis'];
	$sqlnis = mysqli_query($koneksi, "SELECT * FROM data_siswa WHERE id_siswa = '".$nis."'");;
	$data = mysqli_fetch_array($sqlnis);

	$sqlkls = mysqli_query($koneksi, "SELECT * FROM data_level_siswa X INNER JOIN data_level_semester Y WHERE id_siswa = '".$data['id_siswa']."' GROUP BY id_siswa");
	$dtkls = mysqli_fetch_array($sqlkls);


	$sql = mysqli_query($koneksi, "INSERT INTO data_siswa_keluar(id_siswa_keluar, tgl_masuk_siswa, tgl_keluar_siswa,id_kelas,id_semester,id_siswa, nisn, nis, nama_siswa, jk, tempat_lahir, tanggal_lahir, id_agama, pend_sebelumnya, alamat_serta_didik, nama_ayah, nama_ibu, pekerjaan_ayah, pekerjaan_ibu, jalan, desa_kelurahan, kecamatan, kabupaten_kota, provinsi, no_telp_hp, nama_wali, pekerjaan_wali, alamat_wali, no_telp_hp_wali, tahun_ajaran_awal, tahun_ajaran_akhir) VALUES(
		'".$datsiswa."', '".$data['tgl_masuk_siswa']."','".$date_keluar."','".$dtkls['id_kelas']."','".$dtkls['id_semester']."',
		'".$data['id_siswa']."',
		'".$data['nisn']."',
		'".$data['nis']."',
		'".$data['nama_siswa']."',
		'".$data['jk']."',
		'".$data['tempat_lahir']."',
		'".$data['tanggal_lahir']."',
		'".$data['id_agama']."',
		'".$data['pend_sebelumnya']."',
		'".$data['alamat_serta_didik']."',
		'".$data['nama_ayah']."',
		'".$data['nama_ibu']."',
		'".$data['pekerjaan_ayah']."',
		'".$data['pekerjaan_ibu']."',
		'".$data['jalan']."',
		'".$data['desa_kelurahan']."',
		'".$data['kecamatan']."',
		'".$data['kabupaten_kota']."',
		'".$data['provinsi']."',
		'".$data['no_telp_hp']."',
		'".$data['nama_wali']."',
		'".$data['pekerjaan_wali']."',
		'".$data['alamat_wali']."',
		'".$data['no_telp_hp_wali']."',
		'".$data['tahun_ajaran_awal']."',
		'".$data['tahun_ajaran_akhir']."')");

	$delet = mysqli_query($koneksi, "DELETE FROM data_level_siswa WHERE id_siswa = '".$data['id_siswa']."'");

	if ($sql && $delet) {
		echo "<script>
		alert('Data berhasil disimpan');
		document.location.href = '../../admin.php?page=siswa_keluar';
		</script>";
	}else{
		echo "<script>
		alert('Data gagal disimpan');
		document.location.href = '../../admin.php?page=siswa_keluar';
		</script>";
	}
}
?>