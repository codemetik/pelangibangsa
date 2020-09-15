<?php 
        $kdkelas = mysqli_query($koneksi, "SELECT max(id_master) AS maxCode FROM master_level");
        $hasil1 = mysqli_fetch_array($kdkelas);
        $has1 = $hasil1['maxCode'];
        $nOkd1 = (int) substr($has1, 3, 7);
        $nOkd1++; 
        $kdc1 = "MST";
        $id_master = $kdc1 . sprintf("%07s", $nOkd1);

$level = mysqli_query($koneksi, "SELECT * FROM master_level");
while ($lvar = mysqli_fetch_array($level)) {
    $isiar[] = array(
        "id_user" => $lvar['id_user']
    );
}
//menampilkan hanya id_position PS03
$dt_level = mysqli_query($koneksi, "SELECT id_position FROM master_level GROUP BY id_position");
$dtevel = mysqli_fetch_array($dt_level);

//menampilkan id_user yang hanya id_position nya PS03
$sqluser = mysqli_query($koneksi, "SELECT * FROM user WHERE id_position = '".$dtevel['id_position']."'");
while ($dtuser = mysqli_fetch_array($sqluser)) {
    $isiusr[] = array(
        "id_user" => $dtuser['id_user'],
        "username" => $dtuser['username'],
        "nama" => $dtuser['nama_depan'] . " " . $dtuser['nama_belakang']
    );
}

$mstlv = count($isiusr);


?>

<nav aria-label="breadcrumb m-0">
  <ol class="breadcrumb">
    <li class="breadcrumb-item"><a href="admin">Dashboard</a></li>
    <li class="breadcrumb-item"><a href="javascript:void(0);" class="menu-toggle">User</a></li>
    <li class="breadcrumb-item active" aria-current="page"><i><b>Tambah akses guru ke kelas</b></i></li>
  </ol>
</nav>

<div class="card bg-white">
    <div class="header bg-indigo">
        <h2>Add Akses Guru Kelas</h2>
    </div>
<div class="body">
    <form id="sign_up" action="" method="POST">
        <div class="msg"><b>Add Akses kelas</b></div>
        <div class="form-group">
            <div class="form-line">
                <input type="text" class="form-control" name="id_master" value="<?php echo $id_master; ?>" readonly>
            </div>
        </div>
    <div class="row">
    <div class="col-lg-6 col-md-4 col-sm-4 col-xs-4">
        <div class="form-group form-float">
            <div class="row clearfix">
                <div class="col-md-8">
                    <p>
                        <b>Pilih user :</b>
                    </p>
                    <select class="form-control show-tick" name="id_user" id="id_user" onchange="user();">
                        <option value="">Pilih</option>
                        <?php 
                        for ($i=0; $i < $mstlv ; $i++) { 
                            if (isset($isiusr[$i]['id_user']) != isset($isiar[$i]['id_user'])) { ?>
                                <option value="<?= $isiusr[$i]['id_user']; ?>"><?= $isiusr[$i]['nama']; ?></option>
                            <?php }
                        }
                        ?>
                    </select>
                </div>
            </div>
        </div>
        <div class="form-group form-float">
            <div class="row clearfix">
                <div class="col-md-8">
                    <p>
                        <b>Beri akses ke :</b>
                    </p>
                    <select class="form-control show-tick" name="id_kelas" id="id_kelas">
                        <option value="">Pilih</option>
                        <?php 
                        $kelas = mysqli_query($koneksi, "SELECT * FROM kelas");
                        while ($dtkls = mysqli_fetch_array($kelas)) { ?>
                            <option value="<?= $dtkls['id_kelas']; ?>"><?= $dtkls['kelas']; ?></option>
                        <?php }
                        ?>
                    </select>
                </div>
            </div>
        </div>
        <div class="input-group">
            <span class="input-group-addon">
                <i class="material-icons"></i>
            </span>
            <div class="form-line">
                <label>ID USER</label>
                <input type="text" class="form-control" name="id_us" id="id_us" required readonly>
            </div>
        </div>
        <div class="form-group">
            <input type="submit" class="btn bg-indigo" name="submit">
            <a href="?" class="btn bg-indigo">Cencel</a>
        </div>
    </div>
    </div>
    </form>
</div>
</div>

                <script type="text/javascript">
                    function user(){
                        var us = document.getElementById('id_user').value;
                        document.getElementById('id_us').value = us;
                    }

                </script>
<?php 
if (isset($_POST['submit'])) {
    $id_mstr = $_POST['id_master'];
    $id_user = $_POST['id_user'];
    $id_kelas = $_POST['id_kelas'];

    //ambil id_position di input id_us;
    $id_position = $_POST['id_us'];
    $kelas = mysqli_query($koneksi, "SELECT * FROM user WHERE id_user = '".$id_position."'");
    $dkls = mysqli_fetch_array($kelas);
    $sqlinsert = mysqli_query($koneksi, "INSERT INTO master_level(id_master, id_user, id_position, id_kelas) VALUES('".$id_mstr."','".$id_user."','".$dkls['id_position']."','".$id_kelas."')");
    if ($sqlinsert) {
        echo "<script>
        alert('Data berhasil di simpan');
        document.location.href = '?';
        </script>";
    }else{
        echo "<script>
        alert('Data gagal di simpan');
        document.location.href = '?';
        </script>";
    }
}
?>