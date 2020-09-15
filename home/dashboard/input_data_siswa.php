<?php 
$lvsmtr = mysqli_query($koneksi, "SELECT max(id_level_semester) AS maxCode FROM data_level_semester");
$idleve = mysqli_fetch_array($lvsmtr);
$lvl = $idleve['maxCode'];
$lvel = (int) substr($lvl, 3, 7);
$lvel++;
$lvsise = "DLS";
$datalvel = $lvsise . sprintf("%07s", $lvel);

$level = mysqli_query($koneksi, "SELECT max(id_level_siswa) AS maxCode FROM data_level_siswa");
$idlevel = mysqli_fetch_array($level);
$lv = $idlevel['maxCode'];
$lve = (int) substr($lv, 3, 7);
$lve++; 
$lvsis = "DLA";
$datalv = $lvsis . sprintf("%07s", $lve);

$sq1 = mysqli_query($koneksi, "SELECT * FROM kelas WHERE kelas = '".$_SESSION['kelas']."'");
$dtsq1 = mysqli_fetch_array($sq1);

$sq2 = mysqli_query($koneksi, "SELECT * FROM semester WHERE semester = '".$_SESSION['semester']."'");
$dtsq2 = mysqli_fetch_array($sq2);

?>
<!-- Basic Examples -->
                
                    <div class="card">
                        <div class="header bg-indigo">
                            <h2>
                                SISWA
                                <small>Data Siswa.</small>
                            </h2>
                            <!-- <ul class="header-dropdown m-r--5">
                                <li class="dropdown">
                                    <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                                        <i class="material-icons">more_vert</i>
                                    </a>
                                    <ul class="dropdown-menu pull-right">
                                        <li><a href="javascript:void(0);">Action</a></li>
                                        <li><a href="javascript:void(0);">Another action</a></li>
                                        <li><a href="javascript:void(0);">Something else here</a></li>
                                    </ul>
                                </li>
                            </ul> -->
                        </div>
                        <div class="body">
                            <div class="row clearfix">
                                <div class="col-lg-6 col-md-4 col-sm-6 col-xs-12">
                                    
                            
                                        <form id="form_validation" method="POST" action="proses/proses_siswa.php">
                                            <div class="form-group form-float">
                                                <label class="form-label">NEW ID</label>
                                                <input type="text" class="form-control" name="id_siswa" value="<?= $datsiswa; ?>" required readonly>
                                            </div>
                                            <div class="form-group form-float" hidden>
                                                <div class="form-line">
                                                    <input type="text" class="form-control" name="id_level_siswa" value="<?= $datalv; ?>" required readonly>
                                                    <input type="text" class="form-control" name="id_level_semester" value="<?= $datalvel; ?>" required readonly>

                                                    <input type="text" class="form-control" name="id_kelas" value="<?= $dtsq1['id_kelas']; ?>" required readonly>
                                                    <input type="text" class="form-control" name="id_semester" value="<?= $dtsq2['id_semester']; ?>" required readonly>
                                                    <input type="text" class="form-control" name="id_user" value="<?= $_SESSION['id_user']; ?>" required readonly>
                                                    <label class="form-label"></label>
                                                </div>
                                            </div>
                                            <div class="form-group form-float">
                                                <div class="form-line">
                                                    <input type="text" class="form-control" name="nisn" required>
                                                    <label class="form-label">NISN</label>
                                                </div>
                                            </div>
                                            <div class="form-group form-float">
                                                <div class="form-line">
                                                    <input type="text" class="form-control" name="nis" required>
                                                    <label class="form-label">NIS</label>
                                                </div>
                                            </div>
                                            <div class="form-group form-float">
                                                <div class="form-line">
                                                    <input type="text" class="form-control" name="nama_siswa" required>
                                                    <label class="form-label">NAMA SISWA</label>
                                                </div>
                                            </div>
                                            <div class="form-group form-float">
                                                <div class="row clearfix">
                                                    <div class="col-md-4">
                                                        <p>
                                                            <b>JENIS KELAMIN</b>
                                                        </p>
                                                        <select class="form-control show-tick" name="jk">
                                                            <?php 
                                                            $sqljk = mysqli_query($koneksi, "SELECT * FROM jenis_kelamin");
                                                            while ($jk = mysqli_fetch_array($sqljk)) { ?>
                                                                <option value="<?= $jk['singkatan']; ?>"><?= $jk['kelamin']; ?></option>
                                                            <?php }
                                                            ?>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group form-float">
                                                <div class="form-line">
                                                    <input type="text" class="form-control" name="tempat_lahir" required>
                                                    <label class="form-label">TEMPAT LAHIR</label>
                                                </div>
                                            </div>
                                            <div class="form-group form-float">
                                                <div class="row clearfix">
                                                    <div class="col-md-4">
                                                        <label class="form-label">TANGGAL LAHIR</label>
                                                    <input type="date" class="form-control" name="tanggal_lahir">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group form-float">
                                                <div class="row clearfix">
                                                    <div class="col-md-4">
                                                        <p>
                                                            <b>AGAMA</b>
                                                        </p>
                                                        <select class="form-control show-tick" name="id_agama">
                                                            <?php 
                                                            include "../../connect.php";
                                                            $agama = mysqli_query($koneksi, "SELECT * FROM agama");
                                                            while ($dat = mysqli_fetch_array($agama)) { ?>
                                                                <option value="<?= $dat['id_agama']; ?>"><?= $dat['agama']; ?></option>
                                                            <?php }
                                                            ?>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group form-float">
                                                <div class="form-line">
                                                    <input type="text" class="form-control" name="pend_sebelumnya" required>
                                                    <label class="form-label">PENDIDIKAN SEBELUMNYA</label>
                                                </div>
                                            </div>
                                            <div class="form-group form-float">
                                                <div class="form-line">
                                                    <input type="text" class="form-control" name="alamat_didik" required>
                                                    <label class="form-label">ALAMAT PESERTA DIDIK</label>
                                                </div>
                                            </div>
                                            <div class="form-group form-float">
                                                <div class="form-line">
                                                    <input type="text" class="form-control" name="nama_ayah" required>
                                                    <label class="form-label">NAMA AYAH</label>
                                                </div>
                                            </div>
                                            <div class="form-group form-float">
                                                <div class="form-line">
                                                    <input type="text" class="form-control" name="nama_ibu" required>
                                                    <label class="form-label">NAMA IBU</label>
                                                </div>
                                            </div>
                                            <div class="form-group form-float">
                                                <div class="form-line">
                                                    <input type="text" class="form-control" name="pekerjaan_ayah" required>
                                                    <label class="form-label">PEKERJAAN AYAH</label>
                                                </div>
                                            </div>
                                            <div class="form-group form-float">
                                                <div class="form-line">
                                                    <input type="text" class="form-control" name="pekerjaan_ibu" required>
                                                    <label class="form-label">PEKERJAAN IBU</label>
                                                </div>
                                            </div>
                                </div>
                                <div class="col-lg-6 col-md-4 col-sm-6 col-xs-12">
                                            <div class="row">
                                            <div class="col-md-3">
                                            <!-- <div class="form-group form-float">
                                                <div class="form-line">
                                                    <input type="text" class="form-control" name="jalan" required>
                                                    <label class="form-label">Jalan</label>
                                                </div>
                                            </div> -->
                                            <div class="form-group form-float">
                                                <div class="form-line">
                                                    <input type="text" class="form-control" name="kelurahan" required>
                                                    <label class="form-label">Kelurahan/Desa</label>
                                                </div>
                                            </div>
                                            <div class="form-group form-float">
                                                <div class="form-line">
                                                    <input type="text" class="form-control" name="kecamatan" required>
                                                    <label class="form-label">Kecamatan</label>
                                                </div>
                                            </div>
                                            <div class="form-group form-float">
                                                <div class="form-line">
                                                    <input type="text" class="form-control" name="kabupaten" required>
                                                    <label class="form-label">Kabupaten/Kota</label>
                                                </div>
                                            </div>
                                            <div class="form-group form-float">
                                                <div class="form-line">
                                                    <input type="text" class="form-control" name="provinsi" required>
                                                    <label class="form-label">Provinsi</label>
                                                </div>
                                            </div>
                                            </div>
                                            </div>
                                            <div class="form-group form-float">
                                                <div class="form-line">
                                                    <input type="text" class="form-control" name="no_telp_hp" required>
                                                    <label class="form-label">No.Telp/Hp</label>
                                                </div>
                                            </div>
                                            <div class="form-group form-float">
                                                <div class="form-line">
                                                    <input type="text" class="form-control" name="nama_wali" required>
                                                    <label class="form-label">NAMA WALI</label>
                                                </div>
                                            </div>
                                            <div class="form-group form-float">
                                                <div class="form-line">
                                                    <input type="text" class="form-control" name="pekerjaan_wali" required>
                                                    <label class="form-label">PEKERJAAN WALI</label>
                                                </div>
                                            </div>
                                            <div class="form-group form-float">
                                                <div class="form-line">
                                                    <input type="text" class="form-control" name="alamat_wali" required>
                                                    <label class="form-label">ALAMAT WALI</label>
                                                </div>
                                            </div>
                                            <div class="form-group form-float">
                                                <div class="form-line">
                                                    <input type="text" class="form-control" name="no_telp_wali" required>
                                                    <label class="form-label">No.Telp/Hp</label>
                                                </div>
                                            </div>
                                            <div class="card">
                                                <div class="header">
                                                    <h2>Tahun Ajaran</h2>
                                                </div>
                                                <div class="body">
                                                    <div class="form-group form-float">
                                                <div class="form-line">
                                                    <input type="text" class="form-control" name="tahun_awal" required>
                                                    <label class="form-label">Tahun Awal</label>
                                                </div>
                                            </div>
                                            <div class="form-group form-float">
                                                <div class="form-line">
                                                    <input type="text" class="form-control" name="tahun_akhir" required>
                                                    <label class="form-label">Tahun akhir</label>
                                                </div>
                                            </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <input type="checkbox" id="checkbox" name="checkbox">
                                                <label for="checkbox">I have read and accept the terms</label>
                                            </div>
                                            <button class="btn bg-indigo waves-effect" type="submit" name="submit">SUBMIT</button>
                                        </form>
                            
                                   
                                </div>
                            
                            </div>
                        </div>
                    </div>
                
<!-- #END# Basic Examples -->