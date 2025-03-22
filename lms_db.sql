-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 08, 2024 at 07:16 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lms_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL,
  `admin_name` varchar(255) NOT NULL,
  `admin_email` varchar(255) NOT NULL,
  `admin_pass` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `admin_name`, `admin_email`, `admin_pass`) VALUES
(1, 'Raviraj Patil', 'admin@gmail.com', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `course_id` int(11) NOT NULL,
  `course_name` text NOT NULL,
  `course_desc` text NOT NULL,
  `inst_id` int(11) DEFAULT NULL,
  `course_img` text NOT NULL,
  `course_duration` text NOT NULL,
  `course_price` int(11) NOT NULL,
  `course_original_price` int(11) NOT NULL,
  `course_is_active` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`course_id`, `course_name`, `course_desc`, `inst_id`, `course_img`, `course_duration`, `course_price`, `course_original_price`, `course_is_active`) VALUES
(1, 'Learn Guitar The Easy Way', 'This course is your \"Free Pass\" to playing guitar. It is the most direct and to the point complete online guitar course.', 1, 'image/courseimg/Guitar.jpg', '3', 1655, 1800, 0),
(2, 'Complete PHP Bootcamp', 'This course will help you get all the Object Oriented PHP, MYSQLi and ending the course by building a CMS system.', 2, 'image/courseimg/super-mario-2690254_1280.jpg', '3', 700, 1700, 0),
(3, 'Learn Python A-Z', 'This is the most comprehensive, yet straight-forward, course for the Python programming language.', 2, 'image/courseimg/Python.jpg', '4', 800, 1800, 0),
(4, 'Hands-on Artificial Intelligence', 'Learn and Master how AI works and how it is changing our lives in this Course.\r\nlives in this Course.', 3, 'image/courseimg/ai.jpg', '6', 900, 1900, 0),
(5, 'Learn Vue JS', 'The skills you will learn from this course is applicable to the real world, so you can go ahead and build similar app.', 4, 'image/courseimg/vue.jpg', '2', 100, 1000, 0),
(6, 'Angular JS', 'Angular is one of the most popular frameworks for building client apps with HTML, CSS and TypeScript.', 5, 'image/courseimg/angular.jpg', '4', 800, 1600, 0),
(7, 'PHP Complete', 'This is complete PHP Course', 5, 'image/courseimg/php.jpg', '4', 500, 4000, 0);

-- --------------------------------------------------------

--
-- Table structure for table `courseorder`
--

CREATE TABLE `courseorder` (
  `co_id` int(11) NOT NULL,
  `order_id` varchar(255) NOT NULL,
  `stu_id` int(11) DEFAULT NULL,
  `course_id` int(11) NOT NULL,
  `status` varchar(255) NOT NULL,
  `respmsg` text NOT NULL,
  `amount` int(11) NOT NULL,
  `order_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `courseorder`
--

INSERT INTO `courseorder` (`co_id`, `order_id`, `stu_id`, `course_id`, `status`, `respmsg`, `amount`, `order_date`) VALUES
(1, '61196536', 1, 2, 'Success', 'Done', 700, '2024-05-06'),
(2, '42331984', 1, 4, 'Success', 'Done', 900, '2024-05-08');

-- --------------------------------------------------------

--
-- Table structure for table `donation`
--

CREATE TABLE `donation` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `amount` int(11) NOT NULL,
  `donate_date` date DEFAULT curdate()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `donation`
--

INSERT INTO `donation` (`id`, `name`, `phone`, `email`, `amount`, `donate_date`) VALUES
(1, 'Om Bhole', '8978675645', 'om.bhole@gmail.com', 500, '2024-05-06'),
(2, 'Lokesh Nemade', '9978675645', 'lokesh.nemade@gmail.com', 1000, '2024-05-06'),
(3, 'Shrushti Sabnis', '6978675645', 'sabnis.s@gmail.com', 500, '2024-05-06'),
(4, 'Varad Kau', '8978665665', 'kau.varad@gmail.com', 500, '2024-05-06'),
(5, 'Tej Koli', '7977675645', 'tejbahadur@gmail.com', 1000, '2024-05-06'),
(6, 'Malhar Kavthale', '7777675645', 'malhar.k@gmail.com', 1500, '2024-05-06'),
(7, 'Aditya Kamble', '9978675945', 'kamble.adi@gmail.com', 500, '2024-05-06'),
(8, 'Ayush Ghorpade', '8978675645', 'om.bhole@gmail.com', 500, '2024-05-06'),
(9, 'Amol Desai', 'amol.d@gmail.com', '8787234567', 5000, '2024-05-07');

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `f_id` int(11) NOT NULL,
  `f_content` text NOT NULL,
  `stu_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`f_id`, `f_content`, `stu_id`) VALUES
