<?php
$sqlcek = mysqli_query($koneksi, "SELECT * FROM nilai_raport_ki3 WHERE id_mapel = '".$dasis['id_mapel']."' AND id_siswa = '".$siswa['id_siswa']."' AND id_kelas = '".$dtsq1['id_kelas']."' AND id_semester = '".$dtsq2['id_semester']."'");
$cekmpl = mysqli_num_rows($sqlcek);
if ($cekmpl == 1) {
    $cek = "<label class='label label-success'>ok</label>";
}else{
    $cek = "<label class='label label-danger'>nilai</label>";
}
?>