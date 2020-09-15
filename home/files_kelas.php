<?php
include "../connect.php";

$position = mysqli_query($koneksi, "SELECT * FROM position");
while ($result = mysqli_fetch_array($position)) {
    $rows[] = array(
        "id_position" => $result['id_position'],
        "name_position" => $result['name_position']
    );
}

//array ambil master_level 
$query_level = mysqli_query($koneksi, "SELECT * FROM master_level");
while($data = mysqli_fetch_array($query_level)){
    $array[$data['id_user']] = array(
        "id_master" => $data['id_master'],
        "id_user" => $data['id_user'],
        "id_position" => $data['id_position'],
        "id_kelas" => $data['id_kelas']
    );
}
// $array['USR0006']['id_kelas'];

//query ambil kelas
$query = mysqli_query($koneksi, "SELECT * FROM kelas");

//ambil data kelas
while ($data1 = mysqli_fetch_array($query)) {
    $row[] = array(
        "id_kelas" => $data1['id_kelas'],
        "kelas" => $data1['kelas']
    );
}
$a = $row[0]['id_kelas'];
$b = $row[1]['id_kelas'];
$c = $row[2]['id_kelas'];
$d = $row[3]['id_kelas'];
$e = $row[4]['id_kelas'];
$f = $row[5]['id_kelas'];
// $a.", ".$b.", ".$c.", ".$d.", ".$e.", ".$f;
$satu = $row[0]['kelas'];
$dua = $row[1]['kelas'];
$tiga = $row[2]['kelas'];
$empat = $row[3]['kelas'];
$lima = $row[4]['kelas'];
$enam = $row[5]['kelas'];

//session id_user.
$_SESSION['id_user'];
$users = $_SESSION['id_user'];

//session semester ganjil genap kelas 1
$smtrganjil = "kelas1/?semester=Semester Ganjil";
$smtrgenap = "kelas1/?semester=Semester Genap";

$kelas1 = "kelas=".$a;
$kelas2 = "kelas=".$b;
$kelas3 = "kelas=".$c;
$kelas4 = "kelas=".$d;
$kelas5 = "kelas=".$e;
$kelas6 = "kelas=".$f;

$ganjil = "Semester 1";
$genap = "Semester 2";
?>
<div class="row clearfix">
<?php

