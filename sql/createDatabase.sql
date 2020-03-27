# SQL script for setting up the tables for Roskilde Daycare project

-- -----------------------------------------------------
-- Schema roskilde_daycare
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `roskilde_daycare` DEFAULT CHARACTER SET utf8;
USE `roskilde_daycare`;

-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS = @@UNIQUE_CHECKS, UNIQUE_CHECKS = 0;
SET @OLD_FOREIGN_KEY_CHECKS = @@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS = 0;
SET @OLD_SQL_MODE = @@SQL_MODE, SQL_MODE =
        'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Table `roskilde_daycare`.`child`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `roskilde_daycare`.`child` (
    `child_id`        INT         NOT NULL AUTO_INCREMENT,
    `first_name`      VARCHAR(40) NOT NULL,
    `last_name`       VARCHAR(40) NOT NULL,
    `birth_date`      DATE        NOT NULL,
    `cpr`             VARCHAR(64) NOT NULL,
    `special_request` TEXT,
    `is_waiting`      TINYINT(1)  NOT NULL,
    `signup_date`     DATETIME DEFAULT CURRENT_TIMESTAMP(),
    PRIMARY KEY (`child_id`)
)
    ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `roskilde_daycare`.`address`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `roskilde_daycare`.`address` (
    `address_id`   INT        NOT NULL AUTO_INCREMENT,
    `city`         VARCHAR(25),
    `zip_code`     VARCHAR(6) NOT NULL,
    `street`       VARCHAR(30),
    `house_number` VARCHAR(5),
    `door_number`  VARCHAR(5),
    PRIMARY KEY (`address_id`)
)
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `roskilde_daycare`.`parent`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `roskilde_daycare`.`parent` (
    `parent_id`  INT         NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `first_name` VARCHAR(40) NOT NULL,
    `last_name`  VARCHAR(40) NOT NULL,
    `birth_date` DATE,
    `cpr`        VARCHAR(64) NOT NULL,
    `email`      VARCHAR(64),
    `address_id` INT,
    CONSTRAINT `fk_parent_address1`
        FOREIGN KEY (`address_id`)
            REFERENCES `roskilde_daycare`.`address` (`address_id`)
            ON DELETE SET NULL
            ON UPDATE CASCADE
)
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `roskilde_daycare`.`employee`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `roskilde_daycare`.`employee` (
    `employee_id`     INT         NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `first_name`      VARCHAR(40) NOT NULL,
    `last_name`       VARCHAR(40) NOT NULL,
    `cpr`             VARCHAR(64) NOT NULL,
    `birth_date`      DATE        NOT NULL,
    `work_hours`      DOUBLE      NOT NULL,
    `salary_per_hour` INT         NOT NULL,
    `bank_account`    VARCHAR(64) NOT NULL,
    `address_id`      INT,
    CONSTRAINT `fk_employee_address1`
        FOREIGN KEY (`address_id`)
            REFERENCES `roskilde_daycare`.`address` (`address_id`)
            ON DELETE SET NULL
            ON UPDATE CASCADE
)
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `roskilde_daycare`.`phone`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `roskilde_daycare`.`phone` (
    `idphone`      INT         NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `phone_number` VARCHAR(30) NOT NULL,
    `phone_type`   VARCHAR(20),
    `parent_id`    INT,
    `employee_id`  INT,
    CONSTRAINT `fk_phone_parent1`
        FOREIGN KEY (`parent_id`)
            REFERENCES `roskilde_daycare`.`parent` (`parent_id`)
            ON DELETE CASCADE
            ON UPDATE CASCADE,
    CONSTRAINT `fk_phone_employee1`
        FOREIGN KEY (`employee_id`)
            REFERENCES `roskilde_daycare`.`employee` (`employee_id`)
            ON DELETE CASCADE
            ON UPDATE CASCADE
)
    ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `roskilde_daycare`.`child_has_parent`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `roskilde_daycare`.`child_has_parent` (
    `child_id`  INT NOT NULL,
    `parent_id` INT NOT NULL,
    PRIMARY KEY (`child_id`, `parent_id`),
    CONSTRAINT `fk_child_has_parent_child`
        FOREIGN KEY (`child_id`)
            REFERENCES `roskilde_daycare`.`child` (`child_id`)
            ON DELETE CASCADE
            ON UPDATE CASCADE,
    CONSTRAINT `fk_child_has_parent_parent1`
        FOREIGN KEY (`parent_id`)
            REFERENCES `roskilde_daycare`.`parent` (`parent_id`)
            ON DELETE CASCADE
            ON UPDATE CASCADE
)
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `roskilde_daycare`.`group`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `roskilde_daycare`.`group` (
    `group_id`   INT NOT NULL,
    `child_id`   INT NOT NULL,
    `group_name` VARCHAR(15),
    PRIMARY KEY (group_id, child_id),
    CONSTRAINT `fk_group_child1`
        FOREIGN KEY (`child_id`)
            REFERENCES `roskilde_daycare`.`child` (`child_id`)
            ON DELETE CASCADE
            ON UPDATE CASCADE
)
    ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `roskilde_daycare`.`schedule`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `roskilde_daycare`.`schedule` (
    `schedule_id` INT         NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `start_time`  DATETIME    NOT NULL,
    `end_time`    DATETIME    NOT NULL,
    `position`    VARCHAR(20) NOT NULL,
    `employee_id` INT,
    `group_id`    INT,
    CONSTRAINT `fk_schedule_employee1`
        FOREIGN KEY (`employee_id`)
            REFERENCES `roskilde_daycare`.`employee` (`employee_id`)
            ON DELETE SET NULL
            ON UPDATE CASCADE,
    CONSTRAINT `fk_schedule_group1`
        FOREIGN KEY (`group_id`)
            REFERENCES `roskilde_daycare`.`group` (`group_id`)
            ON DELETE SET NULL
            ON UPDATE CASCADE
)
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `roskilde_daycare`.`attendance`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `roskilde_daycare`.`attendance` (
    `attendance_id` INT NOT NULL PRIMARY KEY,
    `time_in`       DATETIME,
    `time_out`      DATETIME,
    `attendance`    VARCHAR(45)
)
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `roskilde_daycare`.`invoice`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `roskilde_daycare`.`invoice` (
    `invoice_id`   INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `invoice_info` VARCHAR(45)
)
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `roskilde_daycare`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `roskilde_daycare`.`user` (
    `user_id`      INT         NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `user_name`    VARCHAR(20) NOT NULL,
    `account_type` VARCHAR(20),
    `employee_id`  INT DEFAULT NULL,
    CONSTRAINT `fk_user_employee1`
        FOREIGN KEY (`employee_id`)
            REFERENCES `roskilde_daycare`.`employee` (`employee_id`)
            ON DELETE SET NULL
            ON UPDATE CASCADE
)
    ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `roskilde_daycare`.`log`
-- Contains log files for everything that happens in the roskilde_daycare schema
-- Filled by triggers
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS roskilde_daycare.log (
    log_id     INT PRIMARY KEY AUTO_INCREMENT,
    user_id    TEXT,
    action     VARCHAR(10),
    table_name VARCHAR(15),
    log_time   DATETIME(6),
    data       TEXT
);

SET SQL_MODE = @OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS = @OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS = @OLD_UNIQUE_CHECKS;
