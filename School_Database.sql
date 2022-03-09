
CREATE SCHEMA IF NOT EXISTS `Final` ;
USE `Final` ;


CREATE TABLE IF NOT EXISTS `Final`.`School` (
    `SchoolName` VARCHAR(50) NOT NULL,
    `SchoolTotalStudents` INT NULL,
    PRIMARY KEY (`SchoolName`)
)  ENGINE=INNODB;
CREATE UNIQUE INDEX `SchoolName_UNIQUE` ON `Final`.`School` (`SchoolName` ASC);



CREATE TABLE IF NOT EXISTS `Final`.`Buildings` (
    `BuildingID` INT NOT NULL,
    `BuildingName` VARCHAR(45) NULL,
    `SchoolName` VARCHAR(45) NOT NULL,
    PRIMARY KEY (`BuildingID`),
    CONSTRAINT `FK_Buildings_SchoolName` FOREIGN KEY (`SchoolName`)
        REFERENCES `Final`.`School` (`SchoolName`)
)  ENGINE=INNODB;
CREATE UNIQUE INDEX `BuildingID_UNIQUE` ON `Final`.`Buildings` (`BuildingID` ASC);
CREATE INDEX `SchoolName_idx` ON `Final`.`Buildings` (`SchoolName` ASC);



CREATE TABLE IF NOT EXISTS `Final`.`Classrooms` (
    `RoomNumber` INT NOT NULL,
    `HasProjector` VARCHAR(3) NULL,
    `BuildingID` INT NULL,
    PRIMARY KEY (`RoomNumber`),
    CONSTRAINT `FK_Classrooms_BuildingID` FOREIGN KEY (`BuildingID`)
        REFERENCES `Final`.`Buildings` (`BuildingID`)
)  ENGINE=INNODB;
CREATE UNIQUE INDEX `RoomNumber_UNIQUE` ON `Final`.`Classrooms` (`RoomNumber` ASC);
CREATE INDEX `BuildingID_idx` ON `Final`.`Classrooms` (`BuildingID` ASC);



CREATE TABLE IF NOT EXISTS `Final`.`Textbook` (
    `TextbookISBN` INT NOT NULL,
    `TextbookTitle` VARCHAR(45) NULL,
    `TextbookAuthor` VARCHAR(45) NULL,
    PRIMARY KEY (`TextbookISBN`)
)  ENGINE=INNODB;
CREATE UNIQUE INDEX `TextbookISBN_UNIQUE` ON `Final`.`Textbook` (`TextbookISBN` ASC);



CREATE TABLE IF NOT EXISTS `Final`.`Course` (
    `CourseID` INT NOT NULL,
    `CourseName` VARCHAR(45) NULL,
    `TextbookISBN` INT NULL,
    PRIMARY KEY (`CourseID`),
    CONSTRAINT `FK_Course_TextbookISBN` FOREIGN KEY (`TextbookISBN`)
        REFERENCES `Final`.`Textbook` (`TextbookISBN`)
)  ENGINE=INNODB;
CREATE UNIQUE INDEX `CourseID_UNIQUE` ON `Final`.`Course` (`CourseID` ASC);
CREATE INDEX `TextbookISBN_idx` ON `Final`.`Course` (`TextbookISBN` ASC);



CREATE TABLE IF NOT EXISTS `Final`.`Person` (
    `PersonID` INT NOT NULL,
    `PersonPhoneNumber` VARCHAR(45) NULL,
    `PersonName` VARCHAR(45) NULL,
    PRIMARY KEY (`PersonID`)
)  ENGINE=INNODB;
CREATE UNIQUE INDEX `PersonID_UNIQUE` ON `Final`.`Person` (`PersonID` ASC);





