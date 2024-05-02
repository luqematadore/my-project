-- Part 1 Trigger 
DELIMITER //

CREATE TRIGGER insert_into_part_1_trigger AFTER INSERT ON wp_metforms
FOR EACH ROW
BEGIN
    -- Extract the serialized data value
    DECLARE serialized_data LONGTEXT;
    SET serialized_data = NEW.meta_value;
    
    -- Extract values for columns
    INSERT INTO wb_ebss_part_1 (ID, user_email, full_name, first_name, last_name, staff_ID, clientName, company_email, job_title, gender_type, work_location, department, work_section, year_service)
    VALUES (NEW.ID, 
            SUBSTRING_INDEX(SUBSTRING_INDEX(serialized_data, ':"email_address";s:', -1), '"', 1), -- email_address
            SUBSTRING_INDEX(SUBSTRING_INDEX(serialized_data, ':"full_name";s:', -1), '"', 1), -- full_name
            SUBSTRING_INDEX(SUBSTRING_INDEX(serialized_data, ':"first_name";s:', -1), '"', 1), -- first_name
            SUBSTRING_INDEX(SUBSTRING_INDEX(serialized_data, ':"last_name";s:', -1), '"', 1), -- last_name
            SUBSTRING_INDEX(SUBSTRING_INDEX(serialized_data, ':"staff_ID";s:', -1), '"', 1), -- staff_ID
            SUBSTRING_INDEX(SUBSTRING_INDEX(serialized_data, ':"clientName";s:', -1), '"', 1), -- clientName
            SUBSTRING_INDEX(SUBSTRING_INDEX(serialized_data, ':"company_email";s:', -1), '"', 1), -- company_email
            SUBSTRING_INDEX(SUBSTRING_INDEX(serialized_data, ':"job_title";s:', -1), '"', 1), -- job_title
            SUBSTRING_INDEX(SUBSTRING_INDEX(serialized_data, ':"gender_type";s:', -1), '"', 1), -- gender_type
            SUBSTRING_INDEX(SUBSTRING_INDEX(serialized_data, ':"work_location";s:', -1), '"', 1), -- work_location
            SUBSTRING_INDEX(SUBSTRING_INDEX(serialized_data, ':"department";s:', -1), '"', 1), -- department
            SUBSTRING_INDEX(SUBSTRING_INDEX(serialized_data, ':"work_section";s:', -1), '"', 1), -- work_section
            SUBSTRING_INDEX(SUBSTRING_INDEX(serialized_data, ':"year_service";s:', -1), '"', 1) -- year_service
            );
END;
//

DELIMITER ;

-- Part 2_1 Trigger 
DELIMITER //

