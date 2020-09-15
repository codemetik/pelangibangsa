<?php
//include query
include "connect.php";

$kdkelas = mysqli_query($koneksi, "SELECT max(id_master) AS maxCode FROM master_level");
        $hasil1 = mysqli_fetch_array($kdkelas);
        $has1 = $hasil1['maxCode'];
        $nOkd1 = (int) substr($has1, 3, 7);
        $nOkd1++; 
        $kdc1 = "MST";
        $id_master = $kdc1 . sprintf("%07s", $nOkd1);

if (isset($_POST['submit'])) {

	//checked dulu
	$terms = $_POST['terms'];
	if (!empty($terms)) {
		//variable superglobal
	$iduser = $_POST['id_user'];
	$username = htmlspecialchars($_POST['username']);
	$nama_depan = htmlspecialchars($_POST['nama_depan']);
	$nama_belakang = htmlspecialchars($_POST['nama_belakang']);
	// $nip = htmlspecialchars($_POST['nip']);
	// $niy = htmlspecialchars($_POST['niy']);
	$nuptk = htmlspecialchars($_POST['nuptk']);
	$tempat_lahir = htmlspecialchars($_POST['tempat_lahir']);
	$tanggal_lahir = $_POST['tanggal_lahir'];
	$alamat = htmlspecialchars($_POST['alamat']);
	$email = $_POST['email'];
	$password = md5($_POST['password']);
	$confirm = md5($_POST['confirm']);
	$id_position = $_POST['id_position'];
		//ambil query mysqli
		if (isset($_POST['id_kelas'])) {
			$idkelas = $_POST['id_kelas'];
			$querykls = mysqli_query($koneksi, "INSERT INTO master_level(id_master, id_user, id_position, id_kelas) 
	VALUES('MST0000008','USR004','PS03','KLS02')");
			$query = mysqli_query($koneksi, "INSERT INTO user(id_user, username, nama_depan, nama_belakang, nuptk, tempat_lahir, tanggal_lahir, alamat,email, password, confirm_password, id_position)
		VALUES('$iduser','$username','$nama_depan','$nama_belakang','$nuptk','$tempat_lahir','$tanggal_lahir','$alamat','$email','$password','$confirm','$id_position')");
			//lakukan jika data berhasil masuk
		if ($querykls && $query) {
				echo "<script>
			alert('Data berhasil di inputkan.');
			document.location.href = 'index.php';
		</script>";
		}else{
			//Kondisi jika data yg sama sudah ada
		// 		echo "<script>
		// 	alert('Data sudah ada.');
		// 	document.location.href = 'index.php';
		// </script>";
			echo error_reporting(E_ALL && ~E_NOTICE);
			}

		}else{

		$query = mysqli_query($koneksi, "INSERT INTO user(id_user, username, nama_depan, nama_belakang, nuptk, tempat_lahir, tanggal_lahir, alamat,email, password, confirm_password, id_position) 
		VALUES('$iduser','$username','$nama_depan','$nama_belakang','$nuptk','$tempat_lahir','$tanggal_lahir','$alamat','$email','$password','$confirm','$id_position')");
		
		//lakukan jika data berhasil masuk
		if ($query) {
				echo "<script>
			alert('Data berhasil di inputkan.');
			document.location.href = 'index.php';
		</script>";
		}else{
			//Kondisi jika data yg sama sudah ada
				echo "<script>
			alert('Data sudah ada.');
			document.location.href = 'index.php';
		</script>";
			}
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