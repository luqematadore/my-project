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
