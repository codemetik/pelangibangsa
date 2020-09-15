<?php 
$sql = mysqli_query($koneksi, "SELECT * FROM ekstrakurikuler where id_ekstra = '".$_GET['id']."'");
$data = mysqli_fetch_array($sql);


?>
<div class="card">
	<div class="header">
		<h2>Input Aspek yang dinilai Dari Ekskul = <?= $data['kegiatan']; ?></h2>
	</div>
	<div class="body">
	<form action="" method="post">
        <p>Data ID <input name="ideks[]" type="text" value="<?= $data['id_ekstra']; ?>" /></p>
        <p>Masukkan Data Muatan Nilai <input name="data[]" type="text" /></p>
    	<div id="input0"></div>
        <p><a href="javascript:action();" class="btn">Add more</a></p>
        <br>
        <input type="submit" class="btn bg-indigo" name="simpan" value="Simpan" />
    </form>
    <br>
    </div>
</div>
<script language="JavaScript" type="text/JavaScript">
        counter=0;
        function action(){
            counterNext=counter+1;
            document.getElementById("input"+counter).innerHTML = "<p>Data ID <input name='ideks[]' type='text' value='<?= $data['id_ekstra']; ?>' /></p><p>Masukkan Data Muatan Nilai <input name='data[]' type='text' /></p> <div id=\"input"+counterNext+"\"></div>";// perhatikan tanda petiknya, sama seperti pemrograman java yang lainnya
            counter++;
        }
</script>
<?php 
if (isset($_POST['simpan'])) {
	$ideks = $_POST['ideks'];
	$data = $_POST['data'];

	$isi = count($data);
	for ($i=0; $i < $isi; $i++) { 
		echo $ideks[$i]."<br>";
		echo $data[$i]."<br>";
		echo "<hr>";
        $query = mysqli_query($koneksi, "INSERT INTO tb_muatan_nilai(id_ekstra, teknik_muatan)VALUES('".$ideks[$i]."','".$data[$i]."')");
        if ($query) {
            echo "<script>
            alert('Data berhasil masuk');
            document.location.href = '?page=ekp';
            </script>";
        }else{
            echo "<script>
            alert('Data gagal masuk');
            document.location.href = '?page=ekp';
            </script>";
        }
	}
}
?>