CREATE TRIGGER insert_into_part_2_1_trigger AFTER INSERT ON wp_metforms
FOR EACH ROW
BEGIN
    -- Extract the serialized data value
    DECLARE serialized_data LONGTEXT;
    SET serialized_data = NEW.meta_value;

    -- Extract values for columns
    INSERT INTO wb_ebss_part_2_1 (
        ID,
        laptop,
        standardPC,
        external,
        dockingNE,
        dockingE,
        standardMW,
        standardMNW,
        ErgomouseNW,
        ErgomouseW,
        shortkey,
        longkey,
        riserA,
        riserNA,
        BagA,
        BagB,
        BagC,
        mousepadA,
        mousepadB,
        wristpadA,
        wristpadB
    ) VALUES (
        NEW.ID,
        SUBSTRING_INDEX(SUBSTRING_INDEX(serialized_data, ':"laptop";s:', -1), '"', 1), -- laptop
        SUBSTRING_INDEX(SUBSTRING_INDEX(serialized_data, ':"standardPC";s:', -1), '"', 1), -- standardPC
        SUBSTRING_INDEX(SUBSTRING_INDEX(serialized_data, ':"external";s:', -1), '"', 1), -- external
        SUBSTRING_INDEX(SUBSTRING_INDEX(serialized_data, ':"dockingNE";s:', -1), '"', 1), -- dockingNE
        SUBSTRING_INDEX(SUBSTRING_INDEX(serialized_data, ':"dockingE";s:', -1), '"', 1), -- dockingE
        SUBSTRING_INDEX(SUBSTRING_INDEX(serialized_data, ':"standardMW";s:', -1), '"', 1), -- standardMW
        SUBSTRING_INDEX(SUBSTRING_INDEX(serialized_data, ':"standardMNW";s:', -1), '"', 1), -- standardMNW
        SUBSTRING_INDEX(SUBSTRING_INDEX(serialized_data, ':"ErgomouseNW";s:', -1), '"', 1), -- ErgomouseNW
        SUBSTRING_INDEX(SUBSTRING_INDEX(serialized_data, ':"ErgomouseW";s:', -1), '"', 1), -- ErgomouseW
        SUBSTRING_INDEX(SUBSTRING_INDEX(serialized_data, ':"shortkey";s:', -1), '"', 1), -- shortkey
        SUBSTRING_INDEX(SUBSTRING_INDEX(serialized_data, ':"longkey";s:', -1), '"', 1), -- longkey
        SUBSTRING_INDEX(SUBSTRING_INDEX(serialized_data, ':"riserA";s:', -1), '"', 1), -- riserA
        SUBSTRING_INDEX(SUBSTRING_INDEX(serialized_data, ':"riserNA";s:', -1), '"', 1), -- riserNA
        SUBSTRING_INDEX(SUBSTRING_INDEX(serialized_data, ':"BagA";s:', -1), '"', 1), -- BagA
        SUBSTRING_INDEX(SUBSTRING_INDEX(serialized_data, ':"BagB";s:', -1), '"', 1), -- BagB
        SUBSTRING_INDEX(SUBSTRING_INDEX(serialized_data, ':"BagC";s:', -1), '"', 1), -- BagC
        SUBSTRING_INDEX(SUBSTRING_INDEX(serialized_data, ':"mousepadA";s:', -1), '"', 1), -- mousepadA
        SUBSTRING_INDEX(SUBSTRING_INDEX(serialized_data, ':"mousepadB";s:', -1), '"', 1), -- mousepadB
        SUBSTRING_INDEX(SUBSTRING_INDEX(serialized_data, ':"wristpadA";s:', -1), '"', 1), -- wristpadA
        SUBSTRING_INDEX(SUBSTRING_INDEX(serialized_data, ':"wristpadB";s:', -1), '"', 1) -- wristpadB
    );
END;

//

DELIMITER ;

-- Part 2_2 trigger
DELIMITER //

