<?php
include 'conn.php';
$queryResult = $connect->query("SELECT * FROM user WHERE role='mahasiswa'");

$result = array();

while ($fetchData = $queryResult->fetch_assoc()) {
    $result[] = $fetchData;
}

echo json_encode($result);
