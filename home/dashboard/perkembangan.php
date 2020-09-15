<?php 
$page = $_GET['page'];
$sqlid = mysqli_query($koneksi, "SELECT * FROM data_siswa WHERE nama_siswa ='".$_GET['id']."'");
$siswa = mysqli_fetch_array($sqlid);

$sq1 = mysqli_query($koneksi, "SELECT * FROM kelas WHERE kelas = '".$_SESSION['kelas']."'");
$dtsq1 = mysqli_fetch_array($sq1);

$sq2 = mysqli_query($koneksi, "SELECT * FROM semester WHERE semester = '".$_SESSION['semester']."'");
$dtsq2 = mysqli_fetch_array($sq2);



?>

<!-- Basic Examples -->
                
                    <div class="">
                        <div class="body">
                        <div class="row">
                            <div class="">
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                    <div class="header bg-indigo">
                                        <h2>
                                            EKSTRAKURIKULER 
                                            <small>Input Keterangan</small>
                                        </h2>
                                        <ul class="header-dropdown m-r-50">
                                            <li class="dropdown">
                                                <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><button class="btn bg-light-blue"><i class="material-icons">library_add</i> Input / Delete</button>
                                                </a>
                                                <ul class="dropdown-menu pull-right">
                                                    <li><a href="penilaian/ekskul/?id=<?= $siswa['nama_siswa']; ?>">Ekskul</a></li>
                                                    <!-- <li><a href="penilaian/ekskul/edit_nilai_ekskul.php?id=<?= $siswa['nama_siswa']; ?>">Edit Ekskul</a></li> -->
                                                    <li><a href="delete/delete_ekskul.php?id=<?= $siswa['id_siswa']; ?>&kls=<?= $dtsq1['id_kelas']; ?>&sm=<?= $dtsq2['id_semester']; ?>" onclick="return confirm('Apakah anda yakin ingin data ini?')">Delete Ekskul</a></li>
                                                </ul>
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="">
                                        <div class="table-responsive">
                                        <table id="mainTable" class="table table-bordered table-hover font-11">
                                            <thead>
                                                <tr>
                                                <?php
                                                $data = array('Kegiatan', 'Predikat','Keterangan','Action');
                                                foreach ($data as $key) {
                                                    echo "<th class='bg-light-blue'>".$key."</th>";
                                                
                                                 } ?>
                                                </tr>
                                            </thead>
                                            <tbody>
