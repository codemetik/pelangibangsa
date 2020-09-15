<?php 
include "../connect.php";
$mapel = mysqli_query($koneksi, "SELECT max(id_mapel) AS maxCode FROM mapel");
$data_mapl = mysqli_fetch_array($mapel);
$kde = $data_mapl['maxCode'];
$nO = (int) substr($kde, 3, 2);
$nO++; 
$chars = "MPL";
$kde = $chars . sprintf("%02s", $nO);
?><div class="card">
	<div class="header bg-indigo">
		<h2>INPUT MATA PELAJARAN (KKM)</h2>
	</div>
	<div class="body">
		<form id="form_validation" method="POST" action="">
            <div class="form-group form-float">
                <div class="form-line">
                    <input type="text" class="form-control" name="no" value="<?= $kde; ?>" readonly required>
                    <label class="form-label"></label>
                </div>
            </div>
            <div class="form-group form-float" hidden>
                <div class="form-line">
                    <input type="text" class="form-control" name="id_kelas" value="<?= $dtsq1['id_kelas']; ?>">
                <input type="text" class="form-control" name="id_semester" value="<?= $dtsq2['id_semester']; ?>">
                </div>
            </div>
            <div class="form-group form-float md-4">
                <div class="form-line">
                    <input type="text" class="form-control" name="mapel" required>
                    <label class="form-label">MATA PELAJARAN</label>
                </div>
            </div>
            <div class="form-group form-float">
                <div class="row clearfix">
                    <div class="col-md-8">
                        <p>
                            <b>Kelompok</b>
                        </p>
                        <select class="form-control show-tick" name="kelompok">
                            <?php 
                            $sql = mysqli_query($koneksi, "SELECT * FROM kelompok_mapel");
                            while ($data = mysqli_fetch_array($sql)) { ?>
                                <option value="<?= $data['kelompok']; ?>"><?= $data['kelompok']; ?></option>
                            <?php }
                            ?>
                        </select>

                    </div>
                </div>
            </div>
            <div class="form-group form-float">
                <div class="form-line">
                    <input type="text" class="form-control" name="singkatan_mapel" required>
                    <label class="form-label">SINGKATAN MAPEL</label>
                </div>
            </div>
            <div class="form-group form-float">
                <div class="form-line">
                    <input type="text" class="form-control" name="kkm_pengetahuan" required>
                    <label class="form-label">KKM PENGETAHUAN</label>
                </div>
            </div>
            <div class="form-group form-float">
                <div class="form-line">
                    <input type="text" class="form-control" name="kkm_keterampilan" required>
                    <label class="form-label">KKM KETERAMPILAN</label>
                </div>
            </div>
            <div class="form-group">
                <input type="checkbox" id="checkbox" name="tema">
                <label for="checkbox">Menggunakan Tema</label>
            </div>
            <div class="modal-footer">
                <button type="submit" class="btn bg-indigo" name="submit">SIMPAN</button>
            </div>
        </form>
	</div>
</div>
<?php 

if (isset($_POST['submit'])) {

$no = $_POST['no'];
$mapel = $_POST['mapel'];
$kelompok = $_POST['kelompok'];
$singkat_mapel = $_POST['singkatan_mapel'];
$kkm_pengetahuan = $_POST['kkm_pengetahuan'];
$kkm_keterampilan = $_POST['kkm_keterampilan']; 
$tema = $_POST['tema'];
$idkelas = $_POST['id_kelas'];
$idsemester = $_POST['id_semester'];

if (isset($_POST['submit'])) {
	
	$query = mysqli_query($koneksi, "INSERT INTO mapel(id_mapel, nama_mapel, kelompok, singkat_mapel, pengetahuan, keterampilan, tema) VALUES('$no','$mapel','$kelompok','$singkat_mapel','$kkm_pengetahuan','$kkm_keterampilan','$tema')");
	if ($query) {
        
		echo "<script>
			alert('Data berhasil masuk.');
			document.location.href = 'admin.php?page=show_kkm';
		</script>";

	}else{
		echo "<script>
			alert('Data gagal masuk .');
			document.location.href = 'admin.php?page=input_kkm';
		</script>";
	}
}else{
	echo "error";
}
}

?>