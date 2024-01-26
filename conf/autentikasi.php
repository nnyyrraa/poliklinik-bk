<?php
session_start();
include('config_admin.php');

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $username = $_POST['username'];
    $password = $_POST['password'];

    // Validate input
    if (empty($username) || empty($password)) {
        header('Location:../index.php?page=login-admin&error=2'); // Empty input error
        exit();
    }

    if (!$password) {
        header('Location:../index.php?page=login-admin&error=1'); // Password mismatch error
        exit();
    }

    // Insert user into the database
    $query = mysqli_query($koneksi, "SELECT * FROM admin_user WHERE username='$username'");
    $user = mysqli_fetch_assoc($query);
    if (!$query) {
        die('Error: ' . mysqli_error($koneksi));
    }
    if ($user && password_verify($password, $user['password'])) {
        $_SESSION['username'] = $username;
        header("Location:../app"); // Successful login, redirect to dashboard
        exit();
    } else {
        header('Location:../index.php?page=login-admin&error=1'); // Database error
        exit();
    }
} else {
    // Handle non-POST requests (optional)
    header('Location:../index.php?page=login-admin');
    exit();
}
?>