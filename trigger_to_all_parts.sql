DELIMITER //
CREATE FUNCTION unserialize_value(serialized LONGTEXT, `key` VARCHAR(255)) RETURNS VARCHAR(255)
BEGIN
    DECLARE start_pos INT;
    DECLARE end_pos INT;
    DECLARE length INT;
    DECLARE value TEXT;

    SET start_pos = LOCATE(CONCAT('"', `key`, '";'), serialized);
    IF start_pos = 0 THEN
        RETURN NULL;
    END IF;
    SET start_pos = start_pos + LENGTH(CONCAT('"', `key`, '";'));
    SET end_pos = LOCATE('"', serialized, start_pos);
    SET length = end_pos - start_pos;
    SET value = SUBSTRING(serialized, start_pos, length);
    RETURN value;
END;

//
DELIMITER ;

-- Trigger for inserting into wp_ebss_part_1
DELIMITER //
CREATE TRIGGER insert_into_wp_ebss_part_1
AFTER INSERT ON wp_metforms
FOR EACH ROW
BEGIN
    INSERT INTO wp_ebss_part_1 (ID, user_email, full_name, first_name, last_name, staff_ID, clientName, company_email, job_title, gender, work_location, department, work_section, year_service)
    VALUES (NEW.ID, unserialize_value(NEW.meta_value, 'email_address'), unserialize_value(NEW.meta_value, 'full_name'), unserialize_value(NEW.meta_value, 'first_name'), unserialize_value(NEW.meta_value, 'last_name'), unserialize_value(NEW.meta_value, 'staff_ID'), unserialize_value(NEW.meta_value, 'clientName'), unserialize_value(NEW.meta_value, 'company_email'), unserialize_value(NEW.meta_value, 'job_title'), unserialize_value(NEW.meta_value, 'gender_type'), unserialize_value(NEW.meta_value, 'work_location'), unserialize_value(NEW.meta_value, 'department'), unserialize_value(NEW.meta_value, 'work_section'), unserialize_value(NEW.meta_value, 'year_service'));
END;
//

-- Trigger for inserting into wp_ebss_part_2_1
DELIMITER //
CREATE TRIGGER insert_into_wp_ebss_part_2_1
AFTER INSERT ON wp_metforms
FOR EACH ROW
BEGIN
    INSERT INTO wp_ebss_part_2_1 (ID, laptop, standardPC, external, dockingNE, dockingE, standardMW, standardMNW, ErgomouseNW, ErgomouseW, shortkey, longkey, riserA, riserNA, BagA, BagB, BagC, mousepadA, mousepadB, wristpadA, wristpadB)
    VALUES (NEW.ID, unserialize_value(NEW.meta_value, 'laptop'), unserialize_value(NEW.meta_value, 'standardPC'), unserialize_value(NEW.meta_value, 'external'), unserialize_value(NEW.meta_value, 'dockingNE'), unserialize_value(NEW.meta_value, 'dockingE'), unserialize_value(NEW.meta_value, 'standardMW'), unserialize_value(NEW.meta_value, 'standardMNW'), unserialize_value(NEW.meta_value, 'ErgomouseNW'), unserialize_value(NEW.meta_value, 'ErgomouseW'), unserialize_value(NEW.meta_value, 'shortkey'), unserialize_value(NEW.meta_value, 'longkey'), unserialize_value(NEW.meta_value, 'riserA'), unserialize_value(NEW.meta_value, 'riserNA'), unserialize_value(NEW.meta_value, 'BagA'), unserialize_value(NEW.meta_value, 'BagB'), unserialize_value(NEW.meta_value, 'BagC'), unserialize_value(NEW.meta_value, 'mousepadA'), unserialize_value(NEW.meta_value, 'mousepadB'), unserialize_value(NEW.meta_value, 'wristpadA'), unserialize_value(NEW.meta_value, 'wristpadB'));
END;
//

