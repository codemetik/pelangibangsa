<?php 
include "../../../connect.php";

if (isset($_POST['simpan'])) {

	$iduser = $_POST['id_user'];
	$id_master = $_POST['id_master'];
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
	$password = md5($_POST['password']);
	$confirm = md5($_POST['confirm_password']);
	$id_position = $_POST['id_position'];
	$id_kelas = $_POST['id_kelas'];


	$sql = mysqli_query($koneksi, "UPDATE user SET id_user = '".$iduser."',
		username = '".$username."',
		nama_depan = '".$nama_depan."',
		nama_belakang = '".$nama_belakang."',
		nuptk = '".$nuptk."',
		tempat_lahir = '".$tmpt_lahir."',
		tanggal_lahir = '".$tgl_lahir."',
		alamat = '".$alamat."',
		email = '".$email."',
		password = '".$password."',
		confirm_password = '".$confirm."',
		id_position = '".$id_position."'
		WHERE id_user = '".$iduser."'
		");

$cekposisi = mysqli_query($koneksi, "SELECT * FROM user WHERE id_user = '".$iduser."' AND id_position = 'PS03'");
$dtcek = mysqli_fetch_array($cekposisi);
if ($id_position == $dtcek['id_position']) {

	$cekmaster = mysqli_query($koneksi, "SELECT * FROM master_level WHERE id_user = '".$iduser."'");
	$cekmstr = mysqli_num_rows($cekmaster);
	if ($cekmstr == 0) {

		$sql1 = mysqli_query($koneksi, "INSERT INTO master_level(id_master, id_user, id_position, id_kelas) VALUES('".$id_master."', '".$iduser."', '".$id_position."', '".$id_kelas."')");

	}else if($cekmstr == 1){

		$sql1 = mysqli_query($koneksi, "UPDATE master_level SET id_master = '".$id_master."', id_user = '".$iduser."', id_position = '".$id_position."', id_kelas = '".$id_kelas."' WHERE id_master = '".$id_master."'");

	}else{
		echo "Error";
	}
	

}else if($id_position != $dtcek['id_position']){

	$sql1 = mysqli_query($koneksi, "DELETE FROM master_level WHERE id_master = '".$id_master."'");

}else{
	echo "Error";
}

	if ($sql && $sql1) {
		echo "<script>
		alert('Data berhasil disimpan');
		document.location.href = '../../admin.php?page=data_user';
		</script>";
	}else{
		echo "<script>
		alert('Data gagal disimpan');
		document.location.href = '../../admin.php?page=data_user';
		</script>";
	}
}
?>