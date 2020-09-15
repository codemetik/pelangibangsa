<?php 
session_start();
include "connect.php";

if (isset($_SESSION['user'])) {
    header("Localhost:index.php");
}
        
        $kode = mysqli_query($koneksi, "SELECT max(id_user) AS maxCode FROM user");
        $data = mysqli_fetch_array($kode);
        $kd = $data['maxCode'];
        $no = (int) substr($kd, 3, 4);
        $no++; 
        $char = "USR";
        $kd = $char . sprintf("%04s", $no);

include "header.php";
?>

<nav class="navbar bg-indigo">
    <div class="navbar-header">
        <a class="navbar-brand" href="">PELANGI BANGSA</a>
    </div>
</nav>
<div class="container-fluid p-t-100">
    <div class="card signup-page bg-white">
                    <div class="header bg-light-blue">
                        <h2>Register</h2>
                    </div>
                    <div class="body">
                        <form id="sign_up" action="proses-sign-up.php" method="POST">
                        <div class="row">
                            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                            <div class="">
                                <div class="waves" hidden>
                                    <input type="text" class="form-control" name="id_user" value="<?php echo $kd; ?>" readonly>
                                </div>
                            </div>
                            <div class="input-group">
                                <div class="form-line">
                                    <label class="form-label" for="username">Username</label>
                                    <input type="text" class="form-control" id="username" name="username" placeholder="Username" required autofocus>
                                </div>
                            </div>
                            <div class="input-group">
                                <div class="form-line">
                                    <label class="form-label" for="email">Email</label>
                                    <input type="email" class="form-control" id="email" name="email" placeholder="Email Address" required>
                                </div>
                            </div>
                            <div class="form-group form-float">
                                                        
                                                        <div class="row clearfix">
                                                            <div class="col-md-12">
                                                                <p>
                                                                    <b>Sign Up Option :</b>
                                                                </p>
                                                                <select class="form-control show-tick" name="id_position" id="id_position">
                                                                    <?php 
                                                                    $sqli = mysqli_query($koneksi, "SELECT * FROM position WHERE id_position = 'PS04'");
                                                                    while ($dat = mysqli_fetch_array($sqli)) { ?>
                                                                        <option value="<?= $dat['id_position']; ?>"><?= $dat['name_position']; ?></option>
                                                                    <?php }
                                                                    ?>
                                                                </select>

                                                            </div>
                                                        </div>
                                    </div>
                        </div>
                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                            <div class="input-group">
                                <div class="form-line">
                                    <label class="form-label" for="password">Password</label>
                                    <input type="password" class="form-control" id="password" name="password" minlength="6" placeholder="Password" required>
                                </div>
                            </div>
                            <div class="input-group">
                                <div class="form-line">
                                    <label class="form-label" for="confirm">Passrowd Confirm</label>
                                    <input type="password" class="form-control" id="confirm" name="confirm" minlength="6" placeholder="Password Confirm" required>
                                </div>
                            </div>
                        </div>
                        </div>
                        <div class="form-group">
                                <input type="checkbox" name="terms" id="terms" class="filled-in chk-col-pink">
                                <label for="terms">I read and agree to the <a href="javascript:void(0);">terms of usage</a>.</label>
                            </div>

                            <button class="btn btn-block bg-green waves-effect" type="submit" name="submit">Sign Up</button>

                            <div class="m-t-25 m-b--5 align-center">
                                <a href="index.php">You already have a membership?</a>
                            </div>
                        </form>
                    </div>
                </div>    
</div>
<?php 
include "footer.php";
?>