<?php 

$sqwajib = mysqli_query($koneksi, "SELECT * FROM ekstrakurikuler where id_ekstra = '".$_GET['od']."'");
$at = mysqli_fetch_array($sqwajib);

$dat1 = mysqli_query($koneksi, "SELECT * FROM tb_ekskul_wajib where id_ekstra = '".$at['id_ekstra']."'");
$dt1 = mysqli_fetch_assoc($dat1);

$dat2 = mysqli_query($koneksi, "SELECT * FROM tb_ekskul_pil1 where id_ekstra = '".$at['id_ekstra']."'");
$dt2 = mysqli_fetch_assoc($dat2);

$dat3 = mysqli_query($koneksi, "SELECT * FROM tb_ekskul_pil2 where id_ekstra = '".$at['id_ekstra']."'");
$dt3 = mysqli_fetch_assoc($dat3);

$dat4 = mysqli_query($koneksi, "SELECT * FROM tb_ekskul_pil3 where id_ekstra = '".$at['id_ekstra']."'");
$dt4 = mysqli_fetch_assoc($dat4);

if($dt1['id_ekstra'] == $at['id_ekstra']) {
    //tb_ekskul_wajib
    include_once("../edit/milikwajib.php");
}else if($dt2['id_ekstra'] == $at['id_ekstra']){
    //tb_ekskul_pil1
    include_once("../edit/milikpil1.php");
}else if($dt3['id_ekstra'] == $at['id_ekstra']){
    //tb_ekskul_pil2
    include_once("../edit/milikpil2.php");
}else if($dt4['id_ekstra'] == $at['id_ekstra']){
    //tb_ekskul_pil3
    include_once("../edit/milikpil3.php");
}else{
   echo "data tidak ada di table manapun";
}
?>