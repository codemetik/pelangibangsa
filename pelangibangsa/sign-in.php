<?php 
session_start();
include "connect.php";
if (isset($_SESSION['user'])) {
    header("Location:home");
}

include "header.php";
?>
<nav class="navbar bg-indigo">
    <div class="navbar-header">
        <a class="navbar-brand" href="">PELANGI BANGSA</a>
    </div>
</nav>
<div class="container-fluid p-t-100">
    <div class="card login-page bg-white">
        <div class="header bg-light-blue">
            <h2>Login Rapor</h2>
        </div>
        <div class="body">
            <form id="sign_in" method="POST" action="proses-sign-in.php" name="fform">
                <div class="msg"></div>
                <!-- <input type="hidden" name="level" value="<?php //echo $hal; ?>">
                <input type="hidden" name="kelas" value="<?php //echo $kelas; ?>"> -->
                <div class="form-group form-float">
                    <label class="form-label">Username</label>
                    <div class="form-line">
                        <input type="text" class="form-control" name="username" id="username" placeholder="Username sesuai Level" required autofocus>
                    </div>
                </div>
                <div class="form-group form-float">
                    <label class="form-label">Password</label>
                    <div class="form-line">
                        <input type="password" class="form-control" name="password" placeholder="Password" required>
                    </div>
                </div>
                <div class="row">
                    <div class="col-xs-8 p-t-5">
                        <!--space-->
                    </div>
                    <div class="col-xs-4">
                        <button class="btn btn-block bg-indigo waves-effect" type="submit" name="submit">Log In</button>
                    </div>
                </div>
                <div class="row m-t-15 m-b--20">
                    <div class="col-xs-6">
                        <a href="sign-up.php">Register Now!</a>
                    </div>
                    <div class="col-xs-6 align-right" hidden>
                        <a href="forgot-password.html">Forgot Password?</a>
                    </div>
                </div>
            </form>
        </div>
    </div>    
</div>
<?php 
include "footer.php";
?>