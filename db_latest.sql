-- phpMyAdmin SQL Dump
-- version 3.4.10.1deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Dec 05, 2013 at 09:42 PM
-- Server version: 5.5.34
-- PHP Version: 5.3.10-1ubuntu3.8

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `dota2_mm`
--

-- --------------------------------------------------------

--
-- Table structure for table `ability_upgrades`
--

CREATE TABLE IF NOT EXISTS `ability_upgrades` (
  `slot_id` int(10) unsigned NOT NULL,
  `ability` int(8) unsigned NOT NULL,
  `time` int(10) unsigned NOT NULL,
  `level` tinyint(4) unsigned NOT NULL,
  KEY `FK_ability_upgrades_slots` (`slot_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `additional_units`
--

CREATE TABLE IF NOT EXISTS `additional_units` (
  `slot_id` int(10) unsigned NOT NULL,
  `unitname` varchar(100) NOT NULL,
  `item_0` int(10) NOT NULL,
  `item_1` int(10) NOT NULL,
  `item_2` int(10) NOT NULL,
  `item_3` int(10) NOT NULL,
  `item_4` int(10) NOT NULL,
  `item_5` int(10) NOT NULL,
  KEY `FK_additional_units_slots` (`slot_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `matches`
--

CREATE TABLE IF NOT EXISTS `matches` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `match_id` bigint(20) NOT NULL,
  `season` tinyint(4) unsigned DEFAULT NULL,
  `radiant_win` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `duration` int(11) unsigned NOT NULL DEFAULT '0',
  `first_blood_time` int(11) unsigned NOT NULL DEFAULT '0',
  `start_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `match_seq_num` bigint(20) unsigned DEFAULT NULL,
  `game_mode` tinyint(4) NOT NULL,
  `tower_status_radiant` int(11) unsigned NOT NULL DEFAULT '0',
  `tower_status_dire` int(11) unsigned NOT NULL DEFAULT '0',
  `barracks_status_radiant` int(11) unsigned NOT NULL DEFAULT '0',
  `barracks_status_dire` int(11) unsigned NOT NULL DEFAULT '0',
  `replay_salt` bigint(20) DEFAULT NULL,
  `lobby_type` smallint(6) unsigned NOT NULL DEFAULT '0',
  `human_players` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `leagueid` int(4) unsigned NOT NULL DEFAULT '0',
  `cluster` smallint(6) unsigned NOT NULL DEFAULT '0',
  `positive_votes` int(11) unsigned NOT NULL DEFAULT '0',
  `negative_votes` int(11) unsigned NOT NULL DEFAULT '0',
  `radiant_team_id` int(11) unsigned DEFAULT NULL,
  `radiant_name` varchar(200) DEFAULT NULL,
  `radiant_logo` varchar(32) DEFAULT NULL,
  `radiant_team_complete` tinyint(3) unsigned DEFAULT NULL,
  `dire_team_id` int(11) unsigned DEFAULT NULL,
  `dire_name` varchar(200) DEFAULT NULL,
  `dire_logo` varchar(32) DEFAULT NULL,
  `dire_team_complete` tinyint(3) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `matchid` (`match_id`),
  KEY `FK_matches_game_mods` (`game_mode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `picks_bans`
--

CREATE TABLE IF NOT EXISTS `picks_bans` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `match_id` bigint(20) NOT NULL,
  `is_pick` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `hero_id` int(10) NOT NULL DEFAULT '0',
  `team` int(1) unsigned NOT NULL DEFAULT '0',
  `order` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `slots`
--

CREATE TABLE IF NOT EXISTS `slots` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `match_id` bigint(20) NOT NULL DEFAULT '0',
  `account_id` bigint(20) NOT NULL DEFAULT '0',
  `hero_id` int(10) NOT NULL DEFAULT '0',
  `player_slot` tinyint(10) unsigned NOT NULL DEFAULT '0',
  `item_0` int(10) NOT NULL DEFAULT '0',
  `item_1` int(10) NOT NULL DEFAULT '0',
  `item_2` int(10) NOT NULL DEFAULT '0',
  `item_3` int(10) NOT NULL DEFAULT '0',
  `item_4` int(10) NOT NULL DEFAULT '0',
  `item_5` int(10) NOT NULL DEFAULT '0',
  `kills` int(10) NOT NULL DEFAULT '0',
  `deaths` int(10) NOT NULL DEFAULT '0',
  `assists` int(10) NOT NULL DEFAULT '0',
  `leaver_status` int(10) NOT NULL DEFAULT '0',
  `gold` int(10) NOT NULL DEFAULT '0',
  `last_hits` int(10) NOT NULL DEFAULT '0',
  `denies` int(10) NOT NULL DEFAULT '0',
  `gold_per_min` int(10) NOT NULL DEFAULT '0',
  `xp_per_min` int(10) NOT NULL DEFAULT '0',
  `gold_spent` int(10) NOT NULL DEFAULT '0',
  `hero_damage` int(10) NOT NULL DEFAULT '0',
  `tower_damage` int(10) NOT NULL DEFAULT '0',
  `hero_healing` int(10) NOT NULL DEFAULT '0',
  `level` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `FK_slots_users` (`account_id`),
  KEY `FK_slots_heroes` (`hero_id`),
  KEY `FK_slots_items` (`item_0`),
  KEY `FK_slots_items_1` (`item_1`),
  KEY `FK_slots_items_2` (`item_2`),
  KEY `FK_slots_items_3` (`item_3`),
  KEY `FK_slots_items_4` (`item_4`),
  KEY `FK_slots_items_5` (`item_5`),
  KEY `FK_slots_matches` (`match_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `account_id` bigint(20) NOT NULL DEFAULT '0',
  `personaname` varchar(50) NOT NULL DEFAULT '',
  `steamid` varchar(64) NOT NULL DEFAULT '',
  `communityvisibilitystate` bigint(20) DEFAULT NULL,
  `profilestate` bigint(20) DEFAULT NULL,
  `lastlogoff` varchar(256) DEFAULT NULL,
  `commentpermission` bigint(20) DEFAULT NULL,
  `profileurl` varchar(256) DEFAULT NULL,
  `avatar` varchar(256) DEFAULT NULL,
  `avatarmedium` varchar(256) DEFAULT NULL,
  `avatarfull` varchar(256) DEFAULT NULL,
  `personastate` bigint(20) DEFAULT NULL,
  `realname` varchar(256) DEFAULT NULL,
  `primaryclanid` varchar(256) DEFAULT NULL,
  `timecreated` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ability_upgrades`
--
ALTER TABLE `ability_upgrades`
  ADD CONSTRAINT `FK_ability_upgrades_slots` FOREIGN KEY (`slot_id`) REFERENCES `slots` (`id`);

--
-- Constraints for table `additional_units`
--
ALTER TABLE `additional_units`
  ADD CONSTRAINT `FK_additional_units_slots` FOREIGN KEY (`slot_id`) REFERENCES `slots` (`id`);

--
-- Constraints for table `slots`
--
ALTER TABLE `slots`
  ADD CONSTRAINT `FK_slots_matches` FOREIGN KEY (`match_id`) REFERENCES `matches` (`match_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
