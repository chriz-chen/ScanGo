
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
-- Table `scango`.`SERVICE`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `scango`.`SERVICE` ;

CREATE TABLE IF NOT EXISTS `scango`.`SERVICE` (
  `serviceId` INT NOT NULL AUTO_INCREMENT,
  `serviceName` VARCHAR(45) NOT NULL,
  `serviceUrl` VARCHAR(100) NULL,
  PRIMARY KEY (`serviceId`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `scango`.`LEVEL`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `scango`.`LEVEL` ;

CREATE TABLE IF NOT EXISTS `scango`.`LEVEL` (
  `levelId` INT NOT NULL AUTO_INCREMENT,
  `serviceId` INT NOT NULL,
  PRIMARY KEY (`levelId`),
  INDEX `serviceId_fk_idx` (`serviceId` ASC) VISIBLE,
  CONSTRAINT `serviceId_fk`
    FOREIGN KEY (`serviceId`)
    REFERENCES `scango`.`SERVICE` (`serviceId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `scango`.`USERINFO`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `scango`.`USERINFO` ;

CREATE TABLE IF NOT EXISTS `scango`.`USERINFO` (
  `userId` INT NOT NULL,
  `userName` VARCHAR(45) NOT NULL,
  `gender` VARCHAR(45) NULL,
  `birthDate` DATETIME NULL,
  `email` VARCHAR(45) NULL,
  `phoneNumber` VARCHAR(45) NULL,
  UNIQUE INDEX `userName_UNIQUE` (`userName` ASC) VISIBLE,
  PRIMARY KEY (`userId`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `scango`.`ACCOUNT`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `scango`.`ACCOUNT` ;

CREATE TABLE IF NOT EXISTS `scango`.`ACCOUNT` (
  `userId` INT NOT NULL AUTO_INCREMENT,
  `userName` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `level` INT NOT NULL,
  `createTime` TIMESTAMP NOT NULL,
  PRIMARY KEY (`userId`),
  INDEX `leveId_fk_idx` (`level` ASC) VISIBLE,
  UNIQUE INDEX `userName_UNIQUE` (`userName` ASC) VISIBLE,
  CONSTRAINT `levelId_fk`
    FOREIGN KEY (`level`)
    REFERENCES `scango`.`LEVEL` (`levelId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `userInfo_fk`
    FOREIGN KEY (`userId`)
    REFERENCES `scango`.`USERINFO` (`userId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `scango`.`POSITION`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `scango`.`POSITION` ;

CREATE TABLE IF NOT EXISTS `scango`.`POSITION` (
  `positionId` INT NOT NULL AUTO_INCREMENT,
  `positionName` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`positionId`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `scango`.`PRODUCT`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `scango`.`PRODUCT` ;

CREATE TABLE IF NOT EXISTS `scango`.`PRODUCT` (
  `productId` INT NOT NULL AUTO_INCREMENT,
  `productName` VARCHAR(45) NOT NULL,
  `price` INT UNSIGNED NOT NULL,
  `unit` VARCHAR(45) NOT NULL,
  `qrCode` VARCHAR(45) NOT NULL,
  `position` INT NOT NULL,
  PRIMARY KEY (`productId`),
  INDEX `position_fk_idx` (`position` ASC) VISIBLE,
  CONSTRAINT `position_fk`
    FOREIGN KEY (`position`)
    REFERENCES `scango`.`POSITION` (`positionId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `scango`.`INVENTORY`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `scango`.`INVENTORY` ;

CREATE TABLE IF NOT EXISTS `scango`.`INVENTORY` (
  `productId` INT NOT NULL AUTO_INCREMENT,
  `inventory` INT UNSIGNED NOT NULL,
  `isLaunch` TINYINT(1) NULL,
  PRIMARY KEY (`productId`),
  CONSTRAINT `productId_fk`
    FOREIGN KEY (`productId`)
    REFERENCES `scango`.`PRODUCT` (`productId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `scango`.`CART`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `scango`.`CART` ;

CREATE TABLE IF NOT EXISTS `scango`.`CART` (
  `cartId` INT NOT NULL AUTO_INCREMENT,
  `userId` INT NOT NULL,
  `isCheckout` TINYINT(1) NULL,
  `checkoutTime` DATETIME NULL,
  PRIMARY KEY (`cartId`),
  INDEX `userId_fk_idx` (`userId` ASC) VISIBLE,
  CONSTRAINT `userId_fk`
    FOREIGN KEY (`userId`)
    REFERENCES `scango`.`ACCOUNT` (`userId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `scango`.`CARTITEM`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `scango`.`CARTITEM` ;

CREATE TABLE IF NOT EXISTS `scango`.`CARTITEM` (
  `itemId` INT NOT NULL AUTO_INCREMENT,
  `cartId` INT NOT NULL,
  `productId` INT NOT NULL,
  `quantity` INT UNSIGNED NOT NULL,
  `total` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`itemId`),
  INDEX `cartId_fk_idx` (`cartId` ASC) VISIBLE,
  INDEX `product_fk_idx` (`productId` ASC) VISIBLE,
  CONSTRAINT `cartId_fk`
    FOREIGN KEY (`cartId`)
    REFERENCES `scango`.`CART` (`cartId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `product_fk`
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
  `value` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`couponId`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `scango`.`USER_COUPON`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `scango`.`USER_COUPON` ;

CREATE TABLE IF NOT EXISTS `scango`.`USER_COUPON` (
  `userId` INT NOT NULL,
  `couponId` INT NOT NULL,
  `couponQuantity` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`userId`, `couponId`),
  INDEX `couponId_fk_idx` (`couponId` ASC) VISIBLE,
  CONSTRAINT `couponId_fk`
    FOREIGN KEY (`couponId`)
    REFERENCES `scango`.`COUPON` (`couponId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `user_fk`
    FOREIGN KEY (`userId`)
    REFERENCES `scango`.`ACCOUNT` (`userId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
