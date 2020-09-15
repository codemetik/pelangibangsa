<div class="card">
	<div class="header bg-indigo">
		<h2>Data Kelas</h2>
	</div>
	<div class="body">
                            <form action="" method="POST">
                            <div class="header col-sm-12 bg-blue-grey">
                                <h5>Tampilkan data siswa perkelas</h5>
                                <div class="col-sm-12">
                                    <input name="kelas" type="radio" id="kelas1" value="KLS01" class="with-gap radio-col-red" checked />
                                    <label for="kelas1">KELAS 1</label>
                                    <input name="kelas" type="radio" id="kelas2" value="KLS02" class="with-gap radio-col-red"/>
                                    <label for="kelas2">KELAS 2</label>
                                    <input name="kelas" type="radio" id="kelas3" value="KLS03" class="with-gap radio-col-red"/>
                                    <label for="kelas3">KELAS 3</label>
                                    <input name="kelas" type="radio" id="kelas4" value="KLS04" class="with-gap radio-col-red"/>
                                    <label for="kelas4">KELAS 4</label>
                                    <input name="kelas" type="radio" id="kelas5" value="KLS05" class="with-gap radio-col-red"/>
                                    <label for="kelas5">KELAS 5</label>
                                    <input name="kelas" type="radio" id="kelas6" value="KLS06" class="with-gap radio-col-red"/>
                                    <label for="kelas6">KELAS 6</label>
                                </div>
                                <input type="submit" name="ambil_kelas" value="Tampilkan" class="btn bg-light-blue">
                            </div>    
                            </form>
                            <?php 
                            if (isset($_POST['ambil_kelas'])) {
                                $kls = $_POST['kelas'];
                                $sq = mysqli_query($koneksi, "SELECT * FROM data_siswa_kelas_semester WHERE id_kelas ='".$kls."'");
                                $dtsq = mysqli_fetch_array($sq);
                                echo "<h5>".$dtsq['kelas']."</h5>";
                            }
                            ?>
                            <div class="table table-sm table-responsive">
                                <table class="table table-striped table-hover dataTable js-exportable font-11">
                                    <thead>
                                        <tr class="p-0">
                                        <?php 
                                        $kolom = array(
                                            "ID SISWA", "NAMA SISWA", "KELAS","STATUS","Action"
                                        );
                                        foreach ($kolom as $key) { 
                                            echo "<th class='bg-light-blue' scope='col'>".$key."</th>";
                                         } ?>
                                        </tr>
                                    </thead>

                                    <tbody>
                                        <?php 
                                        if (isset($_POST['ambil_kelas'])) {
                                            $kelas = $_POST['kelas'];
                                            $siswa_sql = mysqli_query($koneksi, "SELECT x.id_siswa,id_level_siswa, nama_siswa, y.id_kelas, kelas FROM data_siswa X INNER JOIN data_level_siswa Y ON y.id_siswa = x.id_siswa INNER JOIN kelas a ON a.id_kelas = y.id_kelas WHERE y.id_kelas = '".$kelas."'");    
                                        }else{
                                            $siswa_sql = mysqli_query($koneksi, "SELECT x.id_siswa, id_level_siswa,nama_siswa, y.id_kelas, kelas FROM data_siswa X INNER JOIN data_level_siswa Y ON y.id_siswa = x.id_siswa INNER JOIN kelas a ON a.id_kelas = y.id_kelas WHERE y.id_kelas = 'KLS01'");
                                        }
                                        while ($siswa_data = mysqli_fetch_array($siswa_sql)) {
                                        	$levelsm = mysqli_query($koneksi, "SELECT * FROM data_level_semester WHERE id_level_siswa = '".$siswa_data['id_level_siswa']."'");
                                        	$smlevel = mysqli_fetch_array($levelsm);
                                        	?>
                                            <tr><a href="#">
                                                <td><?= $siswa_data['id_siswa']; ?></td>
                                                <td><?= $siswa_data['nama_siswa']; ?></td>
                                                <td><?= $siswa_data['kelas']; ?></td>
                                                <?php 
                                                if (isset($smlevel['id_level_siswa']) == isset($siswa_data['id_level_siswa']) ) {
                                                	echo "<td class='bg-grey font-12'>Data ada di kelas</td>";
                                                }else if(isset($smlevel['id_level_siswa']) != isset($siswa_data['id_level_siswa'])){
                                                	echo "<td class='bg-red'>Data tidak ada di kelas semester, jika data siswa tidak akan ada penilaian lagi di kelas silahkan di hapus.</td>";
                                                }
                                                ?>
                                                </td>
                                                <td><a href="dashboard/delete/delete_data_level_siswa.php?id=<?= $siswa_data['id_level_siswa']; ?>" onclick="return confirm('Apakah anda yakin ingin menghapus siswa dari kelas ini?')"><button class="btn bg-indigo">Delete</button></a></td>
                                            </a>
                                            </tr>
                                        <?php } ?>
                                    </tbody>
                                </table>
                            </div>
                        </div>