<nav class="mt-2">
        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
          <!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
          <li class="nav-item">
            <a href="index.php?page=dashboard" class="nav-link <?php echo ($_GET['page'] == 'dashboard') ? 'active' : ''; ?>">
              <i class="nav-icon fas fa-th"></i>
              <p>
                Dashboard
              </p>
            </a>
          </li>
          <li class="nav-item">
            <a href="index.php?page=data-dokter" class="nav-link <?php echo ($_GET['page'] == 'data-dokter') ? 'active' : ''; ?>">
              <i class="nav-icon fas fa-user-md"></i>
              <p>
                Dokter
              </p>
            </a>
          </li>
          <li class="nav-item">
            <a href="index.php?page=data-pasien" class="nav-link <?php echo ($_GET['page'] == 'data-pasien') ? 'active' : ''; ?>">
              <i class="nav-icon fas fa-user-injured"></i>
              <p>
                Pasien
              </p>
            </a>
          </li>
          <li class="nav-item">
            <a href="index.php?page=kelola-poli" class="nav-link <?php echo ($_GET['page'] == 'kelola-poli') ? 'active' : ''; ?>">
              <i class="nav-icon fas fa-hospital"></i>
              <p>
                Poli
              </p>
            </a>
          </li>
          <li class="nav-item">
            <a href="index.php?page=data-obat" class="nav-link <?php echo ($_GET['page'] == 'data-obat') ? 'active' : ''; ?>">
              <i class="nav-icon fas fa-pills"></i>
              <p>
                Obat
              </p>
            </a>
          </li>
        </ul>
    </nav>