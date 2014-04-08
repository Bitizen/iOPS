-- phpMyAdmin SQL Dump
-- version 4.0.4.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 28, 2014 at 04:17 PM
-- Server version: 5.6.11
-- PHP Version: 5.5.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `iops`
--
CREATE DATABASE IF NOT EXISTS `iops` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `iops`;

DELIMITER $$
--
-- Procedures
--

--
-- BEGIN NEW
--

CREATE DEFINER=`root`@`localhost` PROCEDURE `viewMyAffiliatedEmployees`(IN `pUserName` VARCHAR(25))
    NO SQL
BEGIN
declare _eID int(11);

SELECT e.employerID into _eID
FROM iOPS.employers e
LEFT JOIN iOPS.users_employers_students_administrators uesa
	ON e.employerID = uesa.employerID
LEFT JOIN iOPS.users u
	ON uesa.userID = u.id
WHERE u.username like pUserName;

SELECT
  iops.students.studentID
		, iops.students.firstName
		, iops.students.middleName
		, iops.students.lastName
		, iops.students.landline
		, iops.students.mobile
		, iops.students.emailAddress
		, iops.students.address
                , iops.students.courseID
                , iops.students.statusID
                , iops.employers.companyName
		, iops.employers_students_log.startDate
		, iops.employers_students_log.endDate
		, iops.positions.position
	FROM iops.students 
	INNER JOIN iops.employers_students_log
	ON iops.students.studentID = iops.employers_students_log.studentID
       LEFT JOIN iops.employers
        ON iops.students.currentEmployerID = iops.employers.employerID
	LEFT JOIN iops.positions
		ON iops.positions.positionID = iops.employers_students_log.positionID
	WHERE iops.employers_students_log.employerID = _eID 
	AND iops.students.isVerified = 1
	AND iops.students.isGraduate = 1;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `viewMyAffiliatedInterns`(IN `pUserName` VARCHAR(25))
    NO SQL
BEGIN
declare _eID int(11);

SELECT e.employerID into _eID
FROM iOPS.employers e
LEFT JOIN iOPS.users_employers_students_administrators uesa
	ON e.employerID = uesa.employerID
LEFT JOIN iOPS.users u
	ON uesa.userID = u.id
WHERE u.username like pUserName;

SELECT
  iops.students.studentID
		, iops.students.firstName
		, iops.students.middleName
		, iops.students.lastName
		, iops.students.landline
		, iops.students.mobile
		, iops.students.emailAddress
		, iops.students.address
                , iops.students.courseID
                , iops.students.statusID
                , iops.employers.companyName
		, iops.employers_students_log.startDate
		, iops.employers_students_log.endDate
		, iops.positions.position
	FROM iops.students 
	INNER JOIN iops.employers_students_log
	ON iops.students.studentID = iops.employers_students_log.studentID
       LEFT JOIN iops.employers
        ON iops.students.currentEmployerID = iops.employers.employerID
	LEFT JOIN iops.positions
		ON iops.positions.positionID = iops.employers_students_log.positionID
	WHERE iops.employers_students_log.employerID = _eID 
	AND iops.students.isVerified = 1
	AND iops.students.isGraduate = 0;

END$$ 


--
-- END NEW
--

CREATE DEFINER=`root`@`localhost` PROCEDURE `viewMyStudentContacts`(IN `pCompanyName` VARCHAR(255))
    NO SQL
BEGIN

SELECT u.id
	, u.first_name
	, u.middle_name
	, u.last_name
	, u.position
	, u.landline
	, u.mobile	
	, u.email
	, u.date_of_birth

FROM iOPS.employers e
LEFT JOIN iOPS.users_employers_students_administrators main
	ON e.employerID = main.employerID
LEFT JOIN iOPS.users u
	ON main.userID = u.id
WHERE e.companyName like pCompanyName;
 END$$



 CREATE DEFINER=`root`@`localhost` PROCEDURE `viewMyStudentEmployer`(IN `pUserName` VARCHAR(25))
    NO SQL
BEGIN
DECLARE _sID int(11);

SELECT s.studentID INTO _sID

