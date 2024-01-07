<?php
session_start();
include('config_poliklinik.php');

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $nama = mysqli_real_escape_string($koneksi, $_POST['nama']);
    $alamat = mysqli_real_escape_string($koneksi, $_POST['alamat']);
    $no_ktp = mysqli_real_escape_string($koneksi, $_POST['no_ktp']);
    $no_hp = mysqli_real_escape_string($koneksi, $_POST['no_hp']);
    $password = $_POST['password'];
    $confirmPassword = $_POST['confirm_password'];

    // Check if the KTP number already exists
    $check_query = "SELECT * FROM pasien WHERE no_ktp = '$no_ktp'";
    $result = mysqli_query($koneksi, $check_query);

    if (mysqli_num_rows($result) > 0) {
        // KTP number already exists, redirect back to registration page with an error code
        header("Location:../index.php?page=register-pasien&error=6");
        exit();
    }

    // Validate input
    if (empty($nama) || empty($alamat) || empty($no_ktp) || empty($no_hp) || empty($password) || empty($confirmPassword)) {
        header("Location:../index.php?page=register-pasien&error=3");
        exit();
    }

    if ($password !== $confirmPassword) {
        header("Location:../index.php?page=register-pasien&error=4");
        exit();
    }

    // Hash the password
    $hashedPassword = password_hash($password, PASSWORD_DEFAULT);

    // ... (rest of your code)

    // Redirect after processing POST data
    header("Location:../app/pasien.php");
    exit();
} else {
    // Handle non-POST requests (optional)
    header('Location:../index.php?page=register-pasien');
    exit();
}
?>