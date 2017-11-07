<!DOCTYPE html>
<?php

function runCommand($bin, $command = '', $force = true)
{
	$stream = null;
	$bin .= $force ? ' 2>&1' : '';

	$descriptorSpec = array
	(
			0 => array('pipe', 'r'),
			1 => array('pipe', 'w')
	);

	$process = proc_open($bin, $descriptorSpec, $pipes);

	if (is_resource($process))
	{
		fwrite($pipes[0], $command);
		fclose($pipes[0]);

		$stream = stream_get_contents($pipes[1]);
		fclose($pipes[1]);

		proc_close($process);
	}

	return $stream;
}

if(isset($_POST['backupRestore']))
{

	error_reporting('E_ALL ^ E_NOTICE');

	include 'ctl-db_connection.php';
	$username = $sql_details['user'];
	$password = $sql_details['pass'];
	$databasename = $sql_details['db'];
	$backupRestore = $_POST['backupRestore'];
	$mysql_path = $GLOBALS['wamp_conf']->mysql_path;
	$target_path = getcwd() . '/tmp/';
	$outputfilename = '';

	if ($backupRestore == 'backup'){
		$data = $_POST['data'];
		$now = str_replace(":", "", date("Y-m-d_H:i:s"));
		$outputfilename = $target_path . $databasename . '_' . $now . '.sql';
		//$outputfilename = str_replace(" ", "-", $outputfilename);

		//Dump the MySQL database
		//$result = exec('mysqldump -u '. $username .' -p'. $password .' '. $databasename .' > '. $outputfilename, $output, $return_val); c:/wamp/www/ebola_test/tmp/
		$stream = runCommand($mysql_path . 	'mysqldump --defaults-extra-file='.getcwd().'/config.cnf --add-drop-table --routines  -r ' . $outputfilename . ' ' . $databasename);

		if($stream != NULL) {
			//if($return_val != 0) { //Something went wrong
			//$er='There was an error when trying to backup the database ('.$return_val.'): ' . $output[1];
			$er='There was an error when trying to backup the database : ' . $stream;
		}
		else {
			$outputfilename;
			if (!file_exists($outputfilename)) {
				$er='There was an error when trying to backup the database : file cannot be created';
			}
			else {

				header('Content-Description: File Transfer');
				header('Content-Type: application/octet-stream');
				header('Content-Disposition: attachment; filename='.basename($outputfilename));
				header('Content-Transfer-Encoding: binary');
				header('Expires: 0');
				header('Cache-Control: must-revalidate, post-check=0, pre-check=0');
				header('Pragma: public');
				header('Content-Length: ' . filesize($outputfilename));
				ob_clean();
				flush();
				readfile($outputfilename);
				ignore_user_abort(true);
				//After download remove the file from server
				unlink($outputfilename);
			}
		}
	}
	else{//Restore the database

		//$target_path = getcwd();
		$databasefilename = $_FILES["databasefile"]["name"];

		//Upload the database file to current working directory
		move_uploaded_file($_FILES["databasefile"]["tmp_name"], $target_path . '/' . $databasefilename);

		//Restore the database
		//$stream = runCommand($mysql_path. 'mysql -u '. $username .' -p'. $password .' '. $databasename .' < '. $databasefilename);
		$stream = runCommand($mysql_path. "mysql --defaults-extra-file=".getcwd()."/config.cnf " . $databasename . " < " . $target_path . '/' . $databasefilename);
		if($stream != NULL) {
			//exec($mysql_path. 'mysql -u '. $username .' -p'. $password .' '. $databasename .' < '. $databasefilename);
			$er='There was an error when trying to restore from backup : ' . $stream;
		}

		//Remove the file from server
		unlink($target_path . '/' . $databasefilename);
		$er='<div id="er_green">Database successfully restored</div>';
	}
}
?>
<style>
</style>
<html>
    <head>
        <title>MySQL database backup</title>
        <script type="text/javascript">
            $(document).ready(function() {
            	$(function() {
            	    $( "#radio" ).buttonset();
            	  });
                $(".restoreFile").hide();
            });
            function checkParameters(){
            }
            function showHide(id){
                if (id == "backup"){
                    $(".backupRadio").show();
                    $(".restoreFile").hide();
                }
                else{
                    $(".backupRadio").hide();
                    $(".restoreFile").show();
                }
            }
        </script>
    </head>
    <body>
    	<h2>MySQL database backup</h2>
		
		<div id="er"><?php if(isset($er) && $er != '') echo $er; else echo '<div id="er_bl">In this dialog you can backup or restore your database for support and safety reasons.</div>'; ?></div>
    	
        <form action=# method="post" enctype="multipart/form-data">
        <table>
            <tr>
                <td style="padding-bottom:30px; width:200px; height: 30px;">
			        <div id="radio">
						<input type="radio" name="backupRestore" id="backup" value="backup" checked="true" onclick="showHide(this.id);" />
			        	<label for="backup" >Backup</label>
				    	<input type="radio" name="backupRestore" id="restore" value="restore" onclick="showHide(this.id);" />
			        	<label for="restore" >Restore</label>
				 	</div>
                </td>
                <td style="padding-bottom:30px;"><input class="restoreFile" type="file" name="databasefile" /></td>
            </tr>
        </table>
        <input type="submit" name="submit" value="Submit"/>
        </form>
    </body>   
</html>
		
			