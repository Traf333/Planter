CREATE TABLE `plant_categories` (
  `id` int(11) NOT NULL ,
  `parent_category_id` int(11),
  `lat_name` varchar(100) NOT NULL,
  `name` varchar(100) ,
  `description` varchar(1000),
  PRIMARY KEY  (`id`)
);

CREATE TABLE `genus` (
  `id` int(11) NOT NULL ,
  `plant_category_id` int(11) NOT NULL,
  `lat_name` varchar(100) NOT NULL,
  `name` varchar(100),
  `description` text,
  `synonym` text,
  PRIMARY KEY  (`id`)
);

CREATE TABLE `plants` (
  `id` int(11) NOT NULL ,
  `parent_id` int(11),
  `genus_id` int(11) NOT NULL,
  `lat_name` varchar(100) NOT NULL,
  `name` varchar(100),
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
  `created_at` timestamp NOT NULL  default CURRENT_TIMESTAMP,
  `updated_at` timestamp ,
  PRIMARY KEY  (`id`)
);