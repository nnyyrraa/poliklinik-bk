<!DOCTYPE html>
<html lang="en">
<?php
include('../conf/config_poliklinik.php');

?>

  <body class="hold-transition sidebar-mini">
    <div class="wrapper">
      <!-- Content Header (Page header) -->
      <section class="content-header">
          <div class="container-fluid">
            <div class="row mb-1">
              <div class="col-sm-6">
                <h1>Riwayat Pasien</h1>
              </div>
              <div class="col-sm-6">
                <ol class="breadcrumb float-sm-right">
                  <li class="breadcrumb-item"><a href="dokter.php">Home</a></li>
                  <li class="breadcrumb-item active">Dokter</li>
                </ol>
              </div>
            </div>
          </div><!-- /.container-fluid -->
      </section>
      <!-- Main content -->
      <section class="content-header">
        <div class="container-fluid">
          <div class="row">
            <!-- /.col -->
            <div class="col-12">
              <div class="card">
                <div class="card-header">
                  <h3 class="card-title">Daftar Riwayat Pasien</h3>
                </div>
                <!-- /.card-header -->
                <div class="card-body p-0">
                  <table class="table table-striped">
                    <thead>
                      <tr>
                        <th style="width: 10px">No</th>
                        <th style="width: 150px">Nama Pasien</th>
                        <th style="width: 200px">Alamat</th>
                        <th>No. KTP</th>
                        <th>No. Hp</th>
                        <th>No. RM</th>
                        <th>Aksi</th>
                      </tr>
                    </thead>
                    <tbody>
                      <?php
                        $query = mysqli_query($koneksi, "SELECT * FROM pasien");
                        if ($query) {
                          while ($dok = mysqli_fetch_array($query)) {
                      ?>
                            <tr>
                              <td><?php echo $dok['id']; ?></td>
                              <td><?php echo $dok['nama']; ?></td>
                              <td><?php echo $dok['alamat']; ?></td>
                              <td><?php echo $dok['no_ktp']; ?></td>
                              <td><?php echo $dok['no_hp']; ?></td>
                              <td><?php echo $dok['no_rm']; ?></td>
                              <td>
                                <button type="button" class="btn btn-info view-btn" data-id="<?php echo $dok['id']; ?>" data-toggle="modal" data-target="#modal-lg">
                                  Detail Riwayat Periksa
                                </button>
                              </td>
                            </tr>
                      <?php
                          }
                        } else {
                          // Handle query error
                          echo "Error: " . mysqli_error($koneksi);
                        }
                      ?>
                    </tbody>
                  </table>
                </div>
                <!-- /.card-body -->
              </div>
              <!-- /.card -->
            </div>
            <!-- /.col -->
          </div>
        </div>
      </section>
      <!-- /.content -->

      <!-- Detail Riwayat Pasien -->
      <div class="modal fade" id="modal-lg">
        <div class="modal-dialog modal-lg">
          <div class="modal-content">
            <div class="modal-header">
              <h4 class="modal-title">Riwayat Periksa</h4>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <form method='get' action=''>
              <div class="card-body p-0">
                <table class="table table-striped">
                  <thead>
                    <tr>
                      <th style="width: 10px">No</th>
                      <th style="width: 150px">Nama Pasien</th>
                      <th style="width: 200px">Alamat</th>
                      <th>No. KTP</th>
                      <th>No. Hp</th>
                      <th>No. RM</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <?php
                        $url = $_SERVER['REQUEST_URI'];
                        $url = explode("=", $url);
                        $id_pasien = $url[count($url)-1];

                        $id_pasien = intval($id_pasien);

                        $query = mysqli_query($koneksi, "SELECT * FROM pasien WHERE id = $id_pasien");

                        if ($query) {
                          while ($view = mysqli_fetch_array($query)) {
                      ?>
                            <td><?php echo $view['id']; ?></td>
                            <td><?php echo $view['nama']; ?></td>
                            <td><?php echo $view['alamat']; ?></td>
                            <td><?php echo $view['no_ktp']; ?></td>
                            <td><?php echo $view['no_hp']; ?></td>
                            <td><?php echo $view['no_rm']; ?></td>
                      <?php
                          }
                        } else {
                          // Handle query error
                          echo "Error: " . mysqli_error($koneksi);
                        }
                      ?>
                    </tr>
                  </tbody>
                </table>
              </div>
              <!-- /.modal-content -->
            </div>
          </form>
          <!-- /.modal-dialog -->
        </div>
      </div>

      <!-- Control Sidebar -->
      <aside class="control-sidebar control-sidebar-dark">
        <!-- Control sidebar content goes here -->
      </aside>
      <!-- /.control-sidebar -->
    </div>
    <!-- ./wrapper -->
  </body>
</html>
