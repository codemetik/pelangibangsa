<?php 
include "../connect.php";
$sql = mysqli_query($koneksi, "SELECT * FROM user WHERE id_user = '".$_GET['id']."'");
$dtuser = mysqli_fetch_array($sql);
$sqlpos = mysqli_query($koneksi, "SELECT * FROM position WHERE id_position = '".$dtuser['id_position']."'");
$dtpos = mysqli_fetch_array($sqlpos);
?>
<div class="card">
	<div class="header bg-indigo">
		<h2><?= $dtuser['username']." Sebagai : ".$dtpos['name_position']; ?></h2>
	</div>
	<div class="body">
        <form action="dashboard/proses/proses_edit_user.php" method="POST">
		<div class="row">
			<div class="col-lg-6 col-md-12 col-sm-12 col-xs-12">
				<div class="form-group form-float">
                    <div class="form-line">
                        <input type="text" class="form-control" name="id_user" value="<?= $dtuser['id_user']; ?>" required readonly>
                        <label class="form-label">ID User</label>
                    </div>
                </div>
                <div class="form-group form-float">
                    <div class="form-line">
                        <input type="text" class="form-control" name="username" value="<?= $dtuser['username']; ?>" required>
                        <label class="form-label">Username</label>
                    </div>
                </div>
                <div class="form-group form-float">
                    <div class="form-line">
                        <input type="text" class="form-control" name="nama_depan" value="<?= $dtuser['nama_depan']; ?>" required>
                        <label class="form-label">Nama depan</label>
                    </div>
                </div>
                <div class="form-group form-float">
                    <div class="form-line">
                        <input type="text" class="form-control" name="nama_belakang" value="<?= $dtuser['nama_belakang']; ?>" required>
                        <label class="form-label">Nama belakang</label>
                    </div>
                </div>
                <!-- <div class="form-group form-float">
                    <div class="form-line">
                        <input type="text" class="form-control" name="nip" value="<?= $dtuser['nip']; ?>">
                        <label class="form-label">NIP</label>
                    </div>
                </div>
                <div class="form-group form-float">
                    <div class="form-line">
                        <input type="text" class="form-control" name="niy" value="<?= $dtuser['niy']; ?>">
                        <label class="form-label">NIY</label>
                    </div>
                </div> -->
                <div class="form-group form-float">
                    <div class="form-line">
                        <input type="text" class="form-control" name="nuptk" value="<?= $dtuser['nuptk']; ?>">
                        <label class="form-label">NUPTK</label>
                    </div>
                </div>
                <div class="form-group form-float">
                    <div class="form-line">
                        <input type="text" class="form-control" name="tempat_lahir" value="<?= $dtuser['tempat_lahir']; ?>" required>
                        <label class="form-label">Tempat lahir</label>
                    </div>
                </div>
                <div class="form-group form-float">
                    <div class="form-line">
                        <input type="date" class="form-control" name="tanggal_lahir" value="<?= $dtuser['tanggal_lahir']; ?>" required>
                        <label class="form-label">Tanggal lahir</label>
                    </div>
                </div>
                <div class="form-group form-float">
                    <div class="form-line">
                        <input type="text" class="form-control" name="alamat" value="<?= $dtuser['alamat']; ?>" required>
                        <label class="form-label">Alamat</label>
                    </div>
                </div>
            </div>
			<div class="col-lg-6 col-md-12 col-sm-12 col-xs-12">
                <div class="form-group form-float">
                    <div class="form-line">
                        <input type="text" class="form-control" name="email" value="<?= $dtuser['email']; ?>" required>
                        <label class="form-label">Email</label>
                    </div>
                </div>
                <div class="form-group form-float">
                    <div class="form-line">
                        <input type="password" class="form-control" name="password" value="<?= $dtuser['password']; ?>" required>
                        <label class="form-label">Password</label>
                    </div>
                </div>
                <div class="form-group form-float">
                    <div class="form-line">
                        <input type="password" class="form-control" name="confirm_password" value="<?= $dtuser['confirm_password']; ?>" required>
                        <label class="form-label">Confirm password</label>
                    </div>
                </div>
                <div class="form-group form-float">
                    <div class="row clearfix">
                        <div class="col-md-4">
                            <p>
                                <b>Update Level</b>
                            </p>
                            <select class="form-control show-tick" name="id_position">
                                <?php 
                                $sqlposition = mysqli_query($koneksi, "SELECT * FROM position");
                                while ($dtpos = mysqli_fetch_array($sqlposition)) { 
                                    if ($dtpos['id_position'] == $dtuser['id_position']) {
                                        $data = 'selected';
                                    }else{
                                        $data = '';
                                    }
                                    ?>
                                    <option value="<?= $dtpos['id_position']; ?>" <?= $data; ?>><?= $dtpos['name_position']; ?></option>
                                <?php }
                                ?>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="form-group form-float">
                    <input type="submit" class="btn bg-indigo" name="simpan" value="simpan">
                    <a href="?page=data_user" class="btn bg-indigo">Cencel</a>
                </div>
			</div>
		</div>
        </form>
	</div>
</div>