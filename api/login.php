<?php
    include 'conn.php';
    $nim        = $_POST['nim'];
    $password   = $_POST['password'];

    $login  = $connect->query("SELECT * FROM user WHERE nim='".$nim."' AND password='".$password."'");
    $result = array();

    while($fetchData = $login->fetch_assoc()){
        $result[]   = $fetchData;
    }

    echo json_encode($result);
?>