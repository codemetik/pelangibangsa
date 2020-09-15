<?php 
$sq1 = mysqli_query($koneksi, "SELECT * FROM kelas WHERE kelas = '".$_SESSION['kelas']."'");
$dtsq1 = mysqli_fetch_array($sq1);

$sq2 = mysqli_query($koneksi, "SELECT * FROM semester WHERE semester = '".$_SESSION['semester']."'");
$dtsq2 = mysqli_fetch_array($sq2);

$sql_siswa = mysqli_query($koneksi, "SELECT * FROM data_siswa X INNER JOIN agama Y ON y.id_agama = x.id_agama where id_siswa = '".$_GET['sis']."'");
$dt_siswa = mysqli_fetch_array($sql_siswa);

$sql_kd = mysqli_query($koneksi, "SELECT * FROM kd_agama_ki4 WHERE id_mapel = '".$_GET['id']."' AND id_agama = '".$_GET['agm']."' AND id_kelas = '".$dtsq1['id_kelas']."' AND id_semester = '".$dtsq2['id_semester']."'");
while ($data = mysqli_fetch_array($sql_kd)) {
	$array[] = array(
		'id_kd' => $data['id_kd'],
		'nomor_kd' => $data['nomor_kd'],
		'deskripsi' => $data['deskripsi'],
		'id_mapel' => $data['id_mapel'],
		'id_kelas' => $data['id_kelas'],
		'id_semester' => $data['id_semester']
	);
}

