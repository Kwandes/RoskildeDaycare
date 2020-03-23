# Triggers for logging changes to tables in roskilde_daycare schema
USE roskilde_daycare;

-- -----------------------------------------------------
-- Table roskilde_daycare.child
-- -----------------------------------------------------
CREATE TRIGGER rd_child_insert
    AFTER INSERT
    ON roskilde_daycare.child
    FOR EACH ROW
BEGIN
    INSERT INTO roskilde_daycare.log(user_id, action, table_name, log_time, data)
    VALUES (USER(),
            'insert',
            'child',
            CURRENT_TIME(6),
            CONCAT(NEW.child_id, ' | ', NEW.first_name, ' ', NEW.last_name, ' | ', NEW.cpr));
END;

CREATE TRIGGER rd_child_update
    BEFORE UPDATE
    ON roskilde_daycare.child
    FOR EACH ROW
BEGIN
    INSERT INTO roskilde_daycare.log(user_id, action, table_name, log_time, data)
    VALUES (USER(),
            'update',
            'child',
            CURRENT_TIME(6),
            CONCAT(NEW.child_id, ' | ', NEW.first_name, ' ', NEW.last_name, ' | ', NEW.cpr));
END;

CREATE TRIGGER rd_child_delete
    BEFORE DELETE
    ON roskilde_daycare.child
    FOR EACH ROW
BEGIN
    INSERT INTO roskilde_daycare.log(user_id, action, table_name, log_time, data)
    VALUES (USER(),
            'delete',
            'child',
            CURRENT_TIME(6),
            CONCAT(OLD.child_id, ' | ', OLD.first_name, ' ', OLD.last_name, ' | ', OLD.cpr));
END;

-- -----------------------------------------------------
-- Table roskilde_daycare.parent
-- -----------------------------------------------------
CREATE TRIGGER rd_parent_insert
    AFTER INSERT
    ON roskilde_daycare.parent
    FOR EACH ROW
BEGIN
    INSERT INTO roskilde_daycare.log(user_id, action, table_name, log_time, data)
    VALUES (USER(),
            'insert',
            'parent',
            CURRENT_TIME(6),
            CONCAT(NEW.parent_id, ' | ', NEW.first_name, ' ', NEW.last_name, ' | ', NEW.cpr));
END;

CREATE TRIGGER rd_parent_update
    BEFORE UPDATE
    ON roskilde_daycare.parent
    FOR EACH ROW
BEGIN
    INSERT INTO roskilde_daycare.log(user_id, action, table_name, log_time, data)
    VALUES (USER(),
            'update',
            'parent',
            CURRENT_TIME(6),
            CONCAT(NEW.parent_id, ' | ', NEW.first_name, ' ', NEW.last_name, ' | ', NEW.cpr));
END;

CREATE TRIGGER rd_parent_delete
    BEFORE DELETE
    ON roskilde_daycare.parent
    FOR EACH ROW
BEGIN
    INSERT INTO roskilde_daycare.log(user_id, action, table_name, log_time, data)
    VALUES (USER(),
            'delete',
            'parent',
            CURRENT_TIME(6),
            CONCAT(OLD.parent_id, ' | ', OLD.first_name, ' ', OLD.last_name, ' | ', OLD.cpr));
END;

-- -----------------------------------------------------
-- Table roskilde_daycare.employee
-- -----------------------------------------------------
CREATE TRIGGER rd_employee_insert
    AFTER INSERT
    ON roskilde_daycare.employee
    FOR EACH ROW
BEGIN
    INSERT INTO roskilde_daycare.log(user_id, action, table_name, log_time, data)
    VALUES (USER(),
            'insert',
            'employee',
            CURRENT_TIME(6),
            CONCAT(NEW.employee_id, ' | ', NEW.first_name, ' ', NEW.last_name, ' | ', NEW.cpr));
END;

CREATE TRIGGER rd_employee_update
    BEFORE UPDATE
    ON roskilde_daycare.employee
    FOR EACH ROW