CREATE TABLE IF NOT EXISTS `Final`.`Teacher` (
    `TeacherID` INT NOT NULL,
    `TeacherTitle` VARCHAR(45) NULL,
    `TeacherSalary` INT NULL,
    `TeacherName` VARCHAR(45) NULL,
    `PersonID` INT NULL,
    PRIMARY KEY (`TeacherID`),
    CONSTRAINT `FK_Teacher_PersonID` FOREIGN KEY (`PersonID`)
        REFERENCES `Final`.`Person` (`PersonID`)
        ON DELETE NO ACTION ON UPDATE NO ACTION
)  ENGINE=INNODB;
CREATE UNIQUE INDEX `TeacherID_UNIQUE` ON `Final`.`Teacher` (`TeacherID` ASC);
CREATE INDEX `PersonID_idx` ON `Final`.`Teacher` (`PersonID` ASC);




CREATE TABLE IF NOT EXISTS `Final`.`Interns` (
    `InternID` INT NOT NULL,
    `PersonID` INT NULL,
    `InternHourlyWage` INT NULL,
    PRIMARY KEY (`InternID`),
    CONSTRAINT `FK_Interns_PersonID` FOREIGN KEY (`PersonID`)
        REFERENCES `Final`.`Person` (`PersonID`)
        ON DELETE NO ACTION ON UPDATE NO ACTION
)  ENGINE=INNODB;
CREATE UNIQUE INDEX `Level_UNIQUE` ON `Final`.`Interns` (`InternID` ASC);
CREATE INDEX `PersonID_idx` ON `Final`.`Interns` (`PersonID` ASC);



CREATE TABLE IF NOT EXISTS `Final`.`Section` (
    `SectionID` INT NOT NULL,
    `SectionDate` DATE NULL,
    `RoomNumber` INT NULL,
    `CourseID` INT NULL,
    `BuildingID` INT NULL,
    `PersonID` INT NULL,
    PRIMARY KEY (`SectionID`),
    CONSTRAINT `FK_Section_CourseID` FOREIGN KEY (`CourseID`)
        REFERENCES `Final`.`Course` (`CourseID`)
        ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT `FK_Section_BuildingID` FOREIGN KEY (`BuildingID`)
        REFERENCES `Final`.`Buildings` (`BuildingID`)
        ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT `FK_Section_PersonID` FOREIGN KEY (`PersonID`)
        REFERENCES `Final`.`Person` (`PersonID`)
        ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT `FK_Section_RoomNumber` FOREIGN KEY (`RoomNumber`)
        REFERENCES `Final`.`Classrooms` (`RoomNumber`)
        ON DELETE NO ACTION ON UPDATE NO ACTION
)  ENGINE=INNODB;
CREATE UNIQUE INDEX `SectionID_UNIQUE` ON `Final`.`Section` (`SectionID` ASC);
CREATE INDEX `RoomNumber_idx` ON `Final`.`Section` (`RoomNumber` ASC);
CREATE INDEX `CourseID_idx` ON `Final`.`Section` (`CourseID` ASC);
CREATE INDEX `BuildingID_idx` ON `Final`.`Section` (`BuildingID` ASC);
CREATE INDEX `PersonID_idx` ON `Final`.`Section` (`PersonID` ASC);



CREATE TABLE IF NOT EXISTS `Final`.`Student` (
    `StudentID` INT NOT NULL,
    `StudentGPA` DOUBLE(10 , 2 ) NULL,
    `StudentName` VARCHAR(45) NULL,
    `PersonID` INT NULL,
    PRIMARY KEY (`StudentID`),
    CONSTRAINT `FK_Student_PersonID` FOREIGN KEY (`PersonID`)
        REFERENCES `Final`.`Person` (`PersonID`)
        ON DELETE NO ACTION ON UPDATE NO ACTION
)  ENGINE=INNODB;
CREATE UNIQUE INDEX `StudentID_UNIQUE` ON `Final`.`Student` (`StudentID` ASC);
CREATE INDEX `PersonID_idx` ON `Final`.`Student` (`PersonID` ASC);








INSERT INTO `Final`.`School` (`SchoolName`, `SchoolTotalStudents`) VALUES ('SCCC', 26711);



