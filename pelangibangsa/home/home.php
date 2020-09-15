<?php 
                        $d1 = mysqli_query($koneksi, "SELECT count(id_jurnal_sp) AS id_jurnal_sp FROM jurnal_spiritual");
                        $d11 = mysqli_fetch_array($d1);

                        $d2 = mysqli_query($koneksi, "SELECT count(id_jurnal_so) AS id_jurnal_so FROM jurnal_sosial");
                        $d22 = mysqli_fetch_array($d2);

                        $d3 = mysqli_query($koneksi, "SELECT count(id_kd) AS id_kd FROM kd_pengetahuan");
                        $d33 = mysqli_fetch_array($d3);

                        $d4 = mysqli_query($koneksi, "SELECT count(id_kd) AS id_kd FROM kd_keterampilan");
                        $d44 = mysqli_fetch_array($d4);

                        $d5 = mysqli_query($koneksi, "SELECT count(id_spiritual) AS id_spiritual FROM sikap_spiritual");
                        $d55 = mysqli_fetch_array($d5);

                        $d6 = mysqli_query($koneksi, "SELECT count(id_sosial) AS id_sosial FROM sikap_sosial");
                        $d66 = mysqli_fetch_array($d6);

                        $d7 = mysqli_query($koneksi, "SELECT count(id_ekstra) AS id_ekstra FROM ekstrakurikuler");
                        $d77 = mysqli_fetch_array($d7);

                        $d8 = mysqli_query($koneksi, "SELECT count(id_prestasi) AS id_prestasi FROM prestasi");
                        $d88 = mysqli_fetch_array($d8);
                        
                        // pagination
                        $jumlahDataPerhalaman = 10 ;
                        $result = mysqli_query($koneksi, "SELECT * FROM siswa_kelas");
                        $jumlahData = mysqli_num_rows($result);
                        $jumlahHalaman = ceil($jumlahData / $jumlahDataPerhalaman);
                        $halamanAktif = (isset($_GET['halaman']) ) ? $_GET['halaman'] : 1;
                        $awalData = ($jumlahDataPerhalaman * $halamanAktif) - $jumlahDataPerhalaman;
                        // #pagination

                        ?>
                        <div class="body m-b-20">
                            <div class="row clearfix m-b-20">
                                <div class="col-xs-6 col-sm-6 col-md-3 col-lg-3">
                                    <button class="btn btn-lg bg-light-blue btn-block waves-effect" type="button">KI-1 SPIRITUAL<span class="badge bg-indigo"><?= $d11['id_jurnal_sp']; ?></span></button>
                                </div>
                                <div class="col-xs-6 col-sm-6 col-md-3 col-lg-3">
                                    <button class="btn btn-lg bg-light-blue btn-block waves-effect" type="button">KI-2 SOSIAL<span class="badge bg-indigo"><?= $d22['id_jurnal_so']; ?></span></button>
                                </div>
                                <div class="col-xs-6 col-sm-6 col-md-3 col-lg-3">
                                    <button class="btn btn-lg bg-light-blue btn-block waves-effect" type="button">KI-3 PENGETAHUAN<span class="badge bg-indigo"><?= $d33['id_kd']; ?></span></button>
                                </div>
                                <div class="col-xs-6 col-sm-6 col-md-3 col-lg-3">
                                    <button class="btn btn-lg bg-light-blue btn-block waves-effect" type="button">KI-4 KETERAMPILAN<span class="badge bg-indigo"><?= $d44['id_kd']; ?></span></button>
                                </div>
                                
                            </div>
                            <div class="row clearfix">
                                
                                <div class="col-xs-6 col-sm-6 col-md-3 col-lg-3">
                                    <button class="btn btn-lg bg-light-blue btn-block waves-effect" type="button">SIKAP SPIRITUAL<span class="badge bg-indigo"><?= $d55['id_spiritual']; ?></span></button>
                                </div>
                                <div class="col-xs-6 col-sm-6 col-md-3 col-lg-3">
                                    <button class="btn btn-lg bg-light-blue btn-block waves-effect" type="button">SIKAP SOSIAL<span class="badge bg-indigo"><?= $d66['id_sosial']; ?></span></button>
                                </div>
                                <div class="col-xs-6 col-sm-6 col-md-3 col-lg-3">
                                    <button class="btn btn- bg-light-blue btn-block waves-effect" type="button">EKSKULL<span class="badge bg-indigo"><?= $d77['id_ekstra']; ?></span></button>
                                </div>
                                <div class="col-xs-6 col-sm-6 col-md-3 col-lg-3">
                                    <button class="btn btn-lg bg-light-blue btn-block waves-effect" type="button">PRESTASI<span class="badge bg-indigo"><?= $d88['id_prestasi']; ?></span></button>
                                </div>
                                
                                
                            </div>
                        </div>

