<?php 
$sql = mysqli_query($koneksi, "SELECT* FROM nilai_akhir_raportkd_ki4 WHERE id_mapel = '".$_GET['id']."' AND id_kd = '".$_GET['kd']."' AND id_siswa = '".$_GET['sis']."'");
$dat = mysqli_fetch_array($sql);

//ambil data maximal di kolom id_raportkd table nilai_raportkd_ki3
$queryku = mysqli_query($koneksi, "SELECT max(id_raportkd) AS maxCode FROM nilai_raportkd_ki4");
$code = mysqli_fetch_array($queryku);
$no = $code['maxCode'];
$nOio = (int) substr($no, 3, 7);
$nOio++; 
$chario = "KI4";
$datai = $chario . sprintf("%07s", $nOio);

?>
<div class="card">
  <div class="header bg-light-blue">
    <h2>Input <?= $dat['id_siswa']." >> ".$dat['nomor_kd']." >> ".$dat['deskripsi']; ?></h2>
  </div>
  <div class="body">
    <form action="" method="POST">
      <div class="row">
            <div class="col-lg-4 col-md-12 col-sm-12 col-xs-12">
            <div class="row">
                <div class="col-lg-6 col-md-12 col-sm-12 col-xs-12 bg-cyan">
                <div class="form-group form-float">
                    <div class="form-line">
                        <input type="text" class="form-control" name="id_raportkd" value="<?= $datai; ?>" readonly>
                        <label class="form-label"></label>
                    </div>
                </div>
                </div>
                <div class="col-lg-6 col-md-12 col-sm-12 col-xs-12 bg-cyan">
                <div class="form-group form-float">
                    <div class="form-line">
                        <input type="text" class="form-control" name="id_siswa" value="<?= $dat['id_siswa']; ?>" readonly>
                        <label class="form-label"></label>
                    </div>
                </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-4 col-md-12 col-sm-12 col-xs-12 bg-cyan">
                <div class="form-group form-float">
                    <div class="form-line">
                        <input type="text" class="form-control" name="id_mapel" value="<?= $dat['id_mapel']; ?>" readonly>
                        <label class="form-label"></label>
                    </div>
                </div>
                </div>
                <div class="col-lg-4 col-md-12 col-sm-12 col-xs-12 bg-cyan">
                <div class="form-group form-float">
                    <div class="form-line">
                        <input type="text" class="form-control" name="id_kelas" value="<?= $dtsq1['id_kelas']; ?>" readonly>
                        <label class="form-label"></label>
                    </div>
                </div>
                </div>
                <div class="col-lg-4 col-md-12 col-sm-12 col-xs-12 bg-cyan">
                <div class="form-group form-float">
                    <div class="form-line">
                        <input type="text" class="form-control" name="id_semester" value="<?= $dtsq2['id_semester']; ?>" readonly>
                        <label class="form-label"></label>
                    </div>
                </div>
                </div>
            </div>
                <div class="form-group form-float">
                    <div class="form-line">
                        <input type="text" class="form-control" name="nama_mapel" value="<?= $dat['nama_mapel']; ?>" readonly>
                        <label class="form-label"></label>
                    </div>
                </div>
                <div class="form-group form-float">
                    <div class="form-line">
                        <input type="text" class="form-control" name="id_kd" value="<?= $dat['id_kd']; ?>" readonly>
                        <label class="form-label"></label>
                    </div>
                </div>
                <div class="form-group form-float">
                    <div class="form-line">
                        <input type="text" class="form-control" name="nomor_kd" value="<?= $dat['nomor_kd']; ?>" readonly>
                        <label class="form-label"></label>
                    </div>
                </div>
                <div class="form-group form-float">
                    <div class="form-line">
                        <textarea name="deskripsi" cols="30" rows="5" class="form-control no-resize" readonly required><?= $dat['deskripsi']; ?></textarea>
                        <label class="form-label">KALIMAT KUNCI KD</label>
                    </div>
                </div>
            </div>
      <div class="col-lg-4 col-md-12 col-sm-12 col-xs-12">
        <div class="form-group form-float">
                  <div class="form-line">
                        <input type="text" class="form-control" name="tugas1">
                        <label class="form-label">Tugas 1</label>
                    </div>
                </div>
                <div class="form-group form-float">
                    <div class="form-line">
                        <input type="text" class="form-control" name="tugas2">
                        <label class="form-label">Tugas 2</label>
                    </div>
                </div>
                <div class="form-group form-float">
                    <div class="form-line">
                        <input type="text" class="form-control" name="tugas3">
                        <label class="form-label">Tugas 3</label>
                    </div>
                </div>
                <div class="form-group form-float">
                    <div class="form-line">
                        <input type="text" class="form-control" name="tugas4">
                        <label class="form-label">Tugas 4</label>
                    </div>
                </div>
                <div class="form-group form-float">
                    <div class="form-line">
                        <input type="text" class="form-control" name="tugas5">
                        <label class="form-label">Tugas 5</label>
                    </div>
                </div>
      </div>
      <div class="col-lg-4 col-md-12 col-sm-12 col-xs-12">
        <div class="form-group form-float">
                    <div class="form-line">
                        <input type="text" class="form-control" name="ph1">
                        <label class="form-label">PH1</label>
                    </div>
                </div>
                <div class="form-group form-float">
                    <div class="form-line">
                        <input type="text" class="form-control" name="ph2">
                        <label class="form-label">PH2</label>
                    </div>
                </div>
                <div class="form-group form-float">
                    <div class="form-line">
                        <input type="text" class="form-control" name="ph3">
                        <label class="form-label">PH3</label>
                    </div>
                </div>
                <div class="form-group form-float">
                    <div class="form-line">
                        <input type="text" class="form-control" name="ph4">
                        <label class="form-label">PH4</label>
                    </div>
                </div>
      </div>
      <div class="col-lg-4 col-md-12 col-sm-12 col-xs-12">
        <div class="form-group form-float">
                    <div class="form-line">
                        <input type="text" class="form-control" name="pts">
                        <label class="form-label">PTS</label>
                    </div>
                </div>
                <div class="form-group form-float">
                    <div class="form-line">
                        <input type="text" class="form-control" name="pas">
                        <label class="form-label">PAS</label>
                    </div>
                </div>
                    <input type="submit" class="form-control bg-indigo" name="simpan" value="simpan">
                    
      </div>
      </div>
    </form>
  </div>
