<?php
    include 'conn.php';
    $event_id         = $_POST['event_id'];
    
	//$connect->query("DELETE user WHERE id=".$id);
    $data = mysqli_query($connect, "DELETE FROM event WHERE event_id='$event_id'");
