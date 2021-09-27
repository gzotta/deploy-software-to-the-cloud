<?php

// Connect to database. Parameters: host, user name, password, databe's name.
$conn = mysqli_connect('bytes-pizza.cijpw8dlkuhv.us-east-1.rds.amazonaws.com', 'webuser', 'insecure_db_pw', 'bytes_pizza');

// Check connection
if (!$conn) {
    echo 'Connection error: ' . mysqli_connect_error();
}
