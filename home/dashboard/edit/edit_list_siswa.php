<?php
include "../../connect.php";
$nama_siswa = $_GET['id'];
$sql = mysqli_query($koneksi, "SELECT * FROM data_siswa WHERE id_siswa = '".$nama_siswa."'");
$siswa = mysqli_fetch_array($sql);
?>
<!-- Basic Examples -->
                <div class="card">
                    <div class="">
                        <div class="header bg-light-blue">
                            <h2>
                                <?= $siswa['nama_siswa']; ?>
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
                                    
                            
                                        <form id="form_validation" method="POST" action="proses/proses_edit_siswa.php">
                                            <div class="form-group form-float">
                                                <div class="form-line">
                                                    <input type="text" class="form-control" name="id_siswa" value="<?= $siswa['id_siswa']; ?>" required readonly>
                                                    <label class="form-label">ID SISWA</label>
                                                </div>
                                            </div>
                                            <div class="form-group form-float">
                                                <div class="form-line">
                                                    <input type="text" class="form-control" name="nisn" value="<?= $siswa['nisn']; ?>" required>
                                                    <label class="form-label">NISN</label>
                                                </div>
                                            </div>
                                            <div class="form-group form-float">
                                                <div class="form-line">
                                                    <input type="text" class="form-control" name="nis" value="<?= $siswa['nis']; ?>" required>
                                                    <label class="form-label">NIS</label>
                                                </div>
                                            </div>
                                            <div class="form-group form-float">
                                                <div class="form-line">
                                                    <input type="text" class="form-control" name="nama_siswa" value="<?= $siswa['nama_siswa']; ?>" required>
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
                                                            $sql = mysqli_query($koneksi, "SELECT * FROM jenis_kelamin");
                                                            while ($jk = mysqli_fetch_array($sql)) { 
                                                                if ($siswa['jk'] == $jk['singkatan']) {
                                                                    $select = "selected";
                                                                }else{
                                                                    $select = "";
                                                                }
                                                            ?>
                                                                <option value="<?= $jk['singkatan']; ?>" <?= $select; ?> ><?= $jk['singkatan']; ?></option>        
                                                            <?php }
                                                            ?>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group form-float">
                                                <div class="form-line">
                                                    <input type="text" class="form-control" name="tempat_lahir" value="<?= $siswa['tempat_lahir']; ?>" required>
                                                    <label class="form-label">TEMPAT LAHIR</label>
                                                </div>
                                            </div>
                                            <div class="form-group form-float">
                                                <div class="row clearfix">
                                                    <div class="col-md-4">
                                                        <label class="form-label">TANGGAL LAHIR</label>
                                                    <input type="date" class="form-control" name="tanggal_lahir" value="<?= $siswa['tanggal_lahir']; ?>">
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
                                                           $agama = mysqli_query($koneksi, "SELECT * FROM agama");
                                                           while ($agm = mysqli_fetch_array($agama)) {
                                                               if ($siswa['id_agama'] == $agm['id_agama']) {
                                                                    $selectd = "selected";
                                                               }else{
                                                                    $selectd = "";
                                                                } ?>
                                                                <option value="<?= $agm['id_agama']; ?>" <?= $selectd; ?>><?= $agm['agama']; ?></option>
                                                           <?php }
                                                        ?>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group form-float">
                                                <div class="form-line">
                                                    <input type="text" class="form-control" name="pend_sebelumnya" value="<?= $siswa['pend_sebelumnya']; ?>" required>
                                                    <label class="form-label">PENDIDIKAN SEBELUMNYA</label>
                                                </div>
                                            </div>
                                            <div class="form-group form-float">
                                                <div class="form-line">
                                                    <input type="text" class="form-control" name="alamat_didik" value="<?= $siswa['alamat_serta_didik']; ?>" required>
                                                    <label class="form-label">ALAMAT PESERTA DIDIK</label>
                                                </div>
                                            </div>
                                            <div class="form-group form-float">
                                                <div class="form-line">
                                                    <input type="text" class="form-control" name="nama_ayah" value="<?= $siswa['nama_ayah']; ?>" required>
                                                    <label class="form-label">NAMA AYAH</label>
                                                </div>
                                            </div>
                                            <div class="form-group form-float">
                                                <div class="form-line">
                                                    <input type="text" class="form-control" name="nama_ibu" value="<?= $siswa['nama_ibu']; ?>" required>
                                                    <label class="form-label">NAMA IBU</label>
                                                </div>
                                            </div>
                                </div>
                                <div class="col-lg-6 col-md-4 col-sm-6 col-xs-12">
                                            <div class="form-group form-float">
                                                <div class="form-line">
                                                    <input type="text" class="form-control" name="pekerjaan_ayah" value="<?= $siswa['pekerjaan_ayah']; ?>" required>
                                                    <label class="form-label">PEKERJAAN AYAH</label>
                                                </div>
                                            </div>
                                
                                            <div class="form-group form-float">
                                                <div class="form-line">
                                                    <input type="text" class="form-control" name="pekerjaan_ibu" value="<?= $siswa['pekerjaan_ibu']; ?>" required>
                                                    <label class="form-label">PEKERJAAN IBU</label>
                                                </div>
                                            </div>
                                            <div class="row">
                                            <div class="col-md-3">
                                            <!-- <div class="form-group form-float">
                                                <div class="form-line">
                                                    <input type="text" class="form-control" name="jalan" value="<?= $siswa['jalan']; ?>" required>
                                                    <label class="form-label">Jalan</label>
                                                </div>
                                            </div> -->
                                            <div class="form-group form-float">
                                                <div class="form-line">
                                                    <input type="text" class="form-control" name="kelurahan" value="<?= $siswa['desa_kelurahan']; ?>" required>
                                                    <label class="form-label">Kelurahan/Desa</label>
                                                </div>
                                            </div>
                                            <div class="form-group form-float">
                                                <div class="form-line">
                                                    <input type="text" class="form-control" name="kecamatan" value="<?= $siswa['kecamatan']; ?>" required>
                                                    <label class="form-label">Kecamatan</label>
                                                </div>
                                            </div>
                                            <div class="form-group form-float">
                                                <div class="form-line">
                                                    <input type="text" class="form-control" name="kabupaten" value="<?= $siswa['kabupaten_kota']; ?>" required>
                                                    <label class="form-label">Kabupaten/Kota</label>
                                                </div>
                                            </div>
                                            <div class="form-group form-float">
                                                <div class="form-line">
                                                    <input type="text" class="form-control" name="provinsi" value="<?= $siswa['provinsi']; ?>" required>
                                                    <label class="form-label">Provinsi</label>
                                                </div>
                                            </div>
                                            </div>
                                            </div>
                                            <div class="form-group form-float">
                                                <div class="form-line">
                                                    <input type="text" class="form-control" name="no_telp_hp" value="<?= $siswa['no_telp_hp']; ?>" required>
                                                    <label class="form-label">No.Telp/Hp</label>
                                                </div>
                                            </div>
                                            <div class="form-group form-float">
                                                <div class="form-line">
                                                    <input type="text" class="form-control" name="nama_wali" value="<?= $siswa['nama_wali']; ?>" required>
                                                    <label class="form-label">NAMA WALI</label>
                                                </div>
                                            </div>
                                            <div class="form-group form-float">
                                                <div class="form-line">
                                                    <input type="text" class="form-control" name="pekerjaan_wali" value="<?= $siswa['pekerjaan_wali']; ?>" required>
                                                    <label class="form-label">PEKERJAAN WALI</label>
                                                </div>
                                            </div>
                                            <div class="form-group form-float">
                                                <div class="form-line">
                                                    <input type="text" class="form-control" name="alamat_wali" value="<?= $siswa['alamat_wali']; ?>" required>
                                                    <label class="form-label">ALAMAT WALI</label>
                                                </div>
                                            </div>
                                            <div class="form-group form-float">
                                                <div class="form-line">
                                                    <input type="text" class="form-control" name="no_telp_wali" value="<?= $siswa['no_telp_hp_wali']; ?>" required>
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
                                                            <input type="text" class="form-control" name="tahun_awal" value="<?= $siswa['tahun_ajaran_awal']; ?>" required>
                                                            <label class="form-label">Tahun Awal</label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-float">
                                                        <div class="form-line">
                                                            <input type="text" class="form-control" name="tahun_akhir" value="<?= $siswa['tahun_ajaran_akhir']; ?>" required>
                                                            <label class="form-label">Tahun akhir</label>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <input type="checkbox" id="checkbox" name="checkbox">
                                                <label for="checkbox">I have read and accept the terms</label>
                                            </div>
                                            <button class="btn bg-indigo waves-effect" type="submit" name="submit">SIMPAN</button>
                                        </form>
                            
                                   
                                </div>
                            
                            </div>
                        </div>
                    </div>
                </div>
<!-- #END# Basic Examples -->