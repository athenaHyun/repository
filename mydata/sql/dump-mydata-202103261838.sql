-- MySQL dump 10.13  Distrib 5.5.62, for Win64 (AMD64)
--
-- Host: 192.168.0.59    Database: mydata
-- ------------------------------------------------------
-- Server version	8.0.23-0ubuntu0.20.04.1

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
-- Table structure for table `access_token`
--

DROP TABLE IF EXISTS `access_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `access_token` (
  `organization_code` varchar(255) DEFAULT NULL,
  `client_id` varchar(255) NOT NULL,
  `client_secret` varchar(255) DEFAULT NULL,
  `access_token` varchar(255) DEFAULT NULL,
  `refresh_token` varchar(255) DEFAULT NULL,
  `access_yn` varchar(1) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `access_token`
--

LOCK TABLES `access_token` WRITE;
/*!40000 ALTER TABLE `access_token` DISABLE KEYS */;
INSERT INTO `access_token` VALUES (NULL,'saint@gstim.com','$2a$10$UVuvT6VfHn3ksv4RqLQx3OeaVLUL2KfWuF3oQ3k.4dL1sFrfqad9e','eyJhbGciOiJIUzUxMiJ9.eyJleHAiOjE2MTI0MTk0MjgsImlhdCI6MTYxMjMzMzAyOCwianRpIjoic2FpbnRAZ3N0aW0uY29tIn0.6W_jJ5kaUGl_eeMaRtWWohISLHNg3J_53s7BedVr3hQvptiTEhnTATkTN09kCTKnuVp5M_KKjZv2xolOFcaArw','eyJhbGciOiJIUzUxMiJ9.eyJleHAiOjE2MTI0MTk0MjgsImlhdCI6MTYxMjMzMzAyOCwianRpIjoic2FpbnRAZ3N0aW0uY29tIn0.A9NXb6Np4MUZg52bF6i_HwtvDmrs2OAFwULzfWjeDK1YwwuLCwrdGR5gf0mVJOgpSdmedCMDfVAvx2GD15LUHA','Y','2021-02-03 15:17:08',NULL),(NULL,'saint2@gstim.com','$2a$10$oWGDmo4K5o4ijjembrEC0Olzt19v7yhie6DNiViNA5V6ppa.lav6C','eyJhbGciOiJIUzUxMiJ9.eyJleHAiOjE2MTI0MjMxNTEsImlhdCI6MTYxMjMzNjc1MSwianRpIjoic2FpbnQyQGdzdGltLmNvbSJ9.ouIddUNLE2Tpmfei5VFnjUMfYGFrZW--_mynAPeZ0PLJpM6y5TLkoICFsXHUuMnd2fKnE85r-HvdD7cHkWU89g','eyJhbGciOiJIUzUxMiJ9.eyJleHAiOjE2MTI0MjMxNTEsImlhdCI6MTYxMjMzNjc1MSwianRpIjoic2FpbnQyQGdzdGltLmNvbSJ9.jkesz2smSxbVgpsRTTyFwUKTfjqhFSdkAeeu3hk0nNB35RJo6BMdAM24QKzmAKnSwRKyORgu6n2UNMSwaaOZ5Q','Y','2021-02-03 16:02:48','2021-02-03 16:19:12'),(NULL,'test@gsitm.com','$2a$10$pqkM5PhjXwca4QMuzzeahuoIZ.PMDzAsOOO.mSoI9KIy3dwEAly56','eyJhbGciOiJIUzUxMiJ9.eyJleHAiOjE2MTY2NTYyNTIsImlhdCI6MTYxNjY1MjY1MiwianRpIjoidGVzdEBnc2l0bS5jb20ifQ._7OZy10VYjffUJLH_7AYsPBSQXF0tFrAz34WvFrBJR52hp8Q-gCcHbotncC6z9gJUtb1wqTak0l_J7bb9BazEg','eyJhbGciOiJIUzUxMiJ9.eyJleHAiOjE2MTY2NTYyNTIsImlhdCI6MTYxNjY1MjY1MiwianRpIjoidGVzdEBnc2l0bS5jb20ifQ.4QqbWg6n67ePgAM7Qzmpsy3pehsIH3YlgDnJ7KLoE-kxz3yaAE5n8ZHMUdKPfOMb9eDkBjJoCkImx4pVhbRGcg','Y','2021-02-08 16:06:20','2021-03-25 15:10:52');
/*!40000 ALTER TABLE `access_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api`
--

DROP TABLE IF EXISTS `api`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `api` (
  `api_id` int NOT NULL AUTO_INCREMENT,
  `org_code` varchar(7) DEFAULT NULL,
  `api_uri` varchar(255) DEFAULT NULL,
  `api_type_code` varchar(4) DEFAULT NULL,
  `type_name` varchar(100) DEFAULT NULL,
  `method` varchar(255) DEFAULT NULL,
  `min_version` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `version` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`api_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api`
--

LOCK TABLES `api` WRITE;
/*!40000 ALTER TABLE `api` DISABLE KEYS */;
INSERT INTO `api` VALUES (1,'A000001','/v1/insu/apis',NULL,NULL,'GET','v1','API목록 조회','v1'),(2,'A000001','/v1/insu/apis',NULL,NULL,'GET','v1','API목록 조회','v1'),(3,'A000001','/v1/insu/consents',NULL,NULL,'GET','v1','전송요구 내역 조회','v1'),(4,'A000001','/v1/insu/irps',NULL,NULL,'GET','v1','개인형 IRP 계좌 목록 조회','v1'),(5,'A000001','/v1/insu/irps/basic',NULL,NULL,'POST','v1','개인형 IRP 계좌 기본정보 조회','v1'),(6,'A000001','/v1/insu/irps/detail',NULL,NULL,'POST','v1','개인형 IRP 계좌 추가정보 조회','v1'),(7,'A000001','/v1/irps/transactions','IR0','개인형 IRP 목록','POST','v1','개인형 IRP 계좌 거래내역 조회','v1'),(8,'A000001','/v1/insu/insurances','IS01','보험정보','GET','v1','보험 목록 조회','v1'),(9,'A000001','/v1/insu/insurances/basic','IS02','보험정보','POST','v1','보험 기본정보 조회','v1'),(10,'A000001','/v1/insu/insurances/contracts','IS03','보험정보','POST','v1','보험 특약정보 조회','v1'),(11,'A000001','/v1/insu/insurances/car','IS04','보험정보','POST','v1','자동차보험 정보 조회','v1'),(12,'A000001','/v1/insu/insurances/payment','IS05','보험정보','POST','v1','보험 납입정보 조회','v1'),(13,'A000001','/v1/insu/insurances/transactions','IS06','보험정보','POST','v1','보험 거래내역 조회','v1'),(14,'A000001','/v1/insu/insurances/car/transactions','IS07','보험정보','POST','v1','자동자보험 거래내역 조회','v1'),(15,'A000001','/v1/insu/loans','IS11','대출계좌목록','GET','v1','대출상품 목록 조회','v1'),(16,'A000001','/v1/insu/loans/basic','IS12','대출계좌목록','POST','v1','대출상품 기본정보 조회','v1'),(17,'A000001','/v1/insu/loans/detail','IS13','대출계좌목록','POST','v1','대출상품 추가정보 조회','v1'),(18,'A000001','/v1/insu/loans/transactions','IS14','대출계좌목록','POST','v1','대출상품 거래내역 조회','v1');
/*!40000 ALTER TABLE `api` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_trace_log`
--

