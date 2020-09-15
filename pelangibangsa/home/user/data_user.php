<nav aria-label="breadcrumb m-0">
  <ol class="breadcrumb">
    <li class="breadcrumb-item"><a href="admin">Dashboard</a></li>
    <li class="breadcrumb-item"><a href="javascript:void(0);" class="menu-toggle">User</a></li>
    <li class="breadcrumb-item active" aria-current="page"><i><b>Data user</b></i></li>
  </ol>
</nav>

<div class="card bg-white">
    <div class="header bg-indigo">
        <h2>
            Data user
        </h2>
    </div>
    <div class="body">
        <div class="">
                                <div class="table">
                                    <table class="table table-sm dataTable">
                                    <tr>
                                        <form action="" method="POST">
                                            <th>
                                            </th>
                                          <th>
                                              <div class="form-group form-float">
                                                <div class="form-line ">
                                                      <input type="text" name="table_search" class="form-control float-right" placeholder="Search">
                                                </div>
                                            </div>
                                          </th>
                                          <th>
                                              <div class="form-group form-float">
                                                <div class="input-group-append">
                                                      <button type="submit" name="search"><i class="material-icons">search</i></button>
                                                </div>
                                            </div>
                                          </th>
                                          <th>
                                              <a href="admin?page=data_user"><button type="button">Refresh</button></a>
                                          </th>
                                        </form>
                                    </tr>
                                    </table>
                                </div>
                            </div>
                            <div class="table">
                                        <div class="table-responsive">
                                        <table id="mainTable" class="table table-sm table-striped table-hover dataTable js-exportable font-11">
                                            <thead>
                                                <tr>
                                                <?php
                                                $data1 = array('NO' ,'USERNAME', 'NAMA LENGKAP','NUPTK','POSITION',  'KELAS','EMAIL','ID USER', 'ACTION');
                                                foreach ($data1 as $key) {
                                                    echo "<th class='bg-light-blue'>".$key."</th>";
                                                
                                                 } ?>
                                                </tr>
                                            </thead>
                                            <?php 
                                            if (isset($_POST['search'])) {
                                                $cari = $_POST['table_search'];
                                                $sql = mysqli_query($koneksi, "SELECT DISTINCT id_user, username, nama_depan, nama_belakang,nuptk ,x.id_position AS id_pos, name_position, email FROM user x INNER JOIN POSITION y ON y.id_position = x.id_position WHERE username LIKE '%".$cari."%' OR email LIKE '%".$cari."%' OR name_position LIKE '".$cari."'");
                                            }else{

                                            $sql = mysqli_query($koneksi, "SELECT DISTINCT id_user, username, nama_depan, nama_belakang,nuptk, x.id_position AS id_pos, name_position, email FROM user x INNER JOIN POSITION y ON y.id_position = x.id_position");
                                            }
                                            $cek = mysqli_num_rows($sql);
                                            $no =1;
                                            while ($data = mysqli_fetch_array($sql)) { ?>
                                                <tbody>
                                                <tr>
                                                    <td><?= $no++; ?></td>
                                                    <td><?= $data['username']; ?></td>
                                                    <td><?= $data['nama_depan']." ".$data['nama_belakang']; ?></td>
                                                    <!-- <td><?= $data['nip']; ?></td>
                                                    <td><?= $data['niy']; ?></td> -->
                                                    <td><?= $data['nuptk']; ?></td>
                                                    <td><?= $data['name_position']; ?></td>
                                                    <td><?php 
                                                    $sqlkls = mysqli_query($koneksi, "SELECT x.id_position, name_position ,x.id_kelas, kelas FROM master_level x INNER JOIN USER y ON y.id_user = x.id_user INNER JOIN kelas z ON z.id_kelas = x.id_kelas INNER JOIN POSITION a ON a.id_position = x.id_position WHERE x.id_user = '".$data['id_user']."' ORDER BY x.id_master");
                                                    while ($dtkls = mysqli_fetch_array($sqlkls)) {
                                                        if ($data['id_pos'] == $dtkls['id_position']) {
                                                            echo $dtkls['kelas'];
                                                        }
                                                    }
                                                    ?></td>
                                                    <td><?= $data['email']; ?></td>
                                                    <td><?= $data['id_user']; ?></td>
                                                    <td>
                                                        <div class="dropdown">
                                                            <button type="submit" href="" class="btn bg-indigo" data-toggle="dropdown">
                                                                Action
                                                            </button>
                                                            <ul class="dropdown-menu pull-right">
                                                                <?php 
                                                                $grukls = mysqli_query($koneksi, "SELECT * FROM master_level GROUP BY id_position");
                                                                while($dtgr = mysqli_fetch_array($grukls)){
                                                                    if ($data['id_pos'] == $dtgr['id_position']) { ?>
                                                                <li><a href="admin.php?page=guru_kelas&id=<?= $data['id_user']; ?>">Detail</a></li>
                                                                    <?php }else{ ?>
                                                                <li><a href="admin.php?page=detail_user&id=<?= $data['id_user']; ?>">Detail</a></li>
                                                                    <?php }
                                                                }

                                                                $grukls1 = mysqli_query($koneksi, "SELECT * FROM master_level GROUP BY id_position");
                                                                while($dtgr1 = mysqli_fetch_array($grukls1)){
                                                                    if ($data['id_pos'] == $dtgr1['id_position']) { ?>
                                                                <li><a href="dashboard/delete/delete_walas.php?id=<?= $data['id_user']; ?>">Delete</a></li>
                                                                    <?php }else{ ?>
                                                                <li><a href="dashboard/delete/delete_user.php?id=<?= $data['id_user']; ?>">Delete</a></li>
                                                                    <?php }
                                                                }
                                                                ?>
                                                            </ul>
                                                        </div>
                                                    </td>

                                                </tr>
                                                </tbody>
                                            <?php }
                                            ?>
                                            <tfoot>
                                                <tr>
                                                    <?php 
                                                    foreach ($data1 as $value) { 
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