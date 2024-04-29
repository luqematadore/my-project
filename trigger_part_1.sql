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
