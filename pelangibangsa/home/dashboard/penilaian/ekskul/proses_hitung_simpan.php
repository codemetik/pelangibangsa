<?php 
include "koneksi.php";

if (isset($_POST['simpan'])) {

    $id_siswa = $_POST['id_siswa'];
    $id_kelas = $_POST['id_kelas'];
    $id_semester = $_POST['id_semester'];

    $sqli = mysqli_query($koneksi, "SELECT * FROM data_siswa WHERE id_siswa ='".$id_siswa."'");
    $siswanya = mysqli_fetch_array($sqli);

$sql1 = mysqli_query($koneksi, "SELECT * FROM tb_ekskul_wajib where id_siswa = '".$id_siswa."' AND id_kelas = '".$id_kelas."' AND id_semester = '".$id_semester."'");
$data1 = mysqli_num_rows($sql1);

$sql2 = mysqli_query($koneksi, "SELECT * FROM tb_ekskul_pil1 where id_siswa = '".$id_siswa."' AND id_kelas = '".$id_kelas."' AND id_semester = '".$id_semester."'");
$data2 = mysqli_num_rows($sql2);

$sql3 = mysqli_query($koneksi, "SELECT * FROM tb_ekskul_pil2 where id_siswa = '".$id_siswa."' AND id_kelas = '".$id_kelas."' AND id_semester = '".$id_semester."'");
$data3 = mysqli_num_rows($sql3);

$sql4 = mysqli_query($koneksi, "SELECT * FROM tb_ekskul_pil3 where id_siswa = '".$id_siswa."' AND id_kelas = '".$id_kelas."' AND id_semester = '".$id_semester."'");
$data4 = mysqli_num_rows($sql4);

if (($data1 == 1) && ($data2 == 1) && ($data3 == 1) && ($data4 == 1)) {
    echo "<script>
    alert('Silahkan hapus terlebih dahulu nilai ekskul sebelumnya');
    document.location.href = '../../?page=nilai&id=".$siswanya['nama_siswa']."';
    </script>";
}else{
//buka else

    $ekskulWajib = $_POST['ekskulWajib'];
    $muatanW_1 = $_POST['muatanW_1']; $gradeWajib_1 = $_POST['gradeWajib_1'];
    $muatanW_2 = $_POST['muatanW_2']; $gradeWajib_2 = $_POST['gradeWajib_2'];
    $muatanW_3 = $_POST['muatanW_3']; $gradeWajib_3 = $_POST['gradeWajib_3'];

    $ekskulPil1 = $_POST['ekskulPil1'];
    $muatanP1_1 = $_POST['muatanP1_1']; $gradeMuatanP1_1 = $_POST['gradeMuatanP1_1'];
    $muatanP1_2 = $_POST['muatanP1_2']; $gradeMuatanP1_2 = $_POST['gradeMuatanP1_2'];
    $muatanP1_3 = $_POST['muatanP1_3']; $gradeMuatanP1_3 = $_POST['gradeMuatanP1_3'];

    $ekskulPil2 = $_POST['ekskulPil2']; 
    $muatanP2_1 = $_POST['muatanP2_1']; $gradeMuatanP2_1 = $_POST['gradeMuatanP2_1'];
    $muatanP2_2 = $_POST['muatanP2_2']; $gradeMuatanP2_2 = $_POST['gradeMuatanP2_2'];
    $muatanP2_3 = $_POST['muatanP2_3']; $gradeMuatanP2_3 = $_POST['gradeMuatanP2_3'];

    $ekskulPil3 = $_POST['ekskulPil3'];
    $muatanP3_1 = $_POST['muatanP3_1']; $gradeMuatanP3_1 = $_POST['gradeMuatanP3_1'];
    $muatanP3_2 = $_POST['muatanP3_2']; $gradeMuatanP3_2 = $_POST['gradeMuatanP3_2'];
    $muatanP3_3 = $_POST['muatanP3_3']; $gradeMuatanP3_3 = $_POST['gradeMuatanP3_3'];

    $id_siswa = $_POST['id_siswa'];
    $id_kelas = $_POST['id_kelas'];
    $id_semester = $_POST['id_semester'];

    $id_ekswajib = $_POST['id_ekswajib'];
    $id_ekspil1 = $_POST['id_ekspil1'];
    $id_ekspil2 = $_POST['id_ekspil2'];
    $id_ekspil3 = $_POST['id_ekspil3'];


    $tgl_raport = $_POST['tgl_raport'];
    $tahun_awal = $_POST['tahun_awal'];
    $tahun_akhir = $_POST['tahun_akhir'];

    $sqwajib = mysqli_query($koneksi, "SELECT * FROM ekstrakurikuler WHERE id_ekstra ='".$ekskulWajib."'");
    $idwajib = mysqli_fetch_array($sqwajib);

    $sqpil1 = mysqli_query($koneksi, "SELECT * FROM ekstrakurikuler WHERE id_ekstra ='".$ekskulPil1."'");
    $idpil1 = mysqli_fetch_array($sqpil1);

    $sqpil2 = mysqli_query($koneksi, "SELECT * FROM ekstrakurikuler WHERE id_ekstra ='".$ekskulPil2."'");
    $idpil2 = mysqli_fetch_array($sqpil2);

    $sqpil3 = mysqli_query($koneksi, "SELECT * FROM ekstrakurikuler WHERE id_ekstra ='".$ekskulPil3."'");
    $idpil3 = mysqli_fetch_array($sqpil3);

    $sqlid = mysqli_query($koneksi, "SELECT * FROM data_siswa WHERE id_siswa ='".$id_siswa."'");
    $siswa = mysqli_fetch_array($sqlid);

    // $ket1 = "$muatanW_1, $muatanW_2, dan $muatanW_3";
    // $ket2 = "Mampu melakukan $muatanP1_1, $muatanP1_2, dan $muatanP1_3";
    // $ket3 = "Mampu melakukan $muatanP2_1, $muatanP2_2, dan $muatanP2_3";
    // $ket4 = "Mampu melakukan $muatanP3_1, $muatanP3_2, dan $muatanP3_3";

    //menghitung nilai dan deskripsi
    if ($gradeWajib_1 == 'A') {
        $nil = 4;
        $g1 ="Sangat baik ";
        $ket1 = $muatanW_1;
    }else if($gradeWajib_1 == 'B'){
        $nil = 3;
        $g1 ="Baik";
        $ket1 = $muatanW_1;
    }else if($gradeWajib_1 == 'C'){
        $nil = 2;
        $g1 ="Cukup baik";
        $ket1 = $muatanW_1;
    }else{
        $nil = 1;
        $g1 ="";
        $ket1 = $muatanW_1;
    }

    if ($gradeWajib_2 == 'A') {
        $nil = 4;
        $g2 ="Sangat baik";
        $ket2 = $muatanW_2;
    }else if($gradeWajib_2 == 'B'){
        $nil = 3;
        $g2 ="Baik";
        $ket2 = $muatanW_2;
    }else if($gradeWajib_2 == 'C'){
        $nil = 2;
        $g2 ="Cukup baik";
        $ket2 = $muatanW_2;
    }else{
        $nil = 1;
        $g2 ="";
        $ket2 = $muatanW_2;
    }

    if ($gradeWajib_3 == 'A') {
        $nil = 4;
        $g3 ="Sangat baik";
        $ket3 = $muatanW_3;
    }else if($gradeWajib_3 == 'B'){
        $nil = 3;
        $g3 ="Baik";
        $ket3 = $muatanW_3;
    }else if($gradeWajib_3 == 'C'){
        $nil = 2;
        $g3 ="Cukup baik";
        $ket3 = $muatanW_3;
    }else{
        $nil = 1;
        $g3 ="";
        $ket3 = $muatanW_3;
    }
        //mulai menghitung grade muatan wajib
        if ($nil >= 4) {
            $nilai = 'A';
            $hasil = 'Sangat baik';
        }else if ($nil >=3) {
            $nilai = 'B';
            $hasil = 'baik';
        }else if ($nil >= 2) {
            $nilai = 'C';
            $hasil = 'Perlu bimbingan';
        }
    
    //hitung ekskul pil1
    if ($gradeMuatanP1_1 == 'A') {
        $nil1 = 4;
        $g4 ="Sangat baik";
        $ket4 = $muatanP1_1;
    }else if($gradeMuatanP1_1 == 'B'){
        $nil11 = 3;
        $g4 ="Bail";
        $ket4=$muatanP1_1;
    }else if($gradeMuatanP1_1 == 'C'){
        $nil1 = 2;
        $g4 = "Cukup baik";
        $ket4=$muatanP1_1;
    }else{
        $nil1 = 1;
        $g4 = "";
        $ket4=$muatanP1_1;
    }

    if ($gradeMuatanP1_2 == 'A') {
        $nil1 = 4;
        $g5 ="Sangat baik";
        $ket5 = $muatanP1_2;
    }else if($gradeMuatanP1_2 == 'B'){
        $nil11 = 3;
        $g5 ="Bail";
        $ket5=$muatanP1_2;
    }else if($gradeMuatanP1_2 == 'C'){
        $nil1 = 2;
        $g5 = "Cukup baik";
        $ket5=$muatanP1_2;
    }else{
        $nil1 = 1;
        $g5 = "";
        $ket5=$muatanP1_2;
    }

    if ($gradeMuatanP1_3 == 'A') {
        $nil1 = 4;
        $g6 ="Sangat baik";
        $ket6 = $muatanP1_3;
    }else if($gradeMuatanP1_3 == 'B'){
        $nil11 = 3;
        $g6 ="Bail";
        $ket6=$muatanP1_3;
    }else if($gradeMuatanP1_3 == 'C'){
        $nil1 = 2;
        $g6 = "Cukup baik";
        $ket6=$muatanP1_3;
    }else{
        $nil1 = 1;
        $g6 = "";
        $ket6=$muatanP1_3;
    }
    //Mulai menghitung grade muatan ekskulpil_1
        if ($nil1 >= 4) {
            $nilai1 = 'A';
            $hasil1 = 'Sangat baik';
        }else if ($nil1 >= 3) {
            $nilai1 = 'B';
            $hasil1 = 'baik';
        }else if ($nil1 >= 2) {
            $nilai1 = 'C';
            $hasil1 = 'Perlu bimbingan';
        }
    
    //menghitung ekskulpil2
    if ($gradeMuatanP2_1 == 'A') {
        $nil2 = 4;
        $g7 ="Sangat baik";
        $ket7 = $muatanP2_1;
    }else if($gradeMuatanP1_1 == 'B'){
        $nil2 = 3;
        $g7 ="Bail";
        $ket7=$muatanP2_1;
    }else if($gradeMuatanP2_1 == 'C'){
        $nil2 = 2;
        $g7 = "Cukup baik";
        $ket7=$muatanP2_1;
    }else{
        $nil2 = 1;
        $g7 = "";
        $ket7=$muatanP2_1;
    }

    if ($gradeMuatanP2_2 == 'A') {
        $nil2 = 4;
        $g8 ="Sangat baik";
        $ket8 = $muatanP2_2;
    }else if($gradeMuatanP2_2 == 'B'){
        $nil2 = 3;
        $g8 ="Bail";
        $ket8=$muatanP2_2;
    }else if($gradeMuatanP2_2 == 'C'){
        $nil2 = 2;
        $g8 = "Cukup baik";
        $ket8=$muatanP2_2;
    }else{
        $nil2 = 1;
        $g8 = "";
        $ket8=$muatanP2_2;
    }

    if ($gradeMuatanP2_3 == 'A') {
        $nil1 = 4;
        $g9 ="Sangat baik";
        $ket9 = $muatanP2_3;
    }else if($gradeMuatanP2_3 == 'B'){
        $nil11 = 3;
        $g9 ="Bail";
        $ket9=$muatanP2_3;
    }else if($gradeMuatanP2_3 == 'C'){
        $nil1 = 2;
        $g9 = "Cukup baik";
        $ket9=$muatanP2_3;
    }else{
        $nil1 = 1;
        $g9 = "";
        $ket9=$muatanP2_3;
    }
    //Mulai menghitung grade muatan ekskulpi2
    if ($nil2 >= 4) {
            $nilai2 = 'A';
            $hasil2 = 'Sangat baik';
        }else if ($nil2 >= 3) {
            $nilai2 = 'B';
            $hasil2 = 'baik';
        }else if ($nil2 >= 2) {
            $nilai2 = 'C';
            $hasil2 = 'Perlu bimbingan';
        }
    
    //menghitung ekskulpil3
    if ($gradeMuatanP3_1 == 'A') {
        $nil3 = 4;
        $g10 ="Sangat baik";
        $ket10 = $muatanP3_1;
    }else if($gradeMuatanP3_1 == 'B'){
        $nil3 = 3;
        $g10 ="Bail";
        $ket10=$muatanP3_1;
    }else if($gradeMuatanP3_1 == 'C'){
        $nil3 = 2;
        $g10 = "Cukup baik";
        $ket10=$muatanP3_1;
    }else{
        $nil3 = 1;
        $g10 = "";
        $ket10=$muatanP3_1;
    }

    if ($gradeMuatanP3_2 == 'A') {
        $nil3 = 4;
        $g11 ="Sangat baik";
        $ket11 = $muatanP3_2;
    }else if($gradeMuatanP3_2 == 'B'){
        $nil3 = 3;
        $g11 ="Bail";
        $ket11=$muatanP3_2;
    }else if($gradeMuatanP3_2 == 'C'){
        $nil3 = 2;
        $g11 = "Cukup baik";
        $ket11=$muatanP3_2;
    }else{
        $nil3 = 1;
        $g11 = "";
        $ket11=$muatanP3_2;
    }

    if ($gradeMuatanP3_3 == 'A') {
        $nil3 = 4;
        $g12 ="Sangat baik";
        $ket12 = $muatanP3_3;
    }else if($gradeMuatanP3_3 == 'B'){
        $nil3 = 3;
        $g12 ="Bail";
        $ket12=$muatanP3_3;
    }else if($gradeMuatanP3_3 == 'C'){
        $nil3 = 2;
        $g12 = "Cukup baik";
        $ket12=$muatanP3_3;
    }else{
        $nil3 = 1;
        $g12 = "";
        $ket12=$muatanP3_3;
    }
    //Mulai menghitung grade muatan ekskulpi3
    if ($nil3 >= 4) {
            $nilai3 = 'A';
            $hasil3 = 'Sangat baik';
        }else if ($nil3 >= 3) {
            $nilai3 = 'B';
            $hasil3 = 'baik';
        }else if ($nil3 >= 2) {
            $nilai3 = 'C';
            $hasil3 = 'Perlu bimbingan';
        }

    //tutup hitungan
    /*
    POST
$ekskulWajib
$ekskulPil1
$ekskulPil2
$ekskulPil3

insertnya
$idwajib['kegiatan'] $ekskulWajib
$idpil1['kegiatan'] $ekskulPil1
$idpil2['kegiatan'] $ekskulPil2
$idpil3['kegiatan'] $ekskulPil3
    */

    if (($ekskulWajib == true)|| ($muatanW_1 == true) ||($muatanW_2 == true) || ($muatanW_3 == true) || 
        ($gradeWajib_1 == true) || ($gradeWajib_2 == true) || ($gradeWajib_3 == true)) {
        $inilw = $nilai;
        $ekskulW = $ekskulWajib; //
        $idw = $idwajib['kegiatan']; //
        $preWajib = "Ananda ".$siswanya['nama_siswa']." ".$g1." dalam ".$ket1.", ".$g2." ".$ket2.", dan ".$g3." ".$ket3.".";
    }else if(($ekskulWajib == false)||($muatanW_1 == false) ||($muatanW_2 == false) || ($muatanW_3 == false) ||
        ($gradeWajib_1 == true) || ($gradeWajib_2 == true) || ($gradeWajib_3 == true)){
        $inilw = "-";
        $preWajib = "-";
        $ekskulW = "-"; //
        $idw = "-"; //
    }

    if (($ekskulPil1 == true)||($muatanP1_1 == true) || ($muatanP1_2 == true) || ($muatanP1_3 == true) || 
        ($gradeMuatanP1_1 == true) ||($gradeMuatanP1_2 == true) || ($gradeMuatanP1_3 == true)) {
        $inilp1 = $nilai1;
        $ekskulP1 = $ekskulPil1; //
        $idp1 = $idpil1['kegiatan']; //
        $prePil1 = "Ananda ".$siswanya['nama_siswa']." ".$g4." dalam ".$ket4.", ".$g5." ".$ket5.", dan ".$g6." ".$ket6.".";
    }else if(($ekskulPil1 == false)||($muatanP1_1 == false) || ($muatanP1_2 == false) || ($muatanP1_3 == false) || 
        ($gradeMuatanP1_1 == false) ||($gradeMuatanP1_2 == false) || ($gradeMuatanP1_3 == false)){
        $inilp1 = "-";
        $prePil1 = "-";
        $ekskulP1 = "-"; //
        $idp1 = "-"; //
    }

    if (($ekskulPil2 == true)||($muatanP2_1 == true) || ($muatanP2_2 == true) || ($muatanP2_3 == true) || 
        ($gradeMuatanP2_1 == true) ||($gradeMuatanP2_2 == true) || ($gradeMuatanP2_3 == true)) {
        $inilp2 = $nilai2;
        $ekskulP2 = $ekskulPil2; //
        $idp2 = $idpil2['kegiatan']; // 
        $prePil2 = "Ananda ".$siswanya['nama_siswa']." ".$g7." dalam ".$ket7.", ".$g8." ".$ket8.", dan ".$g9." ".$ket9.".";
    }else if(($ekskulPil2 == false)||($muatanP2_1 == false) || ($muatanP2_2 == false) || ($muatanP2_3 == false) || 
        ($gradeMuatanP2_1 == false) ||($gradeMuatanP2_2 == false) || ($gradeMuatanP2_3 == false)){
        $inilp2 = "-";
        $prePil2 = "-";
        $ekskulP2 = "-"; //
        $idp2 = "-"; //
    }

    if (($ekskulPil3 == true)||($muatanP3_1 == true) || ($muatanP3_2 == true) || ($muatanP3_3 == true) || 
        ($gradeMuatanP3_1 == true) ||($gradeMuatanP3_2 == true) || ($gradeMuatanP3_3 == true)) {
        $inilp3 = $nilai3;
        $ekskulP3 = $ekskulPil3; //
        $idp3 = $idpil3['kegiatan']; //
        $prePil3 = "Ananda ".$siswanya['nama_siswa']." ".$g10." dalam ".$ket10.", ".$g11." ".$ket11.", dan ".$g12." ".$ket12.".";
    }else if(($ekskulPil3 == false)||($muatanP3_1 == false) || ($muatanP3_2 == false) || ($muatanP3_3 == false) || 
        ($gradeMuatanP3_1 == false) ||($gradeMuatanP3_2 == false) || ($gradeMuatanP3_3 == false)){
        $inilp3 = "-";
        $prePil3 = "-";
        $ekskulP3 = "-"; //
        $idp3 = "-"; //
    }

//buka query input
    //insert ekskulwajib
    $queryw = mysqli_query($koneksi, "INSERT INTO tb_ekskul_wajib(id_siswa, id_kelas, id_semester, id_ekskul_wajib, id_ekstra, kegiatan, predikat, keterangan, tgl_raport, tahun_ajaran_awal, tahun_ajaran_akhir) VALUES('".$id_siswa."','".$id_kelas."','".$id_semester."','".$id_ekswajib."','".$ekskulW."','".$idw."','".$inilw."','".$preWajib."','".$tgl_raport."','".$tahun_awal."','".$tahun_akhir."')");
    //insert ekskulpil1
    $querypil1 = mysqli_query($koneksi, "INSERT INTO tb_ekskul_pil1(id_siswa, id_kelas, id_semester, id_ekskul_pil1, id_ekstra, kegiatan, predikat, keterangan, tgl_raport, tahun_ajaran_awal, tahun_ajaran_akhir) VALUES('".$id_siswa."','".$id_kelas."','".$id_semester."','".$id_ekspil1."','".$ekskulP1."','".$idp1."','".$inilp1."','".$prePil1."','".$tgl_raport."','".$tahun_awal."','".$tahun_akhir."')");
    //insert ekskulpil2
    $querypil2 = mysqli_query($koneksi, "INSERT INTO tb_ekskul_pil2(id_siswa, id_kelas, id_semester, id_ekskul_pil2, id_ekstra, kegiatan, predikat, keterangan, tgl_raport, tahun_ajaran_awal, tahun_ajaran_akhir) VALUES('".$id_siswa."','".$id_kelas."','".$id_semester."','".$id_ekspil2."','".$ekskulP2."','".$idp2."','".$inilp2."','".$prePil2."','".$tgl_raport."','".$tahun_awal."','".$tahun_akhir."')");
    //insert ekskulpil3
    $querypil3 = mysqli_query($koneksi, "INSERT INTO tb_ekskul_pil3(id_siswa, id_kelas, id_semester, id_ekskul_pil3, id_ekstra, kegiatan, predikat, keterangan, tgl_raport, tahun_ajaran_awal, tahun_ajaran_akhir) VALUES('".$id_siswa."','".$id_kelas."','".$id_semester."','".$id_ekspil3."','".$ekskulP3."','".$idp3."','".$inilp3."','".$prePil3."','".$tgl_raport."','".$tahun_awal."','".$tahun_akhir."')");

    if ($queryw && $querypil1 && $querypil2 & $querypil3) {
        echo "<script>
        alert('Data berhasil di simpan');
        document.location.href = '../../?page=nilai&id=".$siswa['nama_siswa']."';
        </script>";
    }else{
        echo "<script>
        alert('Data Gagar disimpan');
        document.location.href = '../../?page=nilai&id=".$siswa['nama_siswa']."';
        </script>";

    }
    //tutup query input


}//tutup else

}
?>