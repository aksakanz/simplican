<?php
include 'conn.php';
$jobv_title     = $_POST['jobv_title'];
$jobv_desc      = $_POST['jobv_desc'];
$jobv_date      = $_POST['jobv_date'];
$jobv_post_date = $_POST['jobv_post_date'];
$job_post_by    = $_POST['job_post_by'];
$jobv_pos       = $_POST['jobv_pos'];

$connect->query("INSERT INTO job SET jobv_title='$jobv_title', jobv_desc='$jobv_desc', jobv_date='$jobv_date', jobv_post_date='$jobv_post_date', job_post_by='$job_post_by', jobv_pos='$jobv_pos'");
