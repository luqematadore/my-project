INSERT INTO target_table (email_address, full_name, first_name, last_name, staff_ID, clientName, company_email, job_title, gender_type, work_location, department, work_section, year_service)
SELECT
    SUBSTRING_INDEX(SUBSTRING_INDEX(meta_value, '";', 2), ':"', -1) AS email_address,
    SUBSTRING_INDEX(SUBSTRING_INDEX(meta_value, '";', 4), ':"', -1) AS full_name,
    SUBSTRING_INDEX(SUBSTRING_INDEX(meta_value, '";', 6), ':"', -1) AS first_name,
    SUBSTRING_INDEX(SUBSTRING_INDEX(meta_value, '";', 8), ':"', -1) AS last_name,
    SUBSTRING_INDEX(SUBSTRING_INDEX(meta_value, '";', 10), ':"', -1) AS staff_ID,
    SUBSTRING_INDEX(SUBSTRING_INDEX(meta_value, '";', 12), ':"', -1) AS clientName,
    SUBSTRING_INDEX(SUBSTRING_INDEX(meta_value, '";', 14), ':"', -1) AS company_email,
    SUBSTRING_INDEX(SUBSTRING_INDEX(meta_value, '";', 16), ':"', -1) AS job_title,
    SUBSTRING_INDEX(SUBSTRING_INDEX(meta_value, '";', 18), ':"', -1) AS gender_type,
    SUBSTRING_INDEX(SUBSTRING_INDEX(meta_value, '";', 20), ':"', -1) AS work_location,
    SUBSTRING_INDEX(SUBSTRING_INDEX(meta_value, '";', 22), ':"', -1) AS department,
    SUBSTRING_INDEX(SUBSTRING_INDEX(meta_value, '";', 24), ':"', -1) AS work_section,
    SUBSTRING_INDEX(SUBSTRING_INDEX(meta_value, '";', 26), ':"', -1) AS year_service
FROM source_table;
