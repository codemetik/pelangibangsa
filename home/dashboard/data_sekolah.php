<?php
$sql = mysqli_query($koneksi, "SELECT * FROM data_sekolah");
$school = mysqli_fetch_array($sql);
?>
<!-- Basic Examples -->
<nav aria-label="breadcrumb m-0">
  <ol class="breadcrumb">
    <li class="breadcrumb-item"><a href="#">Dasbhboard</a></li>
    <li class="breadcrumb-item"><a href="javascript:void(0);" class="menu-toggle">Data umum</a></li>
    <li class="breadcrumb-item active" aria-current="page"><i><b>sekolah</b></i></li>
  </ol>
</nav>
                
                    <div class="card">
                        <div class="header bg-indigo">
                            <h2>
                                SEKOLAH
                                <small>Data Sekolah.</small>
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
                                <div class="col-xs-6 ol-sm-6 col-md-6 col-lg-6">
                                    
                            
                                        <form id="form_validation" method="POST" action="proses/proses_sekolah.php">
                                            <div class="form-group form-float">
                                                <div class="form-line">
                                                    <input type="text" class="form-control" name="nama_sekolah" value="<?= $school['nama_sekolah']; ?>" required>
                                                    <label class="form-label">NAMA SEKOLAH</label>
                                                </div>
                                            </div>
                                            <div class="form-group form-float">
                                                <div class="form-line">
                                                    <input type="text" class="form-control" name="npsn" value="<?= $school['npsn']; ?>" required>
                                                    <label class="form-label">NPSN</label>
                                                </div>
                                            </div>
                                            <div class="row">
                                            <div class="col-md-6">
                                            <div class="form-group form-float">
                                                <div class="form-line">
                                                    <input type="text" class="form-control" name="alamat_sekolah" value="<?= $school['alamat_sekolah']; ?>" required>
                                                    <label class="form-label">ALAMAT SEKOLAH</label>
                                                </div>
                                            </div>
                                            <div class="form-group form-float">
                                                <div class="form-line">
                                                    <input type="text" class="form-control" name="kode_pos" value="<?= $school['kode_pos']; ?>" required>
                                                    <label class="form-label">Kode Pos</label>
                                                </div>
                                            </div>
                                            <div class="form-group form-float bg-blue">
                                                <div class="form-line">
                                                    <input type="text" class="form-control" name="kelurahan_desa" value="<?= $school['kelurahan_desa']; ?>" required>
                                                    <label class="form-label">Kelurahan/Desa</label>
                                                </div>
                                            </div>
                                            <div class="form-group form-float bg-blue">
                                                <div class="form-line">
                                                    <input type="text" class="form-control" name="kecamatan" value="<?= $school['kecamatan']; ?>" required>
                                                    <label class="form-label">Kecamatan</label>
                                                </div>
                                            </div>
                                            <div class="form-group form-float">
                                                <div class="form-line">
                                                    <input type="text" class="form-control" name="kabupaten_kota" value="<?= $school['kabupaten_kota']; ?>" required>
                                                    <label class="form-label">Kabupaten/Kota</label>
                                                </div>
                                            </div>
                                            <div class="form-group form-float">
                                                <div class="form-line">
                                                    <input type="text" class="form-control" name="provinsi" value="<?= $school['provinsi']; ?>" required>
                                                    <label class="form-label">Provinsi</label>
                                                </div>
                                            </div>
                                            </div>
                                            </div>
                                            <div class="form-group form-float">
                                                <div class="form-line">
                                                    <input type="text" class="form-control" name="telp" value="<?= $school['telp']; ?>" required>
                                                    <label class="form-label">Telp.</label>
                                                </div>
                                            </div>
                                            <!-- <div class="form-group form-float">
                                                <div class="form-line">
                                                    <input type="text" class="form-control" name="niy" value="<?= $school['niy']; ?>" required>
                                                    <label class="form-label">NIY</label>
                                                </div>
                                            </div> -->
</div>
    
