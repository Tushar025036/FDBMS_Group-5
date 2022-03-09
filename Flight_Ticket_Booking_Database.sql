CREATE DATABASE `flight` /*!40100 DEFAULT CHARACTER SET UTF8MB4 COLLATE UTF8MB4_0900_AI_CI */;

USE `flight`;

CREATE TABLE `admin` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `uname` VARCHAR(255) DEFAULT NULL,
    `password` VARCHAR(255) DEFAULT NULL,
    PRIMARY KEY (`id`)
)  ENGINE=INNODB AUTO_INCREMENT=2 DEFAULT CHARSET=UTF8MB4 COLLATE = UTF8MB4_0900_AI_CI;

CREATE TABLE `company` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `company` VARCHAR(255) DEFAULT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `id` (`id`)
)  ENGINE=INNODB AUTO_INCREMENT=9 DEFAULT CHARSET=UTF8MB4 COLLATE = UTF8MB4_0900_AI_CI;

CREATE TABLE `international` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `place` VARCHAR(255) NOT NULL,
    `domestic` INT DEFAULT NULL,
    `international` INT DEFAULT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `id` (`id`),
    UNIQUE KEY `place` (`place`),
    UNIQUE KEY `place_2` (`place`)
)  ENGINE=INNODB AUTO_INCREMENT=18 DEFAULT CHARSET=UTF8MB4 COLLATE = UTF8MB4_0900_AI_CI;

CREATE TABLE `route` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `distance` FLOAT DEFAULT NULL,
    `from1` VARCHAR(255) DEFAULT NULL,
    `to1` VARCHAR(255) DEFAULT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `id` (`id`),
    KEY `from1` (`from1`),
    KEY `to1` (`to1`),
    CONSTRAINT `route_ibfk_1` FOREIGN KEY (`from1`)
        REFERENCES `international` (`place`),
    CONSTRAINT `route_ibfk_2` FOREIGN KEY (`to1`)
        REFERENCES `international` (`place`)
)  ENGINE=INNODB AUTO_INCREMENT=23 DEFAULT CHARSET=UTF8MB4 COLLATE = UTF8MB4_0900_AI_CI;

CREATE TABLE `airplane` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `company_id` INT DEFAULT NULL,
    `route_id` INT DEFAULT NULL,
    `start_time` TIME DEFAULT NULL,
    `dest_time` TIME DEFAULT NULL,
    `seat_eco` INT DEFAULT NULL,
    `seat_bus` INT DEFAULT NULL,
    `price` FLOAT DEFAULT NULL,
    `domestic` INT DEFAULT NULL,
    `mon` INT DEFAULT NULL,
    `tue` INT DEFAULT NULL,
    `wed` INT DEFAULT NULL,
    `thu` INT DEFAULT NULL,
    `fri` INT DEFAULT NULL,
    `sat` INT DEFAULT NULL,
    `sun` INT DEFAULT NULL,
    `price2` FLOAT DEFAULT NULL,
    `mon_seats` INT DEFAULT NULL,
    `tue_seats` INT DEFAULT NULL,
    `wed_seats` INT DEFAULT NULL,
    `thu_seats` INT DEFAULT NULL,
    `fri_seats` INT DEFAULT NULL,
    `sat_seats` INT DEFAULT NULL,
    `sun_seats` INT DEFAULT NULL,
    `mon_seats_bus` INT DEFAULT NULL,
    `tue_seats_bus` INT DEFAULT NULL,
    `wed_seats_bus` INT DEFAULT NULL,
    `thu_seats_bus` INT DEFAULT NULL,
    `fri_seats_bus` INT DEFAULT NULL,
    `sat_seats_bus` INT DEFAULT NULL,
    `sun_seats_bus` INT DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `company_id` (`company_id`),
    KEY `route_id` (`route_id`),
    CONSTRAINT `airplane_ibfk_1` FOREIGN KEY (`company_id`)
        REFERENCES `company` (`id`),
    CONSTRAINT `airplane_ibfk_2` FOREIGN KEY (`route_id`)
        REFERENCES `route` (`id`)
)  ENGINE=INNODB AUTO_INCREMENT=32 DEFAULT CHARSET=UTF8MB4 COLLATE = UTF8MB4_0900_AI_CI;

CREATE TABLE `user` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,
    `email` VARCHAR(255) NOT NULL,
    `uname` VARCHAR(255) NOT NULL,
    `password` VARCHAR(255) NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `uname` (`uname`)
)  ENGINE=INNODB AUTO_INCREMENT=22 DEFAULT CHARSET=UTF8MB4 COLLATE = UTF8MB4_0900_AI_CI;

CREATE TABLE `passenger` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) DEFAULT NULL,
    `age` INT DEFAULT NULL,
    `gender` VARCHAR(255) DEFAULT NULL,
    `class` VARCHAR(255) DEFAULT NULL,
    `prime` INT DEFAULT NULL,
    `uname` VARCHAR(255) DEFAULT NULL,
    `random` INT NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `id` (`id`),
    KEY `uname` (`uname`),
    CONSTRAINT `passenger_ibfk_1` FOREIGN KEY (`uname`)
        REFERENCES `user` (`uname`)
)  ENGINE=INNODB AUTO_INCREMENT=37 DEFAULT CHARSET=UTF8MB4 COLLATE = UTF8MB4_0900_AI_CI;

CREATE TABLE `ticket` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `from2` VARCHAR(255) DEFAULT NULL,
    `to2` VARCHAR(255) DEFAULT NULL,
    `start_time` VARCHAR(255) DEFAULT NULL,
    `end_time` VARCHAR(255) DEFAULT NULL,
    `company` INT DEFAULT NULL,
    `price` FLOAT DEFAULT NULL,
    `airplane_id` INT DEFAULT NULL,
    `date` VARCHAR(255) DEFAULT NULL,
    `seats` INT DEFAULT NULL,
    `uname` VARCHAR(255) NOT NULL,
    `random` INT DEFAULT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `id` (`id`),
    KEY `from2` (`from2`),
    KEY `to2` (`to2`),
    KEY `airplane_id` (`airplane_id`),
    CONSTRAINT `ticket_ibfk_1` FOREIGN KEY (`from2`)
        REFERENCES `international` (`place`),
    CONSTRAINT `ticket_ibfk_2` FOREIGN KEY (`to2`)
        REFERENCES `international` (`place`)
)  ENGINE=INNODB AUTO_INCREMENT=17 DEFAULT CHARSET=UTF8MB4 COLLATE = UTF8MB4_0900_AI_CI;

INSERT INTO admin(uname,password) VALUES('flight_admin','123');