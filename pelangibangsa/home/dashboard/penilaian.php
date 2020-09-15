<?php 
$page = $_GET['page'];
$sqlid = mysqli_query($koneksi, "SELECT * FROM data_siswa WHERE nama_siswa ='".$_GET['id']."'");
$siswa = mysqli_fetch_array($sqlid);

$sq1 = mysqli_query($koneksi, "SELECT * FROM kelas WHERE kelas = '".$_SESSION['kelas']."'");
$dtsq1 = mysqli_fetch_array($sq1);

$sq2 = mysqli_query($koneksi, "SELECT * FROM semester WHERE semester = '".$_SESSION['semester']."'");
$dtsq2 = mysqli_fetch_array($sq2);

/*SELECT * FROM nilai_akhir_raport_ki3 WHERE id_siswa = '".$siswa['id_siswa']."' GROUP BY id_mapel ASC*/
?>
<!-- Basic Examples -->
                

                        <div class="body">
                            <div class="row">
                                    <div class="header bg-indigo">
                                        <div class="">
                                            <h4>
                                                PENGETAHUAN
                                                <small>Nilai Pengetahuan</small>
                                            </h4>
                                        </div>
                                        <ul class="header-dropdown m-r-5">
                                            <li class="dropdown">
                                                <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><button class="btn bg-light-blue"><i class="material-icons">library_add</i> Input nilai</button>
                                                </a>
                                                <ul class="dropdown-menu pull-right">
                                                    <?php 
                                                    $sis = mysqli_query($koneksi, "SELECT * FROM show_mapel_perkelas WHERE id_kelas = '".$dtsq1['id_kelas']."' AND id_semester = '".$dtsq2['id_semester']."' GROUP BY id_mapel ASC");
                                                    while ($dasis = mysqli_fetch_array($sis)) { 
                                                        $mplagm = mysqli_query($koneksi, "SELECT id_mapel, nama_mapel FROM mapel WHERE id_mapel = 'MPL01'");
                                                        $datmpl = mysqli_fetch_array($mplagm);
                                                        include "cek/cek_ok_ki3.php";
                                                        if ($datmpl['nama_mapel'] === $dasis['nama_mapel']) {
                                                            ?>
                                                        <li>
                                                            <!-- ?page=nilai_akhir_kdagamaki3&id=<?= $datmpl['id_mapel']; ?>&sis=<?= $siswa['id_siswa']; ?>&agm=<?= $siswa['id_agama'] ?> -->
                                                            <a href="?page=input_nilai_agamaki3&id=<?= $datmpl['id_mapel']; ?>&sis=<?= $siswa['id_siswa']; ?>&agm=<?= $siswa['id_agama'] ?>"><?= $dasis['nama_mapel']; ?><?= $cek; ?></a>
                                                        </li>
                                                    <?php }else{ ?>
                                                        <li>
                                                            <!-- ?page=nilai_akhir_raportki3&id=<?= $dasis['id_mapel']; ?>&sis=<?= $siswa['id_siswa']; ?> -->
                                                            <a href="?page=input_nilaiki3&id=<?= $dasis['id_mapel']; ?>&sis=<?= $siswa['id_siswa']; ?>"><?= $dasis['nama_mapel']; ?><?= $cek; ?></a>
                                                        </li>
                                                    <?php }
                                                }
                                                    ?>
                                                </ul>
                                            </li>
                                        </ul>
                                        <!-- <div class="col-lg-2 col-md-2 col-sm-2 col-xs-4">
                                        <button type="submit" href="" class="btn bg-blue-grey btn-md" data-toggle="dropdown">Input Nila
                                            <span class="caret"></span>
                                        </button>
                                            <ul class="dropdown-menu">
                                                <li><a href="" data-toggle="modal" data-target="#defaultPengetahuan">Pengetahuan</a></li>
                                                <li><a href="" data-toggle="modal" data-target="#defaultKeterampilan">Keterampilan</a></li>
                                            </ul>
                                        </div> -->
                                    </div>
                                    <div class="">
                                        <div class="table-responsive">
                                        <table id="mainTable" class="table table-bordered table-hover font-11">
                                            <thead>
                                                <tr>
                                                <?php
                                                $data = array('No','Nama_mapel', 'Nilai','Predikat','Deskripsi', 'Action' );
                                                foreach ($data as $key) {
                                                    echo "<th class='bg-light-blue'>".$key."</th>";
                                                
                                                 } ?>
                                                </tr>
                                            </thead>
                                                <?php 
                                                $no=1;
                                                $sql = mysqli_query($koneksi, "SELECT * FROM nilai_raport_ki3 WHERE id_siswa = '".$siswa['id_siswa']."' AND id_kelas = '".$dtsq1['id_kelas']."' AND id_semester = '".$dtsq2['id_semester']."' ORDER BY id_mapel ASC");
                                                while ($data = mysqli_fetch_array($sql)) { ?>
                                                <tbody>
                                                    <tr>
                                                        <td><?= $no++; ?></td>
                                                        <td><?= $data['nama_mapel']; ?></td>
                                                        <td><?= $data['nilai']; ?></td>
                                                        <td><?= $data['predikat']; ?></td>
                                                        <td><?= $data['deskripsi']; ?></td>
                                                        <td>
                                                            <div class="dropdown">
                                                            <button class="btn bg-indigo" data-toggle="dropdown">Action
                                                                <span class="caret"></span>
                                                            </button>
                                                            <ul class="dropdown-menu pull-right">
                                                                <li><a href="delete/delete_nilai_raport_ki3.php?idnilai=<?= $data['id_nilairaport']; ?>" onclick="return confirm('Apakah anda yakin ingin menghapus nilai ini?')">Delete</a></li>
                                                            </ul>
                                                            </div> 
                                                        </td>
                                                    </tr>
                                                </tbody>
                                                <?php }
                                                ?>
                                            <!-- <tfoot>
                                                <tr class="bg-teal">
                                                    <th><strong></strong></th>
                                                    <th>-</th>
                                                    <th>-</th>
                                                    <th>-</th>
                                                    <th>-</th>
                                                </tr>
                                            </tfoot> -->
                                        </table>
                                    </div>
                                    </div>
                                
                            </div>

                            <div class="row">
                            
                                    <div class="header bg-indigo">
                                        <div class="">
                                        <h4>
                                            KETERAMPILAN
                                            <small>Nilai Keterampilan</small>
                                        </h4>
                                        </div>
                                        <ul class="header-dropdown m-r-5">
                                            <li class="dropdown">
                                                <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><button class="btn bg-light-blue"><i class="material-icons">library_add</i> Input nilai</button>
                                                </a>
                                                <ul class="dropdown-menu pull-right">
                                                    <?php 
                                                    $sisw = mysqli_query($koneksi, "SELECT * FROM show_mapel_perkelas WHERE id_kelas = '".$dtsq1['id_kelas']."' AND id_semester = '".$dtsq2['id_semester']."' GROUP BY id_mapel ASC");
                                                    while ($data1 = mysqli_fetch_array($sisw)) { 
                                                        $mplagm = mysqli_query($koneksi, "SELECT id_mapel, nama_mapel FROM mapel WHERE id_mapel = 'MPL01'");
                                                        $datmpl = mysqli_fetch_array($mplagm);
                                                        include "cek/cek_ok_ki4.php";
                                                        if ($datmpl['nama_mapel'] === $data1['nama_mapel']) { ?>
                                                        <li>
                                                            <!-- ?page=nilai_akhir_kdagamaki4&id=<?= $datmpl['id_mapel']; ?>&sis=<?= $siswa['id_siswa']; ?>&agm=<?= $siswa['id_agama']; ?> -->
                                                            <a href="?page=input_nilai_agamaki4&id=<?= $datmpl['id_mapel']; ?>&sis=<?= $siswa['id_siswa']; ?>&agm=<?= $siswa['id_agama']; ?>"><?= $data1['nama_mapel']; ?><?= $cek1; ?></a>
                                                        </li>
                                                    <?php }else{ ?>
                                                        <li>
                                                            <!-- ?page=nilai_akhir_raportki4&id=<?= $data1['id_mapel']; ?>&sis=<?= $data1['id_siswa']; ?> -->
                                                            <a href="?page=input_nilaiki4&id=<?= $data1['id_mapel']; ?>&sis=<?= $siswa['id_siswa']; ?>"><?= $data1['nama_mapel']; ?><?= $cek1; ?></a>
                                                        </li>
                                                    <?php }
                                                }
                                                    ?>
                                                </ul>
                                            </li>
                                        </ul>
                                        <!-- <div class="col-lg-2 col-md-2 col-sm-2 col-xs-4">
                                        <button type="submit" href="" class="btn bg-blue-grey btn-md" data-toggle="dropdown">Input Nilai
                                        <span class="caret"></span></button>
                                            <ul class="dropdown-menu">
                                                <li><a href="" data-toggle="modal" data-target="#defaultPengetahuan">Pengetahuan</a></li>
                                                <li><a href="" data-toggle="modal" data-target="#defaultKeterampilan">Keterampilan</a></li>
                                            </ul>
                                        </div> -->
                                    </div>
                                    <div class="">
                                        <div class="table-responsive">
                                        <table id="mainTable" class="table table-bordered table-hover font-11">
                                            <thead>
                                                <tr>
                                                <?php
                                                $data = array('No', 'Nama Mapel', 'Nilai','Predikat','Deskripsi','Action');
                                                foreach ($data as $key) {
                                                    echo "<th class='bg-light-blue'>".$key."</th>";
                                                
                                                 } ?>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <?php 
                                                $no=1;
                                                $sql1 = mysqli_query($koneksi, "SELECT * FROM nilai_raport_ki4 WHERE id_siswa = '".$siswa['id_siswa']."' AND id_kelas = '".$dtsq1['id_kelas']."' AND id_semester = '".$dtsq2['id_semester']."' ORDER BY id_mapel ASC");
                                                while ($data1 = mysqli_fetch_array($sql1)) { ?>
                                                    <tr>
                                                        <td><?= $no++; ?></td>
                                                        <td><?= $data1['nama_mapel']; ?></td>
                                                        <td><?= $data1['nilai']; ?></td>
                                                        <td><?= $data1['predikat']; ?></td>
                                                        <td><?= $data1['deskripsi']; ?></td>
                                                        <td>
                                                            <div class="dropdown">
                                                            <button class="btn bg-indigo" data-toggle="dropdown">Action
                                                                <span class="caret"></span>
                                                            </button>
                                                            <ul class="dropdown-menu pull-right">
                                                                <li><a href="delete/delete_nilai_raport_ki4.php?idnilai=<?= $data1['id_nilairaport']; ?>" onclick="return confirm('Apakah anda yakin ingin menghapus nilai ini?')">Delete</a></li>
                                                            </ul>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                <?php }
                                                ?>
                                            </tbody>
                                            <!-- <tfoot>
                                                <tr class="bg-teal">
                                                    <th><strong></strong></th>
                                                    <th>-</th>
                                                    <th>-</th>
                                                    <th>-</th>
                                                    <th>-</th>
                                                </tr>
                                            </tfoot> -->
                                        </table>
                                        </div>
                                    </div>
                                
                            </div>
                            <div class="row">
                            
                                    <div class="header clearfix bg-indigo">
                                        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-6">
                                        <h4>
                                            SPIRITUAL
                                            <small>Nilai Spiritual</small>
                                        </h4>
                                        </div>
                                        <ul class="header-dropdown m-r-50">
                                            <li class="dropdown">
                                                <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><button class="btn btn-primary"><i class="material-icons">library_add</i> Input sikap</button>
                                                </a>
                                                <ul class="dropdown-menu pull-right">
                                                    <li><a href="" data-toggle="modal" data-target="#defaultSpiritual">Spiritual</a></li>
                                                    <li><a href="" data-toggle="modal" data-target="#defaultSosial">Sosial</a></li>
                                                </ul>
                                            </li>
                                        </ul>
                                        <!-- <div class="col-lg-2 col-md-2 col-sm-2 col-xs-4">
                                        <button type="submit" href="" class="btn bg-red btn-md" data-toggle="dropdown">Input Sikap
                                        <span class="caret"></span></button>
                                            <ul class="dropdown-menu">
                                                <li><a href="" data-toggle="modal" data-target="#defaultSpiritual">Spiritual</a></li>
                                                <li><a href="" data-toggle="modal" data-target="#defaultSosial">Sosial</a></li>
                                            </ul>
                                        </div> -->
                                    </div>
                                    <div class="">
                                        <div class="table-responsive">
                                        <table id="mainTable" class="table table-bordered table-hover font-11">
                                            <thead>
                                                <tr>
                                                <?php
                                                $data = array('ID Siswa', 'Nilai', 'Predikat', 'Deskripsi', 'Action');
                                                foreach ($data as $key) {
                                                    echo "<th class='bg-light-blue'>".$key."</th>";
                                                
                                                 } ?>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <?php 
                                                $sql_sp = mysqli_query($koneksi, "SELECT * FROM nilai_raport_spiritual WHERE id_siswa = '".$siswa['id_siswa']."' AND id_kelas = '".$dtsq1['id_kelas']."' AND id_semester = '".$dtsq2['id_semester']."'");
                                                while ($datasp = mysqli_fetch_array($sql_sp)) { ?>
                                                    <tr>
                                                        <td><?= $datasp['id_siswa']; ?></td>
                                                        <td><?= $datasp['nilai']; ?></td>
                                                        <td><?= $datasp['predikat']; ?></td>
                                                        <td><?= $datasp['deskripsi']; ?></td>
                                                        <td>
                                                            <div class="dropdown">
                                                            <button class="btn bg-indigo" data-toggle="dropdown">Action
                                                                <span class="caret"></span>
                                                            </button>
                                                            <ul class="dropdown-menu pull-right">
                                                                <li><a href="delete/delete_nilai_raport_spiritual.php?idspiritual=<?= $datasp['id_nilairaport_sp']; ?>" onclick="return confirm('Apakah anda yakin ingin menghapus jurnal ini?')">Delete</a></li>
                                                            </ul>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                <?php }
                                                ?>
                                            </tbody>
                                            <!-- <tfoot>
                                                <tr class="bg-teal">
                                                    <th><strong>TOTAL</strong></th>
                                                    <th>-</th>
                                                    <th>-</th>
                                                    <th>-</th>
                                                </tr>
                                            </tfoot> -->
                                        </table>
                                        </div>
                                    </div>
                                
                            </div>
                            <div class="row">
                            
                                    <div class="header clearfix bg-indigo">
                                        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-6">
                                        <h4>
                                            SOSIAL
                                            <small>Nilai Sosial</small>
                                        </h4>
                                        </div>
                                        <ul class="header-dropdown m-r-50">
                                            <li class="dropdown">
                                                <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><button class="btn btn-primary"><i class="material-icons">library_add</i> Input sikap</button>
                                                </a>
                                                <ul class="dropdown-menu pull-right">
                                                    <li><a href="" data-toggle="modal" data-target="#defaultSpiritual">Spiritual</a></li>
                                                    <li><a href="" data-toggle="modal" data-target="#defaultSosial">Sosial</a></li>
                                                </ul>
                                            </li>
                                        </ul>
                                        <!-- <div class="col-lg-2 col-md-2 col-sm-2 col-xs-4">
                                        <button type="submit" href="" class="btn bg-red btn-md" data-toggle="dropdown">Input Sikap
                                        <span class="caret"></span></button>
                                            <ul class="dropdown-menu">
                                                <li><a href="" data-toggle="modal" data-target="#defaultSpiritual">Spiritual</a></li>
                                                <li><a href="" data-toggle="modal" data-target="#defaultSosial">Sosial</a></li>
                                            </ul>
                                        </div> -->
                                    </div>
                                    <div class="">
                                        <div class="table-responsive">
                                        <table id="mainTable" class="table table-bordered table-hover font-11">
                                            <thead>
                                                <tr>
                                                <?php
                                                $data = array('ID Siswa', 'Nilai', 'Predikat', 'Deskripsi','Action');
                                                foreach ($data as $key) {
                                                    echo "<th class='bg-light-blue'>".$key."</th>";
                                                
                                                 } ?>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <?php 
                                                $sqlso = mysqli_query($koneksi, "SELECT * FROM nilai_raport_sosial WHERE id_siswa = '".$siswa['id_siswa']."' AND id_kelas = '".$dtsq1['id_kelas']."' AND id_semester = '".$dtsq2['id_semester']."' ");
                                                while ($dataso = mysqli_fetch_array($sqlso)) { ?>
                                                    <tr>
                                                        <td><?= $dataso['id_siswa']; ?></td>
                                                        <td><?= $dataso['nilai']; ?></td>
                                                        <td><?= $dataso['predikat']; ?></td>
                                                        <td><?= $dataso['deskripsi']; ?></td>
                                                        <td>
                                                            <div class="dropdown">
                                                            <button class="btn bg-indigo" data-toggle="dropdown">Action
                                                                <span class="caret"></span>
                                                            </button>
                                                            <ul class="dropdown-menu pull-right">
                                                                <li><a href="delete/delete_nilai_raport_sosial.php?idsosial=<?= $dataso['id_nilairaport_so']; ?>" onclick="return confirm('Apakah anda yakin ingin menghapus jurnal ini?')">Delete</a></li>
                                                            </ul>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                <?php }
                                                ?>
                                            </tbody>
                                            <!-- <tfoot>
                                                <tr class="bg-teal">
                                                    <th><strong>TOTAL</strong></th>
                                                    <th>-</th>
                                                    <th>-</th>
                                                    <th>-</th>
                                                </tr>
                                            </tfoot> -->
                                        </table>
                                        </div>
                                    </div>
                                
                            </div>
                        </div>

                
