-- phpMyAdmin SQL Dump
-- version 4.0.4.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Aug 29, 2015 at 10:25 AM
-- Server version: 5.6.11
-- PHP Version: 5.5.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `recsys`
--
CREATE DATABASE IF NOT EXISTS `recsys` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `recsys`;

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

CREATE TABLE IF NOT EXISTS `account` (
  `AccountId` int(11) NOT NULL AUTO_INCREMENT,
  `UserName` varchar(100) DEFAULT NULL,
  `Email` text,
  `Password` text,
  `AccountType` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`AccountId`),
  UNIQUE KEY `UserName` (`UserName`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`AccountId`, `UserName`, `Email`, `Password`, `AccountType`) VALUES
(1, 'bot', 'bot@bot.com', 'bot', 'bot');

-- --------------------------------------------------------

--
-- Table structure for table `career_objective`
--

CREATE TABLE IF NOT EXISTS `career_objective` (
  `ObjectiveId` int(11) NOT NULL AUTO_INCREMENT,
  `ResumeId` int(11) DEFAULT NULL,
  `Position` text,
  `DesireSalary` int(11) DEFAULT NULL,
  `RecentSalary` int(11) DEFAULT NULL,
  `DesireLocation` text,
  `WillingToRelocate` blob,
  `WillingToTravel` blob,
  `CareerObjective` text,
  PRIMARY KEY (`ObjectiveId`),
  KEY `t1` (`ResumeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE IF NOT EXISTS `category` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Description` text NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=52 ;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`Id`, `Description`) VALUES
(1, ' ﻿Xây dựng\r\n'),
(2, ' Kiến trúc/Thiết kế nội thất\r\n'),
(3, ' Bất động sản\r\n'),
(4, ' Viễn Thông\r\n'),
(5, ' Truyền hình/Truyền thông/Báo chí\r\n'),
(6, ' Mỹ thuật/Thiết kế\r\n'),
(7, ' Quảng cáo/Khuyến mãi/Đối ngoại\r\n'),
(8, ' Internet/Online Media\r\n'),
(9, ' Ngân hàng\r\n'),
(10, ' Kiểm toán\r\n'),
(11, ' Tài chính/Đầu tư\r\n'),
(12, ' Chứng khoán\r\n'),
(13, ' Bảo hiểm\r\n'),
(14, ' Hàng không/Du lịch/Khách sạn\r\n'),
(15, ' Thực phẩm & Đồ uống\r\n'),
(16, ' Điện/Điện tử\r\n'),
(17, ' Cơ khí\r\n'),
(18, ' Hóa học/Hóa sinh\r\n'),
(19, ' Môi trường/Xử lý chất thải\r\n'),
(20, ' Dầu khí\r\n'),
(21, ' Dệt may/Da giày\r\n'),
(22, ' Dược Phẩm/Công nghệ sinh học\r\n'),
(23, ' Ô tô\r\n'),
(24, ' Nông nghiệp/Lâm nghiệp\r\n'),
(25, ' Sản phẩm công nghiệp\r\n'),
(26, ' Công nghệ cao\r\n'),
(27, ' Bán lẻ/Bán sỉ\r\n'),
(28, ' Thời trang/Lifestyle\r\n'),
(29, ' Hàng cao cấp\r\n'),
(30, ' Phi chính phủ/Phi lợi nhuận\r\n'),
(31, ' Giáo dục/Đào tạo\r\n'),
(32, ' Y tế/Chăm sóc sức khỏe\r\n'),
(33, ' Tư vấn\r\n'),
(34, ' Vận chuyển/Giao nhận\r\n'),
(35, ' Kho vận\r\n'),
(36, ' Marketing\r\n'),
(37, ' Bán hàng\r\n'),
(38, ' Dịch vụ khách hàng\r\n'),
(39, ' Bán hàng kỹ thuật\r\n'),
(40, ' Hành chánh/Thư ký\r\n'),
(41, ' Kế toán\r\n'),
(42, ' Nhân sự\r\n'),
(43, ' Biên phiên dịch\r\n'),
(44, ' Pháp lý\r\n'),
(45, ' IT-Phần cứng/Mạng\r\n'),
(46, ' IT - Phần mềm\r\n'),
(47, ' Xuất nhập khẩu\r\n'),
(48, ' QA/QC\r\n'),
(49, ' Sản Xuất\r\n'),
(50, ' Vật Tư/Cung vận\r\n'),
(51, ' Hoạch định/Dự án');

-- --------------------------------------------------------

--
-- Table structure for table `company_sumary`
--

CREATE TABLE IF NOT EXISTS `company_sumary` (
  `CompanyId` int(11) NOT NULL AUTO_INCREMENT,
  `AccountId` int(11) DEFAULT NULL,
  `CompanyName` text,
  `CompanyDescription` text,
  `Email` text,
  `Phone` char(15) DEFAULT NULL,
  `Fax` char(20) DEFAULT NULL,
  `Address` text,
  `Website` char(50) DEFAULT NULL,
  `Logo` text,
  PRIMARY KEY (`CompanyId`),
  KEY `t2` (`AccountId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `degree`
--

CREATE TABLE IF NOT EXISTS `degree` (
  `DegreeId` int(11) NOT NULL AUTO_INCREMENT,
  `ResumeId` int(11) NOT NULL,
  `Level` text,
  `School` text,
  `Expertise` text,
  `SchoolYear` text,
  PRIMARY KEY (`DegreeId`),
  KEY `t3` (`ResumeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `experience`
--

CREATE TABLE IF NOT EXISTS `experience` (
  `ExperienceId` int(11) NOT NULL AUTO_INCREMENT,
  `ResumeId` int(11) NOT NULL,
  `CompanyName` text,
  `Position` text,
  `Description` text,
  `Period` text,
  PRIMARY KEY (`ExperienceId`),
  KEY `t4` (`ResumeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `job`
--

CREATE TABLE IF NOT EXISTS `job` (
  `JobId` int(11) NOT NULL AUTO_INCREMENT,
  `AccountId` int(11) NOT NULL,
  `JobName` text,
  `Location` text,
  `Salary` text,
  `Description` text,
  `Company` text,
  `Tags` text,
  `Requirement` text,
  `Benifit` text,
  `Expired` text,
  `Source` text,
  `Category` int(11) NOT NULL,
  PRIMARY KEY (`JobId`),
  KEY `t5` (`AccountId`),
  KEY `Category` (`Category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `job_log`
--

CREATE TABLE IF NOT EXISTS `job_log` (
  `EvenTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `PageUrl` text NOT NULL,
  `Error` text NOT NULL,
  `Checked` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`EvenTime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `job_xpath`
--

CREATE TABLE IF NOT EXISTS `job_xpath` (
  `home_url` varchar(200) NOT NULL,
  `base_url` text,
  `xpath_code` text,
  `job_xpath` text,
  `company_xpath` text,
  `location_xpath` text,
  `description_xpath` text,
  `salary_xpath` text,
  `requirement_xpath` text,
  `benifit_xpath` text,
  `expired_xpath` text,
  `tags_xpath` text,
  `login_url` text NOT NULL,
  `login_data` text NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` int(11) NOT NULL,
  PRIMARY KEY (`home_url`),
  UNIQUE KEY `id` (`id`),
  KEY `category` (`category`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=52 ;

--
-- Dumping data for table `job_xpath`
--

INSERT INTO `job_xpath` (`home_url`, `base_url`, `xpath_code`, `job_xpath`, `company_xpath`, `location_xpath`, `description_xpath`, `salary_xpath`, `requirement_xpath`, `benifit_xpath`, `expired_xpath`, `tags_xpath`, `login_url`, `login_data`, `id`, `category`) VALUES
('http://www.vietnamworks.com/accounting-finance-jobs-i1-en/page-', '', '//*[@id="job-list"]/div[1]/table/tbody/tr/td/div/div[1]/div[2]/div[1]/a', '//*[@id="section-job-detail"]/div[3]/div/div[2]/div[2]/div[1]/div[1]/div/div/h1', '//*[@id="section-job-detail"]/div[3]/div/div[2]/div[2]/div[1]/div[1]/div/div/span[1]/strong', '//*[@id="section-job-detail"]/div[3]/div/div[2]/div[2]/div[1]/div[1]/div/div/span[2]', '//*[@id="job-description"]', '//*[@id="section-job-detail"]/div[3]/div/div[2]/div[2]/div[2]/div[1]/div/span', '//*[@id="job-requirement"]/div/div', '//*[@id="what-we-offer"]/div/div[2]/div', '', '//*[@id="job-detail"]/div[1]/div', 'http://www.vietnamworks.com/login/?redirectURL=http%3A%2F%2Fwww.vietnamworks.com%2Fit-hardware-networking-it-software-jobs-i55%2C35-en%2F', 'form%5Busername%5D=anhtuyenpro94%40gmail.com&form%5Bpassword%5D=anhtuyenpro_at&form%5Bsign_in%5D=', 5, 10),
('http://www.vietnamworks.com/advertising-promotion-pr-jobs-i3-en/page-', '', '//*[@id="job-list"]/div[1]/table/tbody/tr/td/div/div[1]/div[2]/div[1]/a', '//*[@id="section-job-detail"]/div[3]/div/div[2]/div[2]/div[1]/div[1]/div/div/h1', '//*[@id="section-job-detail"]/div[3]/div/div[2]/div[2]/div[1]/div[1]/div/div/span[1]/strong', '//*[@id="section-job-detail"]/div[3]/div/div[2]/div[2]/div[1]/div[1]/div/div/span[2]', '//*[@id="job-description"]', '//*[@id="section-job-detail"]/div[3]/div/div[2]/div[2]/div[2]/div[1]/div/span', '//*[@id="job-requirement"]/div/div', '//*[@id="what-we-offer"]/div/div[2]/div', '', '//*[@id="job-detail"]/div[1]/div', 'http://www.vietnamworks.com/login/?redirectURL=http%3A%2F%2Fwww.vietnamworks.com%2Fit-hardware-networking-it-software-jobs-i55%2C35-en%2F', 'form%5Busername%5D=anhtuyenpro94%40gmail.com&form%5Bpassword%5D=anhtuyenpro_at&form%5Bsign_in%5D=', 6, 7),
('http://www.vietnamworks.com/agriculture-forestry-jobs-i4-en/page-', '', '//*[@id="job-list"]/div[1]/table/tbody/tr/td/div/div[1]/div[2]/div[1]/a', '//*[@id="section-job-detail"]/div[3]/div/div[2]/div[2]/div[1]/div[1]/div/div/h1', '//*[@id="section-job-detail"]/div[3]/div/div[2]/div[2]/div[1]/div[1]/div/div/span[1]/strong', '//*[@id="section-job-detail"]/div[3]/div/div[2]/div[2]/div[1]/div[1]/div/div/span[2]', '//*[@id="job-description"]', '//*[@id="section-job-detail"]/div[3]/div/div[2]/div[2]/div[2]/div[1]/div/span', '//*[@id="job-requirement"]/div/div', '//*[@id="what-we-offer"]/div/div[2]/div', '', '//*[@id="job-detail"]/div[1]/div', 'http://www.vietnamworks.com/login/?redirectURL=http%3A%2F%2Fwww.vietnamworks.com%2Fit-hardware-networking-it-software-jobs-i55%2C35-en%2F', 'form%5Busername%5D=anhtuyenpro94%40gmail.com&form%5Bpassword%5D=anhtuyenpro_at&form%5Bsign_in%5D=', 8, 24),
('http://www.vietnamworks.com/airlines-tourism-hotel-jobs-i37-en/page-', '', '//*[@id="job-list"]/div[1]/table/tbody/tr/td/div/div[1]/div[2]/div[1]/a', '//*[@id="section-job-detail"]/div[3]/div/div[2]/div[2]/div[1]/div[1]/div/div/h1', '//*[@id="section-job-detail"]/div[3]/div/div[2]/div[2]/div[1]/div[1]/div/div/span[1]/strong', '//*[@id="section-job-detail"]/div[3]/div/div[2]/div[2]/div[1]/div[1]/div/div/span[2]', '//*[@id="job-description"]', '//*[@id="section-job-detail"]/div[3]/div/div[2]/div[2]/div[2]/div[1]/div/span', '//*[@id="job-requirement"]/div/div', '//*[@id="what-we-offer"]/div/div[2]/div', '', '//*[@id="job-detail"]/div[1]/div', 'http://www.vietnamworks.com/login/?redirectURL=http%3A%2F%2Fwww.vietnamworks.com%2Fit-hardware-networking-it-software-jobs-i55%2C35-en%2F', 'form%5Busername%5D=anhtuyenpro94%40gmail.com&form%5Bpassword%5D=anhtuyenpro_at&form%5Bsign_in%5D=', 24, 14),
('http://www.vietnamworks.com/architecture-interior-design-jobs-i5-en/page-', '', '//*[@id="job-list"]/div[1]/table/tbody/tr/td/div/div[1]/div[2]/div[1]/a', '//*[@id="section-job-detail"]/div[3]/div/div[2]/div[2]/div[1]/div[1]/div/div/h1', '//*[@id="section-job-detail"]/div[3]/div/div[2]/div[2]/div[1]/div[1]/div/div/span[1]/strong', '//*[@id="section-job-detail"]/div[3]/div/div[2]/div[2]/div[1]/div[1]/div/div/span[2]', '//*[@id="job-description"]', '//*[@id="section-job-detail"]/div[3]/div/div[2]/div[2]/div[2]/div[1]/div/span', '//*[@id="job-requirement"]/div/div', '//*[@id="what-we-offer"]/div/div[2]/div', '', '//*[@id="job-detail"]/div[1]/div', 'http://www.vietnamworks.com/login/?redirectURL=http%3A%2F%2Fwww.vietnamworks.com%2Fit-hardware-networking-it-software-jobs-i55%2C35-en%2F', 'form%5Busername%5D=anhtuyenpro94%40gmail.com&form%5Bpassword%5D=anhtuyenpro_at&form%5Bsign_in%5D=', 11, 2),
('http://www.vietnamworks.com/arts-design-jobs-i10-en/page-', '', '//*[@id="job-list"]/div[1]/table/tbody/tr/td/div/div[1]/div[2]/div[1]/a', '//*[@id="section-job-detail"]/div[3]/div/div[2]/div[2]/div[1]/div[1]/div/div/h1', '//*[@id="section-job-detail"]/div[3]/div/div[2]/div[2]/div[1]/div[1]/div/div/span[1]/strong', '//*[@id="section-job-detail"]/div[3]/div/div[2]/div[2]/div[1]/div[1]/div/div/span[2]', '//*[@id="job-description"]', '//*[@id="section-job-detail"]/div[3]/div/div[2]/div[2]/div[2]/div[1]/div/span', '//*[@id="job-requirement"]/div/div', '//*[@id="what-we-offer"]/div/div[2]/div', '', '//*[@id="job-detail"]/div[1]/div', 'http://www.vietnamworks.com/login/?redirectURL=http%3A%2F%2Fwww.vietnamworks.com%2Fit-hardware-networking-it-software-jobs-i55%2C35-en%2F', 'form%5Busername%5D=anhtuyenpro94%40gmail.com&form%5Bpassword%5D=anhtuyenpro_at&form%5Bsign_in%5D=', 12, 6),
('http://www.vietnamworks.com/banking-jobs-i42-en/page-', '', '//*[@id="job-list"]/div[1]/table/tbody/tr/td/div/div[1]/div[2]/div[1]/a', '//*[@id="section-job-detail"]/div[3]/div/div[2]/div[2]/div[1]/div[1]/div/div/h1', '//*[@id="section-job-detail"]/div[3]/div/div[2]/div[2]/div[1]/div[1]/div/div/span[1]/strong', '//*[@id="section-job-detail"]/div[3]/div/div[2]/div[2]/div[1]/div[1]/div/div/span[2]', '//*[@id="job-description"]', '//*[@id="section-job-detail"]/div[3]/div/div[2]/div[2]/div[2]/div[1]/div/span', '//*[@id="job-requirement"]/div/div', '//*[@id="what-we-offer"]/div/div[2]/div', '', '//*[@id="job-detail"]/div[1]/div', 'http://www.vietnamworks.com/login/?redirectURL=http%3A%2F%2Fwww.vietnamworks.com%2Fit-hardware-networking-it-software-jobs-i55%2C35-en%2F', 'form%5Busername%5D=anhtuyenpro94%40gmail.com&form%5Bpassword%5D=anhtuyenpro_at&form%5Bsign_in%5D=', 9, 9),
('http://www.vietnamworks.com/chemical-biochemical-jobs-i43-en/page-', '', '//*[@id="job-list"]/div[1]/table/tbody/tr/td/div/div[1]/div[2]/div[1]/a', '//*[@id="section-job-detail"]/div[3]/div/div[2]/div[2]/div[1]/div[1]/div/div/h1', '//*[@id="section-job-detail"]/div[3]/div/div[2]/div[2]/div[1]/div[1]/div/div/span[1]/strong', '//*[@id="section-job-detail"]/div[3]/div/div[2]/div[2]/div[1]/div[1]/div/div/span[2]', '//*[@id="job-description"]', '//*[@id="section-job-detail"]/div[3]/div/div[2]/div[2]/div[2]/div[1]/div/span', '//*[@id="job-requirement"]/div/div', '//*[@id="what-we-offer"]/div/div[2]/div', '', '//*[@id="job-detail"]/div[1]/div', 'http://www.vietnamworks.com/login/?redirectURL=http%3A%2F%2Fwww.vietnamworks.com%2Fit-hardware-networking-it-software-jobs-i55%2C35-en%2F', 'form%5Busername%5D=anhtuyenpro94%40gmail.com&form%5Bpassword%5D=anhtuyenpro_at&form%5Bsign_in%5D=', 14, 18),
('http://www.vietnamworks.com/customer-service-jobs-i11-en/page-', '', '//*[@id="job-list"]/div[1]/table/tbody/tr/td/div/div[1]/div[2]/div[1]/a', '//*[@id="section-job-detail"]/div[3]/div/div[2]/div[2]/div[1]/div[1]/div/div/h1', '//*[@id="section-job-detail"]/div[3]/div/div[2]/div[2]/div[1]/div[1]/div/div/span[1]/strong', '//*[@id="section-job-detail"]/div[3]/div/div[2]/div[2]/div[1]/div[1]/div/div/span[2]', '//*[@id="job-description"]', '//*[@id="section-job-detail"]/div[3]/div/div[2]/div[2]/div[2]/div[1]/div/span', '//*[@id="job-requirement"]/div/div', '//*[@id="what-we-offer"]/div/div[2]/div', '', '//*[@id="job-detail"]/div[1]/div', 'http://www.vietnamworks.com/login/?redirectURL=http%3A%2F%2Fwww.vietnamworks.com%2Fit-hardware-networking-it-software-jobs-i55%2C35-en%2F', 'form%5Busername%5D=anhtuyenpro94%40gmail.com&form%5Bpassword%5D=anhtuyenpro_at&form%5Bsign_in%5D=', 17, 38),
('http://www.vietnamworks.com/export-import-jobs-i19-en/page-', '', '//*[@id="job-list"]/div[1]/table/tbody/tr/td/div/div[1]/div[2]/div[1]/a', '//*[@id="section-job-detail"]/div[3]/div/div[2]/div[2]/div[1]/div[1]/div/div/h1', '//*[@id="section-job-detail"]/div[3]/div/div[2]/div[2]/div[1]/div[1]/div/div/span[1]/strong', '//*[@id="section-job-detail"]/div[3]/div/div[2]/div[2]/div[1]/div[1]/div/div/span[2]', '//*[@id="job-description"]', '//*[@id="section-job-detail"]/div[3]/div/div[2]/div[2]/div[2]/div[1]/div/span', '//*[@id="job-requirement"]/div/div', '//*[@id="what-we-offer"]/div/div[2]/div', '', '//*[@id="job-detail"]/div[1]/div', 'http://www.vietnamworks.com/login/?redirectURL=http%3A%2F%2Fwww.vietnamworks.com%2Fit-hardware-networking-it-software-jobs-i55%2C35-en%2F', 'form%5Busername%5D=anhtuyenpro94%40gmail.com&form%5Bpassword%5D=anhtuyenpro_at&form%5Bsign_in%5D=', 20, 47),
('http://www.vietnamworks.com/human-resources-jobs-i23-en/page-', '', '//*[@id="job-list"]/div[1]/table/tbody/tr/td/div/div[1]/div[2]/div[1]/a', '//*[@id="section-job-detail"]/div[3]/div/div[2]/div[2]/div[1]/div[1]/div/div/h1', '//*[@id="section-job-detail"]/div[3]/div/div[2]/div[2]/div[1]/div[1]/div/div/span[1]/strong', '//*[@id="section-job-detail"]/div[3]/div/div[2]/div[2]/div[1]/div[1]/div/div/span[2]', '//*[@id="job-description"]', '//*[@id="section-job-detail"]/div[3]/div/div[2]/div[2]/div[2]/div[1]/div/span', '//*[@id="job-requirement"]/div/div', '//*[@id="what-we-offer"]/div/div[2]/div', '', '//*[@id="job-detail"]/div[1]/div', 'http://www.vietnamworks.com/login/?redirectURL=http%3A%2F%2Fwww.vietnamworks.com%2Fit-hardware-networking-it-software-jobs-i55%2C35-en%2F', 'form%5Busername%5D=anhtuyenpro94%40gmail.com&form%5Bpassword%5D=anhtuyenpro_at&form%5Bsign_in%5D=', 22, 42),
('http://www.vietnamworks.com/it-hardware-networking-jobs-i55-en/page-', '', '//*[@id="job-list"]/div[1]/table/tbody/tr/td/div/div[1]/div[2]/div[1]/a', '//*[@id="section-job-detail"]/div[3]/div/div[2]/div[2]/div[1]/div[1]/div/div/h1', '//*[@id="section-job-detail"]/div[3]/div/div[2]/div[2]/div[1]/div[1]/div/div/span[1]/strong', '//*[@id="section-job-detail"]/div[3]/div/div[2]/div[2]/div[1]/div[1]/div/div/span[2]', '//*[@id="job-description"]', '//*[@id="section-job-detail"]/div[3]/div/div[2]/div[2]/div[2]/div[1]/div/span', '//*[@id="job-requirement"]/div/div', '//*[@id="what-we-offer"]/div/div[2]/div', '', '//*[@id="job-detail"]/div[1]/div', 'http://www.vietnamworks.com/login/?redirectURL=http%3A%2F%2Fwww.vietnamworks.com%2Fit-hardware-networking-it-software-jobs-i55%2C35-en%2F', 'form%5Busername%5D=anhtuyenpro94%40gmail.com&form%5Bpassword%5D=anhtuyenpro_at&form%5Bsign_in%5D=', 3, 45),
('http://www.vietnamworks.com/it-software-jobs-i35-en/page-1', '', '//*[@id="job-list"]/div[1]/table/tbody/tr/td/div/div[1]/div[2]/div[1]/a', '//*[@id="section-job-detail"]/div[3]/div/div[2]/div[2]/div[1]/div[1]/div/div/h1', '//*[@id="section-job-detail"]/div[3]/div/div[2]/div[2]/div[1]/div[1]/div/div/span[1]/strong', '//*[@id="section-job-detail"]/div[3]/div/div[2]/div[2]/div[1]/div[1]/div/div/span[2]', '//*[@id="job-description"]', '//*[@id="section-job-detail"]/div[3]/div/div[2]/div[2]/div[2]/div[1]/div/span', '//*[@id="job-requirement"]/div/div', '//*[@id="what-we-offer"]/div/div[2]/div', '', '//*[@id="job-detail"]/div[1]/div', 'http://www.vietnamworks.com/login/?redirectURL=http%3A%2F%2Fwww.vietnamworks.com%2Fit-hardware-networking-it-software-jobs-i55%2C35-en%2F', 'form%5Busername%5D=anhtuyenpro94%40gmail.com&form%5Bpassword%5D=anhtuyenpro_at&form%5Bsign_in%5D=', 2, 46),
('http://www.vietnamworks.com/marketing-jobs-i27-en/page-', '', '//*[@id="job-list"]/div[1]/table/tbody/tr/td/div/div[1]/div[2]/div[1]/a', '//*[@id="section-job-detail"]/div[3]/div/div[2]/div[2]/div[1]/div[1]/div/div/h1', '//*[@id="section-job-detail"]/div[3]/div/div[2]/div[2]/div[1]/div[1]/div/div/span[1]/strong', '//*[@id="section-job-detail"]/div[3]/div/div[2]/div[2]/div[1]/div[1]/div/div/span[2]', '//*[@id="job-description"]', '//*[@id="section-job-detail"]/div[3]/div/div[2]/div[2]/div[2]/div[1]/div/span', '//*[@id="job-requirement"]/div/div', '//*[@id="what-we-offer"]/div/div[2]/div', '', '//*[@id="job-detail"]/div[1]/div', 'http://www.vietnamworks.com/login/?redirectURL=http%3A%2F%2Fwww.vietnamworks.com%2Fit-hardware-networking-it-software-jobs-i55%2C35-en%2F', 'form%5Busername%5D=anhtuyenpro94%40gmail.com&form%5Bpassword%5D=anhtuyenpro_at&form%5Bsign_in%5D=', 16, 36),
('http://www.vietnamworks.com/qa-qc-jobs-i70-en/page-', '', '//*[@id="job-list"]/div[1]/table/tbody/tr/td/div/div[1]/div[2]/div[1]/a', '//*[@id="section-job-detail"]/div[3]/div/div[2]/div[2]/div[1]/div[1]/div/div/h1', '//*[@id="section-job-detail"]/div[3]/div/div[2]/div[2]/div[1]/div[1]/div/div/span[1]/strong', '//*[@id="section-job-detail"]/div[3]/div/div[2]/div[2]/div[1]/div[1]/div/div/span[2]', '//*[@id="job-description"]', '//*[@id="section-job-detail"]/div[3]/div/div[2]/div[2]/div[2]/div[1]/div/span', '//*[@id="job-requirement"]/div/div', '//*[@id="what-we-offer"]/div/div[2]/div', '', '//*[@id="job-detail"]/div[1]/div', 'http://www.vietnamworks.com/login/?redirectURL=http%3A%2F%2Fwww.vietnamworks.com%2Fit-hardware-networking-it-software-jobs-i55%2C35-en%2F', 'form%5Busername%5D=anhtuyenpro94%40gmail.com&form%5Bpassword%5D=anhtuyenpro_at&form%5Bsign_in%5D=', 18, 48),
('https://itviec.com/?page=', 'https://itviec.com', '/div[class="first-group"]/div[class="job"]/div/div[2]/div[1]/a', '//*[@id]/div[2]/div/div[3]/div[1]/div/h1', '//*[@id]/div[2]/div/div[2]/div[1]/h3', '//*[@id="job-details-mobile"]/div[3]/div/div[1]', '//*[@id]/div[6]/div/div', '//*[@id]/div[3]/div/div[2]/span[2]', '//*[@id]/div[7]/div/div', '//*[@id]/div[8]/div/div[1]', '//*[@id]/div[2]/div/div[3]/div[1]/div/div[5]', '//*[@id]/div[3]/div/div[3]/div', '', '', 1, 46),
('https://www.careerlink.vn/viec-lam/ban-hang/31?page=', 'https://www.careerlink.vn', '//*[@id="save-job-form"]/div/div/h2/a', '/html/body/div[2]/div[1]/h1', '/html/body/div[2]/div[2]/div[1]/div/ul[1]/li[1]/a', '/html/body/div[2]/div[2]/div[1]/div/ul[1]/li[2]', '/html/body/div[2]/div[2]/div[1]/div/ul[2]', '/html/body/div[2]/div[2]/div[1]/div/ul[1]/li[3]', '/html/body/div[2]/div[2]/div[1]/div/div[3]', '', '/html/body/div[2]/div[2]/div[1]/div/dl/dd[2]', '/html/body/div[2]/div[2]/div[1]/div/p', '', '', 26, 37),
('https://www.careerlink.vn/viec-lam/cntt-phan-cung-mang/130?page=', 'https://www.careerlink.vn', '//*[@id="save-job-form"]/div/div/h2/a', '/html/body/div[2]/div[1]/h1', '/html/body/div[2]/div[2]/div[1]/div/ul[1]/li[1]/a', '/html/body/div[2]/div[2]/div[1]/div/ul[1]/li[2]', '/html/body/div[2]/div[2]/div[1]/div/ul[2]', '/html/body/div[2]/div[2]/div[1]/div/ul[1]/li[3]', '/html/body/div[2]/div[2]/div[1]/div/div[3]', '', '/html/body/div[2]/div[2]/div[1]/div/dl/dd[2]', '/html/body/div[2]/div[2]/div[1]/div/p', '', '', 29, 45),
('https://www.careerlink.vn/viec-lam/cntt-phan-mem/19?page=', 'https://www.careerlink.vn', '//*[@id="save-job-form"]/div/div/h2/a', '/html/body/div[2]/div[1]/h1', '/html/body/div[2]/div[2]/div[1]/div/ul[1]/li[1]/a', '/html/body/div[2]/div[2]/div[1]/div/ul[1]/li[2]', '/html/body/div[2]/div[2]/div[1]/div/ul[2]', '/html/body/div[2]/div[2]/div[1]/div/ul[1]/li[3]', '/html/body/div[2]/div[2]/div[1]/div/div[3]', '', '/html/body/div[2]/div[2]/div[1]/div/dl/dd[2]', '/html/body/div[2]/div[2]/div[1]/div/p', '', '', 27, 46),
('https://www.careerlink.vn/viec-lam/dich-vu-khach-hang/9?page=', 'https://www.careerlink.vn', '//*[@id="save-job-form"]/div/div/h2/a', '/html/body/div[2]/div[1]/h1', '/html/body/div[2]/div[2]/div[1]/div/ul[1]/li[1]/a', '/html/body/div[2]/div[2]/div[1]/div/ul[1]/li[2]', '/html/body/div[2]/div[2]/div[1]/div/ul[2]', '/html/body/div[2]/div[2]/div[1]/div/ul[1]/li[3]', '/html/body/div[2]/div[2]/div[1]/div/div[3]', '', '/html/body/div[2]/div[2]/div[1]/div/dl/dd[2]', '/html/body/div[2]/div[2]/div[1]/div/p', '', '', 41, 38),
('https://www.careerlink.vn/viec-lam/dien-dien-tu/148?page=', 'https://www.careerlink.vn', '//*[@id="save-job-form"]/div/div/h2/a', '/html/body/div[2]/div[1]/h1', '/html/body/div[2]/div[2]/div[1]/div/ul[1]/li[1]/a', '/html/body/div[2]/div[2]/div[1]/div/ul[1]/li[2]', '/html/body/div[2]/div[2]/div[1]/div/ul[2]', '/html/body/div[2]/div[2]/div[1]/div/ul[1]/li[3]', '/html/body/div[2]/div[2]/div[1]/div/div[3]', '', '/html/body/div[2]/div[2]/div[1]/div/dl/dd[2]', '/html/body/div[2]/div[2]/div[1]/div/p', '', '', 45, 16),
('https://www.careerlink.vn/viec-lam/ke-toan-tai-chinh-kiem-toan/1?page=', 'https://www.careerlink.vn', '//*[@id="save-job-form"]/div/div/h2/a', '/html/body/div[2]/div[1]/h1', '/html/body/div[2]/div[2]/div[1]/div/ul[1]/li[1]/a', '/html/body/div[2]/div[2]/div[1]/div/ul[1]/li[2]', '/html/body/div[2]/div[2]/div[1]/div/ul[2]', '/html/body/div[2]/div[2]/div[1]/div/ul[1]/li[3]', '/html/body/div[2]/div[2]/div[1]/div/div[3]', '', '/html/body/div[2]/div[2]/div[1]/div/dl/dd[2]', '/html/body/div[2]/div[2]/div[1]/div/p', '', '', 49, 11),
('https://www.careerlink.vn/viec-lam/ky-thuat-ung-dung-co-khi/11?page=', 'https://www.careerlink.vn', '//*[@id="save-job-form"]/div/div/h2/a', '/html/body/div[2]/div[1]/h1', '/html/body/div[2]/div[2]/div[1]/div/ul[1]/li[1]/a', '/html/body/div[2]/div[2]/div[1]/div/ul[1]/li[2]', '/html/body/div[2]/div[2]/div[1]/div/ul[2]', '/html/body/div[2]/div[2]/div[1]/div/ul[1]/li[3]', '/html/body/div[2]/div[2]/div[1]/div/div[3]', '', '/html/body/div[2]/div[2]/div[1]/div/dl/dd[2]', '/html/body/div[2]/div[2]/div[1]/div/p', '', '', 43, 17),
('https://www.careerlink.vn/viec-lam/nghe-thuat-thiet-ke-giai-tri/4?page=', 'https://www.careerlink.vn', '//*[@id="save-job-form"]/div/div/h2/a', '/html/body/div[2]/div[1]/h1', '/html/body/div[2]/div[2]/div[1]/div/ul[1]/li[1]/a', '/html/body/div[2]/div[2]/div[1]/div/ul[1]/li[2]', '/html/body/div[2]/div[2]/div[1]/div/ul[2]', '/html/body/div[2]/div[2]/div[1]/div/ul[1]/li[3]', '/html/body/div[2]/div[2]/div[1]/div/div[3]', '', '/html/body/div[2]/div[2]/div[1]/div/dl/dd[2]', '/html/body/div[2]/div[2]/div[1]/div/p', '', '', 39, 6),
('https://www.careerlink.vn/viec-lam/quang-cao-khuyen-mai-doi-ngoai/2?page=', 'https://www.careerlink.vn', '//*[@id="save-job-form"]/div/div/h2/a', '/html/body/div[2]/div[1]/h1', '/html/body/div[2]/div[2]/div[1]/div/ul[1]/li[1]/a', '/html/body/div[2]/div[2]/div[1]/div/ul[1]/li[2]', '/html/body/div[2]/div[2]/div[1]/div/ul[2]', '/html/body/div[2]/div[2]/div[1]/div/ul[1]/li[3]', '/html/body/div[2]/div[2]/div[1]/div/div[3]', '', '/html/body/div[2]/div[2]/div[1]/div/dl/dd[2]', '/html/body/div[2]/div[2]/div[1]/div/p', '', '', 37, 7),
('https://www.careerlink.vn/viec-lam/san-xuat-van-hanh-san-xuat/23?page=', 'https://www.careerlink.vn', '//*[@id="save-job-form"]/div/div/h2/a', '/html/body/div[2]/div[1]/h1', '/html/body/div[2]/div[2]/div[1]/div/ul[1]/li[1]/a', '/html/body/div[2]/div[2]/div[1]/div/ul[1]/li[2]', '/html/body/div[2]/div[2]/div[1]/div/ul[2]', '/html/body/div[2]/div[2]/div[1]/div/ul[1]/li[3]', '/html/body/div[2]/div[2]/div[1]/div/div[3]', '', '/html/body/div[2]/div[2]/div[1]/div/dl/dd[2]', '/html/body/div[2]/div[2]/div[1]/div/p', '', '', 33, 49),
('https://www.careerlink.vn/viec-lam/thu-ky-hanh-chanh/6?page=', 'https://www.careerlink.vn', '//*[@id="save-job-form"]/div/div/h2/a', '/html/body/div[2]/div[1]/h1', '/html/body/div[2]/div[2]/div[1]/div/ul[1]/li[1]/a', '/html/body/div[2]/div[2]/div[1]/div/ul[1]/li[2]', '/html/body/div[2]/div[2]/div[1]/div/ul[2]', '/html/body/div[2]/div[2]/div[1]/div/ul[1]/li[3]', '/html/body/div[2]/div[2]/div[1]/div/div[3]', '', '/html/body/div[2]/div[2]/div[1]/div/dl/dd[2]', '/html/body/div[2]/div[2]/div[1]/div/p', '', '', 31, 40),
('https://www.careerlink.vn/viec-lam/tiep-thi/136?page=', 'https://www.careerlink.vn', '//*[@id="save-job-form"]/div/div/h2/a', '/html/body/div[2]/div[1]/h1', '/html/body/div[2]/div[2]/div[1]/div/ul[1]/li[1]/a', '/html/body/div[2]/div[2]/div[1]/div/ul[1]/li[2]', '/html/body/div[2]/div[2]/div[1]/div/ul[2]', '/html/body/div[2]/div[2]/div[1]/div/ul[1]/li[3]', '/html/body/div[2]/div[2]/div[1]/div/div[3]', '', '/html/body/div[2]/div[2]/div[1]/div/dl/dd[2]', '/html/body/div[2]/div[2]/div[1]/div/p', '', '', 35, 36),
('https://www.careerlink.vn/viec-lam/tu-van/7?page=', 'https://www.careerlink.vn', '//*[@id="save-job-form"]/div/div/h2/a', '/html/body/div[2]/div[1]/h1', '/html/body/div[2]/div[2]/div[1]/div/ul[1]/li[1]/a', '/html/body/div[2]/div[2]/div[1]/div/ul[1]/li[2]', '/html/body/div[2]/div[2]/div[1]/div/ul[2]', '/html/body/div[2]/div[2]/div[1]/div/ul[1]/li[3]', '/html/body/div[2]/div[2]/div[1]/div/div[3]', '', '/html/body/div[2]/div[2]/div[1]/div/dl/dd[2]', '/html/body/div[2]/div[2]/div[1]/div/p', '', '', 47, 33),
('https://www.careerlink.vn/viec-lam/van-chuyen-giao-thong-kho-bai/34?page=', 'https://www.careerlink.vn', '//*[@id="save-job-form"]/div/div/h2/a', '/html/body/div[2]/div[1]/h1', '/html/body/div[2]/div[2]/div[1]/div/ul[1]/li[1]/a', '/html/body/div[2]/div[2]/div[1]/div/ul[1]/li[2]', '/html/body/div[2]/div[2]/div[1]/div/ul[2]', '/html/body/div[2]/div[2]/div[1]/div/ul[1]/li[3]', '/html/body/div[2]/div[2]/div[1]/div/div[3]', '', '/html/body/div[2]/div[2]/div[1]/div/dl/dd[2]', '/html/body/div[2]/div[2]/div[1]/div/p', '', '', 51, 50);

-- --------------------------------------------------------

--
-- Table structure for table `resume`
--

CREATE TABLE IF NOT EXISTS `resume` (
  `ResumeId` int(11) NOT NULL AUTO_INCREMENT,
  `AccountId` int(11) DEFAULT NULL,
  `Name` text,
  `Birthday` datetime DEFAULT NULL,
  `Gender` text,
  `MaritalStatus` blob,
  `PlaceOfBirth` text,
  `Hometown` text,
  `Nationality` text,
  `Avatar` text,
  `Address` text,
  `Email` text,
  `Phone` char(15) DEFAULT NULL,
  `Hobby` text,
  PRIMARY KEY (`ResumeId`),
  UNIQUE KEY `AccountId` (`AccountId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `skill`
--

CREATE TABLE IF NOT EXISTS `skill` (
  `SkillId` int(11) NOT NULL AUTO_INCREMENT,
  `ResumeId` int(11) NOT NULL,
  `SkillName` text,
  `Description` text,
  PRIMARY KEY (`SkillId`),
  KEY `t7` (`ResumeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `career_objective`
--
ALTER TABLE `career_objective`
  ADD CONSTRAINT `t1` FOREIGN KEY (`ResumeId`) REFERENCES `resume` (`ResumeId`);

--
-- Constraints for table `company_sumary`
--
ALTER TABLE `company_sumary`
  ADD CONSTRAINT `t2` FOREIGN KEY (`AccountId`) REFERENCES `account` (`AccountId`);

--
-- Constraints for table `degree`
--
ALTER TABLE `degree`
  ADD CONSTRAINT `t3` FOREIGN KEY (`ResumeId`) REFERENCES `resume` (`ResumeId`);

--
-- Constraints for table `experience`
--
ALTER TABLE `experience`
  ADD CONSTRAINT `t4` FOREIGN KEY (`ResumeId`) REFERENCES `resume` (`ResumeId`);

--
-- Constraints for table `job`
--
ALTER TABLE `job`
  ADD CONSTRAINT `job_ibfk_1` FOREIGN KEY (`Category`) REFERENCES `category` (`Id`),
  ADD CONSTRAINT `t5` FOREIGN KEY (`AccountId`) REFERENCES `account` (`AccountId`);

--
-- Constraints for table `job_xpath`
--
ALTER TABLE `job_xpath`
  ADD CONSTRAINT `job_xpath_ibfk_1` FOREIGN KEY (`category`) REFERENCES `category` (`Id`);

--
-- Constraints for table `resume`
--
ALTER TABLE `resume`
  ADD CONSTRAINT `t6` FOREIGN KEY (`AccountId`) REFERENCES `account` (`AccountId`);

--
-- Constraints for table `skill`
--
ALTER TABLE `skill`
  ADD CONSTRAINT `t7` FOREIGN KEY (`ResumeId`) REFERENCES `resume` (`ResumeId`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