CREATE TRIGGER insert_into_part_2_2_trigger AFTER INSERT ON wp_metforms
FOR EACH ROW
BEGIN
    -- Extract the serialized data value
    DECLARE serialized_data LONGTEXT;
    SET serialized_data = NEW.meta_value;

    -- Extract values for columns
    INSERT INTO wp_ebss_part_2_2 (
        ID,
        laptop2,
        standardPC2,
        external2,
        dockingNE2,
        dockingE2,
        standardMW2,
        standardMNW2,
        ErgomouseNW2,
        ErgomouseW2,
        shortkey2,
        longkey2,
        riserA2,
        riserNA2,
        BagA2,
        BagB2,
        BagC2,
        mousepadA2,
        mousepadB2,
        wristpadA2,
        wristpadB2
    ) VALUES (
        NEW.ID,
        SUBSTRING_INDEX(SUBSTRING_INDEX(serialized_data, ':"laptop2";s:', -1), '"', 1), -- laptop2
        SUBSTRING_INDEX(SUBSTRING_INDEX(serialized_data, ':"standardPC2";s:', -1), '"', 1), -- standardPC2
        SUBSTRING_INDEX(SUBSTRING_INDEX(serialized_data, ':"external2";s:', -1), '"', 1), -- external2
        SUBSTRING_INDEX(SUBSTRING_INDEX(serialized_data, ':"dockingNE2";s:', -1), '"', 1), -- dockingNE2
        SUBSTRING_INDEX(SUBSTRING_INDEX(serialized_data, ':"dockingE2";s:', -1), '"', 1), -- dockingE2
        SUBSTRING_INDEX(SUBSTRING_INDEX(serialized_data, ':"standardMW2";s:', -1), '"', 1), -- standardMW2
        SUBSTRING_INDEX(SUBSTRING_INDEX(serialized_data, ':"standardMNW2";s:', -1), '"', 1), -- standardMNW2
        SUBSTRING_INDEX(SUBSTRING_INDEX(serialized_data, ':"ErgomouseNW2";s:', -1), '"', 1), -- ErgomouseNW2
        SUBSTRING_INDEX(SUBSTRING_INDEX(serialized_data, ':"ErgomouseW2";s:', -1), '"', 1), -- ErgomouseW2
        SUBSTRING_INDEX(SUBSTRING_INDEX(serialized_data, ':"shortkey2";s:', -1), '"', 1), -- shortkey2
        SUBSTRING_INDEX(SUBSTRING_INDEX(serialized_data, ':"longkey2";s:', -1), '"', 1), -- longkey2
        SUBSTRING_INDEX(SUBSTRING_INDEX(serialized_data, ':"riserA2";s:', -1), '"', 1), -- riserA2
        SUBSTRING_INDEX(SUBSTRING_INDEX(serialized_data, ':"riserNA2";s:', -1), '"', 1), -- riserNA2
        SUBSTRING_INDEX(SUBSTRING_INDEX(serialized_data, ':"BagA2";s:', -1), '"', 1), -- BagA2
        SUBSTRING_INDEX(SUBSTRING_INDEX(serialized_data, ':"BagB2";s:', -1), '"', 1), -- BagB2
        SUBSTRING_INDEX(SUBSTRING_INDEX(serialized_data, ':"BagC2";s:', -1), '"', 1), -- BagC2
        SUBSTRING_INDEX(SUBSTRING_INDEX(serialized_data, ':"mousepadA2";s:', -1), '"', 1), -- mousepadA2
        SUBSTRING_INDEX(SUBSTRING_INDEX(serialized_data, ':"mousepadB2";s:', -1), '"', 1), -- mousepadB2
        SUBSTRING_INDEX(SUBSTRING_INDEX(serialized_data, ':"wristpadA2";s:', -1), '"', 1), -- wristpadA2
        SUBSTRING_INDEX(SUBSTRING_INDEX(serialized_data, ':"wristpadB2";s:', -1), '"', 1) -- wristpadB2
    );
END;

//

DELIMITER ;

-- Part 3 trigger
DELIMITER //

