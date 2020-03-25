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
VALUES ('Jan', 'John', '1420-06-09', 'Uc8KsWNQfRpjksSIRDUj2cKhwLPGFSJc1DiBY3jksz71RzzkLVuw3ol7YCEf6Lq7', 'Nuts allergy',
        FALSE, '2020-01-01 11:11:11'),
       ('Gypsi', 'Cris', '1420-06-09', 'kedR9vqBwNW0PX2kT1USIXkwPGPogdBt8RVm2bH420ztpabEYC3U8cqTNCBDqaov', '', FALSE,
        '2020-01-01 11:11:11'),
       ('Alexo', 'Macgangam', '1420-06-09', 'dWAWLHEtFx1RSL889xSvhvDOJjyw1rCQEiz3jln0V7OwFAEL5p0uDkgeERIKuqEn', '',
        TRUE, '2020-01-01 11:11:11'),
       ('TEODEO', 'OREO', '1420-06-09', 'YCtm1o5V5X5QVuHEZVjulbbt8hhm87C3xMdBANZiCtSlMbDCOrdMLugLNf385HmC', 'Corona',
        TRUE, '2020-01-01 11:11:11'),
       ('Violet', 'Mercado', '1420-06-09', '814ZT8LXe0GnNGAWI3w6dAGseSUDTKpDiAtfeiY5OzdlQZ4WwMZgHHu2xcpcWT2u', '', TRUE,
        '2020-01-01 11:11:11'),
       ('Chloe', 'Baldwin', '1420-06-09', 'E6vNWbzWRJgSba9SQ3VVS0mfzu7n1TLDf9FSlRXwHAOktMrrl4JEaGATCbJJA94s', '', FALSE,
        '2020-01-01 11:11:11'),
       ('Constance', 'Skimmer', '1420-06-09', '7Tbgw8ohw3ryRuEv5Mnf3zHzYM77KEkHBBiaNyaiXpDAoGf5q3qNNxE2BeJUrujy', '',
        TRUE, '2020-01-01 11:11:11'),
       ('Eden', 'Gill', '1420-06-09', 'lmikzyVBwTHcLjKqzpvU0GP9caBINqULe4xv61bKq3yaqXYU7j4idiRSk4mUi4Jx', 'Corona',
        TRUE, '2020-01-01 11:11:11');


-- -----------------------------------------------------
-- Table `roskilde_daycare`.`address`
-- An address entry which can be tied to anyone with the foreign key (mainly parents, employees)
-- -----------------------------------------------------
INSERT INTO address(city, zip_code, street, house_number, door_number)
VALUES ('Roskilde', '12345', 'Yeetgade', '69', NULL),
       ('Roskilde', '12369', 'Figureoutgade', '69', NULL),
       ('Fuck all', '42100', 'small dirt path in the woods', '1', NULL),
       ('Roskilde', '11231', 'Strandgade', '112', '42a'),
       ('Roskilde', '13221', 'Steingade', '23', NULL),
       ('Copenhagen', '21001', 'Lygten', '16', '2');


-- -----------------------------------------------------
-- Table `roskilde_daycare`.`parent`
-- Parents of children, multiple parents per child possible
-- -----------------------------------------------------
INSERT INTO parent(first_name, last_name, birth_date, cpr, email, address_id)
VALUES ('Peter', 'Griffin', '1420-06-09', 'tdrucxyghv1', 'peter@hotmail.com', 1),
       ('Emilia', 'Short', '1420-06-10', 'tdrucxyghv2', 'emilia@hotmail.com', 2),
       ('Alexa', 'Peterson', '1420-06-10', 'tdrucxyghv3', 'alexa@hotmail.com', 3),
       ('Siri', 'Malfunction', '1420-06-10', 'tdrucxyghv4', 'siri@apple.fail', 4),
       ('Henry', 'Williams', '1420-06-10', 'tdrucxyghv5', 'henry@knight.holy', 5)
;


-- -----------------------------------------------------
-- Table `roskilde_daycare`.`child_has_parent`
-- A composite key, linking children and parents
-- -----------------------------------------------------
INSERT INTO child_has_parent(child_id, parent_id)
VALUES (1, 1),
       (2, 2),
       (3, 1),
       (4, 2),
       (5, 3),
       (6, 4),
       (7, 4),
       (8, 5);


-- -----------------------------------------------------
-- Table `roskilde_daycare`.`employee`
-- A list of employees. Nothing special here
-- -----------------------------------------------------
INSERT INTO employee (first_name, last_name, cpr, birth_date, work_hours, salary_per_hour, bank_account, address_id)
VALUES ('Inigo', 'Montoya', 'uilkdgjfs1', '1969-11-22', 40, 160, 'xfchgvjbknadsfasdf1', 2),
       ('Nellie', 'Monroe', 'asdawasdg2', '1978-10-01', 20, 170, 'xfchgvjbknadsfasdf1', 6);


-- -----------------------------------------------------
-- Table `roskilde_daycare`.`group`
-- A collection of children, with their own group ID. Used in combination with the schedule
-- -----------------------------------------------------
INSERT INTO roskilde_daycare.group (group_id, child_id, group_name)
VALUES (1, 1, '1a'),
       (1, 2, '1a'),
       (2, 3, '2b'),
       (2, 4, '2b'),
       (1, 5, '1a'),
       (1, 8, '1a');


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
       ('48123456789', 'mobile', 1, 1),
       ('48123431212', 'mobile', 3, 1),
       ('4512315853', 'mobile', 4, 1),
       ('4588263671', 'mobile', NULL, 2);

INSERT INTO user (user_name, account_type, employee_id)
VALUES ('admin', 'admin', 2),
       ('nerd', 'idiot', NULL);