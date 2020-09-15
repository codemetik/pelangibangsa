<?php 
$sql = mysqli_query($koneksi, "SELECT * FROM nilai_raportkd_ki4 WHERE id_mapel = '".$_GET['id']."' AND id_kd = '".$_GET['edit']."' AND id_siswa = '".$_GET['sis']."'");
$dat = mysqli_fetch_array($sql);

?>
<div class="card">
	<div class="header bg-light-blue">
		<h2>Edit <?= $dat['id_siswa']." >> ".$dat['nomor_kd']." >> ".$dat['deskripsi']; ?></h2>
	</div>
	<div class="body">
		<form action="" method="POST">
			<div class="row">
            <div class="col-lg-4 col-md-12 col-sm-12 col-xs-12">
            <div class="row">
            <div class="col-lg-6 col-md-12 col-sm-12 col-xs-12 bg-cyan">
                <div class="form-group form-float">
                    <div class="form-line">
                        <input type="text" class="form-control" name="id_raportkd" value="<?= $dat['id_raportkd']; ?>" readonly>
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
                        <input type="text" class="form-control" name="id_kelas" value="<?= $dat['id_kelas']; ?>" readonly>
                        <label class="form-label"></label>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-12 col-sm-12 col-xs-12 bg-cyan">
                <div class="form-group form-float">
                    <div class="form-line">
                        <input type="text" class="form-control" name="id_semester" value="<?= $dat['id_semester']; ?>" readonly>
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
                        <textarea name="deskripsi" cols="30" rows="5" class="form-control no-resize" required><?= $dat['deskripsi']; ?></textarea>
                        <label class="form-label">KALIMAT KUNCI KD</label>
                    </div>
                </div>
            </div>
			<div class="col-lg-4 col-md-12 col-sm-12 col-xs-12">
				<div class="form-group form-float">
                	<div class="form-line">
                        <input type="text" class="form-control" name="tugas1" value="<?= $dat['tugas1']; ?>">
                        <label class="form-label">Tugas 1</label>
                    </div>
                </div>
                <div class="form-group form-float">
                    <div class="form-line">
                        <input type="text" class="form-control" name="tugas2" value="<?= $dat['tugas2']; ?>">
                        <label class="form-label">Tugas 2</label>
                    </div>
                </div>
                <div class="form-group form-float">
                    <div class="form-line">
                        <input type="text" class="form-control" name="tugas3" value="<?= $dat['tugas3']; ?>">
                        <label class="form-label">Tugas 3</label>
                    </div>
                </div>
                <div class="form-group form-float">
                    <div class="form-line">
                        <input type="text" class="form-control" name="tugas4" value="<?= $dat['tugas4']; ?>">
                        <label class="form-label">Tugas 4</label>
                    </div>
                </div>
                <div class="form-group form-float">
                    <div class="form-line">
                        <input type="text" class="form-control" name="tugas5" value="<?= $dat['tugas5']; ?>">
                        <label class="form-label">Tugas 5</label>
                    </div>
                </div>
			</div>
			<div class="col-lg-4 col-md-12 col-sm-12 col-xs-12">
				<div class="form-group form-float">
                    <div class="form-line">
                        <input type="text" class="form-control" name="ph1" value="<?= $dat['ph1']; ?>">
                        <label class="form-label">PH1</label>
                    </div>
                </div>
                <div class="form-group form-float">
                    <div class="form-line">
                        <input type="text" class="form-control" name="ph2" value="<?= $dat['ph2']; ?>">
                        <label class="form-label">PH2</label>
                    </div>
                </div>
                <div class="form-group form-float">
                    <div class="form-line">
                        <input type="text" class="form-control" name="ph3" value="<?= $dat['ph3']; ?>">
                        <label class="form-label">PH3</label>
                    </div>
                </div>
                <div class="form-group form-float">
                    <div class="form-line">
                        <input type="text" class="form-control" name="ph4" value="<?= $dat['ph4']; ?>">
                        <label class="form-label">PH4</label>
                    </div>
                </div>
			</div>
			<div class="col-lg-4 col-md-12 col-sm-12 col-xs-12">
				<div class="form-group form-float">
                    <div class="form-line">
                        <input type="text" class="form-control" name="pts" value="<?= $dat['pts']; ?>">
                        <label class="form-label">PTS</label>
                    </div>
                </div>
                <div class="form-group form-float">
                    <div class="form-line">
                        <input type="text" class="form-control" name="pas" value="<?= $dat['pas']; ?>">
                        <label class="form-label">PAS</label>
                    </div>
                </div>
                   
                    <input type="submit" class="form-control bg-indigo" name="simpan" value="Simpan Perubahan">
                    
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


     $isi = mysqli_query($koneksi, "UPDATE nilai_raportkd_ki4 SET id_raportkd = '".$id_raportkd."', id_siswa = '".$id_siswa."', id_mapel = '".$id_mapel."', id_kelas = '".$id_kelas."', id_semester = '".$id_semester."', nama_mapel = '".$nama_mapel."', id_kd = '".$id_kd."', nomor_kd = '".$nomor_kd."', deskripsi = '".$deskripsi."', tugas1 = '".$tugas1."', tugas2 = '".$tugas2."', tugas3 = '".$tugas3."', tugas4 = '".$tugas4."', tugas5 = '".$tugas5."', ph1 = '".$ph1."', ph2 = '".$ph2."', ph3 ='".$ph3."', ph4 = '".$ph4."', pts ='".$pts."', pas ='".$pas."' WHERE id_raportkd = '".$id_raportkd."'");
     if ($isi) {
        echo "<script>
        alert('Data telah berubah');
        document.location.href = '?page=nilai_akhir_raportki4&id=$id_mapel&sis=$id_siswa';
        </script>";
     }else{
        echo "<script>
        alert('Data gagal dirubah');
        </script>";
     }

}

?>