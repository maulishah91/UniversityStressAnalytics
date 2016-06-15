<?php

require_once('includes/keys.php');

// Create connection
$conn = mysql_connect(SERVER_NAME, USERNAME, PASSWORD);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

echo "Connected successfully";

mysql_select_db(DB_NAME);