INSERT INTO `Final`.`Buildings` (`BuildingID`, `BuildingName`, `SchoolName`) VALUES (1, 'Riverhead', 'SCCC');
INSERT INTO `Final`.`Buildings` (`BuildingID`, `BuildingName`, `SchoolName`) VALUES (2, 'Islip', 'SCCC');
INSERT INTO `Final`.`Buildings` (`BuildingID`, `BuildingName`, `SchoolName`) VALUES (3, 'South Hampton', 'SCCC');
INSERT INTO `Final`.`Buildings` (`BuildingID`, `BuildingName`, `SchoolName`) VALUES (4, 'Ammerman', 'SCCC');
INSERT INTO `Final`.`Buildings` (`BuildingID`, `BuildingName`, `SchoolName`) VALUES (5, 'Smithtown', 'SCCC');



INSERT INTO `Final`.`Classrooms` (`RoomNumber`, `HasProjector`, `BuildingID`) VALUES (201, 'Y', 1);
INSERT INTO `Final`.`Classrooms` (`RoomNumber`, `HasProjector`, `BuildingID`) VALUES (202, 'N', 1);
INSERT INTO `Final`.`Classrooms` (`RoomNumber`, `HasProjector`, `BuildingID`) VALUES (203, 'Y', 1);
INSERT INTO `Final`.`Classrooms` (`RoomNumber`, `HasProjector`, `BuildingID`) VALUES (303, 'N', 5);
INSERT INTO `Final`.`Classrooms` (`RoomNumber`, `HasProjector`, `BuildingID`) VALUES (304, 'Y', 5);
INSERT INTO `Final`.`Classrooms` (`RoomNumber`, `HasProjector`, `BuildingID`) VALUES (305, 'N', 5);



INSERT INTO `Final`.`Textbook` (`TextbookISBN`, `TextbookTitle`, `TextbookAuthor`) VALUES (200, 'Computer Science Illustrated', 'John Smith');
INSERT INTO `Final`.`Textbook` (`TextbookISBN`, `TextbookTitle`, `TextbookAuthor`) VALUES (201, 'Liang Java', 'Daniel Liang');
INSERT INTO `Final`.`Textbook` (`TextbookISBN`, `TextbookTitle`, `TextbookAuthor`) VALUES (202, 'Liang Java', 'Daniel Liang');
INSERT INTO `Final`.`Textbook` (`TextbookISBN`, `TextbookTitle`, `TextbookAuthor`) VALUES (203, 'Data Structures & Algorithms', 'William Mcallister');




INSERT INTO `Final`.`Course` (`CourseID`, `CourseName`, `TextbookISBN`) VALUES (1, 'Computer Science I', 200);
INSERT INTO `Final`.`Course` (`CourseID`, `CourseName`, `TextbookISBN`) VALUES (2, 'Computer Science II', 201);
INSERT INTO `Final`.`Course` (`CourseID`, `CourseName`, `TextbookISBN`) VALUES (3, 'Computer Science III', 202);





INSERT INTO `Final`.`Person` (`PersonID`, `PersonPhoneNumber`, `PersonName`) VALUES (1, '635-448-6158', 'Tanya Ferguson');
INSERT INTO `Final`.`Person` (`PersonID`, `PersonPhoneNumber`, `PersonName`) VALUES (2, '654-651-8521', 'Guy O\'Neill');
INSERT INTO `Final`.`Person` (`PersonID`, `PersonPhoneNumber`, `PersonName`) VALUES (3, '687-846-5132', 'Dennis Wilks');
INSERT INTO `Final`.`Person` (`PersonID`, `PersonPhoneNumber`, `PersonName`) VALUES (4, '876-263-4455', 'Kenneth Mason');
INSERT INTO `Final`.`Person` (`PersonID`, `PersonPhoneNumber`, `PersonName`) VALUES (5, '184-846-4613', 'Mike Briley');





