-- MySQL Script generated by MySQL Workbench
-- czw, 19 lis 2020, 17:38:52
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema wiktor_baza
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `wiktor_baza` ;

-- -----------------------------------------------------
-- Schema wiktor_baza
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `wiktor_baza` ;
USE `wiktor_baza` ;

-- -----------------------------------------------------
-- Table `wiktor_baza`.`user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `wiktor_baza`.`user` ;

CREATE TABLE IF NOT EXISTS `wiktor_baza`.`user` (
  `id` INT(6) UNSIGNED NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(255) NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  `surname` VARCHAR(255) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `wiktor_baza`.`chat`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `wiktor_baza`.`chat` ;

CREATE TABLE IF NOT EXISTS `wiktor_baza`.`chat` (
  `id` INT(6) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `wiktor_baza`.`user_chat`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `wiktor_baza`.`user_chat` ;

CREATE TABLE IF NOT EXISTS `wiktor_baza`.`user_chat` (
  `user_id` INT(6) UNSIGNED NOT NULL,
  `chat_id` INT(6) UNSIGNED NOT NULL,
  UNIQUE INDEX `user_job_id` USING BTREE (`user_id`, `chat_id`),
  PRIMARY KEY (`user_id`, `chat_id`),
  CONSTRAINT `fk_user_chat_1`
    FOREIGN KEY (`user_id`)
    REFERENCES `wiktor_baza`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_chat_2`
    FOREIGN KEY (`chat_id`)
    REFERENCES `wiktor_baza`.`chat` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `wiktor_baza`.`message`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `wiktor_baza`.`message` ;

CREATE TABLE IF NOT EXISTS `wiktor_baza`.`message` (
  `id` INT(6) UNSIGNED NOT NULL AUTO_INCREMENT,
  `text` VARCHAR(255) NOT NULL,
  `created_at` DATETIME NOT NULL,
  `chat_id` INT(6) UNSIGNED NOT NULL,
  `user_id` INT(6) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_message_1_idx` (`user_id` ASC),
  INDEX `fk_message_2_idx` (`chat_id` ASC),
  CONSTRAINT `fk_message_1`
    FOREIGN KEY (`user_id`)
    REFERENCES `wiktor_baza`.`user` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE ,
  CONSTRAINT `fk_message_2`
    FOREIGN KEY (`chat_id`)
    REFERENCES `wiktor_baza`.`chat` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE )
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;