</div>
<?php 
if (isset($_POST['simpan'])) {

$id_raportkd = $_POST['id_raportkd'];
$id_siswa = $_POST['id_siswa'];
$id_mapel = $_POST['id_mapel'];
$id_kelas = $_POST['id_kelas'];
$id_semester = $_POST['id_semester'];
$nama_mapel = $_POST['nama_mapel'];
$id_kd = $_POST['id_kd'];
$nomor_kd = $_POST['nomor_kd'];
$deskripsi = $_POST['deskripsi'];
$tugas1 = $_POST['tugas1'];
$tugas2 = $_POST['tugas2'];
$tugas3 = $_POST['tugas3'];
$tugas4 = $_POST['tugas4'];
$tugas5 = $_POST['tugas5'];
$ph1 = $_POST['ph1'];
$ph2 = $_POST['ph2'];
$ph3 = $_POST['ph3'];
$ph4 = $_POST['ph4'];
$pts = $_POST['pts'];
$pas = $_POST['pas'];

$sqli = mysqli_query($koneksi, "SELECT * FROM nilai_raportkd_ki4 WHERE id_siswa = '".$id_siswa."' AND id_mapel = '".$id_mapel."' AND id_kd = '".$id_kd."'");
$cek = mysqli_num_rows($sqli);
    if ($cek == 1) {
        echo "<script>
        alert('Data sudah ada');
        document.location.href = '?page=nilai_akhir_raportki4&id=$id_mapel&sis=$id_siswa';
        </script>";
    }else{

     $isi = mysqli_query($koneksi, "INSERT INTO nilai_raportkd_ki4(id_raportkd, id_siswa, id_mapel, id_kelas, id_semester, nama_mapel, id_kd, nomor_kd, deskripsi, tugas1, tugas2, tugas3, tugas4, tugas5, ph1, ph2, ph3, ph4, pts, pas) VALUES('".$id_raportkd."','".$id_siswa."','".$id_mapel."', '".$id_kelas."', '".$id_semester."','".$nama_mapel."','".$id_kd."','".$nomor_kd."','".$deskripsi."','".$tugas1."','".$tugas2."','".$tugas3."','".$tugas4."','".$tugas5."','".$ph1."','".$ph2."','".$ph3."','".$ph4."','".$pts."','".$pas."')");
     if ($isi) {
        echo "<script>
        alert('Data berhasil di simpan');
        document.location.href = '?page=nilai_akhir_raportki4&id=$id_mapel&sis=$id_siswa';
        </script>";
     }else{
        echo "<script>
        alert('Data gagal di simpan');
        </script>";
     }


    }

}

?>