/*lakukan jika posisi_level user sesuai dengan levelnya*/
                    if(($_SESSION['name_position'] === $rows[2]['name_position'])) {
                        /*jika user tidak ada akses kelas*/
                    if ((!isset($array[$users]['id_kelas']))) { ?>

                    <div class="col-lg-4 col-md-3 col-sm-6 col-xs-12">
                                <div class="info-box bg-light-blue hover-expand-effect">
                                    <div class="icon bg-indigo">
                                        <i class="material-icons">warning</i>
                                    </div>
                                    <div class="content">
                                        <div class=""><h4>Anda tidak memiliki akses kelas manapun</h4></div>
                                        <div class="number count-to" data-from="0" data-to="125" data-speed="15" data-fresh-interval="20"></div>
                                    </div>
                                </div>
                            </div>
                    <?php } 
                    /*jika user ada akses untuk masuk kelas sesua dengan kelasnya*/
                    else if (($array[$users]['id_kelas'] === $a)) {
                    //kelas 1 ?>
                    <div class="col-lg-4 col-md-3 col-sm-6 col-xs-12">
                                <div class="info-box bg-light-blue hover-expand-effect">
                                    <div class="icon bg-indigo">
                                        <a href="?page=<?= $satu; ?>"><i class="material-icons">folder</i></a>
                                    </div>
                                    <div class="content">
                                        <div class=""><h4>Kelas 1</h4></div>
                                        <div class="number count-to" data-from="0" data-to="125" data-speed="15" data-fresh-interval="20"></div>
                                    </div>
                                </div>
                            </div>
                    <?php } else if (($array[$users]['id_kelas'] === $b)){
                    //kelas 2 ?>
                    <div class="col-lg-4 col-md-3 col-sm-6 col-xs-12">
                                <a href="kelas1.php">
                                <div class="info-box bg-light-blue hover-expand-effect">
                                    <div class="icon bg-indigo">
                                        <a href="?page=<?= $dua; ?>"><i class="material-icons">folder</i></a>
                                    </div>
                                    <div class="content">
                                        <div class=""><h4>Kelas</h4></div>
                                        <div class="number count-to" data-from="0" data-to="257" data-speed="1000" data-fresh-interval="20"></div>
                                    </div>
                                </div>
                                </a>
                            </div>
                    <?php } else if (($array[$users]['id_kelas'] === $c)){
                    //kelas 3 ?>
                    <div class="col-lg-4 col-md-3 col-sm-6 col-xs-12">
                                <div class="info-box bg-light-blue hover-expand-effect">
                                    <div class="icon bg-indigo">
                                        <a href="?page=<?= $tiga; ?>"><i class="material-icons">folder</i></a>
                                    </div>
                                    <div class="content">
                                        <div class="text"><h4>Kelas 3</h4></div>
                                        <div class="number count-to" data-from="0" data-to="243" data-speed="1000" data-fresh-interval="20"></div>
                                    </div>
                                </div>
                            </div>
</div><!--tutup row clearfix 1-->
<div class="row clearfix">
                    <?php } else if (($array[$users]['id_kelas'] === $d)){
                    //kelas 4 ?>
                    <div class="col-lg-4 col-md-3 col-sm-6 col-xs-12">
                                <div class="info-box bg-light-blue hover-expand-effect">
                                    <div class="icon bg-indigo">
                                        <a href="?page=<?= $empat; ?>"><i class="material-icons">folder</i></a>
                                    </div>
                                    <div class="content">
                                        <div class="text"><h4>Kelas 4</h4></div>
                                        <div class="number count-to" data-from="0" data-to="1225" data-speed="1000" data-fresh-interval="20"></div>
                                    </div>
                                </div>
                            </div>
                    <?php } else if (($array[$users]['id_kelas'] === $e)){
                    //kelas 5 ?>
                    <div class="col-lg-4 col-md-3 col-sm-6 col-xs-12">
                                <div class="info-box bg-light-blue hover-expand-effect">
                                    <div class="icon bg-indigo">
                                        <a href="?page=<?= $lima; ?>"><i class="material-icons">folder</i></a>
                                    </div>
                                    <div class="content">
                                        <div class="text"><h4>Kelas 5</h4></div>
                                        <div class="number count-to" data-from="0" data-to="1225" data-speed="1000" data-fresh-interval="20"></div>
                                    </div>
                                </div>
                            </div>
                    <?php } else if (($array[$users]['id_kelas'] === $f)){ 
                    //kelas 6 ?>
                    <div class="col-lg-4 col-md-3 col-sm-6 col-xs-12">
                                <div class="info-box bg-light-blue hover-expand-effect">
                                    <div class="icon bg-indigo">
                                        <a href="?page=<?= $enam; ?>"><i class="material-icons">folder</i></a>
                                    </div>
                                    <div class="content">
                                        <div class="text"><h4>Kelas 6</h4></div>
                                        <div class="number count-to" data-from="0" data-to="1225" data-speed="1000" data-fresh-interval="20"></div>
                                    </div>
                                </div>
                            </div>
                    <?php } else { 
                    //tidak ada kelas ?>
                    <div class="col-lg-4 col-md-3 col-sm-6 col-xs-12">
                                <div class="info-box bg-light-blue hover-expand-effect">
                                    <div class="icon bg-indigo">
                                        <i class="material-icons">warning</i>
                                    </div>
                                    <div class="content">
                                        <div class="text"><h4>Anda tidak memilike akses ke kelas manapun</h4></div>
                                        <div class="number count-to" data-from="0" data-to="1225" data-speed="1000" data-fresh-interval="20"></div>
                                    </div>
                                </div>
                            </div>
</div> <!--tutup row clearfix 2-->
                    <?php }

                    $error = true;
                    } else if(($_SESSION['name_position'] === $rows[1]['name_position'])){ ?>
<div class="row clearfix">
                                <div class="col-lg-4 col-md-3 col-sm-6 col-xs-12">
                                    <div class="info-box bg-light-blue hover-expand-effect">
                                    <div class="icon bg-indigo">
                                        <a href="?page=<?= $satu; ?>"><i class="material-icons">folder</i></a>
                                    </div>
                                    <div class="content">
                                        <div class="text"><h4>Kelas 1</h4></div>
                                        <div class="number count-to" data-from="0" data-to="1225" data-speed="1000" data-fresh-interval="20"></div>
                                    </div>
                                </div>    
                                </div>
                                <div class="col-lg-4 col-md-3 col-sm-6 col-xs-12">
                                    <div class="info-box bg-light-blue hover-expand-effect">
                                    <div class="icon bg-indigo">
                                        <a href="?page=<?= $dua; ?>"><i class="material-icons">folder</i></a>
                                    </div>
                                    <div class="content">
                                        <div class="text"><h4>Kelas 2</h4></div>
                                        <div class="number count-to" data-from="0" data-to="1225" data-speed="1000" data-fresh-interval="20"></div>
                                    </div>
                                </div>    
                                </div>
                                <div class="col-lg-4 col-md-3 col-sm-6 col-xs-12">
                                    <div class="info-box bg-light-blue hover-expand-effect">
                                    <div class="icon bg-indigo">
                                        <a href="?page=<?= $tiga; ?>"><i class="material-icons">folder</i></a>
                                    </div>
                                    <div class="content">
                                        <div class="text"><h4>Kelas 3</h4></div>
                                        <div class="number count-to" data-from="0" data-to="1225" data-speed="1000" data-fresh-interval="20"></div>
                                    </div>
                                </div>    
                                </div>
</div>
<div class="row clearfix">
                                <div class="col-lg-4 col-md-3 col-sm-6 col-xs-12">
                                    <div class="info-box bg-light-blue hover-expand-effect">
                                    <div class="icon bg-indigo">
                                        <a href="?page=<?= $empat; ?>"><i class="material-icons">folder</i></a>
                                    </div>
                                    <div class="content">
                                        <div class="text"><h4>Kelas 4</h4></div>
                                        <div class="number count-to" data-from="0" data-to="1225" data-speed="1000" data-fresh-interval="20"></div>
                                    </div>
                                </div>    
                                </div>
                                <div class="col-lg-4 col-md-3 col-sm-6 col-xs-12">
                                    <div class="info-box bg-light-blue hover-expand-effect">
                                    <div class="icon bg-indigo">
                                        <a href="?page=<?= $lima; ?>"><i class="material-icons">folder</i></a>
                                    </div>
                                    <div class="content">
                                        <div class="text"><h4>Kelas 5</h4></div>
                                        <div class="number count-to" data-from="0" data-to="1225" data-speed="1000" data-fresh-interval="20"></div>
                                    </div>
                                </div>    
                                </div>
                                <div class="col-lg-4 col-md-3 col-sm-6 col-xs-12">
                                    <div class="info-box bg-light-blue hover-expand-effect">
                                    <div class="icon bg-indigo">
                                        <a href="?page=<?= $enam; ?>"><i class="material-icons">folder</i></a>
                                    </div>
                                    <div class="content">
                                        <div class="text"><h4>Kelas 6</h4></div>
                                        <div class="number count-to" data-from="0" data-to="1225" data-speed="1000" data-fresh-interval="20"></div>
                                    </div>
                                </div>    
                                </div>
</div>
                    <?php }else if(($_SESSION['name_position'] === $rows[0]['name_position'])){ ?>
<div class="row clearfix">
                                <div class="col-lg-4 col-md-3 col-sm-6 col-xs-12">
                                    <div class="info-box bg-light-blue hover-expand-effect">
                                    <div class="icon bg-indigo">
                                        <a href="?page=<?= $satu; ?>"><i class="material-icons">folder</i></a>
                                    </div>
                                    <div class="content">
                                        <div class="text"><h4>Kelas 1</h4></div>
                                        <div class="number count-to" data-from="0" data-to="1225" data-speed="1000" data-fresh-interval="20"></div>
                                    </div>
                                </div>    
                                </div>
                                <div class="col-lg-4 col-md-3 col-sm-6 col-xs-12">
                                    <div class="info-box bg-light-blue hover-expand-effect">
                                    <div class="icon bg-indigo">
                                        <a href="?page=<?= $dua; ?>"><i class="material-icons">folder</i></a>
                                    </div>
                                    <div class="content">
                                        <div class="text"><h4>Kelas 2</h4></div>
                                        <div class="number count-to" data-from="0" data-to="1225" data-speed="1000" data-fresh-interval="20"></div>
                                    </div>
                                </div>    
                                </div>
                                <div class="col-lg-4 col-md-3 col-sm-6 col-xs-12">
                                    <div class="info-box bg-light-blue hover-expand-effect">
                                    <div class="icon bg-indigo">
                                        <a href="?page=<?= $tiga; ?>"><i class="material-icons">folder</i></a>
                                    </div>
                                    <div class="content">
                                        <div class="text"><h4>Kelas 3</h4></div>
                                        <div class="number count-to" data-from="0" data-to="1225" data-speed="1000" data-fresh-interval="20"></div>
                                    </div>
                                </div>    
                                </div>
</div>
<div class="row clearfix">
                                <div class="col-lg-4 col-md-3 col-sm-6 col-xs-12">
                                    <div class="info-box bg-light-blue hover-expand-effect">
                                    <div class="icon bg-indigo">
                                        <a href="?page=<?= $empat; ?>"><i class="material-icons">folder</i></a>
                                    </div>
                                    <div class="content">
                                        <div class="text"><h4>Kelas 4</h4></div>
                                        <div class="number count-to" data-from="0" data-to="1225" data-speed="1000" data-fresh-interval="20"></div>
                                    </div>
                                </div>    
                                </div>
                                <div class="col-lg-4 col-md-3 col-sm-6 col-xs-12">
                                    <div class="info-box bg-light-blue hover-expand-effect">
                                    <div class="icon bg-indigo">
                                        <a href="?page=<?= $lima; ?>"><i class="material-icons">folder</i></a>
                                    </div>
                                    <div class="content">
                                        <div class="text"><h4>Kelas 5</h4></div>
                                        <div class="number count-to" data-from="0" data-to="1225" data-speed="1000" data-fresh-interval="20"></div>
                                    </div>
                                </div>    
                                </div>
                                <div class="col-lg-4 col-md-3 col-sm-6 col-xs-12">
                                    <div class="info-box bg-light-blue hover-expand-effect">
                                    <div class="icon bg-indigo">
                                        <a href="?page=<?= $enam; ?>"><i class="material-icons">folder</i></a>
                                    </div>
                                    <div class="content">
                                        <div class="text"><h4>Kelas 6</h4></div>
                                        <div class="number count-to" data-from="0" data-to="1225" data-speed="1000" data-fresh-interval="20"></div>
                                    </div>
                                </div>    
                                </div>
</div>
                    <?php } else{ ?>
                        <div class="row clearfix">
                            <div class="col-lg-4 col-md-3 col-sm-6 col-xs-12">
                                    <div class="info-box bg-light-blue hover-expand-effect">
                                    <div class="icon bg-indigo">
                                        <i class="material-icons">warning</i>
                                    </div>
                                    <div class="content">
                                        <div class="text"><h4>Anda tidak memiliki akses ke kelas manapun</h4></div>
                                        <div class="number count-to" data-from="0" data-to="1225" data-speed="1000" data-fresh-interval="20"></div>
                                    </div>
                                </div>    
                                </div>
                        </div>
                    <?php }
?>