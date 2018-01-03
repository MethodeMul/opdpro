<?php
$sql_details = array(
		'user' => 'msfuser',
		'pass' => 'MSF1971azg',
		'db'   => 'msf',
		'host' => 'localhost'
);	

$connection = mysqli_connect($sql_details["host"], 
							 $sql_details["user"],
							 $sql_details["pass"],
							 $sql_details["db"]);
	
if (mysqli_connect_errno())
{
	echo "Failed to connect to MySQL: " . mysqli_connect_error();
}
	