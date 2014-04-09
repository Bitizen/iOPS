-- phpMyAdmin SQL Dump
-- version 4.0.9
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 29, 2014 at 02:09 PM
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `administrators`
--

INSERT INTO `administrators` (`administratorID`, `firstName`, `lastName`, `middleName`, `position`) VALUES
(1, 'Barry', 'Celis', 'B', 'Internship Head'),
(2, 'Mitch', 'Andaya', 'R.', 'VP of Academics');

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
-- Table structure for table `courses`
--

CREATE TABLE IF NOT EXISTS `courses` (
  `courseID` int(11) NOT NULL AUTO_INCREMENT,
  `course` varchar(255) NOT NULL,
  PRIMARY KEY (`courseID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`courseID`, `course`) VALUES
(1, 'BSBA Financial Management'),
(2, 'BA Multimedia Arts and Design'),
(3, 'BSBA Marketing and Advertising'),
(4, 'BS Animation'),
(5, 'BSCS Software Engineering'),
(6, 'BS Game Development'),
(7, 'BSIT Web Development'),
(8, 'Bachelor of Fashion Design and Technology');

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
  `industryPartner` varchar(3) NOT NULL,
  `hasScholarshipGrants` tinyint(1) NOT NULL,
  `hasSeminarsAndTrainings` tinyint(1) NOT NULL,
  `hasRecruitmentActivities` tinyint(1) NOT NULL,
  `hasAllowanceProvision` tinyint(1) NOT NULL,
  `hasFacultyImmersion` tinyint(1) NOT NULL,
  `primaryContactUserID` int(11) NOT NULL,
  `secondaryContactUserID` int(11) NOT NULL,
  `tertiaryContactUserID` int(11) NOT NULL,
  PRIMARY KEY (`employerID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `employers`
--

INSERT INTO `employers` (`employerID`, `companyName`, `industryType`, `isHiring`, `SECRegistrationFilePath`, `completeMailingAddress`, `telephoneNumber`, `faxNumber`, `website`, `dateEstablished`, `companyLogoFilePath`, `otherDocumentsFilePath`, `industryPartner`, `hasScholarshipGrants`, `hasSeminarsAndTrainings`, `hasRecruitmentActivities`, `hasAllowanceProvision`, `hasFacultyImmersion`, `primaryContactUserID`, `secondaryContactUserID`, `tertiaryContactUserID`) VALUES
(1, 'IBM', 'Financials', 1, 'uploads/SEC_Registration/IBM_SEC_Registration.jpg', 'Makati', '934-6644', '948-9944', 'ibm.com', '1990-11-30', '', '', 'YES', 0, 1, 0, 0, 1, 0, 0, 0),
(2, 'infor', 'Chemicals', 0, '', 'Taguig', '384-2232', '384-2233', 'infor.com', '2014-03-03', '', '', 'YES', 1, 0, 1, 1, 0, 0, 0, 0),
(3, 'Accenture', 'Software & Computer Services', 0, '', 'Pasig City', '555-1821', '555-1822', 'accenture.com', '0000-00-00', '', '', '', 0, 0, 0, 0, 0, 0, 0, 0);

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
  `endDate` date NOT NULL,
  `affiliation_status` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employers_students_log`
--

INSERT INTO `employers_students_log` (`employerID`, `studentID`, `positionID`, `employmentType`, `startDate`, `endDate`, `affiliation_status`) VALUES
(1, 2, 1, 0, '2014-03-03', '2014-03-18', 'Past'),
(1, 2, 4, 1, '2014-03-19', '0000-00-00', 'Current'),
(1, 4, 3, 0, '2014-03-03', '2014-03-18', 'Past'),
(1, 4, 2, 1, '2014-03-19', '0000-00-00', 'Current'),
(2, 1, 1, 0, '2014-03-03', '2014-03-17', 'Past'),
(1, 1, 2, 1, '2014-03-03', '0000-00-00', 'Current'),
(1, 3, 1, 0, '2014-03-03', '2014-03-17', 'Past'),
(2, 3, 4, 1, '2014-03-03', '0000-00-00', 'Current');

-- --------------------------------------------------------

--
-- Table structure for table `employment_status`
--

CREATE TABLE IF NOT EXISTS `employment_status` (
  `employment_statusID` int(11) NOT NULL AUTO_INCREMENT,
  `status` varchar(50) NOT NULL,
  PRIMARY KEY (`employment_statusID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `employment_status`
--

INSERT INTO `employment_status` (`employment_statusID`, `status`) VALUES
(1, 'Employed'),
(2, 'Unemployed (Seeking for a Job)'),
(3, 'Unemployed (Not Seeking for a Job)');

-- --------------------------------------------------------

--
-- Table structure for table `evaluation`
--

CREATE TABLE IF NOT EXISTS `evaluation` (
  `evaluationID` int(11) NOT NULL AUTO_INCREMENT,
  `studentID` int(11) NOT NULL,
  `studentName` varchar(50) NOT NULL,
  `department` varchar(50) NOT NULL,
  `startDate` date NOT NULL,
  `endDate` date NOT NULL,
  `evaluatorName` varchar(50) NOT NULL,
  `evaluatorPosition` varchar(50) NOT NULL,
  `scoreKnowledge` int(11) NOT NULL,
  `scoreQuantity` int(11) NOT NULL,
  `scoreQuality` int(11) NOT NULL,
  `scoreAttendance` int(11) NOT NULL,
  `scoreInterpersonal` int(11) NOT NULL,
  `scoreDependability` int(11) NOT NULL,
  `scoreWillingness` int(11) NOT NULL,
  `scoreInitiative` int(11) NOT NULL,
  `remarks` text NOT NULL,
  `isVerified` tinyint(1) NOT NULL,
  PRIMARY KEY (`evaluationID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `evaluation`
--

INSERT INTO `evaluation` (`evaluationID`, `studentID`, `studentName`, `department`, `startDate`, `endDate`, `evaluatorName`, `evaluatorPosition`, `scoreKnowledge`, `scoreQuantity`, `scoreQuality`, `scoreAttendance`, `scoreInterpersonal`, `scoreDependability`, `scoreWillingness`, `scoreInitiative`, `remarks`, `isVerified`) VALUES
(1, 0, '0', '0', '2014-03-26', '2014-03-26', '0', '0', 0, 0, 0, 0, 0, 0, 0, 0, '0', 0),
(2, 0, '0', '0', '2014-03-26', '2014-03-26', '0', '0', 0, 0, 0, 0, 0, 0, 0, 0, '0', 0),
(3, 0, 'Lyka', 'Dept', '2014-03-26', '2014-03-26', 'Jeremy', 'PM', 5, 5, 5, 5, 5, 5, 5, 4, 'Remark here', 0),
(4, 0, '0', '0', '2014-03-26', '2014-03-26', '0', '0', 0, 0, 0, 0, 0, 0, 0, 0, '0', 0),
(5, 0, 'Jenny Block', 'IT Department', '0000-00-00', '0000-00-00', 'Pablo Rodriguez', 'Layout Artist', 4, 3, 1, 2, 0, 5, 3, 2, 'Stuff stuff.', 0);

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE IF NOT EXISTS `groups` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`id`, `name`, `description`) VALUES
(1, 'admin', 'Administrator'),
(2, 'employer', 'Employer'),
(3, 'encoder', 'Encoder'),
(4, 'alumnus', 'Alumnus'),
(5, 'intern', 'Intern');

-- --------------------------------------------------------

--
-- Table structure for table `intern_status`
--

CREATE TABLE IF NOT EXISTS `intern_status` (
  `intern_statusID` int(11) NOT NULL AUTO_INCREMENT,
  `status` varchar(50) NOT NULL,
  PRIMARY KEY (`intern_statusID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `intern_status`
--

INSERT INTO `intern_status` (`intern_statusID`, `status`) VALUES
(1, 'Available'),
(2, 'Currently On-The-Job'),
(3, 'Completed Internship 1'),
(4, 'Completed Internship 2'),
(5, 'Employed');

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
-- Table structure for table `positions`
--

CREATE TABLE IF NOT EXISTS `positions` (
  `positionID` int(11) NOT NULL AUTO_INCREMENT,
  `position` varchar(255) NOT NULL,
  PRIMARY KEY (`positionID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `positions`
--

INSERT INTO `positions` (`positionID`, `position`) VALUES
(1, 'Junior Software Engineer'),
(2, 'Web Designer'),
(3, 'Web Layout Artist'),
(4, 'Database Administrator');

-- --------------------------------------------------------

--
-- Table structure for table `skills`
--

CREATE TABLE IF NOT EXISTS `skills` (
  `skillID` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`skillID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `skills`
--

INSERT INTO `skills` (`skillID`, `description`) VALUES
(1, 'Java'),
(2, 'PHP');

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
  `availability` varchar(255) NOT NULL,
  `resumePath` varchar(255) NOT NULL,
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`studentID`, `firstName`, `lastName`, `middleName`, `landline`, `mobile`, `emailAddress`, `address`, `availability`, `resumePath`, `isGraduate`, `currentEmployerID`, `contactDetailsLastUpdated`, `yearGraduated`, `monthGraduated`, `termGraduated`, `courseID`, `statusID`, `isVerified`) VALUES
(1, 'Henry', 'Henricus XI', 'K.', '982-1000', '0918-348-8828', 'henricuxi@gmail.com', 'Taguig', 'MTWThS 9-6pm, F 9-4pm', '', 1, 2, '2014-03-10', 2006, 7, 2, 4, 2, 1),
(2, 'Tabby', 'Napoles', 'P.', '848-2394', '0914-533-5321', 'tlnap@gmail.com', 'Pasay', '', '', 0, 1, '2014-03-01', 2009, 4, 2, 5, 3, 1),
(3, 'Jessica', 'Parker', 'M.', '938-2389', '0917-232-2471', 'jparker@gmail.com', 'Pasig City', 'TThS 9-6pm', 'uploads/Resume/Parker_Jessica_Resume.png', 0, 1, '0000-00-00', 2008, 2, 2, 6, 2, 1),
(4, 'Dice', 'Consolacion', 'E.', '938-2389', '0918-284-2837', 'dicey@gmail.com', 'Marikina', 'MWF, Th 9-3:30pm', '', 1, 1, '0000-00-00', 2014, 8, 1, 5, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `students_skills`
--

CREATE TABLE IF NOT EXISTS `students_skills` (
  `studentID` int(11) NOT NULL,
  `skillID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `students_skills`
--

INSERT INTO `students_skills` (`studentID`, `skillID`) VALUES
(4, 1),
(4, 2),
(2, 1),
(2, 2),
(1, 1),
(3, 2);

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
  `date_of_birth` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `ip_address`, `position`, `username`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `middle_name`, `landline`, `mobile`, `date_of_birth`) VALUES
(1, '\0\0', 'Hero', 'administrator', '$2a$07$SeBknntpZror9uyftVopmu61qg0ms8Qv1yV6FG.kQOSM.9QhmTo36', '', 'admin@admin.com', '', NULL, NULL, '10bd3f40a4ebb18c8e7165019d352680f5f34bc7', 1268889823, 1396072838, 1, 'Greg', 'Pilar', 'H.', '838-3333', '0918-348-8828', '1930-11-30'),
(2, '', 'HR Manager', 'employer', '$2a$07$SeBknntpZror9uyftVopmu61qg0ms8Qv1yV6FG.kQOSM.9QhmTo36', NULL, 'emp1@emp.com', NULL, NULL, NULL, '10bd3f40a4ebb18c8e7165019d352680f5f34bc7', 0, 1396060836, 1, 'Bob', 'Bobbertson', 'Mark', '573-3344', '0917-232-2471', '1986-11-20'),
(3, '', 'IT', 'employer2', '$2a$07$SeBknntpZror9uyftVopmu61qg0ms8Qv1yV6FG.kQOSM.9QhmTo36', NULL, 'emp2@emp.com', NULL, NULL, NULL, NULL, 0, NULL, NULL, 'Jane', 'Doe', 'Jay', '339-2345', '0911-213-4362', '2013-11-03'),
(4, '', 'CEO', 'employer3', '$2a$07$SeBknntpZror9uyftVopmu61qg0ms8Qv1yV6FG.kQOSM.9QhmTo36', NULL, 'emp3@emp.com', NULL, NULL, NULL, NULL, 0, NULL, NULL, 'Jay', 'Joe', 'John', '493-3498', '0982-244-2311', '2014-02-03'),
(5, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Head of Something', 'hblue', '$2y$08$F3B/FSRNxbKdoFZekmvMguKaPLRB9yF2GspOWuXf2e39bf7m12kvK', NULL, 'emp4@emp.com', NULL, NULL, NULL, NULL, 1395651736, 1395651736, 1, 'Henry', 'Blue', 'Moe', '565-1888', '0922-374-4822', '2014-03-02'),
(6, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Encoder', 'jrockets', '$2y$08$TyyMYxkl6h34oi8MSIwp2OWcLknkaXK9DIaeE2Ht9ugBYQbTmamgi', NULL, 'enc1@enc.com', NULL, NULL, NULL, '4bbcacf55e2a095465e3600da8251512466423e4', 1395679494, 1395983027, 1, 'Johnny', 'Bean', 'Rockets', '983-0182', '0917-273-2828', '1992-01-03'),
(7, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Alumnus', 'bflay', '$2y$08$7UR0frb0K4ZS6qBPFsqMqOn4lnxGSKdhJpWjtG7313qDkjOuX/tGG', NULL, 'alum1@alum.com', NULL, NULL, NULL, '603b52b68ea9512dbe0a1fd0f21f871b0753dc51', 1395717871, 1395982566, 1, 'Bobby', 'Flay', 'Ronaldo', '938-0928', '0919-288-9830', '2014-02-02'),
(8, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Intern', 'jparker', '$2y$08$z74SN5OM5NVniiSODbIyROoDFUvxVeio.K7IzWexYaGy3LvEPJjnu', NULL, 'jparker@gmail.com', NULL, NULL, NULL, 'c9da770e9d50d28d188bb0dbae50cd2eb2814104', 1395733861, 1396016771, 1, 'Jessica', 'Parker', 'Sarah', '942-0092', '0916-222-3767', '2013-09-03'),
(9, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Alumnus', 'dice.conso', '$2y$08$CXzqLKmYc1eXI2PExZDp.OGbC12GNGQtwNVlietw8peXLnNADjCO.', NULL, 'dicey@gmail.com', NULL, NULL, NULL, '19b66083a02c7ac4df8098e1cb4a11496184abb8', 1395848867, 1395996177, 1, 'Dice', 'Consolacion', 'C.', '938-2928', '0918-737-2728', '2014-03-05'),
(10, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '', 'r.crowe', '$2y$08$zU154lN2FuvGgq8U9/zkOOkwnqCsGwVbeObJwjA47QrQiabQiZ0qO', NULL, 'enc2@enc.com', '381aa62873a143e4b7da292d78f8e3a03371da82', NULL, NULL, NULL, 1396027649, 1396027649, 0, 'Russel', 'Crowe', 'Brand', '989-1022', '0912-836-8371', '0000-00-00'),
(11, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '', 'm.andaya', '$2y$08$aGnBlh91kQ..fCUZfbDM.ubmLhjTCg4ikAqfPHDeCftB6pT1YDZNO', NULL, 'admin2@admin.com', '615bde503460b5edc878bc93b4d129fdf1722d41', NULL, NULL, NULL, 1396027891, 1396027891, 0, 'Mitch', 'Andaya', 'R.', '843-8788', '0922-873-0091', '0000-00-00');

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
(4, 1, 0, 0),
(1, 0, 0, 1),
(5, 2, 0, 0),
(8, 0, 3, 0),
(9, 0, 4, 0);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=17 ;

--
-- Dumping data for table `users_groups`
--

INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 2),
(4, 4, 2),
(6, 5, 2),
(8, 6, 3),
(10, 7, 4),
(12, 8, 5),
(14, 9, 4),
(15, 10, 3),
(16, 11, 1);

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
