<?php

/*
 * DataTables example server-side processing script.
 *
 * Please note that this script is intentionally extremely simply to show how
 * server-side processing can be implemented, and probably shouldn't be used as
 * the basis for a large complex system. It is suitable for simple use cases as
 * for learning.
 *
 * See http://datatables.net/usage/server-side for full details on the server-
 * side processing requirements of DataTables.
 *
 * @license MIT - http://datatables.net/license_mit
 */

/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 * Easy set variables
 */

//Disable PHP warnings
ini_set('display_errors', 2);

// DB table to use
$table_ajax = $_GET['table'];
$where = NULL;

switch ($table_ajax) {
	//case -> To add other tables to the system create a new case
	case 'patient_full_emr':
		$primaryKey = 'patient_id';
		$table = 'patient_full_emr';
		$columns = array(
				array( 'db' => 'patient_id', 		'dt' => 0 ),
				array( 'db' => 'moh_id', 			'dt' => 1 ),
				array( 'db' => 'tent', 				'dt' => 2 ),
				array( 'db' => 'bed',  				'dt' => 3 ),
				array( 'db' => 'name',   			'dt' => 4 ),
				array( 'db' => 'surname',   		'dt' => 5 ),
				array( 'db' => 'age',   			'dt' => 6 ),
				array( 'db' => 'sex',   			'dt' => 7 ),
				array( 'db' => 'adm_date',   		'dt' => 8 ),
				array( 'db' => 'sym_date',   		'dt' => 9 ),
				/*array( 'db' => 'general',   		'dt' => 9 ),
				array( 'db' => 'status',   			'dt' => 10 ),
				array( 'db' => 'pain',   			'dt' => 11 ),
				array( 'db' => 'intake',   			'dt' => 12 ),
				array( 'db' => 'symptoms',   		'dt' => 13 ),
				array( 'db' => 'extra_drugs',   	'dt' => 14 ),
				array( 'db' => 'lab_test',   		'dt' => 15 ),
				array( 'db' => 'last_visit',   		'dt' => 16 ),*/
				array( 'db' => 'test_1_date',   	'dt' => 10 ),//'dt' => 17 ),
				array( 'db' => 'test_2_date',   	'dt' => 11 ),//'dt' => 18 ),
				array( 'db' => 'test_n-1_date',   	'dt' => 12 ),//'dt' => 19 ),
				array( 'db' => 'test_n_date',   	'dt' => 13 ),//'dt' => 20 ),
				array( 'db' => 'test_1_result',   	'dt' => 14 ),//'dt' => 21 ),
				array( 'db' => 'test_2_result',   	'dt' => 15 ),//'dt' => 22 ),
				array( 'db' => 'test_n-1_result',   'dt' => 16 ),//'dt' => 23 ),
				array( 'db' => 'test_n_result',   	'dt' => 17 ),//'dt' => 24 ),
				array( 'db' => 'exit_date',   		'dt' => 18 ),//'dt' => 25 ),
				array( 'db' => 'outcome',   		'dt' => 19 )//'dt' => 26 )
		);
		//Get test results
		include 'ctl-db_connection.php';
		$result = mysqli_query($connection,
				"SELECT patient_id, test_date, name as test_result FROM msf.patient_labtest 
				inner join concept_dic on type = 'test' and result = code order by test_date asc") or ($mysql_error = "Query failed: " . mysqli_error($connection));

		$labtest_date = array();
		$labtest_result = array();
		while ($row = mysqli_fetch_array($result)){
				$labtest_date[$row[0]][] = $row[1];
				$labtest_result[$row[0]][] = $row[2];
		}
		
		break;
}
// Table's primary key


// Array of database columns which should be read and sent back to DataTables.
// The `db` parameter represents the column name in the database, while the `dt`
// parameter represents the DataTables column identifier. In this case simple
// indexes

// SQL server connection information
include_once 'ctl-db_connection.php';


/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 * If you just want to use the basic configuration for DataTables with PHP
 * server-side, there is no need to edit below this line.
 */

require( 'ctl-ssp.class.php' );


$jsonObject = SSP::simple( $_GET, $sql_details, $table, $primaryKey, $columns, $where );


switch($table_ajax) {
  case 'patient_full_emr':
	//////////// POST PROCESSING FOR CENTRAL REGISTRATION
	//Add test dates and results
	if(count($labtest_result) > 0 && count($labtest_date) > 0) {
		foreach($jsonObject['data'] as $k => $patient) {
			//patient 0 = patient id
			$patient_id = $patient[0];
			if(array_key_exists($patient_id, $labtest_date) && array_key_exists($patient_id, $labtest_result)) {
				$num_elems = count($labtest_date[$patient_id]);
				$start_index = 10;
				if($num_elems > 0) {
					for($i=0; $i < 2; $i++) {
						if(isset($labtest_date[$patient_id][$i])) {
							$jsonObject['data'][$k][$start_index+$i] = $labtest_date[$patient_id][$i];
							$jsonObject['data'][$k][$start_index+4+$i] = $labtest_result[$patient_id][$i];
						}
					}
				}
				$start_index = 13;
				if($num_elems > 2) {
					for($i=0; $i < 2; $i++) {
						$j = $num_elems - $i - 1;
						if($j > 1 && isset($labtest_date[$patient_id][$j])) {
							$jsonObject['data'][$k][$start_index-$i] = $labtest_date[$patient_id][$j];
							$jsonObject['data'][$k][$start_index+4-$i] = $labtest_result[$patient_id][$j];
						}
					}			
				}
			}
		}
	}
	$jsonObject['test']['date'] = $labtest_date;
	$jsonObject['test']['result'] = $labtest_result;
	break;
  //////////// POST PROCESSING FOR NURSING CARE
  //case : - Add here further processing of the json object corresponding to another table, before returning it
}

echo json_encode($jsonObject);