<!-- #END# Basic Examples -->

<!-- Input nilai pengetahuan -->
            <div class="modal fade" id="defaultPengetahuan" tabindex="-1" role="dialog">
                <div class="modal-dialog modal-lg" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title" id="defaultModalLabel">INPUT NILAI <?= $_GET['id']; ?></h4>
                        </div>
                        <div class="modal-body">
                            <div class="body">
                            <div class="row clearfix">
                                <div class="col-xs-12 ol-sm-12 col-md-12 col-lg-12">
                                    
                            
                                        <form id="form_validation" method="POST" action="proses/proses_nilai_ki3.php">
                                            <div class="form-group form-float">
                                                <div class="form-line">
                                                    <input type="text" class="form-control" name="id_nilairaport" value="<?= $dataki3; ?>" readonly required>
                                                    <label class="form-label"></label>
                                                </div>
                                            </div>
                                            <div class="form-group form-float">
                                                
                                                <div class="row clearfix">
                                                    <div class="col-md-8">
                                                        <p>
                                                            <b>Nama Siswa</b>
                                                        </p>
                                                        <select class="form-control show-tick" name="id_siswa">
                                                            <?php
                                                            $sql1 = mysqli_query($koneksi, "SELECT * FROM data_siswa WHERE nama_siswa ='".$_GET['id']."'");
                                                            while ($data1 = mysqli_fetch_array($sql1)) { ?>
                                                                   <option value="<?= $data1['id_siswa']; ?>" selected><?= $data1['nama_siswa']; ?></option>
                                                                <?php }
                                                            ?>
                                                        </select>

                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group form-float">
                                                
                                                <div class="row clearfix">
                                                    <div class="col-md-8">
                                                        <p>
                                                            <b>Pilih Mata Pelajaran</b>
                                                        </p>
                                                        <select class="form-control show-tick" name="id_mapel">
                                                            <?php 
                                                            $sql2 = mysqli_query($koneksi, "SELECT * FROM mapel");
                                                            while ($data2 = mysqli_fetch_array($sql2)) { ?>
                                                                <option value="<?= $data2['id_mapel']; ?>"><?= $data2['nama_mapel']; ?></option>
                                                            <?php }
                                                            ?>
                                                        </select>

                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group form-float">
                                                <div class="form-line">
                                                    <input type="text" class="form-control" name="nilai" required>
                                                    <label class="form-label">Nilai</label>
                                                </div>
                                            </div>
                                            <div class="form-group form-float">
                                                <div class="form-line">
                                                    <input type="text" class="form-control" name="predikat" required>
                                                    <label class="form-label">Predikat</label>
                                                </div>
                                            </div>
                                            <div class="form-group form-float">
                                                <div class="form-line">
                                                    <textarea name="description" cols="30" rows="5" class="form-control no-resize" required></textarea>
                                                    <label class="form-label">Description</label>
                                                </div>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="submit"name="submit" class="btn btn-link btn-primary waves-effect">SIMPAN</button>
                                                <button type="button" class="btn btn-link waves-effect" data-dismiss="modal">CLOSE</button>
                                            </div>
                                        </form>
                            
                                   
                                </div>
                            
                            </div>
                        </div>
                        </div>
                        <!-- <div class="modal-footer">
                            <button type="button" class="btn btn-link btn-primary waves-effect">SAVE CHANGES</button>
                            <button type="button" class="btn btn-link waves-effect" data-dismiss="modal">CLOSE</button>
                        </div> -->
                    </div>
                </div>
            </div>
            
