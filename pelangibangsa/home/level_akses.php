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
<ul class="list">
                    <li>
                        <a href="../home">
                            <i class="material-icons col-indigo">home</i>
                            <span>Home</span>
                        </a>
                    </li>

                    <?php 
                    //START
                    /*lakukan jika posisi_level user sesuai dengan levelnya*/
                    if(($_SESSION['name_position'] === $rows[2]['name_position'])) {
                        /*jika user tidak ada akses kelas*/
                    if ((!isset($array[$users]['id_kelas']))) { ?>
                    <li>
                        <a href="javascript:void(0);" class="menu-">
                            <i class="material-icons col-indigo">warning</i>
                            <span>Anda tidak ada akses kelas</span>
                        </a>
                    </li>
                    <?php } 
                    /*jika user ada akses untuk masuk kelas sesua dengan kelasnya*/
                    else if (($array[$users]['id_kelas'] === $a)) {
                    //kelas 1 ?>
                    <li>
                        <a href="index.php?page=<?= $satu; ?>">
                            <i class="material-icons col-indigo">folder</i>
                            <span>Kelas 1</span>
                        </a>
                    </li>
                    <?php } else if (($array[$users]['id_kelas'] === $b)){
                    //kelas 2 ?>
                    <li>
                        <a href="index.php?page=<?= $dua; ?>">
                            <i class="material-icons col-indigo">folder</i>
                            <span>Kelas 2</span>
                        </a>
                    </li>
                    <?php } else if (($array[$users]['id_kelas'] === $c)){
                    //kelas 3 ?>
                    <li>
                        <a href="index.php?page=<?= $tiga; ?>">
                            <i class="material-icons col-indigo">folder</i>
                            <span>Kelas 3</span>
                        </a>
                    </li>
                    <?php } else if (($array[$users]['id_kelas'] === $d)){
                    //kelas 4 ?>
                    <li>
                        <a href="index.php?page=<?= $empat; ?>">
                            <i class="material-icons col-indigo">folder</i>
                            <span>Kelas 4</span>
                        </a>
                    </li>
                    <?php } else if (($array[$users]['id_kelas'] === $e)){
                    //kelas 5 ?>
                    <li>
                        <a href="index.php?page=<?= $lima; ?>">
                            <i class="material-icons col-indigo">folder</i>
                            <span>Kelas 5</span>
                        </a>
                    </li>
                    <?php } else if (($array[$users]['id_kelas'] === $f)){ 
                    //kelas 6 ?>
                    <li>
                        <a href="index.php?page=<?= $enam; ?>" class="menu-toggle">
                            <i class="material-icons col-indigo">folder</i>
                            <span>Kelas 6</span>
                        </a>
                    </li>
                    <?php } else { 
                    //tidak ada kelas ?>
                    <li>
                        <a href="javascript:void(0);" class="menu-toggle">
                            <i class="material-icons col-indigo">folder</i>
                            <span>Tidak ada akses</span>
                        </a>
                        <ul class="ml-menu">
                            <li>
                                <a href="?">No Akses</a>
                            </li>
                            <li>
                                <a href="?">No Akses</a>
                            </li>

                        </ul>
                    </li>
                    <?php }

                    $error = true;
                    } else if (($_SESSION['name_position'] === $rows[1]['name_position'])) {
                    ?>
                    <li>
                        <a href="index.php?page=<?= $satu; ?>">
                            <i class="material-icons col-indigo">folder</i>
                            <span>Kelas 1</span>
                        </a>
                    </li>
                    <?php //kelas 2 ?>
                    <li>
                        <a href="index.php?page=<?= $dua; ?>">
                            <i class="material-icons col-indigo">folder</i>
                            <span>Kelas 2</span>
                        </a>
                    </li>
                    <?php //kelas 3 ?>
                    <li>
                        <a href="index.php?page=<?= $tiga ?>">
                            <i class="material-icons col-indigo">folder</i>
                            <span>Kelas 3</span>
                        </a>
                    </li>
                    <?php //kelas 4 ?>
                    <li>
                        <a href="index.php?page=<?= $empat; ?>">
                            <i class="material-icons col-indigo">folder</i>
                            <span>Kelas 4</span>
                        </a>
                    </li>
                    <?php //kelas 5 ?>
                    <li>
                        <a href="index.php?page=<?= $lima; ?>">
                            <i class="material-icons col-indigo">folder</i>
                            <span>Kelas 5</span>
                        </a>
                    </li>
                    <?php //kelas 6 ?>
                    <li>
                        <a href="index.php?page=<?= $enam; ?>" class="menu-toggle">
                            <i class="material-icons col-indigo">folder</i>
                            <span>Kelas 6</span>
                        </a>
                    </li>
                    <?php
                    } else if (($_SESSION['name_position'] === $rows[0]['name_position'])) {  ?>
                    <li>
                        <a href="?page=<?= $satu; ?>">
                            <i class="material-icons col-indigo">folder</i>
                            <span class="icon">Kelas 1</span>
                        </a>

                    </li>
                    <?php //kelas 2 ?>
                    <li>
                        <a href="index.php?page=<?= $dua; ?>">
                            <i class="material-icons col-indigo">folder</i>
                            <span>Kelas 2</span>
                        </a>
                        
                    </li>
                    <?php //kelas 3 ?>
                    <li>
                        <a href="index.php?page=<?= $tiga; ?>">
                            <i class="material-icons col-indigo">folder</i>
                            <span>Kelas 3</span>
                        </a>
                        
                    </li>
                    <?php //kelas 4 ?>
                    <li>
                        <a href="index.php?page=<?= $empat; ?>">
                            <i class="material-icons col-indigo">folder</i>
                            <span>Kelas 4</span>
                        </a>
                        
                    </li>
                    <?php //kelas 5 ?>
                    <li>
                        <a href="index.php?page=<?= $lima; ?>">
                            <i class="material-icons col-indigo">folder</i>
                            <span>Kelas 5</span>
                        </a>
                        
                    </li>
                    <?php //kelas 6 ?>
                    <li>
                        <a href="index.php?page=<?= $enam; ?>">
                            <i class="material-icons col-indigo">folder</i>
                            <span>Kelas 6</span>
                        </a>
                        
                    </li>
                    <?php 
                    } else{ ?>
                    <li>
                        <a href="javascript:void(0);" class="menu">
                            <i class="material-icons col-indigo">warning</i>
                            <span>Anda tidak ada akses</span>
                        </a>
                    </li>
                    <?php }
                    ?>
                </ul>