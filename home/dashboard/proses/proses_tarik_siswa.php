<?php 
include "../../../connect.php";

//proses simpan 
if (isset($_POST['simpan'])) {

    $id_level_siswa = $_POST['id_level_siswa'];
    $id_siswa = $_POST['id_siswa'];
    $id_kelas = $_POST['id_kelas'];
    $id_user = $_POST['id_user'];
    $id_level_semester = $_POST['id_level_semester'];
    $id_semester = $_POST['id_semester'];

    //query insert table
    $insert = mysqli_query($koneksi, "INSERT INTO data_level_siswa(id_level_siswa, id_siswa, id_kelas, id_user) VALUES('".$id_level_siswa."','".$id_siswa."','".$id_kelas."','".$id_user."')");
    $insert1 = mysqli_query($koneksi, "INSERT INTO data_level_semester(id_level_semester, id_level_siswa, id_semester) VALUES('".$id_level_semester."','".$id_level_siswa."','".$id_semester."')");
    if ($insert && $insert1) {
        echo "<script>
        alert('Data berhasil disimpan');
        document.location.href = '../?page=tarik_siswa';
        </script>";
    }else{
        echo "<script>
        alert('Data gagal disimpan');
        document.location.href = '../?page=tarik_siswa';
        </script>";
    }
}
?>