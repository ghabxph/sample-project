-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema db_gala_blog
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `db_gala_blog` ;

-- -----------------------------------------------------
-- Schema db_gala_blog
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `db_gala_blog` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ;
USE `db_gala_blog` ;

-- -----------------------------------------------------
-- Table `db_gala_blog`.`admin`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_gala_blog`.`admin` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(16) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `name` VARCHAR(120) NOT NULL,
  `password` VARCHAR(60) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_hungarian_ci
COMMENT = 'Administrator table';

CREATE UNIQUE INDEX `username_UNIQUE` ON `db_gala_blog`.`admin` (`username` ASC);

CREATE UNIQUE INDEX `email_UNIQUE` ON `db_gala_blog`.`admin` (`email` ASC);


-- -----------------------------------------------------
-- Table `db_gala_blog`.`blog_author`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_gala_blog`.`blog_author` (
  `id` INT UNSIGNED NOT NULL,
  `username` VARCHAR(16) NOT NULL,
  `name` VARCHAR(120) NOT NULL,
  `email` VARCHAR(32) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `username_UNIQUE` ON `db_gala_blog`.`blog_author` (`username` ASC);

CREATE UNIQUE INDEX `name_UNIQUE` ON `db_gala_blog`.`blog_author` (`name` ASC);

CREATE UNIQUE INDEX `email_UNIQUE` ON `db_gala_blog`.`blog_author` (`email` ASC);


-- -----------------------------------------------------
-- Table `db_gala_blog`.`blog_content`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_gala_blog`.`blog_content` (
  `id` INT NOT NULL,
  `title` VARCHAR(60) NOT NULL,
  `content` TEXT NULL,
  `preview` VARCHAR(255) NULL,
  `img_banner` VARCHAR(255) NULL,
  `date_created` TIMESTAMP NULL,
  `date_updated` TIMESTAMP NULL,
  `blog_author_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_blog_content_blog_author1`
    FOREIGN KEY (`blog_author_id`)
    REFERENCES `db_gala_blog`.`blog_author` (`id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;

CREATE INDEX `fk_blog_content_blog_author1_idx` ON `db_gala_blog`.`blog_content` (`blog_author_id` ASC);


-- -----------------------------------------------------
-- Table `db_gala_blog`.`blog_featured`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_gala_blog`.`blog_featured` (
  `blog_content_id` INT NOT NULL,
  PRIMARY KEY (`blog_content_id`),
  CONSTRAINT `fk_blog_featured_blog_content`
    FOREIGN KEY (`blog_content_id`)
    REFERENCES `db_gala_blog`.`blog_content` (`id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;

CREATE INDEX `fk_blog_featured_blog_content_idx` ON `db_gala_blog`.`blog_featured` (`blog_content_id` ASC);


-- -----------------------------------------------------
-- Table `db_gala_blog`.`blog_category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_gala_blog`.`blog_category` (
  `id` INT UNSIGNED NOT NULL,
  `blog_content_id` INT NOT NULL,
  `category` VARCHAR(32) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_blog_category_blog_content1`
    FOREIGN KEY (`blog_content_id`)
    REFERENCES `db_gala_blog`.`blog_content` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;

CREATE INDEX `fk_blog_category_blog_content1_idx` ON `db_gala_blog`.`blog_category` (`blog_content_id` ASC);


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
