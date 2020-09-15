<nav aria-label="breadcrumb m-0">
  <ol class="breadcrumb">
    <li class="breadcrumb-item"><a href="../dashboard">Dashboard</a></li>
    <li class="breadcrumb-item"><a href="javascript:void(0);" class="menu-toggle">Data umum</a></li>
    <li class="breadcrumb-item active" aria-current="page"><i><b>kkm</b></i></li>
  </ol>
</nav>
<!-- Basic Examples -->

                    <div class="card">
                        <div class="header bg-indigo">
                            <h2>
                                KRITERIA KETUNTASA MINIMAN (KKM) MATA PELAJARAN
                                <small>Mata Pelajaran.</small>
                            </h2>
                            <ul class="header-dropdown m-r--5">
                                <li class="dropdown">
                                    <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                                        <i class="material-icons">more_vert</i>
                                    </a>
                                    <ul class="dropdown-menu pull-right">
                                        <li><a href="javascript:void(0);" data-toggle="modal" data-target="#defaultModal">
                                            INPUT KKM
                                        </a></li>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                        <div class="body">
                            <div class="row">
                            
                                    <!--Untuk table KKM-->
                                    <div class="body">
                                        <div class="table table-sm table-responsive">
                                        <table id="mainTable" class="table table-sm table-striped table-hover dataTable js-exportable font-12">
                                            <thead>
                                                <tr>
                                                <?php
                                                $data = array('ID MAPEL', 'MATA PELAJARAN', 'SINGKATAN','KELOMPOK','KKM PENGETAHUAN','KKM KETERAMPILAN','OPSI');
                                                foreach ($data as $key) {
                                                    echo "<th class='bg-light-blue'>".$key."</th>";
                                                
                                                 } ?>
                                                </tr>
                                            </thead>
                                            <tbody>

                                                <?php 
                                                $sq1 = mysqli_query($koneksi, "SELECT * FROM kelas WHERE kelas = '".$_SESSION['kelas']."'");
                                                $dtsq1 = mysqli_fetch_array($sq1);

                                                $sq2 = mysqli_query($koneksi, "SELECT * FROM semester WHERE semester = '".$_SESSION['semester']."'");
                                                $dtsq2 = mysqli_fetch_array($sq2);

                                                $sql = mysqli_query($koneksi, "SELECT * FROM show_mapel_perkelas WHERE id_kelas ='".$dtsq1['id_kelas']."' AND id_semester = '".$dtsq2['id_semester']."' GROUP BY id_mapel");
                                                
                                                while ($mapel = mysqli_fetch_array($sql)) { ?>
                                                    <tr>
                                                    <td><?= $mapel['id_mapel']; ?></td>
                                                    <td><?= $mapel['nama_mapel'];?></td>
                                                    <td><?= $mapel['singkat_mapel']; ?></td>
                                                    <td><?= $mapel['kelompok']; ?></td>
                                                    <td><?= $mapel['pengetahuan']; ?></td>
                                                    <td><?= $mapel['keterampilan'];?></td>
                                                    <td><a type="button" data-toggle="modal" href="?page=edit_kkm_kelas&id=<?= $mapel['id_mapel']; ?>&kls=<?= $mapel['id_kelas']; ?>&sm=<?= $mapel['id_semester']; ?>"><button class="btn bg-indigo">Detail</button></a></td>
                                                    </tr>
                                                <?php }
                                                ?>
                                            </tbody>
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
                    </div>

                    <div class="card">
                        <div class="header bg-indigo">
                            <h2>
                                PERHITUNGAN KKM SATUAN PENDIDIKAN
                                <small>Satuan Pendidikan</small>
                            </h2>
                            <!-- <ul class="header-dropdown m-r--5">
                                <li class="dropdown">
                                    <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                                        <i class="material-icons">more_vert</i>
                                    </a>
                                    <ul class="dropdown-menu pull-right">
                                        <li><a href="javascript:void(0);">
                                            <button type="button" class="btn bg-green waves-effect m-r-20" data-toggle="modal" data-target="#defaultModal">INPUT SATUAN</button>
                                        </a></li>
                                    </ul>
                                </li>
                            </ul> -->
                        </div>
                        <div class="body">
                            <div class="row">
                            
                                    
                                    <div class="body">
                                    <form action="" method="POST">
                                        <div class="row">
                                            <div class="col-xs-4 ol-sm-4 col-md-4 col-lg-4">
                                                <?php 
                                                    $sqkm = mysqli_query($koneksi, "SELECT * FROM satuan_kkm");
                                                    $ray = array();
                                                    while ($d = mysqli_fetch_array($sqkm)) {
                                                        $ray[] = array(
                                                            "satuan_p" => $d['satuan_p'],
                                                            "p_interval" => $d['p_interval'],
                                                            "sa" => $d['sa'],
                                                            "sb" => $d['sb'],
                                                            "ba" => $d['ba'],
                                                            "bb" => $d['bb'],
                                                            "ca" => $d['ca'],
                                                            "cb" => $d['cb'],
                                                            "pa" => $d['pa'],
                                                            "pb" => $d['pb']
                                                        );
                                                    }
                                                    ?>
                                                <div class="form-group form-float">
                                                    <div class="form-line">
                                                        <label class="">SATUAN KKM</label>
                                                        <input onkeyup="satuankkm();" type="text" class="form-control" name="satuan_kkm" id="satuan_kkm" required value="<?= $ray[0]['satuan_p']; ?>">
                                                    </div>
                                                </div>
                                                <div class="form-group form-float" hidden>
                                                    <div class="form-line">
                                                        <label class="">PANJANG INTERVAL</label>
                                                        <input readonly type="text" class="form-control" name="panjang_interval" id="panjang_interval" required value="<?= $ray[0]['p_interval']; ?>">
                                                    </div>
                                                </div>
                                                <div class="form-group form-float">
                                                    <button class="btn bg-indigo" name="simpan" type="submit">Simpan</button>
                                                </div>
                                            </div>
                                            <div class="col-xs-8 ol-sm-8 col-md-8 col-lg-8">
                                                <div class="table table-responsive">
                                                    <table class="table table-hover">
                                                        <tr>
                                                            <th><label>SANGAT BAIK</label></th>
                                                            <td><input type="text" name="sa" id="sa" value="<?= $ray[0]['sa']; ?>" readonly></td>
                                                            <td>s.d.</td>
                                                            <td><input type="text" name="sb" id="sb" value="<?= $ray[0]['sb']; ?>" readonly></td>
                                                        </tr>
                                                        <tr>
                                                            <th><label>BAIK</label></th>
                                                            <td><input type="text" name="ba" id="ba" value="<?= $ray[0]['ba']; ?>" readonly></td>
                                                            <td>s.d.</td>
                                                            <td><input type="text" name="bb" id="bb" value="<?= $ray[0]['bb']; ?>" readonly></td>
                                                        </tr>
                                                        <tr>
                                                            <th><label>CUKUP</label></th>
                                                            <td><input type="text" name="ca" id="ca" value="<?= $ray[0]['ca']; ?>" readonly></td>
                                                            <td>s.d.</td>
                                                            <td><input type="text" name="cb" id="cb" value="<?= $ray[0]['cb']; ?>" readonly></td>
                                                        </tr>
                                                        <tr>
                                                            <th><label>PERLU BIMBINGAN</label></th>
                                                            <td><input type="text" name="pa" id="pa" value="<?= $ray[0]['pa']; ?>" readonly></td>
                                                            <td>s.d.</td>
                                                            <td><input type="text" name="pb" id="pb" value="<?= $ray[0]['pb']; ?>" readonly></td>
                                                        </tr>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                    </div>
                                
                            </div>

                        </div>
                    </div>