FROM iOPS.students s
LEFT JOIN iOPS.users_employers_students_administrators uesa
	ON uesa.studentID = s.studentID
LEFT JOIN iOPS.users u
	ON u.id = uesa.userID
WHERE u.username like pUserName;

SELECT e.employerID
, e.companyName
, e.completeMailingAddress

FROM iOPS.employers e
LEFT JOIN iOPS.employers_students_log esl
	ON esl.employerID = e.employerID
LEFT JOIN iOPS.students s
	ON s.studentID = esl.studentID
WHERE s.studentID = _sID;
END$$


CREATE DEFINER=`root`@`localhost` PROCEDURE `updateResumePath`(IN `pUserName` VARCHAR(25), IN `pFilePath` VARCHAR(255))
    NO SQL
UPDATE iOPS.students s
LEFT JOIN iOPS.users_employers_students_administrators uesa
	ON s.studentID = uesa.studentID
LEFT JOIN iOPS.users u
	ON uesa.userID = u.id
SET s.resumePath = pFilePath
WHERE u.username = pUserName$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `updateInternToAlumnus`(IN `pInternID` INT(11), IN `pYear` INT(4), IN `pMonth` INT(2), IN `pTerm` INT(1))
UPDATE `iOPS`.`students` 
SET `isGraduate` = 1
, `yearGraduated` = pYear
, `monthGraduated` = pMonth
, `termGraduated` = pTerm
, `statusID` = '2'
WHERE `students`.`studentID` = pInternID$$



CREATE DEFINER=`root`@`localhost` PROCEDURE `updateInternUserGroup`(IN `pStudentID` INT(11))
    NO SQL
BEGIN
DECLARE _uID int(11);

SELECT u.id INTO _uID

FROM iOPS.users u
LEFT JOIN iOPS.users_employers_students_administrators uesa
	ON uesa.userID = u.id
LEFT JOIN iOPS.students s
	ON s.studentID = uesa.studentID
WHERE s.studentID = pStudentID;

UPDATE iOPS.users_groups ug
SET `group_id` = '4'
WHERE `user_id` = _uID;
END$$



CREATE DEFINER=`root`@`localhost` PROCEDURE `viewAffiliatedEmployees`(IN employerId INT(11))
BEGIN
	SELECT
  iops.students.studentID
		, iops.students.firstName
		, iops.students.middleName
		, iops.students.lastName
		, iops.students.landline
		, iops.students.mobile
		, iops.students.emailAddress
		, iops.students.address
                , iops.students.courseID
                , iops.students.statusID
                , iops.employers.companyName
		, iops.employers_students_log.startDate
		, iops.employers_students_log.endDate
	FROM iops.students 
	INNER JOIN iops.employers_students_log
	ON iops.students.studentID = iops.employers_students_log.studentID
       LEFT JOIN iops.employers
        ON iops.students.currentEmployerID = iops.employers.employerID
	WHERE iops.employers_students_log.employerID = employerId 
	AND iops.students.isVerified = 1
	AND iops.students.isGraduate = 1;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `viewAffiliatedInterns`(IN employerId INT(11))
BEGIN
	SELECT
                 iops.students.studentID
		, iops.students.firstName
		, iops.students.middleName
		, iops.students.lastName
		, iops.students.landline
		, iops.students.mobile
		, iops.students.emailAddress
		, iops.students.address
                , iops.students.courseID
                , iops.students.statusID
                , iops.employers.companyName
		, iops.employers_students_log.startDate
		, iops.employers_students_log.endDate
	FROM iops.students 
	INNER JOIN iops.employers_students_log
	ON iops.students.studentID = iops.employers_students_log.studentID
        LEFT JOIN  iops.employers
        ON iops.students.currentEmployerID = iops.employers.employerID
	WHERE iops.employers_students_log.employerID = employerId 
	AND iops.students.isVerified = 1
	AND iops.students.isGraduate = 0;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `addAdministrator`(IN `_firstName` VARCHAR(50), IN `_lastName` VARCHAR(50), IN `_middleName` VARCHAR(50), IN `_position` VARCHAR(255))
    NO SQL