CREATE TRIGGER insert_into_part_3_trigger AFTER INSERT ON wp_metforms
FOR EACH ROW
BEGIN
    -- Extract the serialized data value
    DECLARE serialized_data LONGTEXT;
    SET serialized_data = NEW.meta_value;

    -- Extract values for columns
    INSERT INTO wp_ebss_part_3 (
        ID,
        headMid,
        headRight,
        headLeft,
        neckMid,
        neckRight,
        neckLeft,
        UpshoulderRight,
        UpshoulderLeft,
        shoulderJointRight,
        shoulderJointLeft,
        elbowRight,
        elbowLeft,
        upperFright,
        upperFlight,
        upperWristRight,
        upperWristLeft,
        lowerWristRight,
        lowerWristLeft,
        fingersRight,
        fingersLeft,
        LowerBackMid,
        LowerBackRight,
        LowerBackLeft,
        torsoMid,
        torsoRight,
        torsoLeft,
        hipJointRight,
        hipJointLeft,
        kneeRight,
        kneeLeft,
        calvesRight,
        calvesLeft,
        ankleRight,
        ankleLeft,
        HeelsRight,
        HeelsLeft
    ) VALUES (
        NEW.ID,
        SUBSTRING_INDEX(SUBSTRING_INDEX(serialized_data, ':"headMid";s:', -1), '"', 1), -- headMid
        SUBSTRING_INDEX(SUBSTRING_INDEX(serialized_data, ':"headRight";s:', -1), '"', 1), -- headRight
        SUBSTRING_INDEX(SUBSTRING_INDEX(serialized_data, ':"headLeft";s:', -1), '"', 1), -- headLeft
        SUBSTRING_INDEX(SUBSTRING_INDEX(serialized_data, ':"neckMid";s:', -1), '"', 1), -- neckMid
        SUBSTRING_INDEX(SUBSTRING_INDEX(serialized_data, ':"neckRight";s:', -1), '"', 1), -- neckRight
        SUBSTRING_INDEX(SUBSTRING_INDEX(serialized_data, ':"neckLeft";s:', -1), '"', 1), -- neckLeft
        SUBSTRING_INDEX(SUBSTRING_INDEX(serialized_data, ':"UpshoulderRight";s:', -1), '"', 1), -- UpshoulderRight
        SUBSTRING_INDEX(SUBSTRING_INDEX(serialized_data, ':"UpshoulderLeft";s:', -1), '"', 1), -- UpshoulderLeft
        SUBSTRING_INDEX(SUBSTRING_INDEX(serialized_data, ':"shoulderJointRight";s:', -1), '"', 1), -- shoulderJointRight
        SUBSTRING_INDEX(SUBSTRING_INDEX(serialized_data, ':"shoulderJointLeft";s:', -1), '"', 1), -- shoulderJointLeft
        SUBSTRING_INDEX(SUBSTRING_INDEX(serialized_data, ':"elbowRight";s:', -1), '"', 1), -- elbowRight
        SUBSTRING_INDEX(SUBSTRING_INDEX(serialized_data, ':"elbowLeft";s:', -1), '"', 1), -- elbowLeft
        SUBSTRING_INDEX(SUBSTRING_INDEX(serialized_data, ':"upperFright";s:', -1), '"', 1), -- upperFright
        SUBSTRING_INDEX(SUBSTRING_INDEX(serialized_data, ':"upperFlight";s:', -1), '"', 1), -- upperFlight
        SUBSTRING_INDEX(SUBSTRING_INDEX(serialized_data, ':"upperWristRight";s:', -1), '"', 1), -- upperWristRight
        SUBSTRING_INDEX(SUBSTRING_INDEX(serialized_data, ':"upperWristLeft";s:', -1), '"', 1), -- upperWristLeft
        SUBSTRING_INDEX(SUBSTRING_INDEX(serialized_data, ':"lowerWristRight";s:', -1), '"', 1), -- lowerWristRight
        SUBSTRING_INDEX(SUBSTRING_INDEX(serialized_data, ':"lowerWristLeft";s:', -1), '"', 1), -- lowerWristLeft
        SUBSTRING_INDEX(SUBSTRING_INDEX(serialized_data, ':"fingersRight";s:', -1), '"', 1), -- fingersRight
        SUBSTRING_INDEX(SUBSTRING_INDEX(serialized_data, ':"fingersLeft";s:', -1), '"', 1), -- fingersLeft
        SUBSTRING_INDEX(SUBSTRING_INDEX(serialized_data, ':"LowerBackMid";s:', -1), '"', 1), -- LowerBackMid
        SUBSTRING_INDEX(SUBSTRING_INDEX(serialized_data, ':"LowerBackRight";s:', -1), '"', 1), -- LowerBackRight
        SUBSTRING_INDEX(SUBSTRING_INDEX(serialized_data, ':"LowerBackLeft";s:', -1), '"', 1), -- LowerBackLeft
        SUBSTRING_INDEX(SUBSTRING_INDEX(serialized_data, ':"torsoMid";s:', -1), '"', 1), -- torsoMid
        SUBSTRING_INDEX(SUBSTRING_INDEX(serialized_data, ':"torsoRight";s:', -1), '"', 1), -- torsoRight
        SUBSTRING_INDEX(SUBSTRING_INDEX(serialized_data, ':"torsoLeft";s:', -1), '"', 1), -- torsoLeft
        SUBSTRING_INDEX(SUBSTRING_INDEX(serialized_data, ':"hipJointRight";s:', -1), '"', 1), -- hipJointRight
        SUBSTRING_INDEX(SUBSTRING_INDEX(serialized_data, ':"hipJointLeft";s:', -1), '"', 1), -- hipJointLeft
        SUBSTRING_INDEX(SUBSTRING_INDEX(serialized_data, ':"kneeRight";s:', -1), '"', 1), -- kneeRight
        SUBSTRING_INDEX(SUBSTRING_INDEX(serialized_data, ':"kneeLeft";s:', -1), '"', 1), -- kneeLeft
        SUBSTRING_INDEX(SUBSTRING_INDEX(serialized_data, ':"calvesRight";s:', -1), '"', 1), -- calvesRight
        SUBSTRING_INDEX(SUBSTRING_INDEX(serialized_data, ':"calvesLeft";s:', -1), '"', 1), -- calvesLeft
        SUBSTRING_INDEX(SUBSTRING_INDEX(serialized_data, ':"ankleRight";s:', -1), '"', 1), -- ankleRight
        SUBSTRING_INDEX(SUBSTRING_INDEX(serialized_data, ':"ankleLeft";s:', -1), '"', 1), -- ankleLeft
        SUBSTRING_INDEX(SUBSTRING_INDEX(serialized_data, ':"HeelsRight";s:', -1), '"', 1), -- HeelsRight
        SUBSTRING_INDEX(SUBSTRING_INDEX(serialized_data, ':"HeelsLeft";s:', -1), '"', 1) -- HeelsLeft
    );
