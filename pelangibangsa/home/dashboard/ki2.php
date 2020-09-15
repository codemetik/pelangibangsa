<?php 
    $sqlso = mysqli_query($koneksi, "SELECT max(id_jurnal_so) AS maxCode FROM jurnal_sosial");
    $dtso = mysqli_fetch_array($sqlso);
    $datso = $dtso['maxCode'];
    $nOso = (int) substr($datso, 3, 3);
    $nOso++; 
    $charso = "SOS";
    $datso = $charso . sprintf("%03s", $nOso);
?>

<nav aria-label="breadcrumb m-0">
  <ol class="breadcrumb">
    <li class="breadcrumb-item"><a href="../dashboard">Dashboard</a></li>
    <li class="breadcrumb-item"><a href="javascript:void(0);" class="menu-toggle">Input sikap</a></li>
    <li class="breadcrumb-item active" aria-current="page"><i><b>KI-2 sikap sosial</b></i></li>
  </ol>
</nav>

<?php
include "sikap_sosial.php";
?>
<!-- Basic Examples -->
                    <!-- <div class="card">
                        <div class="header bg-orange">
                            <h2>
                                KOMPETENSI INTI (KI-2) (JURNAL SIKAP SOSIAL)
                                <small>Nilai KI-2.</small>
                            </h2>
                            <ul class="header-dropdown m-r--5">
                                <li class="dropdown">
                                    <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                                        <i class="material-icons">more_vert</i>
                                    </a>
                                    <ul class="dropdown-menu pull-right">
                                        <li><a href="javascript:void(0);">
                                            <button type="button" class=" waves-effect m-r-20" data-toggle="modal" data-target="#defaultModal">INPUT JURNAL SOSIAL</button>
                                        </a></li>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                        <div class="body">
                            <div class="row">
                            
                                    
                                    <div class="body">
                                        <div class="table-responsive">
                                        <table id="mainTable" class="table table-sm table-striped table-hover dataTable js-exportable font-14">
                                            <thead>
                                                <tr>
                                                <?php
                                                $data = array('ID JURNAL', 'TANGGAL', 'NAMA SISWA','KI','CATATAN PERILAKU','BUTIR SIKAP','TINDAK LANJUT','SB','PB', 'ACTION');
                                                foreach ($data as $key) {
                                                    echo "<th class='bg-blue-grey'>".$key."</th>";
                                                
                                                 } ?>
                                                </tr>
                                            </thead>
                                            <?php 
                                            $sosial = mysqli_query($koneksi, "SELECT * FROM jurnal_sosial");
                                            while ($sikap_so = mysqli_fetch_array($sosial)) { ?>
                                                <tbody>
                                                <tr>
                                                    <td><?= $sikap_so['id_jurnal_so']; ?></td>
                                                    <td><?= $sikap_so['tanggal']; ?></td>
                                                    <td><?= $sikap_so['nama_siswa']; ?></td>
                                                    <td><?= $sikap_so['ki']; ?></td>
                                                    <td><?= $sikap_so['catatan_perilaku']; ?></td>
                                                    <td><?= $sikap_so['butir_sikap']; ?></td>
                                                    <td><?= $sikap_so['tindak_lanjut']; ?></td>
                                                    <td><?= $sikap_so['sb']; ?></td>
                                                    <td><?= $sikap_so['pb']; ?></td>
                                                    <td>
                                                        <div class="dropdown">
                                                            <button type="submit" href="" class="" data-toggle="dropdown">
                                                                Action
                                                            </button>
                                                            <ul class="dropdown-menu pull-right">
                                                                <li><a href="?page=edit_ki2&id=<?= $sikap_so['id_jurnal_so']; ?>">Detail</a></li>
                                                                <li><a href="delete/delete_ki2.php?id=<?= $sikap_so['id_jurnal_so']; ?>">Delete</a></li>
                                                            </ul>
                                                        </div>
                                                    </td>
                                                </tr>
                                                </tbody>
                                            <?php }
                                            ?>
                                            <tfoot>
                                                <tr>
                                                    <?php 
                                                    foreach ($data as $value) { 
                                                        echo "<th>".$value."</th>";
                                                    }
                                                    ?>
                                                </tr>
                                            </tfoot>
                                        </table>
                                        </div>
                                    </div>
                                
                            </div>

                        </div>
                    </div> -->
                
