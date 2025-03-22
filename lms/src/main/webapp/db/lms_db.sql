CREATE TABLE admin (
	admin_id int(11) auto_increment primary key,
  	admin_name varchar(255) NOT NULL,
  	admin_email varchar(255) NOT NULL,
  	admin_pass varchar(255) NOT NULL
);

INSERT INTO admin (admin_id, admin_name, admin_email, admin_pass) VALUES
(1, 'Raviraj Patil', 'admin@gmail.com', 'admin');

CREATE TABLE instructor (
	inst_id int(11) auto_increment primary key,
	inst_name varchar(255) NOT NULL,
  	inst_email varchar(255) NOT NULL,
  	inst_phone varchar(10) NOT NULL,
  	inst_pass varchar(255) NOT NULL,
  	inst_qual varchar(255) NOT NULL,
  	inst_occ varchar(255) not null,
  	inst_img text NOT NULL,
  	inst_is_active int default 0
);

INSERT INTO instructor (inst_name, inst_email, inst_phone, inst_pass, inst_qual, inst_occ, inst_img) VALUES
('Sarang Joshi','sarang.joshi@gmail.com','9823374999','test2024','Ph.D','Music Teacher','image/inst/instructor1.jpg'),
('Poonam Ponde','poo.ponde@gmail.com','7823374999','test2024','M.Tech','Software Developer','image/inst/instructor2.jpg'),
('Girish Bapat','bapat.g@gmail.com','8823374999','test2024','B.Tech','Software Trainer','image/inst/instructor3.jpg'),
('Shrirang Sathe','sathe.shri@gmail.com','9825574999','test2024','Ph.D','Software Architect','image/inst/instructor4.jpg'),
('Gayatri Kulkarni','gk.2023@gmail.com','9824474999','test2024','M.Tech','Data Scientist','image/inst/instructor5.jpg');

CREATE TABLE student (
	stu_id int(11) auto_increment primary key,
	stu_name varchar(255) NOT NULL,
  	stu_email varchar(255) NOT NULL,
  	stu_phone varchar(10) NOT NULL,
  	stu_pass varchar(255) NOT NULL,
  	stu_occ varchar(255) NOT NULL,
  	stu_img text NOT NULL
);

INSERT INTO student (stu_name, stu_email, stu_phone, stu_pass, stu_occ, stu_img) VALUES
('Sanika Kulkarni', 'sanikakamble@gmail.com', '7823374979', 'test2024', 'Web Designer', 'image/stu/student1.jpg'),
('Ramesh Chavan', 'ramesh@gmail.com', '9823377979', 'test2024', 'Data Scientist', 'image/stu/student2.jpg'),
('Mahadev Ghorpade', 'dev@gmail.com', '9823374449', 'test2024', 'Web Developer', 'image/stu/student3.jpg'),
('Reshma Singh', 'witch@example.com', '9823374999', 'test2024', 'Web Designer', 'image/stu/student4.jpg'),
('Akshay Dingankar', 'akshay.d@gmail.com', '7873374979', 'test2024', 'Data Scientist', 'image/stu/student5.jpg'),
('Riya Bapat', 'priya@gmail.com', '8823374979', 'test2024', 'Web Developer', 'image/stu/student6.jpg'),
('Pawan Joshi', 'pawan@gmail.com', '9823374977', 'test2024', 'Software Developer', 'image/stu/student7.jpg');

CREATE TABLE course (
  course_id int(11) auto_increment primary key,
  course_name text NOT NULL,
  course_desc text NOT NULL,
  inst_id int references instructor(inst_id) on delete cascade,
  course_img text NOT NULL,
  course_duration text NOT NULL,
  course_price int(11) NOT NULL,
  course_original_price int(11) NOT NULL,
  course_is_active int default 0
);

INSERT INTO course (course_id, course_name, course_desc, inst_id, course_img, course_duration, course_price, course_original_price) VALUES
(1, 'Learn Guitar The Easy Way', 'This course is your \"Free Pass\" to playing guitar. It is the most direct and to the point complete online guitar course.', 1, 'image/courseimg/Guitar.jpg', '3 Hours', 1655, 1800),
(2, 'Complete PHP Bootcamp', 'This course will help you get all the Object Oriented PHP, MYSQLi and ending the course by building a CMS system.', 2, 'image/courseimg/super-mario-2690254_1280.jpg', '3 Months', 700, 1700),
(3, 'Learn Python A-Z', 'This is the most comprehensive, yet straight-forward, course for the Python programming language.', 2, 'image/courseimg/Python.jpg', '4 Months', 800, 1800),
(4, 'Hands-on Artificial Intelligence', 'Learn and Master how AI works and how it is changing our lives in this Course.\r\nlives in this Course.', 3, 'image/courseimg/ai.jpg', '6 Months', 900, 1900),
(5, 'Learn Vue JS', 'The skills you will learn from this course is applicable to the real world, so you can go ahead and build similar app.', 4, 'image/courseimg/vue.jpg', '2 Months', 100, 1000),
(6, 'Angular JS', 'Angular is one of the most popular frameworks for building client apps with HTML, CSS and TypeScript.', 5, 'image/courseimg/angular.jpg', '4 Month', 800, 1600),
(7, 'PHP Complete', 'This is complete PHP Course', 5, 'image/courseimg/php.jpg', '4 hours', 500, 4000);


CREATE TABLE courseorder (
  co_id int(11) auto_increment primary key,
  order_id varchar(255) NOT NULL,
  stu_id int(11) references student(stu_id) on delete cascade,
  course_id int(11) NOT NULL,
  status varchar(255) NOT NULL,
  respmsg text NOT NULL,
  amount int(11) NOT NULL,
  order_date date NOT NULL
);


