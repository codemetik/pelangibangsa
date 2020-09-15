<?php 
include "../../connect.php";

$sqlper = mysqli_query($koneksi, "SELECT count(id_siswa) as person FROM data_level_siswa");
$person = mysqli_fetch_array($sqlper);
$sqlmapel = mysqli_query($koneksi, "SELECT count(id_mapel) as mapel FROM mapel");
$mapel = mysqli_fetch_array($sqlmapel);
$sqlwalas = mysqli_query($koneksi, "SELECT COUNT(id_position) AS id FROM master_level WHERE id_position = 'PS03'");
$walas = mysqli_fetch_array($sqlwalas);
$sqlkelas = mysqli_query($koneksi, "SELECT COUNT(nisn) AS nisn FROM data_siswa");
$kelas = mysqli_fetch_array($sqlkelas);
?>

<!-- Widgets -->
            <div class="row clearfix">
                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                    <div class="info-box hover-expand-effect bg-light-blue">
                        <div class="icon bg-indigo">
                            <i class="material-icons">school</i>
                        </div>
                        <div class="content">
                            <div class="text">SISWA</div>
                            <div class="number count-to" data-from="0" data-to="<?= $person['person']; ?>" data-speed="1000" data-fresh-interval="20"><?= $person['person']; ?></div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                    <div class="info-box hover-expand-effect bg-light-blue">
                        <div class="icon bg-indigo">
                            <i class="material-icons">books</i>
                        </div>
                        <div class="content">
                            <div class="text">MAPEL</div>
                            <div class="number count-to" data-from="0" data-to="<?= $mapel['mapel']; ?>" data-speed="1000" data-fresh-interval="20"><?= $mapel['mapel']; ?></div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                    <div class="info-box hover-expand-effect bg-light-blue">
                        <div class="icon bg-indigo">
                            <i class="material-icons">person</i>
                        </div>
                        <div class="content">
                            <div class="text">GURU KELAS</div>
                            <div class="number count-to" data-from="0" data-to="<?= $walas['id']; ?>" data-speed="1000" data-fresh-interval="20"><?= $walas['id']; ?></div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                    <div class="info-box hover-expand-effect bg-light-blue">
                        <div class="icon bg-indigo">
                            <i class="material-icons">group</i>
                        </div>
                        <div class="content">
                            <div class="text">NISN</div>
                            <div class="number count-to" data-from="0" data-to="<?= $kelas['nisn']; ?>" data-speed="1000" data-fresh-interval="20"><?= $kelas['nisn']; ?></div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- #END# Widgets -->