<!-- #END# Basic Examples -->

<!-- Large Size -->
            <div class="modal fade" id="defaultModal" tabindex="-1" role="dialog">
                <div class="modal-dialog modal-lg" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title" id="defaultModalLabel">INPUT SIKAP SOSIAL</h4>
                        </div>
                        <div class="modal-body">
                            <div class="body">
                            <div class="row clearfix">
                                <div class="col-xs-12 ol-sm-12 col-md-12 col-lg-12">
                                    
                            
                                        <form id="form_validation" method="POST" action="proses/proses_ki2.php">
                                            <div class="form-group form-float">
                                                <div class="form-line">
                                                    <input type="text" class="form-control" name="id_jurnal_so" value="<?= $datso; ?>" required readonly>
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
                                                            $sql_so = mysqli_query($koneksi, "SELECT * FROM siswa_kelas_semester WHERE kelas = '".$_SESSION['kelas']."' AND semester = '".$_SESSION['semester']."'");
                                                            while ($data_so = mysqli_fetch_array($sql_so)) { ?>
                                                                <option value="<?= $data_so['nama_siswa']; ?>"><?= $data_so['nama_siswa']; ?></option>
                                                            <?php }
                                                            ?>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row clearfix">
                                                <div class="col-lg-3 col-md-3 col-sm-3 col-xs-6">
                                                    <div class="form-group">
                                                        <div class="form-line">
                                                            <input type="text" class="form-control" name="ki" required>
                                                            <label class="form-label">KI, isi 0 / 1</label>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group form-float">
                                                <div class="form-line">
                                                    <textarea name="cttn_perilaku" cols="30" rows="5" class="form-control no-resize" required></textarea>
                                                    <label class="form-label">CATATAN PERILAKU</label>
                                                </div>
                                            </div>
                                            <div class="form-group form-float">
                                                <div class="row clearfix">
                                                    <div class="col-md-6">
                                                        <p>
                                                            <b>BUTIR SIKAP</b>
                                                        </p>
                                                        <select class="form-control show-tick" name="butir_sikap">
                                                            <?php 
                                                            $sql_so = mysqli_query($koneksi, "SELECT * FROM sikap_sosial");
                                                            while ($data_so = mysqli_fetch_array($sql_so)) { ?>
                                                                <option value="<?= $data_so['butir_sikap']; ?>"><?= $data_so['butir_sikap']; ?></option>
                                                            <?php }
                                                            ?>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group form-float">
                                                <div class="form-line">
                                                    <input type="text" class="form-control" name="tindak_lanjut" required>
                                                    <label class="form-label">TINDAK LANJUT</label>
                                                </div>
                                            </div>
                                            <div class="row clearfix">
                                                <div class="col-lg-3 col-md-3 col-sm-3 col-xs-6">
                                                    <div class="form-group">
                                                        <div class="form-line">
                                                            <input type="text" class="form-control" name="sb" required>
                                                            <label class="form-label">SB, isi 0 / 1</label>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-3 col-md-3 col-sm-3 col-xs-6">
                                                    <div class="form-group">
                                                        <div class="form-line">
                                                            <input type="text" class="form-control" name="pb" required>
                                                            <label class="form-label">PB, isi 0 / 1</label>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="submit" name="submit" class="btn btn-link btn-primary waves-effect">SIMPAN</button>
                                                <button type="button" class="btn btn-link waves-effect" data-dismiss="modal">TUTUP</button>
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