END;

//

DELIMITER ;

-- Part 4 trigger
DELIMITER //

CREATE TRIGGER insert_into_part_4_trigger AFTER INSERT ON wp_metforms
FOR EACH ROW
BEGIN
    -- Extract the serialized data value
    DECLARE serialized_data LONGTEXT;
    SET serialized_data = NEW.meta_value;

    -- Extract values for columns
    INSERT INTO wp_ebss_part_4 (
        ID,
        radio1,
        radio2,
        radio3,
        radio4,
        radio5,
        radio6,
        radio7,
        radio8,
        radio9,
        radio10,
        radio11,
        radio12,
        radio13,
        radio14,
        radio15,
        radio16,
        radio17,
        radio18,
        radio19,
        radio20,
        radio21,
        radio22,
        radio23,
        radio24,
        radio25,
        radio26,
        radio27,
        radio28,
        radio29,
        radio30,
        radio31,
        radio32,
        radio33,
        radio34,
        radio35,
        radio36,
        radio37,
        radio38,
        radio39,
        radio40,
        radio41,
        radio42
    ) VALUES (
        NEW.ID,
        SUBSTRING_INDEX(SUBSTRING_INDEX(serialized_data, ':"radio1";s:', -1), '"', 1), -- radio1
        SUBSTRING_INDEX(SUBSTRING_INDEX(serialized_data, ':"radio2";s:', -1), '"', 1), -- radio2
        SUBSTRING_INDEX(SUBSTRING_INDEX(serialized_data, ':"radio3";s:', -1), '"', 1), -- radio3
        SUBSTRING_INDEX(SUBSTRING_INDEX(serialized_data, ':"radio4";s:', -1), '"', 1), -- radio4
        SUBSTRING_INDEX(SUBSTRING_INDEX(serialized_data, ':"radio5";s:', -1), '"', 1), -- radio5
        SUBSTRING_INDEX(SUBSTRING_INDEX(serialized_data, ':"radio6";s:', -1), '"', 1), -- radio6
        SUBSTRING_INDEX(SUBSTRING_INDEX(serialized_data, ':"radio7";s:', -1), '"', 1), -- radio7
        SUBSTRING_INDEX(SUBSTRING_INDEX(serialized_data, ':"radio8";s:', -1), '"', 1), -- radio8
        SUBSTRING_INDEX(SUBSTRING_INDEX(serialized_data, ':"radio9";s:', -1), '"', 1), -- radio9
        SUBSTRING_INDEX(SUBSTRING_INDEX(serialized_data, ':"radio10";s:', -1), '"', 1), -- radio10
        SUBSTRING_INDEX(SUBSTRING_INDEX(serialized_data, ':"radio11";s:', -1), '"', 1), -- radio11
        SUBSTRING_INDEX(SUBSTRING_INDEX(serialized_data, ':"radio12";s:', -1), '"', 1), -- radio12
        SUBSTRING_INDEX(SUBSTRING_INDEX(serialized_data, ':"radio13";s:', -1), '"', 1), -- radio13
        SUBSTRING_INDEX(SUBSTRING_INDEX(serialized_data, ':"radio14";s:', -1), '"', 1), -- radio14
        SUBSTRING_INDEX(SUBSTRING_INDEX(serialized_data, ':"radio15";s:', -1), '"', 1), -- radio15
        SUBSTRING_INDEX(SUBSTRING_INDEX(serialized_data, ':"radio16";s:', -1), '"', 1), -- radio16
        SUBSTRING_INDEX(SUBSTRING_INDEX(serialized_data, ':"radio17";s:', -1), '"', 1), -- radio17
        SUBSTRING_INDEX(SUBSTRING_INDEX(serialized_data, ':"radio18";s:', -1), '"', 1), -- radio18
        SUBSTRING_INDEX(SUBSTRING_INDEX(serialized_data, ':"radio19";s:', -1), '"', 1), -- radio19
        SUBSTRING_INDEX(SUBSTRING_INDEX(serialized_data, ':"radio20";s:', -1), '"', 1), -- radio20
        SUBSTRING_INDEX(SUBSTRING_INDEX(serialized_data, ':"radio21";s:', -1), '"', 1), -- radio21
        SUBSTRING_INDEX(SUBSTRING_INDEX(serialized_data, ':"radio22";s:', -1), '"', 1), -- radio22
        SUBSTRING_INDEX(SUBSTRING_INDEX(serialized_data, ':"radio23";s:', -1), '"', 1), -- radio23
        SUBSTRING_INDEX(SUBSTRING_INDEX(serialized_data, ':"radio24";s:', -1), '"', 1), -- radio24
        SUBSTRING_INDEX(SUBSTRING_INDEX(serialized_data, ':"radio25";s:', -1), '"', 1), -- radio25
        SUBSTRING_INDEX(SUBSTRING_INDEX(serialized_data, ':"radio26";s:', -1), '"', 1), -- radio26
        SUBSTRING_INDEX(SUBSTRING_INDEX(serialized_data, ':"radio27";s:', -1), '"', 1), -- radio27
        SUBSTRING_INDEX(SUBSTRING_INDEX(serialized_data, ':"radio28";s:', -1), '"', 1), -- radio28
        SUBSTRING_INDEX(SUBSTRING_INDEX(serialized_data, ':"radio29";s:', -1), '"', 1), -- radio29
        SUBSTRING_INDEX(SUBSTRING_INDEX(serialized_data, ':"radio30";s:', -1), '"', 1), -- radio30
        SUBSTRING_INDEX(SUBSTRING_INDEX(serialized_data, ':"radio31";s:', -1), '"', 1), -- radio31
        SUBSTRING_INDEX(SUBSTRING_INDEX(serialized_data, ':"radio32";s:', -1), '"', 1), -- radio32
        SUBSTRING_INDEX(SUBSTRING_INDEX(serialized_data, ':"radio33";s:', -1), '"', 1), -- radio33
        SUBSTRING_INDEX(SUBSTRING_INDEX(serialized_data, ':"radio34";s:', -1), '"', 1), -- radio34
        SUBSTRING_INDEX(SUBSTRING_INDEX(serialized_data, ':"radio35";s:', -1), '"', 1), -- radio35
        SUBSTRING_INDEX(SUBSTRING_INDEX(serialized_data, ':"radio36";s:', -1), '"', 1), -- radio36
        SUBSTRING_INDEX(SUBSTRING_INDEX(serialized_data, ':"radio37";s:', -1), '"', 1), -- radio37
        SUBSTRING_INDEX(SUBSTRING_INDEX(serialized_data, ':"radio38";s:', -1), '"', 1), -- radio38
        SUBSTRING_INDEX(SUBSTRING_INDEX(serialized_data, ':"radio39";s:', -1), '"', 1), -- radio39
        SUBSTRING_INDEX(SUBSTRING_INDEX(serialized_data, ':"radio40";s:', -1), '"', 1), -- radio40
        SUBSTRING_INDEX(SUBSTRING_INDEX(serialized_data, ':"radio41";s:', -1), '"', 1), -- radio41
        SUBSTRING_INDEX(SUBSTRING_INDEX(serialized_data, ':"radio42";s:', -1), '"', 1) -- radio42
    );
END;

//

DELIMITER ;
