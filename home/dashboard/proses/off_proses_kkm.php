<?php

// include "../../../connect.php";

// $no = $_POST['no'];
// $mapel = $_POST['mapel'];
// $kelompok = $_POST['kelompok'];
// $singkat_mapel = $_POST['singkatan_mapel'];
// $kkm_pengetahuan = $_POST['kkm_pengetahuan'];
// $kkm_keterampilan = $_POST['kkm_keterampilan']; 
// $tema = $_POST['tema'];
// $idkelas = $_POST['id_kelas'];
// $idsemester = $_POST['id_semester'];

// if (isset($_POST['submit'])) {
	
// 	$query = mysqli_query($koneksi, "INSERT INTO mapel(id_mapel, nama_mapel, kelompok, singkat_mapel, pengetahuan, keterampilan, tema) VALUES('$no','$mapel','$kelompok','$singkat_mapel','$kkm_pengetahuan','$kkm_keterampilan','$tema')");
// 	if ($query) {

// 		$input_roles = mysqli_query($koneksi, "INSERT INTO roles_mapel(id_kelas, id_semester, id_mapel) VALUES('$idkelas','$idsemester', '$no')");
// 		echo "<script>
// 			alert('Data berhasil masuk.');
// 			document.location.href = '../index.php?page=kkm';
// 		</script>";

// 	}else{
// 		echo "<script>
// 			alert('Data gagal masuk .');
// 			document.location.href = '../index.php?page=kkm';
// 		</script>";
// 	}
// }else{
// 	echo "error";
// }
?>