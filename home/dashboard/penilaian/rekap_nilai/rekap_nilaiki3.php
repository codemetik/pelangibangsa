<?php
$sq1 = mysqli_query($koneksi, "SELECT * FROM kelas WHERE kelas = '".$_SESSION['kelas']."'");
$dtsq1 = mysqli_fetch_array($sq1);

$sq2 = mysqli_query($koneksi, "SELECT * FROM semester WHERE semester = '".$_SESSION['semester']."'");
$dtsq2 = mysqli_fetch_array($sq2);

$sql = mysqli_query($koneksi, "SELECT singkat_mapel FROM show_mapel_perkelas WHERE id_kelas = '".$dtsq1['id_kelas']."' AND id_semester = '".$dtsq2['id_semester']."' GROUP BY id_mapel ASC");
while ($data = mysqli_fetch_array($sql)) {
	$array[] = array('singkatk3' => $data['singkat_mapel']
	);
}

$jml_data = mysqli_query($koneksi, "SELECT x.id_siswa, nama_siswa, SUM(nilai) AS jumlah, COUNT(id_mapel) AS total_mapel, ROUND(SUM(nilai)/COUNT(id_mapel)) AS rata_rata FROM nilai_raport_ki3 X INNER JOIN data_siswa Y ON y.id_siswa = x.id_siswa where id_kelas = '".$dtsq1['id_kelas']."' AND id_semester = '".$dtsq2['id_semester']."' GROUP BY x.id_siswa ASC");
while ($jml_mapel = mysqli_fetch_array($jml_data)) {
	$jml_array[] = array(
		'id_siswa' => $jml_mapel['id_siswa'],
		'nama_siswa' => $jml_mapel['nama_siswa'],
		'jumlah' => $jml_mapel['jumlah'],
		'total_mapel' => $jml_mapel['total_mapel'],
		'rata_rata' => $jml_mapel['rata_rata']
	);
}

$sql_rank = mysqli_query($koneksi, "SELECT x.id_siswa, nama_siswa, id_kelas, id_semester, SUM(nilai) AS jumlah, COUNT(id_mapel) AS total_mapel, 
ROUND(SUM(nilai)/COUNT(id_mapel)) AS rata_rata,
FIND_IN_SET(nilai, (SELECT GROUP_CONCAT(nilai ORDER BY nilai DESC) 
FROM nilai_raport_ki3)) AS rank
FROM nilai_raport_ki3 X 
INNER JOIN data_siswa Y ON y.id_siswa = x.id_siswa 
WHERE id_kelas = '".$dtsq1['id_kelas']."' 
AND id_semester = '".$dtsq2['id_semester']."' 
GROUP BY x.id_siswa ASC");
while ($dtrank = mysqli_fetch_array($sql_rank)) {
	$rank[] = array(
		'id_siswa' => $dtrank['id_siswa'],
		'nama_siswa' => $dtrank['nama_siswa'],
		'id_kelas' => $dtrank['id_kelas'],
		'id_semester' => $dtrank['id_semester'],
		'jumlah' => $dtrank['jumlah'],
		'total_mapel' => $dtrank['total_mapel'],
		'rata_rata' => $dtrank['rata_rata'],
		'rank' => $dtrank['rank']
	);
}

//menyorting nilai dari tinggi ke rendah;

?>
<nav aria-label="breadcrumb m-0">
  <ol class="breadcrumb">
    <li class="breadcrumb-item"><a href="#">Dasbhboard</a></li>
    <li class="breadcrumb-item"><a href="javascript:void(0);" class="menu-toggle">KD Pengetahuan</a></li>
    <li class="breadcrumb-item active" aria-current="page"><i><b>Rekap Nilai KI-3</b></i></li>
  </ol>
</nav>
<!-- Membuat card -->
<div class="card">
	<div class="header bg-indigo">
		<h2>Rekap Nilai KI-3 (Pengetahuan)</h2>
	</div>
	<div class="body">
		<div class="table table-responsive">
			<table class="table table-bordered table-hover">
				<thead>
				<tr>
					<th>ID SISWA</th>
					<th>NAMA SISWA</th>
					<?php
					$isi = count($array);
					for ($a=0; $a < $isi; $a++) { 
						echo "<th>".$array[$a]['singkatk3']."</th>";
					}
					?>
					<th>JUMLAH</th>
					<th>RATA-RATA</th>
					<th>RANKING</th>
				</tr>
				</thead>
				<tbody>
				<?php
					$no =1;
					$sqlnil = mysqli_query($koneksi, "SELECT y.id_siswa, x.id_mapel, nilai, singkat_mapel 
					FROM mapel X INNER JOIN nilai_raport_ki3 Y ON y.id_mapel = x.id_mapel 
					WHERE id_kelas = '".$dtsq1['id_kelas']."' AND id_semester = '".$dtsq2['id_semester']."'
					ORDER BY y.id_siswa ASC");
					$dtsql = mysqli_fetch_array($sqlnil);
					if (isset($dtsql['id_siswa']) == 1) {
						$sis = count($rank);
					}else if(isset($dtsql['id_siswa']) == 0){
						$sis = 0;
					}
					
					for ($c=0; $c < $sis; $c++) { 
					echo "<tr>";
						if ((isset($rank[$c]['id_kelas']) && isset($rank[$c]['id_semester'])) == 1) { ?>
						<td><?= $rank[$c]['id_siswa']; ?></td>
						<td><?= $rank[$c]['nama_siswa']; ?></td>
						<?php
						$nilai = mysqli_query($koneksi, "SELECT y.id_siswa, x.id_mapel, nilai, singkat_mapel 
FROM mapel X INNER JOIN nilai_raport_ki3 Y ON y.id_mapel = x.id_mapel 
WHERE id_siswa = '".$rank[$c]['id_siswa']."' AND id_kelas = '".$rank[$c]['id_kelas']."' AND id_semester = '".$rank[$c]['id_semester']."'
ORDER BY y.id_siswa ASC");
						while ($dt = mysqli_fetch_array($nilai)) {
							if ( $rank[$c]['id_siswa'] == $dt['id_siswa']) {
								if (isset($dt['nilai']) == 1) {
									echo "<td>".$dt['nilai']."</td>";
								}else if(isset($dt['nilai']) == 0){
									echo "<td>0</td>";
								}
							}
						}
						echo "<td>".$rank[$c]['jumlah']."</td>";
						echo "<td>".$rank[$c]['rata_rata']."</td>";
						echo "<td>Rank : ".$rank[$c]['rank']."</td>";

						}else if((isset($rank[$c]['id_kelas']) && isset($rank[$c]['id_semester'])) == 0){
							echo "<td>".$rank[$c]['id_siswa']."</td>";
							echo "<td>".$rank[$c]['id_semester']."</td>";
							echo "<td>0</td>";
							echo "<td>0</td>";
							echo "<td>0</td>";
							echo "<td>0</td>";
							echo "<td>0</td>";
							echo "<td>0</td>";
							echo "<td>0</td>";
							echo "<td>0</td>";
							echo "<td>0</td>";
							echo "<td>0</td>";
							} 
						echo "</tr>";
						} ?>
				</tbody>
			</table>
		</div>
	</div>
</div>