BEGIN
    INSERT INTO roskilde_daycare.log(user_id, action, table_name, log_time, data)
    VALUES (USER(),
            'update',
            'employee',
            CURRENT_TIME(6),
            CONCAT(NEW.employee_id, ' | ', NEW.first_name, ' ', NEW.last_name, ' | ', NEW.cpr));
END;

CREATE TRIGGER rd_employee_delete
    BEFORE DELETE
    ON roskilde_daycare.employee
    FOR EACH ROW
BEGIN
    INSERT INTO roskilde_daycare.log(user_id, action, table_name, log_time, data)
    VALUES (USER(),
            'delete',
            'employee',
            CURRENT_TIME(6),
            CONCAT(OLD.employee_id, ' | ', OLD.first_name, ' ', OLD.last_name, ' | ', OLD.cpr));
END;

-- -----------------------------------------------------
-- Table roskilde_daycare.group
-- -----------------------------------------------------
CREATE TRIGGER rd_group_insert
    AFTER INSERT
    ON roskilde_daycare.group
    FOR EACH ROW
BEGIN
    INSERT INTO roskilde_daycare.log(user_id, action, table_name, log_time, data)
    VALUES (USER(),
            'insert',
            'group',
            CURRENT_TIME(6),
            CONCAT(NEW.group_id, ' | ', NEW.child_id, ' | ', NEW.group_name));
END;

CREATE TRIGGER rd_group_update
    BEFORE UPDATE
    ON roskilde_daycare.group
    FOR EACH ROW
BEGIN
    INSERT INTO roskilde_daycare.log(user_id, action, table_name, log_time, data)
    VALUES (USER(),
            'update',
            'group',
            CURRENT_TIME(6),
            CONCAT(NEW.group_id, ' | ', NEW.child_id, ' | ', NEW.group_name));
END;

CREATE TRIGGER rd_group_delete
    BEFORE DELETE
    ON roskilde_daycare.group
    FOR EACH ROW
BEGIN
    INSERT INTO roskilde_daycare.log(user_id, action, table_name, log_time, data)
    VALUES (USER(),
            'delete',
            'group',
            CURRENT_TIME(6),
            CONCAT(OLD.group_id, ' | ', OLD.child_id, ' | ', OLD.group_name));
END;

-- -----------------------------------------------------
-- Table roskilde_daycare.schedule
-- -----------------------------------------------------
CREATE TRIGGER rd_schedule_insert
    AFTER INSERT
    ON roskilde_daycare.schedule
    FOR EACH ROW
BEGIN
    INSERT INTO roskilde_daycare.log(user_id, action, table_name, log_time, data)
    VALUES (USER(),
            'insert',
            'schedule',
            CURRENT_TIME(6),
            CONCAT(NEW.schedule_id, ' | ', NEW.group_id, ' | ', NEW.employee_id));
END;

CREATE TRIGGER rd_schedule_update
    BEFORE UPDATE
    ON roskilde_daycare.schedule
    FOR EACH ROW
BEGIN
    INSERT INTO roskilde_daycare.log(user_id, action, table_name, log_time, data)
    VALUES (USER(),
            'update',
            'schedule',
            CURRENT_TIME(6),
            CONCAT(NEW.schedule_id, ' | ', NEW.group_id, ' | ', NEW.employee_id));
END;

CREATE TRIGGER rd_schedule_delete
    BEFORE DELETE
    ON roskilde_daycare.schedule
    FOR EACH ROW
BEGIN
    INSERT INTO roskilde_daycare.log(user_id, action, table_name, log_time, data)
    VALUES (USER(),
            'delete',
            'schedule',
            CURRENT_TIME(6),
            CONCAT(OLD.schedule_id, ' | ', OLD.group_id, ' | ', OLD.employee_id));
END;

-- -----------------------------------------------------
-- Table roskilde_daycare.address
-- -----------------------------------------------------
CREATE TRIGGER rd_address_insert
    AFTER INSERT
    ON roskilde_daycare.address
    FOR EACH ROW
