<?php
include "../../../connect.php";

if (isset($_POST['simpan'])) {


	$id_level_siswa = $_POST['id_level_siswa'];
	$id_siswa = $_POST['id_siswa'];
	$id_kelas = $_POST['id_kelas'];
	$id_user = $_POST['id_user'];

	$isi = count($id_siswa);

	if ($id_siswa == true) {

		for ($i=0; $i < $isi; $i++) { 
		$sql = mysqli_query($koneksi, "INSERT INTO data_level_siswa(id_level_siswa, id_siswa, id_kelas, id_user) VALUES('".$id_level_siswa[$i]."','".$id_siswa[$i]."','".$id_kelas[$i]."','".$id_user[$i]."')");
		if ($sql) {
			echo "<script>
			alert('Data siswa berhasil ditarik');
			document.location.href = '../../admin.php?page=tarik_siswa_inkelas';
			</script>";
		}else{
			echo "<script>
			alert('Data siswa gagal ditarik');
			document.location.href = '../../admin.php?page=tarik_siswa_inkelas';
			</script>";
		}		
	}	
	}else if ($id_siswa == false) {
		echo "<script>
			alert('Maaf, Silahkan pilih nama dahulu');
			document.location.href = '../../admin.php?page=tarik_siswa_inkelas';
			</script>";
	}
	
}
?>