<?php 
$sqlcek = mysqli_query($koneksi, "SELECT * FROM nilai_raport_ki4 WHERE id_mapel = '".$data1['id_mapel']."' AND id_siswa = '".$siswa['id_siswa']."' AND id_kelas = '".$dtsq1['id_kelas']."' AND id_semester = '".$dtsq2['id_semester']."'");
$cekmpl = mysqli_num_rows($sqlcek);
if ($cekmpl == 1) {
    $cek1 = "<label class='label label-success'>ok</label>";
}else{
    $cek1 = "<label class='label label-danger'>nilai</label>";
}
?>