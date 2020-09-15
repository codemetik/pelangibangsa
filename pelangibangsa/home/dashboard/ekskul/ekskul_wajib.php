<nav aria-label="breadcrumb m-0">
  <ol class="breadcrumb">
    <li class="breadcrumb-item"><a href="../dashboard">Dashboard</a></li>
    <li class="breadcrumb-item"><a href="javascript:void(0);" class="menu-toggle">Data umum</a></li>
    <li class="breadcrumb-item active" aria-current="page"><i><b>ekp</b></i></li>
    <li class="breadcrumb-item active" aria-current="page"><i><b>detail ekskul</b></i></li>
  </ol>
</nav>
<!-- Basic Examples -->
<div class="card">
	<div class="header">
		<h2>
            EKSKUL WAJIB
            <small>Pilih muatan Ekskul.</small>
        </h2>
	</div>
	<div class="body">
		<form action="ekskul/proses_wajib.php" method="POST">
	        <div class="form-group form-float">
	            <div class="form-line">
	            	<label class="form-label"><b>Ekskul Wajib</b></label>
	                <input type="text" name="ekskul" value="<?= $data['kegiatan']; ?>" class="form-control" readonly>
	            </div>
	        </div>
            <div class="row">
            <?php 

            $query = mysqli_query($koneksi, "SELECT * FROM tb_muatan_nilai where id_ekstra = 'EKS001'");
            while($data = mysqli_fetch_array($query)){
                $array[] = array(
                    'id_muatan' => $data['id_muatan'],
                    'id_ekstra' => $data['id_ekstra'],
                    'teknik_muatan' => $data['teknik_muatan']
                 );
            }
            $isi = count($array);
            $pcs = 0;
            $no=1;
            for ($i=$pcs; $i < $isi; $i++) {?>
                <div class="col-xs-3 col-md-3 col-lg-3">
                   <div class="form-group form-float">
                        <div class="form-line">
                            <label><?= $no++; ?></label>
                            <div hidden>
                            <input type="text" name="id_muatan[]" value="<?= $array[$i]['id_muatan']; ?>" class="form-control">    
                            </div>
                            <input type="text" name="teknik_muatan[]" value="<?= $array[$i]['teknik_muatan']; ?>" class="form-control">
                        </div>
                    </div>
               </div>
            <?php  }
            ?>
            </div>
	        <br>
	        <button type="submit" name="simpan" class="btn bg-indigo m-t-15 waves-effect" >SIMPAN</button>
	    </form>
	</div>
</div>

<!-- <div class="col-md-3">
                <p>
                    <b>Beberapa Muatan Nilai </b>
                </p>
                <select class="form-control show-tick" data-show-subtext="true">
                    <?php 
                    $query = mysqli_query($koneksi, "SELECT * FROM tb_muatan_nilai WHERE id_ekstra = 'EKS001'");
                    $no = 1;
                    while ($dtq = mysqli_fetch_array($query)) {?>
                        <option value="<?= $dtq['kegiatan']; ?>" data-subtext="<?= $no++; ?>">
                            <?= $dtq['teknik_muatan']; ?></option>
                    <?php }
                    ?>
                </select>
            </div>-->