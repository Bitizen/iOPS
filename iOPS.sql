-- phpMyAdmin SQL Dump
-- version 4.0.9
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 19, 2014 at 10:53 AM
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
  `primaryContactName` varchar(150) NOT NULL,
  `primaryContactDesignation` varchar(50) NOT NULL,
  `primaryContactTelephoneNumber` varchar(60) NOT NULL,
  `primaryContactMobileNumber` varchar(60) NOT NULL,
  `primaryContactEmail` varchar(64) NOT NULL,
  `primaryContactDateOfBirth` date NOT NULL,
  `secondaryContactName` varchar(150) NOT NULL,
  `secondaryContactDesignation` varchar(50) NOT NULL,
  `secondaryContactTelephoneNumber` varchar(60) NOT NULL,
  `secondaryContactMobileNumber` varchar(60) NOT NULL,
  `secondaryContactEmail` varchar(64) NOT NULL,
  `secondaryContactDateOfBirth` date NOT NULL,
  `tertiaryContactName` varchar(150) NOT NULL,
  `tertiaryContactDesignation` varchar(50) NOT NULL,
  `tertiaryContactTelephoneNumber` varchar(60) NOT NULL,
  `tertiaryContactMobileNumber` varchar(60) NOT NULL,
  `tertiaryContactEmail` varchar(64) NOT NULL,
  `tertiaryContactDateOfBirth` date NOT NULL,
  PRIMARY KEY (`employerID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `employers`
--

INSERT INTO `employers` (`employerID`, `companyName`, `industryType`, `isHiring`, `SECRegistrationFilePath`, `completeMailingAddress`, `telephoneNumber`, `faxNumber`, `website`, `dateEstablished`, `companyLogoFilePath`, `otherDocumentsFilePath`, `hasScholarshipGrants`, `hasSeminarsAndTrainings`, `hasRecruitmentActivities`, `hasAllowanceProvision`, `hasFacultyImmersion`, `primaryContactName`, `primaryContactDesignation`, `primaryContactTelephoneNumber`, `primaryContactMobileNumber`, `primaryContactEmail`, `primaryContactDateOfBirth`, `secondaryContactName`, `secondaryContactDesignation`, `secondaryContactTelephoneNumber`, `secondaryContactMobileNumber`, `secondaryContactEmail`, `secondaryContactDateOfBirth`, `tertiaryContactName`, `tertiaryContactDesignation`, `tertiaryContactTelephoneNumber`, `tertiaryContactMobileNumber`, `tertiaryContactEmail`, `tertiaryContactDateOfBirth`) VALUES
(1, 'IBM', 'Tec', 1, '', 'Makati City', '949-3939', '949-9394', 'ibm.com.ph', '2014-03-24', '', '', 1, 0, 1, 0, 1, '', '', '', '', '', '0000-00-00', '', '', '', '', '', '0000-00-00', '', '', '', '', '', '0000-00-00');

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
-- Table structure for table `groups`
--

CREATE TABLE IF NOT EXISTS `groups` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`id`, `name`, `description`) VALUES
(1, 'admin', 'Administrator'),
(2, 'employer', 'Employer');

-- --------------------------------------------------------

--
-- Table structure for table `industries`
--

CREATE TABLE IF NOT EXISTS `industries` (
  `industryID` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  PRIMARY KEY (`industryID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=25 ;

--
-- Dumping data for table `industries`
--

INSERT INTO `industries` (`industryID`, `type`) VALUES
(1, 'Advertising / Design and Marketing'),
(2, 'Aerospace & Defense'),
(3, 'Automobiles & Parts'),
(4, 'Business Process Outsourcing'),
(5, 'Chemicals'),
(6, 'Construction & Materials'),
(7, 'Education / Training'),
(8, 'Electronics & Electrical Equipment'),
(9, 'Financials'),
(10, 'Telecommunications'),
(11, 'Travel & Leisure'),
(12, 'Food & Beverage'),
(13, 'General Industries'),
(14, 'Health Care'),
(15, 'Hotel / Resort / Restaurant'),
(16, 'BPO'),
(17, 'Industrial Engineering'),
(18, 'Industrial Transportation'),
(19, 'Media'),
(20, 'Oil & Gas'),
(21, 'Personal & Household Goods'),
(22, 'Retail'),
(23, 'Software & Computer Services'),
(24, 'Technology Hardware & Equipment');

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
-- Table structure for table `login_attempts`
--

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `ip_address`, `position`, `username`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `middle_name`, `landline`, `mobile`) VALUES
(1, '\0\0', '', 'administrator', '$2a$07$SeBknntpZror9uyftVopmu61qg0ms8Qv1yV6FG.kQOSM.9QhmTo36', '', 'admin@admin.com', '', NULL, NULL, NULL, 1268889823, 1395120589, 1, 'Admin', 'istrator', '', '0', ''),
(2, '', 'Human Resources Representative', 'employer', '$2a$07$SeBknntpZror9uyftVopmu61qg0ms8Qv1yV6FG.kQOSM.9QhmTo36', NULL, 'employer@gmail.com', NULL, NULL, NULL, '10bd3f40a4ebb18c8e7165019d352680f5f34bc7', 0, 1395209958, 1, 'john', 'doe', 'jay', '908-3379', '0911-234-3455'),
(3, '', 'IT', 'employer2', '$2a$07$SeBknntpZror9uyftVopmu61qg0ms8Qv1yV6FG.kQOSM.9QhmTo36', NULL, 'janedoe@gmail.com', NULL, NULL, NULL, NULL, 0, NULL, NULL, 'jane', 'doe', 'jay', '339-2345', '0911-2123-45362'),
(4, '', 'CEO', 'employer3', '$2a$07$SeBknntpZror9uyftVopmu61qg0ms8Qv1yV6FG.kQOSM.9QhmTo36', NULL, 'jaydoe@gmail.com', NULL, NULL, NULL, NULL, 0, NULL, NULL, 'jay', 'doe', 'john', '493-3498', '0982-244-2311');

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

--
-- Dumping data for table `users_employers_students_administrators`
--

INSERT INTO `users_employers_students_administrators` (`userID`, `employerID`, `studentID`, `administratorID`) VALUES
(2, 1, 0, 0),
(3, 1, 0, 0),
(4, 1, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `users_groups`
--

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
