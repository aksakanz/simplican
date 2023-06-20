<?php
    include 'conn.php';
    
    $nim        = $_POST['nim'];
    $nama       = $_POST['nama'];
    $alamat     = $_POST['alamat'];
    $password   = $_POST['password'];
    //$role       = "admin";

    $connect->query("INSERT INTO user SET nim='$nim', nama='$nama', alamat='$alamat', password='$password', role='admin'");
?>