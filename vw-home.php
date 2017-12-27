<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>NKOCOS</title>
<link rel="stylesheet" type="text/css" href="css/main.css"/>
<!--link rel="stylesheet" type="text/css" href="css/jquery-ui.css"/-->
<link rel="stylesheet" type="text/css" href="jquery-ui-1.11.2.custom/jquery-ui.css"/>
<link rel="stylesheet" type="text/css" href="DataTables-1.10.2/media/css/jquery.dataTables.css"/>
<link rel="stylesheet" type="text/css" href="DataTables-1.10.2/extensions/TableTools/css/dataTables.tableTools.css"/>
<link rel="stylesheet" type="text/css" href="DataTables-1.10.2/extensions/ColVis/css/dataTables.colVis.css"/>
<script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="DataTables-1.10.2/media/js/jquery.dataTables.js"></script>
<script type="text/javascript" src="DataTables-1.10.2/media/js/jquery.dataTables.columnFilter.js"></script>
<script type="text/javascript" src="DataTables-1.10.2/extensions/TableTools/js/dataTables.tableTools.js"></script>
<script type="text/javascript" src="DataTables-1.10.2/extensions/ColVis/js/dataTables.colVis.js"></script>
<script type="text/javascript" src="js/jquery-ui.js"></script>
<script type="text/javascript" src="js/jquery.cookie.js"></script>
<!-- script type="text/javascript" src="js/jquery.form.js"></script -->
<script type="text/javascript" language="javascript" class="init"></script>


</head>
<body>
	<?php
		if(file_exists('wamp_conf.xml')) {
			$GLOBALS['wamp_conf'] = simplexml_load_file('wamp_conf.xml');
		}
	?>

	<div id="navigation">
		<a href="vw-home.php"><img src="images/doctortool.ico"  border="0"></a>
		<a href="vw-home.php?opt=data">Data entry</a>
		<a href="vw-home.php?opt=report">Reports</a>
		<a href="vw-home.php?opt=admin">Administrative</a>
		<a href="vw-home.php?opt=con">Contact</a>
		<a href="vw-logout.php">Logout</a>
			<table>
				<tr>
					<td>Version <?php echo $GLOBALS['wamp_conf']->version ?></td>
				</tr>
				<tr>
					<td>Date: <?php echo $GLOBALS['wamp_conf']->date ?></td>
				</tr>
			</table>
	</div>
	
	<div id="content">
		<?php
		session_start(); 
		
		if(isset($_GET['opt'])) {
			if($_GET['opt'] == 'data') {
				include ('vw-data_entry.php');
			}
			elseif($_GET['opt'] == 'report') {
				echo '<p>Overview of all patients</p>';
				echo '<br>';
				include ('vw-table_central_registration.php');
			}
			elseif($_GET['opt'] == 'con') {
				include ('vw-contact.php');		
			}
			elseif($_GET['opt'] == 'admin') {
				include ('vw-admin.php');
			}
			
		}
		else {
			echo '<p>Welcome to my web site</p>';
				echo '<br>';
				//include ('vw-.php');
		}
		?>
	</div>	
	

</body>
</html>