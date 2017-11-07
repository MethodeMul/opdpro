use msf;

DROP VIEW IF EXISTS vw_msf_patients;

CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `vw_msf_patients` AS
    select 
        `patient_emr`.`patient_id` AS `PatientID`,
        IFNULL(`last_zetesdc_msf`.`BedLocationID`, '') AS `BedLocationID`,
        `last_zetesdc_msf`.`DC_General` AS `DC_General`,
        `last_zetesdc_msf`.`DC_Status` AS `DC_Status`,
        `last_zetesdc_msf`.`DC_Pain` AS `DC_Pain`,
        `last_zetesdc_msf`.`DC_Intake` AS `DC_Intake`,
        `last_zetesdc_msf`.`DC_Symptomatology1` AS `DC_Symptomatology1`,
        `last_zetesdc_msf`.`DC_Symptomatology2` AS `DC_Symptomatology2`,
        `last_zetesdc_msf`.`DC_ExtraDrugs` AS `DC_extraDrugs`,
        `last_zetesdc_msf`.`DC_Laboratory` AS `DC_Laboratory`,
        concat(`patient_emr`.`name`,
                ' ',
                `patient_emr`.`surname`) AS `PatientName`,
        `patient_emr`.`age` AS `PatientAge`,
        `patient_emr`.`sex` AS `PatientSex`,
        concat('Tent: ', IFNULL(bed_status.tent, ' '), '   Bed: ', IFNULL(bed_status.bed, ' '),
				'\n',
				'Symptoms: ',
                IFNULL(`symptoms`, 'none'),
				'\n'
				'Onset of symptoms: ',
                `patient_emr`.`sym_date`,
				'\n'
				'Date admission: ',
                `patient_emr`.`adm_date`,
				'\n'
 				'Last test: ', IFNULL(last_testresult.test_date, ' '), '   Result: ', SUBSTRING(IFNULL(last_testresult.result, ' '),1,3),
				'\n'
				'Last visit: ',
                IFNULL(`last_zetesdc_msf`.`DateTime`, 'Never visited')
				) AS `PatientTextInfo`
    from
        (`patient_emr`
        left join `last_zetesdc_msf` ON (`last_zetesdc_msf`.`PatientID` = `patient_emr`.`patient_id`)
		left join `patient_history_asc` ON (`patient_history_asc`.`patient_id` = `patient_emr`.`patient_id`)
		left join bed_status ON last_zetesdc_msf.BedLocationID = bed_status.location_id
		left join last_testresult ON (last_testresult.patient_id = `patient_emr`.`patient_id`)
		)
    group by `patient_emr`.`patient_id`