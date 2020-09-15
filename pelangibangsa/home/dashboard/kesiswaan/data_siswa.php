<?php 
// pagination
$jumlahDataPerhalaman = 5;
$result = mysqli_query($koneksi, "SELECT * FROM data_siswa");
$jumlahData = mysqli_num_rows($result);
$jumlahHalaman = ceil($jumlahData / $jumlahDataPerhalaman);
$halamanAktif = (isset($_GET['halaman']) ) ? $_GET['halaman'] : 1;
$awalData = ($jumlahDataPerhalaman * $halamanAktif) - $jumlahDataPerhalaman;
// #pagination
?>

<nav aria-label="breadcrumb m-0">
  <ol class="breadcrumb">
    <li class="breadcrumb-item"><a href="admin">Dashboard</a></li>
    <li class="breadcrumb-item"><a href="javascript:void(0);" class="menu-toggle">Siswa</a></li>
    <li class="breadcrumb-item active" aria-current="page"><i><b>Data siswa</b></i></li>
  </ol>
</nav>

<div class="card">
	<div class="header bg-indigo">
		<h2>Data Siswa</h2>
	</div>
	<div class="body">
		<div class="table table-responsive">
            <table class="table table-sm dataTable">
            <tr>
                <form action="" method="POST">
                    <th>
                        <a type="button" class="btn btn-primary m-0 waves-effect" href="?page=siswa_baru">
                            <i class="material-icons">add</i>Tambah Siswa
                        </a>
                    </th>
                    <th></th>
                  <th>
                      <div class="form-group form-float">
                        <div class="form-line ">
                              <input type="text" name="table_search" class="form-control float-right" placeholder="Search name">
                        </div>
                    </div>
                  </th>
                  <th>
                      <div class="form-group form-float">
                        <div class="input-group-append">
                              <button type="submit" name="search"><i class="material-icons">search</i></button>
                        </div>
                    </div>
                  </th>
                  <th>
                      <a href="?page=data_siswa"><button type="button">Refresh</button></a>
                  </th>
                </form>
            </tr>
            </table>
        </div>
        <!-- pagination -->
                            <nav>
                                <ul class="pagination">
                                    <?php 
                                    for ($i=1; $i <= $jumlahHalaman; $i++) { 
                                        if ($i == $halamanAktif) { ?>
                                            <li><a href="?page=data_siswa&halaman=<?= $i; ?>" style="font-weight: bold; color: red;" class="waves-effect active"><?= $i; ?></a></li>
                                        <?php }else{
                                        ?>
                                        <li><a href="?page=data_siswa&halaman=<?= $i; ?>" class="waves-effect"><?= $i; ?></a></li>
                                    <?php } 
                                    }
                                    ?>
                                </ul>
                            </nav>
                            <!-- #pagination -->
		<div class="table table-responsive">
			<table class="table table-bordered table-hover font-11">
				<thead>
				<tr>
					<?php 
					$array = array('NO','ID SISWA','NISN','NIS','NAMA SISWA','JK','Tempat & Tgl Lahir','AGAMA','PEND.SEBELUMNYA','ALAMAT SERTA DIDIK','NAMA AYAH','NAMA IBU','PEKERJAAN AYAH','PEKERJAAN IBU','JALAN','KELURAHAN','KECAMATAN','KOTA','PROVINSI','NO TELP','NAMA WALI','PEKERJAAN WALI','ALAMAT WALI','NO TELP WALI', 'Tanggal Masuk', 'Tahun Ajaran','Action');
					foreach ($array as $key) {
						echo "<th class='float-center'>".$key."</th>";
					}
					?>
				</tr>
				</thead>
				<tbody>
					<?php
					$no=1;
					if (isset($_POST['search'])) {
						$cari = $_POST['table_search'];
						$sql = mysqli_query($koneksi, "SELECT * FROM data_siswa WHERE id_siswa LIKE '%".$cari."%' OR nisn LIKE '%".$cari."%' OR nis LIKE '%".$cari."%' OR nama_siswa LIKE '%".$cari."%' OR jk LIKE '%".$cari."%'");
					}else{
						$sql = mysqli_query($koneksi, "SELECT * FROM data_siswa LIMIT $awalData, $jumlahDataPerhalaman");
					}
					while ($data = mysqli_fetch_array($sql)) {
						?>
						<tr>
							<td><?= $no++; ?></td>
							<td><?= $data['id_siswa']; ?></td>
							<td><?= $data['nisn']; ?></td>
							<td><?= $data['nis']; ?></td>
							<td><?= $data['nama_siswa']; ?></td>
							<td><?= $data['jk']; ?></td>
							<td><?= $data['tempat_lahir'].", ".$data['tanggal_lahir']; ?></td>
							<td><?php 
							$agm = mysqli_query($koneksi, "SELECT * FROM agama");
							while($dtagm = mysqli_fetch_array($agm)){
							if ($data['id_agama'] == $dtagm['id_agama']) {
								echo $dtagm['agama'];
							}}
							?></td>
							<td><?= $data['pend_sebelumnya']; ?></td>
							<td><?= $data['alamat_serta_didik']; ?></td>
							<td><?= $data['nama_ayah']; ?></td>
							<td><?= $data['nama_ibu']; ?></td>
							<td><?= $data['pekerjaan_ayah']; ?></td>
							<td><?= $data['pekerjaan_ibu']; ?></td>
							<!-- <td><?= $data['jalan']; ?></td> -->
							<td><?= $data['desa_kelurahan']; ?></td>
							<td><?= $data['kecamatan']; ?></td>
							<td><?= $data['kabupaten_kota']; ?></td>
							<td><?= $data['provinsi']; ?></td>
							<td><?= $data['no_telp_hp']; ?></td>
							<td><?= $data['nama_wali']; ?></td>
							<td><?= $data['pekerjaan_wali']; ?></td>
							<td><?= $data['alamat_wali']; ?></td>
							<td><?= $data['no_telp_hp_wali']; ?></td>
							<td><?= $data['tgl_masuk_siswa']; ?></td>
							<td><?= $data['tahun_ajaran_awal']."/".$data['tahun_ajaran_akhir']; ?></td>
							<td>
								<div class="dropdown">
                                    <button type="submit" href="" class="btn bg-indigo" data-toggle="dropdown">
                                        Action
                                    </button>
                                    <ul class="dropdown-menu pull-right">
                                        <li><a href="?page=data_siswa&id=<?= $data['id_siswa']; ?>">Detail</a></li>
                                        <li><a href="javascript:void(0);">Delete</a></li>
                                    </ul>
                                </div>
							</td>
						</tr>
					<?php }
					?>
				</tbody>
			</table>
		</div>
	</div>
</div>
<?php 
if (!isset($_GET['id'])) {
    echo "";
}else{
    include "dashboard/kesiswaan/edit_siswa.php";
}
?>