<div class="col-xs-6 ol-sm-6 col-md-6 col-lg-6">
                                            <div class="form-group form-float">
                                                <div class="form-line">
                                                    <input type="text" class="form-control" name="website" value="<?= $school['website']; ?>" required>
                                                    <label class="form-label">Website</label>
                                                </div>
                                            </div>
                                            <div class="form-group form-float">
                                                <div class="form-line">
                                                    <input type="text" class="form-control" name="kepala_sekolah" value="<?= $school['kepala_sekolah']; ?>" required>
                                                    <label class="form-label">KEPALA SEKOLAH</label>
                                                </div>
                                            </div>
                                            <div class="form-group form-float">
                                                <div class="form-line">
                                                    <input type="text" class="form-control" name="semester" value="<?= $_SESSION['semester']; ?>" readonly required>
                                                    <label class="form-label">TAHUN PELAJARAN</label>
                                                </div>
                                            </div>
                                            <div class="form-group form-float">
                                                <div class="form-line">
                                                    <input type="text" class="form-control" name="tahun_pelajaran" value="<?= $school['tahun_pelajaran']; ?>" required>
                                                    <label class="form-label">TAHUN PELAJARAN</label>
                                                </div>
                                            </div>
                                            <div class="form-group form-float">
                                                <div class="form-line">
                                                    <input type="text" class="form-control" name="guru_kelas_wali" value="<?= $school['guru_kelas_wali']; ?>" required>
                                                    <label class="form-label">GURU KELAS/WALI KELAS</label>
                                                </div>
                                            </div>
                                            <div class="form-group form-float">
                                                <div class="form-line">
                                                    <input type="text" class="form-control" name="nuptk" value="<?= $school['nuptk']; ?>" required>
                                                    <label class="form-label">NUPTK</label>
                                                </div>
                                            </div>
                                            <!-- <div class="form-group form-float">
                                                <div class="form-line">
                                                    <input type="text" class="form-control" name="tmpt_wkt_pemetaan_kd" value="<?= $school['tmpt_wkt_pemetaan_kd']; ?>" required>
                                                    <label class="form-label">Tempat, Waktu Pemetaan KD</label>
                                                </div>
                                            </div>
                                            <div class="form-group form-float">
                                                <div class="form-line">
                                                    <input type="text" class="form-control" name="tmpt_wkt_analisis_kkm" value="<?= $school['tmpt_wkt_analisis_kkm']; ?>" required>
                                                    <label class="form-label">Tempat, Waktu Analisis KKM</label>
                                                </div>
                                            </div> -->
                                            <div class="form-group form-float">
                                                <div class="form-line">
                                                    <input type="text" class="form-control" name="tmpt_wkt_pembagian_raport" value="<?= $school['tmpt_wkt_pembagian_raport']; ?>" required>
                                                    <label class="form-label">Tempat, Waktu Pembagian Rapor</label>
                                                </div>
                                            </div>
                                            <!-- <div class="form-group form-float">
                                                <div class="form-line">
                                                    <input type="text" class="form-control" name="banyak_mulok_diberikan" value="<?= $school['banyak_mulok_diberikan']; ?>" required>
                                                    <label class="form-label">Banyak Mulok yg diberikan</label>
                                                </div>
                                            </div> -->
                                            <div class="form-group form-float">
                                                <div class="form-line">
                                                    <input type="email" class="form-control" name="email" value="<?= $school['email']; ?>" required>
                                                    <label class="form-label">Email</label>
                                                </div>
                                            </div>
                                            <div class="form-group form-float" hidden>
                                                <div class="form-line">
                                                    <input type="text" class="form-control" name="id_sekolah" value="<?= $school['id_sekolah']; ?>" required>
                                                    <label class="form-label">ID SEKOLAH</label>
                                                </div>
                                            </div>
                                            
                                            <button class="btn bg-indigo waves-effect" type="submit" name="submit">SUBMIT</button>
                                        </form>
                            
                                   
                                </div>
                            
                            </div>
                        </div>
                    </div>
                
<!-- #END# Basic Examples