INSERT INTO wp_ebss_part_1 (email_address, full_name, first_name, last_name, staff_ID, clientName, company_email, job_title, gender_type, work_location, department, work_section, year_service)
SELECT 
   SUBSTRING_INDEX(SUBSTRING_INDEX(SUBSTRING_INDEX(meta_value, 's:13:"email_address";s:22:"', -1), '";s:9:"full_name"', 1), '"', -1) AS email_address,
   SUBSTRING_INDEX(SUBSTRING_INDEX(SUBSTRING_INDEX(meta_value, 's:9:"full_name";s:13:"', -1), '";s:10:"first_name"', 1), '"', -1) AS full_name,
   SUBSTRING_INDEX(SUBSTRING_INDEX(SUBSTRING_INDEX(meta_value, 's:10:"first_name";s:6:"', -1), '";s:9:"last_name"', 1), '"', -1) AS first_name,
   SUBSTRING_INDEX(SUBSTRING_INDEX(SUBSTRING_INDEX(meta_value, 's:9:"last_name";s:6:"', -1), '";s:8:"staff_ID"', 1), '"', -1) AS last_name,
   SUBSTRING_INDEX(SUBSTRING_INDEX(SUBSTRING_INDEX(meta_value, 's:8:"staff_ID";s:5:"', -1), '";s:10:"clientName"', 1), '"', -1) AS staff_ID,
   SUBSTRING_INDEX(SUBSTRING_INDEX(SUBSTRING_INDEX(meta_value, 's:10:"clientName";s:9:"', -1), '";s:13:"company_email"', 1), '"', -1) AS clientName,
   SUBSTRING_INDEX(SUBSTRING_INDEX(SUBSTRING_INDEX(meta_value, 's:13:"company_email";s:21:"', -1), '";s:9:"job_title"', 1), '"', -1) AS company_email,
   SUBSTRING_INDEX(SUBSTRING_INDEX(SUBSTRING_INDEX(meta_value, 's:9:"job_title";s:21:"', -1), '";s:11:"gender_type"', 1), '"', -1) AS job_title,
   SUBSTRING_INDEX(SUBSTRING_INDEX(SUBSTRING_INDEX(meta_value, 's:11:"gender_type";s:4:"', -1), '";s:13:"work_location"', 1), '"', -1) AS gender_type,
   SUBSTRING_INDEX(SUBSTRING_INDEX(SUBSTRING_INDEX(meta_value, 's:13:"work_location";s:6:"', -1), '";s:10:"department"', 1), '"', -1) AS work_location,
   SUBSTRING_INDEX(SUBSTRING_INDEX(SUBSTRING_INDEX(meta_value, 's:10:"department";s:16:"', -1), '";s:12:"work_section"', 1), '"', -1) AS department,
   SUBSTRING_INDEX(SUBSTRING_INDEX(SUBSTRING_INDEX(meta_value, 's:12:"work_section";s:20:"', -1), '";s:12:"year_service"', 1), '"', -1) AS work_section,
   SUBSTRING_INDEX(SUBSTRING_INDEX(SUBSTRING_INDEX(meta_value, 's:12:"year_service";s:12:"', -1), '";}', 1), '"', -1) AS year_service
FROM wp_metforms
WHERE meta_key = 'your_meta_key';
