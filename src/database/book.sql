create database book;

use book;

CREATE TABLE `bookinfo` (
  `id` int NOT NULL auto_increment COMMENT '主键，保持自动增长，步长为1',
  `bookISBN` varchar(17) NOT NULL COMMENT '图书的ISBN号码',
  `bookName` varchar(100) NOT NULL COMMENT '书名',
  `author` varchar(100) NOT NULL COMMENT '作者姓名',
  `price` float(8,2) DEFAULT NULL COMMENT '价格',
  `typeId` int DEFAULT NULL COMMENT '图书类型编号',
  `publisher` varchar(100) NOT NULL COMMENT '出版社',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;