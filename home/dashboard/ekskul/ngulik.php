<?php 
	
	$hostname = 'localhost';
	$username = 'root';
	$password = '';
	$database = 'pelangibangsa';

	$koneksi = mysqli_connect($hostname, $username, $password, $database)
	or die('Could not connect: ' . mysqli_connect_error());


$query = mysqli_query($koneksi, "SELECT * FROM tb_muatan_nilai where id_ekstra = 'EKS001'");
while($data = mysqli_fetch_array($query)){
	$array[] = array(
		'id_muatan' => $data['id_muatan'],
		'id_ekstra' => $data['id_ekstra'],
		'teknik_muatan' => $data['teknik_muatan']
	 );
}

?>
<form action="" method="POST">
	<?php 
	$isi = count($array);
	$pcs = 0;
	for ($i=$pcs; $i < $isi; $i++) {?>
		<input id="id" type="text" name="idka[]" value="<?= $array[$i]['id_muatan']; ?>">
		<input id="id" type="text" name="teknik[]" value="<?= $array[$i]['teknik_muatan']; ?>">
	<?php }
	?>
	<input type="submit" name="simpan">
</form>
<?php 
if (isset($_POST['simpan'])) {
	$idk = $_POST['idka'];
	$var = $_POST['teknik'];
	$ini = count($idk);
	for ($i=0; $i < $ini ; $i++) { 
		$query = mysqli_query($koneksi, "UPDATE tb_muatan_nilai SET teknik_muatan = '$var[$i]' where id_muatan = '$idk[$i]'");
		if ($query) {
			echo "<script>
				alert('Data berhasil di rubah');
				document.location.href = 'ngulik.php';
			</script>";
		}
	}
}
?>