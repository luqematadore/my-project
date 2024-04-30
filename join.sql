/* joining two database */
SELECT if0_35925202_mydb.wp_metforms.*,
  if0_35925202_wp84.wpbk_users.user_email 
  FROM if0_35925202_mydb.wp_metforms 
  JOIN if0_35925202_wp84.wpbk_users ON if0_35925202_mydb.wp_metforms.ID = if0_35925202_wp84.wpbk_users.ID

/* joining two database with specific key */

SELECT 
    if0_35925202_mydb .wp_metforms.*,
    if0_35925202_wp84.wpbk_postmeta.meta_value
FROM 
    if0_35925202_mydb .wp_metforms
JOIN 
    if0_35925202_wp84.wpbk_postmeta ON if0_35925202_mydb .wp_metforms.meta_id = if0_35925202_wp84.wpbk_postmeta.meta_id
WHERE 
    if0_35925202_wp84.wpbk_postmeta.meta_key = 'metform_entries__form_data';