<!-- KKM Pengetahuan -->
<div class="card">
    <div class="header bg-indigo">
        <h2>KKM Pengetahuan</h2>
        <small>Table ini bisa diabaikan</small>
    </div>
    <div class="body">
        <form action="" method="POST">
            <div class="row">
                <div class="col-md-4">
                    <select name="data_kkm">
                        <?php 
                        $query_mtk = mysqli_query($koneksi, "SELECT y.id_mapel, singkat_mapel FROM roles_mapel X INNER JOIN mapel Y ON y.id_mapel = x.id_mapel WHERE id_kelas ='".$dtsq1['id_kelas']."' AND id_semester = '".$dtsq2['id_semester']."' GROUP BY y.id_mapel");
                        while ($dt_mtk = mysqli_fetch_array($query_mtk)) {
                            echo "<option value=".$dt_mtk['id_mapel'].">".$dt_mtk['singkat_mapel'].", ".$dt_mtk['id_mapel']."</option>";
                        }
                        ?>
                    </select>
                </div>
                <div class="col-md-6">
                    <input type="submit" name="ambil_data" class="btn bg-indigo" value="Ambil">
                </div>
            </div>
        </form>
        <hr>
        <div class="table table-responsive">
            <table class="table table-hover">
                <thead>
                    
                </thead>
                <tbody>
        <?php 
        if (isset($_POST['ambil_data'])) {
            $dt_kkm = $_POST['data_kkm'];

            $query_k = mysqli_query($koneksi, "SELECT y.id_mapel,nomor_kd, y.id_kelas, y.id_semester ,pengetahuan , keterampilan , @rang := 100 - pengetahuan AS rang, @interv := IF(pengetahuan='','',ROUND(@rang/3)) AS interv, @sbaik := IF(pengetahuan='','',pengetahuan+(@interv*3)) AS sbaik, @baik := IF(pengetahuan='','',pengetahuan+(@interv*2)) AS baik, @cbaik := IF(pengetahuan='','',pengetahuan+@interv) AS cbaik, @pbimbingan := IF(pengetahuan='','',pengetahuan) AS pbimbingan FROM mapel X INNER JOIN kd_pengetahuan Y ON y.id_mapel = x.id_mapel WHERE y.id_mapel = '".$dt_kkm."' AND id_kelas = '".$dtsq1['id_kelas']."' AND id_semester = '".$dtsq2['id_semester']."'");
            while ($query_kkm = mysqli_fetch_array($query_k)) { ?>
                <tr>
                    <td><?= $query_kkm['id_mapel']; ?></td>
                    <td><?= $query_kkm['id_kelas']; ?></td>
                    <td><?= $query_kkm['id_semester']; ?></td>
                    <td><?= $query_kkm['nomor_kd']; ?></td>
                    <td><?= $query_kkm['pengetahuan']; ?></td>
                    <td><?= $query_kkm['rang']; ?></td>
                    <td><?= $query_kkm['interv']; ?></td>
                    <td><?= $query_kkm['sbaik']; ?></td>
                    <td><?= $query_kkm['baik']; ?></td>
                    <td><?= $query_kkm['cbaik']; ?></td>
                    <td><?= $query_kkm['pbimbingan']; ?></td>
                </tr>
            <?php }
        }else{
            $query_km = mysqli_query($koneksi, "SELECT y.id_mapel,nomor_kd, y.id_kelas, y.id_semester ,pengetahuan , keterampilan , @rang := 100 - pengetahuan AS rang, @interv := IF(pengetahuan='','',ROUND(@rang/3)) AS interv, @sbaik := IF(pengetahuan='','',pengetahuan+(@interv*3)) AS sbaik, @baik := IF(pengetahuan='','',pengetahuan+(@interv*2)) AS baik, @cbaik := IF(pengetahuan='','',pengetahuan+@interv) AS cbaik, @pbimbingan := IF(pengetahuan='','',pengetahuan) AS pbimbingan FROM mapel X INNER JOIN kd_pengetahuan Y ON y.id_mapel = x.id_mapel WHERE y.id_mapel = 'MPL02' AND id_kelas = '".$dtsq1['id_kelas']."' AND id_semester = '".$dtsq2['id_semester']."'");
            while ($dt_km = mysqli_fetch_array($query_km)) { ?>
                <tr>
                    <td><?= $dt_km['id_mapel']; ?></td>
                    <td><?= $dt_km['id_kelas']; ?></td>
                    <td><?= $dt_km['id_semester']; ?></td>
                    <td><?= $dt_km['nomor_kd']; ?></td>
                    <td><?= $dt_km['pengetahuan']; ?></td>
                    <td><?= $dt_km['rang']; ?></td>
                    <td><?= $dt_km['interv']; ?></td>
                    <td><?= $dt_km['sbaik']; ?></td>
                    <td><?= $dt_km['baik']; ?></td>
                    <td><?= $dt_km['cbaik']; ?></td>
                    <td><?= $dt_km['pbimbingan']; ?></td>
                </tr>
            <?php }
        }
        ?>
                </tbody>
            </table>
        </div>
    </div>
