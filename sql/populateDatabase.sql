# SQL script for populating tables in roskilde_daycare with example data for the Roskilde Daycare project

-- -----------------------------------------------------
-- Schema roskilde_daycare
-- -----------------------------------------------------
USE roskilde_daycare;


-- -----------------------------------------------------
-- Table `roskilde_daycare`.`child`
-- A list of children in the system, both ones already accepted and ones waiting
-- -----------------------------------------------------
INSERT INTO child(first_name, last_name, birth_date, cpr, special_request, is_waiting, signup_date)
VALUES ('Jan', 'John', '1420-06-09', 'wesrdtcfyuvgibuhniojmolkæ1', 'Nuts allergy', FALSE, '2020-01-01 11:11:11'),
       ('Gypsi', 'Cris', '1420-06-09', 'wesrdtcfyuvgibuhniojmolkæ2', '', FALSE, '2020-01-01 11:11:11'),
       ('Alexo', 'Macgangam', '1420-06-09', 'wesrdtcfyuvgibuhniojmolkæ3', '', FALSE, '2020-01-01 11:11:11'),
       ('TEODEO', 'OREO', '1420-06-09', 'wesrdtcfyuvgibuhniojmolkæ4', 'Corona', FALSE, '2020-01-01 11:11:11');


-- -----------------------------------------------------
-- Table `roskilde_daycare`.`address`
-- An address entry which can be tied to anyone with the foreign key (mainly parents, employees)
-- -----------------------------------------------------
INSERT INTO address(city, zip_code, street, house_number, door_number)
VALUES ('Roskilde', '12345', 'Yeetgade', '69', NULL),
       ('Roskilde', '12369', 'Figureoutgade', '69', NULL),
       ('Fuck all', '42100', 'small dirt path in the woods', '1', NULL);


-- -----------------------------------------------------
-- Table `roskilde_daycare`.`parent`
-- Parents of children, multiple parents per child possible
-- -----------------------------------------------------
INSERT INTO parent(first_name, last_name, birth_date, cpr, email, address_id)
VALUES ('Peter', 'Griffin', '1420-06-09', 'tdrucxyghv1', 'peter@hotmail.com', 1),
       ('Petur', 'Griffun', '1420-06-10', 'tdrucxyghv2', 'petur@hotmail.com', 3)
;


-- -----------------------------------------------------
-- Table `roskilde_daycare`.`child_has_parent`
-- A composite key, linking children and parents
-- -----------------------------------------------------
INSERT INTO child_has_parent(child_id, parent_id)
VALUES (1, 1),
       (2, 2),
       (3, 1),
       (4, 2);


-- -----------------------------------------------------
-- Table `roskilde_daycare`.`employee`
-- A list of employees. Nothing special here
-- -----------------------------------------------------
INSERT INTO employee (first_name, last_name, cpr, birth_date, work_hours, salary_per_hour, bank_account, address_id)
VALUES ('Inigo', 'Montoya', 'uilkdgjfs1', '1969-11-22', 40, 160, 'xfchgvjbknadsfasdf1', 2);


-- -----------------------------------------------------
-- Table `roskilde_daycare`.`group`
-- A collection of children, with their own group ID. Used in combination with the schedule
-- -----------------------------------------------------
INSERT INTO roskilde_daycare.group (child_id, group_name)
VALUES (1, '1a'),
       (2, '1a'),
       (3, '2b');


-- -----------------------------------------------------
-- Table `roskilde_daycare`.`schedule`
-- A timestamp which ties groups and employees. Can also be used without a group specified, resulting in a normal task
-- -----------------------------------------------------
INSERT INTO schedule(start_time, end_time, position, employee_id, group_id)
VALUES ('2020-01-01 08:30:00', '2020-01-01 10:15:00', 'SWD', 1, 1),
       ('2020-01-01 11:00:00', '2020-01-01 13:30:00', 'SWC', 1, 2);


-- -----------------------------------------------------
-- Table `roskilde_daycare`.`phone`
-- A phone entry which can be tied to either parent, an employee or both
-- -----------------------------------------------------
INSERT INTO phone (phone_number, phone_type, parent_id, employee_id)
VALUES ('4512345678', 'mobile', 1, NULL),
       ('4511122233', 'home', 1, NULL),
       ('48123456789', 'mobile', NULL, 1);