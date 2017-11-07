<?php
session_start(); // Starting Session

if(isset($_POST['myusername']) && isset($_POST['mypassword']))
{
	// username and password sent from form
	$myusername=$_POST['myusername'];
	$mypassword=$_POST['mypassword'];

	if($myusername == "" || $mypassword == "") {
		if($myusername == "")
			$er='Please introduce a valid username';
		else
			$er='Please introduce a valid password';
	}
	else {
		include "ctl-db_connection.php";

		$tbl_name = "loginuser";

		// To protect MySQL injection (more detail about MySQL injection)
		$myusername = stripslashes($myusername);
		$mypassword = sha1($mypassword);
		//$myusername = mysqli_real_escape_string($myusername);
		//$mypassword = mysqli_real_escape_string($mypassword);
		$sql="SELECT * FROM $tbl_name WHERE username='".$myusername."' and password='".$mypassword."';";
		$result=mysqli_query($connection, $sql);

		// Mysql_num_row is counting table row
		$count=mysqli_num_rows($result);

		// If result matched $myusername and $mypassword, table row must be 1 row
		//git try
		if($count==1){

			// Register $myusername and redirect to file "login_success.php"
			$_SESSION['login_user']=$username; // Initializing Session
			header("location: vw-home.php");
		}
		else {
			$er= "Wrong Username or Password";
		}
	}
}
?>
<style>
body {
	padding: 0; /* Gets rid of the automatic padding */
	margin: 0;	/*	on HTML documents */
    font-family: 'trebuchet MS', 'Lucida sans', Arial;
    font-size: 14px;
    color: #444;
}
div.simpleContContent {
    border-color: #D2D2CC;
    border-style: solid;
    border-width: 1px;
    margin-left: auto;
    margin-right: auto;
    margin-top: 100px;
    margin-bottom: 25px;
    padding-bottom: 15px;
    width: 400px;
    text-align: center;
}

#er {
    color: #F00;
    text-align: center;
    margin-left: auto;
    margin-right: auto;
    font-size: 15px;
}
</style>

<div id="simpleContContent" class="simpleContContent" style="opacity: 1;">
<table width="300" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#FFFFFF">
<tr>
<form name="form1" method="post" action="#">
<td>
<table width="100%" border="0" cellpadding="3" cellspacing="1" bgcolor="#FFFFFF">
<tr>
<td colspan="2" style="padding-bottom:15px; padding-top:15px;"><strong>Welcome to NKOZI Hospital Information Management tool</strong></td>
</tr>
<tr>
<td colspan="2" align="center" style="padding-bottom:15px"><img src="images/doctortool2.jpg"></td>
</tr>
<tr>
<td width="78">Username</td>
<td width="294"><input name="myusername" type="text" id="myusername"></td>
</tr>
<tr>
<td>Password</td>
<td><input name="mypassword" type="password" id="mypassword"></td>
</tr>
<tr>
<td>&nbsp;</td>
<td><input type="submit" name="Submit" value="Login"></td>
</tr>
</table>
</td>
</form>
</tr>
</table>
</div>
<div id="er" color="444"><?php if(isset($er) && $er != '') echo $er; ?></div>
	
			