</div>

<!-- KKM Keterampilan -->
<div class="card">
    <div class="header bg-indigo">
        <h2>KKM Keterampilan</h2>
        <small>Table ini bisa diabaikan</small>
    </div>
    <div class="body">
        <form action="" method="POST">
            <div class="row">
                <div class="col-md-4">
                    <select name="data_kkm">
                        <?php 
                        $query_mtk = mysqli_query($koneksi, "SELECT y.id_mapel, singkat_mapel, x.id_kelas, x.id_semester FROM roles_mapel X INNER JOIN mapel Y ON y.id_mapel = x.id_mapel WHERE id_kelas ='".$dtsq1['id_kelas']."' AND id_semester = '".$dtsq2['id_semester']."' GROUP BY y.id_mapel");
                        while ($dt_mtk = mysqli_fetch_array($query_mtk)) {
                            echo "<option value=".$dt_mtk['id_mapel'].">".$dt_mtk['singkat_mapel'].", ".$dt_mtk['id_mapel']."</option>";
                        }
                        ?>
                    </select>
                </div>
                <div class="col-md-6">
                    <input type="submit" name="ambil_data" class="btn bg-indigo" value="Ambil">
                </div>
            </div>
        </form>
        <hr>
        <div class="table table-responsive">
            <table class="table table-hover">
                <thead>
                    
                </thead>
                <tbody>
        <?php 
        if (isset($_POST['ambil_data'])) {
            $dt_kkm = $_POST['data_kkm'];

            $query_kmm = mysqli_query($koneksi, "SELECT y.id_mapel,nomor_kd, y.id_kelas, y.id_semester ,pengetahuan , keterampilan , @rang := 100 - keterampilan AS rang, @interv := IF(keterampilan='','',ROUND(@rang/3)) AS interv, @sbaik := IF(keterampilan='','',keterampilan+(@interv*3)) AS sbaik, @baik := IF(keterampilan='','',keterampilan+(@interv*2)) AS baik, @cbaik := IF(keterampilan='','',keterampilan+@interv) AS cbaik, @pbimbingan := IF(keterampilan='','',keterampilan) AS pbimbingan FROM mapel X INNER JOIN kd_keterampilan Y ON y.id_mapel = x.id_mapel WHERE y.id_mapel = '".$dt_kkm."' AND id_kelas = '".$dtsq1['id_kelas']."' AND id_semester = '".$dtsq2['id_semester']."'");
            while ($query_kk = mysqli_fetch_array($query_kmm)) { ?>
                <tr>
                    <td><?= $query_kk['id_mapel']; ?></td>
                    <td><?= $query_kk['id_kelas']; ?></td>
                    <td><?= $query_kk['id_semester']; ?></td>
                    <td><?= $query_kk['nomor_kd']; ?></td>
                    <td><?= $query_kk['keterampilan']; ?></td>
                    <td><?= $query_kk['rang']; ?></td>
                    <td><?= $query_kk['interv']; ?></td>
                    <td><?= $query_kk['sbaik']; ?></td>
                    <td><?= $query_kk['baik']; ?></td>
                    <td><?= $query_kk['cbaik']; ?></td>
                    <td><?= $query_kk['pbimbingan']; ?></td>
                </tr>
            <?php }
        }else{
            $query_mm = mysqli_query($koneksi, "SELECT y.id_mapel,nomor_kd, y.id_kelas, y.id_semester ,pengetahuan , keterampilan , @rang := 100 - keterampilan AS rang, @interv := IF(keterampilan='','',ROUND(@rang/3)) AS interv, @sbaik := IF(keterampilan='','',keterampilan+(@interv*3)) AS sbaik, @baik := IF(keterampilan='','',keterampilan+(@interv*2)) AS baik, @cbaik := IF(keterampilan='','',keterampilan+@interv) AS cbaik, @pbimbingan := IF(keterampilan='','',keterampilan) AS pbimbingan FROM mapel X INNER JOIN kd_keterampilan Y ON y.id_mapel = x.id_mapel WHERE y.id_mapel = 'MPL02' AND id_kelas = '".$dtsq1['id_kelas']."' AND id_semester = '".$dtsq2['id_semester']."'");
            while ($dt_m = mysqli_fetch_array($query_mm)) { ?>
                <tr>
                    <td><?= $dt_m['id_mapel']; ?></td>
                    <td><?= $dt_m['id_kelas']; ?></td>
                    <td><?= $dt_m['id_semester']; ?></td>
                    <td><?= $dt_m['nomor_kd']; ?></td>
                    <td><?= $dt_m['keterampilan']; ?></td>
                    <td><?= $dt_m['rang']; ?></td>
                    <td><?= $dt_m['interv']; ?></td>
                    <td><?= $dt_m['sbaik']; ?></td>
                    <td><?= $dt_m['baik']; ?></td>
                    <td><?= $dt_m['cbaik']; ?></td>
                    <td><?= $dt_m['pbimbingan']; ?></td>
                </tr>
            <?php }
        }
        ?>
                </tbody>
            </table>
        </div>
    </div>
