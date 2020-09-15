<div class="row">
                <div class="col-xs-12 col-sm-12">
                    <div class="card">
                        <div class="body">
                            <div>
                                <ul class="nav nav-tabs" role="tablist">
                                    <!-- <li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">Home</a></li> -->
                                    <li role="presentation" class="active"><a href="#profile_settings" aria-controls="settings" role="tab" data-toggle="tab">Profile</a></li>
                                    <li role="presentation"><a href="#change_password_settings" aria-controls="settings" role="tab" data-toggle="tab">Ubah Password</a></li>
                                </ul>

                                <div class="tab-content">
                                    <!-- For Home Message -->
                                    <?php 
                                    include "../connect.php";
                                    $sql_user = mysqli_query($koneksi, "SELECT * FROM user WHERE id_user ='".$_SESSION['id_user']."'");
                                    $data_user = mysqli_fetch_array($sql_user);
                                    $join_posisi = mysqli_query($koneksi, "SELECT * FROM USER X 
                                        INNER JOIN POSITION Y ON Y.id_position = X.id_position WHERE id_user = '".$_SESSION['id_user']."'");
                                    $data_join = mysqli_fetch_array($join_posisi);
                                    ?>
                                    <!-- <div role="tabpanel" class="tab-pane fade in active" id="home">
                                        <div class="panel panel-default panel-post">
                                            <div class="panel-heading">
                                                <div class="media">
                                                    <div class="media-left">
                                                        <a href="#">
                                                            <img src="../images/user-lg.jpg" />
                                                        </a>
                                                    </div>
                                                    <div class="media-body">
                                                        <h4 class="media-heading">
                                                            <a href="#"><?= $_SESSION['user']; ?></a>
                                                        </h4>
                                                        Shared publicly - 26 Oct 2018
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="panel-body">
                                                <div class="post">
                                                    <div class="post-heading">
                                                        <p>Postingan media antar guru  <a href="#">#small</a> bits of <a href="#">#berbagi information</a>.dan tetap semangat.</p>
                                                    </div>
                                                    <div class="post-content">
                                                        
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="panel-footer">
                                                <ul>
                                                    <li>
                                                        <a href="#">
                                                            <i class="material-icons">thumb_up</i>
                                                            <span>12 Likes</span>
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <a href="#">
                                                            <i class="material-icons">comment</i>
                                                            <span>5 Comments</span>
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <a href="#">
                                                            <i class="material-icons">share</i>
                                                            <span>Share</span>
                                                        </a>
                                                    </li>
                                                </ul>

                                                <div class="form-group">
                                                    <div class="form-line">
                                                        <input type="text" class="form-control" placeholder="Type a comment" />
                                                    </div>
                                                </div>
                                            </div>
                                        </div>                                        
                                    </div> -->
                                    <!-- For user -->
                                    <div role="tabpanel" class="tab-pane fade in active" id="profile_settings">
                                        <form class="form-horizontal" method="post" action="dashboard/proses/proses_edit_xuser.php">
                                            <div class="form-group">
                                                <label for="NameSurname" class="col-sm-2 control-label">ID User</label>
                                                <div class="col-sm-10">
                                                    <div class="form-line">
                                                        <input type="text" class="form-control" id="id_user" name="id_user" placeholder="ID user" value="<?= $data_user['id_user']; ?>" required readonly>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="NameSurname" class="col-sm-2 control-label">username</label>
                                                <div class="col-sm-10">
                                                    <div class="form-line">
                                                        <input type="text" class="form-control" id="username" name="username" placeholder="Username" value="<?= $data_user['username']; ?>" required>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="NameSurname" class="col-sm-2 control-label">Nama Depan</label>
                                                <div class="col-sm-10">
                                                    <div class="form-line">
                                                        <input type="text" class="form-control" id="nama_depan" name="nama_depan" placeholder="Nama depan" value="<?= $data_user['nama_depan']; ?>" required>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="NameSurname" class="col-sm-2 control-label">Nama Belakang</label>
                                                <div class="col-sm-10">
                                                    <div class="form-line">
                                                        <input type="text" class="form-control" id="nama_belakang" name="nama_belakang" placeholder="Nama belakang" value="<?= $data_user['nama_belakang']; ?>" required>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- <div class="form-group">
                                                <label for="Email" class="col-sm-2 control-label">NIP</label>
                                                <div class="col-sm-10">
                                                    <div class="form-line">
                                                        <input type="text" class="form-control" id="nip" name="nip" placeholder="nip" value="<?= $data_user['nip']; ?>">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="Email" class="col-sm-2 control-label">NIY</label>
                                                <div class="col-sm-10">
                                                    <div class="form-line">
                                                        <input type="text" class="form-control" id="niy" name="niy" placeholder="niy" value="<?= $data_user['niy']; ?>">
                                                    </div>
                                                </div>
                                            </div> -->
                                            <div class="form-group">
                                                <label for="Email" class="col-sm-2 control-label">NUPTK</label>
                                                <div class="col-sm-10">
                                                    <div class="form-line">
                                                        <input type="text" class="form-control" id="nuptk" name="nuptk" placeholder="nuptk" value="<?= $data_user['nuptk']; ?>">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="Email" class="col-sm-2 control-label">Tempat Lahir</label>
                                                <div class="col-sm-10">
                                                    <div class="form-line">
                                                        <input type="text" class="form-control" id="tempat_lahir" name="tempat_lahir" value="<?= $data_user['tempat_lahir']; ?>" required>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="Email" class="col-sm-2 control-label">Tanggal Lahir</label>
                                                <div class="row clearfix">
                                                    <div class="col-md-4">
                                                    <input type="date" class="form-control" id="tanggal_lahir" name="tanggal_lahir" value="<?= $data_user['tanggal_lahir']; ?>">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="Email" class="col-sm-2 control-label">Alamat</label>
                                                <div class="col-sm-10">
                                                    <div class="form-line">
                                                        <input type="alamat" class="form-control" id="alamat" name="alamat" placeholder="alamat" value="<?= $data_user['alamat']; ?>" required>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="Email" class="col-sm-2 control-label">Email</label>
                                                <div class="col-sm-10">
                                                    <div class="form-line">
                                                        <input type="email" class="form-control" id="email" name="email" placeholder="Email" value="<?= $data_user['email']; ?>" required>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="InputSkills" class="col-sm-2 control-label">Position</label>

                                                <div class="col-sm-10">
                                                    <div class="form-line">
                                                        <input type="text" class="form-control" id="name_position" name="name_position" placeholder="Posisi" value="<?= $data_join['name_position']; ?>" readonly>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="col-sm-offset-2 col-sm-10">
                                                    <button type="submit" class="btn btn-danger" name="simpan">Simpan Perubahan</button>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                    <!-- For password -->
                                    <div role="tabpanel" class="tab-pane fade in" id="change_password_settings">
                                        <form class="form-horizontal" method="POST" action="dashboard/proses/proses_edit_pwd_xuser.php">
                                            <div class="form-group" hidden>
                                                <label for="NameSurname" class="col-sm-2 control-label">ID User</label>
                                                <div class="col-sm-10">
                                                    <div class="form-line">
                                                        <input type="text" class="form-control" id="id_user" name="id_user" placeholder="ID user" value="<?= $data_user['id_user']; ?>" required readonly>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="NewPassword" class="col-sm-3 control-label">Password baru</label>
                                                <div class="col-sm-9">
                                                    <div class="form-line">
                                                        <input type="password" class="form-control" id="newpassword" name="newpassword" placeholder="New Password" required>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="NewPasswordConfirm" class="col-sm-3 control-label">Password baru (Confirm)</label>
                                                <div class="col-sm-9">
                                                    <div class="form-line">
                                                        <input type="password" class="form-control" id="newpasswordconfirm" name="newpasswordconfirm" placeholder="New Password (Confirm)" required>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <div class="col-sm-offset-3 col-sm-9">
                                                    <button type="submit" class="btn btn-danger" name="simpan_pwd">Simpan Perubahan</button>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>