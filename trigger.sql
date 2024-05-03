/* trigger for same data return */
DELIMITER //
CREATE TRIGGER after_insert_wpbk_postmeta_specific_key
AFTER INSERT
ON wpbk_postmeta FOR EACH ROW
BEGIN
    IF NEW.meta_key = 'metform_entries__form_data' THEN
        INSERT INTO wp_metforms (meta_id, post_id, meta_value, datetime)
        VALUES (NEW.meta_id, NEW.post_id, NEW.meta_value, NEW.insert_datetime);
    END IF;
END; //
DELIMITER ;
/* trigger for same data return in different database*/
DELIMITER //
CREATE TRIGGER insert_into_wp_metforms
AFTER INSERT ON if0_35925202_wp84.wpbk_postmeta
FOR EACH ROW
BEGIN
    IF NEW.meta_key = 'metform_entries__form_data' THEN
        INSERT INTO  if0_35925202_mydb.wp_metforms (meta_id, post_id, meta_value)
        VALUES (NEW.meta_id, NEW.post_id, NEW.meta_value);
    END IF;
END//
DELIMITER ;

/*trigger column meta_value data insert into wb_ebss_part_1 columns ( email address , .. )*/

DELIMITER //
CREATE TRIGGER after_insert_wp_metforms
AFTER INSERT
ON wp_metforms FOR EACH ROW
BEGIN
    DECLARE user_id VARCHAR(255);
    DECLARE email_address VARCHAR(255);
    DECLARE full_name VARCHAR(255);
    DECLARE first_name VARCHAR(255);
    DECLARE last_name VARCHAR(255);
    DECLARE staff_ID VARCHAR(50);
    DECLARE clientName VARCHAR(255);
    DECLARE company_email VARCHAR(255);
    DECLARE job_title VARCHAR(255);
    DECLARE gender_type VARCHAR(50);
    DECLARE work_location VARCHAR(255);
    DECLARE department VARCHAR(255);
    DECLARE work_section VARCHAR(255);
    DECLARE year_service VARCHAR(50);
    
    /* Initialize variables */
    SET user_id = NULL;
    SET email_address = NULL;
    SET full_name = NULL;
    SET first_name = NULL;
    SET last_name = NULL;
    SET staff_ID = NULL;
    SET clientName = NULL;
    SET company_email = NULL;
    SET job_title = NULL;
    SET gender_type = NULL;
    SET work_location = NULL;
    SET department = NULL;
    SET work_section = NULL;
    SET year_service = NULL;

    /* Extract values from serialized data */
    SET @serialized_data = NEW.meta_value;
    SET @serialized_data_length = CHAR_LENGTH(@serialized_data);
    SET @pos = 1;
    WHILE @pos < @serialized_data_length DO
        SET @key_start = LOCATE('"', @serialized_data, @pos) + 1;
        SET @key_end = LOCATE('"', @serialized_data, @key_start);
        SET @key = SUBSTRING(@serialized_data, @key_start, @key_end - @key_start);
        SET @value_start = LOCATE('"', @serialized_data, @key_end + 3) + 1;
        SET @value_end = LOCATE('"', @serialized_data, @value_start);
        SET @value = SUBSTRING(@serialized_data, @value_start, @value_end - @value_start);
        
        /* Assign values to appropriate variables */
        CASE @key
            WHEN 'user_id' THEN SET user_id = @value;
            WHEN 'email_address' THEN SET email_address = @value;
            WHEN 'full_name' THEN SET full_name = @value;
            WHEN 'first_name' THEN SET first_name = @value;
            WHEN 'last_name' THEN SET last_name = @value;
            WHEN 'staff_ID' THEN SET staff_ID = @value;
            WHEN 'clientName' THEN SET clientName = @value;
            WHEN 'company_email' THEN SET company_email = @value;
            WHEN 'job_title' THEN SET job_title = @value;
            WHEN 'gender_type' THEN SET gender_type = @value;
            WHEN 'work_location' THEN SET work_location = @value;
            WHEN 'department' THEN SET department = @value;
            WHEN 'work_section' THEN SET work_section = @value;
            WHEN 'year_service' THEN SET year_service = @value;
        END CASE;
        
        SET @pos = @value_end + 2;
    END WHILE;
    
    /* Insert values into wp_ebss_part_1 */
    INSERT INTO wp_ebss_part_1 (user_id, email_address, full_name, first_name, last_name, staff_ID, clientName, company_email, job_title, gender_type, work_location, department, work_section, year_service)
    VALUES (user_id, email_address, full_name, first_name, last_name, staff_ID, clientName, company_email, job_title, gender_type, work_location, department, work_section, year_service);
