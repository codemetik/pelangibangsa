<nav aria-label="breadcrumb m-0">
  <ol class="breadcrumb">
    <li class="breadcrumb-item"><a href="../dashboard">Dashboard</a></li>
    <li class="breadcrumb-item"><a href="javascript:void(0);" class="menu-toggle">Edit Tema</a></li>
    <li class="breadcrumb-item active" aria-current="page"><i><b>Tema KI-3</b></i></li>
  </ol>
</nav>

<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
        <div class="card">
            <div class="header bg-indigo">
                <h2>
                    Edit Tama <small>Sikap Spiritual</small>
                </h2>
                
            </div>
            <div class="body">
                <div class="table-responsive">
                    <table id="mainTable" class="table table-sm table-striped table-hover dataTable js-exportable font-14">
                        <thead>
                            <tr class="bg-light-blue">
                                <th>No</th>
                                <th>ID Spiritual</th>
                                <th>Butir Sikap</th>
                                <th>Opsi</th>
                            </tr>
                        </thead>
                        
                            <?php 
                            $i = 1;
                            $sql = mysqli_query($koneksi, "SELECT * FROM sikap_spiritual");
                            while($spiritual = mysqli_fetch_array($sql)){ ?>
                        <tbody>
                            <tr>
                                <td><?= $i++; ?></td>
                                <td><?= $spiritual['id_spiritual']; ?></td> 
                                <td><?= $spiritual['butir_sikap']; ?></td>
                                <td><a type="button" class="" data-toggle="modal" href="?page=edit_skpsp&id=<?= $spiritual['id_spiritual']; ?>"><button class="btn bg-indigo">Detail</button></a></td>
                            </tr>
                        </tbody>
                            <?php }
                            ?>
                            
                    </table>
                </div>    
            </div>
    </div>
</div>