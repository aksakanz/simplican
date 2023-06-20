<?php
    include 'conn.php';
    $id         = $_POST['id'];
    
	//$connect->query("DELETE user WHERE id=".$id);
    $data = mysqli_query($connect, "DELETE FROM user WHERE id='$id'");
?>