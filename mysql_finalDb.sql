CREATE DATABASE  IF NOT EXISTS `onlineexaminationsystem` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `onlineexaminationsystem`;
-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: onlineexaminationsystem
-- ------------------------------------------------------
-- Server version	5.7.17-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin` (
  `Adminid` varchar(20) NOT NULL,
  `AdminPassword` varchar(10) DEFAULT NULL,
  `AdminEmaiId` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`Adminid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES ('yashu','passworda','pari@nirmauni.com');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `department` (
  `DeptId` varchar(20) NOT NULL,
  `DeptName` varchar(30) DEFAULT NULL,
  `LoginId` varchar(20) DEFAULT NULL,
  `InstituteId` varchar(20) DEFAULT NULL,
  `DeptEmailId` text,
  PRIMARY KEY (`DeptId`),
  KEY `Department_fk0` (`LoginId`),
  KEY `Department_fk1` (`InstituteId`),
  CONSTRAINT `Department_fk0` FOREIGN KEY (`LoginId`) REFERENCES `login` (`LoginId`),
  CONSTRAINT `Department_fk1` FOREIGN KEY (`InstituteId`) REFERENCES `institute` (`InstituteId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES ('cs50','computerScience','1111','itnu101','cs50@nirmauni.ac.in'),('dep1','developers','1111','ins1','dep1@gmail.com');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam`
--

DROP TABLE IF EXISTS `exam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exam` (
  `ExamId` varchar(20) NOT NULL,
  `ExamName` text,
  `DeptId` varchar(20) DEFAULT NULL,
  `ScheduleId` varchar(20) DEFAULT NULL,
  `ExaminerId` varchar(20) DEFAULT NULL,
  `TotalMarks` varchar(5) DEFAULT NULL,
  `IsItApproved` tinyint(1) DEFAULT NULL,
  `examDate` date DEFAULT NULL,
  `Duration` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`ExamId`),
  KEY `Exam_fk0` (`DeptId`),
  KEY `Exam_fk1` (`ScheduleId`),
  KEY `Exam_fk2` (`ExaminerId`),
  CONSTRAINT `Exam_fk0` FOREIGN KEY (`DeptId`) REFERENCES `department` (`DeptId`),
  CONSTRAINT `Exam_fk1` FOREIGN KEY (`ScheduleId`) REFERENCES `examschedule` (`ScheduleId`),
  CONSTRAINT `Exam_fk2` FOREIGN KEY (`ExaminerId`) REFERENCES `examiner` (`ExaminerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam`
--

LOCK TABLES `exam` WRITE;
/*!40000 ALTER TABLE `exam` DISABLE KEYS */;
INSERT INTO `exam` VALUES ('22111','new exam12','cs50','exa11','10ce33','21',1,'2017-05-03','20'),('34 FEF','43 EFE','cs50','sch100','exRas','22',1,'2017-04-16','11'),('abcdexR00','abcde','cs50','ex22am04','exRas','10',1,'2017-05-03','10'),('aptiexR00','aptitute','cs50','ex22am04','exRas','10',1,'2017-05-03','10'),('dd dd','dd dd','cs50','ex11am04','exRas','23',1,'2014-01-01','22'),('dd dde','dd ddq','cs50','ex11am04','exRas','21',1,'2017-05-03','22'),('em01','demoExam','cs50','exa11','10ce33','12',1,'2017-04-18','15'),('es01','design analysis algo','cs50','sch100','10ce33','18',1,'2017-04-28','15'),('ex007','javva','cs50','exa11','exRas','21',1,'2017-04-16','20'),('ex11111','examtoday','cs50','exa11','exRas','21',1,'2017-04-16','15'),('exam 0404','mid term','cs50','exa11','10ce33','15',1,'2017-05-03','30'),('exam 101','computer networks','cs50','exa11','10ce33','12',1,'2017-05-03','10'),('exam101','exam1','cs50','sch100','exRas','30',1,'2017-04-20',NULL),('exam99','newexam01','cs50','ex11am04','10ce33','21',1,'2017-05-11','20'),('fsdsfsd 222','ddfd sdfsd','cs50','ex11am04','exRas','32',0,'2016-11-30','23'),('fsdsfsd sfsd','ddfd sdfsd','cs50','ex11am04','exRas','32',0,'2016-11-30','23'),('im50','simple','cs50','exa11','s5olm','49',1,'2017-05-02','15'),('om50','computersci','cs50','sch100','s5olm','40',1,'2017-05-03','20'),('yn00','dynamic programming','cs50','ex11am04','10ce33','40',0,'2017-11-01','22'),('ysx1','systemsoft','cs50','ex11am04','exRas','12',1,'2017-04-15','10');
/*!40000 ALTER TABLE `exam` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `examiner`
--

DROP TABLE IF EXISTS `examiner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `examiner` (
  `ExaminerId` varchar(20) NOT NULL,
  `ExaminerName` varchar(50) DEFAULT NULL,
  `LoginId` varchar(20) DEFAULT NULL,
  `ExaminerEmailId` text,
  `DeptId` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ExaminerId`),
  KEY `Examiner_fk0` (`LoginId`),
  KEY `Examiner_fk1` (`DeptId`),
  CONSTRAINT `Examiner_fk0` FOREIGN KEY (`LoginId`) REFERENCES `login` (`LoginId`),
  CONSTRAINT `Examiner_fk1` FOREIGN KEY (`DeptId`) REFERENCES `department` (`DeptId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `examiner`
--

LOCK TABLES `examiner` WRITE;
/*!40000 ALTER TABLE `examiner` DISABLE KEYS */;
INSERT INTO `examiner` VALUES ('10ce33','Bipin','avantka','bipin@gmail.com','cs50'),('exRas','jarna','1122','res@nirmauni.ac.in','cs50'),('s5olm','doluato','dmtd','dmtd@gmail.com','cs50');
/*!40000 ALTER TABLE `examiner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `examinerappointed`
--

DROP TABLE IF EXISTS `examinerappointed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `examinerappointed` (
  `ExamerAppointedId` varchar(20) NOT NULL,
  `ExaminerId` varchar(20) DEFAULT NULL,
  `Examid` varchar(20) DEFAULT NULL,
  `questionBank_ID` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ExamerAppointedId`),
  KEY `ExaminerAppointed_fk2` (`ExaminerId`),
  KEY `ExaminerAppointed_fk3` (`questionBank_ID`),
  KEY `ExaminerAppointed_fk1` (`Examid`),
  CONSTRAINT `ExaminerAppointed_fk1` FOREIGN KEY (`Examid`) REFERENCES `exam` (`ExamId`),
  CONSTRAINT `ExaminerAppointed_fk2` FOREIGN KEY (`ExaminerId`) REFERENCES `examiner` (`ExaminerId`),
  CONSTRAINT `ExaminerAppointed_fk3` FOREIGN KEY (`questionBank_ID`) REFERENCES `questionbank` (`questionBank_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `examinerappointed`
--

LOCK TABLES `examinerappointed` WRITE;
/*!40000 ALTER TABLE `examinerappointed` DISABLE KEYS */;
INSERT INTO `examinerappointed` VALUES ('2211110ce33','10ce33','22111','12eer'),('34 FEFexRas','exRas','34 FEF',NULL),('abcdexR00exRas','exRas','abcdexR00','bcxR10'),('aptiexR00exRas','exRas','aptiexR00','ptxR10'),('dd ddeexRas','exRas','dd dde','404qb10'),('em0110ce33','10ce33','em01','m00c12'),('es0110ce33','10ce33','es01','null'),('ex007exRas','exRas','ex007','qb0071'),('ex11111exRas','exRas','ex11111',NULL),('exam 040410ce33','10ce33','exam 0404','12q01'),('exam 10110ce33','10ce33','exam 101','exnet101'),('exam101exRas','exRas','exam101','qbni'),('exam9910ce33','10ce33','exam99','qb1992'),('im50s5olm','s5olm','im50','m55o49'),('om50s5olm','s5olm','om50','m55o40'),('ysx1exRas','exRas','ysx1','sxxR12');
/*!40000 ALTER TABLE `examinerappointed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `examschedule`
--

DROP TABLE IF EXISTS `examschedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `examschedule` (
  `ScheduleId` varchar(20) NOT NULL,
  `StartTime` time DEFAULT NULL,
  `EndTime` time DEFAULT NULL,
  PRIMARY KEY (`ScheduleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `examschedule`
--

LOCK TABLES `examschedule` WRITE;
/*!40000 ALTER TABLE `examschedule` DISABLE KEYS */;
INSERT INTO `examschedule` VALUES ('ex11am04','13:00:00','18:00:00'),('ex22am04','08:00:00','13:00:00'),('exa11','02:00:00','13:55:00'),('exam101','10:00:00','15:00:00'),('sch100','00:00:00','23:55:00');
/*!40000 ALTER TABLE `examschedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `institute`
--

DROP TABLE IF EXISTS `institute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `institute` (
  `InstituteId` varchar(20) NOT NULL,
  `InstituteName` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`InstituteId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `institute`
--

LOCK TABLES `institute` WRITE;
/*!40000 ALTER TABLE `institute` DISABLE KEYS */;
INSERT INTO `institute` VALUES ('ins1','INTU , NIRMA UNIVERSITY'),('itnu101','Intitute of Technology');
/*!40000 ALTER TABLE `institute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login` (
  `LoginId` varchar(20) NOT NULL,
  `LoginPassword` varchar(10) DEFAULT NULL,
  `IdentifyLogin` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`LoginId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login`
--

LOCK TABLES `login` WRITE;
/*!40000 ALTER TABLE `login` DISABLE KEYS */;
INSERT INTO `login` VALUES ('1111','password1','department'),('1122','password12','examiner'),('5555','password','student'),('avantka','password1','examiner'),('dmtd','password1','examiner'),('nirmal007','passworda','student'),('raju','password','student');
/*!40000 ALTER TABLE `login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `options`
--

DROP TABLE IF EXISTS `options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `options` (
  `optionId` varchar(20) NOT NULL,
  `questionId` varchar(20) DEFAULT NULL,
  `option` text,
  `optionImage` text,
  PRIMARY KEY (`optionId`),
  KEY `Options_fk0` (`questionId`),
  CONSTRAINT `Options_fk0` FOREIGN KEY (`questionId`) REFERENCES `questions` (`questionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `options`
--

LOCK TABLES `options` WRITE;
/*!40000 ALTER TABLE `options` DISABLE KEYS */;
INSERT INTO `options` VALUES ('000c1_A','000c1','p',NULL),('000c1_B','000c1','q',NULL),('000c1_C','000c1','r',NULL),('000c1_D','000c1','z',NULL),('000c2_A','000c2','m',NULL),('000c2_B','000c2','n',NULL),('000c2_C','000c2','o',NULL),('000c2_D','000c2','p',NULL),('000c3_A','000c3','yes ',NULL),('000c3_B','000c3','no ',NULL),('000c3_C','000c3','cannot be determine',NULL),('000c3_D','000c3','both',NULL),('04xR1_A','04xR1','nlogn',NULL),('04xR1_B','04xR1','n2logn',NULL),('04xR1_C','04xR1','n2',NULL),('04xR1_D','04xR1','n3',NULL),('04xR2_A','04xR2','nlogn',NULL),('04xR2_B','04xR2','n2logn',NULL),('04xR2_C','04xR2','n2',NULL),('04xR2_D','04xR2','n3',NULL),('04xR3_A','04xR3','n2',NULL),('04xR3_B','04xR3','n3',NULL),('04xR3_C','04xR3','nlogn',NULL),('04xR3_D','04xR3','logn2',NULL),('2e0c1_A','2e0c1','pranav mukherjee',NULL),('2e0c1_B','2e0c1','narendra modi',NULL),('2e0c1_C','2e0c1','yogi adityanath',NULL),('2e0c1_D','2e0c1','alok mehta',NULL),('2e0c2_A','2e0c2','indorr',NULL),('2e0c2_B','2e0c2','bhopal',NULL),('2e0c2_C','2e0c2','chandigard',NULL),('2e0c2_D','2e0c2','delhi',NULL),('2e0c3_A','2e0c3','andaman and nicobar',NULL),('2e0c3_B','2e0c3','valsad',NULL),('2e0c3_C','2e0c3','ahmedbad',NULL),('2e0c3_D','2e0c3','daman n dui',NULL),('2q0c1_A','2q0c1','uniprogramming system',NULL),('2q0c1_B','2q0c1',' uniprocessing systems',NULL),('2q0c1_C','2q0c1','unitasking systems',NULL),('2q0c1_D','2q0c1','none of the mentioned',NULL),('2q0c2_A','2q0c2','address space and global variable',NULL),('2q0c2_B','2q0c2','open files',NULL),('2q0c2_C','2q0c2','pending alarms, signals and signal handlers',NULL),('2q0c2_D','2q0c2','all of the mentioned',NULL),('2q0c3_A','2q0c3',' dispatcher',NULL),('2q0c3_B','2q0c3',' interrupt',NULL),('2q0c3_C','2q0c3','scheduler',NULL),('2q0c3_D','2q0c3','none of the mentioned',NULL),('2q0c4_A','2q0c4','job queue',NULL),('2q0c4_B','2q0c4','ready queue',NULL),('2q0c4_C','2q0c4','execution queue',NULL),('2q0c4_D','2q0c4',' process queue',NULL),('2q0c5_A','2q0c5',' waiting time',NULL),('2q0c5_B','2q0c5','turnaround time',NULL),('2q0c5_C','2q0c5','response time',NULL),('2q0c5_D','2q0c5',' throughput',NULL),('54321exras_a','54321exras','optionA',NULL),('54321exras_b','54321exras','optionB',NULL),('54321exras_c','54321exras','optionC',NULL),('54321exras_d','54321exras','optionD',NULL),('555o1_A','555o1','2',NULL),('555o1_B','555o1','26',NULL),('555o1_C','555o1','10',NULL),('555o1_D','555o1','32',NULL),('555o2_A','555o2','parsing of the program',NULL),('555o2_B','555o2','the lexical analysis of the program ',NULL),('555o2_C','555o2','the code generation',NULL),('555o2_D','555o2','dataflow analysis',NULL),('555o3_A','555o3','	 increase the chances of reusing the machine-independent code optimizer in other compilers.',NULL),('555o3_B','555o3',' improve the register allocation',NULL),('555o3_C','555o3','improve error recovery and error reporting.',NULL),('555o3_D','555o3','improve the register allocation',NULL),('555o4_A','555o4','2^21',NULL),('555o4_B','555o4','2^14',NULL),('555o4_C','555o4','2^4',NULL),('555o4_D','555o4','2^8',NULL),('555o5_A','555o5','1023',NULL),('555o5_B','555o5','1022',NULL),('555o5_C','555o5','2046',NULL),('555o5_D','555o5','2047',NULL),('555o6_A','555o6','1 only',NULL),('555o6_B','555o6','2 only',NULL),('555o6_C','555o6','both 1 and 2',NULL),('555o6_D','555o6','neither 1 nor 2',NULL),('555o7_A','555o7','Anarkaliâs public key.',NULL),('555o7_B','555o7','salimâs public key.',NULL),('555o7_C','555o7','Anarkaliâs private key.',NULL),('555o7_D','555o7','salimâs privte key.',NULL),('555o8_A','555o8','10',NULL),('555o8_B','555o8','3',NULL),('555o8_C','555o8','1',NULL),('555o8_D','555o8','6',NULL),('b0xR1_A','b0xR1','object oriented language',NULL),('b0xR1_B','b0xR1','programming language',NULL),('b0xR1_C','b0xR1','either a or b',NULL),('b0xR1_D','b0xR1','both',NULL),('b0xR2_A','b0xR2','op a',NULL),('b0xR2_B','b0xR2','op b',NULL),('b0xR2_C','b0xR2','op c',NULL),('b0xR2_D','b0xR2','op d',NULL),('b0xR3_A','b0xR3','op a ans',NULL),('b0xR3_B','b0xR3','op b asn',NULL),('b0xR3_C','b0xR3','sdfsdfsddsf',NULL),('b0xR3_D','b0xR3','sdfsfsdf',NULL),('b10c1_A','b10c1','op a',NULL),('b10c1_B','b10c1','op b',NULL),('b10c1_C','b10c1','op c ',NULL),('b10c1_D','b10c1','opd',NULL),('b10c2_A','b10c2','op acorr',NULL),('b10c2_B','b10c2','abc',NULL),('b10c2_C','b10c2','xyz',NULL),('b10c2_D','b10c2','pqe',NULL),('b10c3_A','b10c3','0 ',NULL),('b10c3_B','b10c3','1 ',NULL),('b10c3_C','b10c3','2',NULL),('b10c3_D','b10c3','3',NULL),('bnxR1_A','bnxR1','1',NULL),('bnxR1_B','bnxR1','2',NULL),('bnxR1_C','bnxR1','3',NULL),('bnxR1_D','bnxR1','all',NULL),('bnxR2_A','bnxR2','5',NULL),('bnxR2_B','bnxR2','1',NULL),('bnxR2_C','bnxR2','2',NULL),('bnxR2_D','bnxR2','none',NULL),('cxxR1_A','cxxR1','1',NULL),('cxxR1_B','cxxR1','2',NULL),('cxxR1_C','cxxR1','3',NULL),('cxxR1_D','cxxR1','4',NULL),('cxxR2_A','cxxR2','6',NULL),('cxxR2_B','cxxR2','7',NULL),('cxxR2_C','cxxR2','1',NULL),('cxxR2_D','cxxR2','2',NULL),('txxR1_A','txxR1','2',NULL),('txxR1_B','txxR1','3',NULL),('txxR1_C','txxR1','4',NULL),('txxR1_D','txxR1','5',NULL),('txxR2_A','txxR2','343',NULL),('txxR2_B','txxR2','269',NULL),('txxR2_C','txxR2','300',NULL),('txxR2_D','txxR2','400',NULL),('txxR3_A','txxR3','2',NULL),('txxR3_B','txxR3','3',NULL),('txxR3_C','txxR3','5',NULL),('txxR3_D','txxR3','1',NULL),('txxR4_A','txxR4','9',NULL),('txxR4_B','txxR4','3',NULL),('txxR4_C','txxR4','8',NULL),('txxR4_D','txxR4','1',NULL),('txxR5_A','txxR5','hate',NULL),('txxR5_B','txxR5','passion',NULL),('txxR5_C','txxR5','fear',NULL),('txxR5_D','txxR5','happy',NULL),('ul0c1_A','ul0c1','8',NULL),('ul0c1_B','ul0c1','2',NULL),('ul0c1_C','ul0c1','1',NULL),('ul0c1_D','ul0c1','6',NULL),('ul0c2_A','ul0c2','prims',NULL),('ul0c2_B','ul0c2','dijsktra',NULL),('ul0c2_C','ul0c2','knapsak',NULL),('ul0c2_D','ul0c2','xyz',NULL),('xn0c1_A','xn0c1','5',NULL),('xn0c1_B','xn0c1','7',NULL),('xn0c1_C','xn0c1','6',NULL),('xn0c1_D','xn0c1','none of the mentioned',NULL),('xn0c2_A','xn0c2','bits',NULL),('xn0c2_B','xn0c2','frame',NULL),('xn0c2_C','xn0c2','packets',NULL),('xn0c2_D','xn0c2','none',NULL),('xn0c3_A','xn0c3','routing',NULL),('xn0c3_B','xn0c3','inter-networing',NULL),('xn0c3_C','xn0c3','congestion control',NULL),('xn0c3_D','xn0c3','none of the mentioned',NULL),('xn0c4_A','xn0c4','bit-by-bit delivery',NULL),('xn0c4_B','xn0c4','process to process delivery',NULL),('xn0c4_C','xn0c4','application to application delivery',NULL),('xn0c4_D','xn0c4','none ',NULL),('xn0c5_A','xn0c5','coaxial cable',NULL),('xn0c5_B','xn0c5','twisted pair cable',NULL),('xn0c5_C','xn0c5','optical fibre',NULL),('xn0c5_D','xn0c5','electrial cable',NULL),('xn0c6_A','xn0c6','application layer',NULL),('xn0c6_B','xn0c6','presentation layer',NULL),('xn0c6_C','xn0c6','session layer',NULL),('xn0c6_D','xn0c6','both b and c',NULL),('xxxR1_A','xxxR1','symbol table',NULL),('xxxR1_B','xxxR1','ic',NULL),('xxxR1_C','xxxR1','ir',NULL),('xxxR1_D','xxxR1','pool table',NULL),('xxxR2_A','xxxR2','symbol table',NULL),('xxxR2_B','xxxR2','ic',NULL),('xxxR2_C','xxxR2','ir',NULL),('xxxR2_D','xxxR2','literal table',NULL);
/*!40000 ALTER TABLE `options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questionbank`
--

DROP TABLE IF EXISTS `questionbank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `questionbank` (
  `questionBank_ID` varchar(20) NOT NULL,
  `TotalMarks` varchar(5) DEFAULT NULL,
  `ExaminerId` varchar(20) DEFAULT NULL,
  `TotalQuestions` varchar(5) DEFAULT NULL,
  `EachQuestionMarks` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`questionBank_ID`),
  KEY `QuestionBank_fk1` (`ExaminerId`),
  CONSTRAINT `QuestionBank_fk1` FOREIGN KEY (`ExaminerId`) REFERENCES `examiner` (`ExaminerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questionbank`
--

LOCK TABLES `questionbank` WRITE;
/*!40000 ALTER TABLE `questionbank` DISABLE KEYS */;
INSERT INTO `questionbank` VALUES ('12eer','21','10ce33','3','7'),('12q01','15','10ce33','5','3'),('404qb10','21','exRas','3','7'),('5431','50','exRas','10','5'),('bcxR10','10','exRas','2','5'),('exnet101','12','10ce33','6','2'),('m00c12','12','10ce33','3','4'),('m55o40','40','s5olm','8','5'),('m55o49','49','s5olm','7','7'),('null','18','10ce33','2','9'),('ptxR10','10','exRas','5','2'),('qb0071','21','exRas','3','7'),('qb1992','21','10ce33','3','7'),('qbni','30','exRas','2','15'),('sxxR12','12','exRas','2','6');
/*!40000 ALTER TABLE `questionbank` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questions`
--

DROP TABLE IF EXISTS `questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `questions` (
  `questionId` varchar(20) NOT NULL,
  `questionBank_Id` varchar(20) DEFAULT NULL,
  `question` text,
  `questionImage` text,
  `correctOptionId` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`questionId`),
  KEY `Questions_fk0` (`questionBank_Id`),
  KEY `Questions_fk1` (`correctOptionId`),
  CONSTRAINT `Questions_fk0` FOREIGN KEY (`questionBank_Id`) REFERENCES `questionbank` (`questionBank_ID`),
  CONSTRAINT `Questions_fk1` FOREIGN KEY (`correctOptionId`) REFERENCES `options` (`optionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions`
--

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
INSERT INTO `questions` VALUES ('000c1','m00c12','what is xyz?',NULL,'000c1_C'),('000c2','m00c12','why you are this?',NULL,'000c2_A'),('000c3','m00c12','are this question correct ?',NULL,'000c3_D'),('04xR1','404qb10','time complexity of heap sort',NULL,'04xR1_A'),('04xR2','404qb10','time complexity of quick',NULL,'04xR2_C'),('04xR3','404qb10','space complexity of quick sort',NULL,'04xR3_C'),('2e0c1','12eer','CM of UP ?',NULL,'2e0c1_C'),('2e0c2','12eer','what is capital of MP ?',NULL,'2e0c2_B'),('2e0c3','12eer','which one of these is union territory ?',NULL,'2e0c3_D'),('2q0c1','12q01',' The systems which allows only one process execution at a time, are called',NULL,'2q0c1_A'),('2q0c2','12q01','In operating system, each process has its own',NULL,'2q0c2_D'),('2q0c3','12q01','Which module gives control of the CPU to the process selected by the short-term scheduler?',NULL,'2q0c3_A'),('2q0c4','12q01','The processes that are residing in main memory and are ready and waiting to execute are kept on a list called',NULL,'2q0c4_B'),('2q0c5','12q01','The interval from the time of submission of a process to the time of completion is termed as',NULL,'2q0c5_B'),('54321exras','5431','question is what?',NULL,'54321exras_b'),('555o1','m55o40','The number of tokens in the following C statement is \r\nprintf(\"i = %d, &i = %x\", i, &i);\r\n',NULL,'555o1_C'),('555o2','m55o40','In a compiler, keywords of a language are recognized during',NULL,'555o2_B'),('555o3','m55o40','One of the purposes of using intermediate code in compilers is to',NULL,'555o3_A'),('555o4','m55o40','In the IPv4 addressing format, the number of networks allowed under Class C addresses is\r\n',NULL,'555o4_A'),('555o5','m55o40','If a class B network on the Internet has a subnet mask of 255.255.248.0, what is the maximum number of hosts per subnet?',NULL,'555o5_C'),('555o6','m55o40','Which of the following concurrency control protocols ensure both conflict serialzability and freedom from deadlock? I. 2-phase locking II. Time-stamp ordering',NULL,'555o6_B'),('555o7','m55o40','Anarkali digitally signs a message and sends it to Salim. Verification of the signature by Salim requires ',NULL,'555o7_A'),('555o8','m55o40','The minimum positive integer p such that 3p modulo 17 = 1 is',NULL,'555o8_A'),('b0xR1','qb0071','what is java',NULL,'b0xR1_D'),('b0xR2','qb0071','question 2 ?',NULL,'b0xR2_B'),('b0xR3','qb0071','question no 3 ?',NULL,'b0xR3_B'),('b10c1','qb1992','questio 1',NULL,'b10c1_B'),('b10c2','qb1992','question is ?',NULL,'b10c2_D'),('b10c3','qb1992','what is x',NULL,'b10c3_A'),('bnxR1','qbni','what is 10/10',NULL,'bnxR1_A'),('bnxR2','qbni','what is 10/2',NULL,'bnxR2_A'),('cxxR1','bcxR10','what is x+7',NULL,'cxxR1_C'),('cxxR2','bcxR10','what is 10-3',NULL,'cxxR2_A'),('txxR1','ptxR10','if A worker do job in 5 days and B does in 10 days then Both does in',NULL,'txxR1_B'),('txxR2','ptxR10','what is cube of 7',NULL,'txxR2_A'),('txxR3','ptxR10','what is unit of 3^24',NULL,'txxR3_D'),('txxR4','ptxR10','what is 10-2',NULL,'txxR4_C'),('txxR5','ptxR10','what is synonyms of ABHOR',NULL,'txxR5_A'),('ul0c1','null','what is 10-2?',NULL,'ul0c1_A'),('ul0c2','null','which is for shortest path ?',NULL,'ul0c2_B'),('xn0c1','exnet101','The number of layers in Internet protocol stack',NULL,'xn0c1_A'),('xn0c2','exnet101','The network layer concerns with',NULL,'xn0c2_A'),('xn0c3','exnet101','Which one of the following is not a function of network layer?',NULL,'xn0c3_D'),('xn0c4','exnet101','The physical layer concerns with',NULL,'xn0c4_C'),('xn0c5','exnet101','Which transmission media has the highest transmission speed in a network?\r\n',NULL,'xn0c5_C'),('xn0c6','exnet101','This layer in an addition to OSI model',NULL,'xn0c6_D'),('xxxR1','sxxR12','what is the correct input fro assembler pass 1',NULL,'xxxR1_D'),('xxxR2','sxxR12','what is not output of assembler pass 2',NULL,'xxxR2_D');
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student` (
  `StudentRollno` varchar(10) NOT NULL,
  `StudentName` varchar(40) DEFAULT NULL,
  `DeptId` varchar(20) DEFAULT NULL,
  `LoginId` varchar(20) DEFAULT NULL,
  `StudentEmailId` text,
  `TotalExamEnrolled` int(10) DEFAULT NULL,
  `StudentDOB` date DEFAULT NULL,
  `StudentPicture` text,
  `StudentAddress` text,
  `StudentMobileNo` varchar(15) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`StudentRollno`),
  KEY `Student_fk0` (`DeptId`),
  KEY `Student_fk1` (`LoginId`),
  CONSTRAINT `Student_fk0` FOREIGN KEY (`DeptId`) REFERENCES `department` (`DeptId`),
  CONSTRAINT `Student_fk1` FOREIGN KEY (`LoginId`) REFERENCES `login` (`LoginId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES ('15mca034','yash','cs50','5555','pari@gmail.com',0,'1995-01-07','','h3 hostel','10','Male'),('15mca037','rajula','cs50','raju','raju@gmail.com',0,'1994-05-04','','rajula city','89898989','Male'),('15mee12','fdgdfg','dep1','nirmal007','nirma@nirmauni.ac.in',0,'2004-01-01','',' address ','1767676766','Male');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `studentexamappearance`
--

DROP TABLE IF EXISTS `studentexamappearance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `studentexamappearance` (
  `StudentEnrollId` varchar(20) NOT NULL,
  `studentstarttime` time DEFAULT NULL,
  `studentfinishtime` time DEFAULT NULL,
  `ExamSubmission` tinyint(1) DEFAULT NULL,
  `lastAttempTime` time DEFAULT NULL,
  PRIMARY KEY (`StudentEnrollId`),
  CONSTRAINT `StudentExamAppearance_fk0` FOREIGN KEY (`StudentEnrollId`) REFERENCES `studentexamenrollment` (`StudentEnrollId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `studentexamappearance`
--

LOCK TABLES `studentexamappearance` WRITE;
/*!40000 ALTER TABLE `studentexamappearance` DISABLE KEYS */;
INSERT INTO `studentexamappearance` VALUES ('15mca03422111','02:49:37','02:53:44',1,'02:49:37'),('15mca034abcdexR00','10:25:29','10:25:53',1,'10:25:29'),('15mca034es01','21:21:52','21:22:13',1,'21:21:52'),('15mca034om50','23:11:12','23:15:43',1,'23:11:12'),('15mca037om50','09:40:56','09:42:16',1,'09:40:56'),('15mee12es01','23:13:30','23:15:15',1,'23:13:30'),('15mee12om50','23:14:06','23:14:44',1,'23:14:06');
/*!40000 ALTER TABLE `studentexamappearance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `studentexamenrollment`
--

DROP TABLE IF EXISTS `studentexamenrollment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `studentexamenrollment` (
  `StudentEnrollId` varchar(20) NOT NULL,
  `StudentRollno` varchar(20) DEFAULT NULL,
  `ExamId` varchar(20) DEFAULT NULL,
  `ExamEnrolledDate` date DEFAULT NULL,
  PRIMARY KEY (`StudentEnrollId`),
  KEY `StudentExamEnrollment_fk0` (`StudentRollno`),
  KEY `StudentExamEnrollment_fk1` (`ExamId`),
  CONSTRAINT `StudentExamEnrollment_fk0` FOREIGN KEY (`StudentRollno`) REFERENCES `student` (`StudentRollno`),
  CONSTRAINT `StudentExamEnrollment_fk1` FOREIGN KEY (`ExamId`) REFERENCES `exam` (`ExamId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `studentexamenrollment`
--

LOCK TABLES `studentexamenrollment` WRITE;
/*!40000 ALTER TABLE `studentexamenrollment` DISABLE KEYS */;
INSERT INTO `studentexamenrollment` VALUES ('15mca03422111','15mca034','22111','2017-05-03'),('15mca034abcdexR00','15mca034','abcdexR00','2017-05-03'),('15mca034aptiexR00','15mca034','aptiexR00','2017-05-03'),('15mca034es01','15mca034','es01','2017-04-28'),('15mca034exam99','15mca034','exam99','2017-05-02'),('15mca034om50','15mca034','om50','2017-05-02'),('15mca037om50','15mca037','om50','2017-05-03'),('15mee12es01','15mee12','es01','2017-05-02'),('15mee12om50','15mee12','om50','2017-05-02'),('15mee12yn00','15mee12','yn00','2017-05-03');
/*!40000 ALTER TABLE `studentexamenrollment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `studentmarksheet`
--

DROP TABLE IF EXISTS `studentmarksheet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `studentmarksheet` (
  `StudentEnrollId` varchar(20) NOT NULL,
  `TotalQuestions` varchar(4) DEFAULT NULL,
  `TotalCorrectAttempt` varchar(4) DEFAULT NULL,
  `ObtainedMarks` varchar(4) DEFAULT NULL,
  `TotalMarks` varchar(4) DEFAULT NULL,
  `Percentage` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`StudentEnrollId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `studentmarksheet`
--

LOCK TABLES `studentmarksheet` WRITE;
/*!40000 ALTER TABLE `studentmarksheet` DISABLE KEYS */;
INSERT INTO `studentmarksheet` VALUES ('15mca03422111','3.0','3.0','21.0','21.0',''),('15mca034abcdexR00','2.0','1.0','5.0','10.0',''),('15mca034es01','2.0','2.0','18.0','18.0',''),('15mca034om50','8.0','2.0','10.0','40.0',''),('15mca037om50','8.0','3.0','15.0','40.0',''),('15mee12es01','2.0','2.0','18.0','18.0',''),('15mee12om50','8.0','4.0','20.0','40.0','');
/*!40000 ALTER TABLE `studentmarksheet` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-05-03 20:44:31
