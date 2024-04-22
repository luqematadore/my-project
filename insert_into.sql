/* PART 1*/

INSERT INTO wp_ebss_part_1 (user_id, email_address, full_name, first_name, last_name, staff_ID, clientName, company_email, job_title, gender_type, work_location, department, work_section, year_service)
SELECT 
   m.user_id,
   SUBSTRING_INDEX(SUBSTRING_INDEX(SUBSTRING_INDEX(m.meta_value, 's:13:"email_address";s:22:"', -1), '";s:9:"full_name"', 1), '"', -1) AS email_address,
   SUBSTRING_INDEX(SUBSTRING_INDEX(SUBSTRING_INDEX(m.meta_value, 's:9:"full_name";s:13:"', -1), '";s:10:"first_name"', 1), '"', -1) AS full_name,
   SUBSTRING_INDEX(SUBSTRING_INDEX(SUBSTRING_INDEX(m.meta_value, 's:10:"first_name";s:6:"', -1), '";s:9:"last_name"', 1), '"', -1) AS first_name,
   SUBSTRING_INDEX(SUBSTRING_INDEX(SUBSTRING_INDEX(m.meta_value, 's:9:"last_name";s:6:"', -1), '";s:8:"staff_ID"', 1), '"', -1) AS last_name,
   SUBSTRING_INDEX(SUBSTRING_INDEX(SUBSTRING_INDEX(m.meta_value, 's:8:"staff_ID";s:5:"', -1), '";s:10:"clientName"', 1), '"', -1) AS staff_ID,
   SUBSTRING_INDEX(SUBSTRING_INDEX(SUBSTRING_INDEX(m.meta_value, 's:10:"clientName";s:9:"', -1), '";s:13:"company_email"', 1), '"', -1) AS clientName,
   SUBSTRING_INDEX(SUBSTRING_INDEX(SUBSTRING_INDEX(m.meta_value, 's:13:"company_email";s:21:"', -1), '";s:9:"job_title"', 1), '"', -1) AS company_email,
   SUBSTRING_INDEX(SUBSTRING_INDEX(SUBSTRING_INDEX(m.meta_value, 's:9:"job_title";s:21:"', -1), '";s:11:"gender_type"', 1), '"', -1) AS job_title,
   SUBSTRING_INDEX(SUBSTRING_INDEX(SUBSTRING_INDEX(m.meta_value, 's:11:"gender_type";s:4:"', -1), '";s:13:"work_location"', 1), '"', -1) AS gender_type,
   SUBSTRING_INDEX(SUBSTRING_INDEX(SUBSTRING_INDEX(m.meta_value, 's:13:"work_location";s:6:"', -1), '";s:10:"department"', 1), '"', -1) AS work_location,
   SUBSTRING_INDEX(SUBSTRING_INDEX(SUBSTRING_INDEX(m.meta_value, 's:10:"department";s:16:"', -1), '";s:12:"work_section"', 1), '"', -1) AS department,
   SUBSTRING_INDEX(SUBSTRING_INDEX(SUBSTRING_INDEX(m.meta_value, 's:12:"work_section";s:20:"', -1), '";s:12:"year_service"', 1), '"', -1) AS work_section,
   SUBSTRING_INDEX(SUBSTRING_INDEX(SUBSTRING_INDEX(m.meta_value, 's:12:"year_service";s:12:"', -1), '";}', 1), '"', -1) AS year_service
FROM wp_metforms m
WHERE m.user_id = 9402;

/* PART 2_1 */
INSERT INTO wp_ebss_part_2 (user_id, laptop, standardPC, external, dockingNE, dockingE, standardMW, standardMNW, ErgomouseNW, ErgomouseW, shortkey, longkey, riserA, riserNA, BagA, BagB, BagC, mousepadA, 
   mousepadB, wristpadA, wristpadB)
