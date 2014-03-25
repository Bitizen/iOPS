

#####################################################################
#### 	NOTE:
####
#### 	   If there's an existing proc within the updates,
####	   just drop those then import the new ones.
####	   Sorry sa inconvenience :C
####	   Thanks!

########### NEW COMMIT MERGED EMPLOYER SPRINT 2 ####################
########### NEW COMMIT MERGED EMPLOYER SPRINT 2 ####################
########### NEW COMMIT MERGED EMPLOYER SPRINT 2 ####################
########### NEW COMMIT MERGED EMPLOYER SPRINT 2 ####################
########### NEW COMMIT MERGED EMPLOYER SPRINT 2 ####################
########### NEW COMMIT MERGED EMPLOYER SPRINT 2 ####################
########### NEW COMMIT MERGED EMPLOYER SPRINT 2 ####################
CREATE DEFINER=`root`@`localhost` PROCEDURE `updateInternToAlumnus`(IN `pInternID` INT(11))
UPDATE `iOPS`.`students` 
SET `isGraduate` = 1
WHERE `students`.`studentID` = pInternID

CREATE DEFINER=`root`@`localhost` PROCEDURE `viewNewGrads`(IN `pThisYear` INT(4))
    NO SQL
SELECT s.studentID
, s.firstName
, s.lastName
, s.middleName
, s.courseID
, s.statusID
, s.isVerified
, e.companyName

FROM iOPS.students s
LEFT JOIN iOPS.employers e
	ON s.currentEmployerID = e.employerID
WHERE s.isGraduate = 0
AND s.yearGraduated = pThisYear

CREATE DEFINER=`root`@`localhost` PROCEDURE `updateContactDetails`(IN `pUserName` VARCHAR(25), IN `pTelephone` VARCHAR(60), IN `pMobile` VARCHAR(60), IN `pEmail` VARCHAR(64))
UPDATE `iOPS`.`users` 
SET `email` = pEmail
, `landline` = pTelephone
, `mobile` = pMobile
WHERE `users`.`username` like pUserName

CREATE DEFINER=`root`@`localhost` PROCEDURE `updateMyRepresentative`(IN `pUserName` VARCHAR(25), IN `pFirstName` VARCHAR(50), IN `pMiddleName` VARCHAR(50), IN `pLastName` VARCHAR(50), IN `pPosition` VARCHAR(50), IN `pTelephone` VARCHAR(60), IN `pMobile` VARCHAR(60), IN `pEmail` VARCHAR(64), IN `pDateOfBirth` DATE)
UPDATE `iOPS`.`users` 
SET `position` = pPosition
, `email` = pEmail
, `first_name` = pFirstName
, `last_name` = pLastName
, `middle_name` = pMiddleName
, `landline` = pTelephone
, `mobile` = pMobile
, `date_of_birth` = pDateOfBirth
WHERE `users`.`username` like pUserName

CREATE DEFINER=`root`@`localhost` PROCEDURE `updateRepresentative`(IN `pUserID` INT(11), IN `pFirstName` VARCHAR(50), IN `pMiddleName` VARCHAR(50), IN `pLastName` VARCHAR(50), IN `pPosition` VARCHAR(50), IN `pTelephone` VARCHAR(60), IN `pMobile` VARCHAR(60), IN `pEmail` VARCHAR(64), IN `pDateOfBirth` DATE)
UPDATE `iOPS`.`users` 
SET `position` = pPosition
, `email` = pEmail
, `first_name` = pFirstName
, `last_name` = pLastName
, `middle_name` = pMiddleName
, `landline` = pTelephone
, `mobile` = pMobile
, `date_of_birth` = pDateOfBirth
WHERE `users`.`id` = pUserID

CREATE DEFINER=`root`@`localhost` PROCEDURE `viewAlumnus`(IN `pAlumnusID` INT(11))
    NO SQL
SELECT s.studentID
, s.firstName
, s.lastName
, s.middleName
, s.landline
, s.mobile
, s.contactDetailsLastUpdated
, s.emailAddress
, s.address
, s.resumePath
, e.companyName
, s.courseID
, s.statusID
, s.isVerified
, s.currentEmployerID

FROM iOPS.students s
LEFT JOIN iOPS.employers e
	ON s.currentEmployerID = e.employerID
WHERE s.studentID = pAlumnusID

CREATE DEFINER=`root`@`localhost` PROCEDURE `viewIntern`(IN `pInternID` INT(11))
    NO SQL
