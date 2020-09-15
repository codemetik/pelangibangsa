<?php 
include "../connect.php";

if (isset($_GET['hapus'])) {
	$id_mapel = $_GET['hapus'];
	$id_kelas = $_GET['idkelas'];
	$id_semester = $_GET['idsm'];

?>
<div class="card login-page">
	<div class="body">
		<div class="header">
			<h2>MASUKAN PASSWORD ADMIN UNTUK LANJUT PROSES HAPUS MAPEL</h2>
		</div>
		<form action="" method="POST">
			<div class="form-group form-float">
				<div class="form-line">
					<input type="text" name="user" class="form-control">
				</div>
			</div>
			<div class="form-group form-float">
				<div class="form-line">
					<input type="password" name="password" class="form-control">
				</div>
			</div>
			<div hidden>
				<input type="text" name="id_mapel" value="<?= $id_mapel; ?>">
				<input type="" name="id_kelas" value="<?= $id_kelas; ?>">
				<input type="" name="id_semester" value="<?= $id_semester; ?>">
			</div>
			<input type="submit" name="admin" value="Lanjut Proses Hapus" class="btn bg-indigo">
			<a href="?page=hapus_mapel" class="btn bg-indigo">CENCEL</a>
		</form>
	</div>
</div>
<?php 
}
?>
<?php 
if (isset($_POST['admin'])) {
		$user = $_POST['user'];
		$pass = md5($_POST['password']);
		$id_mapel = $_POST['id_mapel'];
		$id_kelas = $_POST['id_kelas'];
		$id_semester = $_POST['id_semester'];

		$confirm = mysqli_query($koneksi,"SELECT * FROM USER WHERE username = '".$user."' AND password = '".$pass."' AND id_position = 'PS01' ");
		$cek = mysqli_num_rows($confirm);
		if ($cek > 0) { 
			$del = mysqli_query($koneksi, "DELETE FROM roles_mapel WHERE id_kelas = '".$id_kelas."' AND id_semester ='".$id_semester."' AND id_mapel = '".$id_mapel."'");
			if ($del) {
				echo "<script>
				alert('Data Mapel dengan ID $id_mapel Berhasil di hapus');
				document.location.href = 'admin.php?page=hapus_mapel';
				</script>";
			}else{
				echo "<script>
				alert('Data Mapel Gagal di hapus');
				document.location.href = 'admin.php?page=hapus_mapel';
				</script>";
			}

		}else{
			echo "<script>
			alert('Password anda salah');
			document.location.href = 'admin.php?page=hapus_mapel';
			</script>";
		}

	}
?>