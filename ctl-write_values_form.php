<?php

error_reporting('E_ALL ^ E_NOTICE');

/*if(isset($_POST['submit']) && !empty($_POST['submit']))
 {*/
include 'ctl-db_connection.php';
 
$CRLF = "\r\n";
 
file_put_contents("c:\wamp\logs\methode.log",
$CRLF . "------------------ New form submission ----------" , FILE_APPEND);
 
$result = 0;
foreach($_POST as $key => $value)
{
	file_put_contents("c:\wamp\logs\methode.log",
	$CRLF. "Processing.. Element = ".$key." Value = " . $value, FILE_APPEND);
	if (strstr($key, 'r_'))
	{
		//We found a value entered in a table cell!!
		$arrElements = explode("_", str_replace('r_','',$key));
		//$arrElements[0] = what  $arrElements[1] = who
		$encoded_value = $value == "" ? 'NULL' : $value;
		//if($value == "") $encoded_value = 'NULL'; else $encoded_value = $value;
		$what = $arrElements[0];
		$who = $arrElements[1];
		$when = $_POST['year'] . "wk" . $_POST['week'];
		$where = $_POST['service'];

		$find_record_query="select id from `msf`.`record` where
				what=".$what." AND who=".$who."
						AND `when`='".$when."' AND `where`='".$where."';";
		$rst_query=mysqli_query($connection, $find_record_query);
		if (!$rst_query) {
			$mysql_error = "Query failed: " . mysqli_error($connection);
			$er.=$mysql_error;
			$result = 0;
			//return false;
		}

		$row=mysqli_fetch_row($rst_query);

		file_put_contents("c:\wamp\logs\methode.log",
		$CRLF .$find_record_query . $CRLF . " ID found: " . $row[0], FILE_APPEND);

		if($row>0) //It is an update
		{
			$er.= "Updating record";
			$update_query =  "UPDATE `msf`.`record`	SET ";
			$update_query .= " `value` = " 	. $encoded_value . ",";
			$update_query .= " `upd_date` = now()";
			$update_query .= " WHERE `id` =".$row[0].";";
				
			file_put_contents("c:\wamp\logs\methode.log",
			$CRLF .$update_query, FILE_APPEND);
				
			$rst_query = mysqli_query($connection, $update_query);
			if (!$rst_query) {
				$mysql_error = "Query failed: " . mysqli_error($connection);
				$er.=$mysql_error;
				$result = 0;
				//return false;
			}
			else {
				$result = 1;
			}
		}
		elseif($encoded_value != 'NULL') { //It is a new record and it is not NULL
			// Insert values
			$er.= "Inserting record";
			$insert_query="INSERT INTO `msf`.`record`
					(`value`, `what`, `who`, `when`, `where`, `upd_date`)
					VALUES 	(".$encoded_value.",".$what.",".$who.",'".$when."','".$where."', now())";
			$rst_query = mysqli_query($connection, $insert_query);
				
			file_put_contents("c:\wamp\logs\methode.log",
			$CRLF .$insert_query, FILE_APPEND);
				
			if (!$rst_query) {
				$mysql_error = "Query failed: " . mysqli_error($connection);
				$er.=$mysql_error;
				$result = 0;
				//return false;
			}
			else {
				$result = 1;
			}
		}
	}
}
if($result) {
	$er.='Values registered successfully';
}
mysqli_close($connection);
echo json_encode(array('result' => $result, 'msg' => $er));
//}

?>