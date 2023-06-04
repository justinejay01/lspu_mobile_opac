/*
SQLyog Ultimate v13.1.1 (64 bit)
MySQL - 10.4.27-MariaDB : Database - lspu_library
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`lspu_library` /*!40100 DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci */;

USE `lspu_library`;

/*Table structure for table `books` */

DROP TABLE IF EXISTS `books`;

CREATE TABLE `books` (
  `book_id` int(5) NOT NULL AUTO_INCREMENT,
  `book_title` varchar(255) NOT NULL,
  `book_author` varchar(255) NOT NULL,
  `book_summary` text NOT NULL,
  `book_pub_date` date NOT NULL,
  `book_genre` varchar(225) DEFAULT NULL,
  `book_dept` varchar(225) DEFAULT NULL,
  PRIMARY KEY (`book_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `books` */

insert  into `books`(`book_id`,`book_title`,`book_author`,`book_summary`,`book_pub_date`,`book_genre`,`book_dept`) values 
(1,'CCS Online Thesis Management System','Cabela, Patrick Ryan T., Clado, John Vincent D., Custodio, John Kenny U.','The study is entitled “CCS Online Thesis Management System” that includes the collection of thesis from different students of CCS department. It was conducted to lessen the work and solve the problem of manual recording of data and information in the faculty. The system was developed to provide a secured and computerized recording of data and information. It would serve as a reference guide for individuals but most especially for the students who would make their own thesis. The general objectives of this system was to design and create a system that can be a great help to the CCS Online Thesis Management System. The researchers proposed and created a “CCS Online Thesis Management System” that secures all the thesis records and information of the author. The specific objectives are derived from the specific problems indicated above upon the study. Specifically, the study aimed to: 1.) Develop a CCS Online Thesis Management System and viewing of research study for College of Computer Studies 2.) Determine the acceptability of CCS Online Thesis Management System in terms of; Usability, Functionality, Reliability, Maintainability, Portability 3.) Determining a system that could provide a systematic and online viewing of research study. In the development of the proposed system, the researchers decided to use PHP as the main programming language mainly because it could perform functions needed by the proponents for the development of the Web-Based. When it comes to the designing and editing of the pictures that we utilized in the software, Adobe Photoshop CS6 was used because for editorial purposes to provide quality pictures with different effects. The researchers also used Heidi SQL database to store the data that would input into the proposed system. Windows 8.1 pro was the platform used in developing the software. For implementation of the proposed system, the researchers required that the hardware processor must have at least a dual core processor (Intel Pentium Dual core or AMD equivalent) or higher to improve the performance. For the software requirements, it is recommend to install the system on a desktop running on Microsoft Windows 7 or higher. A browser with HTML5 compatibility (latest version of Google Chrome/Mozilla Firefox is recommended). The researchers used descriptive method of research by doing an interview and survey questionnaire since the present library system of LSPU is the subject of the design. They applied the Input-Process-Output (IPO) model in enhancing the required information. Inputs represent the data, process the task that is needed to change input to output and output is the outcome of the data that undergo the process. CCS Online Thesis Management System had eight (8) respondents which came from one (1) IT experts and seven (7) students of Laguna State Polytechnic University-Santa Cruz Main Campus. The findings of the study revealed that the perceptions of the respondents on the system are as follows: the system was usable, effectively functional, the system can fix handle error, the system was reliable and portable. The overall performance of the CCS Online Thesis Management System was acceptable as reflected by the weighted mean of 4.81. CCS Online Thesis Management System proved that it makes the documents more accessible, reliable and serve as a back-up copy for the thesis project. The programming tools used are appropriate in developing the CCS Online Thesis Management System that gives the ability to manage and monitor the used of information. The study proved that the system was acceptable to the school, faculty, and students as well in terms of system usability, system functionality, system reliability system maintainability and system portability. Based on the conclusions, the researchers recommended that the future researchers may use this study as reference guide in the development of their studies. They may upgrade this system by adding and changing features for further enhancements. Since the respondents perceived that the system was usable, presentable, and user-friendly, secured and can minimize errors, it was intended to be used by LSPU-CCS Library respectively so as to answer the needs of every students in doing their research.','2016-02-01',NULL,'College of Computer Studies'),
(2,'Pumpkin Wanton Wrapper','Armenta, Jhoann F., Mira, Princess Joy C.','','2022-07-01',NULL,'College of Business Administration and Accountancy'),
(3,'Effectiveness of Financial Management Among BSOA Student at Laguna State Polytechnic University Santa Cruz Main Campus','Reginaldo, Princess Ruth Naomi R., San Miguel, Mark Angelo G.','','2023-01-01',NULL,'College of Business Administration and Accountancy'),
(4,'A Phenomenological Study Mental Health Consciousness of Frontliners Amidst of Covid 19 Outbreak','Juarez, Regine A., Manaman, Jazmine Joyce J.','','2021-06-01',NULL,'College of Arts and Sciences'),
(5,'The Effects of Hunger on Mental Ability of Grade 11 Students in Magdalena Integrated National High School','De Jesus, Kyla Yanson, Perla, Claire Batitis','','2018-04-01',NULL,'College of Arts and Sciences'),
(6,'Moral Development Implication Among Selected Children with Autism in Cabuyao Central School, School Year 2018-2019','Coria, Heaven Alexis B., De Jesus, Arcelle A., Tec, Jessa Sharrin G.','','2018-04-01',NULL,'College of Arts and Sciences'),
(7,'Compost Coffee Grounds as Nutrient Source in Aquaponics Its Impact on the Growth and Development of Leafy Vegetables Mustard Green, Pechay and Lettuce and Tilapia','Asendido, Dahlia V., Inoceno, Mark Andrei L.','','2019-05-01',NULL,'College of Arts and Sciences'),
(8,'Guidance and Counseling Services on Career Orientation of Grade 10 Students in SCINHS','Malapaya, Cielo Marie D., Zorilla, Kathlene D.','','2018-04-01',NULL,'College of Arts and Sciences'),
(9,'Pancit Chami','Ibay, Camille Joy P.','','2018-04-01',NULL,'College of Business Administration and Accountancy'),
(10,'Sleep Deprivation It\'s Relationship to the Cognitive Ability of the Students of Banahaw Institute before Taking Examination','Nono, Pam Angel A., Umali, Regie Dianne S.','','2018-05-01',NULL,'College of Arts and Sciences'),
(11,'Family Structure It\'s Effect on the Personality Factor of Senior High School Students at Laguna State Polytechnic University','Espiritu, Elioenai D., Estravo, Joven V.','This study determined the difference in the level of academic potential/achievement across five populations of freshmen during an academic school year at Iowa State University. It examined students whose parents\' highest education was: (1) high school diploma, (2) one or two years of college, (3) two-year associate or technical degree, (4) four-year degree, and (5) graduate or professional degree. Other factors that might impinge on student academic achievement are: poverty, socioeconomic status, and family structure/or marital status. The study investigated whether students whose parents attained higher levels of education beyond the high school diploma were more successful academically than students whose parents did not. Eleven factors were used to analyze the relationship between parent educational level, and student academic achievement and performance. The findings of the study indicated that parent educational level, family structure/marital status, and income range have a positive influence on their student\'s academic potential and achievement. Students whose parents had higher educational levels performed higher on standardized tests than parents with lower educational levels. The results from this research showed that socioeconomic factors weigh heavily on the potential and academic achievement of first-time freshmen at Iowa State University.','2019-05-01',NULL,'College of Arts and Sciences');

/*Table structure for table `dept` */

DROP TABLE IF EXISTS `dept`;

CREATE TABLE `dept` (
  `id` int(2) NOT NULL AUTO_INCREMENT,
  `dept_code` varchar(5) NOT NULL,
  `dept_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `dept` */

insert  into `dept`(`id`,`dept_code`,`dept_name`) values 
(1,'ccs','College of Computer Studies'),
(2,'cas','College of Arts and Sciences'),
(3,'cte','College of Teacher Education'),
(4,'cbaa','College of Business Administration and Accounting'),
(5,'chmt','College of Hospitality Management and Tourism'),
(6,'conah','College of Nursing and Allied Health'),
(7,'cit','College of Industrial Technology'),
(8,'coe','College of Engineering'),
(9,'shs','Senior High School');

/*Table structure for table `genres` */

DROP TABLE IF EXISTS `genres`;

CREATE TABLE `genres` (
  `genre_id` int(2) NOT NULL AUTO_INCREMENT,
  `genre_desc` varchar(50) NOT NULL,
  PRIMARY KEY (`genre_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `genres` */

insert  into `genres`(`genre_id`,`genre_desc`) values 
(1,'Biology'),
(2,'History'),
(3,'Fiction'),
(4,'Chemistry'),
(5,'Physics');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
