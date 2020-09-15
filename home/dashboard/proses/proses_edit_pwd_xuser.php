<?php 
include "../../../connect.php";

if (isset($_POST['simpan_pwd'])) {
	$newpassword = md5($_POST['newpassword']);
	$newpasswordconfirm = md5($_POST['newpasswordconfirm']);
	$id_user = $_POST['id_user'];

	if ($newpassword == $newpasswordconfirm) {
		$sql = mysqli_query($koneksi, "UPDATE user SET password = '".$newpassword."', confirm_password = '".$newpasswordconfirm."' WHERE id_user = '".$id_user."'");

		if ($sql) {
			echo "<script>
			alert('Perubahan berhasil disimpan');
			document.location.href = '../../xuser';
			</script>";
		}else{
			echo "<script>
			alert('Perubahan gagal disimpan');
			document.location.href = '../../xuser';
			</script>";
		}
	}else if($newpassword != $newpasswordconfirm){
		echo "<script>
		alert('Password confirmasi harus sama');
		document.location.href = '../../xuser';
		</script>";
	}
	
}
?>