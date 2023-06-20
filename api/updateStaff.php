<?php
    include 'conn.php';
    $id         = $_POST['id'];
    $nim        = $_POST['nim'];
    $nama       = $_POST['nama'];
    $alamat     = $_POST['alamat'];
    $password   = $_POST['password'];
    
	$connect->query("UPDATE user SET nim='".$nim."', nama='".$nama."', alamat='".$alamat."', password='".$password."' WHERE id=". $id);
?>