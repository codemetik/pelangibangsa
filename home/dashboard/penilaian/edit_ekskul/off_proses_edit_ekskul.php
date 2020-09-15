<?php 
include "../ekskul/koneksi.php";

if (isset($_POST['simpan'])) {

    $ekskulWajib = $_POST['ekskulWajib'];
    $muatanW_1 = $_POST['muatanW_1'];
    $muatanW_2 = $_POST['muatanW_2'];
    $muatanW_3 = $_POST['muatanW_3'];

    $ekskulPil1 = $_POST['ekskulPil1'];
    $muatanP1_1 = $_POST['muatanP1_1'];
    $muatanP1_2 = $_POST['muatanP1_2'];
    $muatanP1_3 = $_POST['muatanP1_3'];

    $ekskulPil2 = $_POST['ekskulPil2'];
    $muatanP2_1 = $_POST['muatanP2_1'];
    $muatanP2_2 = $_POST['muatanP2_2'];
    $muatanP2_3 = $_POST['muatanP2_3'];

    $ekskulPil3 = $_POST['ekskulPil3'];
    $muatanP3_1 = $_POST['muatanP3_1'];
    $muatanP3_2 = $_POST['muatanP3_2'];
    $muatanP3_3 = $_POST['muatanP3_3'];

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

    $ket1 = "Ananda ".$siswa['nama_siswa']." mampu melakukan $muatanW_1, dan $muatanW_2, dan $muatanW_3";
    $ket2 = "Ananda ".$siswa['nama_siswa']." mampu melakukan $muatanP1_1, dan $muatanP1_2, dan $muatanP1_3";
    $ket3 = "Ananda ".$siswa['nama_siswa']." mampu melakukan $muatanP2_1, dan $muatanP2_2, dan $muatanP2_3";
    $ket4 = "Ananda ".$siswa['nama_siswa']." mampu melakukan $muatanP3_1, dan $muatanP3_2, dan $muatanP3_3";


    $queryw = mysqli_query($koneksi, "UPDATE tb_ekskul_wajib SET id_siswa = '".$id_siswa."', id_kelas = '".$id_kelas."', id_semester = '".$id_semester."', id_ekskul_wajib = '".$id_ekswajib."', id_ekstra = '".$ekskulWajib."', kegiatan = '".$idwajib['kegiatan']."', keterangan = '".$ket1."', tgl_raport = '".$tgl_raport."', tahun_ajaran_awal = '".$tahun_awal."', tahun_ajaran_akhir = '".$tahun_akhir."' where id_siswa = '".$siswa['id_siswa']."'");

    $querypil1 = mysqli_query($koneksi, "UPDATE tb_ekskul_pil1 SET id_siswa = '".$id_siswa."', id_kelas = '".$id_kelas."', id_semester = '".$id_semester."', id_ekskul_pil1 = '".$id_ekspil1."', id_ekstra = '".$ekskulPil1."', kegiatan = '".$idpil1['kegiatan']."', keterangan = '".$ket2."', tgl_raport = '".$tgl_raport."', tahun_ajaran_awal ='".$tahun_awal."', tahun_ajaran_akhir = '".$tahun_akhir."' where id_siswa = '".$siswa['id_siswa']."'");

    $querypil2 = mysqli_query($koneksi, "UPDATE tb_ekskul_pil2 SET id_siswa = '".$id_siswa."', id_kelas = '".$id_kelas."', id_semester = '".$id_semester."', id_ekskul_pil2 = '".$id_ekspil2."', id_ekstra = '".$ekskulPil2."', kegiatan = '".$idpil2['kegiatan']."', keterangan = '".$ket3."', tgl_raport = '".$tgl_raport."', tahun_ajaran_awal = '".$tahun_awal."', tahun_ajaran_akhir = '".$tahun_akhir."' where id_siswa = '".$siswa['id_siswa']."'");

    $querypil3 = mysqli_query($koneksi, "UPDATE tb_ekskul_pil3 SET id_siswa = '".$id_siswa."', id_kelas = '".$id_kelas."', id_semester = '".$id_semester."', id_ekskul_pil3 = '".$id_ekspil3."', id_ekstra = '".$ekskulPil3."', kegiatan = '".$idpil3['kegiatan']."', keterangan = '".$ket4."', tgl_raport = '".$tgl_raport."', tahun_ajaran_awal = '".$tahun_awal."', tahun_ajaran_akhir = '".$tahun_akhir."' where id_siswa = '".$siswa['id_siswa']."'");

    if ($queryw && $querypil1 && $querypil2 & $querypil3) {
        echo "<script>
        alert('Data berhasil di Update');
        document.location.href = '../../?page=nilai&id=".$siswa['nama_siswa']."';
        </script>";
    }else{
        echo "<script>
        alert('Data Gagar di Update');
        document.location.href = '../../?page=nilai&id=".$siswa['nama_siswa']."';
        </script>";

    }

}
?>