(1, 'Thank you very much this wonderful course', 2),
(2, 'Looking forward for next course', 3),
(3, 'Need some more lessons', 1);

-- --------------------------------------------------------

--
-- Table structure for table `instructor`
--

CREATE TABLE `instructor` (
  `inst_id` int(11) NOT NULL,
  `inst_name` varchar(255) NOT NULL,
  `inst_email` varchar(255) NOT NULL,
  `inst_phone` varchar(10) NOT NULL,
  `inst_pass` varchar(255) NOT NULL,
  `inst_qual` varchar(255) NOT NULL,
  `inst_occ` varchar(255) NOT NULL,
  `inst_img` text NOT NULL,
  `inst_is_active` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `instructor`
--

INSERT INTO `instructor` (`inst_id`, `inst_name`, `inst_email`, `inst_phone`, `inst_pass`, `inst_qual`, `inst_occ`, `inst_img`, `inst_is_active`) VALUES
(1, 'Sarang Joshi', 'sarang.joshi@gmail.com', '9823374999', 'test2024', 'Ph.D', 'Music Teacher', 'image/inst/instructor1.jpg', 1),
(2, 'Poonam Ponde', 'poo.ponde@gmail.com', '7823374999', 'test2024', 'Ph.D', 'Software Developer', 'image/inst/instructor2.jpg', 1),
(3, 'Girish Bapat', 'bapat.g@gmail.com', '8823374999', 'test2024', 'B.Tech', 'Software Trainer', 'image/inst/instructor3.jpg', 1),
(4, 'Shrirang Sathe', 'sathe.shri@gmail.com', '9825574999', 'test2024', 'Ph.D', 'Software Architect', 'image/inst/instructor4.jpg', 1),
(5, 'Gayatri Kulkarni', 'gk.2023@gmail.com', '9824474999', 'test2024', 'M.Tech', 'Data Scientist', 'image/inst/instructor5.jpg', 1);

-- --------------------------------------------------------

--
-- Table structure for table `lesson`
--

CREATE TABLE `lesson` (
  `lesson_id` int(11) NOT NULL,
  `lesson_name` text NOT NULL,
  `lesson_desc` text NOT NULL,
  `lesson_link` text NOT NULL,
  `course_id` int(11) NOT NULL,
  `course_name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `lesson`
--

INSERT INTO `lesson` (`lesson_id`, `lesson_name`, `lesson_desc`, `lesson_link`, `course_id`, `course_name`) VALUES
(1, 'Introduction to Python ', 'Introduction to Python Desc', 'lessonvid/video2.mp4', 3, 'Learn Python A-Z'),
(2, 'How Python Works', 'How Python Works Descc', 'lessonvid/video3.mp4', 3, 'Learn Python A-Z'),
(3, 'Why Python is powerful', 'Why Python is powerful Desc', 'lessonvid/video9.mp4', 3, 'Learn Python A-Z'),
(4, 'Everyone should learn Python ', 'Everyone should learn Python  Desccc', 'lessonvid/video1.mp4', 3, 'Learn Python A-Z'),
(5, 'Introduction to PHP', 'Introduction to PHP Desc', 'lessonvid/video4.mp4', 2, 'Complete PHP Bootcamp'),
(6, 'How PHP works', 'How PHP works Desc', 'lessonvid/video5.mp4', 2, 'Complete PHP Bootcamp'),
(7, 'Is PHP really easy?', 'PHP is simple and easy to learn.', 'lessonvid/video6.mp4', 2, 'Complete PHP Bootcamp'),
(8, 'Introduction to Guitar44', 'Introduction to Guitar desc1', 'lessonvid/video7.mp4', 1, 'Learn Guitar The Easy Way'),
(9, 'Type of Guitar', 'Type of Guitar Desc2', 'lessonvid/video8.mp4', 1, 'Learn Guitar The Easy Way'),
(10, 'Intro Hands-on Artificial Intelligence', 'Intro Hands-on Artificial Intelligence desc', 'lessonvid/video10.mp4', 4, 'Hands-on Artificial Intelligence'),
(11, 'How it works', 'How it works descccccc', 'lessonvid/video11.mp4', 4, 'Hands-on Artificial Intelligence'),
(12, 'Inro Learn Vue JS', 'Inro Learn Vue JS desc', 'lessonvid/video12.mp4', 5, 'Learn Vue JS'),
(13, 'intro Angular JS', 'intro Angular JS desc', 'lessonvid/video13.mp4', 6, 'Angular JS'),
(14, 'Intro to Python Complete', 'This is lesson number 1', 'lessonvid/video11.mp4', 6, 'Python Complete'),
(15, 'Introduction to React Native', 'This intro video of React native', 'lessonvid/video11.mp4', 17, 'Learn React Native');

-- --------------------------------------------------------

--
-- Table structure for table `scholarship`
--

CREATE TABLE `scholarship` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `eligibility` text NOT NULL,
  `syllabus` text NOT NULL,
  `website` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `scholarship`
--

INSERT INTO `scholarship` (`id`, `name`, `eligibility`, `syllabus`, `website`) VALUES
(1, 'NDSE (National Talent Search Exam)', '10th class students', 'Science, Maths , Social, Mental ablility', 'http://www.ncert.nic.in'),
(2, 'KYPY (Kishor Vygnanika Proshaah Yogena)', 'Inter (MPC/BiPC)', 'Inter syllabus', 'http://www.kypy.iisc.ernet.in'),
(3, 'HBBVS (Dr. Homi Baba Bala Vidyanic Spertha)', '6 to 9th class students', 'CBSE/ICSE Syllabus', 'http://www.instrs.in'),
(4, 'NSO (National Science Olympiad)', '1 to 12 th class students', 'CBSE/ICSE Syllabus', 'http://www.sofworld.org'),
(5, 'NCO (National Cyber Olympiad)', '1 to 12 th class students', 'CBSE/ICSE Syllabus', 'http://www.sofworld.org'),
(6, 'UCO (Unified Cyber Olympiad) ', '8 to 12 th class students', 'Mental ability, Reasoning, Computer Skills', 'http://www.unifiedcouncil.com'),
(7, 'NSTSE (National Science Talent Search Exam)', '1 to 12 th class students', 'CBSE/ICSE Syllabus', 'http://www.unifiedcouncil.com'),
(8, 'MTSE (Maths Talent Search Exam)', '3to 9 th class students', 'Mental ability, Reasoning, Maths', 'http://www.ganithasastraparishad.org'),
(9, 'IMO (International Mathematics Olympiad)', '1 to 12 th class students', 'CBSE/ICSE Syllabus', 'http://www.imo_official.in'),
(10, 'NLSTSE (National Level Science Talent Search Exam) ', '1 to 12 th class students', 'CBSE/ICSE Syllabus', 'http://www.unifiedcouncil.com');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `stu_id` int(11) NOT NULL,
  `stu_name` varchar(255) NOT NULL,
  `stu_email` varchar(255) NOT NULL,
  `stu_phone` varchar(10) NOT NULL,
  `stu_pass` varchar(255) NOT NULL,
  `stu_occ` varchar(255) NOT NULL,
  `stu_img` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`stu_id`, `stu_name`, `stu_email`, `stu_phone`, `stu_pass`, `stu_occ`, `stu_img`) VALUES
(1, 'Sanika Kulkarni', 'sanikakamble@gmail.com', '7823374979', 'test2024', 'Web Designer', 'image/stu/student1.jpg'),
(2, 'Ramesh Chavan', 'ramesh@gmail.com', '9823377979', 'test2024', 'Data Scientist', 'image/stu/student2.jpg'),
(3, 'Mahadev Ghorpade', 'dev@gmail.com', '9823374449', 'test2024', 'Web Developer', 'image/stu/student3.jpg'),
(4, 'Reshma Singh', 'witch@example.com', '9823374999', 'test2024', 'Web Designer', 'image/stu/student4.jpg'),
(5, 'Akshay Dingankar', 'akshay.d@gmail.com', '7873374979', 'test2024', 'Data Scientist', 'image/stu/student5.jpg'),
(6, 'Riya Bapat', 'priya@gmail.com', '8823374979', 'test2024', 'Web Developer', 'image/stu/student6.jpg'),
(7, 'Pawan Joshi', 'pawan@gmail.com', '9823374977', 'test2024', 'Software Developer', 'image/stu/student7.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`course_id`);

--
-- Indexes for table `courseorder`
--
ALTER TABLE `courseorder`
  ADD PRIMARY KEY (`co_id`);

--
-- Indexes for table `donation`
--
ALTER TABLE `donation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`f_id`);

--
-- Indexes for table `instructor`
--
ALTER TABLE `instructor`
  ADD PRIMARY KEY (`inst_id`);

--
-- Indexes for table `lesson`
--
ALTER TABLE `lesson`
  ADD PRIMARY KEY (`lesson_id`);

--
-- Indexes for table `scholarship`
--
ALTER TABLE `scholarship`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`stu_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `course`
--
ALTER TABLE `course`
  MODIFY `course_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `courseorder`
--
ALTER TABLE `courseorder`
  MODIFY `co_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `donation`
--
ALTER TABLE `donation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `f_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `instructor`
--
ALTER TABLE `instructor`
  MODIFY `inst_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `lesson`
--
ALTER TABLE `lesson`
  MODIFY `lesson_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `scholarship`
--
ALTER TABLE `scholarship`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `student`
--
ALTER TABLE `student`
  MODIFY `stu_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