END; //
DELIMITER ;

/* trigger column meta_value data insert into wb_ebss_part_1 columns ( email address , .. ) V2 */
DELIMITER //
CREATE TRIGGER before_insert_wp_metforms
BEFORE INSERT
ON wp_metforms FOR EACH ROW
BEGIN
    DECLARE serialized_data TEXT;
    DECLARE key_start INT;
    DECLARE key_end INT;
    DECLARE value_start INT;
    DECLARE value_end INT;
    DECLARE key_name VARCHAR(255);
    DECLARE key_value VARCHAR(255);

    SET serialized_data = NEW.meta_value;

    WHILE LOCATE('"', serialized_data) > 0 DO
        SET key_start = LOCATE('"', serialized_data) + 1;
        SET key_end = LOCATE('"', serialized_data, key_start);
        SET key_name = SUBSTRING(serialized_data, key_start, key_end - key_start);

        SET value_start = LOCATE('"', serialized_data, key_end + 3) + 1;
        SET value_end = LOCATE('"', serialized_data, value_start);
        SET key_value = SUBSTRING(serialized_data, value_start, value_end - value_start);

        CASE key_name
            WHEN 'user_id' THEN SET @user_id := key_value;
            WHEN 'email_address' THEN SET @email_address := key_value;
            WHEN 'full_name' THEN SET @full_name := key_value;
            WHEN 'first_name' THEN SET @first_name := key_value;
            WHEN 'last_name' THEN SET @last_name := key_value;
            WHEN 'staff_ID' THEN SET @staff_ID := key_value;
            WHEN 'clientName' THEN SET @clientName := key_value;
            WHEN 'company_email' THEN SET @company_email := key_value;
            WHEN 'job_title' THEN SET @job_title := key_value;
            WHEN 'gender_type' THEN SET @gender_type := key_value;
            WHEN 'work_location' THEN SET @work_location := key_value;
            WHEN 'department' THEN SET @department := key_value;
            WHEN 'work_section' THEN SET @work_section := key_value;
            WHEN 'year_service' THEN SET @year_service := key_value;
        END CASE;

        SET serialized_data = SUBSTRING(serialized_data, value_end + 2);
    END WHILE;

    /* Insert values into wp_ebss_part_1 */
    INSERT INTO wp_ebss_part_1 (user_id, email_address, full_name, first_name, last_name, staff_ID, clientName, company_email, job_title, gender_type, work_location, department, work_section, year_service)
    VALUES (@user_id, @email_address, @full_name, @first_name, @last_name, @staff_ID, @clientName, @company_email, @job_title, @gender_type, @work_location, @department, @work_section, @year_service);
END; //
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



/* trigger to update row in table wp_ebss_part_1 */

DELIMITER //

CREATE TRIGGER update_wp_metforms
AFTER INSERT ON wp_ebss_part_1
FOR EACH ROW
BEGIN
    DECLARE serialized_data VARCHAR(255);
    DECLARE email_address TEXT;
    DECLARE full_name TEXT;
    DECLARE first_name TEXT;
    DECLARE last_name TEXT;
    DECLARE staff_ID TEXT;
    DECLARE clientName TEXT;
    DECLARE company_email TEXT;
    DECLARE job_title TEXT;
    DECLARE gender_type TEXT;
    DECLARE work_location TEXT;
    DECLARE department TEXT;
    DECLARE work_section TEXT;
    DECLARE year_service TEXT;

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