<!-- Input nilai keterampilan -->
            <div class="modal fade" id="defaultKeterampilan" tabindex="-1" role="dialog">
                <div class="modal-dialog modal-lg" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title" id="defaultModalLabel">INPUT NILAI <?= $_GET['id']; ?></h4>
                        </div>
                        <div class="modal-body">
                            <div class="body">
                            <div class="row clearfix">
                                <div class="col-xs-12 ol-sm-12 col-md-12 col-lg-12">
                                    
                            
                                        <form id="form_validation" method="POST" action="proses/proses_nilai_ki4.php">
                                            <div class="form-group form-float">
                                                <div class="form-line">
                                                    <input type="text" class="form-control" name="id_nilairaport" value="<?= $dataki4; ?>" readonly required>
                                                    <label class="form-label"></label>
                                                </div>
                                            </div>
                                            <div class="form-group form-float">
                                                
                                                <div class="row clearfix">
                                                    <div class="col-md-8">
                                                        <p>
                                                            <b>Nama Siswa</b>
                                                        </p>
                                                        <select class="form-control show-tick" name="id_siswa">
                                                            <?php
                                                            $sql3 = mysqli_query($koneksi, "SELECT * FROM data_siswa WHERE nama_siswa ='".$_GET['id']."'");
                                                            while ($data3 = mysqli_fetch_array($sql3)) { ?>
                                                                   <option value="<?= $data3['id_siswa']; ?>" selected><?= $data3['nama_siswa']; ?></option>
                                                                <?php }
                                                            ?>
                                                        </select>

                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group form-float">
                                                
                                                <div class="row clearfix">
                                                    <div class="col-md-8">
                                                        <p>
                                                            <b>Pilih Mata Pelajaran</b>
                                                        </p>
                                                        <select class="form-control show-tick" name="id_mapel">
                                                            <?php 
                                                            $sql4 = mysqli_query($koneksi, "SELECT * FROM mapel");
                                                            while ($data4 = mysqli_fetch_array($sql4)) { ?>
                                                                <option value="<?= $data4['id_mapel']; ?>"><?= $data4['nama_mapel']; ?></option>
                                                            <?php }
                                                            ?>
                                                        </select>

                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group form-float">
                                                <div class="form-line">
                                                    <input type="text" class="form-control" name="nilai" required>
                                                    <label class="form-label">Nilai</label>
                                                </div>
                                            </div>
                                            <div class="form-group form-float">
                                                <div class="form-line">
                                                    <input type="text" class="form-control" name="predikat" required>
                                                    <label class="form-label">Predikat</label>
                                                </div>
                                            </div>
                                            <div class="form-group form-float">
                                                <div class="form-line">
                                                    <textarea name="description" cols="30" rows="5" class="form-control no-resize" required></textarea>
                                                    <label class="form-label">Description</label>
                                                </div>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="submit"name="submit" class="btn btn-link btn-primary waves-effect">SIMPAN</button>
                                                <button type="button" class="btn btn-link waves-effect" data-dismiss="modal">CLOSE</button>
                                            </div>
                                        </form>
                            
                                   
                                </div>
                            
                            </div>
                        </div>
                        </div>
                        <!-- <div class="modal-footer">
                            <button type="button" class="btn btn-link btn-primary waves-effect">SAVE CHANGES</button>
                            <button type="button" class="btn btn-link waves-effect" data-dismiss="modal">CLOSE</button>
                        </div> -->
                    </div>
                </div>
            </div>

