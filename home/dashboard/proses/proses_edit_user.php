<?php 
include "../../../connect.php";

if (isset($_POST['simpan'])) {

	$id_user = $_POST['id_user'];
	$username = $_POST['username'];
	$nama_depan = $_POST['nama_depan'];
	$nama_belakang = $_POST['nama_belakang'];
	// $nip = $_POST['nip'];
	// $niy = $_POST['niy'];
	$nuptk = $_POST['nuptk'];
	$tmpt_lahir = $_POST['tempat_lahir'];
	$tgl_lahir = $_POST['tanggal_lahir'];
	$alamat = $_POST['alamat'];
	$email = $_POST['email'];
	$id_position = $_POST['id_position'];
	$password = md5($_POST['password']);
	$confirm_password = md5($_POST['confirm_password']);

	$sqlus = mysqli_query($koneksi, "SELECT * FROM user WHERE id_user = '".$id_user."'");
	$dt = mysqli_fetch_array($sqlus);

	$sql = mysqli_query($koneksi, "UPDATE user SET id_user = '".$id_user."',
		username = '".$username."',
		nama_depan = '".$nama_depan."',
		nama_belakang = '".$nama_belakang."',
		nuptk = '".$nuptk."',
		tempat_lahir = '".$tmpt_lahir."',
		tanggal_lahir = '".$tgl_lahir."',
		alamat = '".$alamat."',
		email = '".$email."',
		password = '".$password."',
		confirm_password = '".$confirm_password."',
		id_position = '".$id_position."'
		WHERE id_user = '".$id_user."'");

	if ($sql) {
		echo "<script>
		alert('Data berhasil disimpan');
		document.location.href = '../../admin';
		</script>";
	}else{
		echo "<script>
		alert('Data gagal disimpan');
		document.location.href = '../../admin';
		</script>";
	}
}
?>