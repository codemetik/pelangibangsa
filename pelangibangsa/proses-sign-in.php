<?php 
session_start();
include "header.php";
include "connect.php";

if (isset($_POST['submit'])) {

	$user = $_POST['username'];
	$pwd = md5($_POST['password']);
	$group_position = $_POST['name_position'];
	$rememberme = $_POST['rememberme'];
	
	$posisi = mysqli_query($koneksi, "SELECT * FROM position Y 
		INNER JOIN user X ON X.`id_position` = Y.id_position WHERE username ='".$user."' AND password = '".$pwd."'");
	$valid_check = mysqli_query($koneksi, "SELECT * FROM position Y INNER JOIN user X ON X.`id_position` = Y.id_position
		WHERE username = '".$user."'");
	$check = mysqli_num_rows($posisi);
	$group_valid = mysqli_fetch_array($valid_check);
	$valid = $group_valid['name_position'];
	if ($check > 0  ) {
		
	// if (!empty($rememberme)) {
	    $query = mysqli_query($koneksi, "SELECT * FROM user WHERE username = '".$user."' AND password = '".$pwd."'");
	    $login = mysqli_num_rows($query);
	    $data = mysqli_fetch_array($query);
	    if ($login > 0) {
	    	//session untuk mengambil id_user
	    	$id_user =  $data['id_user'];
	    	$_SESSION['id_user'] = $id_user;
	    	//session / ambil id_posisi user
	    	$id_position = $data['id_position'];
	    	$_SESSION['posisi'] = $id_position;
	    	//session username
	    	$_SESSION['user'] = $user;
	    	//session id_user
	    	$_SESSION['id_user'] = $data['id_user'];
	    	//session email 
	    	$_SESSION['email'] = $data['email'];
	    	//session berdasarkan group;
			$_SESSION['group_position'] = $group_position;
			//ambil name_position untuk level berdasarkan username dan password dari query $posisi
			$_SESSION['name_position'] = $valid;
			//ambil nama sekolah
			$_SESSION['sekolah'] = 'Pelangi Bangsa';
			$_SESSION['judul'] = 'PELANGI BANGSA';
		    
		    echo "<script>
				alert('Anda masuk sebagai : ".$valid.".');
		            window.location.href = 'home';
			</script>";
	    }else{
	    	echo "<script>
				alert('Maaf. Username atau password anda salah!.');
				document.location.href = '../sign-in.php';
			</script>";
	    }
	// }else{
	// 	echo "<script>
	// 			alert('Please Chacked');
	// 			document.location.href = 'sign-in.php';
	// 		</script>";
	// }
}else{
	echo "<script>
				alert('Maaf level anda : ".$valid." , atau username or password salah');
				document.location.href = 'index.php';
			</script>";	
}


}
?>