<!-- Input nilai spiritual -->
            <div class="modal fade" id="defaultSpiritual" tabindex="-1" role="dialog">
                <div class="modal-dialog modal-lg" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title" id="defaultModalLabel">INPUT SIKAP SPIRITUAL <?= $_GET['id']; ?></h4>
                        </div>
                        <div class="modal-body">
                            <div class="body">
                            <div class="row clearfix">
                                <div class="col-xs-12 ol-sm-12 col-md-12 col-lg-12">
                                    
                            
                                        <form method="POST" action="proses/proses_nilairaport_sp.php">
                                        <div class="row" hidden>
                                            <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12">
                                            <div class="form-group form-float">
                                                <div class="form-line">
                                                    <input type="text" class="form-control" name="id_siswa" value="<?= $siswa['id_siswa']; ?>" readonly required>
                                                    <label class="form-label"></label>
                                                </div>
                                            </div>
                                            <div class="form-group form-float" hidden>
                                                <div class="form-line">
                                                    <input type="text" class="form-control" name="tahun_awal" value="<?= $siswa['tahun_ajaran_awal']; ?>" readonly required>
                                                    <label class="form-label"></label>
                                                </div>
                                            </div>
                                            <div class="form-group form-float" hidden>
                                                <div class="form-line">
                                                    <input type="text" class="form-control" name="tahun_akhir" value="<?= $siswa['tahun_ajaran_akhir']; ?>" readonly required>
                                                    <label class="form-label"></label>
                                                </div>
                                            </div>
                                            </div>
                                            <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12">
                                            <div class="form-group form-float">
                                                <div class="form-line">
                                                    <input type="text" class="form-control" name="id_nilairaport_sp" value="<?= $dataspk; ?>" readonly required>
                                                    <label class="form-label"></label>
                                                </div>
                                            </div>
                                            </div>
                                            <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12">
                                            <div class="form-group form-float">
                                                <div class="form-line">
                                                    <input type="text" class="form-control" name="id_kelas" value="<?= $dtsq1['id_kelas']; ?>" readonly required>
                                                    <label class="form-label"></label>
                                                </div>
                                            </div>
                                            </div>
                                            <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12">
                                            <div class="form-group form-float">
                                                <div class="form-line">
                                                    <input type="text" class="form-control" name="id_semester" value="<?= $dtsq2['id_semester']; ?>" readonly required>
                                                    <label class="form-label"></label>
                                                </div>
                                            </div>
                                            </div>
                                        </div>
                                            <div class="form-group form-float">
                                                <div class="form-line">
                                                    <input type="text" class="form-control" name="nama_siswa" value="<?= $siswa['nama_siswa']; ?>" readonly required>
                                                    <label class="form-label"></label>
                                                </div>
                                            </div>
                                            <div class="">
                                                <table class="table table-bordered">
                                                    <thead>
                                                        <tr class="bg-light-blue">
                                                            <th><b>Butir Sikap</b></th>
                                                            <th><b>Nilai</b></th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>   
                                                    <?php 
                                                    $sql = mysqli_query($koneksi, "SELECT id_spiritual, butir_sikap FROM sikap_spiritual");
                                                    while ($dat = mysqli_fetch_array($sql)) { ?>
                                                    <tr>
                                                        <td><input type="text" name="deskrip[]" value="<?= $dat['butir_sikap']; ?>" hidden>
                                                            <b><?= $dat['butir_sikap']; ?></b>
                                                        </td>
                                                        <td>
                                                            <select name="predikat[]">
                                                                <option value="A">A / 4</option>
                                                                <option value="B">B / 3</option>
                                                                <option value="C">C / 2</option>
                                                            </select>
                                                        </td>
                                                        <!-- <td>
                                                            <div class="form-group form-float">
                                                            <div class="">
                                                                <input type="checkbox" id="<?= $dat['butir_sikap']; ?>" name="SB[]" class="filled-in chk-col-blue" value="<?= $dat['butir_sikap']; ?>" />
                                                                <label for="<?= $dat['butir_sikap']; ?>"></label>
                                                            </div>
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="form-group form-float">
                                                            <div class="">
                                                                <input type="checkbox" id="<?= $dat['id_spiritual']; ?>" name="PB[]" class="filled-in chk-col-blue" value="<?= $dat['butir_sikap']; ?>" />
                                                                <label for="<?= $dat['id_spiritual']; ?>"></label>
                                                            </div>
                                                            </div>
                                                        </td> -->
                                                    </tr>
                                                <?php }  ?>
                                                    </tbody>
                                                </table>
                                            </div>
                                            <?php 
                                            date_default_timezone_set('Asia/Jakarta'); 
                                            $date_raport = date("Y-m-d h:i:s");
                                            ?>
                                            <div class="form-group form-float">
                                                <div class="form-line">
                                                    <label class="form-label">Tanggal Raport</label>
                                                    <input type="text" class="form-control" name="tgl_raport" value="<?= $date_raport; ?>" required readonly>
                                                </div>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="submit"name="submit" class="btn bg-indigo waves-effect">SIMPAN</button>
                                                <button type="button" class="btn bg-indigo waves-effect" data-dismiss="modal">CLOSE</button>
                                            </div>
                                        </form>
                            
                                </div>
                            
                            </div>
                        </div>
                        </div>
                        <!-- <div class="modal-footer">
                            <button type="button" class="btn btn-link btn-primary waves-effect">SAVE CHANGES</button>
                            <button type="button" class="btn btn-link waves-effect" data-dismiss="modal">CLOSE</button>
                        </div> -->
                    </div>
                </div>
            </div>

