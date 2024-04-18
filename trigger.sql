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
