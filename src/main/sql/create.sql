CREATE DATABASE /*!32312 IF NOT EXISTS*/ `stressAnalytics` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `stressAnalytics`;

CREATE TABLE IF NOT EXISTS `subscription` (
  `email` varchar(200) DEFAULT NULL,
  `twitter_handle` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `universityScore` (
  `university` varchar(200) DEFAULT NULL,
  `positiveScore` int(20) DEFAULT NULL,
  `negativeScore` int(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `universityStateMapping` (
  `university` varchar(200) DEFAULT NULL,
  `state` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `wordCloud` (
  `tagName` varchar(200) DEFAULT NULL,
  `word` varchar(200) DEFAULT NULL,
  `size` int(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `timeVis` (
  `university` varchar(200),
  `dailyNegativeTweetCount` float(7,2),
  `startTime` varchar(200)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `hashtags` (
  `id` INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  `university` varchar(50) DEFAULT NULL,
  `hashtags` varchar(100) DEFAULT NULL,
  `since_id` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `tweets` (
  id INT(20) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  tweetId varchar(30),
  university varchar(50),
  raw_timestamp varchar(30),
  normalized_timestamp varchar(30),
  sentiment TINYINT(2) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

insert into hashtags values(1, 'UCLA', '#UCLA','1'), (2, 'Stanford', '#Stanford','1'), (3, 'MIT', '#MIT','1'), (4, 'NYU', '#NYU','1'), (5, 'UCB', '#UCB','1'), (6, 'USC','#USC','1'), (7, 'Columbia', '#Columbia','1'), (8, 'Cornell', '#Cornell','1'), (9, 'CMU', '#CMU','1'), (10, 'Yale', '#Yale','1');

insert into universityStateMapping values('UCLA', 'CA'), ('Stanford', 'CA'), ('MIT', 'BA'), ('NYU', 'NY'), ('UCB', 'CA'), ('USC','CA'), ('Columbia', 'NY'), ('Cornell', 'NY'), ('CMU', 'PA'), ('Yale', 'BA');