BEGIN
   
    INSERT INTO 
		`administrators` 
		(   
          	firstName
            ,lastName
            ,middleName
            ,position
        ) 
	VALUES 
		(
          	_firstName
            ,_lastName
            ,_middleName
            ,_position
		);
	
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `addAsUser`(IN `firstName` VARCHAR(50), IN `lastName` VARCHAR(50), IN `middleName` VARCHAR(50), IN `landline` VARCHAR(16), IN `mobile` VARCHAR(16), IN `emailAddress` VARCHAR(64))
BEGIN
   
    INSERT INTO 
		`users` 
		(
		  first_name
		, last_name
		, middle_name
		, landline
		, mobile
		, email
        
        ) 
	VALUES 
		(
		firstName
		, lastName
		, middleName
		, landline
		, mobile
		, emailAddress	
		);	
	
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `addEmployer`(IN `_companyName` VARCHAR(255), IN `_industryType` VARCHAR(255), IN `_completeMailingAddress` VARCHAR(255), IN `_telephoneNumber` VARCHAR(60), IN `_faxNumber` VARCHAR(60), IN `_website` VARCHAR(255))
    NO SQL
BEGIN
   
    INSERT INTO 
		`employers` 
		(
       		companyName
          	,industryType
            ,completeMailingAddress
            ,telephoneNumber
            ,faxNumber
            ,website
        ) 
	VALUES 
		(
       		_companyName
          	,_industryType
            ,_completeMailingAddress
            ,_telephoneNumber
            ,_faxNumber
            ,_website
		);
	
	END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `addEvaluation`(IN `_studentName` VARCHAR(50), IN `_department` VARCHAR(50), IN `_startDate` DATE, IN `_endDate` DATE, IN `_evaluatorName` VARCHAR(50), IN `_evaluatorPosition` VARCHAR(50), IN `_scoreKnowledge` INT(11), IN `_scoreQuantity` INT(11), IN `_scoreQuality` INT(11), IN `_scoreAttendance` INT(11), IN `_scoreInterpersonal` INT(11), IN `_scoreDependability` INT(11), IN `_scoreWillingness` INT(11), IN `_scoreInitiative` INT(11), IN `_remarks` TEXT)
    NO SQL
BEGIN
   
    INSERT INTO 
		`evaluation` 
		(   
          	studentName
            ,department
            ,startDate
            ,endDate
			,evaluatorName
			,evaluatorPosition
			,scoreKnowledge
			,scoreQuantity
			,scoreQuality
			,scoreAttendance
			,scoreInterpersonal
			,scoreDependability
			,scoreWillingness
			,scoreInitiative
			,remarks
        ) 
	VALUES 
		(
          	_studentName
            ,_department
            ,_startDate
            ,_endDate
			,_evaluatorName
			,_evaluatorPosition
			,_scoreKnowledge
			,_scoreQuantity
			,_scoreQuality
			,_scoreAttendance
			,_scoreInterpersonal
			,_scoreDependability
			,_scoreWillingness
			,_scoreInitiative
			,_remarks
		);
	
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `addStudent`(
		  IN studentID int(11)			
	 	, IN firstName varchar(50)
	 	, IN lastName varchar(50)
	 	, IN middleName	varchar(50)
		, IN landline varchar(16)
	 	, IN mobile varchar(16)	
	 	, IN emailAddress varchar(64)
	 	, IN address varchar(255)			
	 	, IN contactDetailsLastUpdated date			
	 	, IN yearGraduated int(4)			
	 	, IN monthGraduated tinyint(2)			
	 	, IN termGraduated tinyint(1)			
	 	, IN courseID tinyint(2)			
	    , IN statusID tinyint(1))
