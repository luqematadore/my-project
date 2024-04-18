<?php
// Assuming you have a connection to your database
$query = "SELECT meta_value FROM wp_metform WHERE user_id = $user_id";
$result = mysqli_query($connection, $query);

if (mysqli_num_rows($result) > 0) {
    while($row = mysqli_fetch_assoc($result)) {
        $meta_value = $row['meta_value'];
        $unserialized_data = unserialize($meta_value);

        // Now you can access the data as an array
        echo $unserialized_data['email_address']; // Example: Accessingemail_address
        echo $unserialized_data['full_name']; // Example: Accessing full_name
		echo $unserialized_data['first_name']; // Example: Accessingfull_name
		echo $unserialized_data['last_name'];
		echo $unserialized_data['staff_ID'];
		echo $unserialized_data['clientName'];
		echo $unserialized_data['company_email'];
		echo $unserialized_data['job_title'];
		echo $unserialized_data['gender_type'];
		echo $unserialized_data['work_location'];
		echo $unserialized_data['department'];
		echo $unserialized_data['work_section'];
		echo $unserialized_data['year_service'];
		echo $unserialized_data['laptop'];
		echo $unserialized_data['standardPC'];
		echo $unserialized_data['external'];
		echo $unserialized_data['dockingNE'];
		echo $unserialized_data['dockingE'];
		echo $unserialized_data['standardMW'];
		echo $unserialized_data['standardMNW'];
		echo $unserialized_data['ErgomouseNW'];
		echo $unserialized_data['ErgomouseW'];
		echo $unserialized_data['shortkey'];
		echo $unserialized_data['longkey'];
		echo $unserialized_data['riserA'];
		echo $unserialized_data['riserNA'];
		echo $unserialized_data['BagA'];
		echo $unserialized_data['BagB'];
		echo $unserialized_data['BagC'];
		echo $unserialized_data['mousepadA'];
		echo $unserialized_data['mousepadB'];
		echo $unserialized_data['wristpadA'];
		echo $unserialized_data['wristpadB'];
		echo $unserialized_data['laptop2'];
		echo $unserialized_data['standardPC2'];
		echo $unserialized_data['external2'];
		echo $unserialized_data['dockingNE2'];
		echo $unserialized_data['dockingE2'];
		echo $unserialized_data['standardMW2'];
		echo $unserialized_data['standardMNW2'];
		echo $unserialized_data['ErgomouseNW2'];
		echo $unserialized_data['ErgomouseW2'];
		echo $unserialized_data['shortkey2'];
		echo $unserialized_data['longkey2'];
		echo $unserialized_data['riserA2'];
		echo $unserialized_data['riserNA2'];
		echo $unserialized_data['BagA2'];
		echo $unserialized_data['BagB2'];
		echo $unserialized_data['BagC2'];
		echo $unserialized_data['mousepadA2'];
		echo $unserialized_data['mousepadB2'];
		echo $unserialized_data['wristpadA2'];
		echo $unserialized_data['wristpadB2'];
		echo $unserialized_data['headMid'];
		echo $unserialized_data['headRight'];
		echo $unserialized_data['headLeft'];
		echo $unserialized_data['neckMid'];
		echo $unserialized_data['neckRight'];
		echo $unserialized_data['neckLeft'];
		echo $unserialized_data['UpshoulderRight'];
		echo $unserialized_data['UpshoulderLeft'];
		echo $unserialized_data['shoulderJointRight'];
		echo $unserialized_data['shoulderJointLeft'];
		echo $unserialized_data['elbowLeft'];
		echo $unserialized_data['upperFright'];
		echo $unserialized_data['upperFlight'];
		echo $unserialized_data['upperWristRight'];
		echo $unserialized_data['upperWristLeft'];
		echo $unserialized_data['lowerWristRight'];
		echo $unserialized_data['lowerWristLeft'];
		echo $unserialized_data['fingersRight'];
		echo $unserialized_data['fingersLeft'];
		echo $unserialized_data['LowerBackMid'];
		echo $unserialized_data['LowerBackRight'];
		echo $unserialized_data['LowerBackLeft'];
		echo $unserialized_data['torsoMid'];
		echo $unserialized_data['torsoRight'];
		echo $unserialized_data['torsoLeft'];
		echo $unserialized_data['hipJointRight'];
		echo $unserialized_data['hipJointLeft'];
		echo $unserialized_data['kneeRight'];
		echo $unserialized_data['kneeLeft'];
		echo $unserialized_data['calvesRight'];
		echo $unserialized_data['calvesLeft'];
		echo $unserialized_data['ankleRight'];
		echo $unserialized_data['ankleLeft'];
		echo $unserialized_data['HeelsRight'];
		echo $unserialized_data['HeelsLeft'];
		echo $unserialized_data['radio1'];
		echo $unserialized_data['radio2'];
		echo $unserialized_data['radio3'];
		echo $unserialized_data['radio4'];
		echo $unserialized_data['radio5'];
		echo $unserialized_data['radio6'];
		echo $unserialized_data['radio7'];
		echo $unserialized_data['radio8'];
		echo $unserialized_data['radio9'];
		echo $unserialized_data['radio10'];
		echo $unserialized_data['radio11'];
		echo $unserialized_data['radio12'];
		echo $unserialized_data['radio13'];
		echo $unserialized_data['radio14'];
		echo $unserialized_data['radio15'];
		echo $unserialized_data['radio16'];
		echo $unserialized_data['radio17'];
		echo $unserialized_data['radio18'];
		echo $unserialized_data['radio19'];
		echo $unserialized_data['radio20'];
		echo $unserialized_data['radio21'];
		echo $unserialized_data['radio22'];
		echo $unserialized_data['radio23'];
		echo $unserialized_data['radio24'];
		echo $unserialized_data['radio25'];
		echo $unserialized_data['radio26'];
		echo $unserialized_data['radio27'];
		echo $unserialized_data['radio28'];
		echo $unserialized_data['radio29'];
		echo $unserialized_data['radio30'];
		echo $unserialized_data['radio31'];
		echo $unserialized_data['radio32'];
		echo $unserialized_data['radio33'];
		echo $unserialized_data['radio34'];
		echo $unserialized_data['radio35'];
		echo $unserialized_data['radio36'];
		echo $unserialized_data['radio37'];
		echo $unserialized_data['radio38'];
		echo $unserialized_data['radio39'];
		echo $unserialized_data['radio40'];
		echo $unserialized_data['radio41'];
		echo $unserialized_data['radio42'];
        // Add more as needed
    }
} else {
    echo "No results found";
}
