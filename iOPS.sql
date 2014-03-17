-- phpMyAdmin SQL Dump
-- version 4.0.9
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 17, 2014 at 02:09 PM
-- Server version: 5.6.14
-- PHP Version: 5.5.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `iOPS`
--

-- --------------------------------------------------------

--
-- Table structure for table `administrators`
--

CREATE TABLE IF NOT EXISTS `administrators` (
  `administratorID` int(11) NOT NULL,
  `firstName` varchar(50) NOT NULL,
  `lastName` varchar(50) NOT NULL,
  `middleName` varchar(50) NOT NULL,
  `position` varchar(255) NOT NULL,
  PRIMARY KEY (`administratorID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `audit_log`
--

CREATE TABLE IF NOT EXISTS `audit_log` (
  `auditLogID` int(6) NOT NULL AUTO_INCREMENT,
  `dt_timestamp` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `changedBy` int(11) NOT NULL,
  `module` varchar(255) NOT NULL,
  `field` varchar(255) NOT NULL,
  `oldValue` varchar(255) NOT NULL,
  `newValue` varchar(255) NOT NULL,
  PRIMARY KEY (`auditLogID`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `audit_log`
--

INSERT INTO `audit_log` (`auditLogID`, `dt_timestamp`, `changedBy`, `module`, `field`, `oldValue`, `newValue`) VALUES
(1, '2014-03-10 12:35:54', 1, 'user', 'mobile', '09177673844', '09152447567'),
(2, '2014-03-10 12:42:00', 1, 'user', 'email', 'kdp.enverga@gmail.com', 'kenverga@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `employers`
--

CREATE TABLE IF NOT EXISTS `employers` (
  `employerID` int(11) NOT NULL AUTO_INCREMENT,
  `companyName` varchar(255) NOT NULL,
  `industryID` int(11) NOT NULL,
  `isHiring` tinyint(1) NOT NULL,
  `SECRegistrationFilePath` varchar(255) NOT NULL,
  `completeMailingAddress` varchar(255) NOT NULL,
  `telephoneNumber` varchar(60) NOT NULL,
  `faxNumber` varchar(60) NOT NULL,
  `website` varchar(255) NOT NULL,
  `dateEstablished` date NOT NULL,
  `companyLogoFilePath` varchar(255) NOT NULL,
  `otherDocumentsFilePath` varchar(255) NOT NULL,
  `hasScholarshipGrants` tinyint(1) NOT NULL,
  `hasSeminarsAndTrainings` tinyint(1) NOT NULL,
  `hasRecruitmentActivities` tinyint(1) NOT NULL,
  `hasAllowanceProvision` tinyint(1) NOT NULL,
  `hasFacultyImmersion` tinyint(1) NOT NULL,
  `primaryContactName` varchar(150) NOT NULL,
  `primaryContactDesignation` varchar(50) NOT NULL,
  `primaryContactTelephoneNumber` varchar(16) NOT NULL,
  `primaryContactMobileNumber` varchar(16) NOT NULL,
  `primaryContactEmail` varchar(64) NOT NULL,
  `primaryContactDateOfBirth` date NOT NULL,
  `secondaryContactName` varchar(150) NOT NULL,
  `secondaryContactDesignation` varchar(50) NOT NULL,
  `secondaryContactTelephoneNumber` varchar(16) NOT NULL,
  `secondaryContactMobileNumber` varchar(16) NOT NULL,
  `secondaryContactEmail` varchar(64) NOT NULL,
  `secondaryContactDateOfBirth` date NOT NULL,
  PRIMARY KEY (`employerID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `employers`
--

INSERT INTO `employers` (`employerID`, `companyName`, `industryID`, `isHiring`, `SECRegistrationFilePath`, `completeMailingAddress`, `telephoneNumber`, `faxNumber`, `website`, `dateEstablished`, `companyLogoFilePath`, `otherDocumentsFilePath`, `hasScholarshipGrants`, `hasSeminarsAndTrainings`, `hasRecruitmentActivities`, `hasAllowanceProvision`, `hasFacultyImmersion`, `primaryContactName`, `primaryContactDesignation`, `primaryContactTelephoneNumber`, `primaryContactMobileNumber`, `primaryContactEmail`, `primaryContactDateOfBirth`, `secondaryContactName`, `secondaryContactDesignation`, `secondaryContactTelephoneNumber`, `secondaryContactMobileNumber`, `secondaryContactEmail`, `secondaryContactDateOfBirth`) VALUES
(1, 'IBM', 25, 1, '', 'Makati', '990-2930', '990-2931', 'ibm.com', '2014-03-04', '', '', 1, 1, 1, 0, 1, 'John Doe', 'HR Manager', '928-3948', '0922-384-3455', 'johndoe@gmail.com', '2014-03-11', 'Jane Doe', 'HR Assistant', '234-2323', '0912-239-4443', 'janedoe@gmail.com', '2014-03-05');

-- --------------------------------------------------------

--
-- Table structure for table `employers_students_log`
--

CREATE TABLE IF NOT EXISTS `employers_students_log` (
  `employerID` int(11) NOT NULL,
  `studentID` int(11) NOT NULL,
  `positionID` int(11) NOT NULL,
  `employmentType` int(11) NOT NULL,
  `startDate` date NOT NULL,
  `endDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employers_students_log`
--

INSERT INTO `employers_students_log` (`employerID`, `studentID`, `positionID`, `employmentType`, `startDate`, `endDate`) VALUES
(1, 2, 0, 0, '0000-00-00', '2014-03-09');

-- --------------------------------------------------------

--
-- Table structure for table `job_openings`
--

CREATE TABLE IF NOT EXISTS `job_openings` (
  `jobOpeningID` int(11) NOT NULL AUTO_INCREMENT,
  `employerID` int(11) NOT NULL,
  `filePath` varchar(255) NOT NULL,
  `courseID` tinyint(2) NOT NULL,
  `skillID` int(11) NOT NULL,
  `position` varchar(255) NOT NULL,
  `location` varchar(255) NOT NULL,
  `contactDetails` varchar(255) NOT NULL,
  `postDate` date NOT NULL,
  `postDuration` tinyint(2) NOT NULL,
  `industry` varchar(255) NOT NULL,
  `isVerified` tinyint(1) NOT NULL,
  `isActive` tinyint(1) NOT NULL,
  PRIMARY KEY (`jobOpeningID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `job_openings_courses`
--

CREATE TABLE IF NOT EXISTS `job_openings_courses` (
  `jobOpeningID` int(11) NOT NULL,
  `courseID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `skills`
--

CREATE TABLE IF NOT EXISTS `skills` (
  `skillID` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`skillID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE IF NOT EXISTS `students` (
  `studentID` int(11) NOT NULL AUTO_INCREMENT,
  `firstName` varchar(50) NOT NULL,
  `lastName` varchar(50) NOT NULL,
  `middleName` varchar(50) NOT NULL,
  `landline` varchar(16) NOT NULL,
  `mobile` varchar(16) NOT NULL,
  `emailAddress` varchar(64) NOT NULL,
  `address` varchar(255) NOT NULL,
  `resumePath` varchar(255) NOT NULL,
  `skillID` int(11) NOT NULL,
  `isGraduate` tinyint(1) NOT NULL,
  `currentEmployerID` int(11) NOT NULL,
  `contactDetailsLastUpdated` date NOT NULL,
  `yearGraduated` int(4) NOT NULL,
  `monthGraduated` tinyint(2) NOT NULL,
  `termGraduated` tinyint(1) NOT NULL,
  `courseID` tinyint(2) NOT NULL,
  `statusID` tinyint(1) NOT NULL,
  `isVerified` tinyint(1) NOT NULL,
  PRIMARY KEY (`studentID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`studentID`, `firstName`, `lastName`, `middleName`, `landline`, `mobile`, `emailAddress`, `address`, `resumePath`, `skillID`, `isGraduate`, `currentEmployerID`, `contactDetailsLastUpdated`, `yearGraduated`, `monthGraduated`, `termGraduated`, `courseID`, `statusID`, `isVerified`) VALUES
(1, '', '', '', '', '', '', '', '', 0, 0, 0, '2014-03-10', 2014, 0, 0, 5, 1, 1),
(2, '', '', '', '', '', '', '', '', 0, 0, 0, '2014-03-01', 2013, 0, 0, 3, 2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `userID` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(25) NOT NULL,
  `password` varchar(255) NOT NULL,
  `firstName` varchar(50) NOT NULL,
  `middleName` varchar(50) NOT NULL,
  `lastName` varchar(50) NOT NULL,
  `landline` varchar(11) NOT NULL,
  `mobile` varchar(13) NOT NULL,
  `email` varchar(64) NOT NULL,
  `isActive` tinyint(1) NOT NULL,
  PRIMARY KEY (`userID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`userID`, `username`, `password`, `firstName`, `middleName`, `lastName`, `landline`, `mobile`, `email`, `isActive`) VALUES
(1, '201101170', '11111111', 'Kashka', 'Paraiso', 'Enverga', '1111111', '09152447567', 'kenverga@gmail.com', 1),
(2, '201101171', '31109090', 'Igii', 'Paraiso', 'Enverga', '1212121', '00000000', 'ienverga@gmail.com', 1),
(3, '201301170', '01108081', 'Bart', 'Smith', 'Simpson', '1111111', '09237896644', 'bsimpson@gmail.com', 1);

--
-- Triggers `users`
--
DROP TRIGGER IF EXISTS `update_user_tr`;
DELIMITER //
CREATE TRIGGER `update_user_tr` AFTER UPDATE ON `users`
 FOR EACH ROW BEGIN
IF (NEW.password <> OLD.password)
OR (NEW.password IS NOT NULL AND OLD.password IS NULL)
OR (NEW.password IS NULL AND OLD.password IS NOT NULL)
THEN
INSERT INTO iOPS.audit_log
VALUES (
	'update'
	, NULL
	, NOW()
    , IF(@user_id IS NULL, 0, @user_id)
	, 'user'
	, 'password'
	, OLD.password
	, NEW.password);
END IF;

IF (NEW.landline <> OLD.landline)
OR (NEW.landline IS NOT NULL AND OLD.landline IS NULL)
OR (NEW.landline IS NULL AND OLD.landline IS NOT NULL)
THEN
INSERT INTO iOPS.audit_log
VALUES (
    'update'
    , NULL
    , NOW()
    , IF(@user_id IS NULL, 0, @user_id)
    , 'user'
    , 'landline'
    , OLD.landline
    , NEW.landline);
	IF (NEW.userGroupID = 4 OR NEW.userGroupID = 5)
	THEN
        UPDATE iOPS.student
		LEFT JOIN iOPS.user
			ON student.userID = user.userID
		SET  `contactDetailsLastUpdated` =  CURDATE()
		WHERE  user.userID = @user_id;
	END IF;
END IF;

IF (NEW.mobile <> OLD.mobile)
OR (NEW.mobile IS NOT NULL AND OLD.mobile IS NULL)
OR (NEW.mobile IS NULL AND OLD.mobile IS NOT NULL)
THEN
INSERT INTO iOPS.audit_log
VALUES (
    'update'
    , NULL
    , NOW()
    , IF(@user_id IS NULL, 0, @user_id)
    , 'user'
    , 'mobile'
    , OLD.mobile
    , NEW.mobile);
	IF (NEW.userGroupID = 4 OR NEW.userGroupID = 5)
	THEN
        UPDATE iOPS.student
		LEFT JOIN iOPS.user
			ON student.userID = user.userID
		SET  `contactDetailsLastUpdated` =  CURDATE()
		WHERE  user.userID = @user_id;
	END IF;
END IF;

IF (NEW.email <> OLD.email)
OR (NEW.email IS NOT NULL AND OLD.email IS NULL)
OR (NEW.email IS NULL AND OLD.email IS NOT NULL)
THEN
INSERT INTO iOPS.audit_log
VALUES (
	'update'
	, NULL
	, NOW()
    , IF(@user_id IS NULL, 0, @user_id)
	, 'user'
	, 'email'
	, OLD.email
	, NEW.email);
END IF;

END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `users_employers_students_administrators`
--

CREATE TABLE IF NOT EXISTS `users_employers_students_administrators` (
  `userID` int(11) NOT NULL,
  `employerID` int(11) NOT NULL,
  `studentID` int(11) NOT NULL,
  `administratorID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
