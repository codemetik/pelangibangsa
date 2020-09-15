<?php 
$sq1 = mysqli_query($koneksi, "SELECT * FROM kelas WHERE kelas = '".$_SESSION['kelas']."'");
$dtsq1 = mysqli_fetch_array($sq1);

$sq2 = mysqli_query($koneksi, "SELECT * FROM semester WHERE semester = '".$_SESSION['semester']."'");
$dtsq2 = mysqli_fetch_array($sq2);
?>
<nav aria-label="breadcrumb m-0">
  <ol class="breadcrumb">
    <li class="breadcrumb-item"><a href="../dashboard">Dashboard</a></li>
    <li class="breadcrumb-item"><a href="javascript:void(0);" class="menu-toggle">Cetak</a></li>
    <li class="breadcrumb-item active" aria-current="page"><i><b>Cetak Rapor</b></i></li>
  </ol>
</nav>
<div class="card">
    <div class="header bg-indigo">
        Pilih Cetak
    </div>
    <div class="body">
        <div class="row">
            <div class="col-xs-6 ol-sm-6 col-md-6 col-lg-6">
                <form action="" method="POST">
                    <div class="row">
                        <div class="col-xs-4 ol-sm-6 col-md-6 col-lg-6">
                            <label>Cetak Rapor : </label>
                            <select name="id_siswa">
                                <?php 
                                $sql = mysqli_query($koneksi, "SELECT * FROM siswa_kelas_semester WHERE kelas = '".$_SESSION['kelas']."' AND semester = '".$_SESSION['semester']."' GROUP BY id_siswa ASC");
                                while ($data = mysqli_fetch_array($sql)) { ?>
                                    <option value="<?= $data['id_siswa']; ?>"><?= $data['nama_siswa']; ?></option>
                                <?php }
                                ?>
                            </select>
                        </div>
                        <div class="" hidden>
                            <input type="text" name="id_kelas" value="<?= $dtsq1['id_kelas']; ?>">
                            <input type="text" name="id_semester" value="<?= $dtsq2['id_semester']; ?>">
                            <!-- <input type="text" name="name" value="<?= $data['id_siswa']; ?>"> -->
                        </div>
                        <div class="col-xs-1 ol-sm-1 col-md-1 col-lg-1">
                            <a href="">
                                <button type="submit" name="cetak" class="btn bg-indigo">Tampil Unduhan</button>
                            </a>
                        </div>
                    </div>
                </form>
                <!-- cover -->
        <form action="cetak/cover.php" method="POST" target="_blank">
        <div class="row">
            <div class="col-xs-4 ol-sm-6 col-md-6 col-lg-6">
                <label>Cetak Cover : </label>
                <select name="id_siswa">
                    <?php 
                    $sql = mysqli_query($koneksi, "SELECT * FROM siswa_kelas_semester where kelas = '".$_SESSION['kelas']."' AND semester = '".$_SESSION['semester']."' GROUP BY id_siswa ASC");
                    while ($data = mysqli_fetch_array($sql)) { ?>
                        <option value="<?= $data['id_siswa']; ?>"><?= $data['nama_siswa']; ?></option>
                    <?php }
                    ?>
                </select>
            </div>
            <div class="" hidden>
                            <input type="text" name="id_kelas" value="<?= $dtsq1['id_kelas']; ?>">
                            <input type="text" name="id_semester" value="<?= $dtsq2['id_semester']; ?>">
                            <!-- <input type="text" name="name" value="<?= $data['id_siswa']; ?>"> -->
                        </div>
            <div class="col-xs-1 ol-sm-1 col-md-1 col-lg-1">
                <a href="">
                    <button type="submit" name="cover" class="btn bg-indigo" value="COVER"><i class="material-icons">file_download</i> Unduh</button>
                </a>
            </div>        
        </div>
        </form>
            </div>
            <div class="col-xs-6 ol-sm-6 col-md-6 col-lg-6">
                <div class="col-sm-12">
                    <div class="card">
                        <div class="header bg-success">
                            <p>Untuk mencetak raport pastikan semua penilaian sudah selesai, Berikut penilaian yang harus di isi:</p>
                            <ul>Masuk ke MENU PENILAIAN 
                                <li>Nilai --> Pilih siswa -->
                            <ul>
                                <li>Penilaian</li>
                                <li>Pengembangan</li>
                                <li>Catatan</li>
                            </ul>
                            </li></ul>
                        </div>
                    </div>
                </div> 
            </div>
        </div>
    </div>
</div>

<div class="body">
    
</div>

<?php 
//cetak/identitas.php

