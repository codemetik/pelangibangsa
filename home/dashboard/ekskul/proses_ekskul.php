<?php 
// include "../../../connect.php";
$host = "localhost"; // Nama hostnya
$username = "root"; // Username
$password = ""; // Password (Isi jika menggunakan password)
$database = "pelangibangsa"; // Nama databasenya

$koneksi = mysqli_connect($host, $username, $password, $database); // Koneksi ke MySQL

if (isset($_POST['simpan'])) {
    $ideks = $_POST['idekstra'];
    $idmuatan = $_POST['id_muatan'];
    $varmuatan = $_POST['teknik_muatan'];
    $ini = count($idmuatan);
    for ($i=0; $i < $ini ; $i++) { 
        $query = mysqli_query($koneksi, "UPDATE tb_muatan_nilai SET teknik_muatan = '$varmuatan[$i]' where id_muatan = '$idmuatan[$i]'");
        if ($query) {
            echo "<script>
                alert('Data berhasil di rubah');
                document.location.href = '../?page=detail_ekskul&id=".$ideks."';
            </script>";
        }
    }
}
?>