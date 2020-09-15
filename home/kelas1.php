				<div class="card login-page bg-light-blue">
                    <div class="body">
                            <div class="col-xl-12"><h3><?= $_GET['page']; ?></h3></div>
                            <form action="dashboard/index" method="post">
                            	<input type="text" name="kelas" value="<?= $_GET['page']; ?>" hidden>
                                                <div class="row clearfix p-t-30">
                                                    <div class="col-sm-12">

                                                        <select class="form-control show-tick" name="semester">
                                                        	<?php 
                                                        	$sql = mysqli_query($koneksi, "SELECT * FROM semester");
                                                        	while ($sql_sm = mysqli_fetch_array($sql)) { ?>
                                                        		<option value="<?= $sql_sm['semester']; ?>"><?= $sql_sm['semester']; ?></option>
                                                        	<?php }
                                                        	?>
                                                        </select>

                                                    </div>
                                                </div>
                                            
                            
                            <div class="row p-t-30">
                                <div class="col-xs-4 p-t-5">
                                    <!--space-->
                                </div>
                                <div class="col-xs-4">
                                    <button class="btn btn-block bg-indigo waves-effect" type="submit" name="submit">GO ></button>
                                </div>
                            </div>
                            </form>
                    </div>
                </div>
<?php 

?>