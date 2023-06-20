<?php
    include 'conn.php';
    $id         = $_POST['id'];
    $alamat     = $_POST['alamat'];
    $password   = $_POST['password'];
    $pekerjaan  = $_POST['pekerjaan'];
    
	$connect->query("UPDATE user SET alamat='".$alamat."', password='".$password."', pekerjaan='".$pekerjaan."' WHERE id=". $id);
?>