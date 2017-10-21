-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 20, 2017 at 11:30 AM
-- Server version: 10.1.25-MariaDB
-- PHP Version: 7.0.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `yst`
--

-- --------------------------------------------------------

--
-- Stand-in structure for view `beneficiary`
-- (See below for the actual view)
--
CREATE TABLE `beneficiary` (
`strPERSON_FN` varchar(20)
,`strPERSON_MN` varchar(20)
,`strPERSON_LN` varchar(20)
,`intBENEFICIARY_ID` int(11)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `bloodbanks`
-- (See below for the actual view)
--
CREATE TABLE `bloodbanks` (
`intBLOODBANK_ID` int(11)
,`intCATEGORY_ID` int(11)
,`strBLOODBANK_NAME` varchar(20)
,`strCATEGORY_NAME` varchar(45)
,`strBLOODBANK_LOCATION` varchar(50)
,`strBLOODBANK_CONTACT1` varchar(15)
,`strBLOODBANK_CONTACT2` varchar(15)
,`strBLOODBANK_CONTACT3` varchar(15)
,`intACCOUNT_ID` int(11)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `donor`
-- (See below for the actual view)
--
CREATE TABLE `donor` (
`intDONOR_ID` int(11)
,`intPERSON_ID` int(11)
,`strPERSON_FN` varchar(20)
,`strPERSON_MN` varchar(20)
,`strPERSON_LN` varchar(20)
,`strBLOODTYPE_DESCRIPTION` varchar(20)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `event`
-- (See below for the actual view)
--
CREATE TABLE `event` (
`intEVENT_ID` int(11)
,`strEVENT_DESC` varchar(25)
,`strEVENT_LOCATION` varchar(25)
,`dtmEVENT_DATETIME` datetime
,`strBLOODBANK_NAME` varchar(20)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `post`
-- (See below for the actual view)
--
CREATE TABLE `post` (
`intPOST_ID` int(11)
,`intACCOUNT_ID` int(11)
,`intBLOODTYPE_ID` int(11)
,`intBLOODCOMPONENT_ID` int(11)
,`strBLOODTYPE_DESCRIPTION` varchar(20)
,`strBLOODCOMPONENT_DESCRIPTION` varchar(20)
,`intPOSTSTATUS_ID` int(11)
,`strSTATUS_DESCRIPTION` varchar(15)
,`strPOST_CONTENT` varchar(200)
,`dtmPOST_DATE` datetime
,`intPERSON_ID` int(11)
,`strPERSON_FN` varchar(20)
,`strPERSON_MN` varchar(20)
,`strPERSON_LN` varchar(20)
,`bool_ISBENEFICIARY` tinyint(1)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `reserve`
-- (See below for the actual view)
--
CREATE TABLE `reserve` (
`intBLOODRESERVE_ID` int(11)
,`intPERSON_ID` int(11)
,`intACCOUNT_ID` int(11)
,`strPERSON_FN` varchar(20)
,`strPERSON_MN` varchar(20)
,`strPERSON_LN` varchar(20)
,`strBLOODBANK_NAME` varchar(20)
,`strQUANTITY` varchar(10)
,`dtmRESERVE_DATE` datetime
,`dtmDEADLINE_DATE` datetime
,`strBLOODTYPE_DESCRIPTION` varchar(20)
,`strBLOODCOMPONENT_DESCRIPTION` varchar(20)
,`bool_ISBENEFICIARY` tinyint(1)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `respondents`
-- (See below for the actual view)
--
CREATE TABLE `respondents` (
`intPDONOR_ID` int(11)
,`intPERSON_ID` int(11)
,`intACCOUNT_ID` int(11)
,`strACCOUNT_EMAIL` varchar(20)
,`strPERSON_FN` varchar(20)
,`strPERSON_MN` varchar(20)
,`strPERSON_LN` varchar(20)
,`dtmPERSON_BDAY` date
,`strBLOODTYPE_DESCRIPTION` varchar(20)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `stocks`
-- (See below for the actual view)
--
CREATE TABLE `stocks` (
`intACCOUNT_ID` int(11)
,`strBLOODBANK_NAME` varchar(20)
,`strBLOODCOMPONENT_DESCRIPTION` varchar(20)
,`strBLOODSTOCK_AP` varchar(10)
,`strBLOODSTOCK_AN` varchar(10)
,`strBLOODSTOCK_BP` varchar(10)
,`strBLOODSTOCK_BN` varchar(10)
,`strBLOODSTOCK_ABP` varchar(10)
,`strBLOODSTOCK_ABN` varchar(10)
,`strBLOODSTOCK_OP` varchar(10)
,`strBLOODSTOCK_ON` varchar(10)
,`dblBLOODSTOCK_PRICE` decimal(10,0)
,`intBLOODBANK_ID` int(11)
,`intBLOODSTOCK_ID` int(11)
);

-- --------------------------------------------------------

--
-- Table structure for table `tblaccounts`
--

CREATE TABLE `tblaccounts` (
  `intACCOUNT_ID` int(11) NOT NULL,
  `strACCOUNT_EMAIL` varchar(20) NOT NULL,
  `strACCOUNT_PASSWORD` varchar(20) NOT NULL,
  `intACCOUNTTYPE_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblaccounts`
--

INSERT INTO `tblaccounts` (`intACCOUNT_ID`, `strACCOUNT_EMAIL`, `strACCOUNT_PASSWORD`, `intACCOUNTTYPE_ID`) VALUES
(62, 'admin@admin', 'admin', 1),
(64, 'CES@BLOOD', 'CES', 2),
(65, 'admin2@admin2', 'admin2', 1),
(66, 'CES@PERSON', 'ces', 3),
(68, 'yanie@danielle', '1234', 3);

-- --------------------------------------------------------

--
-- Table structure for table `tblaccounttype`
--

CREATE TABLE `tblaccounttype` (
  `intACCOUNTTYPE_ID` int(11) NOT NULL,
  `srtACCOUNT_DESC` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblaccounttype`
--

INSERT INTO `tblaccounttype` (`intACCOUNTTYPE_ID`, `srtACCOUNT_DESC`) VALUES
(1, 'admin'),
(2, 'bloodbank'),
(3, 'member');

-- --------------------------------------------------------

--
-- Table structure for table `tbladmin`
--

CREATE TABLE `tbladmin` (
  `intADMIN_ID` int(11) NOT NULL,
  `strADMIN_FN` varchar(25) NOT NULL,
  `strADMIN_MN` varchar(20) NOT NULL,
  `strADMIN_LN` varchar(20) NOT NULL,
  `strADMIN_CONTACT` varchar(15) NOT NULL,
  `intACCOUNT_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbladmin`
--

INSERT INTO `tbladmin` (`intADMIN_ID`, `strADMIN_FN`, `strADMIN_MN`, `strADMIN_LN`, `strADMIN_CONTACT`, `intACCOUNT_ID`) VALUES
(4, 'admin', 'admin', 'admin', '12324567', 62),
(5, 'admin2', 'admin2', 'admin2', '252642', 65);

-- --------------------------------------------------------

--
-- Table structure for table `tblbeneficiary`
--

CREATE TABLE `tblbeneficiary` (
  `intBENEFICIARY_ID` int(11) NOT NULL,
  `intACCOUNT_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblbeneficiary`
--

INSERT INTO `tblbeneficiary` (`intBENEFICIARY_ID`, `intACCOUNT_ID`) VALUES
(5, 66),
(6, 68);

-- --------------------------------------------------------

--
-- Table structure for table `tblbloodbank`
--

CREATE TABLE `tblbloodbank` (
  `intBLOODBANK_ID` int(11) NOT NULL,
  `strBLOODBANK_NAME` varchar(20) NOT NULL,
  `strBLOODBANK_LOCATION` varchar(50) NOT NULL,
  `strBLOODBANK_CONTACT1` varchar(15) NOT NULL,
  `strBLOODBANK_CONTACT2` varchar(15) NOT NULL,
  `strBLOODBANK_CONTACT3` varchar(15) NOT NULL,
  `intCATEGORY_ID` int(11) NOT NULL,
  `intACCOUNT_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblbloodbank`
--

INSERT INTO `tblbloodbank` (`intBLOODBANK_ID`, `strBLOODBANK_NAME`, `strBLOODBANK_LOCATION`, `strBLOODBANK_CONTACT1`, `strBLOODBANK_CONTACT2`, `strBLOODBANK_CONTACT3`, `intCATEGORY_ID`, `intACCOUNT_ID`) VALUES
(16, 'CES BLOOD BANK', 'PUREZA', '0102498', '091234567890', '098765432109', 5, 64);

-- --------------------------------------------------------

--
-- Table structure for table `tblbloodcomponent`
--

CREATE TABLE `tblbloodcomponent` (
  `intBLOODCOMPONENT_ID` int(11) NOT NULL,
  `strBLOODCOMPONENT_DESCRIPTION` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblbloodcomponent`
--

INSERT INTO `tblbloodcomponent` (`intBLOODCOMPONENT_ID`, `strBLOODCOMPONENT_DESCRIPTION`) VALUES
(1, 'WHOLE BLOOD'),
(2, 'PLATELETS'),
(3, 'PLASMA'),
(4, 'CRYOPRECIPITATED AHF'),
(5, 'RED CELLS');

-- --------------------------------------------------------

--
-- Table structure for table `tblbloodstock`
--

CREATE TABLE `tblbloodstock` (
  `intBLOODSTOCK_ID` int(11) NOT NULL,
  `intBLOODCOMPONENT_ID` int(11) NOT NULL,
  `intBLOODBANK_ID` int(11) NOT NULL,
  `dblBLOODSTOCK_PRICE` decimal(10,0) NOT NULL,
  `strBLOODSTOCK_AP` varchar(10) NOT NULL,
  `strBLOODSTOCK_AN` varchar(10) NOT NULL,
  `strBLOODSTOCK_BP` varchar(10) NOT NULL,
  `strBLOODSTOCK_BN` varchar(10) NOT NULL,
  `strBLOODSTOCK_ABP` varchar(10) NOT NULL,
  `strBLOODSTOCK_ABN` varchar(10) NOT NULL,
  `strBLOODSTOCK_OP` varchar(10) NOT NULL,
  `strBLOODSTOCK_ON` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblbloodstock`
--

INSERT INTO `tblbloodstock` (`intBLOODSTOCK_ID`, `intBLOODCOMPONENT_ID`, `intBLOODBANK_ID`, `dblBLOODSTOCK_PRICE`, `strBLOODSTOCK_AP`, `strBLOODSTOCK_AN`, `strBLOODSTOCK_BP`, `strBLOODSTOCK_BN`, `strBLOODSTOCK_ABP`, `strBLOODSTOCK_ABN`, `strBLOODSTOCK_OP`, `strBLOODSTOCK_ON`) VALUES
(37, 1, 16, '0', '0', '0', '0', '0', '0', '0', '0', '0'),
(38, 2, 16, '0', '0', '0', '0', '0', '0', '0', '0', '0');

-- --------------------------------------------------------

--
-- Table structure for table `tblbloodtype`
--

CREATE TABLE `tblbloodtype` (
  `intBLOODTYPE_ID` int(11) NOT NULL,
  `strBLOODTYPE_DESCRIPTION` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblbloodtype`
--

INSERT INTO `tblbloodtype` (`intBLOODTYPE_ID`, `strBLOODTYPE_DESCRIPTION`) VALUES
(1, 'A+'),
(2, 'A-'),
(3, 'B+'),
(4, 'B-'),
(5, 'AB+'),
(6, 'AB-'),
(7, 'O+'),
(8, 'O-');

-- --------------------------------------------------------

--
-- Table structure for table `tblcategory`
--

CREATE TABLE `tblcategory` (
  `intCATEGORY_ID` int(11) NOT NULL,
  `strCATEGORY_NAME` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblcategory`
--

INSERT INTO `tblcategory` (`intCATEGORY_ID`, `strCATEGORY_NAME`) VALUES
(1, 'Blood Bank'),
(2, 'Private Hospital'),
(3, 'General Hospital'),
(4, 'Non-Governmental Organization'),
(5, 'Volunteer Organization'),
(6, 'Blood Donation Center');

-- --------------------------------------------------------

--
-- Table structure for table `tbldonor`
--

CREATE TABLE `tbldonor` (
  `intDONOR_ID` int(11) NOT NULL,
  `intPERSON_ID` int(11) NOT NULL,
  `intBLOODTYPE_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbldonor`
--

INSERT INTO `tbldonor` (`intDONOR_ID`, `intPERSON_ID`, `intBLOODTYPE_ID`) VALUES
(18, 27, 1),
(20, 29, 5);

-- --------------------------------------------------------

--
-- Table structure for table `tblevents`
--

CREATE TABLE `tblevents` (
  `intEVENT_ID` int(11) NOT NULL,
  `strEVENT_DESC` varchar(25) NOT NULL,
  `strEVENT_LOCATION` varchar(25) NOT NULL,
  `dtmEVENT_DATETIME` datetime NOT NULL,
  `intACCOUNT_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tblperson`
--

CREATE TABLE `tblperson` (
  `intPERSON_ID` int(11) NOT NULL,
  `intACCOUNT_ID` int(11) NOT NULL,
  `strPERSON_FN` varchar(20) NOT NULL,
  `strPERSON_MN` varchar(20) NOT NULL,
  `strPERSON_LN` varchar(20) NOT NULL,
  `dtmPERSON_BDAY` date NOT NULL,
  `strPERSON_ADDRESS` varchar(50) NOT NULL,
  `strPERSON_CONTACTNO` varchar(15) NOT NULL,
  `bool_ISBENEFICIARY` tinyint(1) NOT NULL,
  `bool_ISDONOR` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblperson`
--

INSERT INTO `tblperson` (`intPERSON_ID`, `intACCOUNT_ID`, `strPERSON_FN`, `strPERSON_MN`, `strPERSON_LN`, `dtmPERSON_BDAY`, `strPERSON_ADDRESS`, `strPERSON_CONTACTNO`, `bool_ISBENEFICIARY`, `bool_ISDONOR`) VALUES
(27, 66, 'ces', 'ces', 'ces', '2013-11-11', 'here', '093217428', 1, 1),
(29, 68, 'Yanie', 'Danielle', 'Exiomo', '2005-05-05', 'qwerty', '0987654321', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tblpost`
--

CREATE TABLE `tblpost` (
  `intPOST_ID` int(11) NOT NULL,
  `intACCOUNT_ID` int(11) NOT NULL,
  `intBLOODTYPE_ID` int(11) NOT NULL,
  `intBLOODCOMPONENT_ID` int(11) NOT NULL,
  `strPOST_CONTENT` varchar(200) NOT NULL,
  `intPOSTSTATUS_ID` int(11) NOT NULL,
  `dtmPOST_DATE` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblpost`
--

INSERT INTO `tblpost` (`intPOST_ID`, `intACCOUNT_ID`, `intBLOODTYPE_ID`, `intBLOODCOMPONENT_ID`, `strPOST_CONTENT`, `intPOSTSTATUS_ID`, `dtmPOST_DATE`) VALUES
(11, 66, 1, 1, 'ano', 1, '2017-10-20 16:47:52'),
(12, 66, 1, 1, 'hahahahA', 1, '2017-10-20 16:52:53'),
(13, 68, 1, 1, 'ag', 1, '2017-10-20 17:08:19');

-- --------------------------------------------------------

--
-- Table structure for table `tblpostdonor`
--

CREATE TABLE `tblpostdonor` (
  `intPDONOR_ID` int(11) NOT NULL,
  `intACCOUNT_ID` int(11) NOT NULL,
  `intPOST_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tblpoststatus`
--

CREATE TABLE `tblpoststatus` (
  `intPOSTSTATUS_ID` int(11) NOT NULL,
  `strSTATUS_DESCRIPTION` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblpoststatus`
--

INSERT INTO `tblpoststatus` (`intPOSTSTATUS_ID`, `strSTATUS_DESCRIPTION`) VALUES
(1, 'IN NEED'),
(2, 'SOLVED');

-- --------------------------------------------------------

--
-- Table structure for table `tblreservation`
--

CREATE TABLE `tblreservation` (
  `intBLOODRESERVE_ID` int(11) NOT NULL,
  `intACCOUNT_ID` int(11) NOT NULL,
  `intBLOODBANK_ID` int(11) NOT NULL,
  `intBLOODTYPE_ID` int(11) NOT NULL,
  `intBLOODCOMPONENT_ID` int(11) NOT NULL,
  `strQUANTITY` varchar(10) NOT NULL,
  `dtmRESERVE_DATE` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `dtmDEADLINE_DATE` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblreservation`
--

INSERT INTO `tblreservation` (`intBLOODRESERVE_ID`, `intACCOUNT_ID`, `intBLOODBANK_ID`, `intBLOODTYPE_ID`, `intBLOODCOMPONENT_ID`, `strQUANTITY`, `dtmRESERVE_DATE`, `dtmDEADLINE_DATE`) VALUES
(17, 68, 16, 1, 1, '1', '2017-10-20 17:07:55', '0000-00-00 00:00:00'),
(18, 66, 16, 1, 1, 'a', '2017-10-20 17:08:58', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Structure for view `beneficiary`
--
DROP TABLE IF EXISTS `beneficiary`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `beneficiary`  AS  select `tblperson`.`strPERSON_FN` AS `strPERSON_FN`,`tblperson`.`strPERSON_MN` AS `strPERSON_MN`,`tblperson`.`strPERSON_LN` AS `strPERSON_LN`,`tblbeneficiary`.`intBENEFICIARY_ID` AS `intBENEFICIARY_ID` from ((`tblaccounts` join `tblbeneficiary`) join `tblperson`) where ((`tblbeneficiary`.`intACCOUNT_ID` = `tblaccounts`.`intACCOUNT_ID`) and (`tblperson`.`intACCOUNT_ID` = `tblaccounts`.`intACCOUNT_ID`)) ;

-- --------------------------------------------------------

--
-- Structure for view `bloodbanks`
--
DROP TABLE IF EXISTS `bloodbanks`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `bloodbanks`  AS  select `tblbloodbank`.`intBLOODBANK_ID` AS `intBLOODBANK_ID`,`tblbloodbank`.`intCATEGORY_ID` AS `intCATEGORY_ID`,`tblbloodbank`.`strBLOODBANK_NAME` AS `strBLOODBANK_NAME`,`tblcategory`.`strCATEGORY_NAME` AS `strCATEGORY_NAME`,`tblbloodbank`.`strBLOODBANK_LOCATION` AS `strBLOODBANK_LOCATION`,`tblbloodbank`.`strBLOODBANK_CONTACT1` AS `strBLOODBANK_CONTACT1`,`tblbloodbank`.`strBLOODBANK_CONTACT2` AS `strBLOODBANK_CONTACT2`,`tblbloodbank`.`strBLOODBANK_CONTACT3` AS `strBLOODBANK_CONTACT3`,`tblbloodbank`.`intACCOUNT_ID` AS `intACCOUNT_ID` from ((`tblbloodbank` join `tblcategory`) join `tblaccounts`) where ((`tblbloodbank`.`intCATEGORY_ID` = `tblcategory`.`intCATEGORY_ID`) and (`tblbloodbank`.`intACCOUNT_ID` = `tblaccounts`.`intACCOUNT_ID`)) ;

-- --------------------------------------------------------

--
-- Structure for view `donor`
--
DROP TABLE IF EXISTS `donor`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `donor`  AS  select `tbldonor`.`intDONOR_ID` AS `intDONOR_ID`,`tblperson`.`intPERSON_ID` AS `intPERSON_ID`,`tblperson`.`strPERSON_FN` AS `strPERSON_FN`,`tblperson`.`strPERSON_MN` AS `strPERSON_MN`,`tblperson`.`strPERSON_LN` AS `strPERSON_LN`,`tblbloodtype`.`strBLOODTYPE_DESCRIPTION` AS `strBLOODTYPE_DESCRIPTION` from ((`tblperson` join `tbldonor`) join `tblbloodtype`) where ((`tbldonor`.`intBLOODTYPE_ID` = `tblbloodtype`.`intBLOODTYPE_ID`) and (`tblperson`.`intPERSON_ID` = `tbldonor`.`intPERSON_ID`)) ;

-- --------------------------------------------------------

--
-- Structure for view `event`
--
DROP TABLE IF EXISTS `event`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `event`  AS  select `tblevents`.`intEVENT_ID` AS `intEVENT_ID`,`tblevents`.`strEVENT_DESC` AS `strEVENT_DESC`,`tblevents`.`strEVENT_LOCATION` AS `strEVENT_LOCATION`,`tblevents`.`dtmEVENT_DATETIME` AS `dtmEVENT_DATETIME`,`tblbloodbank`.`strBLOODBANK_NAME` AS `strBLOODBANK_NAME` from ((`tblevents` join `tblbloodbank`) join `tblaccounts`) where ((`tblevents`.`intACCOUNT_ID` = `tblaccounts`.`intACCOUNT_ID`) and (`tblaccounts`.`intACCOUNT_ID` = `tblbloodbank`.`intACCOUNT_ID`)) ;

-- --------------------------------------------------------

--
-- Structure for view `post`
--
DROP TABLE IF EXISTS `post`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `post`  AS  select `tblpost`.`intPOST_ID` AS `intPOST_ID`,`tblpost`.`intACCOUNT_ID` AS `intACCOUNT_ID`,`tblpost`.`intBLOODTYPE_ID` AS `intBLOODTYPE_ID`,`tblpost`.`intBLOODCOMPONENT_ID` AS `intBLOODCOMPONENT_ID`,`tblbloodtype`.`strBLOODTYPE_DESCRIPTION` AS `strBLOODTYPE_DESCRIPTION`,`tblbloodcomponent`.`strBLOODCOMPONENT_DESCRIPTION` AS `strBLOODCOMPONENT_DESCRIPTION`,`tblpost`.`intPOSTSTATUS_ID` AS `intPOSTSTATUS_ID`,`tblpoststatus`.`strSTATUS_DESCRIPTION` AS `strSTATUS_DESCRIPTION`,`tblpost`.`strPOST_CONTENT` AS `strPOST_CONTENT`,`tblpost`.`dtmPOST_DATE` AS `dtmPOST_DATE`,`tblperson`.`intPERSON_ID` AS `intPERSON_ID`,`tblperson`.`strPERSON_FN` AS `strPERSON_FN`,`tblperson`.`strPERSON_MN` AS `strPERSON_MN`,`tblperson`.`strPERSON_LN` AS `strPERSON_LN`,`tblperson`.`bool_ISBENEFICIARY` AS `bool_ISBENEFICIARY` from (((((`tblaccounts` join `tblpoststatus`) join `tblpost`) join `tblbloodtype`) join `tblbloodcomponent`) join `tblperson`) where ((`tblaccounts`.`intACCOUNT_ID` = `tblpost`.`intACCOUNT_ID`) and (`tblbloodtype`.`intBLOODTYPE_ID` = `tblpost`.`intBLOODTYPE_ID`) and (`tblbloodcomponent`.`intBLOODCOMPONENT_ID` = `tblpost`.`intBLOODCOMPONENT_ID`) and (`tblpoststatus`.`intPOSTSTATUS_ID` = `tblpost`.`intPOSTSTATUS_ID`) and (`tblperson`.`intACCOUNT_ID` = `tblaccounts`.`intACCOUNT_ID`)) ;

-- --------------------------------------------------------

--
-- Structure for view `reserve`
--
DROP TABLE IF EXISTS `reserve`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `reserve`  AS  select `tblreservation`.`intBLOODRESERVE_ID` AS `intBLOODRESERVE_ID`,`tblperson`.`intPERSON_ID` AS `intPERSON_ID`,`tblbloodbank`.`intACCOUNT_ID` AS `intACCOUNT_ID`,`tblperson`.`strPERSON_FN` AS `strPERSON_FN`,`tblperson`.`strPERSON_MN` AS `strPERSON_MN`,`tblperson`.`strPERSON_LN` AS `strPERSON_LN`,`tblbloodbank`.`strBLOODBANK_NAME` AS `strBLOODBANK_NAME`,`tblreservation`.`strQUANTITY` AS `strQUANTITY`,`tblreservation`.`dtmRESERVE_DATE` AS `dtmRESERVE_DATE`,`tblreservation`.`dtmDEADLINE_DATE` AS `dtmDEADLINE_DATE`,`tblbloodtype`.`strBLOODTYPE_DESCRIPTION` AS `strBLOODTYPE_DESCRIPTION`,`tblbloodcomponent`.`strBLOODCOMPONENT_DESCRIPTION` AS `strBLOODCOMPONENT_DESCRIPTION`,`tblperson`.`bool_ISBENEFICIARY` AS `bool_ISBENEFICIARY` from (((((`tblreservation` join `tblbloodbank`) join `tblaccounts`) join `tblperson`) join `tblbloodtype`) join `tblbloodcomponent`) where ((`tblbloodtype`.`intBLOODTYPE_ID` = `tblreservation`.`intBLOODTYPE_ID`) and (`tblbloodcomponent`.`intBLOODCOMPONENT_ID` = `tblreservation`.`intBLOODCOMPONENT_ID`) and (`tblperson`.`intACCOUNT_ID` = `tblreservation`.`intACCOUNT_ID`) and (`tblbloodbank`.`intACCOUNT_ID` = `tblaccounts`.`intACCOUNT_ID`) and (`tblbloodbank`.`intBLOODBANK_ID` = `tblreservation`.`intBLOODBANK_ID`)) ;

-- --------------------------------------------------------

--
-- Structure for view `respondents`
--
DROP TABLE IF EXISTS `respondents`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `respondents`  AS  select `tblpostdonor`.`intPDONOR_ID` AS `intPDONOR_ID`,`tbldonor`.`intPERSON_ID` AS `intPERSON_ID`,`tblpost`.`intACCOUNT_ID` AS `intACCOUNT_ID`,`tblaccounts`.`strACCOUNT_EMAIL` AS `strACCOUNT_EMAIL`,`tblperson`.`strPERSON_FN` AS `strPERSON_FN`,`tblperson`.`strPERSON_MN` AS `strPERSON_MN`,`tblperson`.`strPERSON_LN` AS `strPERSON_LN`,`tblperson`.`dtmPERSON_BDAY` AS `dtmPERSON_BDAY`,`tblbloodtype`.`strBLOODTYPE_DESCRIPTION` AS `strBLOODTYPE_DESCRIPTION` from (((((`tbldonor` join `tblaccounts`) join `tblperson`) join `tblbloodtype`) join `tblpostdonor`) join `tblpost`) where ((`tblbloodtype`.`intBLOODTYPE_ID` = `tbldonor`.`intBLOODTYPE_ID`) and (`tblperson`.`intPERSON_ID` = `tbldonor`.`intPERSON_ID`) and (`tblpostdonor`.`intPOST_ID` = `tblpost`.`intPOST_ID`) and (`tblperson`.`intACCOUNT_ID` = `tblaccounts`.`intACCOUNT_ID`) and (`tblpostdonor`.`intACCOUNT_ID` = `tblperson`.`intACCOUNT_ID`)) ;

-- --------------------------------------------------------

--
-- Structure for view `stocks`
--
DROP TABLE IF EXISTS `stocks`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `stocks`  AS  select `tblaccounts`.`intACCOUNT_ID` AS `intACCOUNT_ID`,`tblbloodbank`.`strBLOODBANK_NAME` AS `strBLOODBANK_NAME`,`tblbloodcomponent`.`strBLOODCOMPONENT_DESCRIPTION` AS `strBLOODCOMPONENT_DESCRIPTION`,`tblbloodstock`.`strBLOODSTOCK_AP` AS `strBLOODSTOCK_AP`,`tblbloodstock`.`strBLOODSTOCK_AN` AS `strBLOODSTOCK_AN`,`tblbloodstock`.`strBLOODSTOCK_BP` AS `strBLOODSTOCK_BP`,`tblbloodstock`.`strBLOODSTOCK_BN` AS `strBLOODSTOCK_BN`,`tblbloodstock`.`strBLOODSTOCK_ABP` AS `strBLOODSTOCK_ABP`,`tblbloodstock`.`strBLOODSTOCK_ABN` AS `strBLOODSTOCK_ABN`,`tblbloodstock`.`strBLOODSTOCK_OP` AS `strBLOODSTOCK_OP`,`tblbloodstock`.`strBLOODSTOCK_ON` AS `strBLOODSTOCK_ON`,`tblbloodstock`.`dblBLOODSTOCK_PRICE` AS `dblBLOODSTOCK_PRICE`,`tblbloodstock`.`intBLOODBANK_ID` AS `intBLOODBANK_ID`,`tblbloodstock`.`intBLOODSTOCK_ID` AS `intBLOODSTOCK_ID` from (((`tblbloodstock` join `tblbloodcomponent`) join `tblbloodbank`) join `tblaccounts`) where ((`tblbloodstock`.`intBLOODCOMPONENT_ID` = `tblbloodcomponent`.`intBLOODCOMPONENT_ID`) and (`tblbloodbank`.`intBLOODBANK_ID` = `tblbloodstock`.`intBLOODBANK_ID`) and (`tblaccounts`.`intACCOUNT_ID` = `tblbloodbank`.`intACCOUNT_ID`)) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tblaccounts`
--
ALTER TABLE `tblaccounts`
  ADD PRIMARY KEY (`intACCOUNT_ID`),
  ADD KEY `intACCOUNTTYPE_ID` (`intACCOUNTTYPE_ID`);

--
-- Indexes for table `tblaccounttype`
--
ALTER TABLE `tblaccounttype`
  ADD PRIMARY KEY (`intACCOUNTTYPE_ID`);

--
-- Indexes for table `tbladmin`
--
ALTER TABLE `tbladmin`
  ADD PRIMARY KEY (`intADMIN_ID`),
  ADD KEY `intACCOUNT_ID` (`intACCOUNT_ID`);

--
-- Indexes for table `tblbeneficiary`
--
ALTER TABLE `tblbeneficiary`
  ADD PRIMARY KEY (`intBENEFICIARY_ID`),
  ADD KEY `tblbeneficiary_ibfk_1` (`intACCOUNT_ID`);

--
-- Indexes for table `tblbloodbank`
--
ALTER TABLE `tblbloodbank`
  ADD PRIMARY KEY (`intBLOODBANK_ID`),
  ADD KEY `intACCOUNT_ID` (`intACCOUNT_ID`),
  ADD KEY `intCATEGORY_ID` (`intCATEGORY_ID`);

--
-- Indexes for table `tblbloodcomponent`
--
ALTER TABLE `tblbloodcomponent`
  ADD PRIMARY KEY (`intBLOODCOMPONENT_ID`);

--
-- Indexes for table `tblbloodstock`
--
ALTER TABLE `tblbloodstock`
  ADD PRIMARY KEY (`intBLOODSTOCK_ID`),
  ADD KEY `intBLOODCOMPONENT_ID` (`intBLOODCOMPONENT_ID`),
  ADD KEY `intBLOODBANK_ID` (`intBLOODBANK_ID`);

--
-- Indexes for table `tblbloodtype`
--
ALTER TABLE `tblbloodtype`
  ADD PRIMARY KEY (`intBLOODTYPE_ID`);

--
-- Indexes for table `tblcategory`
--
ALTER TABLE `tblcategory`
  ADD PRIMARY KEY (`intCATEGORY_ID`);

--
-- Indexes for table `tbldonor`
--
ALTER TABLE `tbldonor`
  ADD PRIMARY KEY (`intDONOR_ID`),
  ADD KEY `intPERSON_ID` (`intPERSON_ID`),
  ADD KEY `intBLOODTYPE_ID` (`intBLOODTYPE_ID`);

--
-- Indexes for table `tblevents`
--
ALTER TABLE `tblevents`
  ADD PRIMARY KEY (`intEVENT_ID`),
  ADD KEY `tblevents_ibfk_1` (`intACCOUNT_ID`);

--
-- Indexes for table `tblperson`
--
ALTER TABLE `tblperson`
  ADD PRIMARY KEY (`intPERSON_ID`),
  ADD KEY `intACCOUNT_ID` (`intACCOUNT_ID`);

--
-- Indexes for table `tblpost`
--
ALTER TABLE `tblpost`
  ADD PRIMARY KEY (`intPOST_ID`),
  ADD KEY `intBLOODCOMPONENT_ID` (`intBLOODCOMPONENT_ID`),
  ADD KEY `intBLOODTYPE_ID` (`intBLOODTYPE_ID`),
  ADD KEY `intPOSTSTATUS_ID` (`intPOSTSTATUS_ID`),
  ADD KEY `tblpost_ibfk_1` (`intACCOUNT_ID`);

--
-- Indexes for table `tblpostdonor`
--
ALTER TABLE `tblpostdonor`
  ADD PRIMARY KEY (`intPDONOR_ID`),
  ADD KEY `intACCOUNT_ID` (`intACCOUNT_ID`),
  ADD KEY `intPOST_ID` (`intPOST_ID`);

--
-- Indexes for table `tblpoststatus`
--
ALTER TABLE `tblpoststatus`
  ADD PRIMARY KEY (`intPOSTSTATUS_ID`);

--
-- Indexes for table `tblreservation`
--
ALTER TABLE `tblreservation`
  ADD PRIMARY KEY (`intBLOODRESERVE_ID`),
  ADD KEY `intBLOODBANK_ID` (`intBLOODBANK_ID`),
  ADD KEY `intBLOODCOMPONENT_ID` (`intBLOODCOMPONENT_ID`),
  ADD KEY `intBLOODTYPE_ID` (`intBLOODTYPE_ID`),
  ADD KEY `tblreservation_ibfk_4` (`intACCOUNT_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tblaccounts`
--
ALTER TABLE `tblaccounts`
  MODIFY `intACCOUNT_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;
--
-- AUTO_INCREMENT for table `tblaccounttype`
--
ALTER TABLE `tblaccounttype`
  MODIFY `intACCOUNTTYPE_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `tbladmin`
--
ALTER TABLE `tbladmin`
  MODIFY `intADMIN_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `tblbeneficiary`
--
ALTER TABLE `tblbeneficiary`
  MODIFY `intBENEFICIARY_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `tblbloodbank`
--
ALTER TABLE `tblbloodbank`
  MODIFY `intBLOODBANK_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `tblbloodcomponent`
--
ALTER TABLE `tblbloodcomponent`
  MODIFY `intBLOODCOMPONENT_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `tblbloodstock`
--
ALTER TABLE `tblbloodstock`
  MODIFY `intBLOODSTOCK_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;
--
-- AUTO_INCREMENT for table `tblbloodtype`
--
ALTER TABLE `tblbloodtype`
  MODIFY `intBLOODTYPE_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `tblcategory`
--
ALTER TABLE `tblcategory`
  MODIFY `intCATEGORY_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `tbldonor`
--
ALTER TABLE `tbldonor`
  MODIFY `intDONOR_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `tblevents`
--
ALTER TABLE `tblevents`
  MODIFY `intEVENT_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `tblperson`
--
ALTER TABLE `tblperson`
  MODIFY `intPERSON_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
--
-- AUTO_INCREMENT for table `tblpost`
--
ALTER TABLE `tblpost`
  MODIFY `intPOST_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `tblpostdonor`
--
ALTER TABLE `tblpostdonor`
  MODIFY `intPDONOR_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `tblpoststatus`
--
ALTER TABLE `tblpoststatus`
  MODIFY `intPOSTSTATUS_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `tblreservation`
--
ALTER TABLE `tblreservation`
  MODIFY `intBLOODRESERVE_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `tblaccounts`
--
ALTER TABLE `tblaccounts`
  ADD CONSTRAINT `tblaccounts_ibfk_1` FOREIGN KEY (`intACCOUNTTYPE_ID`) REFERENCES `tblaccounttype` (`intACCOUNTTYPE_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbladmin`
--
ALTER TABLE `tbladmin`
  ADD CONSTRAINT `tbladmin_ibfk_1` FOREIGN KEY (`intACCOUNT_ID`) REFERENCES `tblaccounts` (`intACCOUNT_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tblbeneficiary`
--
ALTER TABLE `tblbeneficiary`
  ADD CONSTRAINT `tblbeneficiary_ibfk_1` FOREIGN KEY (`intACCOUNT_ID`) REFERENCES `tblaccounts` (`intACCOUNT_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tblbloodbank`
--
ALTER TABLE `tblbloodbank`
  ADD CONSTRAINT `tblbloodbank_ibfk_1` FOREIGN KEY (`intACCOUNT_ID`) REFERENCES `tblaccounts` (`intACCOUNT_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tblbloodbank_ibfk_2` FOREIGN KEY (`intCATEGORY_ID`) REFERENCES `tblcategory` (`intCATEGORY_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tblbloodstock`
--
ALTER TABLE `tblbloodstock`
  ADD CONSTRAINT `tblbloodstock_ibfk_2` FOREIGN KEY (`intBLOODCOMPONENT_ID`) REFERENCES `tblbloodcomponent` (`intBLOODCOMPONENT_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tblbloodstock_ibfk_3` FOREIGN KEY (`intBLOODBANK_ID`) REFERENCES `tblbloodbank` (`intBLOODBANK_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbldonor`
--
ALTER TABLE `tbldonor`
  ADD CONSTRAINT `tbldonor_ibfk_1` FOREIGN KEY (`intPERSON_ID`) REFERENCES `tblperson` (`intPERSON_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbldonor_ibfk_2` FOREIGN KEY (`intBLOODTYPE_ID`) REFERENCES `tblbloodtype` (`intBLOODTYPE_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tblevents`
--
ALTER TABLE `tblevents`
  ADD CONSTRAINT `tblevents_ibfk_1` FOREIGN KEY (`intACCOUNT_ID`) REFERENCES `tblaccounts` (`intACCOUNT_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tblperson`
--
ALTER TABLE `tblperson`
  ADD CONSTRAINT `tblperson_ibfk_2` FOREIGN KEY (`intACCOUNT_ID`) REFERENCES `tblaccounts` (`intACCOUNT_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tblpost`
--
ALTER TABLE `tblpost`
  ADD CONSTRAINT `tblpost_ibfk_1` FOREIGN KEY (`intACCOUNT_ID`) REFERENCES `tblaccounts` (`intACCOUNT_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tblpost_ibfk_2` FOREIGN KEY (`intBLOODCOMPONENT_ID`) REFERENCES `tblbloodcomponent` (`intBLOODCOMPONENT_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tblpost_ibfk_3` FOREIGN KEY (`intBLOODTYPE_ID`) REFERENCES `tblbloodtype` (`intBLOODTYPE_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tblpost_ibfk_4` FOREIGN KEY (`intPOSTSTATUS_ID`) REFERENCES `tblpoststatus` (`intPOSTSTATUS_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tblpostdonor`
--
ALTER TABLE `tblpostdonor`
  ADD CONSTRAINT `tblpostdonor_ibfk_1` FOREIGN KEY (`intACCOUNT_ID`) REFERENCES `tblaccounts` (`intACCOUNT_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tblpostdonor_ibfk_2` FOREIGN KEY (`intPOST_ID`) REFERENCES `tblpost` (`intPOST_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tblreservation`
--
ALTER TABLE `tblreservation`
  ADD CONSTRAINT `tblreservation_ibfk_1` FOREIGN KEY (`intBLOODBANK_ID`) REFERENCES `tblbloodbank` (`intBLOODBANK_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tblreservation_ibfk_2` FOREIGN KEY (`intBLOODCOMPONENT_ID`) REFERENCES `tblbloodcomponent` (`intBLOODCOMPONENT_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tblreservation_ibfk_3` FOREIGN KEY (`intBLOODTYPE_ID`) REFERENCES `tblbloodtype` (`intBLOODTYPE_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tblreservation_ibfk_4` FOREIGN KEY (`intACCOUNT_ID`) REFERENCES `tblaccounts` (`intACCOUNT_ID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