BEGIN
    INSERT INTO roskilde_daycare.log(user_id, action, table_name, log_time, data)
    VALUES (USER(),
            'insert',
            'address',
            CURRENT_TIME(6),
            CONCAT(NEW.address_id, ' | ', NEW.city, ' | ', NEW.zip_code));
END;

CREATE TRIGGER rd_address_update
    BEFORE UPDATE
    ON roskilde_daycare.address
    FOR EACH ROW
BEGIN
    INSERT INTO roskilde_daycare.log(user_id, action, table_name, log_time, data)
    VALUES (USER(),
            'update',
            'address',
            CURRENT_TIME(6),
            CONCAT(NEW.address_id, ' | ', NEW.city, ' | ', NEW.zip_code));
END;

CREATE TRIGGER rd_address_delete
    BEFORE DELETE
    ON roskilde_daycare.address
    FOR EACH ROW
BEGIN
    INSERT INTO roskilde_daycare.log(user_id, action, table_name, log_time, data)
    VALUES (USER(),
            'delete',
            'address',
            CURRENT_TIME(6),
            CONCAT(OLD.address_id, ' | ', OLD.city, ' | ', OLD.zip_code));
END;

-- -----------------------------------------------------
-- Table roskilde_daycare.phone
-- -----------------------------------------------------
CREATE TRIGGER rd_phone_insert
    AFTER INSERT
    ON roskilde_daycare.phone
    FOR EACH ROW
BEGIN
    INSERT INTO roskilde_daycare.log(user_id, action, table_name, log_time, data)
    VALUES (USER(),
            'insert',
            'phone',
            CURRENT_TIME(6),
            CONCAT(NEW.idphone, ' | ', NEW.phone_number));
END;

CREATE TRIGGER rd_phone_update
    BEFORE UPDATE
    ON roskilde_daycare.phone
    FOR EACH ROW
BEGIN
    INSERT INTO roskilde_daycare.log(user_id, action, table_name, log_time, data)
    VALUES (USER(),
            'update',
            'phone',
            CURRENT_TIME(6),
            CONCAT(NEW.idphone, ' | ', NEW.phone_number));
END;

CREATE TRIGGER rd_phone_delete
    BEFORE DELETE
    ON roskilde_daycare.phone
    FOR EACH ROW
BEGIN
    INSERT INTO roskilde_daycare.log(user_id, action, table_name, log_time, data)
    VALUES (USER(),
            'delete',
            'phone',
            CURRENT_TIME(6),
            CONCAT(OLD.idphone, ' | ', OLD.phone_number));
END;

-- -----------------------------------------------------
-- Table roskilde_daycare.user
-- -----------------------------------------------------
CREATE TRIGGER rd_user_insert
    AFTER INSERT
    ON roskilde_daycare.user
    FOR EACH ROW
BEGIN
    INSERT INTO roskilde_daycare.log(user_id, action, table_name, log_time, data)
    VALUES (USER(),
            'insert',
            'user',
            CURRENT_TIME(6),
            CONCAT(NEW.user_id, ' | ', NEW.user_name, ' | ', NEW.password));
END;

CREATE TRIGGER rd_user_update
    BEFORE UPDATE
    ON roskilde_daycare.user
    FOR EACH ROW
BEGIN
    INSERT INTO roskilde_daycare.log(user_id, action, table_name, log_time, data)
    VALUES (USER(),
            'update',
            'user',
            CURRENT_TIME(6),
            CONCAT(NEW.user_id, ' | ', NEW.user_name, ' | ', NEW.password));
END;

CREATE TRIGGER rd_user_delete
    BEFORE DELETE
    ON roskilde_daycare.user
    FOR EACH ROW
BEGIN
    INSERT INTO roskilde_daycare.log(user_id, action, table_name, log_time, data)
    VALUES (USER(),
            'delete',
            'user',
            CURRENT_TIME(6),
            CONCAT(OLD.user_id, ' | ', OLD.user_name, ' | ', OLD.password));
END;