BEGIN
   
    INSERT INTO 
		iops.students 
		(studentID
		, firstName
		, lastName
		, middleName
		, landline
		, mobile
		, emailAddress
		, address
		, contactDetailsLastUpdated
		, yearGraduated
		, monthGraduated
		, termGraduated
		, courseID
		, statusID) 
	VALUES 
		(studentID
		, firstName
		, lastName
		, middleName
		, landline
		, mobile
		, emailAddress
		, address		
		, contactDetailsLastUpdated
		, yearGraduated
		, monthGraduated
		, termGraduated
		, courseID
		, statusID
		);
	
	END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `addStudentAsUser`(			
	 	IN firstName varchar(50)
	 	, IN lastName varchar(50)
	 	, IN middleName varchar(50)
		, IN landline varchar(16)
	 	, IN mobile varchar(16)	
                , IN emailAddress varchar(64)
	 	)
BEGIN
   
    INSERT INTO 
		iops.users 
		(
		first_name
		, last_name
		, middle_name
		, landline
		, mobile
		, email) 
	VALUES 
		(
		firstName
		, lastName
		, middleName
		, landline
		, mobile
		, emailAddress	
		);	
	
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `addStudentToGroup`(
		  IN userId int(11)			
	 	)
BEGIN
   
    INSERT INTO 
		iops.users_groups
		(
			user_id
		  , group_id
		) 
	VALUES 
		(
		 userId, 3
		);	
	
	END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `checkIfAdminRecExists`(IN administratorID INT(11))
BEGIN
	SELECT 
	  administratorID
	FROM `administrators` a
	WHERE a.administratorID = administratorID;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `checkIfEmpRecExists`(IN employerID INT(11))
BEGIN
	SELECT 
	  employerID
	FROM `employers` e
	WHERE e.employerID = employerID;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `checkIfEvalRecExists`(IN `_evaluationID` INT)
    NO SQL
BEGIN
	SELECT 
	  evaluationID
	FROM `evaluation` e
	WHERE e.evaluationID = _evaluationID;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `checkIfIdentityExists`(IN `_email` VARCHAR(255), IN `_username` VARCHAR(255))
    NO SQL
BEGIN
	select
		u.id
	from
		`users` u
	where
		u.email = _email
			or
		u.username = _username;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `checkIfStudRecExists`(IN studentId INT(11))
BEGIN
	SELECT 
	  studentID
	FROM iops.students
	WHERE students.studentID = studentId;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getAllCompanyNames`()
    NO SQL
begin
SELECT e.employerID
,e.companyName

FROM iOPS.employers e;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getCompanyName`(IN `pUserName` VARCHAR(25))
begin
SELECT e.companyName

FROM iOPS.employers e
LEFT JOIN iOPS.users_employers_students_administrators uesa
	ON e.employerID = uesa.employerID
LEFT JOIN iOPS.users u
	ON uesa.userID = u.id
WHERE u.username like pUserName;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getEmployersData`()
BEGIN
	SELECT 
	  companyName, industryType, completeMailingAddress, telephoneNumber, faxNumber, website
	FROM iops.employers;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getStudentsData`()
BEGIN
	SELECT 
	  studentID,firstName, lastName, middleName, landline, mobile, 
				   emailAddress, courseID, statusID, currentEmployerID
	FROM iops.students;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `linkMyEmployerContacts`(IN `_userID` INT, IN `_employerID` INT)
    NO SQL
INSERT INTO 
		`users_employers_students_administrators` 
		(   
          	userID
            ,employerID

        ) 
	VALUES 
		(
          	_userID
            ,_employerID
		)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `setRepAsPrimaryContact`(IN `_employerID` INT, IN `_repUserID` INT)
    NO SQL
BEGIN
	update
		`employers` e
	set
		primaryContactUserID = _repUserID
	where
		employerID = _employerID;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `setRepAsSecondaryContact`(IN `_employerID` INT, IN `_repUserID` INT)
    NO SQL
BEGIN
	update
		`employers` e
	set
		secondaryContactUserID = _repUserID
	where
		employerID = _employerID;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `setRepAsTertiaryContact`(IN `_employerID` INT, IN `_repUserID` INT)
    NO SQL
BEGIN
	update
		`employers` e
	set
		tertiaryContactUserID = _repUserID
	where
		employerID = _employerID;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `updateCompanyLogoFilePath`(IN `pUserName` VARCHAR(25), IN `pFilePath` VARCHAR(255))
