CREATE TABLE `category` (
  `category_id` int(11) NOT NULL auto_increment,
  `parent_category_id` int(11),
  `name_lat` varchar(100) NOT NULL,
  `name_rus` varchar(100) ,
  `description` varchar(1000),
  PRIMARY KEY  (`category_id`)
) AUTO_INCREMENT=6;

CREATE TABLE `genus` (
  `genus_id` int(11) NOT NULL auto_increment,
  `category_id` int(11) NOT NULL,
  `name_lat` varchar(100) NOT NULL,
  `name_rus` varchar(100),
  `description` text,
  `synonym` text,
  PRIMARY KEY  (`genus_id`)
) AUTO_INCREMENT=487;

CREATE TABLE `plant` (
  `plant_id` int(11) NOT NULL auto_increment,
  `parent_id` int(11),
  `genus_id` int(11) NOT NULL,
  `name_lat` varchar(100) NOT NULL,
  `name_rus` varchar(100),
  `width` varchar(50),
  `height` varchar(50),
  `crown` varchar(50),
  `flowers` varchar(50),
  `leaves` varchar(50),
  `fruit` varchar(50),
  `description` text,
  `description_short` text,
  `application` text,
  `enabled` int(3) NOT NULL default '0',
  `creation_date` timestamp NOT NULL  default CURRENT_TIMESTAMP,
  `modification_date` timestamp ,
  PRIMARY KEY  (`plant_id`)
) AUTO_INCREMENT=2287;