INSERT INTO `Final`.`Teacher` (`TeacherID`, `TeacherTitle`, `TeacherSalary`, `TeacherName`, `PersonID`) VALUES (1, 'Head Of Computer Science', 100000, 'Tanya Ferguson', 1);
INSERT INTO `Final`.`Teacher` (`TeacherID`, `TeacherTitle`, `TeacherSalary`, `TeacherName`, `PersonID`) VALUES (2, 'Head Of Mathematics', 90000, 'Guy O\'Neill', 2);
INSERT INTO `Final`.`Teacher` (`TeacherID`, `TeacherTitle`, `TeacherSalary`, `TeacherName`, `PersonID`) VALUES (3, 'Head Of English', 85000, 'Dennis Wilks', 3);
INSERT INTO `Final`.`Teacher` (`TeacherID`, `TeacherTitle`, `TeacherSalary`, `TeacherName`, `PersonID`) VALUES (4, 'Head Of Accounting', 80000, 'Kenneth Mason', 4);
INSERT INTO `Final`.`Teacher` (`TeacherID`, `TeacherTitle`, `TeacherSalary`, `TeacherName`, `PersonID`) VALUES (5, 'Head Of Life Sciences', 75000, 'Mike Briley', 5);





INSERT INTO `Final`.`Interns` (`InternID`, `PersonID`, `InternHourlyWage`) VALUES (1, 21, 14.50);
INSERT INTO `Final`.`Interns` (`InternID`, `PersonID`, `InternHourlyWage`) VALUES (2, 22, 15);
INSERT INTO `Final`.`Interns` (`InternID`, `PersonID`, `InternHourlyWage`) VALUES (3, 23, 11);




INSERT INTO `Final`.`Section` (`SectionID`, `SectionDate`, `RoomNumber`, `CourseID`, `BuildingID`, `PersonID`) VALUES (100, '2017-12-27', 201, 3, 1, 1);
INSERT INTO `Final`.`Section` (`SectionID`, `SectionDate`, `RoomNumber`, `CourseID`, `BuildingID`, `PersonID`) VALUES (101, '2017-12-27', 202, 7, 1, 2);
INSERT INTO `Final`.`Section` (`SectionID`, `SectionDate`, `RoomNumber`, `CourseID`, `BuildingID`, `PersonID`) VALUES (102, '2017-12-27', 203, 12, 1, 3);
INSERT INTO `Final`.`Section` (`SectionID`, `SectionDate`, `RoomNumber`, `CourseID`, `BuildingID`, `PersonID`) VALUES (103, '2017-12-27', 303, 15, 5, 4);
INSERT INTO `Final`.`Section` (`SectionID`, `SectionDate`, `RoomNumber`, `CourseID`, `BuildingID`, `PersonID`) VALUES (104, '2017-12-27', 304, 17, 5, 5);




INSERT INTO `Final`.`Student` (`StudentID`, `StudentGPA`, `StudentName`, `PersonID`) VALUES (1, 4.0, 'Jerry Ryan', 11);
INSERT INTO `Final`.`Student` (`StudentID`, `StudentGPA`, `StudentName`, `PersonID`) VALUES (2, 3.2, 'Hugo Jurgens', 12);
INSERT INTO `Final`.`Student` (`StudentID`, `StudentGPA`, `StudentName`, `PersonID`) VALUES (3, 3.7, 'Anita Nelson', 13);
INSERT INTO `Final`.`Student` (`StudentID`, `StudentGPA`, `StudentName`, `PersonID`) VALUES (4, 2.5, 'Robert Arnold', 14);


CREATE ROLE "Dean", "Secretary", "Chairman";

GRANT ALL ON final.* TO "Dean";
GRANT SELECT ON final.* TO "Secretary";
GRANT INSERT, UPDATE ON final.student TO "Secretary";
GRANT INSERT, UPDATE, SELECT ON final.teacher TO "Chairman";
GRANT INSERT, UPDATE, SELECT ON final.interns TO "Chairman";