<!--Awal fetch_array-->
                    <?php 
                    $sql1 = mysqli_query($koneksi, "SELECT * FROM tb_ekskul_wajib WHERE id_siswa = '".$siswa['id_siswa']."' AND id_kelas = '".$dtsq1['id_kelas']."' AND id_semester = '".$dtsq2['id_semester']."'");
                    while ($data1 = mysqli_fetch_array($sql1)) {
                        if ($data1['id_ekstra'] == 0) { ?>
                    <tr>
                        <td><?= $data1['id_ekstra']; ?></td>
                        <td><?= $data1['predikat']; ?></td>
                        <td><?= $data1['kegiatan']; ?></td>
                        <td>
                            <div class="row">
                                <div class="col-sm-12">
                                    <textarea rows="3" class="form-control no-resize font-11" readonly><?= $data1['keterangan']; ?></textarea>
                                </div>
                            </div>
                        </td>
                    </tr>
                        <?php }else{
                            echo "";
                        }
                    }

                    $sql2 = mysqli_query($koneksi, "SELECT * FROM tb_ekskul_pil1 WHERE id_siswa = '".$siswa['id_siswa']."' AND id_kelas = '".$dtsq1['id_kelas']."' AND id_semester = '".$dtsq2['id_semester']."'");
                    while ($data2 = mysqli_fetch_array($sql2)) {
                        if ($data2['id_ekstra'] == 0) { ?>
                    <tr>
                        <td><?= $data2['id_ekstra']; ?></td>
                        <td><?= $data2['predikat']; ?></td>
                        <td><?= $data2['kegiatan']; ?></td>
                        <td>
                            <div class="row clearfix">
                                <div class="col-sm-12">
                                    <textarea rows="3" class="form-control no-resize font-11" readonly><?= $data2['keterangan']; ?></textarea>
                                </div>
                            </div>
                        </td>
                    </tr>
                        <?php }else{
                            echo "";
                        }
                    }

                    $sql3 = mysqli_query($koneksi, "SELECT * FROM tb_ekskul_pil2 WHERE id_siswa = '".$siswa['id_siswa']."' AND id_kelas = '".$dtsq1['id_kelas']."' AND id_semester = '".$dtsq2['id_semester']."'");
                    while ($data3 = mysqli_fetch_array($sql3)) {
                        if ($data3['id_ekstra'] == 0) { ?>
                    <tr>
                        <td><?= $data3['id_ekstra']; ?></td>
                        <td><?= $data3['predikat']; ?></td>
                        <td><?= $data3['kegiatan']; ?></td>
                        <td>
                            <div class="row clearfix">
                                <div class="col-sm-12">
                                    <textarea rows="3" class="form-control no-resize font-11" readonly><?= $data3['keterangan']; ?></textarea>
                                </div>
                            </div>
                        </td>
                    </tr> 
                        <?php }else{
                            echo "";
                        }
                    }

                    $sql4 = mysqli_query($koneksi, "SELECT * FROM tb_ekskul_pil3 WHERE id_siswa = '".$siswa['id_siswa']."' AND id_kelas = '".$dtsq1['id_kelas']."' AND id_semester = '".$dtsq2['id_semester']."'");
                    while ($data4 = mysqli_fetch_array($sql4)) {
                        if ($data4['id_ekstra'] == 0) { ?>
                            <tr>
                        <td><?= $data4['id_ekstra']; ?></td>
                        <td><?= $data4['predikat']; ?></td>
                        <td><?= $data4['kegiatan']; ?></td>
                        <td>
                            <div class="row clearfix">
                                <div class="col-sm-12">
                                    <textarea rows="3" class="form-control no-resize font-11" readonly><?= $data4['keterangan']; ?></textarea>
                                </div>
                            </div>
                        </td>
                    </tr>
                        <?php }else{
                            echo "";
                        }
                    }

                    ?>
                                                    
