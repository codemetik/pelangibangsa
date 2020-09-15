<?php 

$id_map = $data['id_mapel'];
$id_sis = $data['id_siswa'];
$id_kls = $datakkm['id_kelas'];
$id_smt = $datakkm['id_semester'];
$koneksi = $koneksi;

function kkm(){

	global $id_map;
	global $id_sis;
	global $id_kls;
	global $id_smt;
	global $koneksi;
	global $km;

	$sqlhit = mysqli_query($koneksi, "SELECT * FROM hitung_kd WHERE id_mapel = '".$id_map."' AND id_siswa = '".$id_sis."' AND id_kelas = '".$id_kls."' AND id_semester = '".$id_smt."' ORDER BY id_mapel ASC");
while ($datasql = mysqli_fetch_array($sqlhit)) {
	$array[] = array(
		"id_siswa" => $datasql['id_siswa'],
		"id_mapel" => $datasql['id_mapel'],
		"id_kelas" => $datasql['id_kelas'],
		"id_semester" => $datasql['id_semester'],
		"id_kd" => $datasql['id_kd'],
		"nilai_kd" => $datasql['nilai_kd'],
		"deskripsi" => $datasql['deskripsi']
	);
}
	$con = count($array);

	for ($i=0; $i < $con; $i++) { 
		
		$isi = $array[$i]['nilai_kd'];
		$des = $array[$i]['deskripsi'];

		if ($isi >= $km) {

			echo $des.", ";
		}
	}


}

function kkmki4(){

	global $id_map;
	global $id_sis;
	global $id_kls;
	global $id_smt;
	global $koneksi;
	global $km1;

	$sqlhit = mysqli_query($koneksi, "SELECT * FROM hitung_kdki4 WHERE id_mapel = '".$id_map."' AND id_siswa = '".$id_sis."' AND id_kelas = '".$id_kls."' AND id_semester = '".$id_smt."' ORDER BY id_mapel ASC");
while ($datasql = mysqli_fetch_array($sqlhit)) {
	$array[] = array(
		"id_siswa" => $datasql['id_siswa'],
		"id_mapel" => $datasql['id_mapel'],
		"id_kd" => $datasql['id_kd'],
		"nilai_kd" => $datasql['nilai_kd'],
		"deskripsi" => $datasql['deskripsi']
	);
}
	$con = count($array);
	for ($i=0; $i < $con; $i++) { 
		
		$isi = $array[$i]['nilai_kd'];
		$des = $array[$i]['deskripsi'];

		if ($isi >= $km1) {

			echo $des.", ";
		}
	}
}


function kkmagmki3(){

	global $id_map;
	global $id_sis;
	global $id_kls;
	global $id_smt;
	global $koneksi;
	global $km;

	$sqlhit = mysqli_query($koneksi, "SELECT * FROM hitung_kdagm_ki3 WHERE id_mapel = '".$id_map."' AND id_siswa = '".$id_sis."' AND id_kelas = '".$id_kls."' AND id_semester = '".$id_smt."' ORDER BY id_mapel ASC");
while ($datasql = mysqli_fetch_array($sqlhit)) {
	$array[] = array(
		"id_siswa" => $datasql['id_siswa'],
		"id_mapel" => $datasql['id_mapel'],
		"id_kelas" => $datasql['id_kelas'],
		"id_semester" => $datasql['id_semester'],
		"id_kd" => $datasql['id_kd'],
		"nilai_kd" => $datasql['nilai_kd'],
		"deskripsi" => $datasql['deskripsi']
	);
}
	$con = count($array);
	for ($i=0; $i < $con; $i++) { 
		
		$isi = $array[$i]['nilai_kd'];
		$des = $array[$i]['deskripsi'];

		if ($isi >= $km) {

			echo $des.", ";
		}
	}
}

function kkmagmki4(){
	global $id_map;
	global $id_sis;
	global $id_kls;
	global $id_smt;
	global $koneksi;
	global $km1;

	$sqlhit = mysqli_query($koneksi, "SELECT * FROM hitung_kdagm_ki4 WHERE id_mapel = '".$id_map."' AND id_siswa = '".$id_sis."'  AND id_kelas = '".$id_kls."' AND id_semester = '".$id_smt."' ORDER BY id_mapel ASC");
while ($datasql = mysqli_fetch_array($sqlhit)) {
	$array[] = array(
		"id_siswa" => $datasql['id_siswa'],
		"id_mapel" => $datasql['id_mapel'],
		"id_kelas" => $datasql['id_kelas'],
		"id_semester" => $datasql['id_semester'],
		"id_kd" => $datasql['id_kd'],
		"nilai_kd" => $datasql['nilai_kd'],
		"deskripsi" => $datasql['deskripsi']
	);
}
	$con = count($array);
	for ($i=0; $i < $con; $i++) { 
		
		$isi = $array[$i]['nilai_kd'];
		$des = $array[$i]['deskripsi'];

		if ($isi >= $km1) {

			echo $des.", ";
		}
	}
}

?>