SELECT 
    m.user_id,
    SUBSTRING_INDEX(SUBSTRING_INDEX(SUBSTRING_INDEX(m.meta_value, 's:6:"laptop";s:', -1), '";s:10:"standardPC"', 1), '"', -1) AS laptop,
    SUBSTRING_INDEX(SUBSTRING_INDEX(SUBSTRING_INDEX(m.meta_value, 's:10:"standardPC";s:', -1), '";s:8:"external"', 1), '"', -1) AS standardPC,
    SUBSTRING_INDEX(SUBSTRING_INDEX(SUBSTRING_INDEX(m.meta_value, 's:8:"external";s:', -1), '";s:9:"dockingNE"', 1), '"', -1) AS external,
    SUBSTRING_INDEX(SUBSTRING_INDEX(SUBSTRING_INDEX(m.meta_value, 's:9:"dockingNE";s:', -1), '";s:8:"dockingE"', 1), '"', -1) AS dockingNE,
    SUBSTRING_INDEX(SUBSTRING_INDEX(SUBSTRING_INDEX(m.meta_value, 's:8:"dockingE";s:', -1), '";s:10:"standardMW"', 1), '"', -1) AS dockingE,
    SUBSTRING_INDEX(SUBSTRING_INDEX(SUBSTRING_INDEX(m.meta_value, 's:10:"standardMW";s:', -1), '";s:11:"standardMNW"', 1), '"', -1) AS standardMW,
    SUBSTRING_INDEX(SUBSTRING_INDEX(SUBSTRING_INDEX(m.meta_value, 's:11:"standardMNW";s:', -1), '";s:11:"ErgomouseNW"', 1), '"', -1) AS standardMNW,
    SUBSTRING_INDEX(SUBSTRING_INDEX(SUBSTRING_INDEX(m.meta_value, 's:11:"ErgomouseNW";s:', -1), '";s:10:"ErgomouseW"', 1), '"', -1) AS ErgomouseNW,
    SUBSTRING_INDEX(SUBSTRING_INDEX(SUBSTRING_INDEX(m.meta_value, 's:10:"ErgomouseW";s:', -1), '";s:8:"shortkey"', 1), '"', -1) AS ErgomouseW,
    SUBSTRING_INDEX(SUBSTRING_INDEX(SUBSTRING_INDEX(m.meta_value, 's:8:"shortkey";s:', -1), '";s:7:"longkey"', 1), '"', -1) AS shortkey,
    SUBSTRING_INDEX(SUBSTRING_INDEX(SUBSTRING_INDEX(m.meta_value, 's:7:"longkey";s:', -1), '";s:6:"riserA"', 1), '"', -1) AS longkey,
    SUBSTRING_INDEX(SUBSTRING_INDEX(SUBSTRING_INDEX(m.meta_value, 's:6:"riserA";s:', -1), '";s:7:"riserNA"', 1), '"', -1) AS riserA,
    SUBSTRING_INDEX(SUBSTRING_INDEX(SUBSTRING_INDEX(m.meta_value, 's:7:"riserNA";s:', -1), '";s:4:"BagA"', 1), '"', -1) AS riserNA,
    SUBSTRING_INDEX(SUBSTRING_INDEX(SUBSTRING_INDEX(m.meta_value, 's:4:"BagA";s:', -1), '";s:4:"BagB"', 1), '"', -1) AS BagA,
    SUBSTRING_INDEX(SUBSTRING_INDEX(SUBSTRING_INDEX(m.meta_value, 's:4:"BagB";s:', -1), '";s:4:"BagC"', 1), '"', -1) AS BagB,
    SUBSTRING_INDEX(SUBSTRING_INDEX(SUBSTRING_INDEX(m.meta_value, 's:4:"BagC";s:', -1), '";s:9:"mousepadA"', 1), '"', -1) AS BagC,
    SUBSTRING_INDEX(SUBSTRING_INDEX(SUBSTRING_INDEX(m.meta_value, 's:9:"mousepadA";s:', -1), '";s:9:"mousepadB"', 1), '"', -1) AS mousepadA,
    SUBSTRING_INDEX(SUBSTRING_INDEX(SUBSTRING_INDEX(m.meta_value, 's:9:"mousepadB";s:', -1), '";s:9:"wristpadA"', 1), '"', -1) AS mousepadB,
    SUBSTRING_INDEX(SUBSTRING_INDEX(SUBSTRING_INDEX(m.meta_value, 's:9:"wristpadA";s:', -1), '";s:9:"wristpadB"', 1), '"', -1) AS wristpadA,
    SUBSTRING_INDEX(SUBSTRING_INDEX(SUBSTRING_INDEX(m.meta_value, 's:9:"wristpadB";s:', -1), '";}', 1), '"', -1) AS wristpadB
FROM wp_metforms m
WHERE m.user_id = 9398;

