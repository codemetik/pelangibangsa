<?php 

        
        $kode = mysqli_query($koneksi, "SELECT max(id_user) AS maxCode FROM user");
        $data = mysqli_fetch_array($kode);
        $kd = $data['maxCode'];
        $no = (int) substr($kd, 3, 4);
        $no++; 
        $char = "USR";
        $kd = $char . sprintf("%04s", $no);

include "../header.php";
?>

<nav aria-label="breadcrumb m-0">
  <ol class="breadcrumb">
    <li class="breadcrumb-item"><a href="admin">Dashboard</a></li>
    <li class="breadcrumb-item"><a href="javascript:void(0);" class="menu-toggle">User</a></li>
    <li class="breadcrumb-item active" aria-current="page"><i><b>Tambah user</b></i></li>
  </ol>
</nav>

                <!-- <div class="logo">
                    Semester <b>Ganjil</b>
                        
                </div> -->
                <div class="card bg-white">
                    <div class="header bg-indigo">
                        <h2>Add User</h2>
                    </div>
                    <div class="body">
                        <form id="sign_up" action="dashboard/proses/proses_signup_from_admin.php" method="POST">
                            <div class="msg">Register</div>
                            <div class="form-group">
                                <div class="form-line">
                                    <input type="text" class="form-control" name="id_user" value="<?php echo $kd; ?>" readonly>
                                </div>
                            </div>
                        <div class="row">
                        <div class="col-lg-6 col-md-4 col-sm-4 col-xs-4">
                            <div class="input-group">
                                <span class="input-group-addon">
                                    <i class="material-icons"></i>
                                </span>
                                <div class="form-line">
                                    <input type="text" class="form-control" name="username" placeholder="Username" required autofocus>
                                </div>
                            </div>
                            <div class="input-group">
                                <span class="input-group-addon">
                                    <i class="material-icons"></i>
                                </span>
                                <div class="form-line">
                                    <input type="text" class="form-control" name="nama_depan" placeholder="Nama depan" required>
                                </div>
                            </div>
                            <div class="input-group">
                                <span class="input-group-addon">
                                    <i class="material-icons"></i>
                                </span>
                                <div class="form-line">
                                    <input type="text" class="form-control" name="nama_belakang" placeholder="Nama belakang" required>
                                </div>
                            </div>
                            <!-- <div class="input-group">
                                <span class="input-group-addon">
                                    <i class="material-icons"></i>
                                </span>
                                <div class="form-line">
                                    <input type="text" class="form-control" name="nip" placeholder="NIP">
                                </div>
                            </div>
                            <div class="input-group">
                                <span class="input-group-addon">
                                    <i class="material-icons"></i>
                                </span>
                                <div class="form-line">
                                    <input type="text" class="form-control" name="niy" placeholder="NIY">
                                </div>
                            </div> -->
                            <div class="input-group">
                                <span class="input-group-addon">
                                    <i class="material-icons"></i>
                                </span>
                                <div class="form-line">
                                    <input type="text" class="form-control" name="nuptk" placeholder="NUPTK">
                                </div>
                            </div>
                            <div class="input-group">
                                <span class="input-group-addon">
                                    <i class="material-icons"></i>
                                </span>
                                <div class="form-line">
                                    <input type="text" class="form-control" name="tempat_lahir" placeholder="Tempat Lahir" required>
                                </div>
                            </div>
                            <div class="input-group">
                                <span class="input-group-addon">
                                    <i class="material-icons"></i>
                                </span>
                                <div class="row clearfix">
                                    <div class="col-md-8">
                                        <input type="date" class="form-control" name="tanggal_lahir" placeholder="Tanggal Lahir" required>
                                    </div>
                                </div>
                            </div>
                            <div class="input-group">
                                <span class="input-group-addon">
                                    <i class="material-icons"></i>
                                </span>
                                <div class="form-line">
                                    <input type="text" class="form-control" name="alamat" placeholder="Alamat" required>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-4 col-sm-4 col-xs-4">
                            <div class="input-group">
                                <span class="input-group-addon">
                                    <i class="material-icons"></i>
                                </span>
                                <div class="form-line">
                                    <input type="email" class="form-control" name="email" placeholder="Email Address" required>
                                </div>
                            </div>
                            <div class="input-group">
                                <span class="input-group-addon">
                                    <i class="material-icons"></i>
                                </span>
                                <div class="form-line">
                                    <input type="password" class="form-control" name="password" minlength="6" placeholder="Password" required>
                                </div>
                            </div>
                            <div class="input-group">
                                <span class="input-group-addon">
                                    <i class="material-icons"></i>
                                </span>
                                <div class="form-line">
                                    <input type="password" class="form-control" name="confirm" minlength="6" placeholder="Confirm Password" required>
                                </div>
                            </div>
                            <div class="form-group form-float">
                                                        
                                                        <div class="row clearfix">
                                                            <div class="col-md-8">
                                                                <p>
                                                                    <b>Pilih Level :</b>
                                                                </p>
                                                                <select class="form-control show-tick" name="id_position" id="id_position" onchange="price();">
                                                                    <?php 
                                                                    $sqlpos = mysqli_query($koneksi, "SELECT * FROM position");
                                                                    while ($data = mysqli_fetch_array($sqlpos)) { ?>
                                                                        <option value="<?= $data['id_position']; ?>"><?= $data['name_position']; ?></option>
                                                                    <?php }
                                                                    ?>
                                                                </select>
                                                            </div>
                                                        </div>
                                    </div>
                            <!-- <div class="form-group form-float">
                                <div class="row clearfix">
                                    <div class="col-md-8" id="demo">
                                       
                                    </div>
                                </div>
                            </div> -->
                            <div class="form-group">
                                <input type="checkbox" name="terms" id="terms" class="filled-in chk-col-pink">
                                <label for="terms">I read and agree to the <a href="javascript:void(0);">terms of usage</a>.</label>
                            </div>

                            <button class="btn bg-indigo" type="submit" name="submit">SIGN UP</button>
                        </div>
                        </div>
                        </form>
                    </div>
                </div>

<!-- <script type="text/javascript">
   function price() {
    var gkelas = document.getElementById("id_position").value;
     // var gkelas = document.getElementById("demo").value=tes;

     if (gkelas == 'PS03') {
        var tampil = `<p><b>Kelas Option :</b></p><select class='form-control show-tick bg-grey' name='id_kelas'><?php $sqlkelas = mysqli_query($koneksi, 'SELECT * FROM kelas');
                    while ($dtkls = mysqli_fetch_array($sqlkelas)) { 
                        echo "<option value='".$dtkls['id_kelas']."'>".$dtkls['kelas']."</option>";
                    } ?></select>`;
        document.getElementById("demo").innerHTML= tampil;
     }else if(gkelas == 'PS01'){
        // var tampil1 = `<div class="form-line">
        //                     <input type="email" class="form-control" name="id_kelas" placeholder="ALl Kelas" required>
        //                 </div>`;
        document.getElementById("demo").innerHTML= '<b>All Kelas</b>';
     }else if(gkelas == 'PS02'){
        // var tampil1 = `<div class="form-line">
        //                     <input type="email" class="form-control" name="id_kelas" placeholder="ALl Kelas" required>
        //                 </div>`;
        document.getElementById("demo").innerHTML= '<b>All Kelas</b>';
     }else if(gkelas == 'PS04'){
        document.getElementById("demo").innerHTML= '<b>No Kelas</b>';
     }
}
</script> -->
<?php
include "../footer.php";
?>