<?php 
$sq1 = mysqli_query($koneksi, "SELECT * FROM kelas WHERE kelas = '".$_SESSION['kelas']."'");
$dtsq1 = mysqli_fetch_array($sq1);

$sq2 = mysqli_query($koneksi, "SELECT * FROM semester WHERE semester = '".$_SESSION['semester']."'");
$dtsq2 = mysqli_fetch_array($sq2);
?>
<nav aria-label="breadcrumb m-0">
  <ol class="breadcrumb">
    <li class="breadcrumb-item"><a href="#">Dasbhboard</a></li>
    <li class="breadcrumb-item"><a href="javascript:void(0);" class="menu-toggle">Penilaian</a></li>
    <li class="breadcrumb-item active" aria-current="page"><i><b>Gabungan Ekskul</b></i></li>
  </ol>
</nav>
<div class="card">
	<div class="header bg-indigo">
		<h2>Gabungan Ekskul</h2>
	</div>
	<div class="body">
		<div class="table table-responsive">
			<table class="table table-hover table-bordered">
				<thead>
					<tr>
						<th rowspan="2" class="bg-light-green">NAMA SISWA</th>
						<th rowspan="1" class="bg-brown">PRAMUKA</th>
						<th colspan="2" class="bg-cyan">OLAHRAGA</th>
						<th colspan="2" class="bg-blue">SENI</th>
						<th colspan="2" class="bg-deep-purple">KEAGAMAAN/LAINNYA</th>
					</tr>
					<tr>
						<th class="bg-brown">Deskripsi</th>
						<th class="bg-cyan">Jenis</th>
						<th class="bg-cyan">Deskripsi</th>
						<th class="bg-blue">Jenis</th>
						<th class="bg-blue">Deskripsi</th>
						<th class="bg-deep-purple">Jenis</th>
						<th class="bg-deep-purple">Deskripsi</th>
					</tr>
				</thead>
				<tbody>
					<?php 
					$sql = mysqli_query($koneksi, "SELECT nama_siswa, x.kegiatan as kegx, x.keterangan as ketx, a.kegiatan as kega, a.keterangan as keta, z.kegiatan as kegz, z.keterangan as ketz, y.kegiatan as kegy, y.keterangan as kety FROM data_siswa b
INNER JOIN tb_ekskul_pil1 a ON a.id_siswa = b.id_siswa
INNER JOIN tb_ekskul_pil2 z ON z.id_siswa = b.id_siswa
INNER JOIN tb_ekskul_pil3 Y ON y.id_siswa = b.id_siswa
INNER JOIN tb_ekskul_wajib X ON x.id_siswa = b.id_siswa 
WHERE x.id_kelas = '".$dtsq1['id_kelas']."' AND x.id_semester = '".$dtsq2['id_semester']."'
GROUP BY b.id_siswa ASC");
					while ($data = mysqli_fetch_array($sql)) { ?>
						<tr>
							<td><?= $data['nama_siswa']; ?></td>
							<td><?= $data['ketx']; ?></td>
							<td><?= $data['kega']; ?></td>
							<td><?= $data['keta']; ?></td>
							<td><?= $data['kegz']; ?></td>
							<td><?= $data['ketz']; ?></td>
							<td><?= $data['kegy']; ?></td>
							<td><?= $data['kety']; ?></td>
						</tr>
					<?php }
					?>
				</tbody>
			</table>
		</div>
	</div>
</div>