<!-- Input nilai sosial -->
            <div class="modal fade" id="defaultSosial" tabindex="-1" role="dialog">
                <div class="modal-dialog modal-lg" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title" id="defaultModalLabel">INPUT SIKAP SOSIAL <?= $_GET['id']; ?></h4>
                        </div>
                        <div class="modal-body">
                            <div class="body">
                            <div class="row clearfix">
                                <div class="col-xs-12 ol-sm-12 col-md-12 col-lg-12">
                                    
                            
                                        <form method="POST" action="proses/proses_nilairaport_so.php">
                                        <div class="row">
                                            <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12">
                                            <div class="form-group form-float">
                                                <div class="form-line">
                                                    <input type="text" class="form-control" name="id_siswa" value="<?= $siswa['id_siswa']; ?>" readonly required>
                                                    <label class="form-label"></label>
                                                </div>
                                            </div>
                                            <div class="form-group form-float" hidden>
                                                <div class="form-line">
                                                    <input type="text" class="form-control" name="tahun_awal" value="<?= $siswa['tahun_ajaran_awal']; ?>" readonly required>
                                                    <label class="form-label"></label>
                                                </div>
                                            </div>
                                            <div class="form-group form-float" hidden>
                                                <div class="form-line">
                                                    <input type="text" class="form-control" name="tahun_akhir" value="<?= $siswa['tahun_ajaran_akhir']; ?>" readonly required>
                                                    <label class="form-label"></label>
                                                </div>
                                            </div>
                                            </div>
                                            <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12">
                                            <div class="form-group form-float">
                                                <div class="form-line">
                                                    <input type="text" class="form-control" name="id_nilairaport_so" value="<?= $datasos; ?>" readonly required>
                                                    <label class="form-label"></label>
                                                </div>
                                            </div>
                                            </div>
                                            <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12">
                                            <div class="form-group form-float">
                                                <div class="form-line">
                                                    <input type="text" class="form-control" name="id_kelas" value="<?= $dtsq1['id_kelas']; ?>" readonly required>
                                                    <label class="form-label"></label>
                                                </div>
                                            </div>
                                            </div>
                                            <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12">
                                            <div class="form-group form-float">
                                                <div class="form-line">
                                                    <input type="text" class="form-control" name="id_semester" value="<?= $dtsq2['id_semester']; ?>" readonly required>
                                                    <label class="form-label"></label>
                                                </div>
                                            </div>
                                            </div>
                                        </div>
                                        <div class="form-group form-float">
                                                <div class="form-line">
                                                    <input type="text" class="form-control" name="nama_siswa" value="<?= $siswa['nama_siswa']; ?>" readonly required>
                                                    <label class="form-label"></label>
                                                </div>
                                            </div>
                                            <div class="">
                                                <table class="table table-bordered">
                                                    <thead>
                                                        <tr class="bg-light-blue">
                                                            <th><b>Butir Sikap</b></th>
                                                            <th><b>Nilai</b></th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>   
                                                    <?php 
                                                    $sql = mysqli_query($koneksi, "SELECT id_sosial, butir_sikap FROM sikap_sosial");
                                                    while ($dat = mysqli_fetch_array($sql)) { ?>
                                                    <tr>
                                                        <td><input type="text" name="deskrip[]" value="<?= $dat['butir_sikap']; ?>" hidden>
                                                            <b><?= $dat['butir_sikap']; ?></b>
                                                        </td>
                                                        <td>
                                                            <select name="predikat[]">
                                                                <option value="A">A / 4</option>
                                                                <option value="B">B / 3</option>
                                                                <option value="C">C / 2</option>
                                                            </select>
                                                        </td>
                                                    </tr>
                                                <?php }  ?>
                                                    </tbody>
                                                </table>
                                            </div>
                                            <?php 
                                            date_default_timezone_set('Asia/Jakarta'); 
                                            $date_raport1 = date("Y-m-d h:i:s");
                                            ?>
                                            <div class="form-group form-float">
                                                <div class="form-line">
                                                    <label class="form-label">Tanggal Raport</label>
                                                    <input type="text" class="form-control" name="tgl_raport1" value="<?= $date_raport1; ?>" required readonly>
                                                </div>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="submit"name="submit" class="btn bg-indigo waves-effect">SIMPAN</button>
                                                <button type="button" class="btn bg-indigo waves-effect" data-dismiss="modal">CLOSE</button>
                                            </div>
                                        </form>
                            
                                </div>
                            
                            </div>
                        </div>
                        </div>
                    </div>
                </div>
            </div>