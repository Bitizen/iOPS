-- phpMyAdmin SQL Dump
-- version 4.0.9
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 23, 2014 at 10:26 AM
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

DROP TABLE IF EXISTS `administrators`;
CREATE TABLE IF NOT EXISTS `administrators` (
  `administratorID` int(11) NOT NULL AUTO_INCREMENT,
  `firstName` varchar(50) NOT NULL,
  `lastName` varchar(50) NOT NULL,
  `middleName` varchar(50) NOT NULL,
  `position` varchar(255) NOT NULL,
  PRIMARY KEY (`administratorID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `administrators`
--

INSERT INTO `administrators` (`administratorID`, `firstName`, `lastName`, `middleName`, `position`) VALUES
(1, 'Barry', 'Celis', 'B', 'Internship Head');

-- --------------------------------------------------------

--
-- Table structure for table `audit_log`
--

DROP TABLE IF EXISTS `audit_log`;
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

DROP TABLE IF EXISTS `employers`;
CREATE TABLE IF NOT EXISTS `employers` (
  `employerID` int(11) NOT NULL AUTO_INCREMENT,
  `companyName` varchar(255) NOT NULL,
  `industryType` varchar(255) NOT NULL,
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
  `primaryContactUserID` int(11) NOT NULL,
  `secondaryContactUserID` int(11) NOT NULL,
  `tertiaryContactUserID` int(11) NOT NULL,
  PRIMARY KEY (`employerID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `employers`
--

INSERT INTO `employers` (`employerID`, `companyName`, `industryType`, `isHiring`, `SECRegistrationFilePath`, `completeMailingAddress`, `telephoneNumber`, `faxNumber`, `website`, `dateEstablished`, `companyLogoFilePath`, `otherDocumentsFilePath`, `hasScholarshipGrants`, `hasSeminarsAndTrainings`, `hasRecruitmentActivities`, `hasAllowanceProvision`, `hasFacultyImmersion`, `primaryContactUserID`, `secondaryContactUserID`, `tertiaryContactUserID`) VALUES
(1, 'IBM', 'Financials', 1, '', 'Makati City', '934-6644', '948-9944', 'ibm.com', '1990-11-30', '', '', 0, 1, 0, 0, 1, 0, 0, 0),
(2, 'infor', '', 0, '', '', '', '', '', '0000-00-00', '', '', 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `employers_students_log`
--

DROP TABLE IF EXISTS `employers_students_log`;
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
(1, 2, 0, 0, '0000-00-00', '2014-03-09'),
(2, 1, 2, 0, '2014-03-02', '2014-03-09');

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

DROP TABLE IF EXISTS `groups`;
CREATE TABLE IF NOT EXISTS `groups` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`id`, `name`, `description`) VALUES
(1, 'admin', 'Administrator'),
(2, 'employer', 'Employer'),
(3, 'superadmin', 'Super Administrator');

-- --------------------------------------------------------

--
-- Table structure for table `job_openings`
--

DROP TABLE IF EXISTS `job_openings`;
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
  `isVerified` tinyint(1) NOT NULL,
  `isActive` tinyint(1) NOT NULL,
  PRIMARY KEY (`jobOpeningID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `job_openings_courses`
--

DROP TABLE IF EXISTS `job_openings_courses`;
CREATE TABLE IF NOT EXISTS `job_openings_courses` (
  `jobOpeningID` int(11) NOT NULL,
  `courseID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `login_attempts`
--

DROP TABLE IF EXISTS `login_attempts`;
CREATE TABLE IF NOT EXISTS `login_attempts` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ip_address` varbinary(16) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `skills`
--

DROP TABLE IF EXISTS `skills`;
CREATE TABLE IF NOT EXISTS `skills` (
  `skillID` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`skillID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
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

INSERT INTO `students` (`studentID`, `firstName`, `lastName`, `middleName`, `landline`, `mobile`, `emailAddress`, `address`, `resumePath`, `currentEmployerID`, `contactDetailsLastUpdated`, `yearGraduated`, `monthGraduated`, `termGraduated`, `courseID`, `statusID`, `isVerified`) VALUES
(1, 'henry', 'henricus xi', 'lao', '982-1000', '0918-348-8828', 'henricuxi@gmail.com', 'Taguig', '', 0, '2014-03-10', 2014, 0, 0, 4, 2, 1),
(2, 'tabby', 'napoles', 'lim', '848-2394', '0914-533-5321', 'tlnap@gmail.com', 'Pasay', '', 1, '2014-03-01', 2013, 0, 0, 3, 2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `students_skills`
--

DROP TABLE IF EXISTS `students_skills`;
CREATE TABLE IF NOT EXISTS `students_skills` (
  `studentID` int(11) NOT NULL,
  `skillID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ip_address` varbinary(16) NOT NULL,
  `position` varchar(50) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `salt` varchar(40) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `activation_code` varchar(40) DEFAULT NULL,
  `forgotten_password_code` varchar(40) DEFAULT NULL,
  `forgotten_password_time` int(11) unsigned DEFAULT NULL,
  `remember_code` varchar(40) DEFAULT NULL,
  `created_on` int(11) unsigned NOT NULL,
  `last_login` int(11) unsigned DEFAULT NULL,
  `active` tinyint(1) unsigned DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `middle_name` varchar(50) NOT NULL,
  `landline` varchar(60) DEFAULT NULL,
  `mobile` varchar(60) NOT NULL,
  `date_of_birth` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `ip_address`, `position`, `username`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `middle_name`, `landline`, `mobile`, `date_of_birth`) VALUES
(1, '\0\0', 'Hero', 'administrator', '$2a$07$SeBknntpZror9uyftVopmu61qg0ms8Qv1yV6FG.kQOSM.9QhmTo36', '', 'admin@admin.com', '', NULL, NULL, '10bd3f40a4ebb18c8e7165019d352680f5f34bc7', 1268889823, 1395566496, 1, 'Gregg', 'Pilar', 'H.', '838-3333', '0918-348-8828', '1930-11-30'),
(2, '', 'HR Manager', 'employer', '$2a$07$SeBknntpZror9uyftVopmu61qg0ms8Qv1yV6FG.kQOSM.9QhmTo36', NULL, 'bobbertson@gmail.com', NULL, NULL, NULL, '10bd3f40a4ebb18c8e7165019d352680f5f34bc7', 0, 1395536353, 1, 'Bobby', 'Bobbertson', 'Mark', '573-3344', '0917-232-2471', '1986-11-20'),
(3, '', 'IT', 'employer2', '$2a$07$SeBknntpZror9uyftVopmu61qg0ms8Qv1yV6FG.kQOSM.9QhmTo36', NULL, 'janedoe@gmail.com', NULL, NULL, NULL, NULL, 0, NULL, NULL, 'Jane', 'Doe', 'Jay', '339-2345', '0911-2123-45362', '0000-00-00'),
(4, '', 'CEO', 'employer3', '$2a$07$SeBknntpZror9uyftVopmu61qg0ms8Qv1yV6FG.kQOSM.9QhmTo36', NULL, 'jaydoe@gmail.com', NULL, NULL, NULL, NULL, 0, NULL, NULL, 'Jay', 'Joe', 'John', '493-3498', '0982-244-2311', '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `users_employers_students_administrators`
--

DROP TABLE IF EXISTS `users_employers_students_administrators`;
CREATE TABLE IF NOT EXISTS `users_employers_students_administrators` (
  `userID` int(11) NOT NULL,
  `employerID` int(11) NOT NULL,
  `studentID` int(11) NOT NULL,
  `administratorID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users_employers_students_administrators`
--

INSERT INTO `users_employers_students_administrators` (`userID`, `employerID`, `studentID`, `administratorID`) VALUES
(2, 1, 0, 0),
(3, 1, 0, 0),
(4, 1, 0, 0),
(1, 0, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `users_groups`
--

DROP TABLE IF EXISTS `users_groups`;
CREATE TABLE IF NOT EXISTS `users_groups` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `group_id` mediumint(8) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uc_users_groups` (`user_id`,`group_id`),
  KEY `fk_users_groups_users1_idx` (`user_id`),
  KEY `fk_users_groups_groups1_idx` (`group_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `users_groups`
--

INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 2),
(4, 4, 2);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `users_groups`
--
ALTER TABLE `users_groups`
  ADD CONSTRAINT `fk_users_groups_groups1` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_users_groups_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
