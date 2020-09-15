<?php
//include query
include "../../../connect.php";

if (isset($_POST['submit'])) {
//variable superglobal
	$iduser = $_POST['id_user'];
	$username = $_POST['username'];
	$nama_depan = $_POST['nama_depan'];
	$nama_belakang = $_POST['nama_belakang'];
	// $nip = $_POST['nip'];
	// $niy = $_POST['niy'];
	$nuptk = $_POST['nuptk'];
	$tempat_lahir = $_POST['tempat_lahir'];
	$tanggal_lahir = $_POST['tanggal_lahir'];
	$alamat = $_POST['alamat'];
	$email = $_POST['email'];
	$password = md5($_POST['password']);
	$confirm = md5($_POST['confirm']);
	$id_position = $_POST['id_position'];

	//checked dulu
	$terms = $_POST['terms'];
	if (!empty($terms)) {

		$query = mysqli_query($koneksi, "INSERT INTO user(id_user, username, nama_depan, nama_belakang, nuptk, tempat_lahir, tanggal_lahir, alamat,email, password, confirm_password, id_position) 
		VALUES('$iduser','$username','$nama_depan','$nama_belakang','$nuptk','$tempat_lahir','$tanggal_lahir','$alamat','$email','$password','$confirm','$id_position')");
		
		//lakukan jika data berhasil masuk
		if ($query) {
				echo "<script>
			alert('Data berhasil di inputkan.');
			document.location.href = '../../admin.php?page=add_kelas';
		</script>";
		}else{
			//Kondisi jika data yg sama sudah ada
				echo "<script>
			alert('Data sudah ada.');
			document.location.href = '../../admin.php?page=add_user';
		</script>";
			}

	}else{
		//kodisi jika chacked kosong
		echo "<script>
			alert('Please Chacked');
			document.location.href = 'sign-up.php';
		</script>";
	}
}
?>