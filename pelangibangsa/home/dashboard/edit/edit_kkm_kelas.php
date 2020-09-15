<?php 
include "../../connect.php";
$id = $_GET['id'];
$kls = $_GET['kls']; 
$sm = $_GET['sm'];

$sql = mysqli_query($koneksi, "SELECT * FROM mapel X INNER JOIN roles_mapel Y ON y.id_mapel = x.id_mapel WHERE x.id_mapel = '".$id."' AND id_kelas = '".$kls."' AND id_semester = '".$sm."'");
$mapel = mysqli_fetch_array($sql);

?>
                <div class="card">
                    <div class="header bg-indigo">
                        <h2>DETAIL MATE PELAJARAN : <u><?= $_SESSION['kelas']."</u> DAN SEMESTER SEKARANG : <u>".$_SESSION['semester']; ?></u></h2>
                    </div>
                    <div class="body">
                        <div class="table table-responsive">
                            <table class="table table-bordered table-hover">
                                <thead>
                                    <tr>
                                        <th>Nama Mata Pelajaran</th>
                                        <td><?= $mapel['nama_mapel']; ?></td>
                                    </tr>
                                    <tr>
                                        <th>Singkat Mapel</th>
                                        <td><?= $mapel['singkat_mapel']; ?></td>
                                    </tr>
                                    <tr>
                                        <th>Kelompok Mapel</th>
                                        <td><?= $mapel['kelompok']; ?></td>
                                    </tr>
                                    <tr>
                                        <th>KKm KI-3 (Pengetahuan)</th>
                                        <td><?= $mapel['pengetahuan']; ?></td>
                                    </tr>
                                    <tr>
                                        <th>KKM Ki-4 (Keterampilan)</th>
                                        <td><?= $mapel['keterampilan']; ?></td>
                                    </tr>
                                </thead>
                            </table>
                        </div>
<?php 
if ($mapel['id_mapel'] == 'MPL01') { ?>
    <div class="header bg-blue-grey">
    <form action="" method="POST">
        <select name="agama">
            <?php 
            $agm = mysqli_query($koneksi, "SELECT * FROM agama");
            while ($sql_agm = mysqli_fetch_array($agm)) {
                echo "<option value='".$sql_agm['id_agama']."'>".$sql_agm['agama']."</option>";
            }
            ?>
        </select>
        <input type="submit" name="agm" class="btn bg-blue">
    </form>
    </div>
<?php 
if (isset($_POST['agm'])) {
    $id_agama = $_POST['agama'];

    $show_sql = mysqli_query($koneksi, "SELECT * FROM agama where id_agama = '".$id_agama."'");
    $dt_sql = mysqli_fetch_array($show_sql);
?>
        <div class="card">
            <div class="header">
                <h5><?= $dt_sql['agama']; ?></h5>
            </div>
        </div>
        <table class="table table-bordered table-hover">
            <thead>
                <tr>
                    <th>KD</th>
                    <th>DESKRIPSI</th>
                </tr>
                <?php 
$sqlgm = mysqli_query($koneksi, "SELECT * FROM mapel X INNER JOIN kd_agama_ki3 Y ON y.id_mapel = x.id_mapel
WHERE y.id_agama = '".$id_agama."' AND id_kelas = '".$kls."' AND id_semester = '".$sm."'");
    while($daagm = mysqli_fetch_array($sqlgm)){
        echo "<tr>";
        echo "<th>".$daagm['nomor_kd']."</th>";
        echo "<td>".$daagm['deskripsi']."</td>";
        echo "</tr>";
     }
                 ?>
            </thead>
        </table>
    <?php

}

//ika tidak mapel id MPL01
}else if($mapel['id_mapel'] != 'MPL01'){ ?>
    <table class="table table-hover">
        <thead>
            <tr>
                <th>KD</th>
                <th>DESKRIPSI</th>
            </tr>
            <?php 
            $kd_sql = mysqli_query($koneksi,"SELECT * FROM mapel X INNER JOIN kd_pengetahuan Y ON y.id_mapel = x.id_mapel WHERE x.id_mapel = '".$mapel['id_mapel']."' AND id_kelas = '".$mapel['id_kelas']."' AND id_semester = '".$mapel['id_semester']."'");
            while($data_kd = mysqli_fetch_array($kd_sql)){
                echo "<tr>";
                echo "<th>".$data_kd['nomor_kd']."</th>";
                echo "<td>".$data_kd['deskripsi']."</td>";
                echo "</tr>";
            }
            ?>
        </thead>
    </table>
<?php }
?>
                        <div class="table table-responsive">
                            <table class="table-responsive">
                                <tr>
                                    <td><a href="?page=kkm" class="btn bg-indigo"><< BACK</a></td>
                                </tr>
                            </table>
                        </div>
                     </div>
                 </div>
                 
