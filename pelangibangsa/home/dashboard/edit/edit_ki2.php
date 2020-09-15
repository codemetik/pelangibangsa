<?php 
include "../../connect.php";
$id = $_GET['id'];
$sql = mysqli_query($koneksi, "SELECT * FROM jurnal_sosial WHERE id_jurnal_so ='".$id."'");
$sqlso = mysqli_fetch_array($sql);
?>
<div class="card">
    <div class="body">

                            <div class="row clearfix">
                                <div class="col-xs-6 ol-sm-6 col-md-6 col-lg-6">
                                    
                            
                                        <form method="POST" action="">
                                            <div class="form-group form-float">
                                                <div class="form-line">
                                                    <input type="text" class="form-control" name="id_jurnal_so" value="<?= $sqlso['id_jurnal_so']; ?>" required readonly>
                                                    <label class="form-label">ID</label>
                                                </div>
                                            </div>
                                            <div class="form-group form-float">
                                                <div class="form-line">
                                                    <input type="text" class="form-control" name="tanggal" value="<?php date_default_timezone_set('Asia/Jakarta'); echo date('Y-m-d H:i:s'); ?>" required readonly>
                                                </div>
                                            </div>
                                            <div class="form-group form-float">
                                                <div class="row clearfix">
                                                    <div class="col-md-6">
                                                        <p>
                                                            <b>NAMA SISWA</b>
                                                        </p>
                                                        <select class="form-control show-tick" name="nama_siswa">
                                                            <?php 
                                                            $sql_so = mysqli_query($koneksi, "SELECT * FROM siswa_kelas_semester WHERE kelas ='".$_SESSION['kelas']."'");
                                                            while ($data_so = mysqli_fetch_array($sql_so)) { 
                                                                if ($sqlso['nama_siswa'] == $data_so['nama_siswa']) { ?>
                                                                   <option value="<?= $sqlso['nama_siswa']; ?>" selected><?= $sqlso['nama_siswa']; ?></option>
                                                                <?php }else{ ?>
                                                                    <option value="<?= $data_so['nama_siswa']; ?>"><?= $data_so['nama_siswa']; ?></option>
                                                                <?php }
                                                            }
                                                            ?>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row clearfix">
                                                <div class="col-lg-3 col-md-3 col-sm-3 col-xs-6">
                                                    <div class="form-group">
                                                        <div class="form-line">
                                                            <input type="text" class="form-control" name="ki" value="<?= $sqlso['ki']; ?>" required>
                                                            <label class="form-label">KI, isi 0 / 1</label>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group form-float">
                                                <div class="form-line">
                                                    <textarea name="cttn_perilaku" cols="30" rows="5" class="form-control no-resize" required><?= $sqlso['catatan_perilaku']; ?></textarea>
                                                    <label class="form-label">CATATAN PERILAKU</label>
                                                </div>
                                            </div>
                                </div>
                                    
                                <div class="col-xs-6 ol-sm-6 col-md-6 col-lg-6">
                                            <div class="form-group form-float">
                                                <div class="row clearfix">
                                                    <div class="col-md-6">
                                                        <p>
                                                            <b>BUTIR SIKAP</b>
                                                        </p>
                                                        <select class="form-control show-tick" name="butir">
                                                            <option value="pelangi">Pelangi bangssa</option>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group form-float">
                                                <div class="form-line">
                                                    <input type="text" class="form-control" name="tindak_lanjut" value="<?= $sqlso['tindak_lanjut']; ?>" required>
                                                    <label class="form-label">TINDAK LANJUT</label>
                                                </div>
                                            </div>
                                            <div class="row clearfix">
                                                <div class="col-lg-3 col-md-3 col-sm-3 col-xs-6">
                                                    <div class="form-group">
                                                        <div class="form-line">
                                                            <input type="text" class="form-control" name="sb" value="<?= $sqlso['sb']; ?>" required>
                                                            <label class="form-label">SB, isi 0 / 1</label>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-3 col-md-3 col-sm-3 col-xs-6">
                                                    <div class="form-group">
                                                        <div class="form-line">
                                                            <input type="text" class="form-control" name="pb" value="<?= $sqlso['pb'] ?>" required>
                                                            <label class="form-label">PB, isi 0 / 1</label>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="submit" name="submit" class="btn btn-link btn-primary waves-effect">SIMPAN</button>
                                                <a type="button" class="btn btn-link waves-effect" href="?page=ki2">TUTUP</a>
                                            </div>
                                        </form>
                            
                                   
                                </div>
                            
                            </div>
                        </div>
                        </div>
<?php 
if (isset($_POST['submit'])) {

$id_jurnal = $_POST['id_jurnal_so'];
$tgl = $_POST['tanggal'];
$siswa = $_POST['nama_siswa'];
$ki = $_POST['ki'];
$cttn = $_POST['cttn_perilaku'];
$butir = $_POST['butir'];
$tndk_lanjut = $_POST['tindak_lanjut'];
$sb = $_POST['sb'];
$pb = $_POST['pb'];

    $sqlquery = mysqli_query($koneksi, "UPDATE jurnal_sosial SET 
        id_jurnal_so ='".$id_jurnal."', 
        tanggal ='".$tgl."', 
        nama_siswa = '".$siswa."', 
        ki = '".$ki."', 
        catatan_perilaku = '".$cttn."',
        butir_sikap = '".$butir."', 
        tindak_lanjut = '".$tndk_lanjut."', 
        sb = '".$sb."', 
        pb = '".$pb."' 
        WHERE id_jurnal_so = '".$id_jurnal."'");
    if ($sqlquery) {
        echo "<script>
        alert('Data berhasil diupdate');
        document.location.href = '?page=ki2';
        </script>";
    }else{
        echo "<script>
        alert('Data gagal diupdate');
        document.location.href = '?page=ki2';
        </script>";
    }
}
?>