<!-- Exportable Table -->
            <div class="row clearfix m-0">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="card">
                        <div class="header bg-indigo">
                            <h2>
                                Data siswa
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
                        <div class="body">
                            <div class="">
                                <div class="table">
                                    <table class="table table-sm dataTable">
                                    <tr>
                                        <form action="" method="POST">
                                            <th class="col-sm-2">
                                                Name/Kelas :
                                            </th>
                                            <th>
                                                <!-- <select name="table_search">
                                                    <option value="Kelas I">Kelas I</option>
                                                    <option value="Kelas II">Kelas II</option>
                                                    <option value="Kelas III">Kelas III</option>
                                                    <option value="kelas IV">Kelas IV</option>
                                                    <option value="Kelas V">Kelas V</option>
                                                    <option value="Kelas VI">Kelas VI</option>

                                                </select> -->
                                            </th>
                                          <th>
                                              <div class="form-group form-float">
                                                <div class="form-line ">
                                                      <input type="text" name="table_search" class="form-control float-right" placeholder="Search">
                                                </div>
                                            </div>
                                          </th>
                                          <th>
                                              <div class="form-group form-float">
                                                <div class="input-group-append">
                                                      <button type="submit" name="search" class="btn bg-indigo"><i class="material-icons col-indigo">search</i></button>
                                                </div>
                                            </div>
                                          </th>
                                          <th>
                                              <a href="../home"><button type="button" class="btn bg-indigo">Refresh</button></a>
                                          </th>
                                        </form>
                                    </tr>
                                    </table>
                                </div>
                            </div>
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
                            
                            <div class="table table-sm table-responsive">
                                <table class="table table-sm table-striped table-hover dataTable js-exportable font-14">
                                    <thead>
                                        <tr>
                                        <?php 
                                        $kolom = array(
                                            "NO","NISN", "NIS", "NAMA SISWA", "KELAS", "JK","TEMPAT LAHIR","TANGGAL LAHIR","AGAMA","PEND. SEBELUMNYA","ALAMAT SISWA", "ACTION"
                                        );
                                        foreach ($kolom as $key) { 
                                            echo "<th class='text-center bg-light-blue font-12' scope='col'>".$key."</th>";
                                         } ?>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                        <?php 
                                        foreach ($kolom as $key) { 
                                            echo "<th class='text-center font-12'>".$key."</th>";
                                         }
                                        ?>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                        <?php

                                        $no=1;
                                        if (isset($_POST['search'])) {
                                            $cari = $_POST['table_search'];
                                            $siswa_sql = mysqli_query($koneksi, "SELECT * FROM siswa_kelas X INNER JOIN agama Y ON Y.id_agama = X.id_agama WHERE nama_siswa LIKE '%".$cari."%' OR nisn LIKE '%".$cari."%' OR nis LIKE '%".$cari."%' OR kelas LIKE '%".$cari."%'");
                                        }else{
                                            $siswa_sql = mysqli_query($koneksi, "SELECT * FROM siswa_kelas X INNER JOIN agama Y ON Y.id_agama = X.id_agama LIMIT $awalData, $jumlahDataPerhalaman");
                                        }
                                        while ($siswa_data = mysqli_fetch_array($siswa_sql)) { ?>
                                            <tr class="m-b-0"><a href="#">
                                                <td><?= $no++; ?></td>
                                                <td><?= $siswa_data['nisn']; ?></td>
                                                <td><?= $siswa_data['nis']; ?></td>
                                                <td><?= $siswa_data['nama_siswa']; ?></td>
                                                <td><?= $siswa_data['kelas']; ?></td>
                                                <td><?= $siswa_data['jk']; ?></td>
                                                <td><?= $siswa_data['tempat_lahir']; ?></td>
                                                <td><?= $siswa_data['tanggal_lahir']; ?></td>
                                                <td><?= $siswa_data['agama']; ?></td>
                                                <td><?= $siswa_data['pend_sebelumnya']; ?></td>
                                                <td><?= $siswa_data['alamat_serta_didik']; ?></td>
                                                <td>
                                                    
                                                        <div class="dropdown">
                                                            <button type="submit" href="" class="btn bg-indigo" data-toggle="dropdown">
                                                                Action
                                                            </button>
                                                            <ul class="dropdown-menu pull-right">
                                                                <li><a href="?page=detail_siswa&id=<?= $siswa_data['nama_siswa']; ?>">Detail</a></li>
                                                                <li><a href="javascript:void(0);">Delete</a></li>
                                                            </ul>
                                                        </div>
                                                    
                                                </td>
                                            </a>
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
            <!-- #END# Exportable Table -->