</div>


<!-- #END# Basic Examples -->

<!-- Large Size -->
            <div class="modal fade" id="defaultModal" tabindex="-1" role="dialog">
                <div class="modal-dialog modal-lg" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title" id="defaultModalLabel">TAMBAH MATA PELAJARAN / MULOK</h4>
                        </div>
                        <div class="modal-body">
                            <div class="body">
                                <form action="proses/proses_ambil_kkm.php" method="POST">
                                    <div class="form-group form-float">
                                    <div class="form-line">
                                        <input type="text" name="id_kelas" class="form-control" value="<?= $dtsq1['id_kelas']; ?>" readonly>
                                    </div>
                                </div>
                                <div class="form-group form-float">
                                    <div class="form-line">
                                        <input type="text" name="id_semester" class="form-control" value="<?= $dtsq2['id_semester']; ?>" readonly>
                                    </div>
                                </div>
                                <div class="form-group form-float">
                                    <select class="form-control" name="id_mapel">
                                        <option>--PILIH--</option>
                                        <?php 
                                        $mapel = mysqli_query($koneksi, "SELECT * FROM mapel");
                                        while ($dmapel = mysqli_fetch_array($mapel)) { ?>
                                            <option value="<?= $dmapel['id_mapel']; ?>"><?= $dmapel['nama_mapel']; ?></option>";
                                        <?php }
                                        ?>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <input type="submit" class="btn bg-indigo" name="simpan_mapel" value="SIMPAN">
                                </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

