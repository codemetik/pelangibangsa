<?php 
include "../../../connect.php";

//proses simpan 
if (isset($_POST['simpan'])) {

    $id_level_siswa = $_POST['id_level_siswa'];
    $id_level_semester = $_POST['id_level_semester'];
    $id_semester = $_POST['id_semester'];

    $isi = count($id_level_siswa);

    if ($id_level_siswa == true) {
        for ($i=0; $i < $isi; $i++) { 

            $cek = mysqli_query($koneksi, "SELECT * FROM data_level_semester WHERE id_level_siswa = '".$id_level_siswa[$i]."'");
            $dtcek = mysqli_num_rows($cek);
            if ($dtcek == 1) {
                echo "<script>
                alert('Data siswa sudah ada');
                document.location.href = '../?page=tarik_siswa_insemester';
                </script>";
            }else{
                        //query insert table
            $insert = mysqli_query($koneksi, "INSERT INTO data_level_semester(id_level_semester, id_level_siswa, id_semester) VALUES('".$id_level_semester[$i]."','".$id_level_siswa[$i]."','".$id_semester[$i]."')");
            if ($insert) {
                echo "<script>
                alert('Data berhasil ditarik');
                document.location.href = '../?page=tarik_siswa_insemester';
                </script>";
            }else{
                echo "<script>
                alert('Data gagal ditarik');
                document.location.href = '../?page=tarik_siswa_insemester';
                </script>";
            }
            
            }
            
        }    
    }else if($id_level_siswa == false){
        echo "<script>
                alert('Maaf, Silahkan pilih nama dahulu');
                document.location.href = '../?page=tarik_siswa_insemester';
                </script>";
    }
    
}
?>