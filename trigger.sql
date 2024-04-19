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
    UPDATE wp_metforms
    SET 
        email_address = NEW.email_address,
        full_name = NEW.full_name,
        first_name = NEW.first_name,
        last_name = NEW.last_name,
        staff_ID = NEW.staff_ID,
        clientName = NEW.clientName,
        company_email = NEW.company_email,
        job_title = NEW.job_title,
        gender_type = NEW.gender_type,
        work_location = NEW.work_location,
        department = NEW.department,
        work_section = NEW.work_section,
        year_service = NEW.year_service
    WHERE user_id = NEW.user_id;
END;
//
DELIMITER ;