<!--tema-->
            <div class="modal fade" id="defaultTema" tabindex="-1" role="dialog">
                <div class="modal-dialog modal-lg" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title" id="defaultModalLabel">INPUT TEMA</h4>
                        </div>
                        <div class="modal-body">
                            <div class="body">
                            <div class="row clearfix">
                                <div class="col-xs-12 ol-sm-12 col-md-12 col-lg-12">
                                    
                            
                                        <form id="form_validation" method="POST" action="proses/proses_tema.php">
                                            <div class="form-group form-float">
                                                <div class="form-line">
                                                    <input type="text" class="form-control" name="no" value="<?= $kd ?>" required readonly>
                                                    <label class="form-label"></label>
                                                </div>
                                            </div>
                                            <div class="form-group form-float md-4">
                                                <div class="form-line">
                                                    <input type="text" class="form-control" name="judul_tema" required>
                                                    <label class="form-label">JUDUL TEMA</label>
                                                </div>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="submit" name="submit">SIMPAN</button>
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

<!-- logic satuan kkm -->
<script type="text/javascript">
    function satuankkm() {
        <?php 
        $ti = 100; 
        $bagi = 3;
        ?>
        const satuan = document.getElementById('satuan_kkm').value;
        // const interval = document.getElementById('panjang_interval').value;
        const hasil = (<?= $ti; ?> - parseInt(satuan))/<?= $bagi; ?>;


        if (satuan == '') {
            document.getElementById('panjang_interval').value = 0; 
        }else{
            document.getElementById('panjang_interval').value = parseInt(hasil) ;
            const sa = 100 - hasil;
            const bb = sa - 1;
            const ba = sa - hasil;
            const cb = ba - 1;
            const ca = ba - hasil;
            const pb = ca - 1;
            const pa = ca - hasil;
            document.getElementById('sb').value = <?= $ti; ?>;
            document.getElementById('sa').value = parseInt(sa);
            document.getElementById('bb').value = parseInt(bb); 
            document.getElementById('ba').value = parseInt(ba);
            document.getElementById('cb').value = parseInt(cb);
            document.getElementById('ca').value = parseInt(ca);
            document.getElementById('pb').value = parseInt(pb);
            document.getElementById('pa').value = 0;



        }


    }
</script>
<?php 

if (isset($_POST['simpan'])) {
        $skkm = $_POST['satuan_kkm'];
        $pinter = $_POST['panjang_interval'];
        $sa = $_POST['sa'];
        $sb = $_POST['sb'];
        $ba = $_POST['ba'];
        $bb = $_POST['bb'];
        $ca = $_POST['ca'];
        $cb = $_POST['cb'];
        $pa = $_POST['pa'];
        $pb = $_POST['pb'];

        $query = mysqli_query($koneksi, "UPDATE satuan_kkm SET satuan_p = '".$skkm."', p_interval = '".$pinter."', sa='".$sa."', sb='".$sb."', ba='".$ba."', bb='".$bb."', ca='".$ca."', cb='".$cb."', pa='".$pa."', pb='".$pb."' WHERE id_kkm = '1'");
        if ($query) {
            echo "<script>
            alert('Data berhasil masuk');
            document.location.href = '?page=kkm';
            </script>";
        }else{
            echo "<script>
            alert('Data gagal masuk');
            document.location.href = '?page=kkm';
            </script>";
        }
    }    

?>