begin
UPDATE iOPS.employers e
LEFT JOIN iOPS.users_employers_students_administrators uesa
	ON e.employerID = uesa.employerID
LEFT JOIN iOPS.users u
	ON uesa.userID = u.id
SET e.companyLogoFilePath = pFilePath
WHERE u.username = pUserName;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `updateEmployer`(IN `pCompanyName` VARCHAR(255), IN `pIndustryType` VARCHAR(255), IN `pIsHiring` TINYINT(1), IN `pCompleteMailingAddress` VARCHAR(255), IN `pTelephoneNumber` VARCHAR(60), IN `pFaxNumber` VARCHAR(60), IN `pWebsite` VARCHAR(255), IN `pDateEstablished` DATE, IN `pHasScholarshipGrants` TINYINT(1), IN `pHasSeminarsAndTrainings` TINYINT(1), IN `pHasRecruitmentActivities` TINYINT(1), IN `pHasAllowanceProvision` TINYINT(1), IN `pHasFacultyImmersion` TINYINT(1), IN `pEmployerID` INT(21))
begin
UPDATE iOPS.employers e
SET e.`companyName` = pCompanyName
	, e.`industryType` = pIndustryType
	, e.`isHiring` = pIsHiring
	, e.`completeMailingAddress` = pCompleteMailingAddress
	, e.`telephoneNumber` = pTelephoneNumber 
	, e.`faxNumber` = pFaxNumber
	, e.`website` = pWebsite
	, e.`dateEstablished` = pDateEstablished
	, e.`hasScholarshipGrants` = pHasScholarshipGrants
	, e.`hasSeminarsAndTrainings` = pHasSeminarsAndTrainings
	, e.`hasRecruitmentActivities` = pHasRecruitmentActivities
	, e.`hasAllowanceProvision` = pHasAllowanceProvision
	, e.`hasFacultyImmersion` = pHasFacultyImmersion
WHERE e.`employerID` = pEmployerID;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `updateIntern`(IN `pInternID` INT(11), IN `pFirstName` VARCHAR(50), IN `pMiddleName` VARCHAR(50), IN `pLastName` VARCHAR(50), IN `pLandline` VARCHAR(60), IN `pMobile` VARCHAR(60), IN `pEmail` VARCHAR(64), IN `pAddress` VARCHAR(255), IN `pCompanyID` INT(11), IN `pCourseID` INT(11), IN `pStatusID` INT(11), IN `pIsVerified` TINYINT(1))
begin
UPDATE `iOPS`.`students` 
SET `firstName` = pFirstName
, `middleName` = pMiddleName
, `lastName` = pLastName
, `landline` = pLandline
, `mobile` = pMobile
, `emailAddress` = pEmail
, `address` = pAddress
, `currentEmployerID` = pCompanyID
, `courseID` = pCourseID
, `statusID` = pStatusID
, `isVerified` = pIsVerified
, `availability` = pAvailability
WHERE `students`.`studentID` = pInternID;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `updateMyEmployer`(IN `pCompanyName` VARCHAR(255), IN `pIndustryType` VARCHAR(255), IN `pIsHiring` TINYINT(1), IN `pCompleteMailingAddress` VARCHAR(255), IN `pTelephoneNumber` VARCHAR(60), IN `pFaxNumber` VARCHAR(60), IN `pWebsite` VARCHAR(255), IN `pDateEstablished` DATE, IN `pHasScholarshipGrants` TINYINT(1), IN `pHasSeminarsAndTrainings` TINYINT(1), IN `pHasRecruitmentActivities` TINYINT(1), IN `pHasAllowanceProvision` TINYINT(1), IN `pHasFacultyImmersion` TINYINT(1), IN `pUserName` VARCHAR(25))
begin
UPDATE iOPS.employers e
LEFT JOIN iOPS.users_employers_students_administrators uesa
	ON e.employerID = uesa.employerID
LEFT JOIN iOPS.users u
	ON uesa.userID = u.id