<!-- Ki3 -->
            <div class="row clearfix">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="card">
                        <div class="header bg-indigo">
                            <h2>
                                DATA REKAP SISWA PENGETAHUAN (Ki-3)
                            </h2>
                            <!-- <ul class="header-dropdown m-r--5">
                                <li class="dropdown">
                                    <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                                        <i class="material-icons">more_vert</i>
                                    </a>
                                    <ul class="dropdown-menu pull-right">
                                        <li><a href="javascript:void(0);">Print .pdf</a></li>
                                        <li><a href="javascript:void(0);">Print .csv</a></li>
                                        <li><a href="javascript:void(0);">Print Excel</a></li>
                                    </ul>
                                </li>
                            </ul> -->
                        </div>
                        <?php 
                        // pagination
                        $jumlahDataPerhalaman = 2 ;
                        $result = mysqli_query($koneksi, "SELECT * FROM siswa_kelas_semester WHERE kelas = '".$_SESSION['kelas']."' AND semester = '".$_SESSION['semester']."' ");
                        $jumlahData = mysqli_num_rows($result);
                        $jumlahHalaman = ceil($jumlahData / $jumlahDataPerhalaman);
                        $halamanAktif = (isset($_GET['halaman']) ) ? $_GET['halaman'] : 1;
                        $awalData = ($jumlahDataPerhalaman * $halamanAktif) - $jumlahDataPerhalaman;
                        // #pagination
                        ?>
                        <div class="body">
                            <!-- pagination -->
                            <nav>
                                <ul class="pagination pagination-sm">
                                    <?php 
                                    if ($halamanAktif > 1) { ?>
                                    <li>
                                        <a href="?halaman=<?= $halamanAktif - 1; ?>" class="waves-effect">
                                            <i class="material-icons">chevron_left</i>
                                        </a>
                                    </li>
                                    <?php 
                                    }

                                    for ($i=1; $i <= $jumlahHalaman; $i++) { 
                                        if ($i == $halamanAktif) { ?>
                                            <li><a href="?halaman=<?= $i; ?>" style="font-weight: bold; color: red;" class="waves-effect active"><?= $i; ?></a></li>
                                        <?php }else{
                                        ?>
                                        <li><a href="?halaman=<?= $i; ?>" class="waves-effect"><?= $i; ?></a></li>
                                    <?php } 
                                    }

                                    if ($halamanAktif < $jumlahHalaman) { ?>
                                    <li>
                                        <a href="?halaman=<?= $halamanAktif + 1; ?>" class="waves-effect">
                                            <i class="material-icons">chevron_right</i>
                                        </a>
                                    </li>
                                    <?php }
                                    ?>
                                </ul>
                            </nav>
                            <!-- #pagination -->
                            <div class="table-responsive">
                                <table class="table table-bordered table-striped table-hover font-12">
                                    <thead class="">
                                        <tr class="bg-light-blue">
                                            <th rowspan="2" class="align-center">NISN</th>
                                            <th rowspan="2" class="align-center">NIS</th>
                                            <th rowspan="2" class="align-center">Nama Sisawa</th>
                                            <th rowspan="2" class="align-center">JK</th>
                                            <?php 
                                            $sql = mysqli_query($koneksi, "SELECT * FROM mapel");
                                            while ($mpl = mysqli_fetch_array($sql)) { ?>
                                                <th colspan="3" class="align-center"><?= $mpl['nama_mapel']; ?></th>     
                                            <?php }
                                            ?>
                                        </tr>
                                        <tr class="bg-light-blue">
                                            <?php 
                                            $sqlj = mysqli_query($koneksi, "SELECT * FROM mapel");
                                            while ($dj = mysqli_fetch_array($sqlj)) {
                                                $array[] = array(
                                                    "id_mapel" => $dj['id_mapel']
                                                );
                                            }
                                            $count = count($array);
                                            $i = 1;
                                            while ($i <= $count) { ?>
                                                <th class="">Nilai</th>
                                                <th class="">Predikat</th>
                                                <th class="" scope="col">Deskripsi</th>
                                            <?php $i = $i+1; }
                                            ?>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <?php 
                                        $sq1 = mysqli_query($koneksi, "SELECT * FROM kelas WHERE kelas = '".$_SESSION['kelas']."'");
                                        $dtsq1 = mysqli_fetch_array($sq1);

                                        $sq2 = mysqli_query($koneksi, "SELECT * FROM semester WHERE semester = '".$_SESSION['semester']."'");
                                        $dtsq2 = mysqli_fetch_array($sq2);

                                        $sqls = mysqli_query($koneksi, "SELECT * FROM siswa_kelas_semester WHERE kelas = '".$_SESSION['kelas']."' AND semester = '".$_SESSION['semester']."' LIMIT $awalData, $jumlahDataPerhalaman");
                                        while ($siswa = mysqli_fetch_array($sqls)) { ?>
                                        <tr>
                                            <td><?= $siswa['nisn']; ?></td>
                                            <td><?= $siswa['nis']; ?></td>
                                            <td class="col-md-6"><?= $siswa['nama_siswa']; ?></td>
                                            <td><?= $siswa['jk']; ?></td>
                                            <?php 
                                            $sqln = mysqli_query($koneksi, "SELECT nisn, nis, nama_siswa, jk, nama_mapel, nilai, predikat, deskripsi 
                                                FROM data_siswa X RIGHT JOIN nilai_raport_ki3 Y ON Y.id_siswa = X.id_siswa WHERE X.id_siswa = '".$siswa['id_siswa']."' AND id_kelas = '".$dtsq1['id_kelas']."' AND id_semester = '".$dtsq2['id_semester']."' ORDER BY id_mapel");
                                        while ($n = mysqli_fetch_array($sqln)) {
                                            echo "<td>".$n['nilai']."</td>";
                                            echo "<td>".$n['predikat']."</td>";
                                            echo "<td class='align-justify' scope='row' class='col-md-6'>".$n['deskripsi']."</td>";    
                                            }
                                            ?>
                                        </tr>
                                        <?php 
                                    }
                                        ?>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- #END# Ki3 -->

<!-- Ki4 -->
            <div class="row clearfix">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="card">
                        <div class="header bg-indigo">
                            <h2>
                                DATA REKAP SISWA KETERAMPILAN (Ki-4)
                            </h2>
                            <!-- <ul class="header-dropdown m-r--5">
                                <li class="dropdown">
                                    <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                                        <i class="material-icons">more_vert</i>
                                    </a>
                                    <ul class="dropdown-menu pull-right">
                                        <li><a href="javascript:void(0);">Print .pdf</a></li>
                                        <li><a href="javascript:void(0);">Print .csv</a></li>
                                        <li><a href="javascript:void(0);">Print Excel</a></li>
                                    </ul>
                                </li>
                            </ul> -->
                        </div>
                        <?php 
                        // pagination
                        $jumlahDataPerhalaman = 2 ;
                        $result = mysqli_query($koneksi, "SELECT * FROM siswa_kelas_semester WHERE kelas = '".$_SESSION['kelas']."' AND semester = '".$_SESSION['semester']."' ");
                        $jumlahData = mysqli_num_rows($result);
                        $jumlahHalaman = ceil($jumlahData / $jumlahDataPerhalaman);
                        $halamanAktif = (isset($_GET['pageki4']) ) ? $_GET['pageki4'] : 1;
                        $awalData = ($jumlahDataPerhalaman * $halamanAktif) - $jumlahDataPerhalaman;
                        // #pagination
                        ?>
                        <div class="body">
                            <!-- pagination -->
                            <nav>
                                <ul class="pagination pagination-sm">
                                    <?php 
                                    if ($halamanAktif > 1) { ?>
                                    <li>
                                        <a href="?pageki4=<?= $halamanAktif - 1; ?>" class="waves-effect">
                                            <i class="material-icons">chevron_left</i>
                                        </a>
                                    </li>
                                    <?php 
                                    }

                                    for ($i=1; $i <= $jumlahHalaman; $i++) { 
                                        if ($i == $halamanAktif) { ?>
                                            <li><a href="?pageki4=<?= $i; ?>" style="font-weight: bold; color: red;" class="waves-effect active"><?= $i; ?></a></li>
                                        <?php }else{
                                        ?>
                                        <li><a href="?pageki4=<?= $i; ?>" class="waves-effect"><?= $i; ?></a></li>
                                    <?php } 
                                    }

                                    if ($halamanAktif < $jumlahHalaman) { ?>
                                        <li>
                                        <a href="?pageki4=<?= $halamanAktif + 1; ?>" class="waves-effect">
                                            <i class="material-icons">chevron_right</i>
                                        </a>
                                    </li>        
                                    <?php }
                                    ?>
                                </ul>
                            </nav>
                            <!-- #pagination -->
                            <div class="table-responsive">
                                <table class="table table-bordered table-striped table-hover font-12">
                                    <thead class="">
                                        <tr class="bg-light-blue">
                                            <th rowspan="2" class="align-center">NISN</th>
                                            <th rowspan="2" class="align-center">NIS</th>
                                            <th rowspan="2" class="align-center">Nama Sisawa</th>
                                            <th rowspan="2" class="align-center">JK</th>
                                            <?php 
                                            $sql1 = mysqli_query($koneksi, "SELECT * FROM mapel");
                                            while ($mpl1 = mysqli_fetch_array($sql1)) { ?>
                                                <th colspan="3" class="align-center"><?= $mpl1['nama_mapel']; ?></th>     
                                            <?php }
                                            ?>
                                        </tr>
                                        <tr class="bg-light-blue">
                                            <?php 
                                            $sqlj1 = mysqli_query($koneksi, "SELECT * FROM mapel");
                                            while ($dj1 = mysqli_fetch_array($sqlj1)) {
                                                $array1[] = array(
                                                    "id_mapel" => $dj1['id_mapel']
                                                );
                                            }
                                            $count1 = count($array1);
                                            $ii = 1;
                                            while ($ii <= $count1) { ?>
                                                <th class="">Nilai</th>
                                                <th class="">Predikat</th>
                                                <th class="">Deskripsi</th>
                                            <?php $ii = $ii+1; }
                                            ?>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <?php 
                                        $sqls1 = mysqli_query($koneksi, "SELECT * FROM siswa_kelas_semester WHERE kelas = '".$_SESSION['kelas']."' AND semester = '".$_SESSION['semester']."' LIMIT $awalData, $jumlahDataPerhalaman");
                                        while ($siswa1 = mysqli_fetch_array($sqls1)) { ?>
                                        <tr class="">
                                            <td><?= $siswa1['nisn']; ?></td>
                                            <td><?= $siswa1['nis']; ?></td>
                                            <td><?= $siswa1['nama_siswa']; ?></td>
                                            <td><?= $siswa1['jk']; ?></td>
                                            <?php 
                                            $sqln1 = mysqli_query($koneksi, "SELECT nisn, nis, nama_siswa, jk, nama_mapel, nilai, predikat, deskripsi 
                                                FROM data_siswa X RIGHT JOIN nilai_raport_ki4 Y ON Y.id_siswa = X.id_siswa WHERE X.id_siswa = '".$siswa1['id_siswa']."' AND id_kelas = '".$dtsq1['id_kelas']."' AND id_semester = '".$dtsq2['id_semester']."' ORDER BY id_mapel");
                                        while ($n1 = mysqli_fetch_array($sqln1)) {
                                            echo "<td>".$n1['nilai']."</td>";
                                            echo "<td>".$n1['predikat']."</td>";
                                            echo "<td class='align-justify'>".$n1['deskripsi']."</td>";    
                                            }
                                            ?>
                                        </tr>
                                        <?php 
                                    }
                                        ?>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- #END# Ki4 -->

<!-- gabungan -->
            <div class="row clearfix">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="card">
                        <div class="header bg-indigo">
                            <h2>
                                DATA REKAP GABUNGAN SISWA <b>SIKAP SPIRITUAL (Ki-1) & SIKAP SOSIAL (Ki-2)</b>
                            </h2>
                            <!-- <ul class="header-dropdown m-r--5">
                                <li class="dropdown">
                                    <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                                        <i class="material-icons">more_vert</i>
                                    </a>
                                    <ul class="dropdown-menu pull-right">
                                        <li><a href="javascript:void(0);">Print .pdf</a></li>
                                        <li><a href="javascript:void(0);">Print .csv</a></li>
                                        <li><a href="javascript:void(0);">Print Excel</a></li>
                                    </ul>
                                </li>
                            </ul> -->
                        </div>
                        <?php 
                        // pagination
                        $jumlahDataPerhalaman = 5 ;
                        $result = mysqli_query($koneksi, "SELECT * FROM nilai_raport_spiritual X INNER JOIN siswa_kelas_semester Y ON Y.id_siswa = X.id_siswa WHERE kelas = '".$_SESSION['kelas']."' AND semester = '".$_SESSION['semester']."' GROUP BY X.id_siswa");
                        $jumlahData = mysqli_num_rows($result);
                        $jumlahHalaman = ceil($jumlahData / $jumlahDataPerhalaman);
                        $halamanAktif = (isset($_GET['halaman']) ) ? $_GET['halaman'] : 1;
                        $awalData = ($jumlahDataPerhalaman * $halamanAktif) - $jumlahDataPerhalaman;
                        // #pagination
                        ?>
                        <div class="body">
                            <!-- pagination -->
                            <nav>
                                <ul class="pagination pagination-sm">
                                    <?php 
                                    if ($halamanAktif > 1) { ?>
                                    <li>
                                        <a href="?halaman=<?= $halamanAktif - 1; ?>" class="waves-effect">
                                            <i class="material-icons">chevron_left</i>
                                        </a>
                                    </li>
                                    <?php 
                                    }

                                    for ($i=1; $i <= $jumlahHalaman; $i++) { 
                                        if ($i == $halamanAktif) { ?>
                                            <li><a href="?halaman=<?= $i; ?>" style="font-weight: bold; color: red;" class="waves-effect active"><?= $i; ?></a></li>
                                        <?php }else{
                                        ?>
                                        <li><a href="?halaman=<?= $i; ?>" class="waves-effect"><?= $i; ?></a></li>
                                    <?php } 
                                    }

                                    if ($halamanAktif < $jumlahHalaman) { ?>
                                    <li>
                                        <a href="?halaman=<?= $halamanAktif + 1; ?>" class="waves-effect">
                                            <i class="material-icons">chevron_right</i>
                                        </a>
                                    </li>
                                    <?php }
                                    ?>
                                </ul>
                            </nav>
                            <!-- #pagination -->
                            <div class="table-responsive">
                                <table class="table table-bordered table-striped table-hover font-12">
                                    <thead class="">
                                        <tr class="bg-light-blue">
                                            <th rowspan="2">NISN</th>
                                            <th rowspan="2">NIS</th>
                                            <th rowspan="2">Nama Siswa</th>
                                            <th colspan="3" class="align-center">Sikap Spiritual</th>
                                            <th colspan="3" class="align-center">Sikap Sosial</th>
                                        </tr>
                                        <tr class="bg-light-blue">
                                            <th>Nilai</th>
                                            <th>Predikat</th>
                                            <th class="col-md-6">Deskripsi</th>
                                            <th>Nilai</th>
                                            <th>Predikat</th>
                                            <th class="col-md-6">Deskripsi</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <?php 
                                            $sq1 = mysqli_query($koneksi, "SELECT * FROM kelas WHERE kelas = '".$_SESSION['kelas']."'");
                                            $dtsq1 = mysqli_fetch_array($sq1);

                                            $sq2 = mysqli_query($koneksi, "SELECT * FROM semester WHERE semester = '".$_SESSION['semester']."'");
                                            $dtsq2 = mysqli_fetch_array($sq2);

                                            $sqlskp = mysqli_query($koneksi, "SELECT nisn, nis, nama_siswa, Y.nilai AS nilaia, Y.predikat AS predikata, Y.deskripsi AS deskripsia, Z.nilai AS nilaib, Z.predikat AS predikatb, Z.deskripsi AS deskripsib FROM siswa_kelas_semester X INNER JOIN nilai_raport_spiritual Y ON Y.id_siswa = X.id_siswa INNER JOIN nilai_raport_sosial Z ON Z.id_siswa = X.id_siswa WHERE Y.id_kelas = '".$dtsq1['id_kelas']."' AND Y.id_semester = '".$dtsq2['id_semester']."' AND Z.id_kelas = '".$dtsq1['id_kelas']."' AND Z.id_semester = '".$dtsq2['id_semester']."' GROUP BY X.id_siswa LIMIT $awalData, $jumlahDataPerhalaman");
                                            while ($dtskp = mysqli_fetch_array($sqlskp)) { ?>
                                            <tr>
                                                <td><?= $dtskp['nisn']; ?></td>
                                                <td><?= $dtskp['nis']; ?></td>
                                                <td><?= $dtskp['nama_siswa']; ?></td>
                                                <td><?= $dtskp['nilaia']; ?></td>
                                                <td><?= $dtskp['predikata']; ?></td>
                                                <td><?= $dtskp['deskripsia']; ?></td>
                                                <td><?= $dtskp['nilaib']; ?></td>
                                                <td><?= $dtskp['predikatb']; ?></td>
                                                <td><?= $dtskp['deskripsib']; ?></td>
                                            </tr>
                                            <?php }
                                            ?>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- #END# gabungan -->