<!--Tutup fetch_array-->
                                            </tbody>

                                        </table>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="font-11">
                                <div class="col-lg-6 col-md-12 col-sm-12 col-xs-12">
                                    <div class="header bg-indigo">
                                        <h2>
                                            KONDISI KESEHATAN
                                            <small>Input Keterangan</small>
                                        </h2>
                                        <ul class="header-dropdown m-r-50">
                                            <li class="dropdown">
                                                <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><button class="btn bg-light-blue"><i class="material-icons">library_add</i> Input ket</button>
                                                </a>
                                                <ul class="dropdown-menu pull-right">
                                                    <li><a href="" data-toggle="modal" data-target="#defaultKesehatan">Kondisi</a></li>
                                                    <li><a href="?page=edit_kesehatan_1&id=<?= $siswa['nama_siswa']; ?>">Edit Kondisi</a></li>
                                                </ul>
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="">
                                        <div class="table-responsive">
                                        <table id="mainTable" class="table table-bordered">
                                            <thead>
                                                <tr>
                                                <?php
                                                $data = array('Kondisi', 'Keterangan');
                                                foreach ($data as $key) {
                                                    echo "<th class='bg-light-blue'>".$key."</th>";
                                                
                                                 } ?>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <?php 
                                                $sql2 = mysqli_query($koneksi, "SELECT * FROM per_kesehatan WHERE id_siswa = '".$siswa['id_siswa']."' AND id_kelas = '".$dtsq1['id_kelas']."' AND id_semester = '".$dtsq2['id_semester']."'");
                                                while ($kondisi = mysqli_fetch_array($sql2)) { ?>
                                                    <tr>
                                                        <td><?= $kondisi['aspek_fisik']; ?></td>
                                                        <td><?= $kondisi['keterangan']; ?></td>
                                                    </tr>
                                                <?php }
                                                ?>
                                            </tbody>
                                            
                                        </table>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="font-11">
                                <div class="col-lg-6 col-md-12 col-sm-12 col-xs-12">
                                    <div class="header bg-indigo">
                                        <h2>
                                            PRESTASI
                                            <small>Input Keterangan</small>
                                        </h2>
                                        <ul class="header-dropdown m-r-50">
                                            <li class="dropdown">
                                                <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><button class="btn bg-light-blue"><i class="material-icons">library_add</i> Input ket</button>
                                                </a>
                                                <ul class="dropdown-menu pull-right">
                                                    <li><a href="" data-toggle="modal" data-target="#defaultPrestasi">Prestasi</a></li>
                                                    <li><a href="?page=edit_prestasi_1&id=<?= $siswa['nama_siswa']; ?>">Edit Prestasi</a></li>
                                                </ul>

                                            </li>
                                        </ul>
                                    </div>
                                    <div class="">
                                        <div class="table-responsive">
                                        <table id="mainTable" class="table table-bordered">
                                            <thead>
                                                <tr>
                                                <?php
                                                $data = array('Prestasi', 'Keterangan');
                                                foreach ($data as $key) {
                                                    echo "<th class='bg-light-blue'>".$key."</th>";
                                                
                                                 } ?>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <?php 
                                                $sql3 = mysqli_query($koneksi, "SELECT * FROM per_prestasi WHERE id_siswa = '".$siswa['id_siswa']."' AND id_kelas = '".$dtsq1['id_kelas']."' AND id_semester = '".$dtsq2['id_semester']."'");
                                                while ($prestasi = mysqli_fetch_array($sql3)) { ?>
                                                    <tr>
                                                        <td><?= $prestasi['jenis_prestasi']; ?></td>
                                                        <td><?= $prestasi['keterangan']; ?></td>
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
                        <hr class="bg-blue">
                        <div class="row font-11">
                            <div class="col-lg-6 col-md-12 col-sm-12 col-xs-12">
                                <div class="header bg-indigo">
                                    <?php
                                    $sqltb = mysqli_query($koneksi, "SELECT * FROM tinggi_berat_badan WHERE id_siswa = '".$siswa['id_siswa']."' AND id_kelas = '".$dtsq1['id_kelas']."' AND id_semester = '".$dtsq2['id_semester']."'");
                                    $dttbb = mysqli_fetch_array($sqltb); 
                                    ?>
                                    <h2>
                                            Tinggi Dan Berat Badan
                                            <small>Input tinggi dan berat badan</small>
                                        </h2>
                                        <ul class="header-dropdown m-r-50">
                                            <li class="dropdown">
                                                <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><button class="btn bg-light-blue"><i class="material-icons">library_add</i> Input ket</button>
                                                </a>
                                                <ul class="dropdown-menu pull-right">
                                                    <li><a href="" data-toggle="modal" data-target="#defaulttbb">Input</a></li>
                                                    <li><a href="?page=tinggi_berat&id=<?= $dttbb['id_tbb']; ?>">Edit</a></li>
                                                </ul>
                                            </li>
                                        </ul>
                                </div>
                                <div class="table-responsive">
                                    <table id="mainTable" class="table table-bordered">
                                        <thead>
                                            <tr>
                                                <th class="bg-light-blue">Aspek Yang dinilai</th>
                                                <th class="bg-light-blue"><?= $_SESSION['semester']; ?></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <?php 
                                                $sqlt = mysqli_query($koneksi, "SELECT * FROM tinggi_berat_badan where id_siswa = '".$siswa['id_siswa']."' AND id_kelas = '".$dtsq1['id_kelas']."' AND id_semester = '".$dtsq2['id_semester']."'");
                                                while ($datat = mysqli_fetch_array($sqlt)) { 
                                                if (($datat['id_siswa'] == $siswa['id_siswa']) && ($datat['id_kelas'] == $dtsq1['id_kelas']) && ($datat['id_semester'] == $dtsq2['id_semester'])) {
                                                ?>
                                                <tr>
                                                    <td>Tinggi badan</td>
                                                    <td><?= $datat['tinggi_badan']; ?></td>
                                                </tr>
                                                <tr>
                                                    <td>Berat Badan</td>
                                                    <td><?= $datat['berat_badan']; ?></td>
                                                </tr>
                                            <?php }else if(($datat['id_siswa'] != $siswa['id_siswa']) && ($datat['id_kelas'] != $dtsq1['id_kelas']) && ($datat['id_semester'] != $dtsq2['id_semester'])){ ?>
                                                <tr>
                                                    <td>Data tidak ada</td>
                                                    <td>Data tidak ada</td>
                                                </tr>
                                            <?php }
                                            }
                                                ?>
                                        </tbody>
                                    </table>
                                </div>
                            </div>

                            <div class="col-lg-6 col-md-12 col-sm-12 col-xs-12">
                                <div class="header bg-indigo">
                                    <?php
                                    $sqlihadir = mysqli_query($koneksi, "SELECT * FROM ketidakhadiran WHERE id_siswa = '".$siswa['id_siswa']."' AND id_kelas = '".$dtsq1['id_kelas']."' AND id_semester = '".$dtsq2['id_semester']."'");
                                    $hdr = mysqli_fetch_array($sqlihadir); 
                                    ?>
                                    <h2>
                                            Ketidakhadiran
                                            <small>Input ketidakhadiran</small>
                                        </h2>
                                        <ul class="header-dropdown m-r-50">
                                            <li class="dropdown">
                                                <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><button class="btn bg-light-blue"><i class="material-icons">library_add</i> Input ket</button>
                                                </a>
                                                <ul class="dropdown-menu pull-right">
                                                    <li><a href="" data-toggle="modal" data-target="#defaultkehadiran">Input</a></li>
                                                    <li><a href="?page=ketidakhadiran&id=<?= $hdr['id_kehadiran']; ?>">Edit</a></li>
                                                </ul>
                                            </li>
                                        </ul>
                                </div>
                                <div class="table-responsive">
                                    <table id="mainTable" class="table table-bordered">
                                        <thead>
                                            <tr>
                                                <th class="bg-light-blue">Alasan Tidak Sekolah</th>
                                                <th class="bg-light-blue">Jumlah</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <?php 
                                            $sqlk = mysqli_query($koneksi, "SELECT * FROM ketidakhadiran where id_siswa = '".$siswa['id_siswa']."' AND id_kelas = '".$dtsq1['id_kelas']."' AND id_semester = '".$dtsq2['id_semester']."'");
                                            while ($datak = mysqli_fetch_array($sqlk)) { 
                                            if (($datak['id_siswa'] == $siswa['id_siswa']) && ($datak['id_kelas'] == $dtsq1['id_kelas']) && ($datak['id_semester'] == $dtsq2['id_semester'])) {
                                            ?>
                                            <tr>
                                                <td>Sakit</td>
                                                <td><?= $datak['sakit']; ?></td>
                                            </tr>
                                            <tr>
                                                <td>Ijin</td>
                                                <td><?= $datak['ijin']; ?></td>
                                            </tr>
                                            <tr>
                                                <td>Tanpa keterangan</td>
                                                <td><?= $datak['tanpa_keterangan']; ?></td>
                                            </tr>
                                            <tr>
                                                <td>Total tidak masuk sekolah</td>
                                                <td><?= $datak['total_tidak_masuk']; ?></td>
                                            </tr>
                                        <?php }else if(($datak['id_siswa'] != $siswa['id_siswa']) && ($datak['id_kelas'] != $dtsq1['id_kelas']) && ($datak['id_semester'] != $dtsq2['id_semester'])){ ?>
                                            <tr>
                                                <td>Data tidak ada</td>
                                                <td>Data tidak ada</td>
                                            </tr>
                                        <?php }
                                        }
                                            ?>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        </div>
                    </div>
                
<!-- #END# Basic Examples -->

<!-- Input nilai Kesehatan -->
            <div class="modal fade" id="defaultKesehatan" tabindex="-1" role="dialog">
                <div class="modal-dialog modal-lg" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title" id="defaultModalLabel">INPUT KESEHATAN <?= $_GET['id']; ?></h4>
                        </div>
                        <div class="modal-body">
                            <div class="body">
                            <div class="row clearfix">
                                <div class="col-xs-12 ol-sm-12 col-md-12 col-lg-12">
                                    
                            
                                        <form method="POST" action="proses/proses_per_kesehatan.php">
                                            <div class="form-group form-float" hidden>
                                                <div class="form-line">
                                                    <input type="text" class="form-control" name="id_siswa" value="<?= $siswa['id_siswa']; ?>" readonly required hidden>
                                                    <label class="form-label"></label>
                                                    <input type="text" name="nama_siswa" value="<?= $siswa['nama_siswa']; ?>" hidden>
                                                </div>
                                            </div>
                                            <div class="form-group form-float" hidden>
                                                <div class="form-line">
                                                    <input type="text" class="form-control" name="id_per_kondisi" value="<?= $datasos; ?>" readonly required>
                                                    <label class="form-label"></label>
                                                </div>
                                            </div>
                                            <div class="table-responsive">
                                                <table class="table table-bordered">
                                                    <thead>
                                                        <tr class="bg-light-blue">
                                                            <th><b>ID Kesehatan</b></th>
                                                            <th><b>Aspek Fisik</b></th>
                                                            <th><b>Keterangan</b></th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>   
                                                    <?php 
                                                    $sql = mysqli_query($koneksi, "SELECT * FROM kesehatan");
                                                    while ($dat = mysqli_fetch_array($sql)) { ?>
                                                    <tr>
                                                        <td>
                                                            <div class="form-group form-float">
                                                                <div class="">
                                                                    <input type="text" class="form-control" name="id_kesehatan[]" value="<?= $dat['id_kesehatan']; ?>" readonly>
                                                                    <label class="form-label"></label>
                                                                </div>
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="form-group form-float">
                                                                <div class="">
                                                                    <input type="text" class="form-control" name="aspek_fisik[]" value="<?= $dat['aspek_fisik']; ?>" readonly>
                                                                    <label class="form-label"></label>
                                                                </div>
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="form-group form-float">
                                                                <div class="form-line">
                                                                    <input type="text" class="form-control" name="keterangan[]">
                                                                    <label class="form-label"></label>
                                                                </div>
                                                            </div>
                                                        </td>
                                                        <?php 
                                                        date_default_timezone_set('Asia/Jakarta'); 
                                                        $raport_kondisi = date("Y-m-d h:i:s");
                                                        ?>
                                                        <div class="form-group form-float" hidden>
                                                            <div class="form-line">
                                                                <label class="form-label">Tanggal Raport</label>
                                                                <input type="text" class="form-control" name="tgl_raport[]" value="<?= $raport_kondisi; ?>" required readonly>
                                                            </div>
                                                        </div>
                                                        <td hidden>
                                                            <input type="text" name="id_siswa[]" value="<?= $siswa['id_siswa']; ?>" hidden>
                                                            <input type="text" name="id_kelas[]" value="<?= $dtsq1['id_kelas']; ?>" hidden>
                                                            <input type="text" name="id_semester[]" value="<?= $dtsq2['id_semester']; ?>" hidden>
                                                            <input type="text" name="tahun_awal[]" value="<?= $siswa['tahun_ajaran_awal']; ?>" hidden>
                                                            <input type="text" name="tahun_akhir[]" value="<?= $siswa['tahun_ajaran_akhir']; ?>" hidden>
                                                        </td>
                                                    </tr>
                                                <?php }  ?>
                                                    </tbody>
                                                </table>
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

<!-- Input nilai Prestasi -->
            <div class="modal fade" id="defaultPrestasi" tabindex="-1" role="dialog">
                <div class="modal-dialog modal-lg" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title" id="defaultModalLabel">INPUT PRESTASI <?= $_GET['id']; ?></h4>
                        </div>
                        <div class="modal-body">
                            <div class="body">
                            <div class="row clearfix">
                                <div class="col-xs-12 ol-sm-12 col-md-12 col-lg-12">
                                    
                            
                                        <form method="POST" action="proses/proses_per_prestasi.php">
                                            <div class="form-group form-float" hidden>
                                                <div class="form-line">
                                                    <input type="text" class="form-control" name="id_siswa" value="<?= $siswa['id_siswa']; ?>" readonly required>
                                                    <label class="form-label"></label>
                                                    <input type="text" name="nama_siswa" value="<?= $siswa['nama_siswa']; ?>" hidden>
                                                </div>
                                            </div>
                                            <div class="form-group form-float" hidden>
                                                <div class="form-line">
                                                    <input type="text" class="form-control" name="id_per_prestasi" value="<?= $datasos; ?>" readonly required>
                                                    <label class="form-label"></label>
                                                </div>
                                            </div>
                                            <div class="table-responsive">
                                                <table class="table table-bordered">
                                                    <thead>
                                                        <tr class="bg-light-blue">
                                                            <th><b>ID Prestasi</b></th>
                                                            <th><b>Prestasi</b></th>
                                                            <th><b>Keterangan</b></th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>   
                                                    <?php 
                                                    $sql = mysqli_query($koneksi, "SELECT * FROM prestasi");
                                                    while ($dat = mysqli_fetch_array($sql)) { ?>
                                                    <tr>
                                                        <td>
                                                            <div class="form-group form-float">
                                                            <div class="">
                                                                <input type="text" class="form-control" name="id_prestasi[]" value="<?= $dat['id_prestasi']; ?>" readonly>
                                                                <label class="form-label"></label>
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="form-group form-float">
                                                            <div class="">
                                                                <input type="text" class="form-control" name="jenis_prestasi[]" value="<?= $dat['jenis_prestasi']; ?>" readonly>
                                                                <label class="form-label"></label>
                                                            </div>
                                                        </div>
                                                        </td>
                                                        <td>
                                                            <div class="form-group form-float">
                                                                <div class="form-line">
                                                                    <input type="text" class="form-control" name="keterangan[]">
                                                                    <label class="form-label"></label>
                                                                </div>
                                                            </div>
                                                        </td>
                                                        <?php 
                                                        date_default_timezone_set('Asia/Jakarta'); 
                                                        $raport_prestasi = date("Y-m-d h:i:s");
                                                        ?>
                                                        <div class="form-group form-float" hidden>
                                                            <div class="form-line">
                                                                <label class="form-label">Tanggal Raport</label>
                                                                <input type="text" class="form-control" name="tgl_raport[]" value="<?= $raport_prestasi; ?>" required readonly>
                                                            </div>
                                                        </div>
                                                        <td hidden>
                                                            <input type="text" name="id_siswa[]" value="<?= $siswa['id_siswa']; ?>" hidden>
                                                            <input type="text" name="id_kelas[]" value="<?= $dtsq1['id_kelas']; ?>" hidden>
                                                            <input type="text" name="id_semester[]" value="<?= $dtsq2['id_semester']; ?>" hidden>
                                                            <input type="text" name="tahun_awal[]" value="<?= $siswa['tahun_ajaran_awal']; ?>" hidden>
                                                            <input type="text" name="tahun_akhir[]" value="<?= $siswa['tahun_ajaran_akhir']; ?>" hidden>
                                                        </td>
                                                    </tr>
                                                <?php }  ?>
                                                    </tbody>
                                                </table>
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

<!-- Input nilai Prestasi -->
            <div class="modal fade" id="defaulttbb" tabindex="-1" role="dialog">
                <div class="modal-dialog modal-lg" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title" id="defaultModalLabel">INPUT TINGGI DAN BERAT BADAN <?= $_GET['id']; ?></h4>
                        </div>
                        <div class="modal-body">
                            <div class="body">
                            <div class="row clearfix">
                                <div class="col-xs-12 ol-sm-12 col-md-12 col-lg-12">
                                    
                            
                                        <form method="POST" action="proses/proses_tinggi_berat.php">
                                        <div class="row">
                                            <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12">
                                            <div class="form-group form-float">
                                                <div class="form-line">
                                                    <label class="form-label"></label>
                                                    <input type="text" class="form-control" name="id_siswa" value="<?= $siswa['id_siswa']; ?>" readonly required>
                                                </div>
                                            </div>
                                            </div>
                                            <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12">
                                            <div class="form-group form-float">
                                                <div class="form-line">
                                                    <input type="text" class="form-control" name="id_tbb" value="<?= $tbb; ?>" readonly required>
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
                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" hidden>
                                            <div class="form-group form-float">
                                                <div class="form-line">
                                                    <input type="text" class="form-control" name="nama_siswa" value="<?= $siswa['nama_siswa']; ?>" readonly required>
                                                    <label class="form-label"></label>
                                                </div>
                                            </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                    <?php 
                                                        date_default_timezone_set('Asia/Jakarta'); 
                                                        $raport_ttb = date("Y-m-d h:i:s");
                                                        ?>
                                                        <div class="form-group form-float" hidden>
                                                            <div class="form-line">
                                                                <label class="form-label">Tanggal Raport</label>
                                                                <input type="text" class="form-control" name="tgl_raport" value="<?= $raport_ttb; ?>" required readonly>
                                                            </div>
                                                        </div>
                                                    <div class="form-group form-float" hidden>
                                                        <div class="form-line">
                                                            <input type="text" class="form-control" name="tahun_awal" value="<?= $siswa['tahun_ajaran_awal']; ?>" required>
                                                            <label class="form-label">Tahun Awal</label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-float" hidden>
                                                        <div class="form-line">
                                                            <input type="text" class="form-control" name="tahun_akhir" value="<?= $siswa['tahun_ajaran_akhir']; ?>" required>
                                                            <label class="form-label">Tahun Akhir</label>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                    <div class="form-group form-float">
                                                        <div class="form-line">
                                                            <input type="text" class="form-control" name="tinggi_badan" required>
                                                            <label class="form-label">TINGGI BADAN</label>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                    <div class="form-group form-float">
                                                        <div class="form-line">
                                                            <input type="text" class="form-control" name="berat_badan" required>
                                                            <label class="form-label">BERAT BADAN</label>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="submit" name="submit" class="btn bg-indigo waves-effect">SIMPAN</button>
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

<!-- Input nilai Prestasi -->
            <div class="modal fade" id="defaultkehadiran" tabindex="-1" role="dialog">
                <div class="modal-dialog modal-lg" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title" id="defaultModalLabel">INPUT KETIDAKHADIRAN <?= $_GET['id']; ?></h4>
                        </div>
                        <div class="modal-body">
                            <div class="body">
                            <div class="row clearfix">
                                <div class="col-xs-12 ol-sm-12 col-md-12 col-lg-12">
                                    
                            
                                        <form method="POST" action="proses/proses_ketidakhadiran.php">
                                        <div class="row">
                                            <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12">
                                            <div class="form-group form-float">
                                                <div class="form-line">
                                                    <label class="form-label"></label>
                                                    <input type="text" class="form-control" name="id_siswa" value="<?= $siswa['id_siswa']; ?>" readonly required>
                                                </div>
                                            </div>
                                            </div>
                                            <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12">
                                            <div class="form-group form-float">
                                                <div class="form-line">
                                                    <input type="text" class="form-control" name="id_kehadiran" value="<?= $dthdr; ?>" readonly required>
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
                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" hidden>
                                            <div class="form-group form-float">
                                                <div class="form-line">
                                                    <input type="text" class="form-control" name="nama_siswa" value="<?= $siswa['nama_siswa']; ?>" readonly required>
                                                    <label class="form-label"></label>
                                                </div>
                                            </div>
                                            </div>
                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                    <?php 
                                                        date_default_timezone_set('Asia/Jakarta'); 
                                                        $raport_ttb = date("Y-m-d h:i:s");
                                                        ?>
                                                        <div class="form-group form-float" hidden>
                                                            <div class="form-line">
                                                                <label class="form-label">Tanggal Raport</label>
                                                                <input type="text" class="form-control" name="tgl_raport" value="<?= $raport_ttb; ?>" required readonly>
                                                            </div>
                                                        </div>
                                                    <div class="form-group form-float" hidden>
                                                        <div class="form-line">
                                                            <input type="text" class="form-control" name="tahun_awal" value="<?= $siswa['tahun_ajaran_awal']; ?>" required>
                                                            <label class="form-label">Tahun Awal</label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-float" hidden>
                                                        <div class="form-line">
                                                            <input type="text" class="form-control" name="tahun_akhir" value="<?= $siswa['tahun_ajaran_akhir']; ?>" required>
                                                            <label class="form-label">Tahun Akhir</label>
                                                        </div>
                                                    </div>
                                                </div>
                                            <div class="row">
                                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                    <div class="form-group form-float">
                                                        <div class="form-line">
                                                            <input type="text" class="form-control" name="sakit" required>
                                                            <label class="form-label">Sakit : </label>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                    <div class="form-group form-float">
                                                        <div class="form-line">
                                                            <input type="text" class="form-control" name="ijin" required>
                                                            <label class="form-label">Ijin :</label>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                    <div class="form-group form-float">
                                                        <div class="form-line">
                                                            <input type="text" class="form-control" name="tanpa_keterangan" required>
                                                            <label class="form-label">Tanpa Keterangan :</label>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="submit" name="submit" class="btn bg-indigo waves-effect">SIMPAN</button>
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