DROP TABLE IF EXISTS `api_trace_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `api_trace_log` (
  `api_trace_log_id` bigint NOT NULL AUTO_INCREMENT,
  `year` varchar(4) NOT NULL,
  `month` varchar(2) NOT NULL,
  `day` varchar(2) NOT NULL,
  `hour` varchar(2) NOT NULL,
  `remote_address` varchar(16) DEFAULT NULL,
  `remote_host` varchar(64) DEFAULT NULL,
  `remote_port` int DEFAULT NULL,
  `remote_user` varchar(64) DEFAULT NULL,
  `request_url` varchar(128) DEFAULT NULL,
  `http_method` varchar(8) DEFAULT NULL,
  `is_response` tinyint(1) DEFAULT NULL,
  `error_message` varchar(2048) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`api_trace_log_id`),
  KEY `api_trace_log_log_id_year_month_day_hour_index` (`api_trace_log_id`,`year`,`month`,`day`,`hour`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_trace_log`
--

LOCK TABLES `api_trace_log` WRITE;
/*!40000 ALTER TABLE `api_trace_log` DISABLE KEYS */;
INSERT INTO `api_trace_log` VALUES (1,'2021','03','11','02','127.0.0.1','localhost',80,NULL,'http://localhost/v1/insu/apis','GET',1,NULL,'2021-03-11 14:51:14'),(2,'2021','03','11','02','127.0.0.1','localhost',80,NULL,'http://localhost/v1/insu/apis','GET',1,NULL,'2021-03-11 14:51:28'),(3,'2021','03','11','04','127.0.0.1','localhost',80,NULL,'http://localhost/v1/insu/apis','GET',1,NULL,'2021-03-11 16:12:55'),(4,'2021','03','11','04','127.0.0.1','localhost',80,NULL,'http://localhost/v1/insu/apis','GET',1,NULL,'2021-03-11 16:13:29'),(5,'2021','03','11','05','0:0:0:0:0:0:0:1','0:0:0:0:0:0:0:1',58432,NULL,'http://localhost:8080/v1/insu/apis','GET',1,NULL,'2021-03-11 17:45:22'),(6,'2021','03','11','05','0:0:0:0:0:0:0:1','0:0:0:0:0:0:0:1',58432,NULL,'http://localhost:8080/v1/insu/apis','GET',1,NULL,'2021-03-11 17:46:07'),(7,'2021','03','11','05','0:0:0:0:0:0:0:1','0:0:0:0:0:0:0:1',58952,NULL,'http://localhost:8080/v1/insu/apis','GET',1,NULL,'2021-03-11 17:53:15'),(8,'2021','03','11','05','0:0:0:0:0:0:0:1','0:0:0:0:0:0:0:1',58952,NULL,'http://localhost:8080/v1/insu/apis','GET',1,'javassist.NotFoundException: ','2021-03-11 17:53:17'),(9,'2021','03','11','05','0:0:0:0:0:0:0:1','0:0:0:0:0:0:0:1',58994,NULL,'http://localhost:8080/v1/insu/apis','GET',0,'javassist.NotFoundException: ','2021-03-11 17:53:50'),(10,'2021','03','11','05','0:0:0:0:0:0:0:1','0:0:0:0:0:0:0:1',58994,NULL,'http://localhost:8080/v1/insu/apis','GET',0,'javassist.NotFoundException: ','2021-03-11 17:53:51'),(11,'2021','03','11','05','0:0:0:0:0:0:0:1','0:0:0:0:0:0:0:1',58994,NULL,'http://localhost:8080/v1/insu/apis','GET',0,'javassist.NotFoundException: ','2021-03-11 17:53:52'),(12,'2021','03','11','05','0:0:0:0:0:0:0:1','0:0:0:0:0:0:0:1',58994,NULL,'http://localhost:8080/v1/insu/apis','GET',0,'javassist.NotFoundException: ','2021-03-11 17:53:53'),(13,'2021','03','11','05','0:0:0:0:0:0:0:1','0:0:0:0:0:0:0:1',58994,NULL,'http://localhost:8080/v1/insu/apis','GET',0,'javassist.NotFoundException: ','2021-03-11 17:53:53'),(14,'2021','03','11','05','0:0:0:0:0:0:0:1','0:0:0:0:0:0:0:1',58994,NULL,'http://localhost:8080/v1/insu/apis','GET',1,NULL,'2021-03-11 17:54:15'),(15,'2021','03','11','06','0:0:0:0:0:0:0:1','0:0:0:0:0:0:0:1',59170,NULL,'http://localhost:8080/oauth/2.0/authorize','POST',1,NULL,'2021-03-11 18:03:32'),(16,'2021','03','11','06','0:0:0:0:0:0:0:1','0:0:0:0:0:0:0:1',59170,NULL,'http://localhost:8080/oauth/2.0/token','POST',1,NULL,'2021-03-11 18:03:41'),(17,'2021','03','11','06','0:0:0:0:0:0:0:1','0:0:0:0:0:0:0:1',59182,NULL,'http://localhost:8080/oauth/2.0/token','POST',1,NULL,'2021-03-11 18:04:53'),(18,'2021','03','11','06','0:0:0:0:0:0:0:1','0:0:0:0:0:0:0:1',59214,NULL,'http://localhost:8080/oauth/2.0/authorize','POST',1,NULL,'2021-03-11 18:06:12'),(19,'2021','03','11','06','0:0:0:0:0:0:0:1','0:0:0:0:0:0:0:1',59214,NULL,'http://localhost:8080/oauth/2.0/authorize','POST',1,NULL,'2021-03-11 18:06:13'),(20,'2021','03','11','06','0:0:0:0:0:0:0:1','0:0:0:0:0:0:0:1',59214,NULL,'http://localhost:8080/oauth/2.0/token','POST',1,NULL,'2021-03-11 18:06:21'),(21,'2021','03','11','06','0:0:0:0:0:0:0:1','0:0:0:0:0:0:0:1',59222,NULL,'http://localhost:8080/oauth/2.0/token','POST',1,NULL,'2021-03-11 18:06:35'),(22,'2021','03','16','06','0:0:0:0:0:0:0:1','0:0:0:0:0:0:0:1',55044,NULL,'http://localhost:8080/mydata-0.0.1-SNAPSHOT/v1/insu/apis','GET',1,NULL,'2021-03-16 18:56:01'),(23,'2021','03','19','01','0:0:0:0:0:0:0:1','0:0:0:0:0:0:0:1',49314,NULL,'http://localhost:8080/irps','GET',1,NULL,'2021-03-19 13:24:37'),(24,'2021','03','19','01','0:0:0:0:0:0:0:1','0:0:0:0:0:0:0:1',49314,NULL,'http://localhost:8080/irps/detail','POST',1,NULL,'2021-03-19 13:24:39'),(25,'2021','03','19','03','0:0:0:0:0:0:0:1','0:0:0:0:0:0:0:1',51243,NULL,'http://localhost:8080/v1/insu/apis','GET',1,NULL,'2021-03-19 15:03:30'),(26,'2021','03','19','03','127.0.0.1','127.0.0.1',51259,NULL,'http://localhost:8080/v1/insu/apis','GET',1,NULL,'2021-03-19 15:03:43'),(27,'2021','03','19','05','0:0:0:0:0:0:0:1','0:0:0:0:0:0:0:1',54251,NULL,'http://localhost:8080/irps/detail','POST',1,NULL,'2021-03-19 17:32:13'),(28,'2021','03','19','05','0:0:0:0:0:0:0:1','0:0:0:0:0:0:0:1',54251,NULL,'http://localhost:8080/irps/detail','POST',1,NULL,'2021-03-19 17:32:28'),(29,'2021','03','19','05','0:0:0:0:0:0:0:1','0:0:0:0:0:0:0:1',54251,NULL,'http://localhost:8080/irps/detail','POST',1,NULL,'2021-03-19 17:32:32'),(30,'2021','03','19','05','0:0:0:0:0:0:0:1','0:0:0:0:0:0:0:1',54251,NULL,'http://localhost:8080/irps/detail','POST',1,NULL,'2021-03-19 17:32:33'),(31,'2021','03','19','05','0:0:0:0:0:0:0:1','0:0:0:0:0:0:0:1',54251,NULL,'http://localhost:8080/irps/detail','POST',1,NULL,'2021-03-19 17:32:34'),(32,'2021','03','19','05','0:0:0:0:0:0:0:1','0:0:0:0:0:0:0:1',54251,NULL,'http://localhost:8080/irps/detail','POST',1,NULL,'2021-03-19 17:32:34'),(33,'2021','03','19','05','0:0:0:0:0:0:0:1','0:0:0:0:0:0:0:1',54251,NULL,'http://localhost:8080/irps/detail','POST',1,NULL,'2021-03-19 17:32:35'),(34,'2021','03','19','05','0:0:0:0:0:0:0:1','0:0:0:0:0:0:0:1',54251,NULL,'http://localhost:8080/irps/detail','POST',1,NULL,'2021-03-19 17:32:35'),(35,'2021','03','19','05','0:0:0:0:0:0:0:1','0:0:0:0:0:0:0:1',54251,NULL,'http://localhost:8080/irps/detail','POST',1,NULL,'2021-03-19 17:32:36'),(36,'2021','03','19','05','0:0:0:0:0:0:0:1','0:0:0:0:0:0:0:1',54273,NULL,'http://localhost:8080/irps/detail','POST',1,NULL,'2021-03-19 17:32:50'),(37,'2021','03','19','05','0:0:0:0:0:0:0:1','0:0:0:0:0:0:0:1',54273,NULL,'http://localhost:8080/irps','GET',1,NULL,'2021-03-19 17:32:57'),(38,'2021','03','22','09','0:0:0:0:0:0:0:1','0:0:0:0:0:0:0:1',55347,NULL,'http://localhost:8080/kauth/cusInform','GET',0,'java.lang.ClassCastException: java.lang.String cannot be cast to org.springframework.http.ResponseEntity','2021-03-22 09:45:43'),(39,'2021','03','22','09','0:0:0:0:0:0:0:1','0:0:0:0:0:0:0:1',55348,NULL,'http://localhost:8080/kauth/cusInform','GET',0,'java.lang.ClassCastException: java.lang.String cannot be cast to org.springframework.http.ResponseEntity','2021-03-22 09:45:53'),(40,'2021','03','22','09','0:0:0:0:0:0:0:1','0:0:0:0:0:0:0:1',55358,NULL,'http://localhost:8080/kauth/cusInform','GET',0,'java.lang.ClassCastException: java.lang.String cannot be cast to org.springframework.http.ResponseEntity','2021-03-22 09:47:13'),(41,'2021','03','22','09','0:0:0:0:0:0:0:1','0:0:0:0:0:0:0:1',55361,NULL,'http://localhost:8080/kauth/cusInform','GET',0,'java.lang.ClassCastException: java.lang.String cannot be cast to org.springframework.http.ResponseEntity','2021-03-22 09:48:14'),(42,'2021','03','22','09','0:0:0:0:0:0:0:1','0:0:0:0:0:0:0:1',55384,NULL,'http://localhost:8080/kauth/viewtest','GET',0,'java.lang.ClassCastException: java.lang.String cannot be cast to org.springframework.http.ResponseEntity','2021-03-22 09:49:02'),(43,'2021','03','22','09','0:0:0:0:0:0:0:1','0:0:0:0:0:0:0:1',55385,NULL,'http://localhost:8080/kauth/viewtest','GET',0,'java.lang.ClassCastException: java.lang.String cannot be cast to org.springframework.http.ResponseEntity','2021-03-22 09:49:05'),(44,'2021','03','22','09','0:0:0:0:0:0:0:1','0:0:0:0:0:0:0:1',55391,NULL,'http://localhost:8080/apiMain','GET',0,'java.lang.ClassCastException: java.lang.String cannot be cast to org.springframework.http.ResponseEntity','2021-03-22 09:50:58'),(45,'2021','03','22','09','0:0:0:0:0:0:0:1','0:0:0:0:0:0:0:1',55392,NULL,'http://localhost:8080/apiMain','GET',0,'java.lang.ClassCastException: java.lang.String cannot be cast to org.springframework.http.ResponseEntity','2021-03-22 09:51:20'),(46,'2021','03','22','09','0:0:0:0:0:0:0:1','0:0:0:0:0:0:0:1',55395,NULL,'http://localhost:8080/apiMain','GET',0,'java.lang.ClassCastException: java.lang.String cannot be cast to org.springframework.http.ResponseEntity','2021-03-22 09:51:35'),(47,'2021','03','22','09','0:0:0:0:0:0:0:1','0:0:0:0:0:0:0:1',55408,NULL,'http://localhost:8080/oauth/2.0/token','POST',1,NULL,'2021-03-22 09:56:03'),(48,'2021','03','22','09','0:0:0:0:0:0:0:1','0:0:0:0:0:0:0:1',55408,'test@gsitm.com','http://localhost:8080/insurances','GET',1,NULL,'2021-03-22 09:56:19'),(49,'2021','03','22','10','0:0:0:0:0:0:0:1','0:0:0:0:0:0:0:1',55423,NULL,'http://localhost:8080/apiMain','GET',0,'java.lang.ClassCastException: java.lang.String cannot be cast to org.springframework.http.ResponseEntity','2021-03-22 10:00:20'),(50,'2021','03','22','10','0:0:0:0:0:0:0:1','0:0:0:0:0:0:0:1',54073,NULL,'http://localhost:8080/apiMain','GET',0,'java.lang.ClassCastException: class java.lang.String cannot be cast to class org.springframework.http.ResponseEntity (java.lang.String is in module java.base of loader \'bootstrap\'; org.springframework.http.ResponseEntity is in unnamed module of loader \'app\')','2021-03-22 10:01:19'),(51,'2021','03','22','10','0:0:0:0:0:0:0:1','0:0:0:0:0:0:0:1',55445,NULL,'http://localhost:8080/apiMain','GET',0,'java.lang.ClassCastException: java.lang.String cannot be cast to org.springframework.http.ResponseEntity','2021-03-22 10:06:51'),(52,'2021','03','22','10','0:0:0:0:0:0:0:1','0:0:0:0:0:0:0:1',7396,NULL,'http://localhost:8080/v1/insu/apis','GET',1,NULL,'2021-03-22 10:11:56'),(53,'2021','03','22','10','0:0:0:0:0:0:0:1','0:0:0:0:0:0:0:1',7396,NULL,'http://localhost:8080/oauth/2.0/authorize','POST',1,NULL,'2021-03-22 10:12:09'),(54,'2021','03','22','10','0:0:0:0:0:0:0:1','0:0:0:0:0:0:0:1',7452,NULL,'http://localhost:8080/apiMain','GET',0,'java.lang.ClassCastException: class java.lang.String cannot be cast to class org.springframework.http.ResponseEntity (java.lang.String is in module java.base of loader \'bootstrap\'; org.springframework.http.ResponseEntity is in unnamed module of loader \'app\')','2021-03-22 10:15:00'),(55,'2021','03','22','10','0:0:0:0:0:0:0:1','0:0:0:0:0:0:0:1',7463,NULL,'http://localhost:8080/oauth2','GET',0,'java.lang.ClassCastException: class java.lang.String cannot be cast to class org.springframework.http.ResponseEntity (java.lang.String is in module java.base of loader \'bootstrap\'; org.springframework.http.ResponseEntity is in unnamed module of loader \'app\')','2021-03-22 10:16:09'),(56,'2021','03','22','10','0:0:0:0:0:0:0:1','0:0:0:0:0:0:0:1',7478,NULL,'http://localhost:8080/oauth/2.0/token','POST',1,NULL,'2021-03-22 10:16:26'),(57,'2021','03','22','10','0:0:0:0:0:0:0:1','0:0:0:0:0:0:0:1',7486,NULL,'http://localhost:8080/apiMain','GET',0,'java.lang.ClassCastException: class java.lang.String cannot be cast to class org.springframework.http.ResponseEntity (java.lang.String is in module java.base of loader \'bootstrap\'; org.springframework.http.ResponseEntity is in unnamed module of loader \'app\')','2021-03-22 10:17:13'),(58,'2021','03','22','10','0:0:0:0:0:0:0:1','0:0:0:0:0:0:0:1',7487,NULL,'http://localhost:8080/apiMain','GET',0,'java.lang.ClassCastException: class java.lang.String cannot be cast to class org.springframework.http.ResponseEntity (java.lang.String is in module java.base of loader \'bootstrap\'; org.springframework.http.ResponseEntity is in unnamed module of loader \'app\')','2021-03-22 10:17:35'),(59,'2021','03','22','10','0:0:0:0:0:0:0:1','0:0:0:0:0:0:0:1',7497,NULL,'http://localhost:8080/apiMain','POST',0,'java.lang.ClassCastException: class java.lang.String cannot be cast to class org.springframework.http.ResponseEntity (java.lang.String is in module java.base of loader \'bootstrap\'; org.springframework.http.ResponseEntity is in unnamed module of loader \'app\')','2021-03-22 10:18:05'),(60,'2021','03','22','10','0:0:0:0:0:0:0:1','0:0:0:0:0:0:0:1',57690,NULL,'http://localhost:8080/apiMain','GET',0,'java.lang.ClassCastException: class java.lang.String cannot be cast to class org.springframework.http.ResponseEntity (java.lang.String is in module java.base of loader \'bootstrap\'; org.springframework.http.ResponseEntity is in unnamed module of loader \'app\')','2021-03-22 10:27:10'),(61,'2021','03','22','10','0:0:0:0:0:0:0:1','0:0:0:0:0:0:0:1',57731,NULL,'http://localhost:8080/apiMain','GET',0,'java.lang.ClassCastException: class java.lang.String cannot be cast to class org.springframework.http.ResponseEntity (java.lang.String is in module java.base of loader \'bootstrap\'; org.springframework.http.ResponseEntity is in unnamed module of loader \'app\')','2021-03-22 10:28:01');
/*!40000 ALTER TABLE `api_trace_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `consent`
--

DROP TABLE IF EXISTS `consent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `consent` (
  `consent_id` int NOT NULL AUTO_INCREMENT,
  `org_code` varchar(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `service_id` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `customer_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `is_scheduled` tinyint(1) DEFAULT NULL,
  `cycle` varchar(2) DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `purpose` varchar(100) DEFAULT NULL,
  `holding_term` int DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `period` int DEFAULT NULL,
  `client_id` varchar(100) NOT NULL,
  `scope` varchar(500) DEFAULT NULL,
  `ia_num` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`consent_id`,`customer_id`,`ia_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consent`
--

LOCK TABLES `consent` WRITE;
/*!40000 ALTER TABLE `consent` DISABLE KEYS */;
INSERT INTO `consent` VALUES (1,'T012482','1','1',0,'0','2021-01-22 15:58:59','전송요구내역 테스트 목적',1,'2021-01-22 15:59:29','2021-01-22 15:59:31',NULL,'',NULL,'1'),(2,'T012482','2','1',0,'0','2021-01-22 16:00:51','전송요구내역 테스트 목적 2',2,'2021-01-22 16:01:14','2021-01-22 16:01:17',NULL,'',NULL,'1'),(3,'A000001','T012482','test@gsitm.com',1,'3M','2022-01-01 00:00:00','전송요구허가',0,'2021-03-25 11:21:37','2021-03-25 11:21:37',99,'A000001','insu.insurance','INS00004'),(4,'A000001','T012482','saint2@gsitm.com',1,'3M','2022-01-01 00:00:00','전송요구허가',0,'2021-03-25 15:47:28','2021-03-25 15:47:28',99,'A000001','insu.insurance','INS00003');
/*!40000 ALTER TABLE `consent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `consent_detail`
--

DROP TABLE IF EXISTS `consent_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `consent_detail` (
  `consent_detail_id` int NOT NULL AUTO_INCREMENT,
  `consent_id` int NOT NULL,
  `org_code` varchar(7) NOT NULL,
  `service_id` varchar(10) NOT NULL,
  `customer_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `consent_type` varchar(3) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `client_id` varchar(100) NOT NULL,
  PRIMARY KEY (`consent_detail_id`,`consent_id`,`org_code`,`service_id`,`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consent_detail`
--

LOCK TABLES `consent_detail` WRITE;
/*!40000 ALTER TABLE `consent_detail` DISABLE KEYS */;
INSERT INTO `consent_detail` VALUES (1,1,'T012482','1','1','IS0','2021-01-22 16:17:13','2021-01-22 16:17:15',''),(2,1,'T012482','1','1','IS1','2021-01-22 16:18:02','2021-01-22 16:18:03',''),(3,1,'T012482','1','1','IR0','2021-01-22 16:18:02','2021-01-22 16:18:03',''),(4,2,'T012482','2','1','IS0','2021-01-22 16:18:02','2021-01-22 16:18:03',''),(5,2,'T012482','2','1','IR0','2021-01-22 16:18:02','2021-01-22 16:18:03','');
/*!40000 ALTER TABLE `consent_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `consent_history`
--

DROP TABLE IF EXISTS `consent_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `consent_history` (
  `consent_history_id` int NOT NULL AUTO_INCREMENT,
  `consent_id` int NOT NULL,
  `org_code` varchar(7) NOT NULL,
  `service_id` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `customer_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `client_id` varchar(10) NOT NULL,
  `scope` varchar(500) NOT NULL,
  `consent_type` varchar(3) DEFAULT NULL,
  `is_scheduled` tinyint(1) DEFAULT NULL,
  `cycle` varchar(2) DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `purpose` varchar(100) DEFAULT NULL,
  `holding_term` int DEFAULT NULL,
  `period` int DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `ia_num` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `p_type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`consent_history_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consent_history`
--

LOCK TABLES `consent_history` WRITE;
/*!40000 ALTER TABLE `consent_history` DISABLE KEYS */;
INSERT INTO `consent_history` VALUES (1,3,'A000001','T012482','test@gsitm.com','A000001','insu.insurance','',1,'3M','2022-01-01 00:00:00','전송요구허가',0,99,'2021-03-25 11:21:37','2021-03-25 11:21:37','INS00004',NULL),(2,4,'A000001','T012482','saint2@gsitm.com','A000001','insu.insurance','',1,'3M','2022-01-01 00:00:00','전송요구허가',0,99,'2021-03-25 15:47:28','2021-03-25 15:47:28','INS00003',NULL),(3,5,'A000001',NULL,'saint@gstim.com','A000001','insu.insurance','',1,'3M','2022-03-26 14:47:16','전송요구허가',0,99,'2021-03-26 14:09:24','2021-03-26 14:09:24','INS00001',NULL);
/*!40000 ALTER TABLE `consent_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `credential`
--

DROP TABLE IF EXISTS `credential`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `credential` (
  `credential_id` int NOT NULL AUTO_INCREMENT,
  `org_code` varchar(7) NOT NULL,
  `name` varchar(100) NOT NULL,
  `type_id` int NOT NULL,
  `client_id` varchar(100) NOT NULL,
  `client_secret` varchar(100) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`credential_id`,`org_code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `credential`
--

LOCK TABLES `credential` WRITE;
/*!40000 ALTER TABLE `credential` DISABLE KEYS */;
INSERT INTO `credential` VALUES (1,'A000001','종합포털 접근을 위한 자격검증',0,'client_id_3a23f3280d1ad82b','client_secret_d4d2f4d2a2b7bc','2021-02-02 17:31:38','2021-02-02 17:31:38');
/*!40000 ALTER TABLE `credential` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hibernate_sequence`
--

DROP TABLE IF EXISTS `hibernate_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hibernate_sequence` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hibernate_sequence`
--

LOCK TABLES `hibernate_sequence` WRITE;
/*!40000 ALTER TABLE `hibernate_sequence` DISABLE KEYS */;
INSERT INTO `hibernate_sequence` VALUES (15);
/*!40000 ALTER TABLE `hibernate_sequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `insu_basic`
--

DROP TABLE IF EXISTS `insu_basic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `insu_basic` (
  `id` int NOT NULL,
  `is_renewable` tinyint(1) NOT NULL DEFAULT '0' COMMENT '갱신여부 (여부)',
  `issue_date` date NOT NULL COMMENT '계약체결일',
  `exp_date` date NOT NULL COMMENT '만기일자',
  `face_amt` float NOT NULL COMMENT '보험가입금액',
  `currency_code` varchar(3) DEFAULT NULL COMMENT '통화코드(보험가입금액)',
  `is_variable` tinyint(1) NOT NULL DEFAULT '0' COMMENT '변액보험 여부',
  `is_universal` tinyint(1) NOT NULL DEFAULT '0' COMMENT '유니버셜 여부',
  `pension_rcv_start_date` date DEFAULT NULL COMMENT '연금개시일',
  `pension_rcv_cycle` varchar(2) DEFAULT NULL COMMENT '연금수령주기',
  `is_loanable` tinyint(1) NOT NULL DEFAULT '0' COMMENT '대출실행가능 상품여부',
  `insured_count` varchar(2) NOT NULL COMMENT '피보험자수',
  `insured_list` blob NOT NULL COMMENT '피보험자목록',
  `insured_no` varchar(2) DEFAULT NULL COMMENT '피보험자 순번',
  `insured_name` varchar(20) DEFAULT NULL COMMENT '피보험자명',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `insu_basic`
--

LOCK TABLES `insu_basic` WRITE;
/*!40000 ALTER TABLE `insu_basic` DISABLE KEYS */;
INSERT INTO `insu_basic` VALUES (1,0,'2021-01-19','2021-01-31',10000,'',0,0,'2021-01-19','1M',0,'2','홍길동\r\n이순신',NULL,NULL),(2,0,'2021-01-20','2021-01-25',30000,NULL,0,0,'2021-01-18','3M',0,'3','김철수\r\n김아무개\r\n홍아무개\r\n',NULL,NULL);
/*!40000 ALTER TABLE `insu_basic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `insu_basic2`
--

DROP TABLE IF EXISTS `insu_basic2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `insu_basic2` (
  `id` int NOT NULL AUTO_INCREMENT,
  `currency_code` varchar(255) DEFAULT NULL,
  `exp_date` varchar(255) DEFAULT NULL,
  `face_amt` varchar(255) DEFAULT NULL,
  `insured_count` varchar(255) DEFAULT NULL,
  `insured_list` varchar(255) DEFAULT NULL,
  `is_loanable` varchar(255) DEFAULT NULL,
  `is_renewable` varchar(255) DEFAULT NULL,
  `is_universal` varchar(255) DEFAULT NULL,
  `is_variable` varchar(255) DEFAULT NULL,
  `issue_date` varchar(255) DEFAULT NULL,
  `pension_rcv_cycle` varchar(255) DEFAULT NULL,
  `pension_rcv_start_date` varchar(255) DEFAULT NULL,
  `id2` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `insu_basic2`
--

LOCK TABLES `insu_basic2` WRITE;
/*!40000 ALTER TABLE `insu_basic2` DISABLE KEYS */;
/*!40000 ALTER TABLE `insu_basic2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `insu_basica`
--

DROP TABLE IF EXISTS `insu_basica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `insu_basica` (
  `client_id` varchar(100) NOT NULL COMMENT '클라이언트ID',
  `org_code` varchar(100) NOT NULL COMMENT '기관코드',
  `insu_num` varchar(100) NOT NULL COMMENT '증권번호',
  `prod_name` varchar(255) DEFAULT NULL COMMENT '상품명',
  `insu_type` varchar(255) DEFAULT NULL COMMENT '보험종류 구분(코드)',
  `insu_status` varchar(255) DEFAULT NULL COMMENT '계약상태(코드)',
  `is_renewable` tinyint(1) DEFAULT NULL COMMENT '갱신여부(여부)',
  `issue_date` date DEFAULT NULL COMMENT '계약체결일',
  `exp_date` date DEFAULT NULL COMMENT '만기일자',
  `face_amt` float DEFAULT NULL COMMENT '보험가입금액',
  `currency_code` varchar(255) DEFAULT NULL COMMENT '통화코드(보험가입금액)',
  `is_variable` tinyint(1) DEFAULT NULL COMMENT '변액보험여부',
  `is_universal` tinyint(1) DEFAULT NULL COMMENT '유니버셜여부',
  `pension_rcv_start_date` date DEFAULT NULL COMMENT '연금개시일',
  `pension_rcv_cycle` varchar(255) DEFAULT NULL COMMENT '연금수령주기',
  `is_loanable` tinyint(1) DEFAULT NULL COMMENT '대출실행가능상품여부',
  PRIMARY KEY (`insu_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `insu_basica`
--

LOCK TABLES `insu_basica` WRITE;
/*!40000 ALTER TABLE `insu_basica` DISABLE KEYS */;
INSERT INTO `insu_basica` VALUES ('1','1','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('saint@gstim.com','A000001','INS00001','ㅁㅁㅁ보험1','05','02',0,'2020-01-20','2090-01-20',40000000,'KRW',0,0,NULL,'',0),('saint@gstim.com','A000001','INS00002','ㅇㅇㅇ보험1','08','02',0,'2020-01-20','2090-01-20',40000000,'KRW',0,0,NULL,'',0),('saint2@gstim.com','A000001','INS00003','XXX보험1','04','02',0,'2020-01-20','2090-01-20',40000000,'KRW',0,0,NULL,'',0),('test@gsitm.com','A000001','INS00004','ㅁㅁㅁ보험2','06','02',0,'2020-01-20','2090-01-20',40000000,'KRW',0,0,NULL,'',0),('saint2@gstim.com','A000001','INS00005','ㅇㅇㅇ보험2','05','02',0,'2020-01-20','2090-01-20',40000000,'KRW',0,0,NULL,'',0),('saint@gstim.com','A000001','INS00006','XXX보험2','16','02',0,'2020-01-20','2090-01-20',40000000,'KRW',0,0,NULL,'',0),('test@gsitm.com','A000001','INS00007',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('test@gsitm.com','A000001','INS00008',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('test@gsitm.com','A000001','INS00010',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('test@gsitm.com','A000001','INS00011',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('99','A000001','INS00020',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('123@aaa.com','A00002','INS01000',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `insu_basica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `insu_car_type_code`
--

DROP TABLE IF EXISTS `insu_car_type_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `insu_car_type_code` (
  `insu_car_type` varchar(2) NOT NULL,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`insu_car_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `insu_car_type_code`
--

LOCK TABLES `insu_car_type_code` WRITE;
/*!40000 ALTER TABLE `insu_car_type_code` DISABLE KEYS */;
INSERT INTO `insu_car_type_code` VALUES ('01','자동차손해배상책임보험'),('02','자동차종합보험'),('03','자동차자손보험'),('04','운전자보험'),('05','자동차대인배상정액보험/자동차 유한보험'),('06','자가운전자동차종합보험'),('07','통합계약'),('09','개인면허사업용자동차종합보험'),('11','개인용자동차보험'),('12','업무용자동차보험'),('13','영업용자동차보험'),('18','이륜자동차보험'),('19','농기계보험'),('20','플러스개인용자동차보험'),('21','플러스업무용자동차보험');
/*!40000 ALTER TABLE `insu_car_type_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `insu_contract`
--

DROP TABLE IF EXISTS `insu_contract`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `insu_contract` (
  `client_id` varchar(100) NOT NULL COMMENT '클라이언트ID',
  `org_code` varchar(100) NOT NULL COMMENT '기관코드',
  `insu_num` varchar(100) NOT NULL COMMENT '증권번호',
  `insured_no` varchar(100) NOT NULL COMMENT '피보험자 순번',
  `insured_name` varchar(255) DEFAULT NULL COMMENT '피보험자명',
  `contract_name` varchar(255) DEFAULT NULL COMMENT '특약명',
  `contract_status` varchar(255) DEFAULT NULL COMMENT '특약상태 (코드)',
  `contract_exp_date` date DEFAULT NULL COMMENT '특약만기일자',
  `contract_face_amt` float DEFAULT NULL COMMENT '특약가입금액',
  `currency_code` varchar(255) DEFAULT NULL COMMENT '통화코드(특약가입금액)',
  `is_required` tinyint(1) DEFAULT NULL COMMENT '특약유형(여부)',
  PRIMARY KEY (`insu_num`,`insured_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `insu_contract`
--

LOCK TABLES `insu_contract` WRITE;
/*!40000 ALTER TABLE `insu_contract` DISABLE KEYS */;
INSERT INTO `insu_contract` VALUES ('saint@gstim.com','A000001','INS00001','01','김아무개','특약1','02','2090-01-20',2000000,'KRW',0),('saint@gstim.com','A000001','INS00001','02','이아무개','특약1','02','2090-01-20',2000000,'KRW',0),('saint@gstim.com','A000001','INS00002','01','김아무개','특약1','02','2090-01-20',2000000,'KRW',0),('saint2@gstim.com','A000001','INS00003','01','오아무개','특약1','02','2090-01-20',2000000,'KRW',0),('saint2@gstim.com','A000001','INS00005','01','오아무개','특약1','02','2090-01-20',2000000,'KRW',0),('saint@gstim.com','A000001','INS00006','01','박아무개','특약1','02','2090-01-20',2000000,'KRW',0);
/*!40000 ALTER TABLE `insu_contract` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `insu_type_code`
--

DROP TABLE IF EXISTS `insu_type_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `insu_type_code` (
  `insu_type` varchar(2) NOT NULL,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`insu_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `insu_type_code`
--

LOCK TABLES `insu_type_code` WRITE;
/*!40000 ALTER TABLE `insu_type_code` DISABLE KEYS */;
INSERT INTO `insu_type_code` VALUES ('01','종신보험'),('02','정기보험'),('03','질병(건강)보험'),('04','상해보험'),('05','암보험'),('06','간병(요양)보험'),('07','어린이보험'),('08','치아보험'),('09','연금저축보험'),('10','연금보험'),('11','저축보험(양로보험포함)'),('12','교육보험'),('13','운전자보험'),('14','여행자보험'),('15','골프보험'),('16','실손의료보험'),('17','자동자보험'),('18','화재/재물보험'),('19','배상책임보험'),('20','보증(신용)보험'),('21','펫보험'),('22','종합보장보험'),('99','기타보험');
/*!40000 ALTER TABLE `insu_type_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `insurance`
--

DROP TABLE IF EXISTS `insurance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `insurance` (
  `insu_num` varchar(20) NOT NULL,
  `is_consent` varchar(10) DEFAULT NULL,
  `prod_name` varchar(200) DEFAULT NULL,
  `insu_type` varchar(2) DEFAULT NULL,
  `insu_status` varchar(2) DEFAULT NULL,
  `org_code` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`insu_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `insurance`
--

LOCK TABLES `insurance` WRITE;
/*!40000 ALTER TABLE `insurance` DISABLE KEYS */;
INSERT INTO `insurance` VALUES ('1','true','보험명1','01','02','A000001'),('10','true','보험명10','05','02','A000001'),('2','true','보험명2','02','02','A000001'),('3','true','보험명3','03','02','A000001'),('4','true','보험명4','04','02','A000001'),('5','true','보험명5','05','02','A000001'),('6','true','보험명6','01','02','A000001'),('7','true','보험명7','02','02','A000001'),('8','true','보험명8','03','02','A000001'),('9','true','보험명9','04','02','A000001');
/*!40000 ALTER TABLE `insurance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `irps_basic`
--

DROP TABLE IF EXISTS `irps_basic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `irps_basic` (
  `client_id` varchar(100) NOT NULL COMMENT '클라이언트ID',
  `org_code` varchar(100) NOT NULL COMMENT '기관코드',
  `account_num` varchar(100) NOT NULL COMMENT '계좌번호',
  `seqno` varchar(100) DEFAULT NULL COMMENT '회차번호',
  `prod_name` varchar(255) DEFAULT NULL COMMENT '상품명',
  `account_status` varchar(255) DEFAULT NULL COMMENT '계좌번호 별 상태 코드',
  `accum_amt` float DEFAULT NULL COMMENT '적립금액',
  `eval_amt` float DEFAULT NULL COMMENT '계좌평가금액',
  `employer_amt` float DEFAULT NULL COMMENT '사용자부담금',
  `employee_amt` float DEFAULT NULL COMMENT '가입자부당금',
  `issue_date` date DEFAULT NULL COMMENT '개설일',
  `first_deposit_date` date DEFAULT NULL COMMENT '최초입금일',
  PRIMARY KEY (`account_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `irps_basic`
--

LOCK TABLES `irps_basic` WRITE;
/*!40000 ALTER TABLE `irps_basic` DISABLE KEYS */;
INSERT INTO `irps_basic` VALUES ('saint@gstim.com','A000001','IRP00001','','ㅁㅁㅁIRP계약1','4001',20000000,20000000,10000000,10000000,'2020-01-20','2020-01-10'),('saint2@gstim.com','A000001','IRP00002','','ㅇㅇㅇIRP계약1','4001',20000000,20000000,10000000,10000000,'2020-02-20','2020-02-10'),('saint@gstim.com','A000001','IRP00003','','xxxIRP계약1','4001',20000000,20000000,10000000,10000000,'2020-05-20','2020-05-10');
/*!40000 ALTER TABLE `irps_basic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `irps_detail`
--

DROP TABLE IF EXISTS `irps_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `irps_detail` (
  `client_id` varchar(100) NOT NULL COMMENT '클라이언트ID',
  `org_code` varchar(100) NOT NULL COMMENT '기관코드',
  `account_num` varchar(100) NOT NULL COMMENT '계좌번호',
  `seqno` varchar(100) DEFAULT NULL COMMENT '회차번호',
  `irp_name` varchar(255) DEFAULT NULL COMMENT '개별운용상품명',
  `irp_type` varchar(255) DEFAULT NULL COMMENT '상품유형 (코드)',
  `eval_amt` float DEFAULT NULL COMMENT '평가금액',
  `inv_principal` float DEFAULT NULL COMMENT '투자원금',
  `fund_num` int DEFAULT NULL COMMENT '보유좌수',
  `open_date` date DEFAULT NULL COMMENT '신규일',
  `exp_date` date DEFAULT NULL COMMENT '만기일',
  `int_rate` float DEFAULT NULL COMMENT '약정이자율(정기예금용)',
  PRIMARY KEY (`account_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `irps_detail`
--

LOCK TABLES `irps_detail` WRITE;
/*!40000 ALTER TABLE `irps_detail` DISABLE KEYS */;
INSERT INTO `irps_detail` VALUES ('saint@gstim.com','A000001','IRP00001','','ㅁㅁㅁIRP계약운용1','01',10000000,20000000,1,'2020-01-10',NULL,1.5),('saint2@gstim.com','A000001','IRP00002','','ㅇㅇㅇIRP계약운용1','01',10000000,20000000,1,'2020-01-10',NULL,1.5),('saint@gstim.com','A000001','IRP00003','','xxxIRP계약운용1','01',10000000,20000000,1,'2020-01-10',NULL,2);
/*!40000 ALTER TABLE `irps_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loans_basic`
--

DROP TABLE IF EXISTS `loans_basic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `loans_basic` (
  `client_id` varchar(100) NOT NULL COMMENT '클라이언트ID',
  `org_code` varchar(100) NOT NULL COMMENT '기관코드',
  `account_num` varchar(100) NOT NULL COMMENT '계좌번호',
  `prod_name` varchar(255) DEFAULT NULL COMMENT '상품명',
  `account_type` varchar(255) DEFAULT NULL COMMENT '계좌번호 별 구분 코드',
  `account_status` varchar(255) DEFAULT NULL COMMENT '계좌번호 별 상태 코드',
  `loan_start_date` date DEFAULT NULL COMMENT '대출일',
  `loan_exp_date` date DEFAULT NULL COMMENT '만기일',
  `repay_method` varchar(255) DEFAULT NULL COMMENT '상환방식 (코드)',
  `insu_num` varchar(100) DEFAULT NULL COMMENT '증권번호',
  PRIMARY KEY (`account_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loans_basic`
--

LOCK TABLES `loans_basic` WRITE;
/*!40000 ALTER TABLE `loans_basic` DISABLE KEYS */;
INSERT INTO `loans_basic` VALUES ('saint@gstim.com','A000001','ACC00001','ㅁㅁㅁ대출1','3400','01','2020-01-25','2021-05-25','01','INS00001'),('saint2@gstim.com','A000001','ACC00002','ㅇㅇㅇ대출1','3400','01','2020-02-25','2021-06-25','01','INS00005'),('saint@gstim.com','A000001','ACC00003','xxx대출1','3400','01','2020-04-25','2021-08-25','01','INS00002'),('test@gsitm.com','A000001','ACC00005',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `loans_basic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loans_detail`
--

DROP TABLE IF EXISTS `loans_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `loans_detail` (
  `client_id` varchar(100) NOT NULL COMMENT '클라이언트ID',
  `org_code` varchar(100) NOT NULL COMMENT '기관코드',
  `account_num` varchar(100) NOT NULL COMMENT '계좌번호',
  `currency_code` varchar(255) DEFAULT NULL COMMENT '통화코드',
  `balance_amt` float DEFAULT NULL COMMENT '대출잔액',
  `loan_principal` float DEFAULT NULL COMMENT '대출원금',
  `next_repay_date` date DEFAULT NULL COMMENT '다음 이자 상환일',
  PRIMARY KEY (`account_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loans_detail`
--

LOCK TABLES `loans_detail` WRITE;
/*!40000 ALTER TABLE `loans_detail` DISABLE KEYS */;
INSERT INTO `loans_detail` VALUES ('saint@gstim.com','A000001','ACC00001','KRW',10000000,20000000,'2021-05-25'),('saint2@gstim.com','A000001','ACC00002','KRW',10000000,20000000,'2021-06-25'),('saint@gstim.com','A000001','ACC00003','KRW',10000000,20000000,'2021-08-25');
/*!40000 ALTER TABLE `loans_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `member` (
  `client_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `client_secret` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `organization_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `authorize_code` varchar(255) DEFAULT NULL,
  `timestamp` varbinary(100) DEFAULT NULL,
  `member_id` bigint DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`client_id`),
  UNIQUE KEY `UK_mbmcqelty0fbrvxp1q58dn57t` (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES ('111@111.com','','','','',0,'',''),('222@222.com','','','','',0,'',''),('23','','','','',0,'',''),('333@333.com','','','','',0,'',''),('3333333','','','','',0,'',''),('55','','','','',0,'',''),('66','','','','',0,'',''),('77','','','','',0,'',''),('99','','','','',0,'',''),('saint@gstim.com','$2a$10$Ru/WOVI.5vjZ1e2zx8FrjuP/fBn8lNDZ1A9jVszLLe5zeM.HoPbc6','12','Basic c2FpbnRAZ3N0aW0uY29tOm1pcmFlYXNzZXRNeWRhdGFTZWNyZXRLZXk=',NULL,NULL,NULL,NULL),('saint2@gstim.com','$2a$10$J2npB8J0ARh/eV7Fr3hxWOrjxNkqleZ3D/H04LAJDMbuElpxt331e','12','Basic c2FpbnQyQGdzdGltLmNvbTptaXJhZWFzc2V0TXlkYXRhU2VjcmV0S2V5',NULL,NULL,NULL,NULL),('test@gsitm.com','$2a$10$JFMN4jT2Eb/GrLtpyF/0bejYEB.ukDj2CbfFJZChiDRbQ86xBTuxu',NULL,'Basic dGVzdEBnc2l0bS5jb206bWlyYWVhc3NldE15ZGF0YVNlY3JldEtleQ==',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member_detail`
--

DROP TABLE IF EXISTS `member_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `member_detail` (
  `birth` varchar(10) DEFAULT NULL,
  `name` varchar(10) DEFAULT NULL,
  `hp` varchar(50) DEFAULT NULL,
  `client_id` varchar(255) NOT NULL,
  PRIMARY KEY (`client_id`),
  CONSTRAINT `member_detail_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `member` (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member_detail`
--

LOCK TABLES `member_detail` WRITE;
/*!40000 ALTER TABLE `member_detail` DISABLE KEYS */;
INSERT INTO `member_detail` VALUES ('22','22','22','222@222.com'),('','',NULL,'23'),('33','33','33','333@333.com'),('','',NULL,'3333333'),('','',NULL,'55'),('','',NULL,'66'),('','',NULL,'77'),('','',NULL,'99'),('19880316','유아무개','01011112222','saint@gstim.com'),('19831001','임아무개','01013334444','saint2@gstim.com'),('19850731','박아무개','01015556666','test@gsitm.com');
/*!40000 ALTER TABLE `member_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organization_info`
--

DROP TABLE IF EXISTS `organization_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `organization_info` (
  `org_code` varchar(7) NOT NULL,
  `org_name` varchar(50) DEFAULT NULL,
  `org_type` varchar(2) DEFAULT NULL,
  `org_regno` varchar(30) DEFAULT NULL,
  `corp_regno` varchar(30) DEFAULT NULL,
  `address` varchar(30) DEFAULT NULL,
  `domain` varchar(50) DEFAULT NULL,
  `is_system_owner` tinyint(1) DEFAULT '0',
  `relay_org_code` varchar(7) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`org_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organization_info`
--

LOCK TABLES `organization_info` WRITE;
/*!40000 ALTER TABLE `organization_info` DISABLE KEYS */;
INSERT INTO `organization_info` VALUES ('A000001','마이데이터 보유자','01','0000000000','0000000000000','테스트시 테스트구 테스트길 12','www.mydata_service_test.com',1,'','2021-02-03 13:50:29','2021-02-03 13:50:29'),('T012482','마이데이터서비스기관_01','03','0000000000','0000000000000','테스트시 테스트구 테스트길 12','www.mydata_service_test.com',0,'','2021-02-03 13:50:29','2021-02-03 13:50:29');
/*!40000 ALTER TABLE `organization_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pay_code`
--

DROP TABLE IF EXISTS `pay_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pay_code` (
  `pay_method` varchar(2) NOT NULL,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`pay_method`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pay_code`
--

LOCK TABLES `pay_code` WRITE;
/*!40000 ALTER TABLE `pay_code` DISABLE KEYS */;
INSERT INTO `pay_code` VALUES ('01','만기일시상환'),('02','원금균등분할상환'),('03','거치식-원금균등분할상환'),('04','원리금균등분할상환'),('05','거치식-원리금균등분할상환'),('06','만기지정상환-원금균등분할상환'),('07','만기지정상환-원리금균등분할상환'),('08','한도거래'),('09','기타(직접산정)'),('10','거치식 만기지정상환-원금균등분할상환'),('11','거치식 만기지정상환-원리금균등분할상환');
/*!40000 ALTER TABLE `pay_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_code`
--

DROP TABLE IF EXISTS `product_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_code` (
  `code` varchar(4) NOT NULL,
  `sub_code` varchar(2) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_code`
--

LOCK TABLES `product_code` WRITE;
/*!40000 ALTER TABLE `product_code` DISABLE KEYS */;
INSERT INTO `product_code` VALUES ('1001','01','자유입출식'),('1002','01','예금'),('1003','01','적금'),('1004','01','퇴직연금'),('1005','01','기타'),('2001','01','수익증권'),('2002','01','신탁'),('2003','01','ISA'),('2004','01','기타'),('3100','01','신용대출'),('3150','01','학자금대출'),('3170','01','전세자금대출'),('3200','01','예.적금담보대출'),('3210','01','유가증권담보대출'),('3220','01','주택담보대출'),('3230','01','주택외부동산담보대출'),('3240','01','지급보증담보대출'),('3245','01','보금자리론'),('3250','01','학자금(지급보증)담보대출'),('3260','01','주택연금담보대출'),('3270','01','전세자금(보증서.질권)담보대출'),('3271','01','전세보증금담보대출'),('3290','01','기타담보대출'),('3400','01','보험계약담보대출'),('3500','01','신차할부금융'),('3510','01','중고차할부금융'),('3590','01','기타할부금융'),('3700','01','금융리스'),('3710','01','운용리스'),('3999','01','채권인수전문기관보류'),('4001','01','개인형 IRP');
/*!40000 ALTER TABLE `product_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_info`
--

DROP TABLE IF EXISTS `service_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `service_info` (
  `service_id` int NOT NULL AUTO_INCREMENT,
  `org_code` varchar(7) NOT NULL,
  `service_name` varchar(20) DEFAULT NULL,
  `client_id` varchar(50) DEFAULT NULL,
  `redirect_uri` varchar(100) DEFAULT NULL,
  `client_ip_list` json DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`service_id`,`org_code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_info`
--

LOCK TABLES `service_info` WRITE;
/*!40000 ALTER TABLE `service_info` DISABLE KEYS */;
INSERT INTO `service_info` VALUES (1,'T012482','마이데이터_서비스_앱_02','mydata_service_app_id_01','http://mydata.service.app.com/','[\"127.0.0.1\", \"192.168.45.101\"]','2021-02-03 13:50:29','2021-02-03 13:50:29');
/*!40000 ALTER TABLE `service_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'mydata'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-03-26 18:38:37
