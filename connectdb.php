<?php
    function connectdb()
    {
        $servername = "localhost";
        $username1 = "root";
        $password1 = "";
        $dbname = "reviews";
        global $conn;
        // Create connection
        $conn = new mysqli($servername, $username1, $password1 , $dbname );
        // Check connection
        if ($conn->connect_error) {
            die("Connection failed: " . $conn->connect_error);
        }        
    }

?>