SELECT s.studentID
, s.firstName
, s.lastName
, s.middleName
, s.landline
, s.mobile
, s.contactDetailsLastUpdated
, s.emailAddress
, s.address
, s.resumePath
, e.companyName
, s.courseID
, s.statusID
, s.isVerified
, s.currentEmployerID

FROM iOPS.students s
LEFT JOIN iOPS.employers e
	ON s.currentEmployerID = e.employerID
WHERE s.studentID = pInternID

CREATE DEFINER=`root`@`localhost` PROCEDURE `updateAlumnus`(IN `pAlumnusID` INT(11), IN `pFirstName` VARCHAR(50), IN `pMiddleName` VARCHAR(50), IN `pLastName` VARCHAR(50), IN `pLandline` VARCHAR(60), IN `pMobile` VARCHAR(60), IN `pEmail` VARCHAR(64), IN `pAddress` VARCHAR(255), IN `pCompanyID` INT(11), IN `pCourseID` INT(11), IN `pStatusID` INT(11), IN `pIsVerified` TINYINT(1))
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
WHERE `students`.`studentID` = pAlumnusID

CREATE DEFINER=`root`@`localhost` PROCEDURE `updateIntern`(IN `pInternID` INT(11), IN `pFirstName` VARCHAR(50), IN `pMiddleName` VARCHAR(50), IN `pLastName` VARCHAR(50), IN `pLandline` VARCHAR(60), IN `pMobile` VARCHAR(60), IN `pEmail` VARCHAR(64), IN `pAddress` VARCHAR(255), IN `pCompanyID` INT(11), IN `pCourseID` INT(11), IN `pStatusID` INT(11), IN `pIsVerified` TINYINT(1))
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
WHERE `students`.`studentID` = pInternID

########### END COMMIT MERGED EMPLOYER SPRINT 2 ####################
########### END COMMIT MERGED EMPLOYER SPRINT 2 ####################
########### END COMMIT MERGED EMPLOYER SPRINT 2 ####################
########### END COMMIT MERGED EMPLOYER SPRINT 2 ####################
########### END COMMIT MERGED EMPLOYER SPRINT 2 ####################
########### END COMMIT MERGED EMPLOYER SPRINT 2 ####################
########### END COMMIT MERGED EMPLOYER SPRINT 2 ####################
########### END COMMIT MERGED EMPLOYER SPRINT 2 ####################



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
	
	END





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
	
	END






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
	
	END






	CREATE DEFINER=`root`@`localhost` PROCEDURE `checkIfStudRecExists`(IN studentId INT(11))
BEGIN
	SELECT 
	  studentID
	FROM iops.students
	WHERE students.studentID = studentId;
END





CREATE DEFINER=`root`@`localhost` PROCEDURE `getAllCompanyNames`()
    NO SQL
SELECT e.employerID
,e.companyName

FROM iOPS.employers e







CREATE DEFINER=`root`@`localhost` PROCEDURE `getCompanyName`(IN `pUserName` VARCHAR(25))
SELECT e.companyName

FROM iOPS.employers e
LEFT JOIN iOPS.users_employers_students_administrators uesa
	ON e.employerID = uesa.employerID
LEFT JOIN iOPS.users u
	ON uesa.userID = u.id
WHERE u.username like pUserName






CREATE DEFINER=`root`@`localhost` PROCEDURE `getEmployersData`()
BEGIN
	SELECT 
	  companyName, industryType, completeMailingAddress, telephoneNumber, faxNumber, website
	FROM iops.employers;
END






CREATE DEFINER=`root`@`localhost` PROCEDURE `getStudentsData`()
BEGIN
	SELECT 
	  studentID,firstName, lastName, middleName, landline, mobile, 
				   emailAddress, courseID, statusID, currentEmployerID
	FROM iops.students;
END






CREATE DEFINER=`root`@`localhost` PROCEDURE `updateCompanyLogoFilePath`(IN `pUserName` VARCHAR(25), IN `pFilePath` VARCHAR(255))
UPDATE iOPS.employers e
LEFT JOIN iOPS.users_employers_students_administrators uesa
	ON e.employerID = uesa.employerID
LEFT JOIN iOPS.users u
	ON uesa.userID = u.id
SET e.companyLogoFilePath = pFilePath
WHERE u.username = pUserName