-- Trigger for inserting into wp_ebss_part_2_2
DELIMITER //
CREATE TRIGGER insert_into_wp_ebss_part_2_2
AFTER INSERT ON wp_metforms
FOR EACH ROW
BEGIN
    INSERT INTO wp_ebss_part_2_2 (ID, laptop2, standardPC2, external2, dockingNE2, dockingE2, standardMW2, standardMNW2, ErgomouseNW2, ErgomouseW2, shortkey2, longkey2, riserA2, riserNA2, BagA2, BagB2, BagC2, mousepadA2, mousepadB2, wristpadA2, wristpadB2)
    VALUES (NEW.ID, unserialize_value(NEW.meta_value, 'laptop2'), unserialize_value(NEW.meta_value, 'standardPC2'), unserialize_value(NEW.meta_value, 'external2'), unserialize_value(NEW.meta_value, 'dockingNE2'), unserialize_value(NEW.meta_value, 'dockingE2'), unserialize_value(NEW.meta_value, 'standardMW2'), unserialize_value(NEW.meta_value, 'standardMNW2'), unserialize_value(NEW.meta_value, 'ErgomouseNW2'), unserialize_value(NEW.meta_value, 'ErgomouseW2'), unserialize_value(NEW.meta_value, 'shortkey2'), unserialize_value(NEW.meta_value, 'longkey2'), unserialize_value(NEW.meta_value, 'riserA2'), unserialize_value(NEW.meta_value, 'riserNA2'), unserialize_value(NEW.meta_value, 'BagA2'), unserialize_value(NEW.meta_value, 'BagB2'), unserialize_value(NEW.meta_value, 'BagC2'), unserialize_value(NEW.meta_value, 'mousepadA2'), unserialize_value(NEW.meta_value, 'mousepadB2'), unserialize_value(NEW.meta_value, 'wristpadA2'), unserialize_value(NEW.meta_value, 'wristpadB2'));
END;
//

-- Trigger for inserting into wp_ebss_part_3
DELIMITER //
CREATE TRIGGER insert_into_wp_ebss_part_3
AFTER INSERT ON wp_metforms
FOR EACH ROW
BEGIN
    INSERT INTO wp_ebss_part_3 (ID, headMid, headRight, headLeft, neckMid, neckRight, neckLeft, UpshoulderRight, UpshoulderLeft, shoulderJointRight, shoulderJointLeft, elbowRight, elbowLeft, upperFright, upperFlight, upperWristRight, upperWristLeft, lowerWristRight, lowerWristLeft, fingersRight, fingersLeft, LowerBackMid, LowerBackRight, LowerBackLeft, torsoMid, torsoRight, torsoLeft, hipJointRight, hipJointLeft, kneeRight, kneeLeft, calvesRight, calvesLeft, ankleRight, ankleLeft, HeelsRight, HeelsLeft)
    VALUES (NEW.ID, unserialize_value(NEW.meta_value, 'headMid'), unserialize_value(NEW.meta_value, 'headRight'), unserialize_value(NEW.meta_value, 'headLeft'), unserialize_value(NEW.meta_value, 'neckMid'), unserialize_value(NEW.meta_value, 'neckRight'), unserialize_value(NEW.meta_value, 'neckLeft'), unserialize_value(NEW.meta_value, 'UpshoulderRight'), unserialize_value(NEW.meta_value, 'UpshoulderLeft'), unserialize_value(NEW.meta_value, 'shoulderJointRight'), unserialize_value(NEW.meta_value, 'shoulderJointLeft'), unserialize_value(NEW.meta_value, 'elbowRight'), unserialize_value(NEW.meta_value, 'elbowLeft'), unserialize_value(NEW.meta_value, 'upperFright'), unserialize_value(NEW.meta_value, 'upperFlight'), unserialize_value(NEW.meta_value, 'upperWristRight'), unserialize_value(NEW.meta_value, 'upperWristLeft'), unserialize_value(NEW.meta_value, 'lowerWristRight'), unserialize_value(NEW.meta_value, 'lowerWristLeft'), unserialize_value(NEW.meta_value, 'fingersRight'), unserialize_value(NEW.meta_value, 'fingersLeft'), unserialize_value(NEW.meta_value, 'LowerBackMid'), unserialize_value(NEW.meta_value, 'LowerBackRight'), unserialize_value(NEW.meta_value, 'LowerBackLeft'), unserialize_value(NEW.meta_value, 'torsoMid'), unserialize_value(NEW.meta_value, 'torsoRight'), unserialize_value(NEW.meta_value, 'torsoLeft'), unserialize_value(NEW.meta_value, 'hipJointRight'), unserialize_value(NEW.meta_value, 'hipJointLeft'), unserialize_value(NEW.meta_value, 'kneeRight'), unserialize_value(NEW.meta_value, 'kneeLeft'), unserialize_value(NEW.meta_value, 'calvesRight'), unserialize_value(NEW.meta_value, 'calvesLeft'), unserialize_value(NEW.meta_value, 'ankleRight'), unserialize_value(NEW.meta_value, 'ankleLeft'), unserialize_value(NEW.meta_value, 'HeelsRight'), unserialize_value(NEW.meta_value, 'HeelsLeft'));