//membuat query untuk menggabungkan kkm keterampilan dari table mapel
$sql_agm = mysqli_query($koneksi, "SELECT id_mapel, nama_mapel, keterampilan, 
@rang := 100 - keterampilan AS rang, 
@interv := IF(keterampilan='','',ROUND(@rang/3)) AS interv,
@sbaik := IF(keterampilan='','',keterampilan+(@interv*3)) AS sbaik,
@baik := IF(keterampilan='','',keterampilan+(@interv*2)) AS baik,
@cbaik := IF(keterampilan='','',keterampilan+@interv) AS cbaik,
@pbimbingan := IF(keterampilan='','',keterampilan) AS pbimbingan
FROM mapel WHERE id_mapel = '".$array[0]['id_mapel']."'");
$data_agm = mysqli_fetch_array($sql_agm);


?>
<div class="card">
	<div class="header bg-indigo">
		<h2>INPUT KD PENGETAHUAN AGAMA (<?= $dt_siswa['agama']; ?>) | <?=$dt_siswa['nama_siswa']; ?></h2>
	</div>
	<div class="body">
		<form method="POST" action="">
			<div class="row">
				<div class="col-sm-2">
					<div class="form-line">
                    <label class="form-label">ID Siswa</label>
                    <input type="text" class="form-control bg-blue-grey" name="id_siswa" value="<?= $dt_siswa['id_siswa']; ?>" required readonly>
                </div>
				</div>
				<div class="col-sm-2">
					<div class="form-line">
                    <label class="form-label">ID Mapel</label>
                    <input type="text" class="form-control bg-blue-grey" name="id_mapel" value="<?= $array[0]['id_mapel']; ?>" required readonly>
                </div>
				</div>
				<div class="col-sm-2">
					<div class="form-line">
                    <label class="form-label">ID Kelas</label>
                    <input type="text" class="form-control bg-blue-grey" name="id_kelas" value="<?= $dtsq1['id_kelas']; ?>" required readonly>
                </div>
				</div>
				<div class="col-sm-2">
					<div class="form-line">
                    <label class="form-label">ID Semester</label>
                    <input type="text" class="form-control bg-blue-grey" name="id_semester" value="<?= $dtsq2['id_semester']; ?>" required readonly>
                </div>
				</div>
				<div class="col-sm-2">
					<div class="form-line">
                    <label class="form-label">Tahun awal</label>
                    <input type="text" class="form-control bg-blue-grey" name="tahun_awal" value="<?= $dt_siswa['tahun_ajaran_awal']; ?>" required readonly>
                </div>
				</div>
				<div class="col-sm-2">
					<div class="form-line">
                    <label class="form-label">Tahun akhir</label>
                    <input type="text" class="form-control bg-blue-grey" name="tahun_akhir" value="<?= $dt_siswa['tahun_ajaran_akhir']; ?>" required readonly>
                </div>
				</div>
				<div class="col-sm-12">
					<div class="form-line">
                    <label class="form-label">Nama mapel</label>
                    <input type="text" class="form-control bg-blue-grey" name="nama_mapel" value="<?= $data_agm['nama_mapel']; ?>" required readonly>
                </div>
				</div>
			</div>
			<div class="row">
				<?php 
				$isi = count($array);
				for ($i=0; $i < $isi; $i++) { ?>
			<div class="col-sm-4">
					<div class="form-group">
					<div class="form-line">
						<input type="button" name="nomor_kd[]" value="<?= $array[$i]['nomor_kd']; ?>" class="btn bg-black" data-toggle="tooltip" data-placement="right" title="<?= $array[$i]['deskripsi']; ?>">
						<div hidden><input type="text" name="deskripsi[]" class="form-control" value="<?= $array[$i]['deskripsi']; ?>"></div>
						<input type="tex" name="input_kd[]" class="form-control" placeholder="input nilai kd ..." required>
					</div>
				</div>
			</div>
				<?php }
				?>
			<div class="col-sm-2">
				<div class="form-group">
					<div class="form-line">
						<label class="">Nilai UTS</label>
						<input type="text" name="uts" class="form-control" placeholder="nilai uts ..." required>
					</div>
				</div>
			</div>
			<div class="col-sm-2">
				<div class="form-group">
					<div class="form-line">
						<label class="">Nilai UAS</label>
						<input type="text" name="uas" class="form-control" placeholder="nilai uas ..." required>
					</div>
				</div>
			</div>
			<div class="col-sm-2">
				<?php 
                date_default_timezone_set('Asia/Jakarta'); 
				$date_raport = date("Y-m-d h:i:s");
                ?>
                <div class="form-group">
                    <div class="form-line">
                        <label class="">Tanggal Raport</label>
                        <input type="text" class="form-control bg-blue-grey" name="tgl_raport" value="<?= $date_raport; ?>" required readonly>
                    </div>
                </div>
			</div>
		</div>
		<input type="submit" name="tampil" class="btn bg-indigo" value="Tampilkan">
		<a href="?page=nilai&id=<?= $dt_siswa['nama_siswa']; ?>" class="btn bg-indigo">Cencel</a>
		</form>
	</div>
</div>
<?php 
if (isset($_POST['tampil'])) {
	$input_kd = $_POST['input_kd'];
	$deskrip = $_POST['deskripsi'];
	$uts = $_POST['uts'];
	$uas = $_POST['uas'];

	$id_siswa = $_POST['id_siswa'];
	$id_mapel = $_POST['id_mapel'];
	$id_kelas = $_POST['id_kelas'];
	$id_semester = $_POST['id_semester'];
	$tahun_awal = $_POST['tahun_awal'];
	$tahun_akhir = $_POST['tahun_akhir'];
	$tgl_raport = $_POST['tgl_raport'];
	$nama_mapel = $_POST['nama_mapel'];

	$jml = count($input_kd);

	$avg = array_sum($input_kd)/$jml; // nilai rata-rata
	$a = $avg*0.4;
	$b = $uts*0.3;
	$c = $uas*0.3;
	$nilai = $a+$b+$c;//nilai raport

	//min dan max
	$min = min($input_kd);
	$max = max($input_kd);

	// echo $data_kkm['rang']." <br>"; //rentang 30
	// echo $data_kkm['interv']." <br>"; //interval 10
	// echo $data_kkm['sbaik']." <br>"; //sangat baik 100
	// echo $data_kkm['baik']." <br>"; //baik 90
	// echo $data_kkm['cbaik']." <br>"; // cukup baik 80
	// echo $data_kkm['pbimbingan']; //perlu bimbingan 70

	//mencari nilai minimal
	if ($min > $data_agm['baik']) {
		$des1 = "Sangat baik";
	}else if ($min > $data_agm['cbaik']) {
		$des1 = "Baik";
	}else if ($min >= $data_agm['pbimbingan']) {
		$des1 = "Cukup baik";
	}else{
		$des1 = "Perlu bimbingan";
	}

	//mencari nilai maximal
	if ($max > $data_agm['baik']) {
		$des2 = "Sangat baik";
	}else if ($max > $data_agm['cbaik']) {
		$des2 = "Baik";
	}else if ($max >= $data_agm['pbimbingan']) {
		$des2 = "Cukup baik";
	}else{
		$des2 = "Perlu bimbingan";
	}

	//mencari predikat
	if ($nilai > $data_agm['baik']) {
		$predikat = "A";
	}else if ($nilai > $data_agm['cbaik']) {
		$predikat = "B";
	}else if ($nilai >= $data_agm['pbimbingan']) {
		$predikat = "C";
	}else{
		$predikat = "D";
	}
	?>
<form action="penilaian/proses_nilai_akhir_agamaki4.php" method="POST">
	<div class="table table-responsive">
		<table class="table table-hover table-bordered">
			<thead class="bg-indigo">
				<tr>
					<th rowspan="2">ID SISWA</th>
					<th colspan="2">NILAI MIN</th>
					<th colspan="2">NILAI MAX</th>
					<th rowspan="2">KKM Rata-rata</th>
					<th rowspan="2">Nilai Raport</th>
					<th rowspan="2">Predikat</th>
					<th rowspan="2">Min</th>
					<th rowspan="2">Max</th>
					<th rowspan="2">Deskripsi Gabungan</th>
				</tr>
				<tr>
					<th>Nilai</th>
					<th>Ket</th>
					<th>Nilai</th>
					<th>Ket</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td hidden>
					<div hidden>
						<input type="text" name="id_siswa" value="<?= $id_siswa; ?>">
						<input type="text" name="id_mapel" value="<?= $id_mapel; ?>">
						<input type="text" name="id_kelas" value="<?= $id_kelas; ?>">
						<input type="text" name="id_semester" value="<?= $id_semester; ?>">
						<input type="text" name="tahun_awal" value="<?= $tahun_awal; ?>">
						<input type="text" name="tahun_akhir" value="<?= $tahun_akhir; ?>">
						<input type="text" name="tgl_raport" value="<?= $tgl_raport; ?>">
						<input type="text" name="nama_mapel" value="<?= $nama_mapel; ?>">
					</div>
					</td>
					<td ><?= $min; ?>
						<div hidden><input type="tex" name="min" value="<?= $min; ?>"></div>
					</td>
					<td width="100px"><?= $des1; ?>
						<div hidden><input type="text" name="des1" value="<?= $des1; ?>"></div>
					</td>
					<td><?= $max; ?>
						<div hidden><input type="tex" name="max" value="<?= $max; ?>"></div>
					</td>
					<td width="100px"><?= $des2; ?>
						<div hidden><input type="tex" name="des2" value="<?= $des2; ?>"></div>
					</td>
					<td><?= round($avg); ?>
						<div hidden><input type="text" name="avg" value="<?= round($avg); ?>"></div>
					</td>
					<td><?= round($nilai); ?>
						<div hidden><input type="tex" name="nilai" value="<?= round($nilai); ?>"></div>
					</td>
					<td><?= $predikat; ?>
						<div hidden><input type="text" name="predikat" value="<?= $predikat; ?>"></div>
					</td>
					<td>
						<?php 
						for ($i=0; $i < $jml ; $i++) { 
							if ($input_kd[$i] == $min) {
								$d1 = $deskrip[$i]. " ";
							}
						}  
							// echo "Ananda andi ".$des1." dalam ";
							// echo $d1.", ";
						?>
						<textarea name="desmin" cols="150" rows="10" class="form-control no-resize font-12" required readonly><?= "Ananda ".$dt_siswa['nama_siswa']." ".$des1." dalam ".$d1.", "; ?></textarea>
					</td>
					<td>
						<?php 
						for ($j=0; $j < $jml ; $j++) { 
							if ($input_kd[$j] == $max) {
								$d2 = $deskrip[$j]." ";
							}
						} 
							// echo "Ananda andi ".$des2." dalam ";
							// echo $d2.". ";
						?>
						<textarea name="desmax" cols="150" rows="10" class="form-control no-resize font-12" required readonly><?= "Ananda ".$dt_siswa['nama_siswa']." ".$des2." dalam ".$d2."."; ?></textarea>
					</td>
					<td>
						<textarea name="deskripsi" cols="150" rows="10" class="form-control no-resize font-12" required readonly><?= "Ananda ".$dt_siswa['nama_siswa']." ".$des1." dalam ".$d1." dan ".$des2." dalam ".$d2."."; ?></textarea>
					</td>
				</tr>
				<tr>
					<th rowspan="3">
						<input type="submit" name="simpan" value="Simpan" class="btn bg-indigo">
					</th>
				</tr>
			</tbody>
		</table>
	</div>
</form>
	<?php 

}else{
	echo "";
}
?>