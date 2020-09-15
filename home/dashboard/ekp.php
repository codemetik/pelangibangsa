<?php 
        $sqlekstra = mysqli_query($koneksi, "SELECT max(id_ekstra) AS maxCode FROM ekstrakurikuler");
        $dtekstra = mysqli_fetch_array($sqlekstra);
        $datekstra = $dtekstra['maxCode'];
        $nOeks = (int) substr($datekstra, 3, 3);
        $nOeks++; 
        $chareks = "EKS";
        $datekstra = $chareks . sprintf("%03s", $nOeks);

        $sqlaspek = mysqli_query($koneksi, "SELECT max(id_kesehatan) AS maxCode FROM kesehatan");
        $dtaspek = mysqli_fetch_array($sqlaspek);
        $dataspek = $dtaspek['maxCode'];
        $nOspk = (int) substr($dataspek, 3, 3);
        $nOspk++; 
        $charspk = "KSH";
        $dataspek = $charspk . sprintf("%03s", $nOspk);

        $sqlprestasi = mysqli_query($koneksi, "SELECT max(id_prestasi) AS maxCode FROM prestasi");
        $dtprestasi = mysqli_fetch_array($sqlprestasi);
        $datprestasi = $dtprestasi['maxCode'];
        $nOpts = (int) substr($datprestasi, 3, 3);
        $nOpts++; 
        $charpts = "PRS";
        $datprestasi = $charpts . sprintf("%03s", $nOpts);
?>
<nav aria-label="breadcrumb m-0">
  <ol class="breadcrumb">
    <li class="breadcrumb-item"><a href="../dashboard">Dashboard</a></li>
    <li class="breadcrumb-item"><a href="javascript:void(0);" class="menu-toggle">Data umum</a></li>
    <li class="breadcrumb-item active" aria-current="page"><i><b>ekp</b></i></li>
  </ol>
