-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`child`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`child` (
  `child_id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(40) NOT NULL,
  `last_name` VARCHAR(40) NOT NULL,
  `birth_date` DATE NOT NULL,
  `cpr` VARCHAR(64) NOT NULL,
  `special_request` TEXT NULL,
  `is_waiting` TINYINT(1) NOT NULL,
  `signup_date` TIMESTAMP NOT NULL,
  PRIMARY KEY (`child_id`),
  UNIQUE INDEX `cpr_UNIQUE` (`cpr` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`address`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`address` (
  `address_id` INT NOT NULL AUTO_INCREMENT,
  `city` VARCHAR(25) NULL,
  `zip_code` VARCHAR(4) NOT NULL,
  `street` VARCHAR(30) NULL,
  `house_number` VARCHAR(5) NULL,
  `door_number` VARCHAR(5) NULL,
  PRIMARY KEY (`address_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`parent`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`parent` (
  `parent_id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(40) NOT NULL,
  `last_name` VARCHAR(40) NOT NULL,
  `birth_date` DATE NULL,
  `cpr` VARCHAR(64) NOT NULL,
  `email` VARCHAR(64) NULL,
  `address_id` INT NOT NULL,
  PRIMARY KEY (`parent_id`),
  INDEX `fk_parent_address1_idx` (`address_id` ASC) VISIBLE,
  CONSTRAINT `fk_parent_address1`
    FOREIGN KEY (`address_id`)
    REFERENCES `mydb`.`address` (`address_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`employee`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`employee` (
  `employee_id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(40) NOT NULL,
  `last_name` VARCHAR(40) NOT NULL,
  `cpr` VARCHAR(64) NOT NULL,
  `birth_date` DATE NOT NULL,
  `work_hours` DOUBLE NOT NULL,
  `salary_per_hour` INT NOT NULL,
  `bank_account` VARCHAR(64) NOT NULL,
  `address_address_id` INT NOT NULL,
  PRIMARY KEY (`employee_id`),
  INDEX `fk_employee_address1_idx` (`address_address_id` ASC) VISIBLE,
  CONSTRAINT `fk_employee_address1`
    FOREIGN KEY (`address_address_id`)
    REFERENCES `mydb`.`address` (`address_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`phone`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`phone` (
  `idphone` INT NOT NULL AUTO_INCREMENT,
  `phone_number` VARCHAR(30) NOT NULL,
  `phone_type` VARCHAR(20) NULL,
  `parent_id` INT NOT NULL,
  `employee_employee_id` INT NOT NULL,
  PRIMARY KEY (`idphone`),
  INDEX `fk_phone_parent1_idx` (`parent_id` ASC) VISIBLE,
  INDEX `fk_phone_employee1_idx` (`employee_employee_id` ASC) VISIBLE,
  CONSTRAINT `fk_phone_parent1`
    FOREIGN KEY (`parent_id`)
    REFERENCES `mydb`.`parent` (`parent_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_phone_employee1`
    FOREIGN KEY (`employee_employee_id`)
    REFERENCES `mydb`.`employee` (`employee_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`child_has_parent`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`child_has_parent` (
  `child_id` INT NOT NULL,
  `parent_id` INT NOT NULL,
  PRIMARY KEY (`child_id`, `parent_id`),
  INDEX `fk_child_has_parent_parent1_idx` (`parent_id` ASC) VISIBLE,
  INDEX `fk_child_has_parent_child_idx` (`child_id` ASC) VISIBLE,
  CONSTRAINT `fk_child_has_parent_child`
    FOREIGN KEY (`child_id`)
    REFERENCES `mydb`.`child` (`child_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_child_has_parent_parent1`
    FOREIGN KEY (`parent_id`)
    REFERENCES `mydb`.`parent` (`parent_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`attendance?`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`attendance?` (
  `attendance_id` INT NOT NULL,
  `time_in` DATETIME NULL,
  `time_out` DATETIME NULL,
  `attendancecol` VARCHAR(45) NULL,
  PRIMARY KEY (`attendance_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`invoice`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`invoice` (
  `invoice_id` INT NOT NULL AUTO_INCREMENT,
  `invoicecol` VARCHAR(45) NULL,
  PRIMARY KEY (`invoice_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`invoice`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`invoice` (
  `invoice_id` INT NOT NULL AUTO_INCREMENT,
  `invoicecol` VARCHAR(45) NULL,
  PRIMARY KEY (`invoice_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`waiting_list`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`waiting_list` (
)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