CREATE DEFINER=`root`@`localhost` PROCEDURE `updateEmployer`(IN `pCompanyName` VARCHAR(255), IN `pIndustryType` VARCHAR(255), IN `pIsHiring` TINYINT(1), IN `pCompleteMailingAddress` VARCHAR(255), IN `pTelephoneNumber` VARCHAR(60), IN `pFaxNumber` VARCHAR(60), IN `pWebsite` VARCHAR(255), IN `pDateEstablished` DATE, IN `pHasScholarshipGrants` TINYINT(1), IN `pHasSeminarsAndTrainings` TINYINT(1), IN `pHasRecruitmentActivities` TINYINT(1), IN `pHasAllowanceProvision` TINYINT(1), IN `pHasFacultyImmersion` TINYINT(1), IN `pEmployerID` INT(21))
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
WHERE e.`employerID` = pEmployerID






CREATE DEFINER=`root`@`localhost` PROCEDURE `updateIntern`(IN `pInternID` INT(11), IN `pFirstName` VARCHAR(50), IN `pMiddleName` VARCHAR(50), IN `pLastName` VARCHAR(50), IN `pLandline` VARCHAR(60), IN `pMobile` VARCHAR(60), IN `pEmail` VARCHAR(64), IN `pAddress` VARCHAR(255), IN `pCompanyID` INT(11), IN `pCourseID` INT(11), IN `pStatusID` INT(11), IN `pIsVerified` TINYINT(1))
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
WHERE `students`.`studentID` = pInternID








CREATE DEFINER=`root`@`localhost` PROCEDURE `updateMyEmployer`(IN `pCompanyName` VARCHAR(255), IN `pIndustryType` VARCHAR(255), IN `pIsHiring` TINYINT(1), IN `pCompleteMailingAddress` VARCHAR(255), IN `pTelephoneNumber` VARCHAR(60), IN `pFaxNumber` VARCHAR(60), IN `pWebsite` VARCHAR(255), IN `pDateEstablished` DATE, IN `pHasScholarshipGrants` TINYINT(1), IN `pHasSeminarsAndTrainings` TINYINT(1), IN `pHasRecruitmentActivities` TINYINT(1), IN `pHasAllowanceProvision` TINYINT(1), IN `pHasFacultyImmersion` TINYINT(1), IN `pUserName` VARCHAR(25))
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
WHERE u.`username` = pUserName








CREATE DEFINER=`root`@`localhost` PROCEDURE `updateOtherDocumentsFilePath`(IN `pUserName` VARCHAR(25), IN `pFilePath` VARCHAR(255))
UPDATE iOPS.employers e
LEFT JOIN iOPS.users_employers_students_administrators uesa
	ON e.employerID = uesa.employerID
LEFT JOIN iOPS.users u
	ON uesa.userID = u.id
SET e.otherDocumentsFilePath = pFilePath
WHERE u.username = pUserName







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
WHERE `users`.`username` like pUserName




CREATE DEFINER=`root`@`localhost` PROCEDURE `updateSECRegistrationFilePath`(IN `pUserName` VARCHAR(25), IN `pFilePath` VARCHAR(255))
    NO SQL
UPDATE iOPS.employers e
LEFT JOIN iOPS.users_employers_students_administrators uesa
	ON e.employerID = uesa.employerID
LEFT JOIN iOPS.users u
	ON uesa.userID = u.id
SET e.SECRegistrationFilePath = pFilePath
WHERE u.username = pUserName






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
WHERE `users`.`username` like pUserName







CREATE DEFINER=`root`@`localhost` PROCEDURE `viewEmployer`(IN `pEmployerID` INT(11))
    NO SQL
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
WHERE e.employerID like pEmployerID









CREATE DEFINER=`root`@`localhost` PROCEDURE `viewEmployerContacts`(IN `pUserName` VARCHAR(25))
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
 END





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
, s.resumePath
, e.companyName
, s.courseID
, s.statusID
, s.isVerified

FROM iOPS.students s
LEFT JOIN iOPS.employers e
	ON s.currentEmployerID = e.employerID
WHERE s.studentID = pInternID







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
WHERE u.username like pUserName








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
WHERE u.username like pUserName










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
WHERE u.username like pUserName








CREATE DEFINER=`root`@`localhost` PROCEDURE `viewStudentRecord`(IN `studId` CHAR(10))
BEGIN
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
	WHERE students.studentID = studId;

END

