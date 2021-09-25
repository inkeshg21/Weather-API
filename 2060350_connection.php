<?php
//Student Id = 2060350 
//Student Name = Inkesh Gharti
$hostname = "localhost";
$database = "weather";
$username = "weatherAPI";
$password = "weatherAPI";

$connection = new mysqli($hostname, $username, $password, $database);
if ($connection->connect_errno) {
    die("<h1>Connection Failed</h1><p>$connection->connect_error</p>");
}
?>
