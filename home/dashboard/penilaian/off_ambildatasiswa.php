<?php 
$querysis = mysqli_query($koneksi, "SELECT * FROM data_siswa WHERE id_siswa = '".$data['id_siswa']."'");
$sqlsis = mysqli_fetch_array($querysis);
?>