END;
//

-- Trigger for inserting into wp_ebss_part_4
DELIMITER //
CREATE TRIGGER insert_into_wp_ebss_part_4
AFTER INSERT ON wp_metforms
FOR EACH ROW
BEGIN
    INSERT INTO wp_ebss_part_4 (ID, radio1, radio2, radio3, radio4, radio5, radio6, radio7, radio8, radio9, radio10, radio11, radio12, radio13, radio14, radio15, radio16, radio17, radio18, radio19, radio20, radio21, radio22, radio23, radio24, radio25, radio26, radio27, radio28, radio29, radio30, radio31, radio32, radio33, radio34, radio35, radio36, radio37, radio38, radio39, radio40, radio41, radio42)
    VALUES (NEW.ID, unserialize_value(NEW.meta_value, 'radio1'), unserialize_value(NEW.meta_value, 'radio2'), unserialize_value(NEW.meta_value, 'radio3'), unserialize_value(NEW.meta_value, 'radio4'), unserialize_value(NEW.meta_value, 'radio5'), unserialize_value(NEW.meta_value, 'radio6'), unserialize_value(NEW.meta_value, 'radio7'), unserialize_value(NEW.meta_value, 'radio8'), unserialize_value(NEW.meta_value, 'radio9'), unserialize_value(NEW.meta_value, 'radio10'), unserialize_value(NEW.meta_value, 'radio11'), unserialize_value(NEW.meta_value, 'radio12'), unserialize_value(NEW.meta_value, 'radio13'), unserialize_value(NEW.meta_value, 'radio14'), unserialize_value(NEW.meta_value, 'radio15'), unserialize_value(NEW.meta_value, 'radio16'), unserialize_value(NEW.meta_value, 'radio17'), unserialize_value(NEW.meta_value, 'radio18'), unserialize_value(NEW.meta_value, 'radio19'), unserialize_value(NEW.meta_value, 'radio20'), unserialize_value(NEW.meta_value, 'radio21'), unserialize_value(NEW.meta_value, 'radio22'), unserialize_value(NEW.meta_value, 'radio23'), unserialize_value(NEW.meta_value, 'radio24'), unserialize_value(NEW.meta_value, 'radio25'), unserialize_value(NEW.meta_value, 'radio26'), unserialize_value(NEW.meta_value, 'radio27'), unserialize_value(NEW.meta_value, 'radio28'), unserialize_value(NEW.meta_value, 'radio29'), unserialize_value(NEW.meta_value, 'radio30'), unserialize_value(NEW.meta_value, 'radio31'), unserialize_value(NEW.meta_value, 'radio32'), unserialize_value(NEW.meta_value, 'radio33'), unserialize_value(NEW.meta_value, 'radio34'), unserialize_value(NEW.meta_value, 'radio35'), unserialize_value(NEW.meta_value, 'radio36'), unserialize_value(NEW.meta_value, 'radio37'), unserialize_value(NEW.meta_value, 'radio38'), unserialize_value(NEW.meta_value, 'radio39'), unserialize_value(NEW.meta_value, 'radio40'), unserialize_value(NEW.meta_value, 'radio41'), unserialize_value(NEW.meta_value, 'radio42'));
END;
//

DELIMITER ;
