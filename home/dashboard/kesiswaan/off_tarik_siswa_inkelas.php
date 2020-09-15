<?php
                if (isset($_POST['ambil'])) { 
                    $id_sis = $_POST['nis'];
                    $dt = mysqli_query($koneksi, "SELECT * FROM data_siswa WHERE nama_siswa LIKE '%".$id_sis."%'");
                    $dat = mysqli_fetch_array($dt);
                    $d = $dat['id_siswa'];
                    $dnam = $dat['nama_siswa'];
                ?>
                <div class="form-group form-float">
                    <!-- <div class="form-line">
                        <label class="form-label">Nama siswa</label>
                        <input type="text" name="nama_siswa" class="form-control" value="<?= $dnam; ?>" required readonly>
                    </div> -->
                <input type="checkbox" id="md_checkbox_1" name="nama_siswa" value="<?= $dnam; ?>" class="chk-col-red" checked/>
                <label for="md_checkbox_1"><?= $dnam; ?></label>
                </div>
                <div class="form-group form-float">
                    <div class="form-line">
                        <label class="form-label">ID siswa :</label>
                            <input type="text" class="form-control" name="id_siswa" value="<?= $d; ?>" required readonly>
                    </div>
                <input type="checkbox" id="md_checkbox_2" name="id_siswa" value="<?= $d; ?>" class="chk-col-red" checked/>
                <label for="md_checkbox_2"><?= $d; ?></label>
                </div>
                <div class="form-group form-float">
                    <div class="form-line">
                        <label class="form-label">ID level siswa :</label>
                        <input type="text" class="form-control" name="id_level_siswa" value="<?= $datalv; ?>" required readonly>
                    </div>
                </div>
                <div class="form-group form-float">
                    <label class="form-label">Kelas :</label>
                    <select class="form-control show-tick" name="id_kelas">
                        <?php 
                        $sqlkelas = mysqli_query($koneksi, "SELECT * FROM kelas");
                        while ($dtkls = mysqli_fetch_array($sqlkelas)) {?>
                            <option value="<?= $dtkls['id_kelas']; ?>"><?= $dtkls['kelas']; ?></option>
                        <?php } ?>
                    </select>
                </div>
                <div class="form-group form-float" hidden>
                    <div class="form-line">
                        <label class="form-label">ID user :</label>
                        <input type="text" class="form-control" name="id_user" value="<?= $_SESSION['id_user']; ?>" required readonly>
                    </div>
                </div>
                <div class="form-group form-float">
                    <input type="submit" class="btn bg-indigo" name="simpan" value="Simpan" onclick="return confirm('Apakah anda yakin ingin menyimpan siswa ke kelas ini?')">
                </div>
                <?php }
                ?>