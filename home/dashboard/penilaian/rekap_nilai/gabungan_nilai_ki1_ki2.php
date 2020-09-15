<nav aria-label="breadcrumb m-0">
  <ol class="breadcrumb">
    <li class="breadcrumb-item"><a href="../dashboard">Dashboard</a></li>
    <li class="breadcrumb-item"><a href="javascript:void(0);" class="menu-toggle">Input sikap</a></li>
    <li class="breadcrumb-item active" aria-current="page"><i><b>Gabungan KI-1 & KI-2</b></i></li>
  </ol>
</nav>
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
                                        <a href="?page=gabungan&halaman=<?= $halamanAktif - 1; ?>" class="waves-effect">
                                            <i class="material-icons">chevron_left</i>
                                        </a>
                                    </li>
                                    <?php 
                                    }

                                    for ($i=1; $i <= $jumlahHalaman; $i++) { 
                                        if ($i == $halamanAktif) { ?>
                                            <li><a href="?page=gabungan&halaman=<?= $i; ?>" style="font-weight: bold; color: red;" class="waves-effect active"><?= $i; ?></a></li>
                                        <?php }else{
                                        ?>
                                        <li><a href="?page=gabungan&halaman=<?= $i; ?>" class="waves-effect"><?= $i; ?></a></li>
                                    <?php } 
                                    }

                                    if ($halamanAktif < $jumlahHalaman) { ?>
                                    <li>
                                        <a href="?page=gabungan&halaman=<?= $halamanAktif + 1; ?>" class="waves-effect">
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

                                            $sqlskp = mysqli_query($koneksi, "SELECT nisn, nis, nama_siswa, Y.nilai AS nilaia, Y.predikat AS predikata, Y.deskripsi AS deskripsia, Z.nilai AS nilaib, Z.predikat AS predikatb, Z.deskripsi AS deskripsib FROM data_siswa X INNER JOIN nilai_raport_spiritual Y ON Y.id_siswa = X.id_siswa INNER JOIN nilai_raport_sosial Z ON Z.id_siswa = X.id_siswa WHERE Y.id_kelas = '".$dtsq1['id_kelas']."' AND Y.id_semester = '".$dtsq2['id_semester']."' AND Z.id_kelas = '".$dtsq1['id_kelas']."' AND Z.id_semester = '".$dtsq2['id_semester']."' ORDER BY X.id_siswa LIMIT $awalData, $jumlahDataPerhalaman");
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
            <!-- #END# Ki3 -->