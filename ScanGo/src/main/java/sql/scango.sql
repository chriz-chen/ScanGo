-- MySQL Script generated by MySQL Workbench
-- Thu Jan 25 16:33:54 2024
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema scango
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema scango
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `scango` DEFAULT CHARACTER SET utf8 ;
-- -----------------------------------------------------
-- Schema scango
-- -----------------------------------------------------
USE `scango` ;

-- -----------------------------------------------------
-- Table `scango`.`LEVEL`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `scango`.`LEVEL` ;

CREATE TABLE IF NOT EXISTS `scango`.`LEVEL` (
  `levelId` INT NOT NULL,
  `levelName` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`levelId`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `scango`.`USER`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `scango`.`USER` ;

CREATE TABLE IF NOT EXISTS `scango`.`USER` (
  `userId` INT NOT NULL AUTO_INCREMENT,
  `userName` VARCHAR(50) NOT NULL,
  `password` VARCHAR(100) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `phone` VARCHAR(50) NULL,
  `birthday` DATE NULL,
  `levelId` INT NULL DEFAULT 1,
  `authType` ENUM('ScanGo', 'Google') NULL DEFAULT 'ScanGo',
  `authId` VARCHAR(100) NULL,
  `createDate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`userId`),
  INDEX `leveId_fk_idx` (`levelId` ASC) VISIBLE,
  CONSTRAINT `levelId_fk`
    FOREIGN KEY (`levelId`)
    REFERENCES `scango`.`LEVEL` (`levelId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `scango`.`CATEGORY`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `scango`.`CATEGORY` ;

CREATE TABLE IF NOT EXISTS `scango`.`CATEGORY` (
  `categoryId` INT NOT NULL AUTO_INCREMENT,
  `categoryPart` VARCHAR(45) NOT NULL,
  `categoryName` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`categoryId`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `scango`.`PRODUCT`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `scango`.`PRODUCT` ;

CREATE TABLE IF NOT EXISTS `scango`.`PRODUCT` (
  `productId` INT NOT NULL AUTO_INCREMENT,
  `productName` VARCHAR(255) NOT NULL,
  `price` INT UNSIGNED NOT NULL,
  `unit` VARCHAR(45) NOT NULL,
  `categoryId` INT NOT NULL,
  `inventory` INT UNSIGNED NOT NULL,
  `picture` BLOB NULL,
  `isLaunch` TINYINT(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`productId`),
  INDEX `categoryId_fk_idx` (`categoryId` ASC) VISIBLE,
  CONSTRAINT `categoryId_fk`
    FOREIGN KEY (`categoryId`)
    REFERENCES `scango`.`CATEGORY` (`categoryId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `scango`.`CART`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `scango`.`CART` ;

CREATE TABLE IF NOT EXISTS `scango`.`CART` (
  `userId` INT NOT NULL,
  `productId` INT NOT NULL,
  `productQuantity` INT UNSIGNED NOT NULL,
  INDEX `userId_fk_idx` (`userId` ASC) VISIBLE,
  PRIMARY KEY (`userId`, `productId`),
  INDEX `cartProduct_fk_idx` (`productId` ASC) VISIBLE,
  CONSTRAINT `userId_fk`
    FOREIGN KEY (`userId`)
    REFERENCES `scango`.`USER` (`userId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `cartProduct_fk`
    FOREIGN KEY (`productId`)
    REFERENCES `scango`.`PRODUCT` (`productId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `scango`.`COUPON`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `scango`.`COUPON` ;

CREATE TABLE IF NOT EXISTS `scango`.`COUPON` (
  `couponId` INT NOT NULL AUTO_INCREMENT,
  `couponName` VARCHAR(45) NOT NULL,
  `code` VARCHAR(45) NULL,
  `type` VARCHAR(45) NOT NULL,
  `value` DECIMAL(10,2) NOT NULL,
  `minPurchaseAmount` INT UNSIGNED NULL,
  `description` VARCHAR(255) NOT NULL,
  `startDate` DATE NULL,
  `endDate` DATE NULL,
  `isActive` TINYINT(1) NOT NULL,
  PRIMARY KEY (`couponId`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `scango`.`COUPONUSER`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `scango`.`COUPONUSER` ;

CREATE TABLE IF NOT EXISTS `scango`.`COUPONUSER` (
  `user_coupon_id` INT NOT NULL AUTO_INCREMENT,
  `userId` INT NOT NULL,
  `couponId` INT NOT NULL,
  `acquiredDate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `usedDate` DATETIME NULL,
  `isUsed` TINYINT NOT NULL DEFAULT 0,
  PRIMARY KEY (`user_coupon_id`),
  INDEX `couponId_fk_idx` (`couponId` ASC) VISIBLE,
  CONSTRAINT `couponId_fk`
    FOREIGN KEY (`couponId`)
    REFERENCES `scango`.`COUPON` (`couponId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `user_fk`
    FOREIGN KEY (`userId`)
    REFERENCES `scango`.`USER` (`userId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `scango`.`ORDERS`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `scango`.`ORDERS` ;

CREATE TABLE IF NOT EXISTS `scango`.`ORDERS` (
  `orderId` INT NOT NULL AUTO_INCREMENT,
  `userId` INT NOT NULL,
  `user_coupon_id` INT NULL,
  `createTime` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `orderTotalPrice` INT UNSIGNED NULL,
  `discountTotalPrice` INT UNSIGNED NULL,
  `rating` INT UNSIGNED NULL,
  PRIMARY KEY (`orderId`),
  INDEX `userOrder_fk_idx` (`userId` ASC) VISIBLE,
  CONSTRAINT `userOrder_fk`
    FOREIGN KEY (`userId`)
    REFERENCES `scango`.`USER` (`userId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `user_coupon_id_fk`
    FOREIGN KEY (`user_coupon_id`)
    REFERENCES `scango`.`COUPONUSER` (`user_coupon_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `scango`.`ORDERITEM`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `scango`.`ORDERITEM` ;

CREATE TABLE IF NOT EXISTS `scango`.`ORDERITEM` (
  `orderId` INT NOT NULL,
  `productId` INT NOT NULL,
  `productPrice` INT UNSIGNED NOT NULL,
  `itemQuantity` INT UNSIGNED NOT NULL,
  `itemPrice` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`orderId`, `productId`),
  INDEX `productItem_idx` (`productId` ASC) VISIBLE,
  CONSTRAINT `orderId_fk`
    FOREIGN KEY (`orderId`)
    REFERENCES `scango`.`ORDERS` (`orderId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `productItem`
    FOREIGN KEY (`productId`)
    REFERENCES `scango`.`PRODUCT` (`productId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