if (isset($_POST['cetak'])) {
    $id_siswa = $_POST['id_siswa'];
    $id_kelas = $_POST['id_kelas'];
    $id_semester = $_POST['id_semester'];

    // $sql = mysqli_query($koneksi, "SELECT * ");

    $sql1 = mysqli_query($koneksi, "SELECT * FROM nilai_raport_ki3 WHERE id_siswa = '".$id_siswa."' AND id_kelas = '".$id_kelas."' AND id_semester = '".$id_semester."'");
    $sql2 = mysqli_query($koneksi, "SELECT * FROM nilai_raport_ki4 WHERE id_siswa = '".$id_siswa."' AND id_kelas = '".$id_kelas."' AND id_semester = '".$id_semester."'");
    $sql3 = mysqli_query($koneksi, "SELECT * FROM nilai_raport_spiritual WHERE id_siswa = '".$id_siswa."' AND id_kelas = '".$id_kelas."' AND id_semester = '".$id_semester."'");
    $sql4 = mysqli_query($koneksi, "SELECT * FROM nilai_raport_sosial WHERE id_siswa = '".$id_siswa."' AND id_kelas = '".$id_kelas."' AND id_semester = '".$id_semester."'");

    $sql5 = mysqli_query($koneksi, "SELECT * FROM per_ekstrakurikuler WHERE id_siswa = '".$id_siswa."' AND id_kelas = '".$id_kelas."' AND id_semester = '".$id_semester."'");
    $sql6 = mysqli_query($koneksi, "SELECT * FROM per_kesehatan WHERE id_siswa = '".$id_siswa."' AND id_kelas = '".$id_kelas."' AND id_semester = '".$id_semester."'");
    $sql7 = mysqli_query($koneksi, "SELECT * FROM per_prestasi WHERE id_siswa = '".$id_siswa."' AND id_kelas = '".$id_kelas."' AND id_semester = '".$id_semester."'");
    $sql8 = mysqli_query($koneksi, "SELECT * FROM tinggi_berat_badan WHERE id_siswa = '".$id_siswa."' AND id_kelas = '".$id_kelas."' AND id_semester = '".$id_semester."'");
    $sql9 = mysqli_query($koneksi, "SELECT * FROM ketidakhadiran WHERE id_siswa = '".$id_siswa."' AND id_kelas = '".$id_kelas."' AND id_semester = '".$id_semester."'");

    // $sql10 = mysqli_query($koneksi, "SELECT * FROM catatan WHERE id_siswa = '".$id_siswa."'");

    $dt1 = mysqli_num_rows($sql1);
    $dt2 = mysqli_num_rows($sql2);
    $dt3 = mysqli_num_rows($sql3);
    $dt4 = mysqli_num_rows($sql4);
    $dt5 = mysqli_num_rows($sql5);
    $dt6 = mysqli_num_rows($sql6);
    $dt7 = mysqli_num_rows($sql7);
    $dt8 = mysqli_num_rows($sql8);
    $dt9 = mysqli_num_rows($sql9);
    // $dt10 = mysqli_fetch_array($sql10);
    $rolmapel = mysqli_query($koneksi, "SELECT * FROM data_siswa_kelas_semester WHERE id_siswa = '".$id_siswa."' AND id_kelas = '".$id_kelas."' AND id_semester = '".$id_semester."'");
    $dtsis = mysqli_fetch_array($rolmapel);

    if (($dt1 >= 1) && ($dt2 >= 1) && ($dt3 >= 1) && ($dt4 >= 1) && ($dt5 >= 1) && ($dt6 >= 1) && ($dt7 >=1) && ($dt8 >=1 ) && ($dt9 >= 1)) { ?>
        <div class="card table-responsive col-lg-8">
        <form action="cetak/identitas.php" method="POST" target="_blank">
            <table class="table table-hover">
                <tr>
                    <th class="col-lg-4">Raport dengan ID : </th>
                    <td><div hidden><input type="text" name="id_siswa" class="form-control" value="<?= $id_siswa; ?>" readonly></div>
                        <input type="text" name="name" class="form-control" value="<?= $dtsis['nama_siswa']; ?>" readonly>
                    </td>
                </tr>
                <tr>
                    <th><p class="text-red">Nilai lengkap silahkan unduh</p></th>
                    <td><input type="submit" name="cetak" class="btn col-lg-4 bg-green material-icons" value="file_download"></input></td>
                </tr>
            </table>
        </form>
        </div>
    <?php }else if(($dt1 >= 0) && ($dt2 >= 0) && ($dt3 >= 0) && ($dt4 >= 0) && ($dt5 >= 0) && ($dt6 >= 0) && ($dt7 >=0) && ($dt8 >= 0 ) && ($dt9 >= 0)){ ?>
        <div class="card table-responsive col-lg-8">
            <table class="table table-hover">
                <tr>
                    <th class="col-lg-4">Raport dengan ID : </th>
                    <td><div hidden><input type="text" name="id_siswa" class="form-control" value="<?= $id_siswa; ?>" readonly></div>
                        <input type="text" name="name" class="form-control" value="<?= $dtsis['nama_siswa']; ?>" readonly>
                    </td>
                </tr>
                <tr>
                    <th><p>Nilai belum lengkap, Data belum siap unduh</p></th>
                    <td><input type="submit" name="cetak" class="btn bg-red" value="Maaf"></td>
                </tr>
            </table>
        </div>
    <?php }

}
?>