</nav>
<!-- Basic Examples -->
                
                    <div class="card">
                        <div class="header bg-indigo">
                            <h2>
                                PERKEMBANGAN
                                <small>Data Perkembangan.</small>
                            </h2>
                            <ul class="header-dropdown m-r--5">
                                <li class="dropdown">
                                    <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                                        <i class="material-icons">more_vert</i>
                                    </a>
                                    <ul class="dropdown-menu pull-right">
                                        <li><a href="javascript:void(0);" data-toggle="modal" data-target="#defaultEkskul">
                                            Input Ekskul
                                        </a></li>
                                        <li><a href="javascript:void(0);" data-toggle="modal" data-target="#defaultKesehatan">
                                            Input Kesehatan
                                        </a></li>
                                        <li><a href="javascript:void(0);" data-toggle="modal" data-target="#defaultPrestasi">
                                            Input Prestasi
                                        </a></li>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                        <div class="body">
                            <div class="row">
                            
                                    <div class="header">
                                        <h2>
                                            EKSTRAKURIKULER 
                                            <small>Input Keterangan</small>
                                        </h2>
                                    </div>
                                <div class="body">
                                <div class="">
                                        <table class="table table-bordered table-striped table-hover">
                                            <thead>
                                                <tr>
                                                    <th scope="col" class="col-xs-2 bg-light-blue">ID Ekstra</th>
                                                    <th scope="col" class="col-xs-1 bg-light-blue">No</th>
                                                    <th scope="col" class="col-xs-2 bg-light-blue">Kegiatan</th>
                                                    <th scope="col" class="col-xs-2 bg-light-blue">Action</th>
                                                </tr>
                                            </thead>
                                        </table>
                                    </div>
                                    <div class="table-wrapper-scroll-y my-custom-scrollbar">
                                        <table id="mainTable" class="table table-striped table-hover">
                                            <tbody>
                                                <?php 
                                                    $q = mysqli_query($koneksi, "SELECT * FROM ekstrakurikuler");
                                                    while ($d = mysqli_fetch_array($q)) { ?>
                                                     <tr>
                                                        <td scope="row" class="col-xs-2"><?= $d['id_ekstra']; ?></td>
                                                        <td scope="row" class="col-xs-1"><?= $d['no']; ?></td>
                                                        <td scope="row" class="col-xs-2"><?= $d['kegiatan']; ?></td>
                                                        <td  scope="row" class="col-xs-2">
                                                            <a href="?page=detail_ekskul&id=<?= $d['id_ekstra']; ?>"><button class="btn bg-indigo">Detail</button></a>
                                                    </tr>
                                                    <?php }
                                                ?>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                
                            </div>

                            <div class="row">
                            
                                    <div class="header">
                                        <h2>
                                            KONDISI KESEHATAN
                                            <small>Input Keterangan</small>
                                        </h2>
                                    </div>
                                    <div class="body">
                                        <div class="table table-sm table-responsive">
                                            <table id="mainTable" class="table table-sm table-striped table-hover dataTable js-exportable font-14">
                                                <thead>
                                                    <tr>
                                                    <?php
                                                    $data = array('ID KESEHATAN', 'NO', 'ASPEK FISIK', 'ACTION');
                                                    foreach ($data as $key) {
                                                        echo "<th class='bg-light-blue'>".$key."</th>";
                                                    
                                                     } ?>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <?php 
                                                    $sql_fisik = mysqli_query($koneksi, "SELECT * FROM kesehatan");
                                                    while ($data_fisik = mysqli_fetch_array($sql_fisik)) { ?>
                                                        <tr>
                                                            <td><?= $data_fisik['id_kesehatan']; ?></td>
                                                            <td><?= $data_fisik['no']; ?></td>
                                                            <td><?= $data_fisik['aspek_fisik']; ?></td>
                                                            <td>
                                                            <div class="dropdown">
                                                                <button type="submit" href="" class="btn bg-indigo" data-toggle="dropdown">
                                                                    Action
                                                                </button>
                                                                <ul class="dropdown-menu pull-right">
                                                                    <li><a href="?page=edit_kesehatan&id=<?= $data_fisik['id_kesehatan']; ?>">Edit</a></li>
                                                                    <li><a href="delete/delete_kesehatan.php?id=<?= $data_fisik['id_kesehatan']; ?>" onclick="return confirm('Apakah anda yakin ingin menghapus kondisi kesehatan ini?')">Delete</a></li>
                                                                </ul>
                                                            </div>
                                                            </td>
                                                        </tr>
                                                    <?php }
                                                    ?>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                
                            </div>

                            <div class="row">
                            
                                    <div class="header">
                                        <h2>
                                            PRESTASI
                                            <small>Input Keterangan</small>
                                        </h2>
                                    </div>
                                    <div class="body">
                                        <div class="table table-sm table-responsive">
                                            <table id="mainTable" class="table table-sm table-striped table-hover dataTable js-exportable font-14">
                                                <thead>
                                                    <tr>
                                                    <?php
                                                    $data = array('ID PRESTASI', 'NO', 'JENIS PRESTASI', 'ACTION');
                                                    foreach ($data as $key) {
                                                        echo "<th class='bg-light-blue'>".$key."</th>";
                                                    
                                                     } ?>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <?php 
                                                    $sql_prestasi = mysqli_query($koneksi, "SELECT * FROM prestasi");
                                                    while ($data_prestasi = mysqli_fetch_array($sql_prestasi)) { ?>
                                                        <tr>
                                                            <td><?= $data_prestasi['id_prestasi']; ?></td>
                                                            <td><?= $data_prestasi['no']; ?></td>
                                                            <td><?= $data_prestasi['jenis_prestasi']; ?></td>
                                                            <td>
                                                            <div class="dropdown">
                                                                <button type="submit" href="" class="btn bg-indigo" data-toggle="dropdown">
                                                                    Action
                                                                </button>
                                                                <ul class="dropdown-menu pull-right">
                                                                    <li><a href="?page=edit_prestasi&id=<?= $data_prestasi['id_prestasi']; ?>">Edit</a></li>
                                                                    <li><a href="delete/delete_prestasi.php?id=<?= $data_prestasi['id_prestasi']; ?>" onclick="return confirm('Apakah anda yakin ingin menghapus prestasi ini?')">Delete</a></li>
                                                                </ul>
                                                            </div>
                                                            </td>
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
                
<!-- #END# Basic Examples -->

<!-- Large Size -->
            <div class="modal fade" id="defaultEkskul" tabindex="-1" role="dialog">
                <div class="modal-dialog modal-lg" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title" id="defaultModalLabel">INPUT EKSTRAKURIKULER</h4>
                        </div>
                        <div class="modal-body">
                            <div class="body">
                            <div class="row clearfix">
                                <div class="col-xs-12 ol-sm-12 col-md-12 col-lg-12">
                                    
                            
                                        <form id="form_validation" method="POST" action="proses/proses_ekstra.php">
                                            <div class="form-group form-float">
                                                <div class="form-line">
                                                    <input type="text" class="form-control" name="id_ekstra" value="<?= $datekstra; ?>" readonly required>
                                                    <label class="form-label"></label>
                                                </div>
                                            </div>
                                            <div class="form-group form-float">
                                                <div class="form-line">
                                                    <input type="text" class="form-control" name="no" required>
                                                    <label class="form-label">NO</label>
                                                </div>
                                            </div>
                                            <div class="form-group form-float">
                                                <div class="form-line">
                                                    <input type="text" class="form-control" name="kegiatan" required>
                                                    <label class="form-label">KEGIATAN</label>
                                                </div>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="submit" class="btn bg-indigo waves-effect" name="submit">SIMPAN</button>
                                                <button type="button" class="btn bg-indigo waves-effect" data-dismiss="modal">TUTUP</button>
                                            </div>
                                        </form>
                                </div>
                            </div>
                        </div>
                        </div>
                    </div>
                </div>
            </div>

<!-- Large Size -->
            <div class="modal fade" id="defaultKesehatan" tabindex="-1" role="dialog">
                <div class="modal-dialog modal-lg" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title" id="defaultModalLabel">INPUT ASPEK KESEHATAN</h4>
                        </div>
                        <div class="modal-body">
                            <div class="body">
                            <div class="row clearfix">
                                <div class="col-xs-12 ol-sm-12 col-md-12 col-lg-12">
                                    
                            
                                        <form id="form_validation" method="POST" action="proses/proses_kesehatan.php">
                                            <div class="form-group form-float">
                                                <div class="form-line">
                                                    <input type="text" class="form-control" name="id_kesehatan" value="<?= $dataspek; ?>" readonly required>
                                                    <label class="form-label"></label>
                                                </div>
                                            </div>
                                            <div class="form-group form-float">
                                                <div class="form-line">
                                                    <input type="text" class="form-control" name="no" required>
                                                    <label class="form-label">NO</label>
                                                </div>
                                            </div>
                                            <div class="form-group form-float">
                                                <div class="form-line">
                                                    <input type="text" class="form-control" name="aspek_fisik" required>
                                                    <label class="form-label">ASPEK FISIK</label>
                                                </div>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="submit" class="btn bg-indigo waves-effect" name="submit">SIMPAN</button>
                                                <button type="button" class="btn bg-indigo waves-effect" data-dismiss="modal">TUTUP</button>
                                            </div>
                                        </form>
                                </div>
                            </div>
                        </div>
                        </div>
                    </div>
                </div>
            </div>

<!-- Large Size -->
            <div class="modal fade" id="defaultPrestasi" tabindex="-1" role="dialog">
                <div class="modal-dialog modal-lg" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title" id="defaultModalLabel">INPUT PRESTASI</h4>
                        </div>
                        <div class="modal-body">
                            <div class="body">
                            <div class="row clearfix">
                                <div class="col-xs-12 ol-sm-12 col-md-12 col-lg-12">
                                    
                            
                                        <form id="form_validation" method="POST" action="proses/proses_prestasi.php">
                                            <div class="form-group form-float">
                                                <div class="form-line">
                                                    <input type="text" class="form-control" name="id_prestasi" value="<?= $datprestasi; ?>" readonly required>
                                                    <label class="form-label"></label>
                                                </div>
                                            </div>
                                            <div class="form-group form-float">
                                                <div class="form-line">
                                                    <input type="text" class="form-control" name="no" required>
                                                    <label class="form-label">NO</label>
                                                </div>
                                            </div>
                                            <div class="form-group form-float">
                                                <div class="form-line">
                                                    <input type="text" class="form-control" name="prestasi" required>
                                                    <label class="form-label">KEGIATAN</label>
                                                </div>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="submit" class="btn bg-indigo waves-effect" name="submit">SIMPAN</button>
                                                <button type="button" class="btn bg-indigo waves-effect" data-dismiss="modal">TUTUP</button>
                                            </div>
                                        </form>
                                </div>
                            </div>
                        </div>
                        </div>
                    </div>
                </div>
            </div>