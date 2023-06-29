<?php
include 'conn.php';
$event_id       = $_POST['event_id'];
$event_title    = $_POST['event_title'];
$event_desc     = $_POST['event_desc'];
$event_pos      = $_POST['event_pos'];
$event_time     = $_POST['event_time'];
$event_post_date = $_POST['event_post_date'];

$connect->query("UPDATE event SET event_title='" . $event_title . "', event_desc='" . $event_desc . "', event_pos='" . $event_pos . "', event_time='" . $event_time . "', event_post_date='" . $event_post_date . "' WHERE event_id=" . $event_id);