SET e.`companyName` = pCompanyName
	, e.`industryType` = pIndustryType
	, e.`isHiring` = pIsHiring
	, e.`completeMailingAddress` = pCompleteMailingAddress
	, e.`telephoneNumber` = pTelephoneNumber 
	, e.`faxNumber` = pFaxNumber
	, e.`website` = pWebsite
	, e.`dateEstablished` = pDateEstablished
	, e.`hasScholarshipGrants` = pHasScholarshipGrants
	, e.`hasSeminarsAndTrainings` = pHasSeminarsAndTrainings
	, e.`hasRecruitmentActivities` = pHasRecruitmentActivities
	, e.`hasAllowanceProvision` = pHasAllowanceProvision
	, e.`hasFacultyImmersion` = pHasFacultyImmersion
WHERE u.`username` = pUserName;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `updateOtherDocumentsFilePath`(IN `pUserName` VARCHAR(25), IN `pFilePath` VARCHAR(255))
    NO SQL
begin
UPDATE iOPS.employers e
LEFT JOIN iOPS.users_employers_students_administrators uesa
	ON e.employerID = uesa.employerID
LEFT JOIN iOPS.users u
	ON uesa.userID = u.id
SET e.otherDocumentsFilePath = pFilePath
WHERE u.username = pUserName;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `updateRepresentative`(IN `pUserName` VARCHAR(25), IN `pFirstName` VARCHAR(50), IN `pMiddleName` VARCHAR(50), IN `pLastName` VARCHAR(50), IN `pPosition` VARCHAR(50), IN `pTelephone` VARCHAR(60), IN `pMobile` VARCHAR(60), IN `pEmail` VARCHAR(64), IN `pDateOfBirth` DATE)
UPDATE `iOPS`.`users` 
SET `position` = pPosition
, `email` = pEmail
, `first_name` = pFirstName
, `last_name` = pLastName
, `middle_name` = pMiddleName
, `landline` = pTelephone
, `mobile` = pMobile
, `date_of_birth` = pDateOfBirth
WHERE `users`.`username` like pUserName$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `updateSECRegistrationFilePath`(IN `pUserName` VARCHAR(25), IN `pFilePath` VARCHAR(255))
    NO SQL
UPDATE iOPS.employers e
LEFT JOIN iOPS.users_employers_students_administrators uesa
	ON e.employerID = uesa.employerID
LEFT JOIN iOPS.users u
	ON uesa.userID = u.id
SET e.SECRegistrationFilePath = pFilePath
WHERE u.username = pUserName$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `updateUser`(IN `pUserName` VARCHAR(25), IN `pFirstName` VARCHAR(50), IN `pMiddleName` VARCHAR(50), IN `pLastName` VARCHAR(50), IN `pPosition` VARCHAR(50), IN `pTelephone` VARCHAR(60), IN `pMobile` VARCHAR(60), IN `pEmail` VARCHAR(64), IN `pDateOfBirth` DATE)
UPDATE `iOPS`.`users` 
SET `position` = pPosition
, `email` = pEmail
, `first_name` = pFirstName
, `last_name` = pLastName
, `middle_name` = pMiddleName
, `landline` = pTelephone
, `mobile` = pMobile
, `date_of_birth` = pDateOfBirth
WHERE `users`.`username` like pUserName$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `viewEmployer`(IN `pEmployerID` INT(11))
    NO SQL
SELECT e.employerID
	, e.companyName
	, e.industryType
	, e.isHiring
	, e.SECRegistrationFilePath
	, e.completeMailingAddress
	, e.telephoneNumber
	, e.faxNumber
	, e.website
	, e.dateEstablished
	, e.companyLogoFilePath
	, e.otherDocumentsFilePath
	, e.hasSeminarsAndTrainings
	, e.hasScholarshipGrants
	, e.hasRecruitmentActivities
	, e.hasAllowanceProvision
	, e.hasFacultyImmersion

FROM iOPS.employers e
WHERE e.employerID like pEmployerID$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `viewEmployerContacts`(IN `pEmployerID` INT(11))
    NO SQL
BEGIN
SELECT u.id
	, u.first_name
	, u.middle_name
	, u.last_name
	, u.position
	, u.landline
	, u.mobile	
	, u.email
	, u.date_of_birth

