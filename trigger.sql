/* trigger for same data return */
DELIMITER //
CREATE TRIGGER after_insert_wpbk_postmeta_specific_key
AFTER INSERT
ON wpbk_postmeta FOR EACH ROW
BEGIN
    IF NEW.meta_key = 'metform_entries__form_data' THEN
        INSERT INTO wp_metforms (meta_id, post_id, meta_value)
        VALUES (NEW.meta_id, NEW.post_id, NEW.meta_value);
    END IF;
END; //
DELIMITER ;

/*trigger for return to all table parts*/

DELIMITER $$

CREATE TRIGGER insert_into_partitions
AFTER INSERT ON wp_metforms
FOR EACH ROW
BEGIN
    INSERT IGNORE INTO wp_ebss_part_1 (column1, column2) VALUES (NEW.column1, NEW.column2);
    INSERT IGNORE INTO wp_ebss_part_2_1 (column1, column2) VALUES (NEW.column1, NEW.column2);
    INSERT IGNORE INTO wp_ebss_part_2_1 (column1, column2) VALUES (NEW.column1, NEW.column2);
    INSERT IGNORE INTO wp_ebss_part_3 (column1, column2) VALUES (NEW.column1, NEW.column2);
    INSERT IGNORE INTO wp_ebss_part_4 (column1, column2) VALUES (NEW.column1, NEW.column2);
END$$

DELIMITER ;

/*trigger column meta_value data insert into wb_ebss_part_1 columns ( email address , .. )*/

DELIMITER //

CREATE TRIGGER insert_into_wp_ebss_part_1
AFTER INSERT ON wp_metforms
FOR EACH ROW
BEGIN
    DECLARE startPos INT;
    DECLARE endPos INT;
    DECLARE keyLength INT;
    DECLARE valLength INT;
    DECLARE keyValue VARCHAR(255);
    DECLARE keyName VARCHAR(255);
    DECLARE valueStartPos INT;
    DECLARE valueEndPos INT;

    -- Find the position of the first occurrence of 's:' (serialized data)
    SET startPos = LOCATE('s:', NEW.meta_value);

    -- Loop until startPos is 0, meaning no more serialized data found
    WHILE startPos != 0 DO
        -- Find the position of the first ':' after 's:'
        SET endPos = LOCATE(':', NEW.meta_value, startPos + 2);
        -- Extract the length of the serialized data
        SET keyLength = SUBSTRING(NEW.meta_value, startPos + 2, endPos - startPos - 2);

        -- Find the position of the first '"' after ':'
        SET valueStartPos = endPos + 2;
        SET valueEndPos = LOCATE('"', NEW.meta_value, valueStartPos);
        -- Extract the serialized data
        SET keyValue = SUBSTRING(NEW.meta_value, valueStartPos, valueEndPos - valueStartPos);

        -- Find the position of the next 's:'
        SET startPos = LOCATE('s:', NEW.meta_value, valueEndPos);

        -- Extract key name and value
        SET keyName = SUBSTRING_INDEX(keyValue, '";s:', 1);
        SET keyValue = SUBSTRING_INDEX(keyValue, '";s:', -1);

        -- Insert into wp_ebss_part_1 table
        CASE keyName
            WHEN 'email_address' THEN
                INSERT INTO wp_ebss_part_1 (user_id, email_address_column)
                VALUES (NEW.user_id, keyValue);
            -- Add additional cases for other key names as needed
        END CASE;
    END WHILE;
END //

DELIMITER ;

/* trigger to update row in table wp_ebss_part_1 */

DELIMITER //

CREATE TRIGGER update_wp_metforms
AFTER INSERT ON wp_ebss_part_1
FOR EACH ROW
BEGIN
    DECLARE serialized_data VARCHAR(255);
    DECLARE email_address LONGTEXT;
    DECLARE full_name LONGTEXT;
    DECLARE first_name LONGTEXT;
    DECLARE last_name LONGTEXT;;
    DECLARE staff_ID LONGTEXT;
    DECLARE clientName LONGTEXT;
    DECLARE company_email LONGTEXT;
    DECLARE job_title LONGTEXT;
    DECLARE gender_type LONGTEXT;
    DECLARE work_location LONGTEXT;
    DECLARE department LONGTEXT;
    DECLARE work_section LONGTEXT;
    DECLARE year_service LONGTEXT;

    -- Get the serialized data for the inserted row
    SELECT meta_value INTO serialized_data
    FROM wp_metforms
    WHERE user_id = NEW.user_id;

    -- Extract values using SUBSTRING_INDEX
    SET email_address = SUBSTRING_INDEX(SUBSTRING_INDEX(serialized_data, 's:13:"email_address";s:', -1), ':"', 1);
    SET full_name = SUBSTRING_INDEX(SUBSTRING_INDEX(serialized_data, 's:9:"full_name";s:', -1), ':"', 1);
    SET first_name = SUBSTRING_INDEX(SUBSTRING_INDEX(serialized_data, 's:10:"first_name";s:', -1), ':"', 1);
    SET last_name = SUBSTRING_INDEX(SUBSTRING_INDEX(serialized_data, 's:9:"last_name";s:', -1), ':"', 1);
    SET staff_ID = SUBSTRING_INDEX(SUBSTRING_INDEX(serialized_data, 's:8:"staff_ID";s:', -1), ':"', 1);
    SET clientName = SUBSTRING_INDEX(SUBSTRING_INDEX(serialized_data, 's:10:"clientName";s:', -1), ':"', 1);
    SET company_email = SUBSTRING_INDEX(SUBSTRING_INDEX(serialized_data, 's:13:"company_email";s:', -1), ':"', 1);
    SET job_title = SUBSTRING_INDEX(SUBSTRING_INDEX(serialized_data, 's:9:"job_title";s:', -1), ':"', 1);
    SET gender_type = SUBSTRING_INDEX(SUBSTRING_INDEX(serialized_data, 's:11:"gender_type";s:', -1), ':"', 1);
    SET work_location = SUBSTRING_INDEX(SUBSTRING_INDEX(serialized_data, 's:13:"work_location";s:', -1), ':"', 1);
    SET department = SUBSTRING_INDEX(SUBSTRING_INDEX(serialized_data, 's:10:"department";s:', -1), ':"', 1);
    SET work_section = SUBSTRING_INDEX(SUBSTRING_INDEX(serialized_data, 's:12:"work_section";s:', -1), ':"', 1);
    SET year_service = SUBSTRING_INDEX(SUBSTRING_INDEX(serialized_data, 's:12:"year_service";s:', -1), ':"', 1);

    -- Update wp_ebss_part_1 with extracted values
    UPDATE wp_ebss_part_1
    SET
        email_address = email_address,
        full_name = full_name,
        first_name = first_name,
        last_name = last_name,
        staff_ID = staff_ID,
        clientName = clientName,
        company_email = company_email,
        job_title = job_title,
        gender_type = gender_type,
        work_location = work_location,
        department = department,
        work_section = work_section,
        year_service = year_service
    WHERE user_id = NEW.user_id;
END;
//

DELIMITER ;



