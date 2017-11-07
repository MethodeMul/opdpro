 
<script type="text/javascript">
$(document).ready(function() {
    patientTable = $('#patient_full_emr').dataTable( {
	    dom: 'T<"clear">lfrtip',
	    "aLengthMenu": [[100, 500, 1000, -1], [100, 500, 1000, "All"]],
        "iDisplayLength": 25,
		columns: [
			{ "width": "50px" },
			{ "width": "50px" },
			{ "width": "30px" },
			{ "width": "30px" },
			{ "width": "80px" },
			{ "width": "80px" },
			{ "width": "30px" },
			{ "width": "30px" },
			{ "width": "80px" },
			{ "width": "80px" },
			{ "width": "50px" },
			{ "width": "50px" },
			{ "width": "50px" },
			{ "width": "50px" },
			{ "width": "50px" },
			{ "width": "50px" },
			{ "width": "50px" },
			{ "width": "50px" },
			{ "width": "80px" },
			{ "width": "80px" }
		],
        processing: true,
        serverSide: true,
        ajax: {
            url: "ctl-server_processing.php",
            data: { table: 'patient_full_emr' },
	    	//"success": function (dataStr) { console.log(dataStr); }
        },
		stateSave: true,
		createdRow: function ( row, data, index ) {
            if ( data[7] == 'deceased' ) {
                $('td', row).eq(7).addClass('highlight');
            }
        },
		tableTools: {
            sSwfPath: "DataTables-1.10.2/extensions/TableTools/swf/copy_csv_xls_pdf.swf"
        },
    });
 
} );
</script>
 
<table id="patient_full_emr" class="display" cellspacing="0" width="1600px">
    <thead>
        <tr>
            <th>Patient ID</th>
            <th>MOH ID</th>
            <th>Tent</th>
            <th>Bed</th>
            <th>Name</th>
            <th>Surname</th>
			<th>Age</th> 			
			<th>Sex</th> 
			<th>Admission date</th> 			
			<th>Onset of symptoms</th>
			<th>Test 1 date</th>
			<th>Test 2 date</th>
			<th>Test n-1 date</th>
			<th>Test n date</th>
			<th>Test 1 result</th>
			<th>Test 2 result</th>
			<th>Test n-1 result</th>
			<th>Test n result</th>
			<th>Exit date</th>
			<th>Outcome</th>
        </tr>
    </thead>
</table>