CREATE TABLE feedback (
	f_id int(11) auto_increment primary key,
  	f_content text NOT NULL,
  	stu_id int(11) references student(stu_id) on delete cascade
);

insert into feedback(f_content, stu_id) values
('Thank you very much this wonderful course',2),
('Looking forward for next course', 3),
('Need some more lessons', 1);


CREATE TABLE lesson (
	lesson_id int(11) auto_increment primary key,
  	lesson_name text NOT NULL,
  	lesson_desc text NOT NULL,
  	lesson_link text NOT NULL,
  	course_id int(11) NOT NULL,
  	course_name text NOT NULL
);

INSERT INTO lesson (lesson_id, lesson_name, lesson_desc, lesson_link, course_id, course_name) VALUES
(1, 'Introduction to Python ', 'Introduction to Python Desc', 'lessonvid/video2.mp4', 3, 'Learn Python A-Z'),
(2, 'How Python Works', 'How Python Works Descc', 'lessonvid/video3.mp4', 3, 'Learn Python A-Z'),
(3, 'Why Python is powerful', 'Why Python is powerful Desc', 'lessonvid/video9.mp4', 3, 'Learn Python A-Z'),
(4, 'Everyone should learn Python ', 'Everyone should learn Python  Desccc', 'lessonvid/video1.mp4', 3, 'Learn Python A-Z'),
(5, 'Introduction to PHP', 'Introduction to PHP Desc', 'lessonvid/video4.mp4', 2, 'Complete PHP Bootcamp'),
(6, 'How PHP works', 'How PHP works Desc', 'lessonvid/video5.mp4', 2, 'Complete PHP Bootcamp'),
(7, 'is PHP really easy ?', 'is PHP really easy ? desc', 'lessonvid/video6.mp4', 2, 'Complete PHP Bootcamp'),
(8, 'Introduction to Guitar44', 'Introduction to Guitar desc1', 'lessonvid/video7.mp4', 1, 'Learn Guitar The Easy Way'),
(9, 'Type of Guitar', 'Type of Guitar Desc2', 'lessonvid/video8.mp4', 1, 'Learn Guitar The Easy Way'),
(10, 'Intro Hands-on Artificial Intelligence', 'Intro Hands-on Artificial Intelligence desc', 'lessonvid/video10.mp4', 4, 'Hands-on Artificial Intelligence'),
(11, 'How it works', 'How it works descccccc', 'lessonvid/video11.mp4', 4, 'Hands-on Artificial Intelligence'),
(12, 'Inro Learn Vue JS', 'Inro Learn Vue JS desc', 'lessonvid/video12.mp4', 5, 'Learn Vue JS'),
(13, 'intro Angular JS', 'intro Angular JS desc', 'lessonvid/video13.mp4', 6, 'Angular JS'),
(14, 'Intro to Python Complete', 'This is lesson number 1', 'lessonvid/video11.mp4', 6, 'Python Complete'),
(15, 'Introduction to React Native', 'This intro video of React native', 'lessonvid/video11.mp4', 17, 'Learn React Native');

create table scholarship(
	id int auto_increment primary key,
	name text not null,
	eligibility text not null,
	syllabus text not null,
	website text not null
);

insert into scholarship(name, eligibility, syllabus, website) values
('NDSE (National Talent Search Exam)','10th class students','Science, Maths , Social, Mental ablility','www.ncert.nic.in'),
('KYPY (Kishor Vygnanika Proshaah Yogena)','Inter (MPC/BiPC)','Inter syllabus','www.kypy.iisc.ernet.in'),
('HBBVS (Dr. Homi Baba bala vidyanic spertha)','6 to 9 th class students','CBSE/ICSE Syllabus','www.instrs.in'),
('NSO (National Science Olympiad)','1 to 12 th class students','CBSE/ICSE Syllabus','www.sofworld.org'),
('NCO (National Cyber Olympiad)','1 to 12 th class students','CBSE/ICSE Syllabus','www.sofworld.org'),
('UCO (Unified Cyber Olympiad) ','8 to 12 th class students','Mental ability, Reasoning, Computer Skills','www.unifiedcouncil.com'),
('NSTSE (National Science Talent Search Exam)','1 to 12 th class students','CBSE/ICSE Syllabus','www.unifiedcouncil.com'),
('MTSE (Maths Talent Search Exam)','3to 9 th class students','Mental ability, Reasoning, Maths','www.ganithasastraparishad.org'),
('IMO (International Mathematics Olympiad)','1 to 12 th class students','CBSE/ICSE Syllabus','www.imo_official.in'),
('NLSTSE (National Level Science Talent Search Exam) ','1 to 12 th class students','CBSE/ICSE Syllabus','www.unifiedcouncil.com');

create table donation(
	id int auto_increment primary key,
	name varchar(255) not null,
	phone varchar(20) not null,
	email varchar(100) not null,
	amount int not null,
	donate_date date default current_date
);

insert into donation(name, phone, email, amount) values
('Om Bhole','8978675645','om.bhole@gmail.com', 500),
('Lokesh Nemade','9978675645','lokesh.nemade@gmail.com', 1000),
('Shrushti Sabnis','6978675645','sabnis.s@gmail.com', 500),
('Varad Kau','8978665665','kau.varad@gmail.com', 500),
('Tej Koli','7977675645','tejbahadur@gmail.com', 1000),
('Malhar Kavthale','7777675645','malhar.k@gmail.com', 1500),
('Aditya Kamble','9978675945','kamble.adi@gmail.com', 500),
('Ayush Ghorpade','8978675645','om.bhole@gmail.com', 500);



