-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema gitinsightsdb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `gitinsightsdb`;
CREATE SCHEMA `gitinsightsdb`;
USE `gitinsightsdb`;
--
-- -----------------------------------------------------
-- Schema gitinsightsdb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `gitinsightsdb` DEFAULT CHARACTER SET latin1 ;
USE `gitinsightsdb` ;

-- -----------------------------------------------------
-- Table `gitinsightsdb`.`owner`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gitinsightsdb`.`owner` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `type` ENUM('user', 'org') NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `owner_type` (`type` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `gitinsightsdb`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gitinsightsdb`.`user` (
  `id` BIGINT(20) NOT NULL,
  `username` VARCHAR(45) NOT NULL,
  `fullname` VARCHAR(45) NOT NULL,
  `date_of_birth` DATE NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC),
  CONSTRAINT `owner_id`
    FOREIGN KEY (`id`)
    REFERENCES `gitinsightsdb`.`owner` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 12
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `gitinsightsdb`.`repo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gitinsightsdb`.`repo` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `owner_id` BIGINT(20) NOT NULL,
  `stars` INT(11) NOT NULL,
  `forks` INT(11) NOT NULL,
  `is_public` BIT(1) NOT NULL,
  `created_at` TIMESTAMP(0) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `idx_repo_name_owner_id` (`name` ASC, `owner_id` ASC),
  INDEX `owner_id` (`owner_id` ASC),
  INDEX `name` (`name` ASC),
  CONSTRAINT `owner`
    FOREIGN KEY (`owner_id`)
    REFERENCES `gitinsightsdb`.`owner` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 214
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `gitinsightsdb`.`commit`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gitinsightsdb`.`commit` (
  `hash` BINARY(40) NOT NULL,
  `user_id` BIGINT(20) NOT NULL,
  `repo_id` BIGINT(20) NOT NULL,
  `created_at` TIMESTAMP NOT NULL,
  `branch` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`hash`),
  INDEX `userID_idx` (`user_id` ASC),
  INDEX `repoID_idx` (`repo_id` ASC),
  CONSTRAINT `userID`
    FOREIGN KEY (`user_id`)
    REFERENCES `gitinsightsdb`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `repoID`
    FOREIGN KEY (`repo_id`)
    REFERENCES `gitinsightsdb`.`repo` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `gitinsightsdb`.`language_repo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gitinsightsdb`.`language_repo` (
  `language` VARCHAR(45) NOT NULL,
  `repo_id` BIGINT(20) NOT NULL,
  `lines_of_code` INT(11) NOT NULL,
  INDEX `repoID_idx` (`repo_id` ASC),
  CONSTRAINT `IDrepo`
    FOREIGN KEY (`repo_id`)
    REFERENCES `gitinsightsdb`.`repo` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `gitinsightsdb`.`organization`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gitinsightsdb`.`organization` (
  `id` BIGINT(20) NOT NULL,
  `description` TEXT NULL DEFAULT NULL,
  `name` VARCHAR(45) NOT NULL,
  `created_at` TIMESTAMP(0) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC),
  CONSTRAINT `owner_id_fk`
    FOREIGN KEY (`id`)
    REFERENCES `gitinsightsdb`.`owner` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `gitinsightsdb`.`organization_user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gitinsightsdb`.`organization_user` (
  `org_id` BIGINT(20) NOT NULL,
  `user_id` BIGINT(20) NOT NULL,
  PRIMARY KEY (`org_id`, `user_id`),
  INDEX `ID_user_idx` (`user_id` ASC),
  CONSTRAINT `ID_user_fk`
    FOREIGN KEY (`user_id`)
    REFERENCES `gitinsightsdb`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `org_id_fk`
    FOREIGN KEY (`org_id`)
    REFERENCES `gitinsightsdb`.`organization` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `gitinsightsdb`.`team`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gitinsightsdb`.`team` (
  `org_id` BIGINT(20) NOT NULL,
  `name` VARCHAR(50) NOT NULL,
  `created_at` TIMESTAMP(0) NOT NULL,
  `description` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`org_id`, `name`),
  INDEX `name` (`name` ASC),
  CONSTRAINT `organization`
    FOREIGN KEY (`org_id`)
    REFERENCES `gitinsightsdb`.`organization` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `gitinsightsdb`.`user_team`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gitinsightsdb`.`user_team` (
  `org_id` BIGINT(20) NOT NULL,
  `user_id` BIGINT(20) NOT NULL,
  `team_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`org_id`, `user_id`, `team_name`),
  INDEX `id_user_idx` (`user_id` ASC),
  INDEX `name_team_fk_idx` (`team_name` ASC),
  CONSTRAINT `id_user_fk_team`
    FOREIGN KEY (`user_id`)
    REFERENCES `gitinsightsdb`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_org_fk_team`
    FOREIGN KEY (`org_id`)
    REFERENCES `gitinsightsdb`.`team` (`org_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `name_team_fk_team`
    FOREIGN KEY (`team_name`)
    REFERENCES `gitinsightsdb`.`team` (`name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `gitinsightsdb`.`issue`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gitinsightsdb`.`issue` (
  `repo_id` BIGINT(20) NOT NULL,
  `title` VARCHAR(45) NOT NULL,
  `description` TEXT NOT NULL,
  `state` ENUM('open', 'closed') NOT NULL,
  `created_at` TIMESTAMP NOT NULL,
  `label` ENUM('bug', 'feature', 'documentation', 'help', 'other') NOT NULL,
  `author` BIGINT(20) NOT NULL,
  PRIMARY KEY (`repo_id`, `title`),
  INDEX `author_fk_idx` (`author` ASC),
  CONSTRAINT `author_fk`
    FOREIGN KEY (`author`)
    REFERENCES `gitinsightsdb`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `repo_id_fk`
    FOREIGN KEY (`repo_id`)
    REFERENCES `gitinsightsdb`.`repo` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gitinsightsdb`.`commit_file`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gitinsightsdb`.`commit_file` (
  `hash` BINARY(40) NOT NULL,
  `repo_id` BIGINT(20) NOT NULL,
  `filename` VARCHAR(45) NOT NULL,
  `action` ENUM('create', 'update', 'delete', 'rename') NOT NULL,
  PRIMARY KEY (`hash`, `repo_id`, `filename`),
  INDEX `repo_id_idx` (`repo_id` ASC),
  CONSTRAINT `hash`
    FOREIGN KEY (`hash`)
    REFERENCES `gitinsightsdb`.`commit` (`hash`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `repo_id`
    FOREIGN KEY (`repo_id`)
    REFERENCES `gitinsightsdb`.`repo` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `gitinsightsdb` ;

-- -----------------------------------------------------
-- Placeholder table for view `gitinsightsdb`.`repos_master_commits`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gitinsightsdb`.`repos_master_commits` (`Repo` INT, `timestamp` INT, `hash` INT);

-- -----------------------------------------------------
-- Placeholder table for view `gitinsightsdb`.`users_latest_commits`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gitinsightsdb`.`users_latest_commits` (`username` INT, `hash` INT, `timestamp` INT);

-- -----------------------------------------------------
-- Placeholder table for view `gitinsightsdb`.`users_no_of_master_commits_in_2019`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gitinsightsdb`.`users_no_of_master_commits_in_2019` (`username` INT, `No_of_master_commits` INT);

-- -----------------------------------------------------
-- View `gitinsightsdb`.`repos_master_commits`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `gitinsightsdb`.`repos_master_commits`;
USE `gitinsightsdb`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `gitinsightsdb`.`repos_master_commits` AS select `gitinsightsdb`.`repo`.`name` AS `Repo`,`gitinsightsdb`.`commit`.`timestamp` AS `timestamp`,`gitinsightsdb`.`commit`.`hash` AS `hash` from (`gitinsightsdb`.`repo` straight_join `gitinsightsdb`.`commit` on((`gitinsightsdb`.`repo`.`repo_id` = `gitinsightsdb`.`commit`.`repo_id`))) where (`gitinsightsdb`.`commit`.`branch` = 'master');

-- -----------------------------------------------------
-- View `gitinsightsdb`.`users_latest_commits`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `gitinsightsdb`.`users_latest_commits`;
USE `gitinsightsdb`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `gitinsightsdb`.`users_latest_commits` AS select `gitinsightsdb`.`user`.`username` AS `username`,`o`.`hash` AS `hash`,`o`.`timestamp` AS `timestamp` from ((`gitinsightsdb`.`commit` `o` left join `gitinsightsdb`.`commit` `b` on(((`o`.`user_id` = `b`.`user_id`) and (`o`.`timestamp` < `b`.`timestamp`)))) join `gitinsightsdb`.`user` on((`gitinsightsdb`.`user`.`user_id` = `o`.`user_id`))) where isnull(`b`.`timestamp`);

-- -----------------------------------------------------
-- View `gitinsightsdb`.`users_no_of_master_commits_in_2019`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `gitinsightsdb`.`users_no_of_master_commits_in_2019`;
USE `gitinsightsdb`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `gitinsightsdb`.`users_no_of_master_commits_in_2019` AS select `gitinsightsdb`.`user`.`username` AS `username`,count(`gitinsightsdb`.`commit`.`hash`) AS `No_of_master_commits` from (`gitinsightsdb`.`user` straight_join `gitinsightsdb`.`commit` on((`gitinsightsdb`.`commit`.`user_id` = `gitinsightsdb`.`user`.`user_id`))) where ((`gitinsightsdb`.`commit`.`branch` = 'master') and (`gitinsightsdb`.`commit`.`timestamp` >= '2019-01-01 00:00:00')) group by `gitinsightsdb`.`user`.`username`;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
