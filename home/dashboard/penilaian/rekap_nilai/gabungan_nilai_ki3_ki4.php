<?php 

$sq1 = mysqli_query($koneksi, "SELECT * FROM kelas WHERE kelas = '".$_SESSION['kelas']."'");
$dtsq1 = mysqli_fetch_array($sq1);

$sq2 = mysqli_query($koneksi, "SELECT * FROM semester WHERE semester = '".$_SESSION['semester']."'");
$dtsq2 = mysqli_fetch_array($sq2);

//mengam bl data mapel
$sql = mysqli_query($koneksi, "SELECT singkat_mapel FROM show_mapel_perkelas GROUP BY id_mapel ASC");
while ($data = mysqli_fetch_array($sql)) {
	$array[] = array('singkatk3' => $data['singkat_mapel']
	);
}
$isi = count($array);

//mengmbil data siswa
$dtsiswa = mysqli_query($koneksi, "SELECT x.id_siswa, id_kelas, id_semester, nama_siswa FROM data_level_siswa X
INNER JOIN data_level_semester Y ON y.id_level_siswa = x.id_level_siswa
INNER JOIN data_siswa Z ON z.id_siswa = x.id_siswa
WHERE id_kelas = '".$dtsq1['id_kelas']."' AND id_semester = '".$dtsq2['id_semester']."'
GROUP BY x.id_siswa ASC");
while ($dtsis = mysqli_fetch_array($dtsiswa)) {
	$dtarr[] = array(
		'id_siswa' => $dtsis['id_siswa'],
		'id_kelas' => $dtsis['id_kelas'],
		'id_semester' => $dtsis['id_semester'],
		'nama_siswa' => $dtsis['nama_siswa']
	);
}

// $view = mysqli_query($koneksi, "SELECT `x`.`id_siswa` AS `id_siswa`,`x`.`nama_siswa` AS `nama_siswa`,y.id_kelas, y.id_semester,
// `y`.`tahun_ajaran_awal` AS `tahun_ajaran_awal`,`y`.`tahun_ajaran_akhir` AS `tahun_ajaran_akhir`,
// ROUND(SUM(`y`.`nilai`) / COUNT(`y`.`id_mapel`),0) AS `rata_rata_ki3`,
// ROUND(SUM(`z`.`nilai`) / COUNT(`z`.`id_mapel`),0) AS `rata_rata_ki4`,
// ROUND(SUM(`y`.`nilai`) / COUNT(`y`.`id_mapel`),0) + ROUND(SUM(`z`.`nilai`) / COUNT(`z`.`id_mapel`),0) AS `jumlah`,
// ROUND((ROUND(SUM(`y`.`nilai`) / COUNT(`y`.`id_mapel`),0) + ROUND(SUM(`z`.`nilai`) / COUNT(`z`.`id_mapel`),0)) / 2,0) AS `rata_rata` 
// FROM ((`data_siswa` `x` 
// JOIN `nilai_raport_ki3` `y` ON(`y`.`id_siswa` = `x`.`id_siswa`)) 
// JOIN `nilai_raport_ki4` `z` ON(`z`.`id_siswa` = `x`.`id_siswa`))
// WHERE y.id_kelas = '".$dtsq1['id_kelas']."' AND y.id_semester = '".$dtsq2['id_semester']."'
// GROUP BY `x`.`id_siswa` ASC");
// $dtview = mysqli_fetch_array($view);

$dtrt = mysqli_query($koneksi, "SELECT id_siswa, nama_siswa, id_kelas, id_semester, 
	ROUND(SUM(rata_rata_ki3)/COUNT(rata_rata_ki3)) AS rata_rata_ki3, 
	ROUND(SUM(rata_rata_ki4)/COUNT(rata_rata_ki4)) AS rata_rata_ki4,
	ROUND(ROUND(SUM(rata_rata_ki3)/COUNT(rata_rata_ki3)) + ROUND(SUM(rata_rata_ki4)/COUNT(rata_rata_ki4))) AS jumlah, 
	ROUND((ROUND(SUM(rata_rata_ki3)/COUNT(rata_rata_ki3)) + ROUND(SUM(rata_rata_ki4)/COUNT(rata_rata_ki4)))/2) AS rata_rata, 
FIND_IN_SET(rata_rata, (SELECT GROUP_CONCAT(rata_rata ORDER BY rata_rata DESC) 
FROM gabunganki3_ki4)) AS rank
FROM gabunganki3_ki4 
WHERE id_kelas = '".$dtsq1['id_kelas']."' AND id_semester = '".$dtsq2['id_semester']."'
GROUP BY id_siswa ASC");
while ($sqlrt = mysqli_fetch_array($dtrt)) {
	$sqlarr[] = array(
		'id_siswa' => $sqlrt['id_siswa'],
		'nama_siswa' => $sqlrt['nama_siswa'],
		'id_kelas' => $sqlrt['id_kelas'],
		'id_semester' => $sqlrt['id_semester'],
		'rata_rata_ki3' => $sqlrt['rata_rata_ki3'],
		'rata_rata_ki4' => $sqlrt['rata_rata_ki4'],
		'jumlah' => $sqlrt['jumlah'],
		'rata_rata' => $sqlrt['rata_rata'],
		'rank' => $sqlrt['rank']
	);
}
$isi2 = count($dtarr);
// for ($c=0; $c < $isi2; $c++) { 
// 	if ((isset($sqlarr[$c]['rata_rata_i3']) && isset($sqlarr[$c]['rata_rata_ki4'])) == 1) {
// 		$ar = $sqlarr[$c]['rtki3'] + $sqlarr[$c]['rtki4'];
// 		$ray[] = array('rank' => $ar);
// 	}else if((isset($sqlarr[$c]['rata_rata_ki3']) && isset($sqlarr[$c]['rata_rata_ki4'])) == 0){
// 		$ar = '0' + '0';
// 		$ray[] = array('rank' => $ar);	
// 	}
// 	krsort($ray);
// }

// ksort($ar);
// $no = 1;
// for ($g=0; $g < $isi2 ; $g++) { 
// 	echo "Rank : ". $no." ". $ar[$g]['dat'];
// 	$no++;
// }
?>
<nav aria-label="breadcrumb m-0">
  <ol class="breadcrumb">
    <li class="breadcrumb-item"><a href="#">Dasbhboard</a></li>
    <li class="breadcrumb-item"><a href="javascript:void(0);" class="menu-toggle">KD Pengetahuan</a></li>
    <li class="breadcrumb-item active" aria-current="page"><i><b>Rekap Nilai KI-3 & KI-4</b></i></li>
  </ol>
</nav>
<div class="card">
	<div class="header bg-indigo">
		<h2>Gabungan Nilai KI-3 & KI-4</h2>
	</div>
	<div class="body">
		<div class="table table-responsive">
			<table class="table table-hover table-bordered">
				<thead>
					<tr>
						<th rowspan="2">ID SISWA</th>
						<th rowspan="2">NAMA SISWA</th>
						<th rowspan="2">ID KELAS</th>
						<th rowspan="2">ID SEMESTER</th>
						<th colspan="1">PENGETAHUAN</th>
						<th colspan="1">KETERAMPILAN</th>
						<th rowspan="2">JUMLAH</th>
						<th rowspan="2">RATA-RATA</th>
						<th rowspan="2">RANKNING</th>
					</tr>
					<tr>
						<th>RATA-RATA KI-3</th>
						<th>RATA-RATA KI-4</th>
					</tr>
				</thead>
				<tbody>
					<?php 
					$no=1;
					for ($b=0; $b < $isi2; $b++) { ?>
						<tr>
							<td><?= $dtarr[$b]['id_siswa']; ?></td>
							<td><?= $dtarr[$b]['nama_siswa']; ?></td>
							<td><?= $dtarr[$b]['id_kelas']; ?></td>
							<td><?= $dtarr[$b]['id_semester']; ?></td>
							<?php 
							if ((isset($sqlarr[$b]['rata_rata_ki3']) && isset($sqlarr[$b]['rata_rata_ki4'])) == 1) { ?>
								<td><?= $sqlarr[$b]['rata_rata_ki3']; ?></td>
								<td><?= $sqlarr[$b]['rata_rata_ki4']; ?></td>
								<td><?= $sqlarr[$b]['jumlah']; ?></td> <!--jumlah-->
								<td><?= $sqlarr[$b]['rata_rata']; ?></td> <!--rata-rata-->
								<td><?= $sqlarr[$b]['rank']; ?></td>
							<?php }else if((isset($sqlarr[$b]['rata_rata_ki3']) && isset($sqlarr[$b]['rata_rata_ki4'])) == 0){ ?>
								<td>0</td>
								<td>0</td>
								<td>0</td>
								<td>0</td>
								<td>0</td>
							<?php }
							 }
							?>
				</tbody>
			</table>
		</div>
	</div>
</div>