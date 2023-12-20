-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: goods
-- ------------------------------------------------------
-- Server version	8.0.28

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `customer_id` int NOT NULL AUTO_INCREMENT COMMENT '客户编号id，主键',
  `customer_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '客户名称',
  `contacts` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '联系人',
  `phone_number` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '联系人电话',
  `address` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '客户地址',
  `remarks` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`customer_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'常乐村后花园','子榇','13555555555','成都市双流区常乐村后花园','常乐村后花园稳定客户'),(2,'常乐村后花园','有钱','13777777777','成都市双流区常乐村后花园','常乐村后花园稳定客户'),(3,'常乐村后花园','很邢','13888888888','成都市双流区常乐村后花园','常乐村后花园稳定客户'),(4,'常乐村后花园','可是雪','13666666666','成都市双流区常乐村后花园','常乐村后花园稳定客户'),(5,'常乐村后花园','曾曾曾','13999999999','成都市双流区常乐村后花园','常乐村后花园稳定客户');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_return_list`
--

DROP TABLE IF EXISTS `customer_return_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_return_list` (
  `customer_return_list_id` int NOT NULL AUTO_INCREMENT COMMENT '这是系统和客户之间的退货客户退货单id，主键',
  `return_number` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '退货单号',
  `return_date` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '退货日期',
  `amount_paid` float NOT NULL COMMENT '实付金额',
  `amount_payable` float NOT NULL COMMENT '应付金额',
  `state` int DEFAULT NULL COMMENT '状态，是否付款',
  `customer_id` int DEFAULT NULL COMMENT '客户编号id，外键',
  `user_id` int DEFAULT NULL COMMENT '操作员，用户id，外键',
  `remarks` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`customer_return_list_id`) USING BTREE,
  KEY `customer_id` (`customer_id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE,
  CONSTRAINT `customer_return_list_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `customer_return_list_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_return_list`
--

LOCK TABLES `customer_return_list` WRITE;
/*!40000 ALTER TABLE `customer_return_list` DISABLE KEYS */;
INSERT INTO `customer_return_list` VALUES (1,'XT1550220103291','2023-12-10',199,199,1,1,1,'');
/*!40000 ALTER TABLE `customer_return_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_return_list_goods`
--

DROP TABLE IF EXISTS `customer_return_list_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_return_list_goods` (
  `customer_return_list_goods_id` int NOT NULL AUTO_INCREMENT COMMENT '客户退货单商品列表id，主键',
  `goods_id` int DEFAULT NULL COMMENT '商品编号id，外键',
  `goods_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '商品编码',
  `goods_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '商品名称',
  `goods_model` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '商品型号',
  `goods_num` int DEFAULT NULL COMMENT '客户退货数量',
  `goods_unit` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '商品单位',
  `price` float NOT NULL COMMENT '商品单价',
  `total` float NOT NULL COMMENT '总金额',
  `customer_return_list_id` int DEFAULT NULL COMMENT '客户退货单id，外键',
  `goods_type_id` int DEFAULT NULL COMMENT '商品类别id，外键',
  PRIMARY KEY (`customer_return_list_goods_id`) USING BTREE,
  KEY `FKtqt67mbn96lxn8hvtl4piblhi` (`customer_return_list_id`) USING BTREE,
  KEY `FK32ijokbrx3j6h0p6aa9hcccbq` (`goods_type_id`) USING BTREE,
  KEY `goods_id` (`goods_id`) USING BTREE,
  CONSTRAINT `customer_return_list_goods_ibfk_1` FOREIGN KEY (`goods_id`) REFERENCES `goods` (`goods_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `customer_return_list_goods_ibfk_2` FOREIGN KEY (`goods_type_id`) REFERENCES `goods_type` (`goods_type_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `customer_return_list_goods_ibfk_3` FOREIGN KEY (`customer_return_list_id`) REFERENCES `customer_return_list` (`customer_return_list_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_return_list_goods`
--

LOCK TABLES `customer_return_list_goods` WRITE;
/*!40000 ALTER TABLE `customer_return_list_goods` DISABLE KEYS */;
INSERT INTO `customer_return_list_goods` VALUES (1,1,'0001','七色糙米','1000g装',10,'袋',19.9,199,1,2);
/*!40000 ALTER TABLE `customer_return_list_goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `damage_list`
--

DROP TABLE IF EXISTS `damage_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `damage_list` (
  `damage_list_id` int NOT NULL AUTO_INCREMENT COMMENT '商品报损单id，主键',
  `damage_number` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '商品报损单号',
  `damage_date` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建日期',
  `remarks` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注',
  `user_id` int DEFAULT NULL COMMENT '用户id，外键',
  PRIMARY KEY (`damage_list_id`) USING BTREE,
  KEY `FKpn094ma69sch1icjc2gu7xus` (`user_id`) USING BTREE,
  CONSTRAINT `damage_list_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `damage_list`
--

LOCK TABLES `damage_list` WRITE;
/*!40000 ALTER TABLE `damage_list` DISABLE KEYS */;
INSERT INTO `damage_list` VALUES (1,'BS1550561206988','2023-12-10','',1),(2,'BS1565489147613','2023-12-10','',1);
/*!40000 ALTER TABLE `damage_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `damage_list_goods`
--

DROP TABLE IF EXISTS `damage_list_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `damage_list_goods` (
  `damage_list_goods_id` int NOT NULL AUTO_INCREMENT COMMENT '商品报损单商品列表id，主键',
  `goods_id` int DEFAULT NULL COMMENT '商品编号id，外键',
  `goods_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '商品编码',
  `goods_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '商品名称',
  `goods_model` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '商品型号',
  `goods_unit` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '商品单位',
  `goods_num` int DEFAULT NULL COMMENT '报损数量',
  `price` float NOT NULL COMMENT '商品单价',
  `total` float NOT NULL COMMENT '总金额',
  `damage_list_id` int DEFAULT NULL COMMENT '商品报损单id，外键',
  `goods_type_id` int DEFAULT NULL COMMENT '商品类别id，外键',
  PRIMARY KEY (`damage_list_goods_id`) USING BTREE,
  KEY `FKbf5m8mm3gctrnuubr9xkjamj8` (`damage_list_id`) USING BTREE,
  KEY `FK8r7ietq6opa0ci7uxdqc264yf` (`goods_type_id`) USING BTREE,
  KEY `goods_id` (`goods_id`) USING BTREE,
  CONSTRAINT `damage_list_goods_ibfk_1` FOREIGN KEY (`goods_id`) REFERENCES `goods` (`goods_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `damage_list_goods_ibfk_2` FOREIGN KEY (`damage_list_id`) REFERENCES `damage_list` (`damage_list_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `damage_list_goods_ibfk_3` FOREIGN KEY (`goods_type_id`) REFERENCES `goods_type` (`goods_type_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `damage_list_goods`
--

LOCK TABLES `damage_list_goods` WRITE;
/*!40000 ALTER TABLE `damage_list_goods` DISABLE KEYS */;
INSERT INTO `damage_list_goods` VALUES (1,14,'0006','冰糖金桔干','300g装','盒',4,5,20,1,8),(2,37,'0027','农夫山泉','2000ml','瓶',5,2,10,2,7);
/*!40000 ALTER TABLE `damage_list_goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goods`
--

DROP TABLE IF EXISTS `goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `goods` (
  `goods_id` int NOT NULL AUTO_INCREMENT COMMENT '商品编号id，主键',
  `goods_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '商品编码',
  `goods_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '商品名称',
  `inventory_quantity` int NOT NULL COMMENT '库存数量',
  `min_num` int NOT NULL COMMENT '库存下限',
  `goods_model` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '商品型号',
  `goods_producer` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '生产厂商',
  `purchasing_price` float NOT NULL COMMENT '采购价格',
  `last_purchasing_price` float NOT NULL COMMENT '上一次采购价格',
  `remarks` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注',
  `selling_price` float NOT NULL COMMENT '出售价格',
  `state` int NOT NULL COMMENT '0表示初始值,1表示已入库，2表示有进货或销售单据',
  `goods_unit` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '商品单位',
  `goods_type_id` int DEFAULT NULL COMMENT '商品类别id，外键',
  PRIMARY KEY (`goods_id`) USING BTREE,
  KEY `goods_type_id` (`goods_type_id`) USING BTREE,
  CONSTRAINT `goods_ibfk_1` FOREIGN KEY (`goods_type_id`) REFERENCES `goods_type` (`goods_type_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods`
--

LOCK TABLES `goods` WRITE;
/*!40000 ALTER TABLE `goods` DISABLE KEYS */;
INSERT INTO `goods` VALUES (1,'0001','七色糙米',100,100,'1000g装','十里稻田',19.9,19.9,'杂粮粗粮 黑米 红米 糙米  燕麦米 荞麦 大米伴侣',27.9,2,'袋',2),(11,'0002','鸡琵琶腿',100,100,'1500g装','鲜京采',23,23,'冷冻 炸鸡腿烤鸡腿卤鸡腿',38,2,'袋',3),(12,'0004','新疆红枣',100,100,'2斤装','铭鑫食品',13,13,'好吃',25,2,'袋',8),(13,'0005','麦片燕麦巧克力',100,100,'散装500克','麦德好食品',8,8,'',15,2,'袋',8),(14,'0006','冰糖金桔干',100,100,'300g装','松川良品',5.03,5,'',13,2,'盒',8),(15,'0007','吉利人家牛肉味蛋糕',100,100,'500g装','吉利人家食品',4.5,4.5,'',10,2,'袋',8),(16,'0008','奶油桃肉蜜饯果脯果干桃肉干',100,100,'128g装','奕森',3,3,'',10,2,'盒',8),(17,'0009','坚果精品干果开心果',100,100,'240g装','奕森',20,20,'吃了开心',33,2,'袋',8),(18,'0010','劲仔小鱼干',500,100,'250g装','劲仔',12,12,'',20,2,'袋',8),(19,'0011','山楂条',0,100,'198g装','七贤升利食品',3.2,3.2,'',10,0,'袋',8),(20,'0012','大乌梅干',0,100,'500g装','鼎丰真食品',20,20,'',25,0,'袋',8),(21,'0013','芝麻香酥',0,100,'250g装','桂林兰雨食品',3,3,'',8,2,'袋',8),(22,'0014','美国青豆',100,100,'250g装','菲律宾',5,5,'',8,2,'袋',8),(28,'0019','小黄人香蕉',100,100,'散装500克','小黄人',8,8,'',9,2,'袋',4),(29,'0020','云南土豆',100,100,'散装500克','云南',19,19,'',29,0,'袋',5),(30,'0021','真果粒',100,100,'500克装','蒙牛',45,45,'',65,0,'箱',7),(31,'0022','可口可乐',100,100,'330ml','可口可乐',2,2,'',4,0,'瓶',7),(32,'0023','山西陈醋',100,100,'820ml','山西',4,4,'',7,0,'瓶',10),(33,'0024','RIO鸡尾酒',100,100,'300ml','锐澳',4.5,4.5,'',7.9,0,'听',9),(34,'0025','坤太1+2辣椒面',100,100,'2g装','坤太',1,1,'',3,0,'袋',10),(35,'0026','绿箭口香糖',100,100,'40粒','绿箭',2,2,'',4,0,'盒',8),(37,'0027','农夫山泉',100,100,'2000ml','农夫山泉',2,2,'',4,2,'瓶',7);
/*!40000 ALTER TABLE `goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goods_type`
--

DROP TABLE IF EXISTS `goods_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `goods_type` (
  `goods_type_id` int NOT NULL AUTO_INCREMENT COMMENT '商品类别id，主键',
  `goods_type_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '商品类别名称',
  `p_id` int DEFAULT NULL COMMENT '父商品类别id',
  `goods_type_state` int DEFAULT NULL COMMENT '类别状态，0为叶子节点',
  PRIMARY KEY (`goods_type_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods_type`
--

LOCK TABLES `goods_type` WRITE;
/*!40000 ALTER TABLE `goods_type` DISABLE KEYS */;
INSERT INTO `goods_type` VALUES (1,'所有类别',-1,1),(2,'干粮',1,1),(3,'肉禽类',2,1),(4,'水果类',3,1),(5,'蔬菜类',4,1),(6,'乳制品',5,1),(7,'饮料类',6,1),(8,'零食类',7,1),(9,'酒类',8,1),(10,'调味品类',9,0),(11,'冻货',10,0),(12,'豆制品',11,0);
/*!40000 ALTER TABLE `goods_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log`
--

DROP TABLE IF EXISTS `log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log` (
  `log_id` int NOT NULL AUTO_INCREMENT,
  `log_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `content` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `log_date` datetime DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=135 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log`
--

LOCK TABLES `log` WRITE;
/*!40000 ALTER TABLE `log` DISABLE KEYS */;
INSERT INTO `log` VALUES (1,'登录操作','登录系统','2023-12-20 11:32:41',1),(2,'查询操作','分页查询商品库存信息','2023-12-20 11:32:41',1),(3,'查询操作','销售单据查询','2023-12-20 11:32:56',1),(4,'查询操作','销售单据查询','2023-12-20 11:32:56',1),(5,'查询操作','分页查询商品信息（无库存）','2023-12-20 11:36:26',1),(6,'查询操作','分页查询商品信息（有库存）','2023-12-20 11:36:26',1),(7,'查询操作','查询商品类别信息','2023-12-20 11:36:38',1),(8,'查询操作','分页查询客户','2023-12-20 11:36:39',1),(9,'查询操作','分页查询客户','2023-12-20 11:36:39',1),(10,'查询操作','分页查询供应商','2023-12-20 11:36:42',1),(11,'查询操作','分页查询供应商','2023-12-20 11:36:42',1),(12,'查询操作','进货单据查询','2023-12-20 11:36:54',1),(13,'查询操作','进货单据查询','2023-12-20 11:36:54',1),(14,'查询操作','退货单据查询','2023-12-20 11:36:55',1),(15,'查询操作','退货单据查询','2023-12-20 11:36:55',1),(16,'查询操作','分页查询商品库存信息','2023-12-20 11:36:56',1),(17,'查询操作','分页查询商品库存信息','2023-12-20 11:37:37',1),(18,'登录操作','登录系统','2023-12-20 12:00:54',1),(19,'查询操作','分页查询商品库存信息','2023-12-20 12:00:55',1),(20,'查询操作','进货单据查询','2023-12-20 12:01:16',1),(21,'查询操作','进货单据查询','2023-12-20 12:01:16',1),(22,'查询操作','退货单据查询','2023-12-20 12:01:17',1),(23,'查询操作','退货单据查询','2023-12-20 12:01:17',1),(24,'查询操作','分页查询商品库存信息','2023-12-20 12:01:18',1),(25,'登录操作','登录系统','2023-12-20 12:08:39',1),(26,'查询操作','分页查询商品库存信息','2023-12-20 12:08:40',1),(27,'登录操作','登录系统','2023-12-20 12:50:52',1),(28,'查询操作','分页查询商品库存信息','2023-12-20 12:50:53',1),(29,'查询操作','进货单据查询','2023-12-20 12:51:21',1),(30,'查询操作','进货单据查询','2023-12-20 12:51:21',1),(31,'查询操作','退货单据查询','2023-12-20 12:51:26',1),(32,'查询操作','退货单据查询','2023-12-20 12:51:26',1),(33,'查询操作','分页查询商品库存信息','2023-12-20 12:51:28',1),(34,'查询操作','销售单据查询','2023-12-20 12:52:19',1),(35,'查询操作','销售单据查询','2023-12-20 12:52:20',1),(36,'查询操作','客户退货单据查询','2023-12-20 12:52:27',1),(37,'查询操作','客户退货单据查询','2023-12-20 12:52:27',1),(38,'查询操作','查询库存报警商品信息','2023-12-20 12:56:19',1),(39,'查询操作','商品报损单据查询','2023-12-20 12:56:21',1),(40,'查询操作','进货单据查询','2023-12-20 12:56:28',1),(41,'查询操作','退货单据查询','2023-12-20 12:56:28',1),(42,'查询操作','销售单据查询','2023-12-20 12:57:07',1),(43,'查询操作','客户退货单据查询','2023-12-20 12:57:07',1),(44,'查询操作','客户退货单商品信息查询','2023-12-20 12:57:22',1),(45,'查询操作','分页查询供应商','2023-12-20 12:57:31',1),(46,'查询操作','分页查询供应商','2023-12-20 12:57:31',1),(47,'查询操作','分页查询客户','2023-12-20 12:57:35',1),(48,'查询操作','分页查询客户','2023-12-20 12:57:35',1),(49,'查询操作','查询商品类别信息','2023-12-20 12:57:37',1),(50,'登录操作','登录系统','2023-12-20 13:00:12',1),(51,'查询操作','分页查询商品库存信息','2023-12-20 13:00:13',1),(52,'查询操作','分页查询角色信息','2023-12-20 13:00:18',1),(53,'查询操作','分页查询角色信息','2023-12-20 13:00:18',1),(54,'查询操作','分页查询用户信息','2023-12-20 13:00:20',1),(55,'查询操作','查询所有角色信息','2023-12-20 13:00:20',1),(56,'查询操作','分页查询用户信息','2023-12-20 13:00:20',1),(57,'查询操作','分页查询商品信息（无库存）','2023-12-20 13:00:34',1),(58,'查询操作','分页查询商品信息（有库存）','2023-12-20 13:00:34',1),(59,'查询操作','查询商品类别信息','2023-12-20 13:02:00',1),(60,'查询操作','分页查询客户','2023-12-20 13:02:31',1),(61,'查询操作','分页查询客户','2023-12-20 13:02:31',1),(62,'查询操作','分页查询供应商','2023-12-20 13:02:32',1),(63,'查询操作','分页查询供应商','2023-12-20 13:02:32',1),(64,'查询操作','销售商品统计查询','2023-12-20 13:02:37',1),(65,'查询操作','客户退货商品统计查询','2023-12-20 13:02:37',1),(66,'查询操作','退货商品统计查询','2023-12-20 13:02:45',1),(67,'查询操作','进货商品统计查询','2023-12-20 13:02:45',1),(68,'查询操作','客户退货单据查询','2023-12-20 13:03:05',1),(69,'查询操作','销售单据查询','2023-12-20 13:03:05',1),(70,'查询操作','进货单据查询','2023-12-20 13:03:08',1),(71,'查询操作','退货单据查询','2023-12-20 13:03:08',1),(72,'查询操作','分页查询商品库存信息','2023-12-20 13:03:14',1),(73,'查询操作','进货单据查询','2023-12-20 13:03:30',1),(74,'查询操作','进货单据查询','2023-12-20 13:03:30',1),(75,'查询操作','退货单据查询','2023-12-20 13:03:32',1),(76,'查询操作','退货单据查询','2023-12-20 13:03:32',1),(77,'查询操作','客户退货单据查询','2023-12-20 13:03:56',1),(78,'查询操作','客户退货单据查询','2023-12-20 13:03:56',1),(79,'查询操作','查询库存报警商品信息','2023-12-20 13:04:03',1),(80,'查询操作','商品报损单据查询','2023-12-20 13:04:15',1),(81,'查询操作','销售单据查询','2023-12-20 13:05:41',1),(82,'查询操作','销售单据查询','2023-12-20 13:05:41',1),(83,'查询操作','销售单据查询','2023-12-20 13:06:51',1),(84,'查询操作','销售单据查询','2023-12-20 13:06:52',1),(85,'查询操作','销售单据查询','2023-12-20 13:06:53',1),(86,'查询操作','销售单据查询','2023-12-20 13:06:53',1),(87,'查询操作','销售单据查询','2023-12-20 13:10:59',1),(88,'查询操作','销售单据查询','2023-12-20 13:11:38',1),(89,'查询操作','销售单据查询','2023-12-20 13:15:03',1),(90,'查询操作','客户退货单商品信息查询','2023-12-20 13:18:15',1),(91,'查询操作','客户退货单商品信息查询','2023-12-20 13:18:16',1),(92,'查询操作','客户退货单据查询','2023-12-20 13:18:23',1),(93,'查询操作','客户退货单据查询','2023-12-20 13:18:25',1),(94,'登录操作','登录系统','2023-12-20 13:21:52',1),(95,'查询操作','分页查询商品库存信息','2023-12-20 13:21:53',1),(96,'查询操作','分页查询商品信息（无库存）','2023-12-20 13:22:10',1),(97,'查询操作','分页查询商品信息（有库存）','2023-12-20 13:22:10',1),(98,'查询操作','查询商品类别信息','2023-12-20 13:22:12',1),(99,'查询操作','分页查询客户','2023-12-20 13:22:13',1),(100,'查询操作','分页查询客户','2023-12-20 13:22:13',1),(101,'查询操作','分页查询供应商','2023-12-20 13:22:13',1),(102,'查询操作','分页查询供应商','2023-12-20 13:22:13',1),(103,'查询操作','客户退货商品统计查询','2023-12-20 13:22:26',1),(104,'查询操作','销售商品统计查询','2023-12-20 13:22:26',1),(105,'查询操作','退货商品统计查询','2023-12-20 13:22:32',1),(106,'查询操作','进货商品统计查询','2023-12-20 13:22:32',1),(107,'查询操作','销售单据查询','2023-12-20 13:22:36',1),(108,'查询操作','客户退货单据查询','2023-12-20 13:22:36',1),(109,'查询操作','退货单据查询','2023-12-20 13:22:40',1),(110,'查询操作','进货单据查询','2023-12-20 13:22:40',1),(111,'查询操作','分页查询商品库存信息','2023-12-20 13:23:43',1),(112,'查询操作','商品报损单据查询','2023-12-20 13:23:51',1),(113,'查询操作','查询按日统计分析数据','2023-12-20 13:23:57',1),(114,'查询操作','客户退货商品统计查询','2023-12-20 13:23:58',1),(115,'查询操作','销售商品统计查询','2023-12-20 13:23:58',1),(116,'查询操作','退货商品统计查询','2023-12-20 13:24:10',1),(117,'查询操作','进货商品统计查询','2023-12-20 13:24:10',1),(118,'查询操作','销售单据查询','2023-12-20 13:24:12',1),(119,'查询操作','客户退货单据查询','2023-12-20 13:24:12',1),(120,'查询操作','进货单据查询','2023-12-20 13:24:13',1),(121,'查询操作','退货单据查询','2023-12-20 13:24:13',1),(122,'查询操作','分页查询商品库存信息','2023-12-20 13:24:17',1),(123,'查询操作','查询库存报警商品信息','2023-12-20 13:24:18',1),(124,'查询操作','分页查询供应商','2023-12-20 13:24:29',1),(125,'查询操作','分页查询供应商','2023-12-20 13:24:29',1),(126,'查询操作','分页查询客户','2023-12-20 13:24:30',1),(127,'查询操作','分页查询客户','2023-12-20 13:24:30',1),(128,'查询操作','查询商品类别信息','2023-12-20 13:24:31',1),(129,'查询操作','进货单据查询','2023-12-20 13:25:18',1),(130,'查询操作','进货单据查询','2023-12-20 13:25:18',1),(131,'查询操作','退货单据查询','2023-12-20 13:25:19',1),(132,'查询操作','退货单据查询','2023-12-20 13:25:19',1),(133,'登录操作','登录系统','2023-12-20 13:30:04',1),(134,'查询操作','分页查询商品库存信息','2023-12-20 13:30:05',1);
/*!40000 ALTER TABLE `log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu` (
  `menu_id` int NOT NULL AUTO_INCREMENT COMMENT '菜单id',
  `menu_icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '菜单图片',
  `menu_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '菜单名称',
  `p_id` int DEFAULT NULL COMMENT '父菜单id',
  `menu_state` int DEFAULT NULL COMMENT '菜单状态，1表示目录，0表示结点',
  `menu_url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '菜单的链接地址',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6051 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (1,'menu-plugin','系统菜单',-1,1,NULL),(10,'menu-1','进货管理',1,1,NULL),(20,'menu-2','销售管理',1,1,NULL),(30,'menu-3','库存管理',1,1,NULL),(40,'menu-4','统计报表',1,1,NULL),(50,'menu-5','基础资料',1,1,NULL),(60,'menu-6','系统管理',1,1,NULL),(1010,'menu-11','进货入库',10,0,'/purchase/purchase.html'),(1020,'menu-12','退货出库',10,0,'/purchase/return.html'),(1030,'menu-13','进货单据查询',10,0,'/purchase/purchaseSearch.html'),(1040,'menu-14','退货单据查询',10,0,'/purchase/returnSearch.html'),(1050,'menu-15','当前库存查询',10,0,'/common/stockSearch.html'),(2010,'menu-21','销售出库',20,0,'/sale/saleout.html'),(2020,'menu-22','客户退货',20,0,'/sale/salereturn.html'),(2030,'menu-23','销售单据查询',20,0,'/sale/saleSearch.html'),(2040,'menu-24','客户退货查询',20,0,'/sale/returnSearch.html'),(2050,'menu-25','当前库存查询',20,0,'/common/stockSearch.html'),(3010,'menu-31','商品报损',30,0,'/stock/damage.html'),(3020,'menu-32','商品报溢',30,0,'/stock/overflow.html'),(3030,'menu-33','库存报警',30,0,'/stock/alarm.html'),(3040,'menu-34','报损报溢查询',30,0,'/stock/damageOverflowSearch.html'),(3050,'menu-35','当前库存查询',30,0,'/common/stockSearch.html'),(4010,'menu-41','供应商统计',40,0,'/count/supplier.html'),(4020,'menu-42','客户统计',40,0,'/count/customer.html'),(4030,'menu-43','商品采购统计',40,0,'/count/purchase.html'),(4040,'menu-44','商品销售统计',40,0,'/count/sale.html'),(4050,'menu-45','按日统计分析',40,0,'/count/saleDay.html'),(4060,'menu-46','按月统计分析',40,0,'/count/saleMonth.html'),(5010,'menu-51','供应商管理',50,0,'/basicData/supplier.html'),(5020,'menu-52','客户管理',50,0,'/basicData/customer.html'),(5030,'menu-53','商品管理',50,0,'/basicData/goods.html'),(5040,'menu-54','期初库存',50,0,'/basicData/stock.html'),(6010,'menu-61','角色管理',60,0,'/power/role.html'),(6020,'menu-62','用户管理',60,0,'/power/user.html'),(6030,'menu-65','系统日志',60,0,'/power/log.html'),(6040,'menu-63','修改密码',60,0,NULL),(6050,'menu-64','安全退出',60,0,NULL);
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `overflow_list`
--

DROP TABLE IF EXISTS `overflow_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `overflow_list` (
  `overflow_list_id` int NOT NULL AUTO_INCREMENT COMMENT '商品报溢单id，主键',
  `overflow_number` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '商品报溢单号',
  `overflow_date` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '报溢日期',
  `remarks` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注',
  `user_id` int DEFAULT NULL COMMENT '用户id，外键',
  PRIMARY KEY (`overflow_list_id`) USING BTREE,
  KEY `FK3bu8hj2xniqwbrtg6ls6b8ej2` (`user_id`) USING BTREE,
  CONSTRAINT `overflow_list_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `overflow_list`
--

LOCK TABLES `overflow_list` WRITE;
/*!40000 ALTER TABLE `overflow_list` DISABLE KEYS */;
INSERT INTO `overflow_list` VALUES (1,'BY1550565907039','2023-12-10','',1),(2,'BY1565491207302','2023-12-10','',1);
/*!40000 ALTER TABLE `overflow_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `overflow_list_goods`
--

DROP TABLE IF EXISTS `overflow_list_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `overflow_list_goods` (
  `overflow_list_goods_id` int NOT NULL AUTO_INCREMENT COMMENT '商品报溢单商品列表id，主键',
  `goods_id` int DEFAULT NULL COMMENT '商品编号id，外键',
  `goods_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '商品编码',
  `goods_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '商品名称',
  `goods_model` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '商品型号',
  `goods_unit` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '商品单位',
  `goods_num` int DEFAULT NULL COMMENT '报溢数量',
  `price` float NOT NULL COMMENT '商品单价',
  `total` float NOT NULL COMMENT '总金额',
  `overflow_list_id` int DEFAULT NULL COMMENT '商品报溢单id，外键',
  `goods_type_id` int DEFAULT NULL COMMENT '商品类别id，外键',
  PRIMARY KEY (`overflow_list_goods_id`) USING BTREE,
  KEY `FKd3s9761mgl456tn2xb0d164h7` (`overflow_list_id`) USING BTREE,
  KEY `FK20rudkne4kc8uftcenkrng1mn` (`goods_type_id`) USING BTREE,
  KEY `goods_id` (`goods_id`) USING BTREE,
  CONSTRAINT `overflow_list_goods_ibfk_1` FOREIGN KEY (`goods_id`) REFERENCES `goods` (`goods_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `overflow_list_goods_ibfk_2` FOREIGN KEY (`overflow_list_id`) REFERENCES `overflow_list` (`overflow_list_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `overflow_list_goods_ibfk_3` FOREIGN KEY (`goods_type_id`) REFERENCES `goods_type` (`goods_type_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `overflow_list_goods`
--

LOCK TABLES `overflow_list_goods` WRITE;
/*!40000 ALTER TABLE `overflow_list_goods` DISABLE KEYS */;
INSERT INTO `overflow_list_goods` VALUES (1,1,'0001','七色糙米','1000g装','袋',100,19.9,1990,1,2),(2,37,'0027','农夫山泉','2000ml','瓶',100,2,200,2,7);
/*!40000 ALTER TABLE `overflow_list_goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchase_list`
--

DROP TABLE IF EXISTS `purchase_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `purchase_list` (
  `purchase_list_id` int NOT NULL AUTO_INCREMENT COMMENT '进货单id，主键',
  `purchase_number` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '进货单号',
  `amount_paid` float NOT NULL COMMENT '实付金额',
  `amount_payable` float NOT NULL COMMENT '应付金额',
  `purchase_date` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '收货日期',
  `remarks` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注',
  `state` int DEFAULT NULL COMMENT '状态',
  `supplier_id` int DEFAULT NULL COMMENT '供应商id，外键',
  `user_id` int DEFAULT NULL COMMENT '用户id，外键',
  PRIMARY KEY (`purchase_list_id`) USING BTREE,
  KEY `supplier_id` (`supplier_id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE,
  CONSTRAINT `purchase_list_ibfk_1` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`supplier_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `purchase_list_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=132 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchase_list`
--

LOCK TABLES `purchase_list` WRITE;
/*!40000 ALTER TABLE `purchase_list` DISABLE KEYS */;
INSERT INTO `purchase_list` VALUES (124,'JH1550048597876',550,550,'2023-12-10','',1,1,1),(130,'JH1564882213808',400,400,'2023-12-10','',1,1,1);
/*!40000 ALTER TABLE `purchase_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchase_list_goods`
--

DROP TABLE IF EXISTS `purchase_list_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `purchase_list_goods` (
  `purchase_list_goods_id` int NOT NULL AUTO_INCREMENT COMMENT '进货单商品列表id，主键',
  `goods_id` int DEFAULT NULL COMMENT '商品编号id，外键',
  `goods_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '商品编码',
  `goods_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '商品名称',
  `goods_model` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '商品型号',
  `goods_unit` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '商品单位',
  `goods_num` int NOT NULL COMMENT '进货数量',
  `price` float NOT NULL COMMENT '商品单价',
  `total` float NOT NULL COMMENT '总金额',
  `purchase_list_id` int DEFAULT NULL COMMENT '进货单id，外键',
  `goods_type_id` int DEFAULT NULL COMMENT '商品类别id，外键',
  PRIMARY KEY (`purchase_list_goods_id`) USING BTREE,
  KEY `goods_id` (`goods_id`) USING BTREE,
  KEY `purchase_list_id` (`purchase_list_id`) USING BTREE,
  KEY `goods_type_id` (`goods_type_id`) USING BTREE,
  CONSTRAINT `purchase_list_goods_ibfk_1` FOREIGN KEY (`goods_id`) REFERENCES `goods` (`goods_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `purchase_list_goods_ibfk_2` FOREIGN KEY (`purchase_list_id`) REFERENCES `purchase_list` (`purchase_list_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `purchase_list_goods_ibfk_3` FOREIGN KEY (`goods_type_id`) REFERENCES `goods_type` (`goods_type_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=133 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchase_list_goods`
--

LOCK TABLES `purchase_list_goods` WRITE;
/*!40000 ALTER TABLE `purchase_list_goods` DISABLE KEYS */;
INSERT INTO `purchase_list_goods` VALUES (126,33,'0024','RIO鸡尾酒','300ml','听',100,4.5,450,124,8),(127,34,'0025','坤太1+2辣椒面','2g装','袋',100,1,100,124,8),(130,35,'0026','绿箭口香糖','40粒','盒',100,2,200,130,7),(131,37,'0027','农夫山泉','2000ml','瓶',100,2,200,130,7);
/*!40000 ALTER TABLE `purchase_list_goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `return_list`
--

DROP TABLE IF EXISTS `return_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `return_list` (
  `return_list_id` int NOT NULL AUTO_INCREMENT COMMENT '这是系统和供应商之间的退货退货单id，主键',
  `return_number` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '退货单号',
  `return_date` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '退货日期',
  `amount_paid` float NOT NULL COMMENT '实退金额',
  `amount_payable` float NOT NULL COMMENT '应退金额',
  `remarks` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注',
  `state` int DEFAULT NULL COMMENT '状态,1表示已退，2表示未退',
  `supplier_id` int DEFAULT NULL COMMENT '供应商id，外键',
  `user_id` int DEFAULT NULL COMMENT '用户id，外键',
  PRIMARY KEY (`return_list_id`) USING BTREE,
  KEY `FK4qxjj8bvj2etne243xluni0vn` (`supplier_id`) USING BTREE,
  KEY `FK904juw2v1hm2av0ig26gae9jb` (`user_id`) USING BTREE,
  CONSTRAINT `return_list_ibfk_1` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`supplier_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `return_list_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `return_list`
--

LOCK TABLES `return_list` WRITE;
/*!40000 ALTER TABLE `return_list` DISABLE KEYS */;
INSERT INTO `return_list` VALUES (1,'TH1549940820089','2023-12-10',19.9,19.9,'',2,1,1);
/*!40000 ALTER TABLE `return_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `return_list_goods`
--

DROP TABLE IF EXISTS `return_list_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `return_list_goods` (
  `return_list_goods_id` int NOT NULL AUTO_INCREMENT COMMENT '退货单商品列表id，主键',
  `goods_id` int DEFAULT NULL COMMENT '商品编号id，外键',
  `goods_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '商品编码',
  `goods_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '商品名称',
  `goods_model` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '商品型号',
  `goods_unit` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '商品单位',
  `goods_num` int DEFAULT NULL COMMENT '商品数量',
  `price` float NOT NULL COMMENT '商品单价',
  `total` float NOT NULL COMMENT '总金额',
  `return_list_id` int DEFAULT NULL COMMENT '退货单id，外键',
  `goods_type_id` int DEFAULT NULL COMMENT '商品类别id，外键',
  PRIMARY KEY (`return_list_goods_id`) USING BTREE,
  KEY `FKemclu281vyvyk063c3foafq1w` (`return_list_id`) USING BTREE,
  KEY `FKpxnqi9jfkw6wdm1uox2kkr0wk` (`goods_type_id`) USING BTREE,
  KEY `goods_id` (`goods_id`) USING BTREE,
  CONSTRAINT `return_list_goods_ibfk_1` FOREIGN KEY (`return_list_id`) REFERENCES `return_list` (`return_list_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `return_list_goods_ibfk_3` FOREIGN KEY (`goods_id`) REFERENCES `goods` (`goods_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `return_list_goods_ibfk_4` FOREIGN KEY (`goods_type_id`) REFERENCES `goods_type` (`goods_type_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `return_list_goods`
--

LOCK TABLES `return_list_goods` WRITE;
/*!40000 ALTER TABLE `return_list_goods` DISABLE KEYS */;
INSERT INTO `return_list_goods` VALUES (1,1,'0001','七色糙米','1000g装','袋',1,19.9,19.9,1,2);
/*!40000 ALTER TABLE `return_list_goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `role_id` int NOT NULL AUTO_INCREMENT COMMENT '角色id，主键',
  `role_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '角色名称',
  `remarks` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'系统管理员','管理员'),(2,'主管','主管'),(4,'采购员','采购员'),(5,'销售经理','销售经理'),(7,'仓库管理员','仓库管理员'),(8,'测试员','测试员');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_menu`
--

DROP TABLE IF EXISTS `role_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_menu` (
  `role_menu_id` int NOT NULL AUTO_INCREMENT COMMENT '角色-菜单id',
  `menu_id` int DEFAULT NULL COMMENT '菜单id',
  `role_id` int DEFAULT NULL COMMENT '角色id',
  PRIMARY KEY (`role_menu_id`) USING BTREE,
  KEY `FKhayg4ib6v7h1wyeyxhq6xlddq` (`menu_id`) USING BTREE,
  KEY `FKsonb0rbt2u99hbrqqvv3r0wse` (`role_id`) USING BTREE,
  CONSTRAINT `role_menu_ibfk_1` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`menu_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `role_menu_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=128 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_menu`
--

LOCK TABLES `role_menu` WRITE;
/*!40000 ALTER TABLE `role_menu` DISABLE KEYS */;
INSERT INTO `role_menu` VALUES (2,1,1),(3,10,1),(4,20,1),(5,30,1),(6,40,1),(7,50,1),(8,60,1),(9,1010,1),(10,1020,1),(11,1030,1),(12,1040,1),(13,1050,1),(14,2010,1),(15,2020,1),(16,2030,1),(17,2040,1),(18,2050,1),(19,3010,1),(20,3020,1),(21,3030,1),(22,3040,1),(23,3050,1),(24,4010,1),(25,4020,1),(26,4030,1),(27,4040,1),(28,4050,1),(29,4060,1),(30,5010,1),(31,5020,1),(32,5030,1),(33,5040,1),(34,6010,1),(35,6020,1),(43,6030,1),(44,6040,1),(45,1,4),(46,20,4),(47,2010,4),(48,1,5),(49,30,5),(50,3010,5),(51,1,NULL),(52,10,NULL),(53,1010,NULL),(54,1020,NULL),(55,1030,NULL),(56,1040,NULL),(57,1050,NULL),(58,20,NULL),(59,2010,NULL),(60,2020,NULL),(61,2030,NULL),(62,2040,NULL),(63,2050,NULL),(64,6050,1),(65,1,7),(66,10,7),(67,1010,7),(68,1020,7),(69,1030,7),(70,1040,7),(71,1050,7),(72,20,7),(73,2010,7),(74,2020,7),(75,2030,7),(76,40,7),(77,4010,7),(78,4020,7),(79,1,NULL),(80,10,NULL),(81,1010,NULL),(82,1020,NULL),(83,1030,NULL),(84,1040,NULL),(85,1050,NULL),(99,1,8),(100,50,8),(101,5010,8),(102,5020,8),(103,5030,8),(104,5040,8),(117,1,2),(118,10,2),(119,1010,2),(120,1020,2),(121,1030,2),(122,1040,2),(123,1050,2),(124,60,2),(125,6030,2),(126,6040,2),(127,6050,2);
/*!40000 ALTER TABLE `role_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sale_list`
--

DROP TABLE IF EXISTS `sale_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sale_list` (
  `sale_list_id` int NOT NULL AUTO_INCREMENT COMMENT '销售单id，主键',
  `sale_number` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '销售单号',
  `amount_paid` float NOT NULL COMMENT '实付金额',
  `amount_payable` float NOT NULL COMMENT '应付金额',
  `sale_date` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '销售单创建日期',
  `state` int DEFAULT NULL COMMENT '状态',
  `remarks` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注',
  `customer_id` int DEFAULT NULL COMMENT '客户id，外键',
  `user_id` int DEFAULT NULL COMMENT '用户id，外键',
  PRIMARY KEY (`sale_list_id`) USING BTREE,
  KEY `FKox4qfs87eu3fvwdmrvelqhi8e` (`customer_id`) USING BTREE,
  KEY `FK34bnujemrdqimbhg133enp8k8` (`user_id`) USING BTREE,
  CONSTRAINT `sale_list_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `sale_list_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sale_list`
--

LOCK TABLES `sale_list` WRITE;
/*!40000 ALTER TABLE `sale_list` DISABLE KEYS */;
INSERT INTO `sale_list` VALUES (1,'XS1550133166343',19.9,19.9,'2023-12-10',1,'',1,1),(3,'XS1551175088245',380,380,'2023-12-10',1,'',1,1);
/*!40000 ALTER TABLE `sale_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sale_list_goods`
--

DROP TABLE IF EXISTS `sale_list_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sale_list_goods` (
  `sale_list_goods_id` int NOT NULL AUTO_INCREMENT COMMENT '销售单商品列表id，主键',
  `goods_id` int DEFAULT NULL COMMENT '商品编号id，外键',
  `goods_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '商品编码',
  `goods_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '商品名称',
  `goods_model` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '商品型号',
  `goods_num` int DEFAULT NULL COMMENT '销售数量',
  `goods_unit` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '商品单位',
  `price` float NOT NULL COMMENT '商品单价',
  `total` float NOT NULL COMMENT '总金额',
  `sale_list_id` int DEFAULT NULL COMMENT '销售单id，外键',
  `goods_type_id` int DEFAULT NULL COMMENT '商品类别id，外键',
  PRIMARY KEY (`sale_list_goods_id`) USING BTREE,
  KEY `FK20ehd6ta9geyql4hxtdsnhbox` (`sale_list_id`) USING BTREE,
  KEY `FK39ej927qf0ldkykafj2nhyu3u` (`goods_type_id`) USING BTREE,
  KEY `goods_id` (`goods_id`) USING BTREE,
  CONSTRAINT `sale_list_goods_ibfk_1` FOREIGN KEY (`goods_id`) REFERENCES `goods` (`goods_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `sale_list_goods_ibfk_2` FOREIGN KEY (`sale_list_id`) REFERENCES `sale_list` (`sale_list_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `sale_list_goods_ibfk_3` FOREIGN KEY (`goods_type_id`) REFERENCES `goods_type` (`goods_type_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sale_list_goods`
--

LOCK TABLES `sale_list_goods` WRITE;
/*!40000 ALTER TABLE `sale_list_goods` DISABLE KEYS */;
INSERT INTO `sale_list_goods` VALUES (1,1,'0001','七色糙米','1000g装',1,'袋',19.9,19.9,1,2),(3,11,'0002','鸡琵琶腿','1500g装',10,'袋',38,380,3,3);
/*!40000 ALTER TABLE `sale_list_goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier`
--

DROP TABLE IF EXISTS `supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supplier` (
  `supplier_id` int NOT NULL AUTO_INCREMENT COMMENT '供应商id，主键',
  `supplier_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '供应商名称',
  `contacts` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '联系人',
  `phone_number` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '联系人电话',
  `address` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '供应商地址',
  `remarks` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`supplier_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier`
--

LOCK TABLES `supplier` WRITE;
/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;
INSERT INTO `supplier` VALUES (1,'四川张三有限公司','张三','13666666666','四川成都','经销批发的大枣、山楂、枣夹核、枸杞、农副产品畅销消费者市场'),(2,'四川李四有限公司','李四','13888888888','四川成都','主营“鹃城牌”郫县豆瓣'),(3,'四川王五有限公司','王五','13555555555','四川成都','集餐饮川菜调料研发、生产、销售为一体的现代派企业'),(4,'四川赵六有限公司 ','赵六','13999999999','四川成都','专业从事宾馆、酒店和休闲食品研发、生产销售为一体的现代化民营企业'),(7,'四川李华有限公司','李华','13111111111','四川成都','中国调味品协会理事单位、农业产业化国家重点龙头企业'),(8,'四川王刚食品有限公司','王刚','13222222222','四川成都','集科研、生产、销售为一体的肉类食品加工民营企业'),(9,'四川高启强有限公司','高启强','13333333333','四川成都','所有产品均是通过正规通关渠道进口，海关、商检相关手续齐全'),(10,'四川高启盛电子商务有限公司','高启盛','13444444444','四川成都','专业进出口企业，专注于进口食品流通供应链业务，经营全球进口食品'),(11,'四川焦焦有限公司','焦焦','13777777777','四川成都','经营全球进口食品'),(12,'四川萝卜头有限公司','萝卜头','13000000000','四川成都','依托上海市场，聚焦在坚果炒货、炭烤海鲜、果脯蜜饯、果干脆片、特色糖果等五大核心领域');
/*!40000 ALTER TABLE `supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unit`
--

DROP TABLE IF EXISTS `unit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `unit` (
  `unit_id` int NOT NULL AUTO_INCREMENT COMMENT '商品单位id，主键',
  `unit_name` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '商品单位名称',
  PRIMARY KEY (`unit_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unit`
--

LOCK TABLES `unit` WRITE;
/*!40000 ALTER TABLE `unit` DISABLE KEYS */;
INSERT INTO `unit` VALUES (1,'元'),(2,'户'),(3,'斤'),(4,'台'),(5,'瓶'),(6,'袋'),(7,'盒'),(8,'条'),(9,'吨'),(10,'个'),(11,'件');
/*!40000 ALTER TABLE `unit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` int NOT NULL AUTO_INCREMENT COMMENT '用户id，主键',
  `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户名',
  `password` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '密码',
  `true_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '真实姓名',
  `roles` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '角色',
  `remarks` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'admin','8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92','admin',NULL,'管理员'),(3,'admin_1','8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92','admin_1','仓库管理员,销售经理,采购员,主管','分支1'),(10,'admin_2','8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92','admin_2','采购员,主管,销售经理','分支2');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_role` (
  `user_role_id` int NOT NULL AUTO_INCREMENT,
  `role_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`user_role_id`) USING BTREE,
  KEY `role_id` (`role_id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE,
  CONSTRAINT `user_role_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `user_role_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` VALUES (1,1,1),(2,2,3),(3,4,3),(4,5,3),(5,7,3),(6,2,10),(7,4,10),(8,5,10);
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'goods'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-20 13:45:30
