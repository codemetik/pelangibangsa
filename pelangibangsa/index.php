<?php 
session_start();
include "connect.php";
if (!isset($_SESSION['user'])) {
    header("Location:sign-in.php");
}

if (isset($_SESSION['user'])) {
	header("Location:home");
}

?>
    