FROM iOPS.employers e
LEFT JOIN iOPS.users_employers_students_administrators main
	ON e.employerID = main.employerID
LEFT JOIN iOPS.users u
	ON main.userID = u.id
WHERE e.employerID like pEmployerID;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `viewIntern`(IN `pInternID` INT(11))
    NO SQL
SELECT s.firstName
, s.lastName
, s.middleName
, s.landline
, s.mobile
, s.contactDetailsLastUpdated
, s.emailAddress
, s.address
, s.availability
, s.resumePath
, e.companyName
, s.courseID
, s.statusID
, s.isVerified
, s.currentEmployerID
, e.completeMailingAddress

FROM iOPS.students s
LEFT JOIN iOPS.employers e
	ON s.currentEmployerID = e.employerID
WHERE s.studentID = pInternID$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `viewMyAccount`(IN `pUserName` VARCHAR(25))
    NO SQL
    DETERMINISTIC
SELECT u.username
	 , u.position 
	 , u.email
	 , u.first_name
	 , u.last_name
	 , u.middle_name
	 , u.landline
	 , u.mobile
	 , u.date_of_birth
FROM  iOPS.users u
WHERE u.username like pUserName$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `viewMyEmployer`(IN `pUserName` VARCHAR(25))
SELECT e.companyName
	, e.industryType
	, e.isHiring
	, e.SECRegistrationFilePath
	, e.completeMailingAddress
	, e.telephoneNumber
	, e.faxNumber
	, e.website
	, e.dateEstablished
	, e.companyLogoFilePath
	, e.otherDocumentsFilePath
	, e.hasSeminarsAndTrainings
	, e.hasScholarshipGrants
	, e.hasRecruitmentActivities
	, e.hasAllowanceProvision
	, e.hasFacultyImmersion

FROM iOPS.employers e
LEFT JOIN iOPS.users_employers_students_administrators uesa
	ON e.employerID = uesa.employerID
LEFT JOIN iOPS.users u
	ON uesa.userID = u.id
WHERE u.username like pUserName$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `viewMyEmployerContacts`(IN `pUserName` VARCHAR(25))
    NO SQL
BEGIN
DECLARE _companyName varchar(255);

SELECT e.companyName INTO _companyName

FROM iOPS.employers e
LEFT JOIN iOPS.users_employers_students_administrators uesa
	ON e.employerID = uesa.employerID
LEFT JOIN iOPS.users u
	ON uesa.userID = u.id
WHERE u.username like pUserName;


SELECT u.id
	, u.first_name
	, u.middle_name
	, u.last_name
	, u.position
	, u.landline
	, u.mobile	
	, u.email
	, u.date_of_birth

FROM iOPS.employers e
LEFT JOIN iOPS.users_employers_students_administrators main
	ON e.employerID = main.employerID
LEFT JOIN iOPS.users u
	ON main.userID = u.id
WHERE e.companyName like _companyName;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `viewRepresentative`(IN `pUserName` VARCHAR(25))
    NO SQL
    DETERMINISTIC
SELECT u.username
	 , u.position 
	 , u.email
	 , u.first_name
	 , u.last_name
	 , u.middle_name
	 , u.landline
	 , u.mobile
	 , u.date_of_birth
FROM  iOPS.users u
WHERE u.username like pUserName$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `viewStudentRecord`(IN `studId` CHAR(10))
SELECT 
		iops.students.studentID
	  , iops.users.first_name
	  , iops.users.last_name
	  , iops.users.middle_name
	  , iops.users.mobile
	  , iops.users.landline
	  , iops.users.email
	  , iops.students.currentEmployerID
	  , iops.students.contactDetailsLastUpdated
	  , iops.students.yearGraduated
	  , iops.students.monthGraduated
	  , iops.students.termGraduated	
	  , iops.students.courseID	
	  , iops.students.statusID

	 FROM iops.users
	INNER JOIN iops.students
	ON students.lastName = users.last_name AND students.firstName = users.first_name
	WHERE students.studentID = studId$$

DELIMITER ;

