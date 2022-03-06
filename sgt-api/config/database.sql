SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema sgt-db
-- -----------------------------------------------------
-- DROP SCHEMA IF EXISTS `sgt-db` ;

-- -----------------------------------------------------
-- Schema sgt-db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `sgt-db` DEFAULT CHARACTER SET utf8 ;
USE `sgt-db` ;

-- -----------------------------------------------------
-- Table `sgt-db`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sgt-db`.`users` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sgt-db`.`tasks`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sgt-db`.`tasks` (
  `id` INT NOT NULL,
  `name_task` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sgt-db`.`schedules`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sgt-db`.`schedules` (
  `id` INT NOT NULL,
  `date` DATE NOT NULL,
  `users_id` INT NOT NULL,
  `tasks_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_schedules_users_idx` (`users_id` ASC) VISIBLE,
  INDEX `fk_schedules_tasks1_idx` (`tasks_id` ASC) VISIBLE,
  CONSTRAINT `fk_schedules_users`
    FOREIGN KEY (`users_id`)
    REFERENCES `sgt-db`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_schedules_tasks1`
    FOREIGN KEY (`tasks_id`)
    REFERENCES `sgt-db`.`tasks` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
