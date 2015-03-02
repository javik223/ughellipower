-- phpMyAdmin SQL Dump
-- version 4.1.8
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 01, 2015 at 05:16 PM
-- Server version: 5.5.41-37.0-log
-- PHP Version: 5.4.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `ughellip_phcn`
--

-- --------------------------------------------------------

--
-- Table structure for table `exp_accessories`
--

CREATE TABLE IF NOT EXISTS `exp_accessories` (
  `accessory_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `class` varchar(75) NOT NULL DEFAULT '',
  `member_groups` varchar(50) NOT NULL DEFAULT 'all',
  `controllers` text,
  `accessory_version` varchar(12) NOT NULL,
  PRIMARY KEY (`accessory_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `exp_accessories`
--

INSERT INTO `exp_accessories` (`accessory_id`, `class`, `member_groups`, `controllers`, `accessory_version`) VALUES
(1, 'Expressionengine_info_acc', '1|5', 'addons|addons_accessories|addons_extensions|addons_fieldtypes|addons_modules|addons_plugins|admin_content|admin_system|content|content_edit|content_files|content_files_modal|content_publish|design|homepage|members|myaccount|tools|tools_communicate|tools_data|tools_logs|tools_utilities', '1.0'),
(2, 'Nsm_morphine_theme_acc', '1|5', 'addons|addons_accessories|addons_extensions|addons_fieldtypes|addons_modules|addons_plugins|admin_content|admin_system|content|content_edit|content_files|content_files_modal|content_publish|design|homepage|members|myaccount|tools|tools_communicate|tools_data|tools_logs|tools_utilities', '2.0.3');

-- --------------------------------------------------------

--
-- Table structure for table `exp_actions`
--

CREATE TABLE IF NOT EXISTS `exp_actions` (
  `action_id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `class` varchar(50) NOT NULL,
  `method` varchar(50) NOT NULL,
  PRIMARY KEY (`action_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=27 ;

--
-- Dumping data for table `exp_actions`
--

INSERT INTO `exp_actions` (`action_id`, `class`, `method`) VALUES
(1, 'Comment', 'insert_new_comment'),
(2, 'Comment_mcp', 'delete_comment_notification'),
(3, 'Comment', 'comment_subscribe'),
(4, 'Comment', 'edit_comment'),
(5, 'Email', 'send_email'),
(6, 'Safecracker', 'submit_entry'),
(7, 'Safecracker', 'combo_loader'),
(8, 'Search', 'do_search'),
(9, 'Channel', 'insert_new_entry'),
(10, 'Channel', 'filemanager_endpoint'),
(11, 'Channel', 'smiley_pop'),
(12, 'Member', 'registration_form'),
(13, 'Member', 'register_member'),
(14, 'Member', 'activate_member'),
(15, 'Member', 'member_login'),
(16, 'Member', 'member_logout'),
(17, 'Member', 'retrieve_password'),
(18, 'Member', 'reset_password'),
(19, 'Member', 'send_member_email'),
(20, 'Member', 'update_un_pw'),
(21, 'Member', 'member_search'),
(22, 'Member', 'member_delete'),
(23, 'Rte', 'get_js'),
(24, 'Freeform', 'insert_new_entry'),
(25, 'Freeform', 'retrieve_entries'),
(26, 'Freeform', 'delete_freeform_notification');

-- --------------------------------------------------------

--
-- Table structure for table `exp_automin_preferences`
--

CREATE TABLE IF NOT EXISTS `exp_automin_preferences` (
  `site_id` int(10) NOT NULL,
  `automin_enabled` varchar(1) NOT NULL DEFAULT 'n',
  `caching_enabled` varchar(1) NOT NULL DEFAULT 'n',
  `compress_html` varchar(1) NOT NULL DEFAULT 'n',
  `cache_path` varchar(255) NOT NULL DEFAULT '',
  `cache_url` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `exp_automin_preferences`
--

INSERT INTO `exp_automin_preferences` (`site_id`, `automin_enabled`, `caching_enabled`, `compress_html`, `cache_path`, `cache_url`) VALUES
(1, 'y', 'y', 'y', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `exp_captcha`
--

CREATE TABLE IF NOT EXISTS `exp_captcha` (
  `captcha_id` bigint(13) unsigned NOT NULL AUTO_INCREMENT,
  `date` int(10) unsigned NOT NULL,
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `word` varchar(20) NOT NULL,
  PRIMARY KEY (`captcha_id`),
  KEY `word` (`word`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_categories`
--

CREATE TABLE IF NOT EXISTS `exp_categories` (
  `cat_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_id` int(6) unsigned NOT NULL,
  `parent_id` int(4) unsigned NOT NULL,
  `cat_name` varchar(100) NOT NULL,
  `cat_url_title` varchar(75) NOT NULL,
  `cat_description` text,
  `cat_image` varchar(120) DEFAULT NULL,
  `cat_order` int(4) unsigned NOT NULL,
  PRIMARY KEY (`cat_id`),
  KEY `group_id` (`group_id`),
  KEY `cat_name` (`cat_name`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_category_fields`
--

CREATE TABLE IF NOT EXISTS `exp_category_fields` (
  `field_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_id` int(4) unsigned NOT NULL,
  `field_name` varchar(32) NOT NULL DEFAULT '',
  `field_label` varchar(50) NOT NULL DEFAULT '',
  `field_type` varchar(12) NOT NULL DEFAULT 'text',
  `field_list_items` text NOT NULL,
  `field_maxl` smallint(3) NOT NULL DEFAULT '128',
  `field_ta_rows` tinyint(2) NOT NULL DEFAULT '8',
  `field_default_fmt` varchar(40) NOT NULL DEFAULT 'none',
  `field_show_fmt` char(1) NOT NULL DEFAULT 'y',
  `field_text_direction` char(3) NOT NULL DEFAULT 'ltr',
  `field_required` char(1) NOT NULL DEFAULT 'n',
  `field_order` int(3) unsigned NOT NULL,
  PRIMARY KEY (`field_id`),
  KEY `site_id` (`site_id`),
  KEY `group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_category_field_data`
--

CREATE TABLE IF NOT EXISTS `exp_category_field_data` (
  `cat_id` int(4) unsigned NOT NULL,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_id` int(4) unsigned NOT NULL,
  PRIMARY KEY (`cat_id`),
  KEY `site_id` (`site_id`),
  KEY `group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `exp_category_groups`
--

CREATE TABLE IF NOT EXISTS `exp_category_groups` (
  `group_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_name` varchar(50) NOT NULL,
  `sort_order` char(1) NOT NULL DEFAULT 'a',
  `exclude_group` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `field_html_formatting` char(4) NOT NULL DEFAULT 'all',
  `can_edit_categories` text,
  `can_delete_categories` text,
  PRIMARY KEY (`group_id`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_category_posts`
--

CREATE TABLE IF NOT EXISTS `exp_category_posts` (
  `entry_id` int(10) unsigned NOT NULL,
  `cat_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`entry_id`,`cat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `exp_channels`
--

CREATE TABLE IF NOT EXISTS `exp_channels` (
  `channel_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `channel_name` varchar(40) NOT NULL,
  `channel_title` varchar(100) NOT NULL,
  `channel_url` varchar(100) NOT NULL,
  `channel_description` varchar(225) DEFAULT NULL,
  `channel_lang` varchar(12) NOT NULL,
  `total_entries` mediumint(8) NOT NULL DEFAULT '0',
  `total_comments` mediumint(8) NOT NULL DEFAULT '0',
  `last_entry_date` int(10) unsigned NOT NULL DEFAULT '0',
  `last_comment_date` int(10) unsigned NOT NULL DEFAULT '0',
  `cat_group` varchar(255) DEFAULT NULL,
  `status_group` int(4) unsigned DEFAULT NULL,
  `deft_status` varchar(50) NOT NULL DEFAULT 'open',
  `field_group` int(4) unsigned DEFAULT NULL,
  `search_excerpt` int(4) unsigned DEFAULT NULL,
  `deft_category` varchar(60) DEFAULT NULL,
  `deft_comments` char(1) NOT NULL DEFAULT 'y',
  `channel_require_membership` char(1) NOT NULL DEFAULT 'y',
  `channel_max_chars` int(5) unsigned DEFAULT NULL,
  `channel_html_formatting` char(4) NOT NULL DEFAULT 'all',
  `channel_allow_img_urls` char(1) NOT NULL DEFAULT 'y',
  `channel_auto_link_urls` char(1) NOT NULL DEFAULT 'n',
  `channel_notify` char(1) NOT NULL DEFAULT 'n',
  `channel_notify_emails` varchar(255) DEFAULT NULL,
  `comment_url` varchar(80) DEFAULT NULL,
  `comment_system_enabled` char(1) NOT NULL DEFAULT 'y',
  `comment_require_membership` char(1) NOT NULL DEFAULT 'n',
  `comment_use_captcha` char(1) NOT NULL DEFAULT 'n',
  `comment_moderate` char(1) NOT NULL DEFAULT 'n',
  `comment_max_chars` int(5) unsigned DEFAULT '5000',
  `comment_timelock` int(5) unsigned NOT NULL DEFAULT '0',
  `comment_require_email` char(1) NOT NULL DEFAULT 'y',
  `comment_text_formatting` char(5) NOT NULL DEFAULT 'xhtml',
  `comment_html_formatting` char(4) NOT NULL DEFAULT 'safe',
  `comment_allow_img_urls` char(1) NOT NULL DEFAULT 'n',
  `comment_auto_link_urls` char(1) NOT NULL DEFAULT 'y',
  `comment_notify` char(1) NOT NULL DEFAULT 'n',
  `comment_notify_authors` char(1) NOT NULL DEFAULT 'n',
  `comment_notify_emails` varchar(255) DEFAULT NULL,
  `comment_expiration` int(4) unsigned NOT NULL DEFAULT '0',
  `search_results_url` varchar(80) DEFAULT NULL,
  `ping_return_url` varchar(80) DEFAULT NULL,
  `show_button_cluster` char(1) NOT NULL DEFAULT 'y',
  `rss_url` varchar(80) DEFAULT NULL,
  `enable_versioning` char(1) NOT NULL DEFAULT 'n',
  `max_revisions` smallint(4) unsigned NOT NULL DEFAULT '10',
  `default_entry_title` varchar(100) DEFAULT NULL,
  `url_title_prefix` varchar(80) DEFAULT NULL,
  `live_look_template` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`channel_id`),
  KEY `cat_group` (`cat_group`),
  KEY `status_group` (`status_group`),
  KEY `field_group` (`field_group`),
  KEY `channel_name` (`channel_name`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `exp_channels`
--

INSERT INTO `exp_channels` (`channel_id`, `site_id`, `channel_name`, `channel_title`, `channel_url`, `channel_description`, `channel_lang`, `total_entries`, `total_comments`, `last_entry_date`, `last_comment_date`, `cat_group`, `status_group`, `deft_status`, `field_group`, `search_excerpt`, `deft_category`, `deft_comments`, `channel_require_membership`, `channel_max_chars`, `channel_html_formatting`, `channel_allow_img_urls`, `channel_auto_link_urls`, `channel_notify`, `channel_notify_emails`, `comment_url`, `comment_system_enabled`, `comment_require_membership`, `comment_use_captcha`, `comment_moderate`, `comment_max_chars`, `comment_timelock`, `comment_require_email`, `comment_text_formatting`, `comment_html_formatting`, `comment_allow_img_urls`, `comment_auto_link_urls`, `comment_notify`, `comment_notify_authors`, `comment_notify_emails`, `comment_expiration`, `search_results_url`, `ping_return_url`, `show_button_cluster`, `rss_url`, `enable_versioning`, `max_revisions`, `default_entry_title`, `url_title_prefix`, `live_look_template`) VALUES
(1, 1, 'press_release', 'Press Release', 'http://www.ughellipower.com/', NULL, 'en', 7, 0, 1419878629, 0, '', 2, 'open', 1, NULL, NULL, 'y', 'y', NULL, 'all', 'y', 'n', 'n', NULL, NULL, 'y', 'n', 'n', 'n', 5000, 0, 'y', 'xhtml', 'safe', 'n', 'y', 'n', 'n', NULL, 0, NULL, NULL, 'y', NULL, 'n', 10, '', '', 0),
(2, 1, 'homepage_slideshow', 'Homepage Slideshow', 'http://www.ughellipower.com/', '', 'en', 2, 0, 1366340335, 0, '', 2, 'open', 2, NULL, '', 'n', 'y', NULL, 'all', 'y', 'n', 'n', '', '', 'n', 'n', 'n', 'n', 5000, 0, 'y', 'xhtml', 'safe', 'n', 'y', 'n', 'n', '', 0, '', '', 'n', '', 'y', 10, '', '', 1),
(3, 1, 'general_content', 'General Content', 'http://www.ughellipower.com/', '', 'en', 3, 0, 1366346695, 0, '', 2, 'open', 3, 4, '', 'n', 'y', NULL, 'all', 'y', 'n', 'n', '', '', 'n', 'n', 'n', 'n', 5000, 0, 'y', 'xhtml', 'safe', 'n', 'y', 'n', 'n', '', 0, '', '', 'n', '', 'y', 10, '', '', 10),
(4, 1, 'contact', 'Contact', 'http://www.ughellipower.com/', '', 'en', 1, 0, 1366347190, 0, '', 2, 'open', 4, 4, '', 'n', 'y', NULL, 'all', 'y', 'n', 'n', '', '', 'n', 'n', 'n', 'n', 5000, 0, 'y', 'xhtml', 'safe', 'n', 'y', 'n', 'n', '', 0, '', '', 'n', '', 'y', 10, '', '', 10),
(5, 1, 'plant_gallery', 'Plant Gallery', 'http://www.ughellipower.com/', NULL, 'en', 1, 0, 1366384316, 0, '', 2, 'open', 5, NULL, NULL, 'y', 'y', NULL, 'all', 'y', 'n', 'n', NULL, NULL, 'y', 'n', 'n', 'n', 5000, 0, 'y', 'xhtml', 'safe', 'n', 'y', 'n', 'n', NULL, 0, NULL, NULL, 'y', NULL, 'n', 10, '', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `exp_channel_data`
--

CREATE TABLE IF NOT EXISTS `exp_channel_data` (
  `entry_id` int(10) unsigned NOT NULL,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `channel_id` int(4) unsigned NOT NULL,
  `field_id_1` text,
  `field_ft_1` tinytext,
  `field_id_2` text,
  `field_ft_2` tinytext,
  `field_id_3` text,
  `field_ft_3` tinytext,
  `field_id_4` text,
  `field_ft_4` tinytext,
  `field_id_5` text,
  `field_ft_5` tinytext,
  `field_id_6` text,
  `field_ft_6` tinytext,
  `field_id_7` text,
  `field_ft_7` tinytext,
  `field_id_9` text,
  `field_ft_9` tinytext,
  `field_id_10` text,
  `field_ft_10` tinytext,
  PRIMARY KEY (`entry_id`),
  KEY `channel_id` (`channel_id`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `exp_channel_data`
--

INSERT INTO `exp_channel_data` (`entry_id`, `site_id`, `channel_id`, `field_id_1`, `field_ft_1`, `field_id_2`, `field_ft_2`, `field_id_3`, `field_ft_3`, `field_id_4`, `field_ft_4`, `field_id_5`, `field_ft_5`, `field_id_6`, `field_ft_6`, `field_id_7`, `field_ft_7`, `field_id_9`, `field_ft_9`, `field_id_10`, `field_ft_10`) VALUES
(1, 1, 1, '', 'none', '<p>The new website of Ughelli Power, went live on 9th April, 2012. The world now has access to information concerning Ughelli Power.</p>\n\n<p>The launch of the new website, which offers quick and easy access to essential information on Ughelli Power, is part of the ongoing efforts to enhance quality and availability of information to staff and consumers.</p>\n\n<p>The website boasts a modern look and is divided into: About, Plants/Facilities, Press Release, Safety Policy and Contact.Each page provides detailed information on all the aspects of the organisation&#39;s functioning.</p>\n\n<p>The website&#39;s user-friendly nature provides users with more efficient access to Ughelli Power&#39;s resources.</p>\n\n<p>For news and press releases, the Press Release sectionn has been created, to provide timely updates on happenings in Ughelli Power.</p>\n', 'none', '', 'none', '', 'xhtml', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none'),
(2, 1, 2, '', NULL, '', NULL, '{filedir_1}ughelli-power-black-start-of-the-national-grid.jpg', 'none', '', 'xhtml', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none'),
(3, 1, 2, '', NULL, '', NULL, '{filedir_1}ughelli-power-generating-power-for-milions-of-nigerians.jpg', 'none', '', 'xhtml', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none'),
(4, 1, 3, '', NULL, '', NULL, '', NULL, '<div class="grid_16" id="body">\n	<div class="grid_14 prefix_1 suffix_1" id="wrapper">\n		<h1 class="heading">\n			About Us</h1>\n		<div class="grid_6 alpha">\n			<img alt="Ughelli Gas Turbine" src="/assets/img/ughelli-gas-turbine.jpg" />\n			<p class="emphasis_light">\n				Gas Turbine Station located at Kilometre 20 Ughelli-Patani Road, before Ughelli Town</p>\n		</div>\n		<div class="grid_7">\n			<h2 class="subhead bigger clearfix">\n				Transcorp Ughelli Power makes life easier for millions of Nigerians, with an installed capacity of 900MW of electricity, thereby contributing its quota in actualizing the goal that Nigerians enjoy cheap and constant power supply.</h2>\n			<div class="line">\n				&nbsp;</div>\n			<h2 class="subhead_dark">\n				Vision</h2>\n			<p>\n				To be the best in generation of reliable, stable and high quality eletricity within the Nigerian domain.</p>\n			<h2 class="subhead_dark">\n				Mission</h2>\n			<p>\n				To generate stable eletricity efficiently; at the most competitive cost through team work, while partnering with the community and the environment</p>\n		</div>\n		<div class="grid_14 line alpha">\n			&nbsp;</div>\n		<div class="grid_9">\n			<h2 class="subhead_dark">\n				Historical Perspective</h2>\n			<p>\n				Ughelli Power now Transcorp Ughelli Power is among the 18 electricity successor companies unbundled from Power Holding Company of Nigeria (PHCN) in 2003. Owing to various changes in the Federal Government policies on the electricity industry from 1973 to 2009, Ughelli Power Plc has on various occasions changed its name and out-look.</p>\n			<p>\n				The station was built in 1964 with an installed capacity of 2X36MW or 72MW from two Stal-Laval gas turbines. Then the station was called Delta I under Electricity Corporation of Nigeria (ECN).</p>\n			<p>\n				In 1975 six units of &nbsp;General Electric (GE) Frame 5 gas turbines (20MW each) were installed in the station known as Delta II, after the merger of Niger Dam Authority (NDA), Kainji and the ECN to form the National Electric Power Authority (NEPA).</p>\n			<p>\n				In 1978 additional six units of GE &nbsp;Frame 5 gas turbines, like the ones installed in 1975, were added to Delta Power Station (Known as Delta III) to boost the installed capacity to a total of 312MW, as follows:</p>\n			<p>\n				Delta I, 2 X 36 &thinsp; &thinsp; &thinsp;72MW<br />\n				Delta II, 6 X 20&thinsp; &thinsp; &thinsp;120MW<br />\n				Delta III, 6 X 20&thinsp; &thinsp;&thinsp;120MW<br />\n				<strong>Total &thinsp; &thinsp;&thinsp;&thinsp; &thinsp; &thinsp; &thinsp; &thinsp; &thinsp; &thinsp; &thinsp; 312MW</strong></p>\n			<p>\n				The station was upgraded in 1991 with the addition of 6 X 100MW (600MW) GE Frame 9 gas turbines.</p>\n			<p>\n				From 2000 to 2008 Delta II and Delta III GE units were upgraded to 150MW station each: built by Hitachi of Japan. The control systems were upgraded to Mark V, a fully computerized control system for Delta II and III. While Delta I was scrapped.</p>\n			<p>\n				Delta IV control system was also upgraded to Mark V by GE of USA which built the station.</p>\n			<p>\n				<span style="font-size: 15px;">Today, the generation capacity of Transcorp Ughelli Power stands at 900MW with the Delta II, III &amp; IV running at full capacity. Most of the electricity&nbsp;</span><span style="font-size: 15px;">produced by Ughelli is transported through a network of conductors, to the national grid.</span></p>\n		</div>\n		<div class="grid_4 omega" id="quick_facts">\n			<h1 class="subhead_dark bigger">\n				Quick Facts</h1>\n			<h3 class="line">\n				&nbsp;</h3>\n			<ul class="list border_bottom">\n				<li>\n					Over 49years of Service</li>\n				<li>\n					Transcorp Ughelli Power, has four (4) power plants, Delta I, Delta II, Delta III &amp; Delta IV with the Delta I retired.</li>\n				<li>\n					<span style="font-size: 15px; background-color: rgb(235, 237, 245);">Transcorp&nbsp;</span>Ughelli Power has an intalled capacity of 900MW.</li>\n				<li>\n					Custom fitted Engine starters in Delta II and Delta III turbines enables the station to black start the National Grid in case of emergency or cases of total or partial syayem collapses.</li>\n				<li>\n					<span style="font-size: 15px; background-color: rgb(235, 237, 245);">Transcorp&nbsp;</span>Ughelli power provides auxillary facilities for staff, such as: Staff Housing, Medicare, School and Recreational Club.</li>\n			</ul>\n		</div>\n	</div>\n</div>\n', 'xhtml', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none'),
(5, 1, 3, '', NULL, '', NULL, '', NULL, '<div class="grid_16" id="body">\n	<div class="grid_14 prefix_1 suffix_1" id="wrapper">\n		<h1 class="heading">\n			Power Plants<br />\n			&amp; Facilities</h1>\n		<ul class="pp_sub_nav">\n			<li>\n				<a href="#power-plants">Power Plants</a></li>\n			<li>\n				<a href="#generators">Generators</a></li>\n			<li>\n				<a href="#turbine">Turbine</a></li>\n			<li>\n				<a href="#raw-materials">Raw Materials</a></li>\n			<li>\n				<a href="#gallery">Gallery</a></li>\n		</ul>\n		<p class="subhead_dark">\n			Delta II and Delta III GE is fited with 150MW station each: built by Marubeni of Japan. The control systems were upgraded to Mark V, a fully computerized control system: for Delta II and III. While Delta I is scrapped.</p>\n		<p class="subhead_dark">\n			Delta IV control system is also fitted with a Mark V, upgraded by GE of USA which built the station.</p>\n		<a name="power-plants"></a>\n		<div class="grid_13 alpha">\n			<img alt="Ughelli Power Plants information" src="/assets/img/power-plants.jpg" /></div>\n		<a name="generators"></a>\n		<div class="grid_13 alpha">\n			<img alt="Ughelli Generators Information" src="/assets/img/generators.jpg" /></div>\n		<a name="turbine"></a>\n		<div class="grid_13 alpha">\n			<img alt="Ughelli Turbines Information" src="/assets/img/turbines.jpg" /></div>\n		<a name="raw-materials"></a>\n		<div class="grid_13 alpha border-bottom">\n			<h2 class="subhead_dark">\n				Raw Materials For Production</h2>\n			<p>\n				Ughelli Power Plc gets supply of natural gas from Shell Petroleum Development Company (SPDC) for Delta II &amp; III at a gas pressure of 21 &ndash; 22bars and Nigeria Gas Company (NGC) for Delta IV at a gas pressure of 19 &ndash; 21bars, but both SPDC and NGC can compliment each other in times of emergency through a tripartite gas line valve.</p>\n			<p>\n				The other major raw material is the atmospheric air that is filtered and compressed. Part of the air is used for cooling and atomization of the diesel fuel (where need be) for combustion during operation.</p>\n			<p>\n				Most part of the compressed air is used for the combustion in the combustion chambers, with the natural gas.</p>\n			<p>\n				Hydrogen is used in cooling the heavy generators at Delta IV because of the enormous heat that the generator windings emit. Hydrogen cools ten times better than air, hence its preference for air despite its high inflammability.</p>\n			<p>\n				The hydrogen is generated locally, from the electrolysis of water. Lube oil or lubricant oil is used in the gas turbine station for lubrication of the bearings, for hydraulic pressure and heat extraction.</p>\n		</div>\n		<div class="grid_13 alpha border-bottom">\n			<h2 class="subhead_dark">\n				Components Of The Gas Turbine</h2>\n			<ul class="list">\n				<li>\n					The starting device &ndash; a 3.3Kv starting motor or prime mover in a black start system.</li>\n				<li>\n					The air-filter arrangement</li>\n				<li>\n					The compressor</li>\n				<li>\n					The combustion chambers</li>\n				<li>\n					The turbines</li>\n				<li>\n					The expansion below or exhaust</li>\n				<li>\n					The generator</li>\n				<li>\n					The exciter</li>\n			</ul>\n		</div>\n		<div class="grid_13 alpha border-bottom">\n			<h2 class="subhead_dark">\n				The Piping Arrangement</h2>\n			<div class="grid_5 alpha">\n				<img alt="The piping arrangement" src="/assets/img/the-piping-arrangement.jpg" /></div>\n			<ul class="list grid_4 no-margin-top">\n				<li>\n					The gas supply piping</li>\n				<li>\n					The lube oil piping</li>\n				<li>\n					The hydraulic oil piping</li>\n				<li>\n					The cooling water piping</li>\n				<li>\n					The air piping</li>\n				<li>\n					The hydrogen piping</li>\n				<li>\n					The CO2 piping</li>\n			</ul>\n		</div>\n		<div class="grid_13 alpha border-bottom">\n			<h2 class="subhead_dark">\n				Method Of Production Of Electricity</h2>\n			<p>\n				The gas turbine use natural gas and compressed air as fuel to burn and rotate the shaft that turns the generator thereby generating electricity. Excitation is necessary to produce the required magnetic flux.</p>\n		</div>\n		<div class="grid_13 alpha border-bottom">\n			<h2 class="subhead_dark">\n				Uses Of Electricity</h2>\n			<p>\n				Most of the electricity is transported through step up transformers and network of conductors to various location around the country in the form of grid. Some parts of the electricity are utilized locally within and outside the plant.</p>\n		</div>\n		<div class="grid_13 alpha border-bottom">\n			<h2 class="subhead_dark">\n				Hydrogen Gas Production Plant</h2>\n			<p>\n				Hydrogen gas (H2) is produced in the station for cooling the heaven General Eletronics (GE) turbine generators of Delta IV.</p>\n			<p>\n				<strong>Plant Details</strong><br />\n				<strong>Model:</strong> 00700<br />\n				<strong>Capacity:</strong> 2 x 15Nm3/h<br />\n				<strong>Frequency:</strong> 50Hz<br />\n				<strong>Date of Comissioning:</strong> 1998/1999</p>\n		</div>\n		<div class="grid_13 alpha border-bottom">\n			<h2 class="subhead_dark">\n				Antifire System</h2>\n			<p>\n				The plant is equipped with sprinkler and hydrant fire fighting systems with automatic CO2 high sensitive flame detector and combating mechanics for fire emergency.</p>\n		</div>\n		<div class="grid_13 alpha border-bottom">\n			<h2 class="subhead_dark">\n				The Station&rsquo;s Highyard (Switchyard)</h2>\n			<div class="grid_6 alpha">\n				<img alt="Switch Yard" src="/assets/img/switchyard.jpg" /></div>\n			<div class="grid_6">\n				<p>\n					The Delta IV 330KV Highyard is configured to 1 1/2 breaker system to evacuate generated electricity from six (6) units of 6 x 100 Megawatts (600MW) of the plant into the national grid for onward distribution to power consumers in and outside the country</p>\n			</div>\n		</div>\n		<div class="grid_13 alpha">\n			<h2 class="subhead_dark">\n				Auxillary Facilities</h2>\n			<p>\n				The plant provides auxillary facilities for staff working in the plant, these incldudes: a staff housing estate built within the plant and a rented estate in the adjoining Ughelli metropolis. The plant also includes a standard medical clinic to provide medicare for staff and their family, in addition to specialist hospitals under retainership for referral purposes. For relaxation, a recreational club is situated in the plant for staff and their family. Lastly, a staff school comprising of a primary and secondary school in located in the staff estate to serve the educational demands of staff and the immediate community wards.</p>\n		</div>\n		<a name="gallery"></a>\n		<div class="grid_13 alpha" id="gallery">\n			<h2 class="subhead_dark">\n				Gallery</h2>\n			<h3 class="line">\n				&nbsp;</h3>\n			<p>\n				<em>Click on each thumbnail to get a larger view.</em></p>\n			<a class="fancybox-thumb" href="/assets/img/image-big1.jpg" rel="fancybox-thumb" title="Delta II and II gas line scrubber"> <img alt="Delta II and II gas line scrubber" src="/assets/img/image1.jpg" /> </a> <a class="fancybox-thumb" href="/assets/img/image-big2.jpg" rel="fancybox-thumb" title="120MVA Toshiba unit transformer"> <img alt="" src="/assets/img/image2.jpg" /> </a> <a class="fancybox-thumb" href="/assets/img/image-big3.jpg" rel="fancybox-thumb" title="Detla IV turbine floor"> <img alt="" src="/assets/img/image3.jpg" /> </a> <a class="fancybox-thumb" href="/assets/img/image-big4.jpg" rel="fancybox-thumb" title="Delta IV Control Room"> <img alt="" src="/assets/img/image4.jpg" /> </a> <a class="fancybox-thumb" href="/assets/img/image-big5.jpg" rel="fancybox-thumb" title="Delta II turbine floor"> <img alt="" src="/assets/img/image5.jpg" /> </a> <a class="fancybox-thumb" href="/assets/img/image-big6.jpg" rel="fancybox-thumb" title=""> <img alt="" src="/assets/img/image6.jpg" /> </a> <a class="fancybox-thumb" href="/assets/img/image-big7.jpg" rel="fancybox-thumb" title="The hydrogen plant"><img alt="" src="/assets/img/image7.jpg" /></a> <a class="fancybox-thumb" href="/assets/img/image-big8.jpg" rel="fancybox-thumb" title="GT13 hitachi-turbine generator"> <img alt="" src="/assets/img/image8.jpg" /> </a> <a class="fancybox-thumb" href="/assets/img/image-big9.jpg" rel="fancybox-thumb" title=""> <img alt="" src="/assets/img/image9.jpg" /> </a> <a class="fancybox-thumb" href="/assets/img/image-big10.jpg" rel="fancybox-thumb" title=""> <img alt="" src="/assets/img/image10.jpg" /> </a></div>\n	</div>\n</div>\n', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none'),
(6, 1, 3, '', NULL, '', NULL, '', NULL, '<div class="grid_16" id="body">\n	<div class="grid_14 prefix_1 suffix_1" id="wrapper">\n		<h1 class="heading">\n			Safety Policy</h1>\n		<h2 class="grid_10 subhead bigger clearfix">\n			Please use the contact form below to contact us, or you can reach us via our office addresss and phone numbers</h2>\n		<div class="grid_11">\n			<p>\n				<strong>At Ughelli Power, we recognize the value of safe and reliable operations and believe that our success is directly linked to the safety of our employees and the public.</strong></p>\n			<p>\n				We meet this challenge by promoting a safety culture wherein full compliance with safety regulations is the minimum level of acceptable performance. Doing so, requires a disciplined approach to safety, including governing adherence to standards that clearly communicates safety expectations, employee safety programs that meet and exceed these expecations.</p>\n			<p>\n				In compliance with our safety measures, we have put in place emergency measures, when all efforts fails. These includes an antifire system with sprinklers and hydrant fire fighting system with flame detector for fighting fire emergency. Also, a medical care center is located in the plant premises, for quick response in case of medical emergency.</p>\n			<p>\n				Our host communities are also not left out from these safety measures, we continually educate people on how to observe safety measures around our installations and what to do in cases of emergency.</p>\n			<h2 class="subhead_dark">\n				Electrical Safety Tips</h2>\n			<ul class="list">\n				<li>\n					<strong>Keep away from transformers.</strong></li>\n				<li>\n					<strong>Never attempt to open the door of one of these transformers.</strong> If you find a door unlocked, call the nearest PHCN service station.</li>\n				<li>\n					<strong>Look up!</strong> Always examine your surroundings for power line locations before doing any outside work.</li>\n				<li>\n					<strong>Be cautious on the roof.</strong> Working on a roof may put you close to an overhead power line. Avoid standing up and accidentally touching a line with your head or shoulder.</li>\n				<li>\n					<strong>Do not plant vegetation</strong> to grow up or near utility poles or live wires.</li>\n				<li>\n					<strong>Be aware when moving farm equipment.</strong> Stay clear of overhead power lines when moving or storing farm equipments. Metals and wet objects conduct eletricity.</li>\n				<li>\n					<strong>Do not throw objects up into power lines.</strong> This can cause short circuits and could result in injuries. This includes items you might not consider conductive, like ropes and strings</li>\n				<li>\n					<strong>See something tangled in a power line? Stay clear.</strong> Never attempt to move an object from a power line yourself. Never climb the pole. Call any PHCN service station - they can help</li>\n				<li>\n					<strong>Never touch a downed power line.</strong> If you see a downed power line, contact your local PHCN service station immediately. Don&rsquo;t touch the line or anything that is in contact with it. Don&rsquo;t attempt to move the line. Keep others away, and consider every wire on the ground to be energized and dangerous.</li>\n				<li>\n					<strong>Obey warning signs.</strong> &ldquo;DANGER: HIGH VOLTAGE&rdquo; and other warning signs are posted in some locations. But remember, all electrical equipment can be dangerous.</li>\n				<li>\n					<strong>Substations are not playgrounds.</strong> At neighborhood substations, high-voltage electricity is reduced to be sent to homes. Don&#39;t climb over or crawl under substation fences, walls or gates. If a ball or toy goes over a fence and into a substation, call the nearest PHCN office. We will come and get it out for you.</li>\n				<li>\n					<strong>Stay inside during storms.</strong> When there is lightning outdoors, get inside a building or car if possible. Keep away from windows and open doors</li>\n			</ul>\n		</div>\n	</div>\n</div>\n', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none'),
(7, 1, 4, '', NULL, '', NULL, '', NULL, '', NULL, '<p>\n	<strong>Office Address: </strong>Kilometre 20 Ughelli-Patani Road, before Ughelli Town.</p>\n<p>\n	<strong>E-mail: </strong>info@transcorpughelli.com</p>\n', 'none', '', 'none', '', 'none', '', 'none', '', 'none'),
(17, 1, 5, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '<div class="grid_16" id="body">\n	<div class="grid_14 prefix_1 suffix_1" id="wrapper">\n		<h1 class="heading">\n			Power Plants<br />\n			&amp; Facilities</h1>\n		<ul class="pp_sub_nav">\n			<li>\n				<a href="#power-plants">Power Plants</a></li>\n			<li>\n				<a href="#generators">Generators</a></li>\n			<li>\n				<a href="#turbine">Turbine</a></li>\n			<li>\n				<a href="#raw-materials">Raw Materials</a></li>\n			<li>\n				<a href="#gallery">Gallery</a></li>\n		</ul>\n		<p class="subhead_dark">\n			Delta II and Delta III GE is fited with 150MW station each: built by Hitachi of Japan. The control systems were upgraded to Mark V, a fully computerized control system: for Delta II and III. While Delta I is scrapped.</p>\n		<p class="subhead_dark">\n			Delta IV control system is also fitted with a Mark V, upgraded by GE of USA which built the station.</p>\n		<a name="power-plants"></a>\n		<div class="grid_13 alpha">\n			<img alt="Ughelli Power Plants information" src="assets/img/power-plants.jpg" /></div>\n		<a name="generators"></a>\n		<div class="grid_13 alpha">\n			<img alt="Ughelli Generators Information" src="assets/img/generators.jpg" /></div>\n		<a name="turbine"></a>\n		<div class="grid_13 alpha">\n			<img alt="Ughelli Turbines Information" src="assets/img/turbines.jpg" /></div>\n		<a name="raw-materials"></a>\n		<div class="grid_13 alpha border-bottom">\n			<h2 class="subhead_dark">\n				Raw Materials For Production</h2>\n			<p>\n				Transcorp Ughelli Power gets supply of natural gas from Shell Petroleum Development Company (SPDC) for Delta II &amp; III at a gas pressure of 21 &ndash; 22bars and Nigeria Gas Company (NGC) for Delta IV at a gas pressure of 19 &ndash; 21bars, but both SPDC and NGC can compliment each other in times of emergency through a tripartite gas line valve.</p>\n			<p>\n				The other major raw material is the atmospheric air that is filtered and compressed. Part of the air is used for cooling and atomization of the diesel fuel (where need be) for combustion during operation.</p>\n			<p>\n				Most part of the compressed air is used for the combustion in the combustion chambers, with the natural gas.</p>\n			<p>\n				Hydrogen is used in cooling the heavy generators at Delta IV because of the enormous heat that the generator windings emit. Hydrogen cools ten times better than air, hence its preference for air despite its high inflammability.</p>\n			<p>\n				The hydrogen is generated locally, from the electrolysis of water. Lube oil or lubricant oil is used in the gas turbine station for lubrication of the bearings, for hydraulic pressure and heat extraction.</p>\n		</div>\n		<div class="grid_13 alpha border-bottom">\n			<h2 class="subhead_dark">\n				Components Of The Gas Turbine</h2>\n			<ul class="list">\n				<li>\n					The starting device &ndash; a 3.3Kv starting motor or prime mover in a black start system.</li>\n				<li>\n					The air-filter arrangement</li>\n				<li>\n					The compressor</li>\n				<li>\n					The combustion chambers</li>\n				<li>\n					The turbines</li>\n				<li>\n					The expansion below or exhaust</li>\n				<li>\n					The generator</li>\n				<li>\n					The exciter</li>\n			</ul>\n		</div>\n		<div class="grid_13 alpha border-bottom">\n			<h2 class="subhead_dark">\n				The Piping Arrangement</h2>\n			<div class="grid_5 alpha">\n				<img alt="The piping arrangement" src="assets/img/the-piping-arrangement.jpg" /></div>\n			<ul class="list grid_4 no-margin-top">\n				<li>\n					The gas supply piping</li>\n				<li>\n					The lube oil piping</li>\n				<li>\n					The hydraulic oil piping</li>\n				<li>\n					The cooling water piping</li>\n				<li>\n					The air piping</li>\n				<li>\n					The hydrogen piping</li>\n				<li>\n					The CO2 piping</li>\n			</ul>\n		</div>\n		<div class="grid_13 alpha border-bottom">\n			<h2 class="subhead_dark">\n				Method Of Production Of Electricity</h2>\n			<p>\n				The gas turbine use natural gas and compressed air as fuel to burn and rotate the shaft that turns the generator thereby generating electricity. Excitation is necessary to produce the required magnetic flux.</p>\n		</div>\n		<div class="grid_13 alpha border-bottom">\n			<h2 class="subhead_dark">\n				Uses Of Electricity</h2>\n			<p>\n				Most of the electricity is transported through step up transformers and network of conductors to various location around the country in the form of grid. Some parts of the electricity are utilized locally within and outside the plant.</p>\n		</div>\n		<div class="grid_13 alpha border-bottom">\n			<h2 class="subhead_dark">\n				Hydrogen Gas Production Plant</h2>\n			<p>\n				Hydrogen gas (H2) is produced in the station for cooling the heaven General Eletronics (GE) turbine generators of Delta IV.</p>\n			<p>\n				<strong>Plant Details</strong><br />\n				<strong>Model:</strong> 00700<br />\n				<strong>Capacity:</strong> 2 x 15Nm3/h<br />\n				<strong>Frequency:</strong> 50Hz<br />\n				<strong>Date of Comissioning:</strong> 1998/1999</p>\n		</div>\n		<div class="grid_13 alpha border-bottom">\n			<h2 class="subhead_dark">\n				Antifire System</h2>\n			<p>\n				The plant is equipped with sprinkler and hydrant fire fighting systems with automatic CO2 high sensitive flame detector and combating mechanics for fire emergency.</p>\n		</div>\n		<div class="grid_13 alpha border-bottom">\n			<h2 class="subhead_dark">\n				The Station&rsquo;s Highyard (Switchyard)</h2>\n			<div class="grid_6 alpha">\n				<img alt="Switch Yard" src="assets/img/switchyard.jpg" /></div>\n			<div class="grid_6">\n				<p>\n					The Delta IV 330KV Highyard is configured to 1 1/2 breaker system to evacuate generated electricity from six (6) units of 6 x 100 Megawatts (600MW) of the plant into the national grid for onward distribution to power consumers in and outside the country</p>\n			</div>\n		</div>\n		<div class="grid_13 alpha">\n			<h2 class="subhead_dark">\n				Auxillary Facilities</h2>\n			<p>\n				The plant provides auxillary facilities for staff working in the plant, these incldudes: a staff housing estate built within the plant and a rented estate in the adjoining Ughelli metropolis. The plant also includes a standard medical clinic to provide medicare for staff and their family, in addition to specialist hospitals under retainership for referral purposes. For relaxation, a recreational club is situated in the plant for staff and their family. Lastly, a staff school comprising of a primary and secondary school in located in the staff estate to serve the educational demands of staff and the immediate community wards.</p>\n		</div>\n		<a name="gallery"></a>\n		<div class="grid_13 alpha" id="gallery">\n			<h2 class="subhead_dark">\n				Gallery</h2>\n			<h3 class="line">\n				&nbsp;</h3>\n			<p>\n				<em>Click on each thumbnail to get a larger view.</em></p>\n		</div>\n	</div>\n</div>\n', 'none', '1', 'none'),
(18, 1, 1, '', 'none', '<p>The Management and Staff of Ughelli Power Plc is glad to inform you that GT 16, a 100MW gas turbine, which was one of our critical projects, has been restored to service. It was on the Natinal Grid, Monday 29th April 2013, delivering 90MW to Nigeria.</p>\n\n<p>&nbsp;</p>\n\n<p>Many thanks to the Federal Ministry of Power (FMP) and Presidential task force on Power (PTFP) for their patience, support and understanding towards the restoration of the unit.</p>\n\n<p>&nbsp;</p>\n\n<p>&nbsp;</p>\n\n<p>ENGR. P.I. UMUNNA</p>\n\n<p>MD/CEO</p>\n', 'xhtml', '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL),
(19, 1, 1, '', 'none', '<p><br />\nLagos, Nigeria&nbsp;&ndash;&nbsp;August 21, 2013&nbsp;&ndash; Transcorp Ughelli Power Limited (TUPL), a subsidiary of Transnational Corporation of Nigeria Plc (Transcorp) today announced the payment to the Bureau of Public Enterprises (BPE) of $225million, representing 75 per cent of the $300million bid price for the 972 mega watts capacity Ughelli Power Plant (the Plant). With this, TUPL has now completed the full payment for the Plant.<br />\n&nbsp;<br />\nUghelli Power Plc is one of the six power generation companies unbundled from the Power Holding Company of Nigeria (PHCN). In July 2012, TUPL bid $300million to acquire Ughelli Power Plc, owner and operator of Ughelli Power Plant in Delta State.<br />\n<br />\nTUPL emerged the preferred bidder for the acquisition on September 25, 2012 following a successful technical and financial evaluation by the BPE signaling the company&rsquo;s unreserved capacity and competence to manage the Plant. Subsequently, TUPL met the 25 per cent deposit deadline by paying the sum of US$75million to the BPE on March 20, 2013.<br />\nTUPL plans to increase the power generation of the plant from 300MW to over 1070MW in the next five years.<br />\nCommenting on the successful acquisition of the Plant, the Chairman of Transcorp,&nbsp;Tony O. Elumelu, CON&nbsp;said:<br />\n&nbsp;<br />\nThis is a laudable and remarkable achievement, but it is only just the beginning. We can now embark fully on our strategy to contribute to the development of Nigeria&#39;s power sector, whilst creating long term economic and social value for our stakeholders and the greater community. We fully expect our engagement on this world-class project to improve the living standards of all Nigerians as well as impact positively on our country&rsquo;s GDP.<br />\nObinna Ufudo, President/CEO of Transcorp said:<br />\n&nbsp;<br />\nTranscorp&rsquo;s ability to achieve set goals and objectives propels us to target even larger investments in our selected business sectors with the potential to contribute significantly to Nigeria&rsquo;s development. TUPL has extensive worldwide power sector experience in Africa, Europe and the Middle East which underscores its unquestionable capacity to effectively manage the plant profitably in line with international standards.<br />\nFollowing this remarkable milestone, we shall now take over the operations and management of the Plant, deploy our strategy to ensure a smooth transition and in the near term, create a profitable business that will deliver greater outcome in terms of power to the nation. Our inclination to success consistently translates to value for all our stakeholders, one of the goals which we pledged from the outset.<br />\n&nbsp;<br />\nAdeoye Fadeyibi, the CEO of TUPL affirmed: &nbsp;<br />\n&nbsp;<br />\nThis is an exciting day for us as a company as well as the power sector and every Nigerian. &nbsp;It is the beginning of an era where power becomes constant and within reach. We plan to deliver on capacity targets and sustain the momentum using people and resources to achieve operational excellence.&nbsp;<br />\n&nbsp;<br />\n-Ends-<br />\n&nbsp;<br />\nAbout Transcorp<br />\n&nbsp;<br />\nTransnational Corporation of Nigeria Plc (Transcorp) is a publicly quoted conglomerate with a diversified shareholder base of over 300,000 investors, the most prominent of which is Heirs Holdings Limited, a pan-African proprietary investment company. The Transcorp portfolio comprises strategic investments in the hospitality, agribusiness and energy sectors. Our notable businesses include Transcorp Hilton Hotel, Abuja; Transcorp Hotels, Calabar; Teragro Commodities Limited, operator of Teragro Benfruit plant - Nigeria&rsquo;s first-of-its-kind juice concentrate plant; Transcorp Ughelli Power Limited and Transcorp Energy Limited, operator of OPL 281.<br />\n&nbsp;<br />\nFor more information about Transcorp, please visit www.transcorpnigeria.com<br />\n&nbsp;</p>\n', 'xhtml', '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL),
(20, 1, 1, '', 'none', '<p><br />\nLagos, Nigeria. &ndash;November 1, 2013&nbsp;&ndash;&nbsp;Transcorp Ughelli Power Limited (TUPL), a subsidiary of Transnational Corporation of Nigeria Plc (Transcorp) today officially took physical ownership of Ughelli Power Plc, the owner and operator of the 1000MW capacity Ughelli Power Plant following a handover ceremony hosted by the Nigerian Federal Government. The ceremony was held at the plant located in Ughelli, Delta State with Government representatives, community leaders and other key power stakeholders in attendance.<br />\n&nbsp;<br />\nVice President Namadi Sambo, GCON, FNIA who was represented by Mr. Emeka Wogu, the Honorable Minister for Labour and Productivity said: &lsquo;This handover ceremony is the culmination of 14 years of painstaking efforts by the NCP and its Secretariat, the Bureau of Public Enterprises (BPE), the Federal Ministry of Power and other key stakeholders to reform and liberalize Nigeria&rsquo;s electricity industry. This reform and privatization programme is rightly focused on the big picture, that is, the impact on the economy as a whole and ultimately, the greatest good for the greatest number of Nigerians. I congratulate Transcorp for emerging as the successful winner through a very rigorous, competitive and transparent process. We appreciate your faith in the process and your faith in the Nigerian Government and economy.&rsquo;<br />\n&nbsp;<br />\nUghelli Power Plc, operator of the Ughelli Power Plant is one of the six power generation companies unbundled from the Power Holding Company of Nigeria (PHCN). By August 21, 2013, TUPL had effected full payment of $300million (three hundred million dollars) to the Bureau of Public Enterprises (BPE) representing 100 per cent of TUPL&rsquo;s bid price for the plant.<br />\n&nbsp;<br />\nTony O. Elumelu, CON, Chairman of Transcorp, while commenting on the successful handover ceremony remarked:<br />\n&nbsp;<br />\nI would like to thank the administration of President Goodluck Jonathan for their diligence towards achieving this significant milestone in the history of the Nigerian power sector.&rsquo; He added that Transcorp and its partners Tenoil, Symbion Power, Thomassen and Woodrock Energy are well positioned and have the required expertise to operate a world-class power generation plant that will transform the Nigerian Power sector and change the lives of its citizens.<br />\n&nbsp;<br />\nMr. Elumelu further re-stated Transcorp&rsquo;s unflagging commitment to invest in host communities wherever the organization operates with the aim of creating jobs, providing training and ensuring vital knowledge and skills transfer where possible thus ensuring sustainable contribution to Nigeria&rsquo;s economic and social development . &lsquo;We will actively engage the local communities in and around Ughelli to work together with the unified objective of ensuring that lives are improved and our larger economy revived.&rsquo;<br />\n&nbsp;<br />\nAdeoye Fadeyibi, the Chief Executive Officer of TUPL affirmed that the Power sector reform of the Federal Government has indeed created the right platform for sustainable economic development in Nigeria.<br />\n&nbsp;<br />\nThis is just the beginning of greater things to come. TUPL is poised to positively impact on the socio-economic development of Nigeria by improving living standards through regular and adequate power supply. We will increase the power generation of the plant from 300MW to over 1500MW in the next five years and we have the requisite capacity in finance and human capital to achieve our strategy.<br />\n<br />\n-Ends-<br />\n<br />\n</p>\n', 'xhtml', '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL),
(21, 1, 1, '', 'none', '<p><br />\nDear Fellow Shareholder,<br />\nYou will recall that your Company recently raised additional capital, through a Rights Issue, in order to accelerate our bold growth strategy.<br />\nI am writing to thank you for your support and to report that we are already seeing the first fruits of our plans to deliver value. Significant&nbsp;recent successes include:</p>\n\n<p>The acquisition of the 1000MW capacity Ughelli Power Plc through our subsidiary &mdash; Transcorp Ughelli Power Ltd (TUPL). TUPL&nbsp;paid $300m for 100% ownership of the Plant. On November 1, 2013, TUPL successfully took over ownership and physical&nbsp;possession of the plant. We will significantly raise output, from the current 160MW to at least 1,500MW, over the next 3-5 years.&nbsp;With a&nbsp;dedicated pipeline supplying gas to the plant and a long term off-take agreement, with the Bulk Electricity Trader, the return profile of&nbsp;this investment is compelling. The potential impact of the investment on Transcorp&#39;s fortunes is significant. Equally important is the&nbsp;impact of secure and sustainable power generation on the living standards of all Nigerians. We are proud of the leading role that your&nbsp;company is able to play in the transformation of a sector critical to enabling Nigeria achieve her true potential.</p>\n\n<p>The signing of an agreement with Hilton Worldwide, to commence the development of a 300 room five-star hotel in Ikoyi, Lagos,&nbsp;complementing our flagship Transcorp Hilton in Abuja. This project will be the first of eight internationally-branded hotels, that we&nbsp;plan to build over the next five years. Construction will begin in Q1 2014 and will be completed within 30 months. We have also&nbsp;completed the acquisition of a site in Port Harcourt for the development of another 300 room five star hotel. We expect to sign the&nbsp;management agreement in Q1 2014 and commence construction by the second quarter. Nigeria is dramatically underserved in the&nbsp;hospitality sector, and we see many opportunities to bring world class facilities to our guests from home and abroad.</p>\n\n<p>We also commenced the renovation and upgrade of the Transcorp Hilton, Abuja, Nigeria&#39;s premier five-star hotel. As well as a&nbsp;dramatic transformation of our existing facilities, this project will also see the addition of a 5,000 seat capacity conference facility and&nbsp;200 serviced luxury apartments to the hotel, firmly cementing our position as the destination venue in the Nation&#39;s capital, Abuja.</p>\n\n<p>The commencement of production of orange, mango and pineapple concentrates from the Teragro-Benfruit plant in Makurdi, Benue&nbsp;State. In October 2013, the plant received the ISO 9001:2008 (Quality Management System) and FSSC 22000:2005 (Food Safety&nbsp;Management System) certifications, illustrating that our products and processes meet the highest global standards. We plan to&nbsp;significantly increase the size and scope of this business. Teragro is the only juice concentrate producer in Nigeria and we are creating a&nbsp;fully integrated agro-allied business, ensuring that value added processing occurs here in Nigeria.</p>\n\n<p>We continue to develop our oil and gas strategy, with our existing oil block, OPL 281, expected to begin production before the end of&nbsp;2014. We have put in place a world class management team and are committed to developing the synergies between our natural&nbsp;resources portfolio and our power interests, creating an integrated energy approach that directly links Nigeria&#39;s natural resource wealth&nbsp;to the daily needs of our people.</p>\n\n<p>These successes, which are the products of the recent transformation in your company, will begin to contribute to our bottom line from&nbsp;November 2013. We were delighted to announce that in the nine-month period ended September 30, 2013, your company recorded profits&nbsp;before tax of N5.1bn, a 30% increase over the total profit for the whole of the 2012 financial year.<br />\n&nbsp;<br />\nLooking forward, your Company will continue to create and grow value in our chosen core business areas of Oil &amp; Gas, Power,&nbsp;Agriculture and Hospitality, through strategic investments, acquisitions and business turn around under pinned by our watchwords of&nbsp;Execution, Excellence, and Entrepreneurship.<br />\nLikewise, we remain committed to identifying and transforming underperforming businesses, in other sectors, which we believe are&nbsp;critical to our nation&#39;s growth.<br />\nWe thank our current, over 300,000 strong, indigenous shareholders, for their support and look forward to welcoming many more to join&nbsp;in our success. We will not relent in positioning Transcorp as a true vehicle for popular participation in Nigeria&#39;s bright future and&nbsp;prosperity.<br />\nTony O. Elumelu, CON<br />\nChairman<br />\nNovember 18, 2013</p>\n', 'xhtml', '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL),
(22, 1, 1, '', 'none', '<p>Agreements will dramatically increase capacity at the Ughelli power plant in 2014</p>\n\n<p>&nbsp;</p>\n\n<p>Lagos, 30 January 2014 &ndash; Transcorp Ughelli Power Ltd (TUPL), the power subsidiary of Transnational Corporation of Nigeria Plc (Transcorp), and General Electric (GE) have signed an agreement to expand the capacity of TUPL&rsquo;s Ughelli power plant by1000MW over the next 3 to 5 years.</p>\n\n<p>&nbsp;</p>\n\n<p>Both parties have also signed a separate agreement to rehabilitate the damaged GT 15 turbine at the Ughelli plant, which will add 115MW to the plant&rsquo;s output.</p>\n\n<p>&nbsp;</p>\n\n<p>Currently, the Transcorp Ughelli power plant generates 360MW of electricity, up from 160MW on November 1, when Transcorp took ownership of the plant. With the additional 115MW, as well as other rehabilitation works planned at the plant, output at Ughelli will increase to 700MW by December 2014.</p>\n\n<p>&nbsp;</p>\n\n<p>The Ughelli power plant is Nigeria&rsquo;s largest gas-fired electricity generation asset.&nbsp; Purchased by Transcorp during the 2013power privatization programme, the $300 million plant is part of the $2.5 billion investment pledge made by the Chairman of Transcorp and Heirs Holdings, Tony O. Elumelu, CON, to deliver affordable, accessible power to Africa under the Power Africa Initiative. Heirs Holdings, Elumelu&rsquo;s pan-African proprietary investment company, is Power Africa&rsquo;s largest private sector investor and a major investor in Transcorp.</p>\n\n<p>&nbsp;</p>\n\n<p>The agreements were signed at a closed door meeting between executives of both companies, led by Elumelu and&nbsp;the Global Chairman of General Electric, Jeffrey Immelt. They follow a cooperation agreement executed by Transcorp and GE in 2013.</p>\n\n<p>&nbsp;</p>\n\n<p>Commenting, Elumelu said, &ldquo;We are verypleased to work with GE, a proven world leader in power technology development,on the Ughelli plant expansion project.&nbsp; With this, we&rsquo;ve taken a bold step in fulfilling our promise to Transcorp&rsquo;s stakeholders and the people of Nigeria. In a very short period of time, we have achieved significant impact - power production has more than doubled, andwith this agreement, we will see increased output before the end of this year. We are confident that this partnership with GE will further accelerate the achievement of our goals in the power sector.&rdquo;</p>\n\n<p>&nbsp;</p>\n\n<p>Immelt said,&ldquo;GE fully appreciates the confidence expressed by Transcorp. We are happy to bring the considerable resources of GE to support Transcorp&rsquo;s audacious vision for Nigeria&rsquo;s Power industry. This partnership with Transcorp underlines GE&rsquo;s deep commitment to developing the Nigerian power sector.&rdquo;</p>\n\n<p>&nbsp;</p>\n\n<p>A publicly listed conglomerate with strategic investments in the power, hospitality, business and energy sectors, Transcorp, through TUPL, is committed to transform and&nbsp;bring the plant to profitability by increasing its generating capacity to&nbsp;impact positively on the socio-economic development of Nigeria.</p>\n\n<p>&nbsp;</p>\n\n<p>GE, one of the world&rsquo;s most reputable companies is the global leader in the design, manufacture, supply, installation and maintenance of technology and services for the Power, Aviation, Oil &amp; Gas, Healthcare and Transportation sectors.</p>\n', 'xhtml', '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL),
(23, 1, 1, '', 'none', '<p>Transnational Corporation of Nigeria (Transcorp) has emerged the most compliant firm among the companies listed on the Nigerian Stock Exchange (NSE).&nbsp; The Most Complaint Listed Firm award is given by the NSE to the company that demonstrates the highest degree of compliance with the rules and regulations&nbsp; regarding disclosure obligations of listed companies to the exchange in&nbsp; particular year. Such a company&nbsp; is also expected to have&nbsp; demonstrated its recognition for the importance of corporate governance.</p>\n\n<p>&nbsp;</p>\n\n<p>Transcorp&nbsp; won the coveted award at the weekend, beating Nigerian Breweries Plc and others.</p>\n\n<p>&nbsp;</p>\n\n<p>&ldquo;This award is significant. When Heirs Holdings took over Transcorp in 2011, one of the core objectives agreed was the need to transform Transcorp to be an institution with world class corporate governance in all its processes, reporting and compliance.&nbsp; This award is an indication of a job well done and the approval from the NSE for all the efforts made in the Group by all to achieve this,&rdquo; Transcorp said at the weekend.</p>\n\n<p>&nbsp;</p>\n\n<p>Since the coming of Heirs Holdings into Transcorp, the company&rsquo;s fortunes have continued to improve. Shareholders of the company received a dividend of N1.9 billion for the 2013 financial year for the first time in seven years.</p>\n\n<p>&nbsp;</p>\n\n<p>Hopes of&nbsp; the shareholders of Transcorp&nbsp; to receive another dividend at the end of the 2014&nbsp; financial year have been raised last as the company posted a jump of 89 per cent in profit for the nine months ended September 30, 2014.</p>\n\n<p>&nbsp;</p>\n\n<p>Transcorp reported&nbsp; profit before tax of N9.7 billion, up by 89 per cent from N5.15 billion in the corresponding period of 2013, while profit after tax improved by from N3.5billion to N8.263 billion.&nbsp; Total assets stood at N157 billion compared with N149.454 billion as at December as at December 31, 2103.</p>\n\n<p>&nbsp;</p>\n\n<p>Commenting on the results, the&nbsp; Chief Executive Officer, Transcorp Plc, Mr. Emmanuel Nnorom said, &ldquo;Our third quarter 2014 results underscore our determination to achieve our full year&nbsp; 2014 targets. Our commitment to excellence is evident in the significant achievements we have recorded this year in our power and hospitality businesses.&rdquo;</p>\n\n<p>&nbsp;</p>\n\n<p>-Ends-<br />\n&nbsp;<br />\nAbout Transcorp<br />\n&nbsp;<br />\nTransnational Corporation of Nigeria Plc (Transcorp) is a publicly quoted conglomerate with a diversified shareholder base of over 300,000 investors, the most prominent of which is Heirs Holdings Limited, a pan-African proprietary investment company. The Transcorp portfolio comprises strategic investments in the hospitality, agribusiness and energy sectors. Our notable businesses include Transcorp Hilton Hotel, Abuja; Transcorp Hotels, Calabar; Teragro Commodities Limited, operator of Teragro Benfruit plant - Nigeria&rsquo;s first-of-its-kind juice concentrate plant; Transcorp Ughelli Power Limited and Transcorp Energy Limited, operator of OPL 281.<br />\n&nbsp;<br />\nFor more information about Transcorp, please visit www.transcorpnigeria.com</p>\n', 'xhtml', '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `exp_channel_entries_autosave`
--

CREATE TABLE IF NOT EXISTS `exp_channel_entries_autosave` (
  `entry_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `original_entry_id` int(10) unsigned NOT NULL,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `channel_id` int(4) unsigned NOT NULL,
  `author_id` int(10) unsigned NOT NULL DEFAULT '0',
  `pentry_id` int(10) NOT NULL DEFAULT '0',
  `forum_topic_id` int(10) unsigned DEFAULT NULL,
  `ip_address` varchar(45) NOT NULL,
  `title` varchar(100) NOT NULL,
  `url_title` varchar(75) NOT NULL,
  `status` varchar(50) NOT NULL,
  `versioning_enabled` char(1) NOT NULL DEFAULT 'n',
  `view_count_one` int(10) unsigned NOT NULL DEFAULT '0',
  `view_count_two` int(10) unsigned NOT NULL DEFAULT '0',
  `view_count_three` int(10) unsigned NOT NULL DEFAULT '0',
  `view_count_four` int(10) unsigned NOT NULL DEFAULT '0',
  `allow_comments` varchar(1) NOT NULL DEFAULT 'y',
  `sticky` varchar(1) NOT NULL DEFAULT 'n',
  `entry_date` int(10) NOT NULL,
  `dst_enabled` varchar(1) NOT NULL DEFAULT 'n',
  `year` char(4) NOT NULL,
  `month` char(2) NOT NULL,
  `day` char(3) NOT NULL,
  `expiration_date` int(10) NOT NULL DEFAULT '0',
  `comment_expiration_date` int(10) NOT NULL DEFAULT '0',
  `edit_date` bigint(14) DEFAULT NULL,
  `recent_comment_date` int(10) DEFAULT NULL,
  `comment_total` int(4) unsigned NOT NULL DEFAULT '0',
  `entry_data` text,
  PRIMARY KEY (`entry_id`),
  KEY `channel_id` (`channel_id`),
  KEY `author_id` (`author_id`),
  KEY `url_title` (`url_title`),
  KEY `status` (`status`),
  KEY `entry_date` (`entry_date`),
  KEY `expiration_date` (`expiration_date`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_channel_fields`
--

CREATE TABLE IF NOT EXISTS `exp_channel_fields` (
  `field_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_id` int(4) unsigned NOT NULL,
  `field_name` varchar(32) NOT NULL,
  `field_label` varchar(50) NOT NULL,
  `field_instructions` text,
  `field_type` varchar(50) NOT NULL DEFAULT 'text',
  `field_list_items` text NOT NULL,
  `field_pre_populate` char(1) NOT NULL DEFAULT 'n',
  `field_pre_channel_id` int(6) unsigned DEFAULT NULL,
  `field_pre_field_id` int(6) unsigned DEFAULT NULL,
  `field_related_to` varchar(12) NOT NULL DEFAULT 'channel',
  `field_related_id` int(6) unsigned NOT NULL DEFAULT '0',
  `field_related_orderby` varchar(12) NOT NULL DEFAULT 'date',
  `field_related_sort` varchar(4) NOT NULL DEFAULT 'desc',
  `field_related_max` smallint(4) NOT NULL DEFAULT '0',
  `field_ta_rows` tinyint(2) DEFAULT '8',
  `field_maxl` smallint(3) DEFAULT NULL,
  `field_required` char(1) NOT NULL DEFAULT 'n',
  `field_text_direction` char(3) NOT NULL DEFAULT 'ltr',
  `field_search` char(1) NOT NULL DEFAULT 'n',
  `field_is_hidden` char(1) NOT NULL DEFAULT 'n',
  `field_fmt` varchar(40) NOT NULL DEFAULT 'xhtml',
  `field_show_fmt` char(1) NOT NULL DEFAULT 'y',
  `field_order` int(3) unsigned NOT NULL,
  `field_content_type` varchar(20) NOT NULL DEFAULT 'any',
  `field_settings` text,
  PRIMARY KEY (`field_id`),
  KEY `group_id` (`group_id`),
  KEY `field_type` (`field_type`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `exp_channel_fields`
--

INSERT INTO `exp_channel_fields` (`field_id`, `site_id`, `group_id`, `field_name`, `field_label`, `field_instructions`, `field_type`, `field_list_items`, `field_pre_populate`, `field_pre_channel_id`, `field_pre_field_id`, `field_related_to`, `field_related_id`, `field_related_orderby`, `field_related_sort`, `field_related_max`, `field_ta_rows`, `field_maxl`, `field_required`, `field_text_direction`, `field_search`, `field_is_hidden`, `field_fmt`, `field_show_fmt`, `field_order`, `field_content_type`, `field_settings`) VALUES
(1, 1, 1, 'preview_image', 'Preview Image', 'Please upload a preview image if possible.', 'file', '', '0', 0, 0, 'channel', 1, 'title', 'desc', 0, 6, 128, 'n', 'ltr', 'n', 'y', 'none', 'n', 1, 'any', 'YTo4OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6NToiaW1hZ2UiO3M6MTk6ImFsbG93ZWRfZGlyZWN0b3JpZXMiO3M6MToiMSI7czoxODoiZmllbGRfc2hvd19zbWlsZXlzIjtzOjE6Im4iO3M6MTk6ImZpZWxkX3Nob3dfZ2xvc3NhcnkiO3M6MToibiI7czoyMToiZmllbGRfc2hvd19zcGVsbGNoZWNrIjtzOjE6Im4iO3M6MjY6ImZpZWxkX3Nob3dfZm9ybWF0dGluZ19idG5zIjtzOjE6Im4iO3M6MjQ6ImZpZWxkX3Nob3dfZmlsZV9zZWxlY3RvciI7czoxOiJuIjtzOjIwOiJmaWVsZF9zaG93X3dyaXRlbW9kZSI7czoxOiJuIjt9'),
(2, 1, 1, 'content', 'content', 'Upload content for the Press Release', 'expresso', '', '0', 0, 0, 'channel', 1, 'title', 'desc', 0, 6, 128, 'y', 'ltr', 'y', 'n', 'xhtml', 'n', 2, 'any', 'YTo5OntzOjc6InRvb2xiYXIiO3M6NDoiZnVsbCI7czo2OiJoZWlnaHQiO2I6MDtzOjExOiJjb250ZW50c0NzcyI7czowOiIiO3M6MTg6ImZpZWxkX3Nob3dfc21pbGV5cyI7czoxOiJuIjtzOjE5OiJmaWVsZF9zaG93X2dsb3NzYXJ5IjtzOjE6Im4iO3M6MjE6ImZpZWxkX3Nob3dfc3BlbGxjaGVjayI7czoxOiJuIjtzOjI2OiJmaWVsZF9zaG93X2Zvcm1hdHRpbmdfYnRucyI7czoxOiJuIjtzOjI0OiJmaWVsZF9zaG93X2ZpbGVfc2VsZWN0b3IiO3M6MToibiI7czoyMDoiZmllbGRfc2hvd193cml0ZW1vZGUiO3M6MToibiI7fQ=='),
(3, 1, 2, 'slideshow_image', 'Slideshow Image', 'Please Upload a slideshow image that will appear on the homepage of the website. Specification: size: 941px X 425px', 'file', '', '0', 0, 0, 'channel', 2, 'title', 'desc', 0, 6, 128, 'y', 'ltr', 'y', 'n', 'none', 'n', 1, 'any', 'YTo4OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6NToiaW1hZ2UiO3M6MTk6ImFsbG93ZWRfZGlyZWN0b3JpZXMiO3M6MToiMSI7czoxODoiZmllbGRfc2hvd19zbWlsZXlzIjtzOjE6Im4iO3M6MTk6ImZpZWxkX3Nob3dfZ2xvc3NhcnkiO3M6MToibiI7czoyMToiZmllbGRfc2hvd19zcGVsbGNoZWNrIjtzOjE6Im4iO3M6MjY6ImZpZWxkX3Nob3dfZm9ybWF0dGluZ19idG5zIjtzOjE6Im4iO3M6MjQ6ImZpZWxkX3Nob3dfZmlsZV9zZWxlY3RvciI7czoxOiJuIjtzOjIwOiJmaWVsZF9zaG93X3dyaXRlbW9kZSI7czoxOiJuIjt9'),
(4, 1, 3, 'general_content', 'General Content', 'Insert the general content of the page. Please follow the style as specified in the document', 'wygwam', '', '0', 0, 0, 'channel', 3, 'title', 'desc', 0, 6, 128, 'y', 'ltr', 'y', 'n', 'none', 'n', 1, 'any', 'YTo4OntzOjY6ImNvbmZpZyI7czoxOiIzIjtzOjU6ImRlZmVyIjtzOjE6Im4iO3M6MTg6ImZpZWxkX3Nob3dfc21pbGV5cyI7czoxOiJuIjtzOjE5OiJmaWVsZF9zaG93X2dsb3NzYXJ5IjtzOjE6Im4iO3M6MjE6ImZpZWxkX3Nob3dfc3BlbGxjaGVjayI7czoxOiJuIjtzOjI2OiJmaWVsZF9zaG93X2Zvcm1hdHRpbmdfYnRucyI7czoxOiJuIjtzOjI0OiJmaWVsZF9zaG93X2ZpbGVfc2VsZWN0b3IiO3M6MToibiI7czoyMDoiZmllbGRfc2hvd193cml0ZW1vZGUiO3M6MToibiI7fQ=='),
(5, 1, 4, 'contact', 'Contact', 'Please enter the contact information for Ughelli Power here.', 'wygwam', '', '0', 0, 0, 'channel', 4, 'title', 'desc', 0, 6, 128, 'y', 'ltr', 'y', 'n', 'none', 'n', 1, 'any', 'YTo4OntzOjY6ImNvbmZpZyI7czoxOiIzIjtzOjU6ImRlZmVyIjtzOjE6Im4iO3M6MTg6ImZpZWxkX3Nob3dfc21pbGV5cyI7czoxOiJuIjtzOjE5OiJmaWVsZF9zaG93X2dsb3NzYXJ5IjtzOjE6Im4iO3M6MjE6ImZpZWxkX3Nob3dfc3BlbGxjaGVjayI7czoxOiJuIjtzOjI2OiJmaWVsZF9zaG93X2Zvcm1hdHRpbmdfYnRucyI7czoxOiJuIjtzOjI0OiJmaWVsZF9zaG93X2ZpbGVfc2VsZWN0b3IiO3M6MToibiI7czoyMDoiZmllbGRfc2hvd193cml0ZW1vZGUiO3M6MToibiI7fQ=='),
(6, 1, 4, 'twitter_link', 'Twitter link', 'Enter the link to the twitter account for Ughelli Power.', 'text', '', '0', 0, 0, 'channel', 4, 'title', 'desc', 0, 6, 128, 'n', 'ltr', 'n', 'n', 'none', 'n', 2, 'any', 'YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),
(7, 1, 4, 'facebook_link', 'Facebook Link', 'Enter the link to Ughelli Power''s facebook page.', 'text', '', '0', 0, 0, 'channel', 4, 'title', 'desc', 0, 6, 128, 'n', 'ltr', 'n', 'n', 'none', 'n', 3, 'any', 'YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),
(9, 1, 5, 'plant_content', 'plant_content', 'Please input content for the plant gallery page.', 'wygwam', '', '0', 0, 0, 'channel', 4, 'title', 'desc', 0, 6, 128, 'y', 'ltr', 'y', 'n', 'none', 'n', 2, 'any', 'YTo4OntzOjY6ImNvbmZpZyI7czoxOiIyIjtzOjU6ImRlZmVyIjtzOjE6Im4iO3M6MTg6ImZpZWxkX3Nob3dfc21pbGV5cyI7czoxOiJuIjtzOjE5OiJmaWVsZF9zaG93X2dsb3NzYXJ5IjtzOjE6Im4iO3M6MjE6ImZpZWxkX3Nob3dfc3BlbGxjaGVjayI7czoxOiJuIjtzOjI2OiJmaWVsZF9zaG93X2Zvcm1hdHRpbmdfYnRucyI7czoxOiJuIjtzOjI0OiJmaWVsZF9zaG93X2ZpbGVfc2VsZWN0b3IiO3M6MToibiI7czoyMDoiZmllbGRfc2hvd193cml0ZW1vZGUiO3M6MToibiI7fQ=='),
(10, 1, 5, 'plant_images', 'Plant Images', 'Upload an image for the plant facilities gallery', 'matrix', '', '0', 0, 0, 'channel', 4, 'title', 'desc', 0, 6, 128, 'y', 'ltr', 'y', 'n', 'none', 'n', 2, 'any', 'YTozOntzOjg6Im1pbl9yb3dzIjtzOjE6IjEiO3M6ODoibWF4X3Jvd3MiO3M6MDoiIjtzOjc6ImNvbF9pZHMiO2E6Mjp7aTowO2k6MTtpOjE7aToyO319');

-- --------------------------------------------------------

--
-- Table structure for table `exp_channel_member_groups`
--

CREATE TABLE IF NOT EXISTS `exp_channel_member_groups` (
  `group_id` smallint(4) unsigned NOT NULL,
  `channel_id` int(6) unsigned NOT NULL,
  PRIMARY KEY (`group_id`,`channel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `exp_channel_member_groups`
--

INSERT INTO `exp_channel_member_groups` (`group_id`, `channel_id`) VALUES
(6, 1),
(6, 2),
(6, 3),
(6, 4),
(6, 5);

-- --------------------------------------------------------

--
-- Table structure for table `exp_channel_titles`
--

CREATE TABLE IF NOT EXISTS `exp_channel_titles` (
  `entry_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `channel_id` int(4) unsigned NOT NULL,
  `author_id` int(10) unsigned NOT NULL DEFAULT '0',
  `pentry_id` int(10) NOT NULL DEFAULT '0',
  `forum_topic_id` int(10) unsigned DEFAULT NULL,
  `ip_address` varchar(45) NOT NULL,
  `title` varchar(100) NOT NULL,
  `url_title` varchar(75) NOT NULL,
  `status` varchar(50) NOT NULL,
  `versioning_enabled` char(1) NOT NULL DEFAULT 'n',
  `view_count_one` int(10) unsigned NOT NULL DEFAULT '0',
  `view_count_two` int(10) unsigned NOT NULL DEFAULT '0',
  `view_count_three` int(10) unsigned NOT NULL DEFAULT '0',
  `view_count_four` int(10) unsigned NOT NULL DEFAULT '0',
  `allow_comments` varchar(1) NOT NULL DEFAULT 'y',
  `sticky` varchar(1) NOT NULL DEFAULT 'n',
  `entry_date` int(10) NOT NULL,
  `dst_enabled` varchar(1) NOT NULL DEFAULT 'n',
  `year` char(4) NOT NULL,
  `month` char(2) NOT NULL,
  `day` char(3) NOT NULL,
  `expiration_date` int(10) NOT NULL DEFAULT '0',
  `comment_expiration_date` int(10) NOT NULL DEFAULT '0',
  `edit_date` bigint(14) DEFAULT NULL,
  `recent_comment_date` int(10) DEFAULT NULL,
  `comment_total` int(4) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry_id`),
  KEY `channel_id` (`channel_id`),
  KEY `author_id` (`author_id`),
  KEY `url_title` (`url_title`),
  KEY `status` (`status`),
  KEY `entry_date` (`entry_date`),
  KEY `expiration_date` (`expiration_date`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=24 ;

--
-- Dumping data for table `exp_channel_titles`
--

INSERT INTO `exp_channel_titles` (`entry_id`, `site_id`, `channel_id`, `author_id`, `pentry_id`, `forum_topic_id`, `ip_address`, `title`, `url_title`, `status`, `versioning_enabled`, `view_count_one`, `view_count_two`, `view_count_three`, `view_count_four`, `allow_comments`, `sticky`, `entry_date`, `dst_enabled`, `year`, `month`, `day`, `expiration_date`, `comment_expiration_date`, `edit_date`, `recent_comment_date`, `comment_total`) VALUES
(1, 1, 1, 1, 0, NULL, '83.229.90.139', 'Ughelli Power Launches New Website', 'ughelli-power-launches-new-website', 'open', 'y', 0, 0, 0, 0, 'y', 'n', 1366266194, 'n', '2013', '04', '18', 0, 0, 20130430130515, 0, 0),
(2, 1, 2, 1, 0, NULL, '41.206.11.7', 'Ughelli Power - The Black Start Of The National Grid', 'ughelli-power-the-black-start-of-the-national-grid', 'open', 'y', 0, 0, 0, 0, 'n', 'n', 1366339639, 'n', '2013', '04', '19', 0, 0, 20130419034719, 0, 0),
(3, 1, 2, 1, 0, NULL, '41.206.11.7', 'Ughelli Power Generating Power For Milions Of Nigerians', 'ughelli-power-generating-power-for-milions-of-nigerians', 'open', 'y', 0, 0, 0, 0, 'n', 'n', 1366340335, 'n', '2013', '04', '19', 0, 0, 20130419035855, 0, 0),
(4, 1, 3, 1, 0, NULL, '196.46.245.51', 'About', 'about', 'open', 'y', 0, 0, 0, 0, 'n', 'n', 1366341735, 'n', '2013', '04', '19', 0, 0, 20140108161916, 0, 0),
(5, 1, 3, 1, 0, NULL, '41.206.11.7', 'Plants Facilities', 'plants-facilities', 'open', 'y', 0, 0, 0, 0, 'n', 'n', 1366346242, 'n', '2013', '04', '19', 0, 0, 20130419044323, 0, 0),
(6, 1, 3, 1, 0, NULL, '83.229.90.139', 'Safety Policy', 'safety-policy', 'open', 'y', 0, 0, 0, 0, 'n', 'n', 1366346695, 'n', '2013', '04', '19', 0, 0, 20130419145856, 0, 0),
(7, 1, 4, 1, 0, NULL, '41.58.206.64', 'Contact', 'contact', 'open', 'y', 0, 0, 0, 0, 'n', 'n', 1366347236, 'n', '2013', '04', '19', 0, 0, 20140115130557, 0, 0),
(17, 1, 5, 1, 0, NULL, '196.46.245.69', 'Plant Facilities', 'plant-facilities', 'open', 'y', 0, 0, 0, 0, 'y', 'n', 1366384316, 'n', '2013', '04', '19', 0, 0, 20140114100157, 0, 0),
(18, 1, 1, 2, 0, NULL, '83.229.90.139', 'GT 16 Back in Service', 'gt-16-back-in-service', 'open', 'y', 0, 0, 0, 0, 'y', 'n', 1367315637, 'n', '2013', '04', '30', 0, 0, 20130430130358, 0, 0),
(19, 1, 1, 2, 0, NULL, '196.46.245.51', 'Transcorp Makes Full Payment for $300M Ughelli Power Plant', 'transcorp-makes-full-payment-for-300m-ughelli-power-plant', 'open', 'y', 0, 0, 0, 0, 'y', 'n', 1377098877, 'n', '2013', '08', '21', 0, 0, 20130821162757, 0, 0),
(20, 1, 1, 2, 0, NULL, '196.46.245.48', 'Transcorp Takes Over Ughelli Power Plant', 'transcorp-takes-over-ughelli-power-plant', 'open', 'y', 0, 0, 0, 0, 'y', 'n', 1383320372, 'n', '2013', '11', '01', 0, 0, 20131101163932, 0, 0),
(21, 1, 1, 2, 0, NULL, '196.46.245.48', 'Transcorp Delivers on Promise to Give Nigerians Access ...', 'transcorp-delivers-on-promise-to-give-nigerians-access', 'open', 'y', 0, 0, 0, 0, 'y', 'n', 1384790429, 'n', '2013', '11', '18', 0, 0, 20140108160030, 0, 0),
(22, 1, 1, 2, 0, NULL, '41.76.153.164', 'Transcorp, GE partner to improve power generation in Nigeria', 'transcorp-ge-partner-to-improve-power-generation-in-nigeria', 'open', 'y', 0, 0, 0, 0, 'y', 'n', 1391084130, 'n', '2014', '01', '30', 0, 0, 20140203124331, 0, 0),
(23, 1, 1, 2, 0, NULL, '154.66.3.80', 'Transcorp Emergies Most Compliant Company on NSE', 'transcorp-emergies-most-compliant-company-on-nse', 'open', 'y', 0, 0, 0, 0, 'y', 'n', 1419878629, 'n', '2014', '12', '29', 0, 0, 20141229194349, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `exp_comments`
--

CREATE TABLE IF NOT EXISTS `exp_comments` (
  `comment_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) DEFAULT '1',
  `entry_id` int(10) unsigned DEFAULT '0',
  `channel_id` int(4) unsigned DEFAULT '1',
  `author_id` int(10) unsigned DEFAULT '0',
  `status` char(1) DEFAULT '0',
  `name` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `url` varchar(75) DEFAULT NULL,
  `location` varchar(50) DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `comment_date` int(10) DEFAULT NULL,
  `edit_date` int(10) DEFAULT NULL,
  `comment` text,
  PRIMARY KEY (`comment_id`),
  KEY `entry_id` (`entry_id`),
  KEY `channel_id` (`channel_id`),
  KEY `author_id` (`author_id`),
  KEY `status` (`status`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_comment_subscriptions`
--

CREATE TABLE IF NOT EXISTS `exp_comment_subscriptions` (
  `subscription_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(10) unsigned DEFAULT NULL,
  `member_id` int(10) DEFAULT '0',
  `email` varchar(50) DEFAULT NULL,
  `subscription_date` varchar(10) DEFAULT NULL,
  `notification_sent` char(1) DEFAULT 'n',
  `hash` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`subscription_id`),
  KEY `entry_id` (`entry_id`),
  KEY `member_id` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_cp_log`
--

CREATE TABLE IF NOT EXISTS `exp_cp_log` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `member_id` int(10) unsigned NOT NULL,
  `username` varchar(32) NOT NULL,
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `act_date` int(10) NOT NULL,
  `action` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=107 ;

--
-- Dumping data for table `exp_cp_log`
--

INSERT INTO `exp_cp_log` (`id`, `site_id`, `member_id`, `username`, `ip_address`, `act_date`, `action`) VALUES
(1, 1, 1, 'admin', '127.0.0.1', 1365706113, 'Logged in'),
(2, 1, 1, 'admin', '41.190.3.215', 1365762683, 'Logged in'),
(3, 1, 1, 'admin', '41.190.3.85', 1365765001, 'Logged in'),
(4, 1, 1, 'admin', '41.220.68.32', 1366008483, 'Logged in'),
(5, 1, 1, 'admin', '41.206.11.3', 1366263190, 'Logged in'),
(6, 1, 1, 'admin', '41.206.11.8', 1366264790, 'Channel Created:&nbsp;&nbsp;Press Release'),
(7, 1, 1, 'admin', '41.206.11.8', 1366264827, 'Field Group Created:&nbsp;Press Release'),
(8, 1, 1, 'admin', '41.206.11.7', 1366327797, 'Logged in'),
(9, 1, 1, 'admin', '41.206.11.7', 1366335351, 'Logged in'),
(10, 1, 1, 'admin', '41.206.11.7', 1366339109, 'Channel Created:&nbsp;&nbsp;Homepage Slideshow'),
(11, 1, 1, 'admin', '41.206.11.7', 1366339139, 'Field Group Created:&nbsp;Homepage Slideshow'),
(12, 1, 1, 'admin', '41.206.11.7', 1366341378, 'Channel Created:&nbsp;&nbsp;General Content'),
(13, 1, 1, 'admin', '41.206.11.7', 1366341396, 'Field Group Created:&nbsp;General Content'),
(14, 1, 1, 'admin', '41.206.11.7', 1366346959, 'Channel Created:&nbsp;&nbsp;Contact'),
(15, 1, 1, 'admin', '41.206.11.7', 1366346987, 'Field Group Created:&nbsp;Contact'),
(16, 1, 1, 'admin', '41.206.11.7', 1366349490, 'Member profile created:&nbsp;&nbsp;phcn_admin'),
(17, 1, 1, 'admin', '41.206.11.7', 1366349502, 'Logged out'),
(18, 1, 2, 'phcn_admin', '41.206.11.7', 1366349518, 'Logged in'),
(19, 1, 2, 'phcn_admin', '41.206.11.7', 1366349733, 'Member Group Created:&nbsp;&nbsp;Editors/Maintenance'),
(20, 1, 2, 'phcn_admin', '41.206.11.7', 1366349785, 'Logged out'),
(21, 1, 1, 'admin', '41.206.11.7', 1366349825, 'Logged in'),
(22, 1, 1, 'admin', '41.206.11.7', 1366349866, 'Logged out'),
(23, 1, 1, 'admin', '41.206.11.7', 1366350083, 'Logged in'),
(24, 1, 1, 'admin', '41.206.11.7', 1366350234, 'Member Group Updated:&nbsp;&nbsp;Editors/Maintenance'),
(25, 1, 1, 'admin', '41.206.11.7', 1366350263, 'SuperAdmin Logging In as User:&nbsp;phcn_admin'),
(26, 1, 1, 'admin', '41.206.11.7', 1366350328, 'Logged in'),
(27, 1, 1, 'admin', '41.206.11.7', 1366350434, 'Member Group Updated:&nbsp;&nbsp;Editors/Maintenance'),
(28, 1, 2, 'phcn_admin', '41.206.11.7', 1366350451, 'Logged out'),
(29, 1, 2, 'phcn_admin', '41.206.11.7', 1366350467, 'Logged in'),
(30, 1, 1, 'admin', '41.206.11.7', 1366350570, 'Member Group Updated:&nbsp;&nbsp;Editors/Maintenance'),
(31, 1, 1, 'admin', '41.206.11.7', 1366350605, 'Member Group Updated:&nbsp;&nbsp;Editors/Maintenance'),
(32, 1, 1, 'admin', '41.190.3.193', 1366372067, 'Logged in'),
(33, 1, 1, 'admin', '41.190.3.193', 1366372106, 'Channel Created:&nbsp;&nbsp;Plant Gallery'),
(34, 1, 1, 'admin', '41.190.3.193', 1366372135, 'Field Group Created:&nbsp;Plant Gallery'),
(35, 1, 1, 'admin', '41.190.3.193', 1366372971, 'Logged out'),
(36, 1, 1, 'admin', '83.229.90.139', 1366375772, 'Logged in'),
(37, 1, 2, 'phcn_admin', '83.229.90.139', 1366376281, 'Logged in'),
(38, 1, 2, 'phcn_admin', '83.229.90.139', 1366376378, 'Logged in'),
(39, 1, 2, 'phcn_admin', '83.229.90.139', 1366376476, 'Logged in'),
(40, 1, 2, 'phcn_admin', '83.229.90.139', 1366376497, 'Logged in'),
(41, 1, 2, 'phcn_admin', '83.229.90.139', 1366376497, 'Logged in'),
(42, 1, 2, 'phcn_admin', '83.229.90.139', 1366376785, 'Logged in'),
(43, 1, 1, 'admin', '83.229.90.139', 1366376852, 'Member Group Updated:&nbsp;&nbsp;Editors/Maintenance'),
(44, 1, 1, 'admin', '83.229.90.139', 1366379166, 'Member Group Updated:&nbsp;&nbsp;Editors/Maintenance'),
(45, 1, 1, 'admin', '83.229.90.139', 1366379348, 'Member Group Updated:&nbsp;&nbsp;Editors/Maintenance'),
(46, 1, 1, 'admin', '83.229.90.139', 1366382454, 'Member Group Updated:&nbsp;&nbsp;Editors/Maintenance'),
(47, 1, 1, 'admin', '83.229.90.139', 1366383148, 'Status Group Created:&nbsp;Always Open'),
(48, 1, 2, 'phcn_admin', '83.229.90.139', 1366384870, 'Logged in'),
(49, 1, 2, 'phcn_admin', '83.229.90.139', 1366388333, 'Logged out'),
(50, 1, 2, 'phcn_admin', '196.46.245.58', 1366465172, 'Logged in'),
(51, 1, 2, 'phcn_admin', '196.46.245.57', 1366478333, 'Logged in'),
(52, 1, 2, 'phcn_admin', '196.46.245.58', 1366478622, 'Logged out'),
(53, 1, 2, 'phcn_admin', '83.229.90.139', 1366880675, 'Logged in'),
(54, 1, 2, 'phcn_admin', '83.229.90.139', 1366880678, 'Logged in'),
(55, 1, 2, 'phcn_admin', '83.229.90.139', 1366882331, 'Logged out'),
(56, 1, 2, 'phcn_admin', '83.229.90.139', 1367315554, 'Logged in'),
(57, 1, 2, 'phcn_admin', '83.229.90.139', 1367318358, 'Logged out'),
(58, 1, 2, 'phcn_admin', '83.229.90.139', 1367319320, 'Logged in'),
(59, 1, 2, 'phcn_admin', '83.229.90.139', 1367321154, 'Logged in'),
(60, 1, 2, 'phcn_admin', '83.229.90.139', 1367321633, 'Logged out'),
(61, 1, 2, 'phcn_admin', '83.229.90.139', 1367326228, 'Logged in'),
(62, 1, 2, 'phcn_admin', '83.229.90.139', 1367327351, 'Logged out'),
(63, 1, 2, 'phcn_admin', '83.229.90.139', 1367853449, 'Logged in'),
(64, 1, 2, 'phcn_admin', '83.229.90.139', 1367855069, 'Logged out'),
(65, 1, 2, 'phcn_admin', '83.229.90.139', 1367917154, 'Logged in'),
(66, 1, 2, 'phcn_admin', '83.229.90.139', 1367917660, 'Logged out'),
(67, 1, 2, 'phcn_admin', '196.46.245.53', 1368912921, 'Logged in'),
(68, 1, 2, 'phcn_admin', '83.229.90.139', 1369320181, 'Logged in'),
(69, 1, 2, 'phcn_admin', '83.229.90.139', 1369322201, 'Logged out'),
(70, 1, 2, 'phcn_admin', '196.46.245.53', 1373458591, 'Logged in'),
(71, 1, 2, 'phcn_admin', '196.46.245.53', 1373459087, 'Logged out'),
(72, 1, 2, 'phcn_admin', '196.46.245.54', 1384518083, 'Logged in'),
(73, 1, 2, 'phcn_admin', '196.46.245.55', 1384519402, 'Logged out'),
(74, 1, 2, 'phcn_admin', '41.203.69.2', 1384694529, 'Logged in'),
(75, 1, 2, 'phcn_admin', '41.203.69.2', 1384694565, 'Logged out'),
(76, 1, 2, 'phcn_admin', '196.46.245.68', 1384878276, 'Logged in'),
(77, 1, 2, 'phcn_admin', '196.46.245.71', 1384878615, 'Logged out'),
(78, 1, 2, 'phcn_admin', '196.46.245.49', 1389179874, 'Logged in'),
(79, 1, 2, 'phcn_admin', '196.46.245.49', 1389184815, 'Logged in'),
(80, 1, 2, 'phcn_admin', '196.46.245.50', 1389194769, 'Logged in'),
(81, 1, 2, 'phcn_admin', '196.46.245.50', 1389196714, 'Logged out'),
(82, 1, 2, 'phcn_admin', '196.46.245.50', 1389196723, 'Logged in'),
(83, 1, 2, 'phcn_admin', '196.46.245.48', 1389196965, 'Logged out'),
(84, 1, 2, 'phcn_admin', '196.46.245.51', 1389196983, 'Logged in'),
(85, 1, 2, 'phcn_admin', '196.46.245.50', 1389254483, 'Logged in'),
(86, 1, 2, 'phcn_admin', '196.46.245.48', 1389276019, 'Logged in'),
(87, 1, 2, 'phcn_admin', '196.46.245.49', 1389280359, 'Logged in'),
(88, 1, 2, 'phcn_admin', '41.58.196.2', 1389598635, 'Logged in'),
(89, 1, 2, 'phcn_admin', '41.58.196.2', 1389618005, 'Logged in'),
(90, 1, 2, 'phcn_admin', '196.46.245.71', 1389693634, 'Logged in'),
(91, 1, 2, 'phcn_admin', '196.46.245.71', 1389697759, 'Logged in'),
(92, 1, 2, 'phcn_admin', '196.46.246.133', 1389723289, 'Logged in'),
(93, 1, 2, 'phcn_admin', '196.46.246.133', 1389723978, 'Logged out'),
(94, 1, 2, 'phcn_admin', '196.46.246.133', 1389735717, 'Logged in'),
(95, 1, 2, 'phcn_admin', '41.58.206.64', 1389784630, 'Logged in'),
(96, 1, 2, 'phcn_admin', '41.76.153.164', 1391427101, 'Logged in'),
(97, 1, 2, 'phcn_admin', '41.76.153.164', 1391431717, 'Logged out'),
(98, 1, 2, 'phcn_admin', '41.76.153.164', 1393926595, 'Logged in'),
(99, 1, 2, 'phcn_admin', '41.76.153.164', 1393926624, 'Logged out'),
(100, 1, 2, 'phcn_admin', '197.211.48.227', 1412238172, 'Logged in'),
(101, 1, 2, 'phcn_admin', '197.211.48.227', 1412238698, 'Logged out'),
(102, 1, 2, 'phcn_admin', '41.75.84.230', 1412239015, 'Logged in'),
(103, 1, 2, 'phcn_admin', '41.75.84.230', 1412239036, 'Logged out'),
(104, 1, 2, 'phcn_admin', '154.66.3.80', 1419878405, 'Logged in'),
(105, 1, 2, 'phcn_admin', '154.66.3.80', 1419879115, 'Logged out'),
(106, 1, 2, 'phcn_admin', '41.75.84.230', 1421140500, 'Logged in');

-- --------------------------------------------------------

--
-- Table structure for table `exp_cp_search_index`
--

CREATE TABLE IF NOT EXISTS `exp_cp_search_index` (
  `search_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `controller` varchar(20) DEFAULT NULL,
  `method` varchar(50) DEFAULT NULL,
  `language` varchar(20) DEFAULT NULL,
  `access` varchar(50) DEFAULT NULL,
  `keywords` text,
  PRIMARY KEY (`search_id`),
  FULLTEXT KEY `keywords` (`keywords`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_developer_log`
--

CREATE TABLE IF NOT EXISTS `exp_developer_log` (
  `log_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `timestamp` int(10) unsigned NOT NULL,
  `viewed` char(1) NOT NULL DEFAULT 'n',
  `description` text,
  `function` varchar(100) DEFAULT NULL,
  `line` int(10) unsigned DEFAULT NULL,
  `file` varchar(255) DEFAULT NULL,
  `deprecated_since` varchar(10) DEFAULT NULL,
  `use_instead` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `exp_developer_log`
--

INSERT INTO `exp_developer_log` (`log_id`, `timestamp`, `viewed`, `description`, `function`, `line`, `file`, `deprecated_since`, `use_instead`) VALUES
(1, 1366381357, 'n', NULL, 'get_upload_preferences()', 61, '/home4/ughellip/public_html/phcn-admin/expressionengine/third_party/matrix/celltypes/file.php', '2.4', 'File_upload_preferences_model::get_file_upload_preferences() to support config variable overrides');

-- --------------------------------------------------------

--
-- Table structure for table `exp_email_cache`
--

CREATE TABLE IF NOT EXISTS `exp_email_cache` (
  `cache_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `cache_date` int(10) unsigned NOT NULL DEFAULT '0',
  `total_sent` int(6) unsigned NOT NULL,
  `from_name` varchar(70) NOT NULL,
  `from_email` varchar(70) NOT NULL,
  `recipient` text NOT NULL,
  `cc` text NOT NULL,
  `bcc` text NOT NULL,
  `recipient_array` mediumtext NOT NULL,
  `subject` varchar(120) NOT NULL,
  `message` mediumtext NOT NULL,
  `plaintext_alt` mediumtext NOT NULL,
  `mailinglist` char(1) NOT NULL DEFAULT 'n',
  `mailtype` varchar(6) NOT NULL,
  `text_fmt` varchar(40) NOT NULL,
  `wordwrap` char(1) NOT NULL DEFAULT 'y',
  `priority` char(1) NOT NULL DEFAULT '3',
  PRIMARY KEY (`cache_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_email_cache_mg`
--

CREATE TABLE IF NOT EXISTS `exp_email_cache_mg` (
  `cache_id` int(6) unsigned NOT NULL,
  `group_id` smallint(4) NOT NULL,
  PRIMARY KEY (`cache_id`,`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `exp_email_cache_ml`
--

CREATE TABLE IF NOT EXISTS `exp_email_cache_ml` (
  `cache_id` int(6) unsigned NOT NULL,
  `list_id` smallint(4) NOT NULL,
  PRIMARY KEY (`cache_id`,`list_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `exp_email_console_cache`
--

CREATE TABLE IF NOT EXISTS `exp_email_console_cache` (
  `cache_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `cache_date` int(10) unsigned NOT NULL DEFAULT '0',
  `member_id` int(10) unsigned NOT NULL,
  `member_name` varchar(50) NOT NULL,
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `recipient` varchar(70) NOT NULL,
  `recipient_name` varchar(50) NOT NULL,
  `subject` varchar(120) NOT NULL,
  `message` mediumtext NOT NULL,
  PRIMARY KEY (`cache_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_email_tracker`
--

CREATE TABLE IF NOT EXISTS `exp_email_tracker` (
  `email_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email_date` int(10) unsigned NOT NULL DEFAULT '0',
  `sender_ip` varchar(16) NOT NULL,
  `sender_email` varchar(75) NOT NULL,
  `sender_username` varchar(50) NOT NULL,
  `number_recipients` int(4) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`email_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_entry_ping_status`
--

CREATE TABLE IF NOT EXISTS `exp_entry_ping_status` (
  `entry_id` int(10) unsigned NOT NULL,
  `ping_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`entry_id`,`ping_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `exp_entry_versioning`
--

CREATE TABLE IF NOT EXISTS `exp_entry_versioning` (
  `version_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(10) unsigned NOT NULL,
  `channel_id` int(4) unsigned NOT NULL,
  `author_id` int(10) unsigned NOT NULL,
  `version_date` int(10) NOT NULL,
  `version_data` mediumtext NOT NULL,
  PRIMARY KEY (`version_id`),
  KEY `entry_id` (`entry_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=48 ;

--
-- Dumping data for table `exp_entry_versioning`
--

INSERT INTO `exp_entry_versioning` (`version_id`, `entry_id`, `channel_id`, `author_id`, `version_date`, `version_data`) VALUES
(1, 2, 2, 1, 1366339760, 'a:19:{s:8:"entry_id";i:2;s:10:"channel_id";s:1:"2";s:17:"autosave_entry_id";s:15:"[object Object]";s:6:"filter";s:0:"";s:12:"member_group";a:1:{i:0;s:1:"1";}s:14:"layout_preview";s:1:"1";s:5:"title";s:52:"Ughelli Power - The Black Start Of The National Grid";s:9:"url_title";s:50:"ughelli-power-the-black-start-of-the-national-grid";s:20:"field_id_3_directory";s:1:"1";s:10:"entry_date";i:1366339639;s:15:"expiration_date";s:0:"";s:11:"new_channel";s:1:"2";s:6:"status";s:4:"open";s:6:"author";s:1:"1";s:18:"versioning_enabled";s:1:"y";s:16:"pages__pages_uri";s:19:"/example/pages/uri/";s:24:"pages__pages_template_id";s:1:"3";s:6:"submit";s:6:"Submit";s:10:"field_id_3";s:61:"{filedir_1}ughelli-power-black-start-of-the-national-grid.jpg";}'),
(2, 3, 2, 1, 1366340396, 'a:19:{s:8:"entry_id";i:3;s:10:"channel_id";s:1:"2";s:17:"autosave_entry_id";s:1:"0";s:6:"filter";s:0:"";s:12:"member_group";a:1:{i:0;s:1:"1";}s:14:"layout_preview";s:1:"1";s:5:"title";s:55:"Ughelli Power Generating Power For Milions Of Nigerians";s:9:"url_title";s:55:"ughelli-power-generating-power-for-milions-of-nigerians";s:20:"field_id_3_directory";s:1:"1";s:10:"entry_date";i:1366340335;s:15:"expiration_date";s:0:"";s:11:"new_channel";s:1:"2";s:6:"status";s:4:"open";s:6:"author";s:1:"1";s:18:"versioning_enabled";s:1:"y";s:16:"pages__pages_uri";s:19:"/example/pages/uri/";s:24:"pages__pages_template_id";s:1:"3";s:6:"submit";s:6:"Submit";s:10:"field_id_3";s:70:"{filedir_1}ughelli-power-generating-power-for-milions-of-nigerians.jpg";}'),
(3, 5, 3, 1, 1366346603, 'a:18:{s:8:"entry_id";s:1:"5";s:10:"channel_id";s:1:"3";s:17:"autosave_entry_id";s:1:"0";s:6:"filter";s:0:"";s:12:"member_group";a:1:{i:0;s:1:"1";}s:14:"layout_preview";s:1:"1";s:5:"title";s:17:"Plants Facilities";s:9:"url_title";s:17:"plants-facilities";s:10:"field_id_4";s:8322:"<div class="grid_16" id="body">\n	<div class="grid_14 prefix_1 suffix_1" id="wrapper">\n		<h1 class="heading">\n			Power Plants<br />\n			&amp; Facilities</h1>\n		<ul class="pp_sub_nav">\n			<li>\n				<a href="#power-plants">Power Plants</a></li>\n			<li>\n				<a href="#generators">Generators</a></li>\n			<li>\n				<a href="#turbine">Turbine</a></li>\n			<li>\n				<a href="#raw-materials">Raw Materials</a></li>\n			<li>\n				<a href="#gallery">Gallery</a></li>\n		</ul>\n		<p class="subhead_dark">\n			Delta II and Delta III GE is fited with 150MW station each: built by Marubeni of Japan. The control systems were upgraded to Mark V, a fully computerized control system: for Delta II and III. While Delta I is scrapped.</p>\n		<p class="subhead_dark">\n			Delta IV control system is also fitted with a Mark V, upgraded by GE of USA which built the station.</p>\n		<a name="power-plants"></a>\n		<div class="grid_13 alpha">\n			<img alt="Ughelli Power Plants information" src="/assets/img/power-plants.jpg" /></div>\n		<a name="generators"></a>\n		<div class="grid_13 alpha">\n			<img alt="Ughelli Generators Information" src="/assets/img/generators.jpg" /></div>\n		<a name="turbine"></a>\n		<div class="grid_13 alpha">\n			<img alt="Ughelli Turbines Information" src="/assets/img/turbines.jpg" /></div>\n		<a name="raw-materials"></a>\n		<div class="grid_13 alpha border-bottom">\n			<h2 class="subhead_dark">\n				Raw Materials For Production</h2>\n			<p>\n				Ughelli Power Plc gets supply of natural gas from Shell Petroleum Development Company (SPDC) for Delta II &amp; III at a gas pressure of 21 &ndash; 22bars and Nigeria Gas Company (NGC) for Delta IV at a gas pressure of 19 &ndash; 21bars, but both SPDC and NGC can compliment each other in times of emergency through a tripartite gas line valve.</p>\n			<p>\n				The other major raw material is the atmospheric air that is filtered and compressed. Part of the air is used for cooling and atomization of the diesel fuel (where need be) for combustion during operation.</p>\n			<p>\n				Most part of the compressed air is used for the combustion in the combustion chambers, with the natural gas.</p>\n			<p>\n				Hydrogen is used in cooling the heavy generators at Delta IV because of the enormous heat that the generator windings emit. Hydrogen cools ten times better than air, hence its preference for air despite its high inflammability.</p>\n			<p>\n				The hydrogen is generated locally, from the electrolysis of water. Lube oil or lubricant oil is used in the gas turbine station for lubrication of the bearings, for hydraulic pressure and heat extraction.</p>\n		</div>\n		<div class="grid_13 alpha border-bottom">\n			<h2 class="subhead_dark">\n				Components Of The Gas Turbine</h2>\n			<ul class="list">\n				<li>\n					The starting device &ndash; a 3.3Kv starting motor or prime mover in a black start system.</li>\n				<li>\n					The air-filter arrangement</li>\n				<li>\n					The compressor</li>\n				<li>\n					The combustion chambers</li>\n				<li>\n					The turbines</li>\n				<li>\n					The expansion below or exhaust</li>\n				<li>\n					The generator</li>\n				<li>\n					The exciter</li>\n			</ul>\n		</div>\n		<div class="grid_13 alpha border-bottom">\n			<h2 class="subhead_dark">\n				The Piping Arrangement</h2>\n			<div class="grid_5 alpha">\n				<img alt="The piping arrangement" src="/assets/img/the-piping-arrangement.jpg" /></div>\n			<ul class="list grid_4 no-margin-top">\n				<li>\n					The gas supply piping</li>\n				<li>\n					The lube oil piping</li>\n				<li>\n					The hydraulic oil piping</li>\n				<li>\n					The cooling water piping</li>\n				<li>\n					The air piping</li>\n				<li>\n					The hydrogen piping</li>\n				<li>\n					The CO2 piping</li>\n			</ul>\n		</div>\n		<div class="grid_13 alpha border-bottom">\n			<h2 class="subhead_dark">\n				Method Of Production Of Electricity</h2>\n			<p>\n				The gas turbine use natural gas and compressed air as fuel to burn and rotate the shaft that turns the generator thereby generating electricity. Excitation is necessary to produce the required magnetic flux.</p>\n		</div>\n		<div class="grid_13 alpha border-bottom">\n			<h2 class="subhead_dark">\n				Uses Of Electricity</h2>\n			<p>\n				Most of the electricity is transported through step up transformers and network of conductors to various location around the country in the form of grid. Some parts of the electricity are utilized locally within and outside the plant.</p>\n		</div>\n		<div class="grid_13 alpha border-bottom">\n			<h2 class="subhead_dark">\n				Hydrogen Gas Production Plant</h2>\n			<p>\n				Hydrogen gas (H2) is produced in the station for cooling the heaven General Eletronics (GE) turbine generators of Delta IV.</p>\n			<p>\n				<strong>Plant Details</strong><br />\n				<strong>Model:</strong> 00700<br />\n				<strong>Capacity:</strong> 2 x 15Nm3/h<br />\n				<strong>Frequency:</strong> 50Hz<br />\n				<strong>Date of Comissioning:</strong> 1998/1999</p>\n		</div>\n		<div class="grid_13 alpha border-bottom">\n			<h2 class="subhead_dark">\n				Antifire System</h2>\n			<p>\n				The plant is equipped with sprinkler and hydrant fire fighting systems with automatic CO2 high sensitive flame detector and combating mechanics for fire emergency.</p>\n		</div>\n		<div class="grid_13 alpha border-bottom">\n			<h2 class="subhead_dark">\n				The Station&rsquo;s Highyard (Switchyard)</h2>\n			<div class="grid_6 alpha">\n				<img alt="Switch Yard" src="/assets/img/switchyard.jpg" /></div>\n			<div class="grid_6">\n				<p>\n					The Delta IV 330KV Highyard is configured to 1 1/2 breaker system to evacuate generated electricity from six (6) units of 6 x 100 Megawatts (600MW) of the plant into the national grid for onward distribution to power consumers in and outside the country</p>\n			</div>\n		</div>\n		<div class="grid_13 alpha">\n			<h2 class="subhead_dark">\n				Auxillary Facilities</h2>\n			<p>\n				The plant provides auxillary facilities for staff working in the plant, these incldudes: a staff housing estate built within the plant and a rented estate in the adjoining Ughelli metropolis. The plant also includes a standard medical clinic to provide medicare for staff and their family, in addition to specialist hospitals under retainership for referral purposes. For relaxation, a recreational club is situated in the plant for staff and their family. Lastly, a staff school comprising of a primary and secondary school in located in the staff estate to serve the educational demands of staff and the immediate community wards.</p>\n		</div>\n		<a name="gallery"></a>\n		<div class="grid_13 alpha" id="gallery">\n			<h2 class="subhead_dark">\n				Gallery</h2>\n			<h3 class="line">\n				&nbsp;</h3>\n			<p>\n				<em>Click on each thumbnail to get a larger view.</em></p>\n			<a class="fancybox-thumb" href="/assets/img/image-big1.jpg" rel="fancybox-thumb" title="Delta II and II gas line scrubber"> <img alt="Delta II and II gas line scrubber" src="/assets/img/image1.jpg" /> </a> <a class="fancybox-thumb" href="/assets/img/image-big2.jpg" rel="fancybox-thumb" title="120MVA Toshiba unit transformer"> <img alt="" src="/assets/img/image2.jpg" /> </a> <a class="fancybox-thumb" href="/assets/img/image-big3.jpg" rel="fancybox-thumb" title="Detla IV turbine floor"> <img alt="" src="/assets/img/image3.jpg" /> </a> <a class="fancybox-thumb" href="/assets/img/image-big4.jpg" rel="fancybox-thumb" title="Delta IV Control Room"> <img alt="" src="/assets/img/image4.jpg" /> </a> <a class="fancybox-thumb" href="/assets/img/image-big5.jpg" rel="fancybox-thumb" title="Delta II turbine floor"> <img alt="" src="/assets/img/image5.jpg" /> </a> <a class="fancybox-thumb" href="/assets/img/image-big6.jpg" rel="fancybox-thumb" title=""> <img alt="" src="/assets/img/image6.jpg" /> </a> <a class="fancybox-thumb" href="/assets/img/image-big7.jpg" rel="fancybox-thumb" title="The hydrogen plant"><img alt="" src="/assets/img/image7.jpg" /></a> <a class="fancybox-thumb" href="/assets/img/image-big8.jpg" rel="fancybox-thumb" title="GT13 hitachi-turbine generator"> <img alt="" src="/assets/img/image8.jpg" /> </a> <a class="fancybox-thumb" href="/assets/img/image-big9.jpg" rel="fancybox-thumb" title=""> <img alt="" src="/assets/img/image9.jpg" /> </a> <a class="fancybox-thumb" href="/assets/img/image-big10.jpg" rel="fancybox-thumb" title=""> <img alt="" src="/assets/img/image10.jpg" /> </a></div>\n	</div>\n</div>\n";s:10:"entry_date";i:1366346242;s:15:"expiration_date";s:0:"";s:11:"new_channel";s:1:"3";s:6:"status";s:4:"open";s:6:"author";s:1:"1";s:18:"versioning_enabled";s:1:"y";s:16:"pages__pages_uri";s:18:"/plants-facilities";s:24:"pages__pages_template_id";s:2:"10";s:6:"submit";s:6:"Submit";}'),
(4, 6, 3, 1, 1366346771, 'a:18:{s:8:"entry_id";i:6;s:10:"channel_id";s:1:"3";s:17:"autosave_entry_id";s:1:"0";s:6:"filter";s:0:"";s:12:"member_group";a:1:{i:0;s:1:"1";}s:14:"layout_preview";s:1:"1";s:5:"title";s:13:"Safety Policy";s:9:"url_title";s:13:"safety-policy";s:10:"field_id_4";s:3957:"<div class="grid_16" id="body">\n	<div class="grid_14 prefix_1 suffix_1" id="wrapper">\n		<h1 class="heading">\n			Safety Policy</h1>\n		<h2 class="grid_10 subhead bigger clearfix">\n			Please use the contact form below to contact us, or you can reach us via our office addresss and phone numbers</h2>\n		<div class="grid_11">\n			<p>\n				<strong>At Ughelli power, we recognize the value of safe and reliable operations and believe that our success is directly linked to the safety of our employees and the public.</strong></p>\n			<p>\n				We meet this challenge by promoting a safety culture wherein full compliance with safety regulations is the minimum level of acceptable performance. Doing so, requires a disciplined approach to safety, including governing adherence to standards that clearly communicates safety expectations, employee safety programs that meet and exceed these expecations.</p>\n			<p>\n				In compliance with our safety measures, we have put in place emergency measures, when all efforts fails. These includes an antifire system with sprinklers and hydrant fire fighting system with flame detector for fighting fire emergency. Also, a medical care center is located in the plant premises, for quick response in case of medical emergency.</p>\n			<p>\n				Our host communities are also not left out from these safety measures, we continually educate people on how to observe safety measures around our installations and what to do in cases of emergency.</p>\n			<h2 class="subhead_dark">\n				Electrical Safety tips</h2>\n			<ul class="list">\n				<li>\n					<strong>Keep away from transformers.</strong></li>\n				<li>\n					<strong>Never attempt to open the door of one of these transformers.</strong> If you find a door unlocked, call the nearest PHCN service station.</li>\n				<li>\n					<strong>Look up!</strong> Always examine your surroundings for power line locations before doing any outside work.</li>\n				<li>\n					<strong>Be cautious on the roof.</strong> Working on a roof may put you close to an overhead power line. Avoid standing up and accidentally touching a line with your head or shoulder.</li>\n				<li>\n					<strong>Do not plant vegetation</strong> to grow up or near utility poles or live wires.</li>\n				<li>\n					<strong>Be aware when moving farm equipment.</strong> Stay clear of overhead power lines when moving or storing farm equipments. Metals and wet objects conduct eletricity.</li>\n				<li>\n					<strong>Do not throw objects up into power lines.</strong> This can cause short circuits and could result in injuries. This includes items you might not consider conductive, like ropes and strings</li>\n				<li>\n					<strong>See something tangled in a power line? Stay clear.</strong> Never attempt to move an object from a power line yourself. Never climb the pole. Call any PHCN service station - they can help</li>\n				<li>\n					<strong>Never touch a downed power line.</strong> If you see a downed power line, contact your local PHCN service station immediately. Don&rsquo;t touch the line or anything that is in contact with it. Don&rsquo;t attempt to move the line. Keep others away, and consider every wire on the ground to be energized and dangerous.</li>\n				<li>\n					<strong>Obey warning signs.</strong> &ldquo;DANGER: HIGH VOLTAGE&rdquo; and other warning signs are posted in some locations. But remember, all electrical equipment can be dangerous.</li>\n				<li>\n					<strong>Substations are not playgrounds.</strong> At neighborhood substations, high-voltage electricity is reduced to be sent to homes. Don&#39;t climb over or crawl under substation fences, walls or gates. If a ball or toy goes over a fence and into a substation, call the nearest PHCN office. We will come and get it out for you.</li>\n				<li>\n					<strong>Stay inside during storms.</strong> When there is lightning outdoors, get inside a building or car if possible. Keep away from windows and open doors</li>\n			</ul>\n		</div>\n	</div>\n</div>\n";s:10:"entry_date";i:1366346650;s:15:"expiration_date";s:0:"";s:11:"new_channel";s:1:"3";s:6:"status";s:4:"open";s:6:"author";s:1:"1";s:18:"versioning_enabled";s:1:"y";s:16:"pages__pages_uri";s:14:"/safety-policy";s:24:"pages__pages_template_id";s:2:"10";s:6:"submit";s:6:"Submit";}'),
(5, 6, 3, 1, 1366346836, 'a:18:{s:8:"entry_id";s:1:"6";s:10:"channel_id";s:1:"3";s:17:"autosave_entry_id";s:1:"0";s:6:"filter";s:0:"";s:12:"member_group";a:1:{i:0;s:1:"1";}s:14:"layout_preview";s:1:"1";s:5:"title";s:13:"Safety Policy";s:9:"url_title";s:13:"safety-policy";s:10:"field_id_4";s:3959:"<div class="grid_16" id="body">\n	<div class="grid_14 prefix_1 suffix_1" id="wrapper">\n		<h1 class="heading">\n			Safetyss Policy</h1>\n		<h2 class="grid_10 subhead bigger clearfix">\n			Please use the contact form below to contact us, or you can reach us via our office addresss and phone numbers</h2>\n		<div class="grid_11">\n			<p>\n				<strong>At Ughelli power, we recognize the value of safe and reliable operations and believe that our success is directly linked to the safety of our employees and the public.</strong></p>\n			<p>\n				We meet this challenge by promoting a safety culture wherein full compliance with safety regulations is the minimum level of acceptable performance. Doing so, requires a disciplined approach to safety, including governing adherence to standards that clearly communicates safety expectations, employee safety programs that meet and exceed these expecations.</p>\n			<p>\n				In compliance with our safety measures, we have put in place emergency measures, when all efforts fails. These includes an antifire system with sprinklers and hydrant fire fighting system with flame detector for fighting fire emergency. Also, a medical care center is located in the plant premises, for quick response in case of medical emergency.</p>\n			<p>\n				Our host communities are also not left out from these safety measures, we continually educate people on how to observe safety measures around our installations and what to do in cases of emergency.</p>\n			<h2 class="subhead_dark">\n				Electrical Safety tips</h2>\n			<ul class="list">\n				<li>\n					<strong>Keep away from transformers.</strong></li>\n				<li>\n					<strong>Never attempt to open the door of one of these transformers.</strong> If you find a door unlocked, call the nearest PHCN service station.</li>\n				<li>\n					<strong>Look up!</strong> Always examine your surroundings for power line locations before doing any outside work.</li>\n				<li>\n					<strong>Be cautious on the roof.</strong> Working on a roof may put you close to an overhead power line. Avoid standing up and accidentally touching a line with your head or shoulder.</li>\n				<li>\n					<strong>Do not plant vegetation</strong> to grow up or near utility poles or live wires.</li>\n				<li>\n					<strong>Be aware when moving farm equipment.</strong> Stay clear of overhead power lines when moving or storing farm equipments. Metals and wet objects conduct eletricity.</li>\n				<li>\n					<strong>Do not throw objects up into power lines.</strong> This can cause short circuits and could result in injuries. This includes items you might not consider conductive, like ropes and strings</li>\n				<li>\n					<strong>See something tangled in a power line? Stay clear.</strong> Never attempt to move an object from a power line yourself. Never climb the pole. Call any PHCN service station - they can help</li>\n				<li>\n					<strong>Never touch a downed power line.</strong> If you see a downed power line, contact your local PHCN service station immediately. Don&rsquo;t touch the line or anything that is in contact with it. Don&rsquo;t attempt to move the line. Keep others away, and consider every wire on the ground to be energized and dangerous.</li>\n				<li>\n					<strong>Obey warning signs.</strong> &ldquo;DANGER: HIGH VOLTAGE&rdquo; and other warning signs are posted in some locations. But remember, all electrical equipment can be dangerous.</li>\n				<li>\n					<strong>Substations are not playgrounds.</strong> At neighborhood substations, high-voltage electricity is reduced to be sent to homes. Don&#39;t climb over or crawl under substation fences, walls or gates. If a ball or toy goes over a fence and into a substation, call the nearest PHCN office. We will come and get it out for you.</li>\n				<li>\n					<strong>Stay inside during storms.</strong> When there is lightning outdoors, get inside a building or car if possible. Keep away from windows and open doors</li>\n			</ul>\n		</div>\n	</div>\n</div>\n";s:10:"entry_date";i:1366346655;s:15:"expiration_date";s:0:"";s:11:"new_channel";s:1:"3";s:6:"status";s:4:"open";s:6:"author";s:1:"1";s:18:"versioning_enabled";s:1:"y";s:16:"pages__pages_uri";s:14:"/safety-policy";s:24:"pages__pages_template_id";s:2:"10";s:6:"submit";s:6:"Submit";}'),
(6, 6, 3, 1, 1366346857, 'a:18:{s:8:"entry_id";s:1:"6";s:10:"channel_id";s:1:"3";s:17:"autosave_entry_id";s:1:"0";s:6:"filter";s:0:"";s:12:"member_group";a:1:{i:0;s:1:"1";}s:14:"layout_preview";s:1:"1";s:5:"title";s:13:"Safety Policy";s:9:"url_title";s:13:"safety-policy";s:10:"field_id_4";s:3957:"<div class="grid_16" id="body">\n	<div class="grid_14 prefix_1 suffix_1" id="wrapper">\n		<h1 class="heading">\n			Safety Policy</h1>\n		<h2 class="grid_10 subhead bigger clearfix">\n			Please use the contact form below to contact us, or you can reach us via our office addresss and phone numbers</h2>\n		<div class="grid_11">\n			<p>\n				<strong>At Ughelli power, we recognize the value of safe and reliable operations and believe that our success is directly linked to the safety of our employees and the public.</strong></p>\n			<p>\n				We meet this challenge by promoting a safety culture wherein full compliance with safety regulations is the minimum level of acceptable performance. Doing so, requires a disciplined approach to safety, including governing adherence to standards that clearly communicates safety expectations, employee safety programs that meet and exceed these expecations.</p>\n			<p>\n				In compliance with our safety measures, we have put in place emergency measures, when all efforts fails. These includes an antifire system with sprinklers and hydrant fire fighting system with flame detector for fighting fire emergency. Also, a medical care center is located in the plant premises, for quick response in case of medical emergency.</p>\n			<p>\n				Our host communities are also not left out from these safety measures, we continually educate people on how to observe safety measures around our installations and what to do in cases of emergency.</p>\n			<h2 class="subhead_dark">\n				Electrical Safety tips</h2>\n			<ul class="list">\n				<li>\n					<strong>Keep away from transformers.</strong></li>\n				<li>\n					<strong>Never attempt to open the door of one of these transformers.</strong> If you find a door unlocked, call the nearest PHCN service station.</li>\n				<li>\n					<strong>Look up!</strong> Always examine your surroundings for power line locations before doing any outside work.</li>\n				<li>\n					<strong>Be cautious on the roof.</strong> Working on a roof may put you close to an overhead power line. Avoid standing up and accidentally touching a line with your head or shoulder.</li>\n				<li>\n					<strong>Do not plant vegetation</strong> to grow up or near utility poles or live wires.</li>\n				<li>\n					<strong>Be aware when moving farm equipment.</strong> Stay clear of overhead power lines when moving or storing farm equipments. Metals and wet objects conduct eletricity.</li>\n				<li>\n					<strong>Do not throw objects up into power lines.</strong> This can cause short circuits and could result in injuries. This includes items you might not consider conductive, like ropes and strings</li>\n				<li>\n					<strong>See something tangled in a power line? Stay clear.</strong> Never attempt to move an object from a power line yourself. Never climb the pole. Call any PHCN service station - they can help</li>\n				<li>\n					<strong>Never touch a downed power line.</strong> If you see a downed power line, contact your local PHCN service station immediately. Don&rsquo;t touch the line or anything that is in contact with it. Don&rsquo;t attempt to move the line. Keep others away, and consider every wire on the ground to be energized and dangerous.</li>\n				<li>\n					<strong>Obey warning signs.</strong> &ldquo;DANGER: HIGH VOLTAGE&rdquo; and other warning signs are posted in some locations. But remember, all electrical equipment can be dangerous.</li>\n				<li>\n					<strong>Substations are not playgrounds.</strong> At neighborhood substations, high-voltage electricity is reduced to be sent to homes. Don&#39;t climb over or crawl under substation fences, walls or gates. If a ball or toy goes over a fence and into a substation, call the nearest PHCN office. We will come and get it out for you.</li>\n				<li>\n					<strong>Stay inside during storms.</strong> When there is lightning outdoors, get inside a building or car if possible. Keep away from windows and open doors</li>\n			</ul>\n		</div>\n	</div>\n</div>\n";s:10:"entry_date";i:1366346676;s:15:"expiration_date";s:0:"";s:11:"new_channel";s:1:"3";s:6:"status";s:4:"open";s:6:"author";s:1:"1";s:18:"versioning_enabled";s:1:"y";s:16:"pages__pages_uri";s:14:"/safety-policy";s:24:"pages__pages_template_id";s:2:"10";s:6:"submit";s:6:"Submit";}'),
(22, 4, 3, 1, 1366382618, 'a:18:{s:8:"entry_id";s:1:"4";s:10:"channel_id";s:1:"3";s:17:"autosave_entry_id";s:1:"0";s:6:"filter";s:0:"";s:12:"member_group";a:1:{i:0;s:1:"1";}s:14:"layout_preview";s:1:"1";s:5:"title";s:5:"About";s:9:"url_title";s:5:"about";s:10:"field_id_4";s:4036:"<div class="grid_16" id="body">\n	<div class="grid_14 prefix_1 suffix_1" id="wrapper">\n		<h1 class="heading">\n			About Us</h1>\n		<div class="grid_6 alpha">\n			<img alt="Ughelli Gas Turbine" src="/assets/img/ughelli-gas-turbine.jpg" />\n			<p class="emphasis_light">\n				Gas Turbine Station located at Kilometre 20 Ughelli-Patani Road, before Ughelli Town</p>\n		</div>\n		<div class="grid_7">\n			<h2 class="subhead bigger clearfix">\n				Ughelli Power makes life easier for millions of Nigerians, with an installed capacity of 900MW of electricity, thereby contributing its quota in actualizing the goal that Nigerians enjoy cheap and constant power supply.</h2>\n			<div class="line">\n				&nbsp;</div>\n			<h2 class="subhead_dark">\n				Vision</h2>\n			<p>\n				To be the best in generation of reliable, stable and high quality eletricity within the Nigerian domain.</p>\n			<h2 class="subhead_dark">\n				Mission</h2>\n			<p>\n				To generate stable eletricity efficiently; at the most competitive cost through team work, while partnering with the community and the environment</p>\n		</div>\n		<div class="grid_14 line alpha">\n			&nbsp;</div>\n		<div class="grid_9">\n			<h2 class="subhead_dark">\n				Historical Perspective</h2>\n			<p>\n				Ughelli Power is among the 18 electricity successor companies unbundled from Power Holding Company of Nigeria (PHCN) in 2003. Owing to various changes in the Federal Government policies on the electricity industry from 1973 to 2009, Ughelli Power Plc has on various occasions changed its name and out-look.</p>\n			<p>\n				The station was built in 1964 with an installed capacity of 2X36MW or 72MW from two Stal-Laval gas turbines. Then the station was called Delta I under Electricity Corporation of Nigeria (ECN).</p>\n			<p>\n				In 1975 six units of &nbsp;General Electric (GE) gas turbines (20MW each) were installed in the station known as Delta II, after the merger of Niger Dam Authority (NDA), Kainji and the ECN to form the National Electric Power Authority (NEPA).</p>\n			<p>\n				In 1978 additional six units of GE gas turbines, like the ones installed in 1975, were added to Delta Power Station to boost the installed capacity to a total of 312MW, as follows:</p>\n			<p>\n				Delta I, 2 X 36 &thinsp; &thinsp; &thinsp;72MW<br />\n				Delta II, 6 X 20&thinsp; &thinsp; &thinsp;120MW<br />\n				Delta III, 6 X 20&thinsp; &thinsp;&thinsp;120MW<br />\n				<strong>Total &thinsp; &thinsp;&thinsp;&thinsp; &thinsp; &thinsp; &thinsp; &thinsp; &thinsp; &thinsp; &thinsp; 312MW</strong></p>\n			<p>\n				The station was upgraded in 1991 with the addition of 6 X 100MW (600MW) GE gas turbines.</p>\n			<p>\n				From 2000 to 2008 Delta II and Delta III GE units were upgraded to 150MW station each: built by Marubeni of Japan. The control systems were upgraded to Mark V, a fully computerized control system for Delta II and III. While Delta I was scrapped.</p>\n			<p>\n				Delta IV control system was also upgraded to Mark V by GE of USA which built the station.</p>\n			<p>\n				Today, the generation capacity of Ughelli Power stands at 900MW with the Delta II, III &amp; IV running at full capacity. Most of the electricity producted by Ughelli is transported through a network of conductors, to the national grid.</p>\n		</div>\n		<div class="grid_4 omega" id="quick_facts">\n			<h1 class="subhead_dark bigger">\n				Quick Facts</h1>\n			<h3 class="line">\n				&nbsp;</h3>\n			<ul class="list border_bottom">\n				<li>\n					Over 49years of Service</li>\n				<li>\n					Ughelli Power, has four (4) power plants, Delta I, Delta II, Delta III &amp; Delta IV with the Delta I retired.</li>\n				<li>\n					Ughelli Power has an intalled capacity of 900MW.</li>\n				<li>\n					Custom fitted engine starters in Delta II and Delta III turbines enables the station to black start the National Grid in case of emergency or cases of total or partial syayem collapses.</li>\n				<li>\n					Ughelli power provides auxillary facilities for staff, such as: Staff Housing, Medicare, School and Recreational Club.</li>\n			</ul>\n		</div>\n	</div>\n</div>\n";s:10:"entry_date";i:1366341757;s:15:"expiration_date";s:0:"";s:11:"new_channel";s:1:"3";s:6:"status";s:4:"open";s:6:"author";s:1:"1";s:18:"versioning_enabled";s:1:"y";s:16:"pages__pages_uri";s:6:"/about";s:24:"pages__pages_template_id";s:2:"10";s:13:"save_revision";s:13:"Save Revision";}'),
(23, 4, 3, 2, 1366382821, 'a:16:{s:8:"entry_id";s:1:"4";s:10:"channel_id";s:1:"3";s:17:"autosave_entry_id";s:1:"0";s:6:"filter";s:0:"";s:5:"title";s:5:"About";s:9:"url_title";s:5:"about";s:10:"field_id_4";s:4057:"<div class="grid_16" id="body">\n	<div class="grid_14 prefix_1 suffix_1" id="wrapper">\n		<h1 class="heading">\n			About Us</h1>\n		<div class="grid_6 alpha">\n			<img alt="Ughelli Gas Turbine" src="/assets/img/ughelli-gas-turbine.jpg" />\n			<p class="emphasis_light">\n				Gas Turbine Station located at Kilometre 20 Ughelli-Patani Road, before Ughelli Town</p>\n		</div>\n		<div class="grid_7">\n			<h2 class="subhead bigger clearfix">\n				Ughelli Power makes life easier for millions of Nigerians, with an installed capacity of 900MW of electricity, thereby contributing its quota in actualizing the goal that Nigerians enjoy cheap and constant power supply.</h2>\n			<div class="line">\n				&nbsp;</div>\n			<h2 class="subhead_dark">\n				Vision</h2>\n			<p>\n				To be the best in generation of reliable, stable and high quality eletricity within the Nigerian domain.</p>\n			<h2 class="subhead_dark">\n				Mission</h2>\n			<p>\n				To generate stable eletricity efficiently; at the most competitive cost through team work, while partnering with the community and the environment</p>\n		</div>\n		<div class="grid_14 line alpha">\n			&nbsp;</div>\n		<div class="grid_9">\n			<h2 class="subhead_dark">\n				Historical Perspective</h2>\n			<p>\n				Ughelli Power is among the 18 electricity successor companies unbundled from Power Holding Company of Nigeria (PHCN) in 2003. Owing to various changes in the Federal Government policies on the electricity industry from 1973 to 2009, Ughelli Power Plc has on various occasions changed its name and out-look.</p>\n			<p>\n				The station was built in 1964 with an installed capacity of 2X36MW or 72MW from two Stal-Laval gas turbines. Then the station was called Delta I under Electricity Corporation of Nigeria (ECN).</p>\n			<p>\n				In 1975 six units of &nbsp;General Electric (GE) gas turbines (20MW each) were installed in the station known as Delta II, after the merger of Niger Dam Authority (NDA), Kainji and the ECN to form the National Electric Power Authority (NEPA).</p>\n			<p>\n				In 1978 additional six units of GE gas turbines, like the ones installed in 1975, were added to Delta Power Station (Known as Delta III) to boost the installed capacity to a total of 312MW, as follows:</p>\n			<p>\n				Delta I, 2 X 36 &thinsp; &thinsp; &thinsp;72MW<br />\n				Delta II, 6 X 20&thinsp; &thinsp; &thinsp;120MW<br />\n				Delta III, 6 X 20&thinsp; &thinsp;&thinsp;120MW<br />\n				<strong>Total &thinsp; &thinsp;&thinsp;&thinsp; &thinsp; &thinsp; &thinsp; &thinsp; &thinsp; &thinsp; &thinsp; 312MW</strong></p>\n			<p>\n				The station was upgraded in 1991 with the addition of 6 X 100MW (600MW) GE gas turbines.</p>\n			<p>\n				From 2000 to 2008 Delta II and Delta III GE units were upgraded to 150MW station each: built by Marubeni of Japan. The control systems were upgraded to Mark V, a fully computerized control system for Delta II and III. While Delta I was scrapped.</p>\n			<p>\n				Delta IV control system was also upgraded to Mark V by GE of USA which built the station.</p>\n			<p>\n				Today, the generation capacity of Ughelli Power stands at 900MW with the Delta II, III &amp; IV running at full capacity. Most of the electricity producted by Ughelli is transported through a network of conductors, to the national grid.</p>\n		</div>\n		<div class="grid_4 omega" id="quick_facts">\n			<h1 class="subhead_dark bigger">\n				Quick Facts</h1>\n			<h3 class="line">\n				&nbsp;</h3>\n			<ul class="list border_bottom">\n				<li>\n					Over 49years of Service</li>\n				<li>\n					Ughelli Power, has four (4) power plants, Delta I, Delta II, Delta III &amp; Delta IV with the Delta I retired.</li>\n				<li>\n					Ughelli Power has an intalled capacity of 900MW.</li>\n				<li>\n					Custom fitted engine starters in Delta II and Delta III turbines enables the station to black start the National Grid in case of emergency or cases of total or partial syayem collapses.</li>\n				<li>\n					Ughelli power provides auxillary facilities for staff, such as: Staff Housing, Medicare, School and Recreational Club.</li>\n			</ul>\n		</div>\n	</div>\n</div>\n";s:10:"entry_date";i:1366341720;s:15:"expiration_date";s:0:"";s:11:"new_channel";s:1:"3";s:6:"status";s:6:"closed";s:6:"author";s:1:"1";s:18:"versioning_enabled";s:1:"y";s:16:"pages__pages_uri";s:6:"/about";s:24:"pages__pages_template_id";s:2:"10";s:6:"submit";s:6:"Submit";}'),
(24, 4, 3, 1, 1366382898, 'a:18:{s:8:"entry_id";s:1:"4";s:10:"channel_id";s:1:"3";s:17:"autosave_entry_id";s:1:"0";s:6:"filter";s:0:"";s:12:"member_group";a:1:{i:0;s:1:"1";}s:14:"layout_preview";s:1:"1";s:5:"title";s:5:"About";s:9:"url_title";s:5:"about";s:10:"field_id_4";s:4057:"<div class="grid_16" id="body">\n	<div class="grid_14 prefix_1 suffix_1" id="wrapper">\n		<h1 class="heading">\n			About Us</h1>\n		<div class="grid_6 alpha">\n			<img alt="Ughelli Gas Turbine" src="/assets/img/ughelli-gas-turbine.jpg" />\n			<p class="emphasis_light">\n				Gas Turbine Station located at Kilometre 20 Ughelli-Patani Road, before Ughelli Town</p>\n		</div>\n		<div class="grid_7">\n			<h2 class="subhead bigger clearfix">\n				Ughelli Power makes life easier for millions of Nigerians, with an installed capacity of 900MW of electricity, thereby contributing its quota in actualizing the goal that Nigerians enjoy cheap and constant power supply.</h2>\n			<div class="line">\n				&nbsp;</div>\n			<h2 class="subhead_dark">\n				Vision</h2>\n			<p>\n				To be the best in generation of reliable, stable and high quality eletricity within the Nigerian domain.</p>\n			<h2 class="subhead_dark">\n				Mission</h2>\n			<p>\n				To generate stable eletricity efficiently; at the most competitive cost through team work, while partnering with the community and the environment</p>\n		</div>\n		<div class="grid_14 line alpha">\n			&nbsp;</div>\n		<div class="grid_9">\n			<h2 class="subhead_dark">\n				Historical Perspective</h2>\n			<p>\n				Ughelli Power is among the 18 electricity successor companies unbundled from Power Holding Company of Nigeria (PHCN) in 2003. Owing to various changes in the Federal Government policies on the electricity industry from 1973 to 2009, Ughelli Power Plc has on various occasions changed its name and out-look.</p>\n			<p>\n				The station was built in 1964 with an installed capacity of 2X36MW or 72MW from two Stal-Laval gas turbines. Then the station was called Delta I under Electricity Corporation of Nigeria (ECN).</p>\n			<p>\n				In 1975 six units of &nbsp;General Electric (GE) gas turbines (20MW each) were installed in the station known as Delta II, after the merger of Niger Dam Authority (NDA), Kainji and the ECN to form the National Electric Power Authority (NEPA).</p>\n			<p>\n				In 1978 additional six units of GE gas turbines, like the ones installed in 1975, were added to Delta Power Station (Known as Delta III) to boost the installed capacity to a total of 312MW, as follows:</p>\n			<p>\n				Delta I, 2 X 36 &thinsp; &thinsp; &thinsp;72MW<br />\n				Delta II, 6 X 20&thinsp; &thinsp; &thinsp;120MW<br />\n				Delta III, 6 X 20&thinsp; &thinsp;&thinsp;120MW<br />\n				<strong>Total &thinsp; &thinsp;&thinsp;&thinsp; &thinsp; &thinsp; &thinsp; &thinsp; &thinsp; &thinsp; &thinsp; 312MW</strong></p>\n			<p>\n				The station was upgraded in 1991 with the addition of 6 X 100MW (600MW) GE gas turbines.</p>\n			<p>\n				From 2000 to 2008 Delta II and Delta III GE units were upgraded to 150MW station each: built by Marubeni of Japan. The control systems were upgraded to Mark V, a fully computerized control system for Delta II and III. While Delta I was scrapped.</p>\n			<p>\n				Delta IV control system was also upgraded to Mark V by GE of USA which built the station.</p>\n			<p>\n				Today, the generation capacity of Ughelli Power stands at 900MW with the Delta II, III &amp; IV running at full capacity. Most of the electricity producted by Ughelli is transported through a network of conductors, to the national grid.</p>\n		</div>\n		<div class="grid_4 omega" id="quick_facts">\n			<h1 class="subhead_dark bigger">\n				Quick Facts</h1>\n			<h3 class="line">\n				&nbsp;</h3>\n			<ul class="list border_bottom">\n				<li>\n					Over 49years of Service</li>\n				<li>\n					Ughelli Power, has four (4) power plants, Delta I, Delta II, Delta III &amp; Delta IV with the Delta I retired.</li>\n				<li>\n					Ughelli Power has an intalled capacity of 900MW.</li>\n				<li>\n					Custom fitted engine starters in Delta II and Delta III turbines enables the station to black start the National Grid in case of emergency or cases of total or partial syayem collapses.</li>\n				<li>\n					Ughelli power provides auxillary facilities for staff, such as: Staff Housing, Medicare, School and Recreational Club.</li>\n			</ul>\n		</div>\n	</div>\n</div>\n";s:10:"entry_date";i:1366341737;s:15:"expiration_date";s:0:"";s:11:"new_channel";s:1:"3";s:6:"status";s:4:"open";s:6:"author";s:1:"1";s:18:"versioning_enabled";s:1:"y";s:16:"pages__pages_uri";s:6:"/about";s:24:"pages__pages_template_id";s:2:"10";s:6:"submit";s:6:"Submit";}'),
(25, 4, 3, 1, 1366382934, 'a:18:{s:8:"entry_id";s:1:"4";s:10:"channel_id";s:1:"3";s:17:"autosave_entry_id";s:1:"0";s:6:"filter";s:0:"";s:12:"member_group";a:1:{i:0;s:1:"1";}s:14:"layout_preview";s:1:"1";s:5:"title";s:5:"About";s:9:"url_title";s:5:"about";s:10:"field_id_4";s:4057:"<div class="grid_16" id="body">\n	<div class="grid_14 prefix_1 suffix_1" id="wrapper">\n		<h1 class="heading">\n			About Us</h1>\n		<div class="grid_6 alpha">\n			<img alt="Ughelli Gas Turbine" src="/assets/img/ughelli-gas-turbine.jpg" />\n			<p class="emphasis_light">\n				Gas Turbine Station located at Kilometre 20 Ughelli-Patani Road, before Ughelli Town</p>\n		</div>\n		<div class="grid_7">\n			<h2 class="subhead bigger clearfix">\n				Ughelli Power makes life easier for millions of Nigerians, with an installed capacity of 900MW of electricity, thereby contributing its quota in actualizing the goal that Nigerians enjoy cheap and constant power supply.</h2>\n			<div class="line">\n				&nbsp;</div>\n			<h2 class="subhead_dark">\n				Vision</h2>\n			<p>\n				To be the best in generation of reliable, stable and high quality eletricity within the Nigerian domain.</p>\n			<h2 class="subhead_dark">\n				Mission</h2>\n			<p>\n				To generate stable eletricity efficiently; at the most competitive cost through team work, while partnering with the community and the environment</p>\n		</div>\n		<div class="grid_14 line alpha">\n			&nbsp;</div>\n		<div class="grid_9">\n			<h2 class="subhead_dark">\n				Historical Perspective</h2>\n			<p>\n				Ughelli Power is among the 18 electricity successor companies unbundled from Power Holding Company of Nigeria (PHCN) in 2003. Owing to various changes in the Federal Government policies on the electricity industry from 1973 to 2009, Ughelli Power Plc has on various occasions changed its name and out-look.</p>\n			<p>\n				The station was built in 1964 with an installed capacity of 2X36MW or 72MW from two Stal-Laval gas turbines. Then the station was called Delta I under Electricity Corporation of Nigeria (ECN).</p>\n			<p>\n				In 1975 six units of &nbsp;General Electric (GE) gas turbines (20MW each) were installed in the station known as Delta II, after the merger of Niger Dam Authority (NDA), Kainji and the ECN to form the National Electric Power Authority (NEPA).</p>\n			<p>\n				In 1978 additional six units of GE gas turbines, like the ones installed in 1975, were added to Delta Power Station (Known as Delta III) to boost the installed capacity to a total of 312MW, as follows:</p>\n			<p>\n				Delta I, 2 X 36 &thinsp; &thinsp; &thinsp;72MW<br />\n				Delta II, 6 X 20&thinsp; &thinsp; &thinsp;120MW<br />\n				Delta III, 6 X 20&thinsp; &thinsp;&thinsp;120MW<br />\n				<strong>Total &thinsp; &thinsp;&thinsp;&thinsp; &thinsp; &thinsp; &thinsp; &thinsp; &thinsp; &thinsp; &thinsp; 312MW</strong></p>\n			<p>\n				The station was upgraded in 1991 with the addition of 6 X 100MW (600MW) GE gas turbines.</p>\n			<p>\n				From 2000 to 2008 Delta II and Delta III GE units were upgraded to 150MW station each: built by Marubeni of Japan. The control systems were upgraded to Mark V, a fully computerized control system for Delta II and III. While Delta I was scrapped.</p>\n			<p>\n				Delta IV control system was also upgraded to Mark V by GE of USA which built the station.</p>\n			<p>\n				Today, the generation capacity of Ughelli Power stands at 900MW with the Delta II, III &amp; IV running at full capacity. Most of the electricity producted by Ughelli is transported through a network of conductors, to the national grid.</p>\n		</div>\n		<div class="grid_4 omega" id="quick_facts">\n			<h1 class="subhead_dark bigger">\n				Quick Facts</h1>\n			<h3 class="line">\n				&nbsp;</h3>\n			<ul class="list border_bottom">\n				<li>\n					Over 49years of Service</li>\n				<li>\n					Ughelli Power, has four (4) power plants, Delta I, Delta II, Delta III &amp; Delta IV with the Delta I retired.</li>\n				<li>\n					Ughelli Power has an intalled capacity of 900MW.</li>\n				<li>\n					Custom fitted engine starters in Delta II and Delta III turbines enables the station to black start the National Grid in case of emergency or cases of total or partial syayem collapses.</li>\n				<li>\n					Ughelli power provides auxillary facilities for staff, such as: Staff Housing, Medicare, School and Recreational Club.</li>\n			</ul>\n		</div>\n	</div>\n</div>\n";s:10:"entry_date";i:1366341773;s:15:"expiration_date";s:0:"";s:11:"new_channel";s:1:"3";s:6:"status";s:4:"open";s:6:"author";s:1:"1";s:18:"versioning_enabled";s:1:"y";s:16:"pages__pages_uri";s:6:"/about";s:24:"pages__pages_template_id";s:2:"10";s:6:"submit";s:6:"Submit";}'),
(26, 4, 3, 2, 1366383291, 'a:16:{s:8:"entry_id";s:1:"4";s:10:"channel_id";s:1:"3";s:17:"autosave_entry_id";s:1:"0";s:6:"filter";s:0:"";s:5:"title";s:5:"About";s:9:"url_title";s:5:"about";s:10:"field_id_4";s:4057:"<div class="grid_16" id="body">\n	<div class="grid_14 prefix_1 suffix_1" id="wrapper">\n		<h1 class="heading">\n			About Us</h1>\n		<div class="grid_6 alpha">\n			<img alt="Ughelli Gas Turbine" src="/assets/img/ughelli-gas-turbine.jpg" />\n			<p class="emphasis_light">\n				Gas Turbine Station located at Kilometre 20 Ughelli-Patani Road, before Ughelli Town</p>\n		</div>\n		<div class="grid_7">\n			<h2 class="subhead bigger clearfix">\n				Ughelli Power makes life easier for millions of Nigerians, with an installed capacity of 900MW of electricity, thereby contributing its quota in actualizing the goal that Nigerians enjoy cheap and constant power supply.</h2>\n			<div class="line">\n				&nbsp;</div>\n			<h2 class="subhead_dark">\n				Vision</h2>\n			<p>\n				To be the best in generation of reliable, stable and high quality eletricity within the Nigerian domain.</p>\n			<h2 class="subhead_dark">\n				Mission</h2>\n			<p>\n				To generate stable eletricity efficiently; at the most competitive cost through team work, while partnering with the community and the environment</p>\n		</div>\n		<div class="grid_14 line alpha">\n			&nbsp;</div>\n		<div class="grid_9">\n			<h2 class="subhead_dark">\n				Historical Perspective</h2>\n			<p>\n				Ughelli Power is among the 18 electricity successor companies unbundled from Power Holding Company of Nigeria (PHCN) in 2003. Owing to various changes in the Federal Government policies on the electricity industry from 1973 to 2009, Ughelli Power Plc has on various occasions changed its name and out-look.</p>\n			<p>\n				The station was built in 1964 with an installed capacity of 2X36MW or 72MW from two Stal-Laval gas turbines. Then the station was called Delta I under Electricity Corporation of Nigeria (ECN).</p>\n			<p>\n				In 1975 six units of &nbsp;General Electric (GE) gas turbines (20MW each) were installed in the station known as Delta II, after the merger of Niger Dam Authority (NDA), Kainji and the ECN to form the National Electric Power Authority (NEPA).</p>\n			<p>\n				In 1978 additional six units of GE gas turbines, like the ones installed in 1975, were added to Delta Power Station (Known as Delta III) to boost the installed capacity to a total of 312MW, as follows:</p>\n			<p>\n				Delta I, 2 X 36 &thinsp; &thinsp; &thinsp;72MW<br />\n				Delta II, 6 X 20&thinsp; &thinsp; &thinsp;120MW<br />\n				Delta III, 6 X 20&thinsp; &thinsp;&thinsp;120MW<br />\n				<strong>Total &thinsp; &thinsp;&thinsp;&thinsp; &thinsp; &thinsp; &thinsp; &thinsp; &thinsp; &thinsp; &thinsp; 312MW</strong></p>\n			<p>\n				The station was upgraded in 1991 with the addition of 6 X 100MW (600MW) GE gas turbines.</p>\n			<p>\n				From 2000 to 2008 Delta II and Delta III GE units were upgraded to 150MW station each: built by Marubeni of Japan. The control systems were upgraded to Mark V, a fully computerized control system for Delta II and III. While Delta I was scrapped.</p>\n			<p>\n				Delta IV control system was also upgraded to Mark V by GE of USA which built the station.</p>\n			<p>\n				Today, the generation capacity of Ughelli Power stands at 900MW with the Delta II, III &amp; IV running at full capacity. Most of the electricity producted by Ughelli is transported through a network of conductors, to the national grid.</p>\n		</div>\n		<div class="grid_4 omega" id="quick_facts">\n			<h1 class="subhead_dark bigger">\n				Quick Facts</h1>\n			<h3 class="line">\n				&nbsp;</h3>\n			<ul class="list border_bottom">\n				<li>\n					Over 49years of Service</li>\n				<li>\n					Ughelli Power, has four (4) power plants, Delta I, Delta II, Delta III &amp; Delta IV with the Delta I retired.</li>\n				<li>\n					Ughelli Power has an intalled capacity of 900MW.</li>\n				<li>\n					Custom fitted Engine starters in Delta II and Delta III turbines enables the station to black start the National Grid in case of emergency or cases of total or partial syayem collapses.</li>\n				<li>\n					Ughelli power provides auxillary facilities for staff, such as: Staff Housing, Medicare, School and Recreational Club.</li>\n			</ul>\n		</div>\n	</div>\n</div>\n";s:10:"entry_date";i:1366341770;s:15:"expiration_date";s:0:"";s:11:"new_channel";s:1:"3";s:6:"status";s:4:"open";s:6:"author";s:1:"1";s:18:"versioning_enabled";s:1:"y";s:16:"pages__pages_uri";s:6:"/about";s:24:"pages__pages_template_id";s:2:"10";s:6:"submit";s:6:"Submit";}');
INSERT INTO `exp_entry_versioning` (`version_id`, `entry_id`, `channel_id`, `author_id`, `version_date`, `version_data`) VALUES
(27, 6, 3, 2, 1366383536, 'a:16:{s:8:"entry_id";s:1:"6";s:10:"channel_id";s:1:"3";s:17:"autosave_entry_id";s:1:"0";s:6:"filter";s:0:"";s:5:"title";s:13:"Safety Policy";s:9:"url_title";s:13:"safety-policy";s:10:"field_id_4";s:3957:"<div class="grid_16" id="body">\n	<div class="grid_14 prefix_1 suffix_1" id="wrapper">\n		<h1 class="heading">\n			Safety Policy</h1>\n		<h2 class="grid_10 subhead bigger clearfix">\n			Please use the contact form below to contact us, or you can reach us via our office addresss and phone numbers</h2>\n		<div class="grid_11">\n			<p>\n				<strong>At Ughelli Power, we recognize the value of safe and reliable operations and believe that our success is directly linked to the safety of our employees and the public.</strong></p>\n			<p>\n				We meet this challenge by promoting a safety culture wherein full compliance with safety regulations is the minimum level of acceptable performance. Doing so, requires a disciplined approach to safety, including governing adherence to standards that clearly communicates safety expectations, employee safety programs that meet and exceed these expecations.</p>\n			<p>\n				In compliance with our safety measures, we have put in place emergency measures, when all efforts fails. These includes an antifire system with sprinklers and hydrant fire fighting system with flame detector for fighting fire emergency. Also, a medical care center is located in the plant premises, for quick response in case of medical emergency.</p>\n			<p>\n				Our host communities are also not left out from these safety measures, we continually educate people on how to observe safety measures around our installations and what to do in cases of emergency.</p>\n			<h2 class="subhead_dark">\n				Electrical Safety Tips</h2>\n			<ul class="list">\n				<li>\n					<strong>Keep away from transformers.</strong></li>\n				<li>\n					<strong>Never attempt to open the door of one of these transformers.</strong> If you find a door unlocked, call the nearest PHCN service station.</li>\n				<li>\n					<strong>Look up!</strong> Always examine your surroundings for power line locations before doing any outside work.</li>\n				<li>\n					<strong>Be cautious on the roof.</strong> Working on a roof may put you close to an overhead power line. Avoid standing up and accidentally touching a line with your head or shoulder.</li>\n				<li>\n					<strong>Do not plant vegetation</strong> to grow up or near utility poles or live wires.</li>\n				<li>\n					<strong>Be aware when moving farm equipment.</strong> Stay clear of overhead power lines when moving or storing farm equipments. Metals and wet objects conduct eletricity.</li>\n				<li>\n					<strong>Do not throw objects up into power lines.</strong> This can cause short circuits and could result in injuries. This includes items you might not consider conductive, like ropes and strings</li>\n				<li>\n					<strong>See something tangled in a power line? Stay clear.</strong> Never attempt to move an object from a power line yourself. Never climb the pole. Call any PHCN service station - they can help</li>\n				<li>\n					<strong>Never touch a downed power line.</strong> If you see a downed power line, contact your local PHCN service station immediately. Don&rsquo;t touch the line or anything that is in contact with it. Don&rsquo;t attempt to move the line. Keep others away, and consider every wire on the ground to be energized and dangerous.</li>\n				<li>\n					<strong>Obey warning signs.</strong> &ldquo;DANGER: HIGH VOLTAGE&rdquo; and other warning signs are posted in some locations. But remember, all electrical equipment can be dangerous.</li>\n				<li>\n					<strong>Substations are not playgrounds.</strong> At neighborhood substations, high-voltage electricity is reduced to be sent to homes. Don&#39;t climb over or crawl under substation fences, walls or gates. If a ball or toy goes over a fence and into a substation, call the nearest PHCN office. We will come and get it out for you.</li>\n				<li>\n					<strong>Stay inside during storms.</strong> When there is lightning outdoors, get inside a building or car if possible. Keep away from windows and open doors</li>\n			</ul>\n		</div>\n	</div>\n</div>\n";s:10:"entry_date";i:1366346695;s:15:"expiration_date";s:0:"";s:11:"new_channel";s:1:"3";s:6:"status";s:4:"open";s:6:"author";s:1:"1";s:18:"versioning_enabled";s:1:"y";s:16:"pages__pages_uri";s:14:"/safety-policy";s:24:"pages__pages_template_id";s:2:"10";s:6:"submit";s:6:"Submit";}'),
(33, 7, 4, 2, 1367320282, 'a:18:{s:8:"entry_id";s:1:"7";s:10:"channel_id";s:1:"4";s:17:"autosave_entry_id";s:1:"0";s:6:"filter";s:0:"";s:5:"title";s:7:"Contact";s:9:"url_title";s:7:"contact";s:10:"field_id_5";s:200:"<p>\n	<strong>Office Address: </strong>Kilometre 20 Ughelli-Patani Road, before Ughelli Town.</p>\n<p>\n	<strong>E-mail: </strong>info@ughellipower.com<br />\n	<strong>Telephone: </strong>07031986595</p>\n";s:10:"field_id_6";s:0:"";s:10:"field_id_7";s:128:"<iframe src="http://www.facebook.com/plugins/like.php?href=http%3A%2F%2Fwww.facebook.com/&amp;layout=button_count&amp;show_faces";s:10:"entry_date";i:1366347201;s:15:"expiration_date";s:0:"";s:11:"new_channel";s:1:"4";s:6:"status";s:4:"open";s:6:"author";s:1:"1";s:18:"versioning_enabled";s:1:"y";s:16:"pages__pages_uri";s:8:"/contact";s:24:"pages__pages_template_id";s:1:"5";s:6:"submit";s:6:"Submit";}'),
(34, 7, 4, 2, 1367320340, 'a:18:{s:8:"entry_id";s:1:"7";s:10:"channel_id";s:1:"4";s:17:"autosave_entry_id";s:1:"0";s:6:"filter";s:0:"";s:5:"title";s:7:"Contact";s:9:"url_title";s:7:"contact";s:10:"field_id_5";s:200:"<p>\n	<strong>Office Address: </strong>Kilometre 20 Ughelli-Patani Road, before Ughelli Town.</p>\n<p>\n	<strong>E-mail: </strong>info@ughellipower.com<br />\n	<strong>Telephone: </strong>07031986595</p>\n";s:10:"field_id_6";s:0:"";s:10:"field_id_7";s:0:"";s:10:"entry_date";i:1366347199;s:15:"expiration_date";s:0:"";s:11:"new_channel";s:1:"4";s:6:"status";s:4:"open";s:6:"author";s:1:"1";s:18:"versioning_enabled";s:1:"y";s:16:"pages__pages_uri";s:8:"/contact";s:24:"pages__pages_template_id";s:1:"5";s:6:"submit";s:6:"Submit";}'),
(35, 7, 4, 2, 1367321060, 'a:18:{s:8:"entry_id";s:1:"7";s:10:"channel_id";s:1:"4";s:17:"autosave_entry_id";s:1:"0";s:6:"filter";s:0:"";s:5:"title";s:7:"Contact";s:9:"url_title";s:7:"contact";s:10:"field_id_5";s:200:"<p>\n	<strong>Office Address: </strong>Kilometre 20 Ughelli-Patani Road, before Ughelli Town.</p>\n<p>\n	<strong>E-mail: </strong>info@ughellipower.com<br />\n	<strong>Telephone: </strong>07031986595</p>\n";s:10:"field_id_6";s:0:"";s:10:"field_id_7";s:41:"https://www.facebook.com/ughelli.powerplc";s:10:"entry_date";i:1366347199;s:15:"expiration_date";s:0:"";s:11:"new_channel";s:1:"4";s:6:"status";s:4:"open";s:6:"author";s:1:"1";s:18:"versioning_enabled";s:1:"y";s:16:"pages__pages_uri";s:8:"/contact";s:24:"pages__pages_template_id";s:1:"5";s:6:"submit";s:6:"Submit";}'),
(36, 7, 4, 2, 1367321162, 'a:18:{s:8:"entry_id";s:1:"7";s:10:"channel_id";s:1:"4";s:17:"autosave_entry_id";s:1:"0";s:6:"filter";s:0:"";s:5:"title";s:7:"Contact";s:9:"url_title";s:7:"contact";s:10:"field_id_5";s:200:"<p>\n	<strong>Office Address: </strong>Kilometre 20 Ughelli-Patani Road, before Ughelli Town.</p>\n<p>\n	<strong>E-mail: </strong>info@ughellipower.com<br />\n	<strong>Telephone: </strong>07031986595</p>\n";s:10:"field_id_6";s:0:"";s:10:"field_id_7";s:0:"";s:10:"entry_date";i:1366347181;s:15:"expiration_date";s:0:"";s:11:"new_channel";s:1:"4";s:6:"status";s:4:"open";s:6:"author";s:1:"1";s:18:"versioning_enabled";s:1:"y";s:16:"pages__pages_uri";s:8:"/contact";s:24:"pages__pages_template_id";s:1:"5";s:6:"submit";s:6:"Submit";}'),
(37, 7, 4, 2, 1367321282, 'a:18:{s:8:"entry_id";s:1:"7";s:10:"channel_id";s:1:"4";s:17:"autosave_entry_id";s:1:"0";s:6:"filter";s:0:"";s:5:"title";s:7:"Contact";s:9:"url_title";s:7:"contact";s:10:"field_id_5";s:200:"<p>\n	<strong>Office Address: </strong>Kilometre 20 Ughelli-Patani Road, before Ughelli Town.</p>\n<p>\n	<strong>E-mail: </strong>info@ughellipower.com<br />\n	<strong>Telephone: </strong>07031986595</p>\n";s:10:"field_id_6";s:0:"";s:10:"field_id_7";s:128:"<div class="fb-like" data-href="https://www.facebook.com/ughelli.powerplc" data-send="true" data-width="450" data-show-faces="tr";s:10:"entry_date";i:1366347181;s:15:"expiration_date";s:0:"";s:11:"new_channel";s:1:"4";s:6:"status";s:4:"open";s:6:"author";s:1:"1";s:18:"versioning_enabled";s:1:"y";s:16:"pages__pages_uri";s:8:"/contact";s:24:"pages__pages_template_id";s:1:"5";s:6:"submit";s:6:"Submit";}'),
(38, 7, 4, 2, 1367321399, 'a:18:{s:8:"entry_id";s:1:"7";s:10:"channel_id";s:1:"4";s:17:"autosave_entry_id";s:1:"0";s:6:"filter";s:0:"";s:5:"title";s:7:"Contact";s:9:"url_title";s:7:"contact";s:10:"field_id_5";s:200:"<p>\n	<strong>Office Address: </strong>Kilometre 20 Ughelli-Patani Road, before Ughelli Town.</p>\n<p>\n	<strong>E-mail: </strong>info@ughellipower.com<br />\n	<strong>Telephone: </strong>07031986595</p>\n";s:10:"field_id_6";s:0:"";s:10:"field_id_7";s:128:"<div id="fb-root"></div> <script>(function(d, s, id) {   var js, fjs = d.getElementsByTagName(s)[0];   if (d.getElementById(id))";s:10:"entry_date";i:1366347238;s:15:"expiration_date";s:0:"";s:11:"new_channel";s:1:"4";s:6:"status";s:4:"open";s:6:"author";s:1:"1";s:18:"versioning_enabled";s:1:"y";s:16:"pages__pages_uri";s:8:"/contact";s:24:"pages__pages_template_id";s:1:"5";s:6:"submit";s:6:"Submit";}'),
(39, 7, 4, 2, 1367321437, 'a:18:{s:8:"entry_id";s:1:"7";s:10:"channel_id";s:1:"4";s:17:"autosave_entry_id";s:1:"0";s:6:"filter";s:0:"";s:5:"title";s:7:"Contact";s:9:"url_title";s:7:"contact";s:10:"field_id_5";s:200:"<p>\n	<strong>Office Address: </strong>Kilometre 20 Ughelli-Patani Road, before Ughelli Town.</p>\n<p>\n	<strong>E-mail: </strong>info@ughellipower.com<br />\n	<strong>Telephone: </strong>07031986595</p>\n";s:10:"field_id_6";s:0:"";s:10:"field_id_7";s:128:"<div id="fb-root"></div> <script>(function(d, s, id) {   var js, fjs = d.getElementsByTagName(s)[0];   if (d.getElementById(id))";s:10:"entry_date";i:1366347216;s:15:"expiration_date";s:0:"";s:11:"new_channel";s:1:"4";s:6:"status";s:4:"open";s:6:"author";s:1:"1";s:18:"versioning_enabled";s:1:"y";s:16:"pages__pages_uri";s:8:"/contact";s:24:"pages__pages_template_id";s:1:"5";s:6:"submit";s:6:"Submit";}'),
(40, 7, 4, 2, 1367321482, 'a:18:{s:8:"entry_id";s:1:"7";s:10:"channel_id";s:1:"4";s:17:"autosave_entry_id";s:1:"0";s:6:"filter";s:0:"";s:5:"title";s:7:"Contact";s:9:"url_title";s:7:"contact";s:10:"field_id_5";s:200:"<p>\n	<strong>Office Address: </strong>Kilometre 20 Ughelli-Patani Road, before Ughelli Town.</p>\n<p>\n	<strong>E-mail: </strong>info@ughellipower.com<br />\n	<strong>Telephone: </strong>07031986595</p>\n";s:10:"field_id_6";s:0:"";s:10:"field_id_7";s:0:"";s:10:"entry_date";i:1366347201;s:15:"expiration_date";s:0:"";s:11:"new_channel";s:1:"4";s:6:"status";s:4:"open";s:6:"author";s:1:"1";s:18:"versioning_enabled";s:1:"y";s:16:"pages__pages_uri";s:8:"/contact";s:24:"pages__pages_template_id";s:1:"5";s:6:"submit";s:6:"Submit";}'),
(41, 4, 3, 2, 1367854391, 'a:16:{s:8:"entry_id";s:1:"4";s:10:"channel_id";s:1:"3";s:17:"autosave_entry_id";s:1:"0";s:6:"filter";s:0:"";s:5:"title";s:5:"About";s:9:"url_title";s:5:"about";s:10:"field_id_4";s:4167:"<div class="grid_16" id="body">\n	<div class="grid_14 prefix_1 suffix_1" id="wrapper">\n		<h1 class="heading">\n			About Us</h1>\n		<div class="grid_6 alpha">\n			<img alt="Ughelli Gas Turbine" src="/assets/img/ughelli-gas-turbine.jpg" />\n			<p class="emphasis_light">\n				Gas Turbine Station located at Kilometre 20 Ughelli-Patani Road, before Ughelli Town</p>\n		</div>\n		<div class="grid_7">\n			<h2 class="subhead bigger clearfix">\n				Ughelli Power makes life easier for millions of Nigerians, with an installed capacity of 900MW of electricity, thereby contributing its quota in actualizing the goal that Nigerians enjoy cheap and constant power supply.</h2>\n			<div class="line">\n				&nbsp;</div>\n			<h2 class="subhead_dark">\n				Vision</h2>\n			<p>\n				To be the best in generation of reliable, stable and high quality eletricity within the Nigerian domain.</p>\n			<h2 class="subhead_dark">\n				Mission</h2>\n			<p>\n				To generate stable eletricity efficiently; at the most competitive cost through team work, while partnering with the community and the environment</p>\n		</div>\n		<div class="grid_14 line alpha">\n			&nbsp;</div>\n		<div class="grid_9">\n			<h2 class="subhead_dark">\n				Historical Perspective</h2>\n			<p>\n				Ughelli Power is among the 18 electricity successor companies unbundled from Power Holding Company of Nigeria (PHCN) in 2003. Owing to various changes in the Federal Government policies on the electricity industry from 1973 to 2009, Ughelli Power Plc has on various occasions changed its name and out-look.</p>\n			<p>\n				The station was built in 1964 with an installed capacity of 2X36MW or 72MW from two Stal-Laval gas turbines. Then the station was called Delta I under Electricity Corporation of Nigeria (ECN).</p>\n			<p>\n				In 1975 six units of &nbsp;General Electric (GE) Frame 5 gas turbines (20MW each) were installed in the station known as Delta II, after the merger of Niger Dam Authority (NDA), Kainji and the ECN to form the National Electric Power Authority (NEPA).</p>\n			<p>\n				In 1978 additional six units of GE &nbsp;Frame 5 gas turbines, like the ones installed in 1975, were added to Delta Power Station (Known as Delta III) to boost the installed capacity to a total of 312MW, as follows:</p>\n			<p>\n				Delta I, 2 X 36 &thinsp; &thinsp; &thinsp;72MW<br />\n				Delta II, 6 X 20&thinsp; &thinsp; &thinsp;120MW<br />\n				Delta III, 6 X 20&thinsp; &thinsp;&thinsp;120MW<br />\n				<strong>Total &thinsp; &thinsp;&thinsp;&thinsp; &thinsp; &thinsp; &thinsp; &thinsp; &thinsp; &thinsp; &thinsp; 312MW</strong></p>\n			<p>\n				The station was upgraded in 1991 with the addition of 6 X 100MW (600MW) GE Frame 9 gas turbines.</p>\n			<p>\n				From 2000 to 2008 Delta II and Delta III GE units were upgraded to 150MW station each: built by Hitachi of Japan. The control systems were upgraded to Mark V, a fully computerized control system for Delta II and III. While Delta I was scrapped.</p>\n			<p>\n				Delta IV control system was also upgraded to Mark V by GE of USA which built the station.</p>\n			<p>\n				<span style="font-size: 15px;">Today, the generation capacity of Ughelli Power stands at 900MW with the Delta II, III &amp; IV running at full capacity. Most of the electricity&nbsp;</span><span style="font-size: 15px;">producted by Ughelli is transported through a network of conductors, to the national grid.</span></p>\n		</div>\n		<div class="grid_4 omega" id="quick_facts">\n			<h1 class="subhead_dark bigger">\n				Quick Facts</h1>\n			<h3 class="line">\n				&nbsp;</h3>\n			<ul class="list border_bottom">\n				<li>\n					Over 49years of Service</li>\n				<li>\n					Ughelli Power, has four (4) power plants, Delta I, Delta II, Delta III &amp; Delta IV with the Delta I retired.</li>\n				<li>\n					Ughelli Power has an intalled capacity of 900MW.</li>\n				<li>\n					Custom fitted Engine starters in Delta II and Delta III turbines enables the station to black start the National Grid in case of emergency or cases of total or partial syayem collapses.</li>\n				<li>\n					Ughelli power provides auxillary facilities for staff, such as: Staff Housing, Medicare, School and Recreational Club.</li>\n			</ul>\n		</div>\n	</div>\n</div>\n";s:10:"entry_date";i:1366341730;s:15:"expiration_date";s:0:"";s:11:"new_channel";s:1:"3";s:6:"status";s:4:"open";s:6:"author";s:1:"1";s:18:"versioning_enabled";s:1:"y";s:16:"pages__pages_uri";s:6:"/about";s:24:"pages__pages_template_id";s:2:"10";s:6:"submit";s:6:"Submit";}'),
(42, 4, 3, 2, 1367854579, 'a:16:{s:8:"entry_id";s:1:"4";s:10:"channel_id";s:1:"3";s:17:"autosave_entry_id";s:1:"0";s:6:"filter";s:0:"";s:5:"title";s:5:"About";s:9:"url_title";s:5:"about";s:10:"field_id_4";s:4166:"<div class="grid_16" id="body">\n	<div class="grid_14 prefix_1 suffix_1" id="wrapper">\n		<h1 class="heading">\n			About Us</h1>\n		<div class="grid_6 alpha">\n			<img alt="Ughelli Gas Turbine" src="/assets/img/ughelli-gas-turbine.jpg" />\n			<p class="emphasis_light">\n				Gas Turbine Station located at Kilometre 20 Ughelli-Patani Road, before Ughelli Town</p>\n		</div>\n		<div class="grid_7">\n			<h2 class="subhead bigger clearfix">\n				Ughelli Power makes life easier for millions of Nigerians, with an installed capacity of 900MW of electricity, thereby contributing its quota in actualizing the goal that Nigerians enjoy cheap and constant power supply.</h2>\n			<div class="line">\n				&nbsp;</div>\n			<h2 class="subhead_dark">\n				Vision</h2>\n			<p>\n				To be the best in generation of reliable, stable and high quality eletricity within the Nigerian domain.</p>\n			<h2 class="subhead_dark">\n				Mission</h2>\n			<p>\n				To generate stable eletricity efficiently; at the most competitive cost through team work, while partnering with the community and the environment</p>\n		</div>\n		<div class="grid_14 line alpha">\n			&nbsp;</div>\n		<div class="grid_9">\n			<h2 class="subhead_dark">\n				Historical Perspective</h2>\n			<p>\n				Ughelli Power is among the 18 electricity successor companies unbundled from Power Holding Company of Nigeria (PHCN) in 2003. Owing to various changes in the Federal Government policies on the electricity industry from 1973 to 2009, Ughelli Power Plc has on various occasions changed its name and out-look.</p>\n			<p>\n				The station was built in 1964 with an installed capacity of 2X36MW or 72MW from two Stal-Laval gas turbines. Then the station was called Delta I under Electricity Corporation of Nigeria (ECN).</p>\n			<p>\n				In 1975 six units of &nbsp;General Electric (GE) Frame 5 gas turbines (20MW each) were installed in the station known as Delta II, after the merger of Niger Dam Authority (NDA), Kainji and the ECN to form the National Electric Power Authority (NEPA).</p>\n			<p>\n				In 1978 additional six units of GE &nbsp;Frame 5 gas turbines, like the ones installed in 1975, were added to Delta Power Station (Known as Delta III) to boost the installed capacity to a total of 312MW, as follows:</p>\n			<p>\n				Delta I, 2 X 36 &thinsp; &thinsp; &thinsp;72MW<br />\n				Delta II, 6 X 20&thinsp; &thinsp; &thinsp;120MW<br />\n				Delta III, 6 X 20&thinsp; &thinsp;&thinsp;120MW<br />\n				<strong>Total &thinsp; &thinsp;&thinsp;&thinsp; &thinsp; &thinsp; &thinsp; &thinsp; &thinsp; &thinsp; &thinsp; 312MW</strong></p>\n			<p>\n				The station was upgraded in 1991 with the addition of 6 X 100MW (600MW) GE Frame 9 gas turbines.</p>\n			<p>\n				From 2000 to 2008 Delta II and Delta III GE units were upgraded to 150MW station each: built by Hitachi of Japan. The control systems were upgraded to Mark V, a fully computerized control system for Delta II and III. While Delta I was scrapped.</p>\n			<p>\n				Delta IV control system was also upgraded to Mark V by GE of USA which built the station.</p>\n			<p>\n				<span style="font-size: 15px;">Today, the generation capacity of Ughelli Power stands at 900MW with the Delta II, III &amp; IV running at full capacity. Most of the electricity&nbsp;</span><span style="font-size: 15px;">produced by Ughelli is transported through a network of conductors, to the national grid.</span></p>\n		</div>\n		<div class="grid_4 omega" id="quick_facts">\n			<h1 class="subhead_dark bigger">\n				Quick Facts</h1>\n			<h3 class="line">\n				&nbsp;</h3>\n			<ul class="list border_bottom">\n				<li>\n					Over 49years of Service</li>\n				<li>\n					Ughelli Power, has four (4) power plants, Delta I, Delta II, Delta III &amp; Delta IV with the Delta I retired.</li>\n				<li>\n					Ughelli Power has an intalled capacity of 900MW.</li>\n				<li>\n					Custom fitted Engine starters in Delta II and Delta III turbines enables the station to black start the National Grid in case of emergency or cases of total or partial syayem collapses.</li>\n				<li>\n					Ughelli power provides auxillary facilities for staff, such as: Staff Housing, Medicare, School and Recreational Club.</li>\n			</ul>\n		</div>\n	</div>\n</div>\n";s:10:"entry_date";i:1366341738;s:15:"expiration_date";s:0:"";s:11:"new_channel";s:1:"3";s:6:"status";s:4:"open";s:6:"author";s:1:"1";s:18:"versioning_enabled";s:1:"y";s:16:"pages__pages_uri";s:6:"/about";s:24:"pages__pages_template_id";s:2:"10";s:13:"save_revision";s:13:"Save Revision";}'),
(43, 4, 3, 2, 1367854622, 'a:16:{s:8:"entry_id";s:1:"4";s:10:"channel_id";s:1:"3";s:17:"autosave_entry_id";s:1:"0";s:6:"filter";s:0:"";s:5:"title";s:5:"About";s:9:"url_title";s:5:"about";s:10:"field_id_4";s:4166:"<div class="grid_16" id="body">\n	<div class="grid_14 prefix_1 suffix_1" id="wrapper">\n		<h1 class="heading">\n			About Us</h1>\n		<div class="grid_6 alpha">\n			<img alt="Ughelli Gas Turbine" src="/assets/img/ughelli-gas-turbine.jpg" />\n			<p class="emphasis_light">\n				Gas Turbine Station located at Kilometre 20 Ughelli-Patani Road, before Ughelli Town</p>\n		</div>\n		<div class="grid_7">\n			<h2 class="subhead bigger clearfix">\n				Ughelli Power makes life easier for millions of Nigerians, with an installed capacity of 900MW of electricity, thereby contributing its quota in actualizing the goal that Nigerians enjoy cheap and constant power supply.</h2>\n			<div class="line">\n				&nbsp;</div>\n			<h2 class="subhead_dark">\n				Vision</h2>\n			<p>\n				To be the best in generation of reliable, stable and high quality eletricity within the Nigerian domain.</p>\n			<h2 class="subhead_dark">\n				Mission</h2>\n			<p>\n				To generate stable eletricity efficiently; at the most competitive cost through team work, while partnering with the community and the environment</p>\n		</div>\n		<div class="grid_14 line alpha">\n			&nbsp;</div>\n		<div class="grid_9">\n			<h2 class="subhead_dark">\n				Historical Perspective</h2>\n			<p>\n				Ughelli Power is among the 18 electricity successor companies unbundled from Power Holding Company of Nigeria (PHCN) in 2003. Owing to various changes in the Federal Government policies on the electricity industry from 1973 to 2009, Ughelli Power Plc has on various occasions changed its name and out-look.</p>\n			<p>\n				The station was built in 1964 with an installed capacity of 2X36MW or 72MW from two Stal-Laval gas turbines. Then the station was called Delta I under Electricity Corporation of Nigeria (ECN).</p>\n			<p>\n				In 1975 six units of &nbsp;General Electric (GE) Frame 5 gas turbines (20MW each) were installed in the station known as Delta II, after the merger of Niger Dam Authority (NDA), Kainji and the ECN to form the National Electric Power Authority (NEPA).</p>\n			<p>\n				In 1978 additional six units of GE &nbsp;Frame 5 gas turbines, like the ones installed in 1975, were added to Delta Power Station (Known as Delta III) to boost the installed capacity to a total of 312MW, as follows:</p>\n			<p>\n				Delta I, 2 X 36 &thinsp; &thinsp; &thinsp;72MW<br />\n				Delta II, 6 X 20&thinsp; &thinsp; &thinsp;120MW<br />\n				Delta III, 6 X 20&thinsp; &thinsp;&thinsp;120MW<br />\n				<strong>Total &thinsp; &thinsp;&thinsp;&thinsp; &thinsp; &thinsp; &thinsp; &thinsp; &thinsp; &thinsp; &thinsp; 312MW</strong></p>\n			<p>\n				The station was upgraded in 1991 with the addition of 6 X 100MW (600MW) GE Frame 9 gas turbines.</p>\n			<p>\n				From 2000 to 2008 Delta II and Delta III GE units were upgraded to 150MW station each: built by Hitachi of Japan. The control systems were upgraded to Mark V, a fully computerized control system for Delta II and III. While Delta I was scrapped.</p>\n			<p>\n				Delta IV control system was also upgraded to Mark V by GE of USA which built the station.</p>\n			<p>\n				<span style="font-size: 15px;">Today, the generation capacity of Ughelli Power stands at 900MW with the Delta II, III &amp; IV running at full capacity. Most of the electricity&nbsp;</span><span style="font-size: 15px;">produced by Ughelli is transported through a network of conductors, to the national grid.</span></p>\n		</div>\n		<div class="grid_4 omega" id="quick_facts">\n			<h1 class="subhead_dark bigger">\n				Quick Facts</h1>\n			<h3 class="line">\n				&nbsp;</h3>\n			<ul class="list border_bottom">\n				<li>\n					Over 49years of Service</li>\n				<li>\n					Ughelli Power, has four (4) power plants, Delta I, Delta II, Delta III &amp; Delta IV with the Delta I retired.</li>\n				<li>\n					Ughelli Power has an intalled capacity of 900MW.</li>\n				<li>\n					Custom fitted Engine starters in Delta II and Delta III turbines enables the station to black start the National Grid in case of emergency or cases of total or partial syayem collapses.</li>\n				<li>\n					Ughelli power provides auxillary facilities for staff, such as: Staff Housing, Medicare, School and Recreational Club.</li>\n			</ul>\n		</div>\n	</div>\n</div>\n";s:10:"entry_date";i:1366341721;s:15:"expiration_date";s:0:"";s:11:"new_channel";s:1:"3";s:6:"status";s:4:"open";s:6:"author";s:1:"1";s:18:"versioning_enabled";s:1:"y";s:16:"pages__pages_uri";s:6:"/about";s:24:"pages__pages_template_id";s:2:"10";s:6:"submit";s:6:"Submit";}'),
(44, 4, 3, 2, 1389195738, 'a:16:{s:8:"entry_id";s:1:"4";s:10:"channel_id";s:1:"3";s:17:"autosave_entry_id";s:1:"0";s:6:"filter";s:0:"";s:5:"title";s:5:"About";s:9:"url_title";s:5:"about";s:10:"field_id_4";s:4396:"<div class="grid_16" id="body">\n	<div class="grid_14 prefix_1 suffix_1" id="wrapper">\n		<h1 class="heading">\n			About Us</h1>\n		<div class="grid_6 alpha">\n			<img alt="Ughelli Gas Turbine" src="/assets/img/ughelli-gas-turbine.jpg" />\n			<p class="emphasis_light">\n				Gas Turbine Station located at Kilometre 20 Ughelli-Patani Road, before Ughelli Town</p>\n		</div>\n		<div class="grid_7">\n			<h2 class="subhead bigger clearfix">\n				Transcorp Ughelli Power makes life easier for millions of Nigerians, with an installed capacity of 900MW of electricity, thereby contributing its quota in actualizing the goal that Nigerians enjoy cheap and constant power supply.</h2>\n			<div class="line">\n				&nbsp;</div>\n			<h2 class="subhead_dark">\n				Vision</h2>\n			<p>\n				To be the best in generation of reliable, stable and high quality eletricity within the Nigerian domain.</p>\n			<h2 class="subhead_dark">\n				Mission</h2>\n			<p>\n				To generate stable eletricity efficiently; at the most competitive cost through team work, while partnering with the community and the environment</p>\n		</div>\n		<div class="grid_14 line alpha">\n			&nbsp;</div>\n		<div class="grid_9">\n			<h2 class="subhead_dark">\n				Historical Perspective</h2>\n			<p>\n				Ughelli Power now Transcorp Ughelli Power is among the 18 electricity successor companies unbundled from Power Holding Company of Nigeria (PHCN) in 2003. Owing to various changes in the Federal Government policies on the electricity industry from 1973 to 2009, Ughelli Power Plc has on various occasions changed its name and out-look.</p>\n			<p>\n				The station was built in 1964 with an installed capacity of 2X36MW or 72MW from two Stal-Laval gas turbines. Then the station was called Delta I under Electricity Corporation of Nigeria (ECN).</p>\n			<p>\n				In 1975 six units of &nbsp;General Electric (GE) Frame 5 gas turbines (20MW each) were installed in the station known as Delta II, after the merger of Niger Dam Authority (NDA), Kainji and the ECN to form the National Electric Power Authority (NEPA).</p>\n			<p>\n				In 1978 additional six units of GE &nbsp;Frame 5 gas turbines, like the ones installed in 1975, were added to Delta Power Station (Known as Delta III) to boost the installed capacity to a total of 312MW, as follows:</p>\n			<p>\n				Delta I, 2 X 36 &thinsp; &thinsp; &thinsp;72MW<br />\n				Delta II, 6 X 20&thinsp; &thinsp; &thinsp;120MW<br />\n				Delta III, 6 X 20&thinsp; &thinsp;&thinsp;120MW<br />\n				<strong>Total &thinsp; &thinsp;&thinsp;&thinsp; &thinsp; &thinsp; &thinsp; &thinsp; &thinsp; &thinsp; &thinsp; 312MW</strong></p>\n			<p>\n				The station was upgraded in 1991 with the addition of 6 X 100MW (600MW) GE Frame 9 gas turbines.</p>\n			<p>\n				From 2000 to 2008 Delta II and Delta III GE units were upgraded to 150MW station each: built by Hitachi of Japan. The control systems were upgraded to Mark V, a fully computerized control system for Delta II and III. While Delta I was scrapped.</p>\n			<p>\n				Delta IV control system was also upgraded to Mark V by GE of USA which built the station.</p>\n			<p>\n				<span style="font-size: 15px;">Today, the generation capacity of Ughelli Power stands at 900MW with the Delta II, III &amp; IV running at full capacity. Most of the electricity&nbsp;</span><span style="font-size: 15px;">produced by Ughelli is transported through a network of conductors, to the national grid.</span></p>\n		</div>\n		<div class="grid_4 omega" id="quick_facts">\n			<h1 class="subhead_dark bigger">\n				Quick Facts</h1>\n			<h3 class="line">\n				&nbsp;</h3>\n			<ul class="list border_bottom">\n				<li>\n					Over 49years of Service</li>\n				<li>\n					Transcorp Ughelli Power, has four (4) power plants, Delta I, Delta II, Delta III &amp; Delta IV with the Delta I retired.</li>\n				<li>\n					<span style="font-size: 15px; background-color: rgb(235, 237, 245);">Transcorp&nbsp;</span>Ughelli Power has an intalled capacity of 900MW.</li>\n				<li>\n					Custom fitted Engine starters in Delta II and Delta III turbines enables the station to black start the National Grid in case of emergency or cases of total or partial syayem collapses.</li>\n				<li>\n					<span style="font-size: 15px; background-color: rgb(235, 237, 245);">Transcorp&nbsp;</span>Ughelli power provides auxillary facilities for staff, such as: Staff Housing, Medicare, School and Recreational Club.</li>\n			</ul>\n		</div>\n	</div>\n</div>\n";s:10:"entry_date";i:1366341737;s:15:"expiration_date";s:0:"";s:11:"new_channel";s:1:"3";s:6:"status";s:4:"open";s:6:"author";s:1:"1";s:18:"versioning_enabled";s:1:"y";s:16:"pages__pages_uri";s:6:"/about";s:24:"pages__pages_template_id";s:2:"10";s:6:"submit";s:6:"Submit";}'),
(45, 7, 4, 2, 1389197411, 'a:18:{s:8:"entry_id";s:1:"7";s:10:"channel_id";s:1:"4";s:17:"autosave_entry_id";s:1:"0";s:6:"filter";s:0:"";s:5:"title";s:7:"Contact";s:9:"url_title";s:7:"contact";s:10:"field_id_5";s:157:"<p>\n	<strong>Office Address: </strong>Kilometre 20 Ughelli-Patani Road, before Ughelli Town.</p>\n<p>\n	<strong>E-mail: </strong>info@transcorpughelli.com</p>\n";s:10:"field_id_6";s:0:"";s:10:"field_id_7";s:0:"";s:10:"entry_date";i:1366347190;s:15:"expiration_date";s:0:"";s:11:"new_channel";s:1:"4";s:6:"status";s:4:"open";s:6:"author";s:1:"1";s:18:"versioning_enabled";s:1:"y";s:16:"pages__pages_uri";s:8:"/contact";s:24:"pages__pages_template_id";s:1:"5";s:6:"submit";s:6:"Submit";}'),
(46, 4, 3, 2, 1389197956, 'a:16:{s:8:"entry_id";s:1:"4";s:10:"channel_id";s:1:"3";s:17:"autosave_entry_id";s:1:"0";s:6:"filter";s:0:"";s:5:"title";s:5:"About";s:9:"url_title";s:5:"about";s:10:"field_id_4";s:4406:"<div class="grid_16" id="body">\n	<div class="grid_14 prefix_1 suffix_1" id="wrapper">\n		<h1 class="heading">\n			About Us</h1>\n		<div class="grid_6 alpha">\n			<img alt="Ughelli Gas Turbine" src="/assets/img/ughelli-gas-turbine.jpg" />\n			<p class="emphasis_light">\n				Gas Turbine Station located at Kilometre 20 Ughelli-Patani Road, before Ughelli Town</p>\n		</div>\n		<div class="grid_7">\n			<h2 class="subhead bigger clearfix">\n				Transcorp Ughelli Power makes life easier for millions of Nigerians, with an installed capacity of 900MW of electricity, thereby contributing its quota in actualizing the goal that Nigerians enjoy cheap and constant power supply.</h2>\n			<div class="line">\n				&nbsp;</div>\n			<h2 class="subhead_dark">\n				Vision</h2>\n			<p>\n				To be the best in generation of reliable, stable and high quality eletricity within the Nigerian domain.</p>\n			<h2 class="subhead_dark">\n				Mission</h2>\n			<p>\n				To generate stable eletricity efficiently; at the most competitive cost through team work, while partnering with the community and the environment</p>\n		</div>\n		<div class="grid_14 line alpha">\n			&nbsp;</div>\n		<div class="grid_9">\n			<h2 class="subhead_dark">\n				Historical Perspective</h2>\n			<p>\n				Ughelli Power now Transcorp Ughelli Power is among the 18 electricity successor companies unbundled from Power Holding Company of Nigeria (PHCN) in 2003. Owing to various changes in the Federal Government policies on the electricity industry from 1973 to 2009, Ughelli Power Plc has on various occasions changed its name and out-look.</p>\n			<p>\n				The station was built in 1964 with an installed capacity of 2X36MW or 72MW from two Stal-Laval gas turbines. Then the station was called Delta I under Electricity Corporation of Nigeria (ECN).</p>\n			<p>\n				In 1975 six units of &nbsp;General Electric (GE) Frame 5 gas turbines (20MW each) were installed in the station known as Delta II, after the merger of Niger Dam Authority (NDA), Kainji and the ECN to form the National Electric Power Authority (NEPA).</p>\n			<p>\n				In 1978 additional six units of GE &nbsp;Frame 5 gas turbines, like the ones installed in 1975, were added to Delta Power Station (Known as Delta III) to boost the installed capacity to a total of 312MW, as follows:</p>\n			<p>\n				Delta I, 2 X 36 &thinsp; &thinsp; &thinsp;72MW<br />\n				Delta II, 6 X 20&thinsp; &thinsp; &thinsp;120MW<br />\n				Delta III, 6 X 20&thinsp; &thinsp;&thinsp;120MW<br />\n				<strong>Total &thinsp; &thinsp;&thinsp;&thinsp; &thinsp; &thinsp; &thinsp; &thinsp; &thinsp; &thinsp; &thinsp; 312MW</strong></p>\n			<p>\n				The station was upgraded in 1991 with the addition of 6 X 100MW (600MW) GE Frame 9 gas turbines.</p>\n			<p>\n				From 2000 to 2008 Delta II and Delta III GE units were upgraded to 150MW station each: built by Hitachi of Japan. The control systems were upgraded to Mark V, a fully computerized control system for Delta II and III. While Delta I was scrapped.</p>\n			<p>\n				Delta IV control system was also upgraded to Mark V by GE of USA which built the station.</p>\n			<p>\n				<span style="font-size: 15px;">Today, the generation capacity of Transcorp Ughelli Power stands at 900MW with the Delta II, III &amp; IV running at full capacity. Most of the electricity&nbsp;</span><span style="font-size: 15px;">produced by Ughelli is transported through a network of conductors, to the national grid.</span></p>\n		</div>\n		<div class="grid_4 omega" id="quick_facts">\n			<h1 class="subhead_dark bigger">\n				Quick Facts</h1>\n			<h3 class="line">\n				&nbsp;</h3>\n			<ul class="list border_bottom">\n				<li>\n					Over 49years of Service</li>\n				<li>\n					Transcorp Ughelli Power, has four (4) power plants, Delta I, Delta II, Delta III &amp; Delta IV with the Delta I retired.</li>\n				<li>\n					<span style="font-size: 15px; background-color: rgb(235, 237, 245);">Transcorp&nbsp;</span>Ughelli Power has an intalled capacity of 900MW.</li>\n				<li>\n					Custom fitted Engine starters in Delta II and Delta III turbines enables the station to black start the National Grid in case of emergency or cases of total or partial syayem collapses.</li>\n				<li>\n					<span style="font-size: 15px; background-color: rgb(235, 237, 245);">Transcorp&nbsp;</span>Ughelli power provides auxillary facilities for staff, such as: Staff Housing, Medicare, School and Recreational Club.</li>\n			</ul>\n		</div>\n	</div>\n</div>\n";s:10:"entry_date";i:1366341735;s:15:"expiration_date";s:0:"";s:11:"new_channel";s:1:"3";s:6:"status";s:4:"open";s:6:"author";s:1:"1";s:18:"versioning_enabled";s:1:"y";s:16:"pages__pages_uri";s:6:"/about";s:24:"pages__pages_template_id";s:2:"10";s:6:"submit";s:6:"Submit";}'),
(47, 7, 4, 2, 1389791157, 'a:18:{s:8:"entry_id";s:1:"7";s:10:"channel_id";s:1:"4";s:17:"autosave_entry_id";s:1:"0";s:6:"filter";s:0:"";s:5:"title";s:7:"Contact";s:9:"url_title";s:7:"contact";s:10:"field_id_5";s:157:"<p>\n	<strong>Office Address: </strong>Kilometre 20 Ughelli-Patani Road, before Ughelli Town.</p>\n<p>\n	<strong>E-mail: </strong>info@transcorpughelli.com</p>\n";s:10:"field_id_6";s:0:"";s:10:"field_id_7";s:0:"";s:10:"entry_date";i:1366347236;s:15:"expiration_date";s:0:"";s:11:"new_channel";s:1:"4";s:6:"status";s:4:"open";s:6:"author";s:1:"1";s:18:"versioning_enabled";s:1:"y";s:16:"pages__pages_uri";s:8:"/contact";s:24:"pages__pages_template_id";s:2:"11";s:13:"save_revision";s:13:"Save Revision";}');

-- --------------------------------------------------------

--
-- Table structure for table `exp_extensions`
--

CREATE TABLE IF NOT EXISTS `exp_extensions` (
  `extension_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `class` varchar(50) NOT NULL DEFAULT '',
  `method` varchar(50) NOT NULL DEFAULT '',
  `hook` varchar(50) NOT NULL DEFAULT '',
  `settings` text NOT NULL,
  `priority` int(2) NOT NULL DEFAULT '10',
  `version` varchar(10) NOT NULL DEFAULT '',
  `enabled` char(1) NOT NULL DEFAULT 'y',
  PRIMARY KEY (`extension_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `exp_extensions`
--

INSERT INTO `exp_extensions` (`extension_id`, `class`, `method`, `hook`, `settings`, `priority`, `version`, `enabled`) VALUES
(1, 'Safecracker_ext', 'form_declaration_modify_data', 'form_declaration_modify_data', '', 10, '2.1', 'y'),
(2, 'Rte_ext', 'myaccount_nav_setup', 'myaccount_nav_setup', '', 10, '1.0', 'y'),
(3, 'Rte_ext', 'cp_menu_array', 'cp_menu_array', '', 10, '1.0', 'y'),
(4, 'Rte_ext', 'publish_form_entry_data', 'publish_form_entry_data', '', 10, '1.0', 'y'),
(5, 'Automin_ext', 'template_post_parse', 'template_post_parse', 'a:0:{}', 10, '2.1.3', 'y'),
(6, 'Cp_menu_master_ext', 'cp_menu_array', 'cp_menu_array', 'a:2:{s:15:"hidden_channels";a:2:{i:0;s:1:"4";i:1;s:1:"3";}s:11:"hidden_edit";a:2:{i:0;s:1:"4";i:1;s:1:"3";}}', 10, '2.2.0', 'y'),
(8, 'Matrix_ext', 'channel_entries_tagdata', 'channel_entries_tagdata', '', 10, '2.5.3', 'y');

-- --------------------------------------------------------

--
-- Table structure for table `exp_fieldtypes`
--

CREATE TABLE IF NOT EXISTS `exp_fieldtypes` (
  `fieldtype_id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `version` varchar(12) NOT NULL,
  `settings` text,
  `has_global_settings` char(1) DEFAULT 'n',
  PRIMARY KEY (`fieldtype_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- Dumping data for table `exp_fieldtypes`
--

INSERT INTO `exp_fieldtypes` (`fieldtype_id`, `name`, `version`, `settings`, `has_global_settings`) VALUES
(1, 'select', '1.0', 'YTowOnt9', 'n'),
(2, 'text', '1.0', 'YTowOnt9', 'n'),
(3, 'textarea', '1.0', 'YTowOnt9', 'n'),
(4, 'date', '1.0', 'YTowOnt9', 'n'),
(5, 'file', '1.0', 'YTowOnt9', 'n'),
(6, 'multi_select', '1.0', 'YTowOnt9', 'n'),
(7, 'checkboxes', '1.0', 'YTowOnt9', 'n'),
(8, 'radio', '1.0', 'YTowOnt9', 'n'),
(9, 'rel', '1.0', 'YTowOnt9', 'n'),
(10, 'rte', '1.0', 'YTowOnt9', 'n'),
(11, 'wygwam', '2.1.4', 'YTowOnt9', 'y'),
(12, 'expresso', '3.1.1', 'YToxOntzOjY6Imdsb2JhbCI7YTo3OntzOjE0OiJsaWNlbnNlX251bWJlciI7czozNjoiMGM0Yjg1NzgtYmQ1NS00ZWMzLThmN2ItZDZmOTVhY2NkNDJkIjtzOjE4OiJhdXRvR3Jvd19tYXhIZWlnaHQiO3M6MzoiNDAwIjtzOjEzOiJ0b29sYmFyX2ljb25zIjthOjEyOntpOjA7czoxMDoiTGlzdCBCbG9jayI7aToxO3M6NjoiSW5kZW50IjtpOjI7czoxMDoiQmxvY2txdW90ZSI7aTozO3M6MTM6Ikp1c3RpZnkgQmxvY2siO2k6NDtzOjEzOiJQYXN0ZUZyb21Xb3JkIjtpOjU7czo2OiJBbmNob3IiO2k6NjtzOjEwOiJNZWRpYUVtYmVkIjtpOjc7czo1OiJUYWJsZSI7aTo4O3M6NjoiSWZyYW1lIjtpOjk7czo4OiJNYXhpbWl6ZSI7aToxMDtzOjEwOiJTaG93QmxvY2tzIjtpOjExO3M6NjoiU291cmNlIjt9czo3OiJoZWFkZXJzIjthOjY6e2k6MDtzOjI6ImgxIjtpOjE7czoyOiJoMiI7aToyO3M6MjoiaDMiO2k6MztzOjI6Img0IjtpOjQ7czoyOiJoNSI7aTo1O3M6MjoiaDYiO31zOjExOiJjb250ZW50c0NzcyI7czoxMzYyNjoiLyoKICBGb3JjZXMgYmFja2dyb3VuZHMgdG8gc3BhbiBmdWxsIHdpZHRoLAogIGV2ZW4gaWYgdGhlcmUgaXMgaG9yaXpvbnRhbCBzY3JvbGxpbmcuCiAgSW5jcmVhc2UgdGhpcyBpZiB5b3VyIGxheW91dCBpcyB3aWRlci4KCiAgTm90ZTogSUU2IHdvcmtzIGZpbmUgd2l0aG91dCB0aGlzIGZpeC4KKi8KaHRtbCwKYm9keSwKZGl2LApzcGFuLAphcHBsZXQsCm9iamVjdCwKaWZyYW1lLApoMSwKaDIsCmgzLApoNCwKaDUsCmg2LApwLApibG9ja3F1b3RlLApwcmUsCmEsCmFiYnIsCmFjcm9ueW0sCmFkZHJlc3MsCmJpZywKY2l0ZSwKY29kZSwKZGVsLApkZm4sCmVtLApmb250LAppbWcsCmlucywKa2JkLApxLApzLApzYW1wLApzbWFsbCwKc3RyaWtlLApzdHJvbmcsCnN1YiwKc3VwLAp0dCwKdmFyLApiLAp1LAppLApjZW50ZXIsCmRsLApkdCwKZGQsCm9sLAp1bCwKbGksCmZpZWxkc2V0LApmb3JtLApsYWJlbCwKbGVnZW5kLAp0YWJsZSwKY2FwdGlvbiwKdGJvZHksCnRmb290LAp0aGVhZCwKdHIsCnRoLAp0ZCB7CiAgbWFyZ2luOiAwOwogIHBhZGRpbmc6IDA7CiAgYm9yZGVyOiAwOwogIG91dGxpbmU6IDA7CiAgZm9udC1zaXplOiAxMDAlOwogIHZlcnRpY2FsLWFsaWduOiBiYXNlbGluZTsKICBiYWNrZ3JvdW5kOiB0cmFuc3BhcmVudDsKfQpib2R5IHsKICBsaW5lLWhlaWdodDogMTsKfQpvbCwKdWwgewogIGxpc3Qtc3R5bGU6IG5vbmU7Cn0KYmxvY2txdW90ZSwKcSB7CiAgcXVvdGVzOiBub25lOwp9CmJsb2NrcXVvdGU6YmVmb3JlLApibG9ja3F1b3RlOmFmdGVyLApxOmJlZm9yZSwKcTphZnRlciB7CiAgY29udGVudDogJyc7CiAgY29udGVudDogbm9uZTsKfQo6Zm9jdXMgewogIG91dGxpbmU6IDA7Cn0KaW5zIHsKICB0ZXh0LWRlY29yYXRpb246IG5vbmU7Cn0KZGVsIHsKICB0ZXh0LWRlY29yYXRpb246IGxpbmUtdGhyb3VnaDsKfQp0YWJsZSB7CiAgYm9yZGVyLWNvbGxhcHNlOiBjb2xsYXBzZTsKICBib3JkZXItc3BhY2luZzogMDsKfQovKgogIDk2MCBHcmlkIFN5c3RlbSB+IENvcmUgQ1NTLgogIExlYXJuIG1vcmUgfiBodHRwOi8vOTYwLmdzLwoKICBMaWNlbnNlZCB1bmRlciBHUEwgYW5kIE1JVC4KKi8KLyoKICBGb3JjZXMgYmFja2dyb3VuZHMgdG8gc3BhbiBmdWxsIHdpZHRoLAogIGV2ZW4gaWYgdGhlcmUgaXMgaG9yaXpvbnRhbCBzY3JvbGxpbmcuCiAgSW5jcmVhc2UgdGhpcyBpZiB5b3VyIGxheW91dCBpcyB3aWRlci4KCiAgTm90ZTogSUU2IHdvcmtzIGZpbmUgd2l0aG91dCB0aGlzIGZpeC4KKi8KYm9keSB7CiAgbWluLXdpZHRoOiA5NjBweDsKfQovKiBDb250YWluZXIKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLSovCi5jb250YWluZXJfMTYgewogIG1hcmdpbi1sZWZ0OiBhdXRvOwogIG1hcmdpbi1yaWdodDogYXV0bzsKICB3aWR0aDogOTYwcHg7Cn0KLyogR3JpZCA+PiBHbG9iYWwKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLSovCi5ncmlkXzEsCi5ncmlkXzIsCi5ncmlkXzMsCi5ncmlkXzQsCi5ncmlkXzUsCi5ncmlkXzYsCi5ncmlkXzcsCi5ncmlkXzgsCi5ncmlkXzksCi5ncmlkXzEwLAouZ3JpZF8xMSwKLmdyaWRfMTIsCi5ncmlkXzEzLAouZ3JpZF8xNCwKLmdyaWRfMTUsCi5ncmlkXzE2IHsKICBkaXNwbGF5OiBpbmxpbmU7CiAgZmxvYXQ6IGxlZnQ7CiAgbWFyZ2luLWxlZnQ6IDEwcHg7CiAgbWFyZ2luLXJpZ2h0OiAxMHB4Owp9Ci5wdXNoXzEsCi5wdWxsXzEsCi5wdXNoXzIsCi5wdWxsXzIsCi5wdXNoXzMsCi5wdWxsXzMsCi5wdXNoXzQsCi5wdWxsXzQsCi5wdXNoXzUsCi5wdWxsXzUsCi5wdXNoXzYsCi5wdWxsXzYsCi5wdXNoXzcsCi5wdWxsXzcsCi5wdXNoXzgsCi5wdWxsXzgsCi5wdXNoXzksCi5wdWxsXzksCi5wdXNoXzEwLAoucHVsbF8xMCwKLnB1c2hfMTEsCi5wdWxsXzExLAoucHVzaF8xMiwKLnB1bGxfMTIsCi5wdXNoXzEzLAoucHVsbF8xMywKLnB1c2hfMTQsCi5wdWxsXzE0LAoucHVzaF8xNSwKLnB1bGxfMTUsCi5wdXNoXzE2LAoucHVsbF8xNiB7CiAgcG9zaXRpb246IHJlbGF0aXZlOwp9Ci8qIEdyaWQgPj4gQ2hpbGRyZW4gKEFscGhhIH4gRmlyc3QsIE9tZWdhIH4gTGFzdCkKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLSovCi5hbHBoYSB7CiAgbWFyZ2luLWxlZnQ6IDA7Cn0KLm9tZWdhIHsKICBtYXJnaW4tcmlnaHQ6IDA7Cn0KLyogR3JpZCA+PiAxNiBDb2x1bW5zCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0qLwouY29udGFpbmVyXzE2IC5ncmlkXzEgewogIHdpZHRoOiA0MHB4Owp9Ci5jb250YWluZXJfMTYgLmdyaWRfMiB7CiAgd2lkdGg6IDEwMHB4Owp9Ci5jb250YWluZXJfMTYgLmdyaWRfMyB7CiAgd2lkdGg6IDE2MHB4Owp9Ci5jb250YWluZXJfMTYgLmdyaWRfNCB7CiAgd2lkdGg6IDIyMHB4Owp9Ci5jb250YWluZXJfMTYgLmdyaWRfNSB7CiAgd2lkdGg6IDI4MHB4Owp9Ci5jb250YWluZXJfMTYgLmdyaWRfNiB7CiAgd2lkdGg6IDM0MHB4Owp9Ci5jb250YWluZXJfMTYgLmdyaWRfNyB7CiAgd2lkdGg6IDQwMHB4Owp9Ci5jb250YWluZXJfMTYgLmdyaWRfOCB7CiAgd2lkdGg6IDQ2MHB4Owp9Ci5jb250YWluZXJfMTYgLmdyaWRfOSB7CiAgd2lkdGg6IDUyMHB4Owp9Ci5jb250YWluZXJfMTYgLmdyaWRfMTAgewogIHdpZHRoOiA1ODBweDsKfQouY29udGFpbmVyXzE2IC5ncmlkXzExIHsKICB3aWR0aDogNjQwcHg7Cn0KLmNvbnRhaW5lcl8xNiAuZ3JpZF8xMiB7CiAgd2lkdGg6IDcwMHB4Owp9Ci5jb250YWluZXJfMTYgLmdyaWRfMTMgewogIHdpZHRoOiA3NjBweDsKfQouY29udGFpbmVyXzE2IC5ncmlkXzE0IHsKICB3aWR0aDogODIwcHg7Cn0KLmNvbnRhaW5lcl8xNiAuZ3JpZF8xNSB7CiAgd2lkdGg6IDg4MHB4Owp9Ci5jb250YWluZXJfMTYgLmdyaWRfMTYgewogIHdpZHRoOiA5NDBweDsKfQovKiBQcmVmaXggRXh0cmEgU3BhY2UgPj4gMTYgQ29sdW1ucwotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tKi8KLmNvbnRhaW5lcl8xNiAucHJlZml4XzEgewogIHBhZGRpbmctbGVmdDogNjBweDsKfQouY29udGFpbmVyXzE2IC5wcmVmaXhfMiB7CiAgcGFkZGluZy1sZWZ0OiAxMjBweDsKfQouY29udGFpbmVyXzE2IC5wcmVmaXhfMyB7CiAgcGFkZGluZy1sZWZ0OiAxODBweDsKfQouY29udGFpbmVyXzE2IC5wcmVmaXhfNCB7CiAgcGFkZGluZy1sZWZ0OiAyNDBweDsKfQouY29udGFpbmVyXzE2IC5wcmVmaXhfNSB7CiAgcGFkZGluZy1sZWZ0OiAzMDBweDsKfQouY29udGFpbmVyXzE2IC5wcmVmaXhfNiB7CiAgcGFkZGluZy1sZWZ0OiAzNjBweDsKfQouY29udGFpbmVyXzE2IC5wcmVmaXhfNyB7CiAgcGFkZGluZy1sZWZ0OiA0MjBweDsKfQouY29udGFpbmVyXzE2IC5wcmVmaXhfOCB7CiAgcGFkZGluZy1sZWZ0OiA0ODBweDsKfQouY29udGFpbmVyXzE2IC5wcmVmaXhfOSB7CiAgcGFkZGluZy1sZWZ0OiA1NDBweDsKfQouY29udGFpbmVyXzE2IC5wcmVmaXhfMTAgewogIHBhZGRpbmctbGVmdDogNjAwcHg7Cn0KLmNvbnRhaW5lcl8xNiAucHJlZml4XzExIHsKICBwYWRkaW5nLWxlZnQ6IDY2MHB4Owp9Ci5jb250YWluZXJfMTYgLnByZWZpeF8xMiB7CiAgcGFkZGluZy1sZWZ0OiA3MjBweDsKfQouY29udGFpbmVyXzE2IC5wcmVmaXhfMTMgewogIHBhZGRpbmctbGVmdDogNzgwcHg7Cn0KLmNvbnRhaW5lcl8xNiAucHJlZml4XzE0IHsKICBwYWRkaW5nLWxlZnQ6IDg0MHB4Owp9Ci5jb250YWluZXJfMTYgLnByZWZpeF8xNSB7CiAgcGFkZGluZy1sZWZ0OiA5MDBweDsKfQovKiBTdWZmaXggRXh0cmEgU3BhY2UgPj4gMTYgQ29sdW1ucwotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tKi8KLmNvbnRhaW5lcl8xNiAuc3VmZml4XzEgewogIHBhZGRpbmctcmlnaHQ6IDYwcHg7Cn0KLmNvbnRhaW5lcl8xNiAuc3VmZml4XzIgewogIHBhZGRpbmctcmlnaHQ6IDEyMHB4Owp9Ci5jb250YWluZXJfMTYgLnN1ZmZpeF8zIHsKICBwYWRkaW5nLXJpZ2h0OiAxODBweDsKfQouY29udGFpbmVyXzE2IC5zdWZmaXhfNCB7CiAgcGFkZGluZy1yaWdodDogMjQwcHg7Cn0KLmNvbnRhaW5lcl8xNiAuc3VmZml4XzUgewogIHBhZGRpbmctcmlnaHQ6IDMwMHB4Owp9Ci5jb250YWluZXJfMTYgLnN1ZmZpeF82IHsKICBwYWRkaW5nLXJpZ2h0OiAzNjBweDsKfQouY29udGFpbmVyXzE2IC5zdWZmaXhfNyB7CiAgcGFkZGluZy1yaWdodDogNDIwcHg7Cn0KLmNvbnRhaW5lcl8xNiAuc3VmZml4XzggewogIHBhZGRpbmctcmlnaHQ6IDQ4MHB4Owp9Ci5jb250YWluZXJfMTYgLnN1ZmZpeF85IHsKICBwYWRkaW5nLXJpZ2h0OiA1NDBweDsKfQouY29udGFpbmVyXzE2IC5zdWZmaXhfMTAgewogIHBhZGRpbmctcmlnaHQ6IDYwMHB4Owp9Ci5jb250YWluZXJfMTYgLnN1ZmZpeF8xMSB7CiAgcGFkZGluZy1yaWdodDogNjYwcHg7Cn0KLmNvbnRhaW5lcl8xNiAuc3VmZml4XzEyIHsKICBwYWRkaW5nLXJpZ2h0OiA3MjBweDsKfQouY29udGFpbmVyXzE2IC5zdWZmaXhfMTMgewogIHBhZGRpbmctcmlnaHQ6IDc4MHB4Owp9Ci5jb250YWluZXJfMTYgLnN1ZmZpeF8xNCB7CiAgcGFkZGluZy1yaWdodDogODQwcHg7Cn0KLmNvbnRhaW5lcl8xNiAuc3VmZml4XzE1IHsKICBwYWRkaW5nLXJpZ2h0OiA5MDBweDsKfQovKiBQdXNoIFNwYWNlID4+IDE2IENvbHVtbnMKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLSovCi5jb250YWluZXJfMTYgLnB1c2hfMSB7CiAgbGVmdDogNjBweDsKfQouY29udGFpbmVyXzE2IC5wdXNoXzIgewogIGxlZnQ6IDEyMHB4Owp9Ci5jb250YWluZXJfMTYgLnB1c2hfMyB7CiAgbGVmdDogMTgwcHg7Cn0KLmNvbnRhaW5lcl8xNiAucHVzaF80IHsKICBsZWZ0OiAyNDBweDsKfQouY29udGFpbmVyXzE2IC5wdXNoXzUgewogIGxlZnQ6IDMwMHB4Owp9Ci5jb250YWluZXJfMTYgLnB1c2hfNiB7CiAgbGVmdDogMzYwcHg7Cn0KLmNvbnRhaW5lcl8xNiAucHVzaF83IHsKICBsZWZ0OiA0MjBweDsKfQouY29udGFpbmVyXzE2IC5wdXNoXzggewogIGxlZnQ6IDQ4MHB4Owp9Ci5jb250YWluZXJfMTYgLnB1c2hfOSB7CiAgbGVmdDogNTQwcHg7Cn0KLmNvbnRhaW5lcl8xNiAucHVzaF8xMCB7CiAgbGVmdDogNjAwcHg7Cn0KLmNvbnRhaW5lcl8xNiAucHVzaF8xMSB7CiAgbGVmdDogNjYwcHg7Cn0KLmNvbnRhaW5lcl8xNiAucHVzaF8xMiB7CiAgbGVmdDogNzIwcHg7Cn0KLmNvbnRhaW5lcl8xNiAucHVzaF8xMyB7CiAgbGVmdDogNzgwcHg7Cn0KLmNvbnRhaW5lcl8xNiAucHVzaF8xNCB7CiAgbGVmdDogODQwcHg7Cn0KLmNvbnRhaW5lcl8xNiAucHVzaF8xNSB7CiAgbGVmdDogOTAwcHg7Cn0KLyogUHVsbCBTcGFjZSA+PiAxNiBDb2x1bW5zCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0qLwouY29udGFpbmVyXzE2IC5wdWxsXzEgewogIGxlZnQ6IC02MHB4Owp9Ci5jb250YWluZXJfMTYgLnB1bGxfMiB7CiAgbGVmdDogLTEyMHB4Owp9Ci5jb250YWluZXJfMTYgLnB1bGxfMyB7CiAgbGVmdDogLTE4MHB4Owp9Ci5jb250YWluZXJfMTYgLnB1bGxfNCB7CiAgbGVmdDogLTI0MHB4Owp9Ci5jb250YWluZXJfMTYgLnB1bGxfNSB7CiAgbGVmdDogLTMwMHB4Owp9Ci5jb250YWluZXJfMTYgLnB1bGxfNiB7CiAgbGVmdDogLTM2MHB4Owp9Ci5jb250YWluZXJfMTYgLnB1bGxfNyB7CiAgbGVmdDogLTQyMHB4Owp9Ci5jb250YWluZXJfMTYgLnB1bGxfOCB7CiAgbGVmdDogLTQ4MHB4Owp9Ci5jb250YWluZXJfMTYgLnB1bGxfOSB7CiAgbGVmdDogLTU0MHB4Owp9Ci5jb250YWluZXJfMTYgLnB1bGxfMTAgewogIGxlZnQ6IC02MDBweDsKfQouY29udGFpbmVyXzE2IC5wdWxsXzExIHsKICBsZWZ0OiAtNjYwcHg7Cn0KLmNvbnRhaW5lcl8xNiAucHVsbF8xMiB7CiAgbGVmdDogLTcyMHB4Owp9Ci5jb250YWluZXJfMTYgLnB1bGxfMTMgewogIGxlZnQ6IC03ODBweDsKfQouY29udGFpbmVyXzE2IC5wdWxsXzE0IHsKICBsZWZ0OiAtODQwcHg7Cn0KLmNvbnRhaW5lcl8xNiAucHVsbF8xNSB7CiAgbGVmdDogLTkwMHB4Owp9Ci8qIGBDbGVhciBGbG9hdGVkIEVsZW1lbnRzCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0qLwovKiBodHRwOi8vc29uc3ByaW5nLmNvbS9qb3VybmFsL2NsZWFyaW5nLWZsb2F0cyAqLwouY2xlYXIgewogIGNsZWFyOiBib3RoOwogIGRpc3BsYXk6IGJsb2NrOwogIG92ZXJmbG93OiBoaWRkZW47CiAgdmlzaWJpbGl0eTogaGlkZGVuOwogIHdpZHRoOiAwOwogIGhlaWdodDogMDsKfQovKiBodHRwOi8vd3d3Lnl1aWJsb2cuY29tL2Jsb2cvMjAxMC8wOS8yNy9jbGVhcmZpeC1yZWxvYWRlZC1vdmVyZmxvd2hpZGRlbi1kZW15c3RpZmllZCAqLwouY2xlYXJmaXg6YmVmb3JlLAouY2xlYXJmaXg6YWZ0ZXIsCi5jb250YWluZXJfMTY6YmVmb3JlLAouY29udGFpbmVyXzE2OmFmdGVyIHsKICBjb250ZW50OiAnLic7CiAgZGlzcGxheTogYmxvY2s7CiAgb3ZlcmZsb3c6IGhpZGRlbjsKICB2aXNpYmlsaXR5OiBoaWRkZW47CiAgZm9udC1zaXplOiAwOwogIGxpbmUtaGVpZ2h0OiAwOwogIHdpZHRoOiAwOwogIGhlaWdodDogMDsKfQouY2xlYXJmaXg6YWZ0ZXIsCi5jb250YWluZXJfMTY6YWZ0ZXIgewogIGNsZWFyOiBib3RoOwp9Ci8qCiAgVGhlIGZvbGxvd2luZyB6b29tOjEgcnVsZSBpcyBzcGVjaWZpY2FsbHkgZm9yIElFNiArIElFNy4KICBNb3ZlIHRvIHNlcGFyYXRlIHN0eWxlc2hlZXQgaWYgaW52YWxpZCBDU1MgaXMgYSBwcm9ibGVtLgoqLwouY2xlYXJmaXgsCi5jb250YWluZXJfMTYgewogIHpvb206IDE7Cn0KLyoKICBFbmQgb2YgOTYwIGZyYW1ld29yay4gTWFpbiBzdHlsZSBiZWdpbnMgaGVyZS4KKi8KaHRtbCB7CiAgZm9udC1zaXplOiAxNnB4Owp9CmJvZHkgewogIGJhY2tncm91bmQ6ICNmZmY7CiAgY29sb3I6ICM4MzgzODM7CiAgZm9udC1zaXplOiA2Mi41JTsKfQojaGVhZGVyIHsKICBtYXJnaW4tdG9wOiAzNXB4Owp9CiNoZWFkZXIgI3BoY25fbG9nbyB7CiAgd2lkdGg6IDM4N3B4OwogIGhlaWdodDogNDdweDsKICB0ZXh0LWluZGVudDogLTk5OTk5cHg7CiAgYmFja2dyb3VuZDogdXJsKCIuLi9pbWcvcGhjbi1sb2dvLnBuZyIpOwp9CiNoZWFkZXIgI3BoY25fbG9nbyBhIHsKICBkaXNwbGF5OiBibG9jazsKICB3aWR0aDogMzg3cHg7CiAgaGVpZ2h0OiA0N3B4Owp9CiNoZWFkZXIgI25hdiB7CiAgZmxvYXQ6IHJpZ2h0OwogIG1hcmdpbi10b3A6IDE4cHg7CiAgZm9udC1zaXplOiAxLjVlbTsKfQojaGVhZGVyICNuYXYgbGkgewogIGZsb2F0OiBsZWZ0OwogIGZvbnQtZmFtaWx5OiBIZWx2ZXRpY2EsIEFyaWFsLCBzYW5zLXNlcmlmOwogIGZvbnQtc2l6ZTogMC45ZW07CiAgY29sb3I6ICM0MjZlOTk7CiAgZm9udC13ZWlnaHQ6IGJvbGQ7CiAgcGFkZGluZy1sZWZ0OiAxMHB4Owp9CiNoZWFkZXIgI25hdiBsaSBhIHsKICB0ZXh0LWRlY29yYXRpb246IG5vbmU7CiAgY29sb3I6ICM0MjZlOTk7CiAgcGFkZGluZy1ib3R0b206IDVweDsKfQojaGVhZGVyICNuYXYgbGkgYTpob3ZlciB7CiAgYm9yZGVyLWJvdHRvbTogMnB4IHNvbGlkICM4MzgzODM7Cn0KI3NsaWRlIHsKICBvdmVyZmxvdzogaGlkZGVuOwogIGhlaWdodDogNDI1cHg7CiAgbWFyZ2luLXRvcDogMzBweDsKfQojc2xpZGUgaDEgewogIHdpZHRoOiAwcHg7CiAgaGVpZ2h0OiAwcHg7CiAgdGV4dC1pbmRlbnQ6IC05OTk5cHg7Cn0KI25ld3NfY29udGFpbmVyIHsKICBwYWRkaW5nOiAyNXB4IDBweDsKICBmb250LWZhbWlseTogSGVsdmV0aWNhLCBBcmlhbCwgc2Fucy1zZXJpZjsKICBmb250LXNpemU6IDEuNmVtOwp9CiNuZXdzX2NvbnRhaW5lciBoMi5ob21lX3N1YmhlYWQgewogIGZsb2F0OiBsZWZ0OwogIHBhZGRpbmctcmlnaHQ6IDMwcHg7CiAgYmFja2dyb3VuZDogdXJsKC4uL2ltZy9hcnJvdy5qcGcpIG5vLXJlcGVhdCByaWdodDsKICBtYXJnaW4tcmlnaHQ6IDIwcHg7Cn0KI25ld3NfY29udGFpbmVyICNuZXdzIHsKICBmbG9hdDogbGVmdDsKICBmb250LXNpemU6IDAuOWVtOwogIGxpbmUtaGVpZ2h0OiAxNDAlOwp9CiNuZXdzX2NvbnRhaW5lciAjbmV3cyBhIHsKICB0ZXh0LWRlY29yYXRpb246IG5vbmU7CiAgY29sb3I6ICM4MzgzODM7CiAgLXdlYmtpdC10cmFuc2l0aW9uOiBhbGwgMC4yNXMgZWFzZS1pbi1vdXQ7CiAgLW1vei10cmFuc2l0aW9uOiBhbGwgMC4yNXMgZWFzZS1pbi1vdXQ7CiAgLW1zLXRyYW5zaXRpb246IGFsbCAwLjI1cyBlYXNlLWluLW91dDsKICAtby10cmFuc2l0aW9uOiBhbGwgMC4yNXMgZWFzZS1pbi1vdXQ7CiAgdHJhbnNpdGlvbjogYWxsIDAuMjVzIGVhc2UtaW4tb3V0Owp9CiNuZXdzX2NvbnRhaW5lciAjbmV3cyBhOmhvdmVyIHsKICBjb2xvcjogIzhhOWJlMTsKICAtd2Via2l0LXRyYW5zZm9ybTogdHJhbnNsYXRlKDMwcHgsIDBweCk7CiAgLW1vei10cmFuc2Zvcm06IHRyYW5zbGF0ZSgzMHB4LCAwcHgpOwogIC1vLXRyYW5zZm9ybTogdHJhbnNsYXRlKDMwcHgsIDBweCk7CiAgLW1zLXRyYW5zZm9ybTogdHJhbnNsYXRlKDMwcHgsIDBweCk7CiAgdHJhbnNmb3JtOiB0cmFuc2xhdGUoMzBweCwgMHB4KTsKICAtd2Via2l0LXRyYW5zaXRpb246IGFsbCAwLjI1cyBlYXNlLWluLW91dDsKICAtbW96LXRyYW5zaXRpb246IGFsbCAwLjI1cyBlYXNlLWluLW91dDsKICAtbXMtdHJhbnNpdGlvbjogYWxsIDAuMjVzIGVhc2UtaW4tb3V0OwogIC1vLXRyYW5zaXRpb246IGFsbCAwLjI1cyBlYXNlLWluLW91dDsKICB0cmFuc2l0aW9uOiBhbGwgMC4yNXMgZWFzZS1pbi1vdXQ7Cn0KLnN1YmhlYWQgewogIGZvbnQtc2l6ZTogMS4yZW07Cn0KLnN1YmhlYWQuYmlnZ2VyIHsKICBmb250LXNpemU6IDEuNWVtOwogIGNvbG9yOiAjNDI2ZTk5OwogIGxpbmUtaGVpZ2h0OiAxMjAlOwp9Ci5zdWJoZWFkX2RhcmsgewogIGZvbnQtc2l6ZTogMS4yZW07CiAgY29sb3I6ICM0MjZlOTk7CiAgbWFyZ2luOiAyMHB4IDBweDsKfQouc3ViaGVhZF9kYXJrLmJpZ2dlciB7CiAgZm9udC1zaXplOiAxLjVlbTsKICBjb2xvcjogIzQyNmU5OTsKICBsaW5lLWhlaWdodDogMTIwJTsKfQoubGlnaHRfYmx1ZSB7CiAgY29sb3I6ICM4YTliZTE7Cn0KI2JvZHkgewogIGJhY2tncm91bmQ6ICNmZmZmZmYgdXJsKC4uL2ltZy9iZy5qcGcpIG5vLXJlcGVhdDsKICBmb250LWZhbWlseTogSGVsdmV0aWNhLCBBcmlhbCwgc2Fucy1zZXJpZjsKICBtYXJnaW4tdG9wOiAzMHB4OwogIGZvbnQtc2l6ZTogMS41ZW07CiAgcG9zaXRpb246IHJlbGF0aXZlOwp9CiNib2R5IHAgewogIG1hcmdpbjogMTBweCAwcHggMjBweDsKICBsaW5lLWhlaWdodDogMTUwJTsKfQojYm9keS5hbHRlcm5hdGVfYmcgewogIGJhY2tncm91bmQ6ICNmZmZmZmYgdXJsKC4uL2ltZy9hbHRlcm5hdGVfYmcuanBnKSBuby1yZXBlYXQ7Cn0KI2JvZHkgI3dyYXBwZXIgewogIHBhZGRpbmctdG9wOiA4MHB4OwogIGNvbG9yOiAjM2YzZjNmOwp9CiNib2R5IC5oZWFkaW5nIHsKICBmb250LXNpemU6IDMuNWVtOwogIGNvbG9yOiAjZmZmZmZmOwogIG1hcmdpbi1ib3R0b206IDkwcHg7CiAgZm9udC13ZWlnaHQ6IDMwMDsKfQojYm9keSAuY29udGFjdF9zdW1tYXJ5IHsKICBtYXJnaW4tdG9wOiA2MHB4OwogIGxpbmUtaGVpZ2h0OiAxNTAlOwp9CiNib2R5IC5saW5lIHsKICBib3JkZXItYm90dG9tOiAxcHggc29saWQgI2UxZTFlMTsKICBtYXJnaW4tYm90dG9tOiAyMHB4Owp9CiNib2R5IC5zb2NpYWxfbWVkaWEgewogIHBhZGRpbmctcmlnaHQ6IDIwcHg7Cn0KI2JvZHkgLmxpc3QgewogIG1hcmdpbi1sZWZ0OiAxOHB4OwogIG1hcmdpbi10b3A6IDIwcHg7Cn0KI2JvZHkgLmxpc3Qubm8tbWFyZ2luLXRvcCB7CiAgbWFyZ2luLXRvcDogMHB4Owp9CiNib2R5IC5saXN0IGxpIHsKICBsaW5lLWhlaWdodDogMTUwJTsKICBtYXJnaW4tYm90dG9tOiAxMHB4OwogIGxpc3Qtc3R5bGUtdHlwZTogc3F1YXJlOwp9CiNjb250YWN0X2Zvcm0gewogIGZvbnQtd2VpZ2h0OiBib2xkOwogIG1hcmdpbi10b3A6IDIwcHg7Cn0KI2NvbnRhY3RfZm9ybSBsaSB7CiAgbWFyZ2luLWJvdHRvbTogNXB4Owp9CiNjb250YWN0X2Zvcm0gaW5wdXQsCiNjb250YWN0X2Zvcm0gdGV4dGFyZWEgewogIHBhZGRpbmc6IDEwcHg7CiAgYmFja2dyb3VuZDogI2YwZjBmMDsKICBib3JkZXI6IG5vbmU7CiAgY29sb3I6ICM4MzgzODM7CiAgd2lkdGg6IDMwMHB4Owp9CiNjb250YWN0X2Zvcm0gaW5wdXQuc3VibWl0LAojY29udGFjdF9mb3JtIHRleHRhcmVhLnN1Ym1pdCB7CiAgd2lkdGg6IDE1MHB4OwogIGZvbnQtd2VpZ2h0OiBib2xkOwogIGJhY2tncm91bmQ6ICM0MjZlOTk7CiAgY29sb3I6ICNmZmZmZmY7CiAgZm9udC1zaXplOiAxLjFlbTsKfQojY29udGFjdF9mb3JtIHRleHRhcmVhIHsKICB3aWR0aDogMzIwcHg7Cn0KZm9vdGVyIHsKICBtYXJnaW46IDMwcHggMHB4OwogIHBhZGRpbmc6IDIwcHggMHB4OwogIGJvcmRlci10b3A6IDFweCBzb2xpZCAjZTFlMWUxOwogIGJhY2tncm91bmQ6IHVybCguLi9pbWcvcGhjbi1sb2dvLXNtYWxsLnBuZykgMHB4IDIwcHggbm8tcmVwZWF0OwogIG1pbi1oZWlnaHQ6IDMwcHg7CiAgZm9udC1mYW1pbHk6IEhlbHZldGljYSwgQXJpYWwsIHNhbnMtc2VyaWY7CiAgZm9udC1zaXplOiAxLjNlbTsKICBwYWRkaW5nLWxlZnQ6IDExMHB4Owp9CmZvb3RlciBoNiB7CiAgZm9udC13ZWlnaHQ6IG5vcm1hbDsKfQpmb290ZXIgdWwgewogIG1hcmdpbi10b3A6IDEwcHg7Cn0KZm9vdGVyIHVsIGxpIHsKICBmbG9hdDogbGVmdDsKICBwYWRkaW5nLXJpZ2h0OiAxMHB4OwogIGJvcmRlci1yaWdodDogMXB4IHNvbGlkICNlMWUxZTE7CiAgcGFkZGluZy1sZWZ0OiAxMHB4Owp9CmZvb3RlciB1bCBsaTpmaXJzdC1jaGlsZCB7CiAgcGFkZGluZy1sZWZ0OiAwOwp9CmZvb3RlciB1bCBsaTpsYXN0LWNoaWxkIHsKICBib3JkZXItcmlnaHQ6IG5vbmU7Cn0KZm9vdGVyIHVsIGxpIGEgewogIHRleHQtZGVjb3JhdGlvbjogbm9uZTsKICBjb2xvcjogI2UxZTFlMTsKfQpmb290ZXIgdWwgbGkgYTpob3ZlciB7CiAgY29sb3I6ICM4MzgzODM7Cn0KLmVtcGhhc2lzX2xpZ2h0IHsKICBjb2xvcjogIzgzODM4MzsKICBmb250LXN0eWxlOiBpdGFsaWM7CiAgZm9udC1zaXplOiAwLjhlbTsKfQpkaXYuYm9yZGVyLWJvdHRvbSB7CiAgYm9yZGVyLWJvdHRvbTogMXB4IHNvbGlkICNlMWUxZTE7Cn0KI3F1aWNrX2ZhY3RzIHsKICBiYWNrZ3JvdW5kOiAjZWJlZGY1OwogIHBhZGRpbmc6IDIwcHg7CiAgYm9yZGVyLXJhZGl1czogNXB4OwogIC13ZWJraXQtYm9yZGVyLXJhZGl1czogNXB4OwogIC1vLWJvcmRlci1yYWRpdXM6IDVweDsKICAtbXMtYm9yZGVyLXJhZGl1czogNXB4OwogIHBvc2l0aW9uOiByZWxhdGl2ZTsKICB0b3A6IC00MHB4Owp9Ci5wcF9zdWJfbmF2IHsKICBwb3NpdGlvbjogYWJzb2x1dGU7CiAgdG9wOiAyMTBweDsKfQoucHBfc3ViX25hdiBsaSB7CiAgZmxvYXQ6IGxlZnQ7CiAgbWFyZ2luLXJpZ2h0OiAxMHB4Owp9Ci5wcF9zdWJfbmF2IGxpIGEgewogIHBhZGRpbmc6IDVweCAxMHB4OwogIGJhY2tncm91bmQ6ICM4YTliZTE7CiAgYmFja2dyb3VuZDogcmdiYSgxMzgsIDE1NSwgMjU1LCAwLjUpOwogIGNvbG9yOiAjZmZmOwogIGZvbnQtd2VpZ2h0OiBib2xkOwogIHRleHQtZGVjb3JhdGlvbjogbm9uZTsKICBib3JkZXItcmFkaXVzOiA1cHg7CiAgLXdlYmtpdC1ib3JkZXItcmFkaXVzOiA1cHg7CiAgLW8tYm9yZGVyLXJhZGl1czogNXB4OwogIC1tcy1ib3JkZXItcmFkaXVzOiA1cHg7Cn0KLnBwX3N1Yl9uYXYgbGkgYTpob3ZlciB7CiAgYmFja2dyb3VuZDogcmdiYSgxMzgsIDE1NSwgMjU1LCAwLjgpOwp9CiNnYWxsZXJ5IGEgewogIGZsb2F0OiBsZWZ0OwogIG1hcmdpbi1yaWdodDogMjBweDsKICBjbGVhcjogcmlnaHQ7CiAgbWFyZ2luLWJvdHRvbTogMjBweDsKICB3aWR0aDogMTYwcHg7CiAgaGVpZ2h0OiAxMjJweDsKICBvdmVyZmxvdzogaGlkZGVuOwp9CiNmYW5jeWJveC10aHVtYnMgewogIHBvc2l0aW9uOiBmaXhlZDsKICBsZWZ0OiAwOwogIHdpZHRoOiAxMDAlOwogIG92ZXJmbG93OiBoaWRkZW47CiAgei1pbmRleDogODA1MDsKfQojZmFuY3lib3gtdGh1bWJzLmJvdHRvbSB7CiAgYm90dG9tOiAycHg7Cn0KI2ZhbmN5Ym94LXRodW1icy50b3AgewogIHRvcDogMnB4Owp9CiNmYW5jeWJveC10aHVtYnMgdWwgewogIHBvc2l0aW9uOiByZWxhdGl2ZTsKICBsaXN0LXN0eWxlOiBub25lOwogIG1hcmdpbjogMDsKICBwYWRkaW5nOiAwOwp9CiNmYW5jeWJveC10aHVtYnMgdWwgbGkgewogIGZsb2F0OiBsZWZ0OwogIHBhZGRpbmc6IDFweDsKICBvcGFjaXR5OiAwLjU7Cn0KI2ZhbmN5Ym94LXRodW1icyB1bCBsaS5hY3RpdmUgewogIG9wYWNpdHk6IDAuNzU7CiAgcGFkZGluZzogMDsKICBib3JkZXI6IDFweCBzb2xpZCAjZmZmOwp9CiNmYW5jeWJveC10aHVtYnMgdWwgbGk6aG92ZXIgewogIG9wYWNpdHk6IDE7Cn0KI2ZhbmN5Ym94LXRodW1icyB1bCBsaSBhIHsKICBkaXNwbGF5OiBibG9jazsKICBwb3NpdGlvbjogcmVsYXRpdmU7CiAgb3ZlcmZsb3c6IGhpZGRlbjsKICBib3JkZXI6IDFweCBzb2xpZCAjMjIyOwogIGJhY2tncm91bmQ6ICMxMTE7CiAgb3V0bGluZTogbm9uZTsKfQojZmFuY3lib3gtdGh1bWJzIHVsIGxpIGltZyB7CiAgZGlzcGxheTogYmxvY2s7CiAgcG9zaXRpb246IHJlbGF0aXZlOwogIGJvcmRlcjogMDsKICBwYWRkaW5nOiAwOwp9Ci5wcmVzc19yZWxlYXNlIHsKICBtYXJnaW4tYm90dG9tOiA0MHB4OwogIHBhZGRpbmctYm90dG9tOiAyMHB4OwogIGJvcmRlci1ib3R0b206IDFweCBkYXNoZWQgI2QyZDVkZDsKfQoucHJlc3NfcmVsZWFzZSBoMyB7CiAgY29sb3I6ICNmZmZmZmY7CiAgcGFkZGluZzogOHB4IDEwcHg7CiAgYmFja2dyb3VuZDogIzlkZGI5MDsKICBmb250LXdlaWdodDogYm9sZDsKICBkaXNwbGF5OiBpbmxpbmUtYmxvY2s7Cn0KLnByZXNzX3JlbGVhc2UgYSB7CiAgdGV4dC1kZWNvcmF0aW9uOiBub25lOwp9Ci5wcmVzc19yZWxlYXNlIGEgaDQgewogIGNvbG9yOiAjZmZmZmZmOwogIGJhY2tncm91bmQ6ICNkMmQ1ZGQ7CiAgZm9udC13ZWlnaHQ6IGJvbGQ7CiAgcGFkZGluZzogNXB4IDEwcHg7CiAgZGlzcGxheTogaW5saW5lLWJsb2NrOwp9IjtzOjE0OiJjdXN0b21fdG9vbGJhciI7czo1Mjg6IlsgIkJvbGQiLCAiSXRhbGljIiwgIlVuZGVybGluZSIsICJTdHJpa2UiLCAiU3Vic2NyaXB0IiwgIlN1cGVyc2NyaXB0IiwgIi0iLCAiUmVtb3ZlRm9ybWF0IiBdLApbICJOdW1iZXJlZExpc3QiLCAiQnVsbGV0ZWRMaXN0IiwgIi0iLCAiT3V0ZGVudCIsICJJbmRlbnQiLCAiLSIsICJCbG9ja3F1b3RlIiwgIkNyZWF0ZURpdiIsICItIiwgIkp1c3RpZnlMZWZ0IiwgIkp1c3RpZnlDZW50ZXIiLCAiSnVzdGlmeVJpZ2h0IiwgIkp1c3RpZnlCbG9jayIsICItIiwgIkJpZGlMdHIiLCAiQmlkaVJ0bCIgXSwKWyAiTGluayIsICJVbmxpbmsiLCAiQW5jaG9yIiBdLApbICJJbWFnZSIsICJGbGFzaCIsICJUYWJsZSIsICJIb3Jpem9udGFsUnVsZSIsICJTbWlsZXkiLCAiU3BlY2lhbENoYXIiLCAiUGFnZUJyZWFrIiwgIklmcmFtZSIgXSwKIi8iLApbICJTdHlsZXMiLCAiRm9ybWF0IiwgIkZvbnQiLCAiRm9udFNpemUiIF0sClsgIlRleHRDb2xvciIsICJCR0NvbG9yIiBdLApbICJNYXhpbWl6ZSIsICJTaG93QmxvY2tzIiwgIlNvdXJjZSIgXSI7czo2OiJzdHlsZXMiO3M6NDI3OiJ7IG5hbWU6ICJoZWFkaW5nIiAsIGVsZW1lbnQ6ICJoMSIsIHN0eWxlczogeyAiZm9udC1zaXplIjoiMy41ZW0iLCAiY29sb3IiOiIjZmZmZmZmIiwgIm1hcmdpbi1ib3R0b20iOiI5MHB4IiwgImZvbnQtd2VpZ2h0IjoiMzAwIn0gfSwKeyBuYW1lOiAic3ViaGVhZCIsIGVsZW1lbnQ6ICJoMiIsIHN0eWxlczp7ImZvbnQtc2l6ZSI6IjEuMmVtIn0gIH0sCnsgbmFtZTogImJpZ2dlciIsIGVsZW1lbnQ6ICJoMiIsIGF0dHJpYnV0ZXM6IHsgImNsYXNzIjogInN1YmhlYWQiIH0sIHN0eWxlczp7ImZvbnQtc2l6ZSI6IjEuNWVtIiwgImNvbG9yIjoiIzQyNmU5OSIsICJsaW5lLWhlaWdodCI6IjEyMCUifSB9LAp7IG5hbWU6ICJNYXJrZXI6IFllbGxvdyIsIGVsZW1lbnQ6ICJzcGFuIiwgc3R5bGVzOiB7ICJiYWNrZ3JvdW5kLWNvbG9yIjogIlllbGxvdyIgfSB9Ijt9fQ==', 'y'),
(14, 'matrix', '2.5.3', 'YTowOnt9', 'y');

-- --------------------------------------------------------

--
-- Table structure for table `exp_field_formatting`
--

CREATE TABLE IF NOT EXISTS `exp_field_formatting` (
  `formatting_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(10) unsigned NOT NULL,
  `field_fmt` varchar(40) NOT NULL,
  PRIMARY KEY (`formatting_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=31 ;

--
-- Dumping data for table `exp_field_formatting`
--

INSERT INTO `exp_field_formatting` (`formatting_id`, `field_id`, `field_fmt`) VALUES
(1, 1, 'none'),
(2, 1, 'br'),
(3, 1, 'xhtml'),
(4, 2, 'none'),
(5, 2, 'br'),
(6, 2, 'xhtml'),
(7, 3, 'none'),
(8, 3, 'br'),
(9, 3, 'xhtml'),
(10, 4, 'none'),
(11, 4, 'br'),
(12, 4, 'xhtml'),
(13, 5, 'none'),
(14, 5, 'br'),
(15, 5, 'xhtml'),
(16, 6, 'none'),
(17, 6, 'br'),
(18, 6, 'xhtml'),
(19, 7, 'none'),
(20, 7, 'br'),
(21, 7, 'xhtml'),
(25, 9, 'none'),
(26, 9, 'br'),
(27, 9, 'xhtml'),
(28, 10, 'none'),
(29, 10, 'br'),
(30, 10, 'xhtml');

-- --------------------------------------------------------

--
-- Table structure for table `exp_field_groups`
--

CREATE TABLE IF NOT EXISTS `exp_field_groups` (
  `group_id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_name` varchar(50) NOT NULL,
  PRIMARY KEY (`group_id`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `exp_field_groups`
--

INSERT INTO `exp_field_groups` (`group_id`, `site_id`, `group_name`) VALUES
(1, 1, 'Press Release'),
(2, 1, 'Homepage Slideshow'),
(3, 1, 'General Content'),
(4, 1, 'Contact'),
(5, 1, 'Plant Facilities');

-- --------------------------------------------------------

--
-- Table structure for table `exp_files`
--

CREATE TABLE IF NOT EXISTS `exp_files` (
  `file_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned DEFAULT '1',
  `title` varchar(255) DEFAULT NULL,
  `upload_location_id` int(4) unsigned DEFAULT '0',
  `rel_path` varchar(255) DEFAULT NULL,
  `mime_type` varchar(255) DEFAULT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `file_size` int(10) DEFAULT '0',
  `description` text,
  `credit` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `uploaded_by_member_id` int(10) unsigned DEFAULT '0',
  `upload_date` int(10) DEFAULT NULL,
  `modified_by_member_id` int(10) unsigned DEFAULT '0',
  `modified_date` int(10) DEFAULT NULL,
  `file_hw_original` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`file_id`),
  KEY `upload_location_id` (`upload_location_id`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=26 ;

--
-- Dumping data for table `exp_files`
--

INSERT INTO `exp_files` (`file_id`, `site_id`, `title`, `upload_location_id`, `rel_path`, `mime_type`, `file_name`, `file_size`, `description`, `credit`, `location`, `uploaded_by_member_id`, `upload_date`, `modified_by_member_id`, `modified_date`, `file_hw_original`) VALUES
(1, 1, 'ughelli-power-generating-power-for-milions-of-nigerians.jpg', 1, '/home4/ughellip/public_html/images/site-images/ughelli-power-generating-power-for-milions-of-nigerians.jpg', 'image/jpeg', 'ughelli-power-generating-power-for-milions-of-nigerians.jpg', 57437, NULL, NULL, NULL, 1, 1366339727, 1, 1366384202, '425 940'),
(2, 1, 'ughelli-power-black-start-of-the-national-grid.jpg', 1, '/home4/ughellip/public_html/images/site-images/ughelli-power-black-start-of-the-national-grid.jpg', 'image/jpeg', 'ughelli-power-black-start-of-the-national-grid.jpg', 75625, NULL, NULL, NULL, 1, 1366339746, 1, 1366384202, '425 941'),
(3, 1, 'image6.jpg', 1, '/home4/ughellip/public_html/images/site-images/image6.jpg', 'image/jpeg', 'image6.jpg', 21610, NULL, NULL, NULL, 2, 1366377604, 1, 1366384200, '122 160'),
(4, 1, 'Penguins.jpg', 1, '/home4/ughellip/public_html/images/site-images/Penguins.jpg', 'image/jpeg', 'Penguins.jpg', 777835, NULL, NULL, NULL, 2, 1366377852, 1, 1366384198, '768 1024'),
(5, 1, 'smiling.JPG', 1, '/home4/ughellip/public_html/images/site-images/smiling.JPG', 'image/jpeg', 'smiling.JPG', 31370, NULL, NULL, NULL, 2, 1366377863, 1, 1366384202, '564 638'),
(6, 1, '422590_309717179078830_1670641511_a.jpg', 1, '/home4/ughellip/public_html/images/site-images/422590_309717179078830_1670641511_a.jpg', 'image/jpeg', '422590_309717179078830_1670641511_a.jpg', 9170, NULL, NULL, NULL, 2, 1366377954, 1, 1366384198, '161 148'),
(7, 1, 'santa1.jpg', 1, '/home4/ughellip/public_html/images/site-images/santa1.jpg', 'image/jpeg', 'santa1.jpg', 6281, NULL, NULL, NULL, 2, 1366378054, 1, 1366384200, '124 95'),
(8, 1, 'Lighthouse.jpg', 1, '/home4/ughellip/public_html/images/site-images/Lighthouse.jpg', 'image/jpeg', 'Lighthouse.jpg', 561276, NULL, NULL, NULL, 2, 1366379977, 1, 1366384198, '768 1024'),
(9, 1, 'DSC00912.JPG', 1, '/home4/ughellip/public_html/images/site-images/DSC00912.JPG', 'image/jpeg', 'DSC00912.JPG', 109594, NULL, NULL, NULL, 2, 1366379983, 1, 1366384198, '480 640'),
(10, 1, '100_2376.jpg', 1, '/home4/ughellip/public_html/images/site-images/100_2376.jpg', 'image/jpeg', '100_2376.jpg', 60866, NULL, NULL, NULL, 2, 1366380105, 1, 1366384198, '425 941'),
(11, 1, 'image-big1.jpg', 1, '/home4/ughellip/public_html/images/site-images/image-big1.jpg', 'image/jpeg', 'image-big1.jpg', 207976, NULL, NULL, NULL, 1, 1366383501, 1, 1366384198, '750 1000'),
(12, 1, 'image-big10.jpg', 1, '/home4/ughellip/public_html/images/site-images/image-big10.jpg', 'image/jpeg', 'image-big10.jpg', 129106, NULL, NULL, NULL, 1, 1366383689, 1, 1366384198, '641 1000'),
(13, 1, 'image-big12.jpg', 1, '/home4/ughellip/public_html/images/site-images/image-big12.jpg', 'image/jpeg', 'image-big12.jpg', 123606, NULL, NULL, NULL, 1, 1366383732, 1, 1366384198, '634 1000'),
(14, 1, 'image-big2.jpg', 1, '/home4/ughellip/public_html/images/site-images/image-big2.jpg', 'image/jpeg', 'image-big2.jpg', 215458, NULL, NULL, NULL, 1, 1366383500, 1, 1366384200, '641 1000'),
(15, 1, 'image-big3.jpg', 1, '/home4/ughellip/public_html/images/site-images/image-big3.jpg', 'image/jpeg', 'image-big3.jpg', 151030, NULL, NULL, NULL, 1, 1366383546, 1, 1366384200, '631 1000'),
(16, 1, 'image-big4.jpg', 1, '/home4/ughellip/public_html/images/site-images/image-big4.jpg', 'image/jpeg', 'image-big4.jpg', 149750, NULL, NULL, NULL, 1, 1366383547, 1, 1366384200, '622 1000'),
(17, 1, 'image-big5.jpg', 1, '/home4/ughellip/public_html/images/site-images/image-big5.jpg', 'image/jpeg', 'image-big5.jpg', 148477, NULL, NULL, NULL, 1, 1366383596, 1, 1366384200, '750 1000'),
(18, 1, 'image-big6.jpg', 1, '/home4/ughellip/public_html/images/site-images/image-big6.jpg', 'image/jpeg', 'image-big6.jpg', 122467, NULL, NULL, NULL, 1, 1366383595, 1, 1366384200, '675 900'),
(19, 1, 'image-big7.jpg', 1, '/home4/ughellip/public_html/images/site-images/image-big7.jpg', 'image/jpeg', 'image-big7.jpg', 214735, NULL, NULL, NULL, 1, 1366383648, 1, 1366384200, '650 1000'),
(20, 1, 'image-big8.jpg', 1, '/home4/ughellip/public_html/images/site-images/image-big8.jpg', 'image/jpeg', 'image-big8.jpg', 168569, NULL, NULL, NULL, 1, 1366383647, 1, 1366384200, '750 1000'),
(21, 1, 'image-big9.jpg', 1, '/home4/ughellip/public_html/images/site-images/image-big9.jpg', 'image/jpeg', 'image-big9.jpg', 143900, NULL, NULL, NULL, 1, 1366383688, 1, 1366384200, '631 1000'),
(22, 1, 'image-big11.jpg', 1, '/home4/ughellip/public_html/images/site-images/image-big11.jpg', 'image/jpeg', 'image-big11.jpg', 191242, NULL, NULL, NULL, 1, 1366383736, 1, 1366383736, '631 1000'),
(23, 1, 'image-big13.jpg', 1, '/home4/ughellip/public_html/images/site-images/image-big13.jpg', 'image/jpeg', 'image-big13.jpg', 145916, NULL, NULL, NULL, 1, 1366383750, 1, 1366383750, '641 1000'),
(24, 1, 'DSC00711.JPG', 1, '/home4/ughellip/public_html/images/site-images/DSC00711.JPG', 'image/jpeg', 'DSC00711.JPG', 113080, NULL, NULL, NULL, 2, 1367316713, 2, 1367316713, '480 640'),
(25, 1, 'DSC00709.JPG', 1, '/home4/ughellip/public_html/images/site-images/DSC00709.JPG', 'image/jpeg', 'DSC00709.JPG', 111872, NULL, NULL, NULL, 2, 1367318309, 2, 1367318309, '480 640');

-- --------------------------------------------------------

--
-- Table structure for table `exp_file_categories`
--

CREATE TABLE IF NOT EXISTS `exp_file_categories` (
  `file_id` int(10) unsigned DEFAULT NULL,
  `cat_id` int(10) unsigned DEFAULT NULL,
  `sort` int(10) unsigned DEFAULT '0',
  `is_cover` char(1) DEFAULT 'n',
  KEY `file_id` (`file_id`),
  KEY `cat_id` (`cat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `exp_file_dimensions`
--

CREATE TABLE IF NOT EXISTS `exp_file_dimensions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned DEFAULT '1',
  `upload_location_id` int(4) unsigned DEFAULT NULL,
  `title` varchar(255) DEFAULT '',
  `short_name` varchar(255) DEFAULT '',
  `resize_type` varchar(50) DEFAULT '',
  `width` int(10) DEFAULT '0',
  `height` int(10) DEFAULT '0',
  `watermark_id` int(4) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `upload_location_id` (`upload_location_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_file_watermarks`
--

CREATE TABLE IF NOT EXISTS `exp_file_watermarks` (
  `wm_id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `wm_name` varchar(80) DEFAULT NULL,
  `wm_type` varchar(10) DEFAULT 'text',
  `wm_image_path` varchar(100) DEFAULT NULL,
  `wm_test_image_path` varchar(100) DEFAULT NULL,
  `wm_use_font` char(1) DEFAULT 'y',
  `wm_font` varchar(30) DEFAULT NULL,
  `wm_font_size` int(3) unsigned DEFAULT NULL,
  `wm_text` varchar(100) DEFAULT NULL,
  `wm_vrt_alignment` varchar(10) DEFAULT 'top',
  `wm_hor_alignment` varchar(10) DEFAULT 'left',
  `wm_padding` int(3) unsigned DEFAULT NULL,
  `wm_opacity` int(3) unsigned DEFAULT NULL,
  `wm_hor_offset` int(4) unsigned DEFAULT NULL,
  `wm_vrt_offset` int(4) unsigned DEFAULT NULL,
  `wm_x_transp` int(4) DEFAULT NULL,
  `wm_y_transp` int(4) DEFAULT NULL,
  `wm_font_color` varchar(7) DEFAULT NULL,
  `wm_use_drop_shadow` char(1) DEFAULT 'y',
  `wm_shadow_distance` int(3) unsigned DEFAULT NULL,
  `wm_shadow_color` varchar(7) DEFAULT NULL,
  PRIMARY KEY (`wm_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_freeform_attachments`
--

CREATE TABLE IF NOT EXISTS `exp_freeform_attachments` (
  `attachment_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(10) unsigned NOT NULL,
  `pref_id` int(10) unsigned NOT NULL,
  `entry_date` int(10) NOT NULL,
  `server_path` varchar(150) NOT NULL,
  `filename` varchar(150) NOT NULL,
  `extension` varchar(7) NOT NULL,
  `filesize` int(10) NOT NULL,
  `emailed` char(1) NOT NULL DEFAULT 'n',
  PRIMARY KEY (`attachment_id`),
  KEY `entry_id` (`entry_id`),
  KEY `pref_id` (`pref_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_freeform_entries`
--

CREATE TABLE IF NOT EXISTS `exp_freeform_entries` (
  `entry_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `group_id` int(10) unsigned NOT NULL DEFAULT '0',
  `weblog_id` int(4) unsigned NOT NULL,
  `author_id` int(10) unsigned NOT NULL DEFAULT '0',
  `ip_address` varchar(16) NOT NULL DEFAULT '0',
  `form_name` varchar(50) NOT NULL,
  `template` varchar(150) NOT NULL,
  `entry_date` int(10) NOT NULL,
  `edit_date` int(10) NOT NULL,
  `status` char(10) NOT NULL DEFAULT 'open',
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `website` varchar(50) NOT NULL,
  `street1` varchar(50) NOT NULL,
  `street2` varchar(50) NOT NULL,
  `street3` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `country` varchar(50) NOT NULL,
  `postalcode` varchar(50) NOT NULL,
  `phone1` varchar(50) NOT NULL,
  `phone2` varchar(50) NOT NULL,
  `fax` varchar(50) NOT NULL,
  `subject` varchar(150) NOT NULL DEFAULT '',
  `message` text NOT NULL,
  PRIMARY KEY (`entry_id`),
  KEY `author_id` (`author_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=165 ;

--
-- Dumping data for table `exp_freeform_entries`
--

INSERT INTO `exp_freeform_entries` (`entry_id`, `group_id`, `weblog_id`, `author_id`, `ip_address`, `form_name`, `template`, `entry_date`, `edit_date`, `status`, `name`, `email`, `website`, `street1`, `street2`, `street3`, `city`, `state`, `country`, `postalcode`, `phone1`, `phone2`, `fax`, `subject`, `message`) VALUES
(1, 6, 0, 2, '41.58.206.64', 'contact', '', 1389787465, 1389787465, 'open', 'Victory James', 'jamesvictory2@gmail.com', '', '', '', '', '', '', '', '', '', '', '', 'Testing form', 'Hi, I''m just testing the form to now if it works.'),
(2, 6, 0, 2, '41.58.206.64', 'contact', '', 1389787710, 1389787710, 'open', 'ajesadfasdfas', 'javi@live.com', '', '', '', '', '', '', '', '', '', '', '', 'this is it', 'This is another message'),
(3, 6, 0, 2, '41.58.206.64', 'contact', 'default_template', 1389787985, 1389787985, 'open', 'Victory James', 'javik@live.com', '', '', '', '', '', '', '', '', '', '', '', 'Testing the message form', 'Testing the message form'),
(4, 6, 0, 2, '41.58.206.64', 'contact', 'contact_template', 1389788432, 1389788432, 'open', 'Victory James Oge', 'emekaogey@gmail.com', '', '', '', '', '', '', '', '', '', '', '', 'Just testing ', 'HI, I''m just testing this message'),
(5, 3, 0, 0, '91.236.74.246', 'contact', 'contact_template', 1390337602, 1390337602, 'open', 'Adam', 'support@lots-of-likes.com', '', '', '', '', '', '', '', '', '', '', '', 'Promote your Business through the Power of Social Media!', 'Hi there! \n \nI''m emailing you on behalf of http://www.Lots-of-Likes.com, a new and radical way to attract new customers and generate online buzz for your small business! We''re emailing you because we''ve noticed your company isn''t taking the right approach that would allow you to reach your full potential online. If you were to look at the websites of the most successful and prominent leaders in your industry, without a doubt you will see they promote themselves through social media. Platforms like Facebook, Twitter, Instagram, and YouTube help them attract new customers and pull in new sales. But just signing up for one of these social media platforms isn''t enough. Unfortunately, the phrase "build it and they will come" doesn''t apply to the online world. So how exactly do you attract new customers to your business online? \n \n \nYour answer lies in a trade secret we like to call "the secret formula." It involves supplementing your social media account with high quality followers and likes that will by nature promote your business in the online world. And now, with our Superbowl Sale, we would like to exclusively offer your business a 40% discount on the supplementation of Facebook, Twitter, YouTube and Instagram likes and followers! \n \nHave any questions? Feel free to visit us at http://www.lots-of-likes.com, or see our Frequently Asked Questions (FAQ) at www.lots-of-likes.com/faq for more details. \n \nThousands of businesses are taking part in this newly-coined "Internet Gold Rush." Don''t miss out! \n \nRegards, \nAdam Farkas'),
(6, 3, 0, 0, '31.133.13.244', 'contact', 'contact_template', 1390571601, 1390571601, 'open', 'Adam', 'support@lots-of-likes.com', '', '', '', '', '', '', '', '', '', '', '', 'Promote ughellipower.com with social media :)', 'Hello, I am a professional social media business manager, obviously. \n \nBy building more than 10,000 real people profile endorsements using Facebook LIKES to your business page. This tell Google that your website is relative and authentic to what you do. \nIT WILL BE POSTED RIGHT ON YOUR PAGE FOR ALL VISITORS TO SEE HOW MANY -(people) Facebook LIKES !you have, via Facebook, by real FB counter button. Click on to see how you can do this in you free time or no time  http://lots-of-likes.com/ \n \nWe can help you also with build 10,000 Twitter Followers in 7 days, or 100,000 YouTube visits, to your YouTube video or channel, build 20,000 Google +1, from your peers about your business. Best offer G+1 building in 7 days \n \n \nYou can get help building 100,000 Facebook LIKES in 7 days. Likes Mean visitors endorse your Fan Page or website. \n \nHow do you think Justin Bieber(singer) get his first 1,000,000 followers before his first album? His producers bought the followers for him? \n \nI have something to offer that might interest you. http://lots-of-likes.com/ \n \nBy placing more than 10,000 endorsements using Facebook LIKES. This tell Google that your website is relative and authentic to what you do. \nIT WILL BE POSTED RIGHT ON YOUR WEBSITE FOR ALL VISITORS TO SEE HOW MANY -(people) Facebook LIKES you have, via Facebook, by real FB counter button. \n \nThese indicators (Facebook LIKES) will be visible on your website. If you have not installed Facebook Like count button on your website - I can help you install it! \n \n \nAfter my work is finished, the Facebook LIKES Count Button will confirm a high ranking of your site, which will be noticed and appreciated by your visitors, and they will also be able to recommend your site to their friends on these social network. \n \nThe cost of the service is very low compared to the obvious gains, just the credibility you will gain alone. I work without pre-payment. Payment is carried out after all the work is done. \nYou pay and all Facebook LIKES are placed. \nPlease let me know if you are interested. \nIf this does not interest you, I''m sorry to have bothered you! Have a good day! \n \nUnsubscribe here http://lots-of-likes.com/ \n \nSincerely, \nFacebook LIKES Provider'),
(7, 3, 0, 0, '82.145.218.193', 'contact', 'contact_template', 1391256482, 1391256482, 'open', 'David sunday', 'davidsunday73@yahoo.com', '', '', '', '', '', '', '', '', '', '', '', 'Isoko north suffer power failur', 'We the owhelogbo community use dis forum to inform you based on unequal power distributing in isoko. We use the light for 1 day and stay in complete darkness for 3 , 4 days. We beg you to work no dis. Signed. owhelogbo elder.'),
(8, 3, 0, 0, '41.58.138.154', 'contact', 'contact_template', 1391372558, 1391372558, 'open', 'TIMOTHY DAVID', 'david4nextlevels@yahoo.com', '', '', '', '', '', '', '', '', '', '', '', 'INTEREST IN YOUR COMPANY', 'TIMOTHY, DAVID SUNDAY\n4/6, Prince Ola Street off Seliat, Egbeda Lagos.\nE-mail: david4nextlevels@yahoo.com, Mobile: +234-8063320087.\nTo develop a career with a dynamic and reputable organization whose demand for hard work, honesty and commitment will enhance my desire to succeed, and to contribute positively to the objectives of the organization.\nCareer Profile\n Experienced in the Installation of Switchyard Accessories.\n Commissioned 20V34SG Wartsila Generators & Synchronized power supply.\n Exploited leadership qualities, management capabilities, competently managed workshop operations and enhanced customer satisfaction through excellent service and prompt redressal of customer complaints.\n Familiar with MS Windows 98/XP, MS Office 97/XP & Internet.\n\nProfessional Experience \nPARAS ENERGY AND NATURAL RESOURCES DEV. LTD\nKM45, Sagamu/Ikorodu expressway Ogijo, Ogun State\nElectrical Foreman, Feb. 2011 Onwards\nResponsibilities: \nMaintenance and Operations Management:\n• Installation of MV/LV panels.\n• Operation and Maintenance of 20V34SG Wartsila Generators (8.7MW each)\n• Installation of five 20V34SG Wartsila Generators (8.7MW each)\n• Installation and Maintenance of 65MVA & 45MVA Transformers.\n• Installation of CTs and PTs.\n• Taking of daily records.\n\nMBH POWER LTD.\nIbadan Branch, Oyo State. \nElectrical Foreman, August 2009 to March 2011 \nResponsibilities: \nMaintenance and Operations Management:\n• Installation of 2x15MVA Transformer for 33/11kV Sub-Station.\n• Planting of Poles and Laying of cables for 33kV lines.\n\nPower Holding Company of Nigeria (P.H.C.N.)\nIbadan Branch, Oyo State.\nElectrical Technician, August 2007 to July 2009\nResponsibilities: \nMaintenance and Operations Management:\n• Planting of Poles and Laying of cables for 33/11kV lines.\n• Taking of records at the 33/11 kV Stations.\n\n\n\nAndy Electrical Ltd\n145, Ikot-Ekpene road, Uyo, Akwa Ibom State.\nSupervisor, 2006 to 2007\nResponsibilities:\n• Installation of Street Lightning.\n• House wiring and Installation.\nMinistry of Works and Transport \nUyo, Akwa Ibom State.\nIndustrial Trainee, 2005 to 2006\nResponsibilities: \nMaintenance and Operations Management:\n• Tracing and Interpretation of Electrical Drawings.\n• Installation of Street Lightning.\n• Installation of Feeders Lines. \n\nEducational Qualifications \n• National Diploma in Electrical/Electronics Engineering, The Polytechnic Calabar in 2004, Lower Credit.\n• Federal Trade Test Class II & III (2006/2007).\n• W.A.S.S.C.E. , Community Secondary School, Ono, Ibiono Ibon ,Akwa Ibom State (1995)\nComputer Proficiency\n• Acquired knowledge of MS Windows 98/XP, MS Office 97/XP & Internet\nPersonal Information\n• Date of birth:  25Th June 1978.    \n• Marital Status: Married, Gender: Male\n• Religion: Christianity, Nationality: Nigerian\n• Languages known:  English.\n• Interests & Hobbies: Reading, Swimming & Playing Football.\n\nReferences\n• Engr. Mike Okoro\nManager Metering Unit, PHCN HQ \nIbadan, Oyo State. \nCell Number :– 08067133684, 08051486545\n• Engr. Ajayi Babatunde\nManager Metering Unit, PHCN HQ\nIbadan, Oyo State.\nCell number: - 07034639226\n• Dr. Timothy N. Timothy\nGod’s Care Hospital, \nIkot Mbang. Uyo State.\n'),
(9, 3, 0, 0, '31.133.13.244', 'contact', 'contact_template', 1391443697, 1391443697, 'open', 'Adam', 'support@get-fb-likes.com', '', '', '', '', '', '', '', '', '', '', '', 'Promote ughellipower.com with social media :)', 'Hi there! \n \nI''m emailing you on behalf of http://www.get-fb-likes.com, a new and radical way to attract new customers and generate online buzz for your small business! We''re emailing you because we''ve noticed your company isn''t taking the right approach that would allow you to reach your full potential online. If you were to look at the websites of the most successful and prominent leaders in your industry, without a doubt you will see they promote themselves through social media. Platforms like Facebook, Twitter, Instagram, and YouTube help them attract new customers and pull in new sales. But just signing up for one of these social media platforms isn''t enough. Unfortunately, the phrase "build it and they will come" doesn''t apply to the online world. So how exactly do you attract new customers to your business online? \n \n \nYour answer lies in a trade secret we like to call "the secret formula." It involves supplementing your social media account with high quality followers and likes that will by nature promote your business in the online world. And now, with our Superbowl Sale, we would like to exclusively offer your business a 40% discount on the supplementation of Facebook, Twitter, YouTube and Instagram likes and followers! \n \nWant to verify the integrity and quality of our product? We offer 100 Facebook Fanpage Likes for just $1, so you have the chance to do so. We also use PayPal, so you''re credit card and payment method is completely private and safe. \n \nHave any questions? Feel free to visit us at http://www.get-fb-likes.com, or see our Frequently Asked Questions (FAQ) at http://www.get-fb-likes.com/faq for more details. \n \nThousands of businesses are taking part in this newly-coined "Internet Gold Rush." Don''t miss out! \n \nRegards, \nhttp://www.get-fb-likes.com'),
(10, 3, 0, 0, '192.168.0.90', 'contact', 'contact_template', 1391501248, 1391501248, 'open', 'EDISON', 'edisonamb@yahoo.com', '', '', '', '', '', '', '', '', '', '', '', 'I NEED TO KNOW', 'Sir,\n    goodday i am seeing the good work transcorp is bring into our land and i am among those that love good thigs and appreciate it.i live in ughelli,a graduate of Biochemistry with focus and target oriented.i want to contribute and be part of the good things happening through Transcorp.Sir, i wish to seek for employment opportunity in your esteemed company.\n\nRgards.'),
(11, 3, 0, 0, '14.97.205.245', 'contact', 'contact_template', 1391676145, 1391676145, 'open', 'Tejas Nene', 'tejas.nene@ionexchange.co.in', '', '', '', '', '', '', '', '', '', '', '', 'Business association ', 'Dear Sir / Madam,\n\nWe are leading Water and Waste Water treatment company in Asia. We would like to understand your requirements for Water & waste water treatment equipments. We also manufacture boiler, cooling water, chiller & effluent chemicals. We also manufacture ion exchange resins. Please visit our website www.ionindia.com for detailed information about our products and company.\n\nWe await your kind feedback on the above.\n\nThanks and Regards,\n\nTejas Nene\nManager - West Africa\nIon Exchange India Limited'),
(12, 3, 0, 0, '37.228.106.112', 'contact', 'contact_template', 1392018258, 1392018258, 'open', 'Ohwedor Wilson', 'willisderoyce@yahoo.com', '', '', '', '', '', '', '', '', '', '', '', 'Job for power plant engineer', 'I am a qualified power plant engineer seeking job in your company being also an indegene of the community. I have all the required skills .'),
(13, 3, 0, 0, '31.133.13.244', 'contact', 'contact_template', 1392042178, 1392042178, 'open', 'Adam', 'support@get-fb-likes.com', '', '', '', '', '', '', '', '', '', '', '', 'Promote ughellipower.com with social media :)', 'Hi there! \n \nI''m emailing you on behalf of http://www.get-fb-likes.com, a new and radical way to attract new customers and generate online buzz for your small business! We''re emailing you because we''ve noticed your company isn''t taking the right approach that would allow you to reach your full potential online. If you were to look at the websites of the most successful and prominent leaders in your industry, without a doubt you will see they promote themselves through social media. Platforms like Facebook, Twitter, Instagram, and YouTube help them attract new customers and pull in new sales. But just signing up for one of these social media platforms isn''t enough. Unfortunately, the phrase "build it and they will come" doesn''t apply to the online world. So how exactly do you attract new customers to your business online? \n \n \nYour answer lies in a trade secret we like to call "the secret formula." It involves supplementing your social media account with high quality followers and likes that will by nature promote your business in the online world. And now, with our Superbowl Sale, we would like to exclusively offer your business a 40% discount on the supplementation of Facebook, Twitter, YouTube and Instagram likes and followers! \n \nWant to verify the integrity and quality of our product? We offer 100 Facebook Fanpage Likes for just $1, so you have the chance to do so. We also use PayPal, so you''re credit card and payment method is completely private and safe. \n \nHave any questions? Feel free to visit us at http://www.get-fb-likes.com, or see our Frequently Asked Questions (FAQ) at http://www.get-fb-likes.com/faq for more details. Or, give me a call at (877) 410-4002 \n \nThousands of businesses are taking part in this newly-coined "Internet Gold Rush." Don''t miss out! \n \nRegards, \nhttp://www.get-fb-likes.com'),
(14, 3, 0, 0, '141.0.10.25', 'contact', 'contact_template', 1392530270, 1392530270, 'open', 'Hon Fuludu Eyanbri', 'eyanbrif@gmail.com', '', '', '', '', '', '', '', '', '', '', '', 'No power supply to Odorubu,Patani Lga and pkcn meter.', 'There has been no light supplied to Udorubu in Patani Lga for the past 6 months without no known reason. Speculations have it that due to lack of payment of bills by Patani Lga that necessitates the action of suppling light to Patani and Bomadi Lgas. Please fix meters to our houses so that we pay our relevant used bills and enjoy available energy.\nPlease expidiate action to alliviate our suffering. Please reply.\nThank you and God bless'),
(15, 3, 0, 0, '116.226.77.147', 'contact', 'contact_template', 1392870998, 1392870998, 'open', 'NicolasWem', 'asdasd@lots-oflikes.com', '', '', '', '', '', '', '', '', '', '', '', 'Do you want 10,000 Facebook Likes? from people to your website/FB Fanpage! in just days, http://www.businesswebmonkey.com/buy-facebook-likes.php', 'Hello, \n \nIt was great to speak with you today, I''m excited to know you are making updates to your sites.  To assist in helping you create your webpage, we''d like to show you our customizable animated Facebook button.  This will help your Facebook fan page increase Likes and your business instantly earns credibility. \n \nPlease click on the link http://businesswebmonkey.com/customsocial.php to view a sample of what we can do! \n \nThe best way to get in touch with us is through email (Sales@SallySocialNetwork.com). We are still the #1 seller of Facebook likes, Twitter followers, and Youtube views. Not only are our prices the lowest, but also the most reliable! \n \n \nIf you have any issues or concerns about our service, please send them to Admin@SallySocialNetwork.com \n \nSincerely, \n \nNicole T \nSally Social Network'),
(16, 3, 0, 0, '216.152.249.242', 'contact', 'contact_template', 1393027664, 1393027664, 'open', 'foddjtuayt', 'vmkczm@qvolsu.com', '', '', '', '', '', '', '', '', '', '', '', 'nwERYhAkurBnhPiXa', 'E3mtoZ  <a href="http://yneatdggubmr.com/">yneatdggubmr</a>, [url=http://topqihrygsti.com/]topqihrygsti[/url], [link=http://oqnizwnbklpf.com/]oqnizwnbklpf[/link], http://komuyijppkpy.com/'),
(17, 3, 0, 0, '41.190.4.45', 'contact', 'contact_template', 1393443614, 1393443614, 'open', 'Ohiemi, Anthony Enyone', 'tonienyo@gmail.com', '', '', '', '', '', '', '', '', '', '', '', 'Unsolicited Resume', 'OHIEMI, ANTHONY ENYONE\n\nNo. 4 Audu Bako Way, Etisalat Nigeria Office,\n\nKano, Nigeria.\n\nE-mail: tonienyo@gmail.com\n\nMobile: 0809-944-2237, 0806-224-3101.\n\nOBJECTIVES\n\nTo serve as image maker towards increasing the thirst and yearnings of the public for the goods and services of any establishment that employs me\n\nTo diligently and judiciously engage my human potential and acquired skills in humble service of my employer under little or no supervision\n\nTo contribute enormously in teamwork towards meeting target to boost the goal driven interest of any establishment that employs me\n\nTo foster profitable initiatives, creativity and trailblazing ideas to the frontiers of any establishment that employs me\n\n \n\nSKILLS\n\nExcellent communication skills\n\nProblem solving and troubleshooting skills\n\nTelemarketing Skills through NBA\n\nGood rapport and human relationship\n\nComputer literate\n\nProficient in English and Igala languages, fair in Hausa and Igbo\n\nAbility to write coherent and comprehensive reports\n\n \n\nPERSONAL PROFILE\n\nState of Origin:            Kogi\n\nMarital Status:             Married\n\nReligion:                      Christianity\n\nDate of Birth:               January 20th, 1986\n\n \n\nEDUCATIONAL INSTITUTIONS ATTENDE/ QUALIFICATIONS OBTAINED WITH DATES\n\nAhmadu Bello University, Zaria, Nigeria                                                   2004-2008\n\nB.A. English (Literature)                                                                                 \n\nIgah Community, College Ikeje, Kogi State                                               2004\n\nSenior Secondary School Certificate                                                              \n\nFederal Government College, Ugwolawo, Kogi State                               2000-2003\n\nWest African Senior Certificate                                                                       \n\nR.C.M. Primary School Imane, Kogi State                                                   1991-1997\n\nFirst School Leaving Certificate                                                                      \n\n \n\n \n\nWORKING EXPERIENCE\n\nEtisalat Nigeria (EMTS)                                                                                    2012 till date\n\n(Customer Care Executive II)\n\nProvide quality customer service to EMTS’s customers through the call centre.\n\nAttend to and resolve customer queries promptly and courteously at all times.\n\nRoute customer issues to the relevant units using defined escalation channels.\n\nDocument/capture all customer interactions using approved software and escalate unresolved issues to the Team Leader, Contact Centre Operations as required.\n\nEnlighten and educate customers on new products and initiatives within EMTS.\n\nAdhere to assigned shift slots, ensuring availability throughout the shift period.\n\nTake action on feedback received, and ensure continuous improvement on performance.\n\nExecute peer-evaluation on bi-weekly basis as required.\n\nCross-sell and Up-sell products and services to customers via NBA\n\nCompensate customers using the compensation portal appropriately\n\nNotify Team Leaders of all downtime that are Customer and Revenue impacting\n\nPerform any other duties as assigned by the Team Leader, Contact Centre Operations.\n\n \n\nZenith International College, Gombe, Gombo State (NYSC)                             2009-2010\n\n(Teacher, English Language and Literature in English)\n\nTeaching English Language and Literature in English; conducting\n\nassessments and recording in the subjects taught and preparation of\n\n lesson notes, scheme of work\n\n \n\nACHEIVEMENTS/TRAININGS AND CERTIFICATIONS\n\n100% Schedule Adherence Champion                                                    Feb. 2012 till date\n\nSecond Best Customer Care Executive, Etisalat Call Center Kano         May, 2013\n\nCompetency Based Training - Problem Solving and Troubleshooting\n\nSkills by i-Skills Knowledge Management                                               July, 2013\n\nSingle-handedly restructured the teaching of Literature in English\n\nIn Zenith International College that all my students scored above a credit   2009-2010\n\n \n\nRESEARCH CONDUCTED AND PUBLICATIONS\n\nHistory as Source Material for Playwrights: A Study of Emmy Idegu’s \n\nThe Legendary Inikpi  and Omodoko.\n\nKusfa Community and Their Praise Songs\n\nEditor-in-Chief of Seventh Edition of The Lectern Magazine/Yearbook\n\nTwo published poems and over thirty yet to be published ones.\n\n \n\nCLUBS/ASSOCIAIONS AND POSITIONS HELD\n\nP.R.O. -National Assoc. of Catholic Corps Members (NACC) Gombe Chapter      2009-2010\n\nActive Member-NYSC Musical and Entertainment Crew, Gombe State              2009-2010\n\nMember - Creative Writers Club, A.B.U., Zaria, Nigeria                                       2004-2008\n\nMember - Nigerian Federation of Catholic Students, A.B.U. Zaria Chapter        2004-2008\n\nHead boy - R.C.M. Primary School, Imane, Kogi State                                        1996-1997\n\n \n\nHOBBIES\n\nWriting poems; discussing productively and intellectually, discovering new things and listening to classic music\n\n \n\nREFEREES\n\nMr. Enemali Illah                                          \n\nAccounts Department,                                    \n\nPetroleum Products Pricing Regulatory Agency,   \n\nCentral Area, Abuja                                                 \n\n0803-653-4572                                                      \n\nMr. Stephen Joseph\n\nLecturer,\n\nDepartment of English and Literary Studies\n\nAhmadu Bello University, Zaria\n\n 0803-703-3127\n\nMrs. Sarrah Dashe\n\nTourism Officer,                                                         \n\nNigerian Tourism Development Corporation\n\nOld Federal Secretariat\n\nArea 1, Garki, Abuja\n\n0809-819-5957        \n\n                          \n\n '),
(18, 3, 0, 0, '213.238.175.4', 'contact', 'contact_template', 1393658333, 1393658333, 'open', 'Qgxgsrgo', 'nhjkndyp@pfqnbxbm.com', '', '', '', '', '', '', '', '', '', '', '', 'tsGQLelhQfRIpLP', 'Like most games, rather, it''s the casino company wants dividends., <a href="http://num1sverigeonlinecasino.eu/">onine casino p&#229; n&#228;tet</a>, [url="http://num1sverigeonlinecasino.eu/"]onine casino p&#229; n&#228;tet[/url],  254, <a href="http://sverigebastaonlinecasinose.eu/">mobil online casino</a>, [url="http://sverigebastaonlinecasinose.eu/"]mobil online casino[/url],  %-(, '),
(19, 3, 0, 0, '62.161.8.93', 'contact', 'contact_template', 1394027111, 1394027111, 'open', 'Franck MOCAËR', 'FRANCK.MOCAER@CATUELEC.COM', '', '', '', '', '', '', '', '', '', '', '', 'Electrical Safety', 'To the:\n• HSE Manager\n• Technical Manager\n• Procurement Manager\n• Electrical Maintenance & Operation Managers\n\n\nDear Madam, Dear Sir, \n\nI work for CATU, the European leader of Electrical Safety Equipment. Africa is the leading export area for CATU where CATU is very well known in Maghreb and in African French speaking countries. I kindly invite you to download CATU General Catalogue from www.catuelec.com to have a better knowledge of CATU equipment. \n\nUtilities (generation, transmission and distribution) and industries (oil and gas, steel, cement, food plants) appreciate CATU equipment for their quality and for the safety brought to every one using them. They regularly rely on CATU expertise to help them to define the electrical safety equipment aimed at their staff. Why not TRANSCORP?\n\nIn Nigeria, CATU has sporadic sales with O&G major companies like TOTAL or SHELL. Nevertheless, I am still looking forward to finding the correct Nigerian partner to be the relay of CATU in Nigeria and the first contact of the Nigerian utilities, O&G companies and industries when considering electrical safety equipment.\n\nCould you please let me know how TRANSCORP Ughelli Power select electrical safety equipment and PPE for each of your four power plants and electricians? Furthermore, is TRANSCORP allowed to buy directly from a foreign manufacturer or do you buy only from Nigerian Trading Companies or distributors? In this latter case, could you please communicate me the contact of 1 or 2 Nigerian reliable companies who could become a distributor of CATU?\n\nBest regards,\n\nFranck MOCAËR\nExport Manager\nSouth Europe / Africa / Indian Ocean\n\nTel :  +33 1 42 31 46 59 ; Fax : +33 1 42 31 46 34\nfranck.mocaer@catuelec.com\n \n10-20 avenue Jean Jaurès, PO Box 2.\nF 92222 Bagneux Cedex, France\nwww.catuelec.com\n'),
(20, 3, 0, 0, '216.151.137.35', 'contact', 'contact_template', 1394096771, 1394096771, 'open', 'Tiibnrau', 'ovrbqvpg@ganzeumg.com', '', '', '', '', '', '', '', '', '', '', '', 'idirYzRGqrcBgO', 'Fundamental Analysis: A Jayant - ISI Group online gambling Inc., <a href="http://num1sverigeonlinecasino.eu/">casino online</a>, [url="http://num1sverigeonlinecasino.eu/"]casino online[/url],  kyde, <a href="http://kluhartem.com/">online casino bonus</a>, [url="http://kluhartem.com/"]online casino bonus[/url],  8DDD, '),
(21, 3, 0, 0, '88.113.184.195', 'contact', 'contact_template', 1394400158, 1394400158, 'open', 'Abdou conai chika', 'chymac.chika@gmail.com', '', '', '', '', '', '', '', '', '', '', '', '1100kw gas turbine for sale', 'Dear Sir, we have brand new gas turbine 1100kw for sale with very reasonable price made in Ukrine.\n\nSir, don''t hesitate to contact us if you are of interest.is located in Finland.\n\nbest regareds \n\nAbdou Chika\nFor: Finconai Trade Agencies\nHelsinki'),
(22, 3, 0, 0, '41.75.86.70', 'contact', 'contact_template', 1394641388, 1394641388, 'open', 'ALUKO', 'arsenluv@yahoo.com', '', '', '', '', '', '', '', '', '', '', '', 'REQUEST', 'Good afternoon, please i will like to know when the recruitment process will start,and also want know if there is an internship programme in the company. thank you\n\nALUKO T.J\n08030477684'),
(23, 3, 0, 0, '216.151.137.36', 'contact', 'contact_template', 1394641863, 1394641863, 'open', 'frwlbkrm', 'kltzks@zfuyyk.com', '', '', '', '', '', '', '', '', '', '', '', 'ROVRlOgMjcekXFZIH', 'xI56s1  <a href="http://batgliihzyea.com/">batgliihzyea</a>, [url=http://penvyfafrscv.com/]penvyfafrscv[/url], [link=http://gzjkzmqchgju.com/]gzjkzmqchgju[/link], http://lupkleqbjqdz.com/'),
(24, 3, 0, 0, '41.198.201.167', 'contact', 'contact_template', 1395144091, 1395144091, 'open', 'unera mahmud', 'unera.mahmud@creseada.biz', '', '', '', '', '', '', '', '', '', '', '', 'our proposal', '\n\nDear Ughelli Power Plc\n\nwe kindly send you this notice as a follow up to the letter we sent to you in February 2014\nit was titled providing end to end logistics solution in the power sector.\n\nCreseada international limited is a global integrated logistics solution provider, and have been for the past 29 years.\nour expertise span over all the service sector of the economy, from handling telecomm equipment, \noil and gas equipment, agro allied equipment and especially power equipment, \nwhich is where your organisation comes in. we seek to provide our services to your organisation or at \nleast schedule to meet with your kindselves in person so we have the opportunity to show you services we\n intend to provide to your organisation, designed to ensure speedier  deliveries and invariably improved service\n output.\nwe hope we will hear back from you soon\n\nfor : Creseada International Limited\n\nUnera Mahmud\n08061661996\n\n'),
(25, 3, 0, 0, '216.152.249.242', 'contact', 'contact_template', 1395171947, 1395171947, 'open', 'amuhvp', 'cakfst@ueubyd.com', '', '', '', '', '', '', '', '', '', '', '', 'iWyHtUKqDMYolIU', 'ei76aK  <a href="http://xcbjdoprzymt.com/">xcbjdoprzymt</a>, [url=http://swknseoqgomr.com/]swknseoqgomr[/url], [link=http://gstqwyoswrmw.com/]gstqwyoswrmw[/link], http://rzfofnnhugtn.com/'),
(26, 3, 0, 0, '216.151.137.34', 'contact', 'contact_template', 1395311537, 1395311537, 'open', 'Qfmyarsl', 'prpeaacx@egjrpgnf.com', '', '', '', '', '', '', '', '', '', '', '', 'MitVDYNPTsPQuOtbXcB', 'The relaxing massage must be approved by the japanese end. It must end, the Dallas Cowboys - The Rams visited Operation Homefront on November 10 against Oakland., <a href="http://spelautomaterpanatetsverige.com/">casino free spins</a>, [url="http://spelautomaterpanatetsverige.com/"]casino free spins[/url],  8957, <a href="http://theonlinecasinosverige.com/">casino bonus</a>, [url="http://theonlinecasinosverige.com/"]casino bonus[/url],  8-[[, '),
(27, 3, 0, 0, '216.151.137.36', 'contact', 'contact_template', 1395525660, 1395525660, 'open', 'Lflhrlyy', 'jdaiizrh@yatgzdxp.com', '', '', '', '', '', '', '', '', '', '', '', 'zoHYZBkVpM', 'The biggest haul may come to be most superior, prosperous and with relevant coverage they seek trusted guidance, even if a lead organization in japanese found that pedometers made in japanese., <a href="http://theonlinecasinosverige.com/">casino free spins</a>, [url="http://theonlinecasinosverige.com/"]casino free spins[/url],  15434, '),
(28, 3, 0, 0, '216.151.137.34', 'contact', 'contact_template', 1395572179, 1395572179, 'open', 'qmnuiodafq', 'wfvuby@orrlow.com', '', '', '', '', '', '', '', '', '', '', '', 'iaEdfLiGRXppCudNEW', 'vpUuyE  <a href="http://bnwhqjzimpki.com/">bnwhqjzimpki</a>, [url=http://stmeqbncjcmx.com/]stmeqbncjcmx[/url], [link=http://eycovolnskfh.com/]eycovolnskfh[/link], http://tqmbyfxqmfpy.com/'),
(29, 3, 0, 0, '31.133.13.209', 'contact', 'contact_template', 1395610656, 1395610656, 'open', 'cohen nathan', 'cohen.na3@aol.com', '', '', '', '', '', '', '', '', '', '', '', 'I tried calling you today', 'Hello, \n \nI tried calling you several times today, and I''m not getting \nthrough for some reason. \n \nIf your website does not have many Facebook Likes, why would \nsomeone visit your Facebook Fanpage? \nPeople Like you when other people like you. The more poeple \nthat FB LIKE your website and fanpage, the credibility you \nwill have with new visitors. It works the same for Twitter, \nwhen people visit your website and see you have alot of \nTwitter Followers, they now want to follow you too. They \ntoo now what to know what all the hype is and why all those \npeople are following you. \n \nPlease visit my site, I could help you out a lot. \nI have a small office out here in silicon Valley \nand I''m just trying to make a name for myself. \nhttp://social-valley.com/likesmarket.html \n \nSincerely, \nCohen Nathan \nSocal-Valley \n1472 Murpy Ave, Ste 213 \nSan Jose, CA 95121'),
(30, 3, 0, 0, '216.151.137.36', 'contact', 'contact_template', 1395665383, 1395665383, 'open', 'hqtvgwniyi', 'uaxqcu@qhwkiw.com', '', '', '', '', '', '', '', '', '', '', '', 'WUcCiMyGNBO', 'jPdkLS  <a href="http://lrcotqzwwpxn.com/">lrcotqzwwpxn</a>, [url=http://igzasjsdzmrv.com/]igzasjsdzmrv[/url], [link=http://fdujigvvwcfk.com/]fdujigvvwcfk[/link], http://hshefjuwyumr.com/'),
(31, 3, 0, 0, '68.41.55.197', 'contact', 'contact_template', 1396731915, 1396731915, 'open', 'Chinwe Arum', 'arum.chinwe@yahoo.com', '', '', '', '', '', '', '', '', '', '', '', 'Internship Position for a Corper', 'Hi I recently completed my orientation as an NYSC Corper for the year 2014 and was deployed to Ughelli, I am wondering if you have an open opportunity for a Corper in your establishment. even if you don''t pay, I can do well with my NYSC allowance, I just want the experience before I get into the work force. I studied business management. I am motivated to contribute to any goal that you will set for me, if given the opportunity\n\nThanks \nYours faithfully\n\nArum Chinwe '),
(32, 3, 0, 0, '46.246.40.172', 'contact', 'contact_template', 1397091381, 1397091381, 'open', 'NCassidahx', 'ncassidayas@gmail.com', '', '', '', '', '', '', '', '', '', '', '', 'abm spilleautomater gratis pa nett hgg', 'Disse menneskene hendelser kan variere , manpower complete de fleste dataspill pakken er definitive stokket riktig en a lykkes pa Master of Education et equality kort knyttet hideaway samsvarende verdien ( en prial ) . Dette vil ofte vanligvis generelt bli funnet mens i rumpus favorittavis , likevel , hvis eierne ikke far hideout noyaktige papir ogsa kjent som papiret ikke au naturel tilby deg kan horoskoper samt lykketall sa alle kan se dem ved a ga online . som bestar av en 10 % rabatt om detaljer Squad medlemmer . \n \nEn tinkle Siden jeg personlig som om om <a >spill pa nett</a>  Rattling Gambling casino og Hotel er de golf-pakke . Den nyttige tilfeldig utvalg author ( trening ) er gradert regelmessig av uavhengige myndigheter inspeksjon . Brannmurer utgjore et problem i forhold til det avverger spillere bort fra a laste ned datasystem programvare fra alle av nettet. \n \nUnsound Lake er vil ogsa jobbe pa lair matenner a koble denne Smoothing iron omradet Sawbuck Trek til goof egen casino a losjere a lage snoscooterentusiaster. Om 40 Lange nordvest ut av Rhinelander , plassert mellom en funksjonell pittoreske linje av tjue innsjoer avhenger lair secret Lake of the faklene Resort og etter at Gambling casino . Ulike reisende take a chance egnet for ulike bruksomrader . \n \nLair <a >spill pa nett</a>  memory tingen i forhold til alle restauranter er at ethnic music kan begynne a bruke ruction Thou Gambling casino spillerens klubb hilsener kort for a spise et maltid . Spille netto cassino slop navnene er sarlig typisk plassert i mange menn eller kvinner bor workforce , nyter kitty er transportation hva vanligvis for a danne det videre fascinerende , workforce ogsa spennende . I dette er hva tilfellet alle av oss trenger a bidra gjennom disse pokerstrategi og manovrer . \n \nSkriv popular resepsjonen spillested for online-spillage vil Betfair Net casino spillage . Hands Caf Manoomin fungerer ogsa mer en enkelt Native Internal come denne typen som Pakistan Tacos pa hjemmelaget kokk brod , vilt chili con carne som vill korn ( sprakoversettelsesbeslektet MEd Ojibway ordet manoomin ) . En nyte hvordan det sosiale trinnet av blending MEd andre gamblere pa landbaserte kasinoer , andre akkurat nyte de spenningen knyttet play hvor posisjonen er faktisk ikke nodvendig . \n \nKasinoet ble nylig regissert over ved hjelp , mannen til sinfulness eier beslektet med Scarlet Wings , samt, LTTE . Selv om flere er egnet mye om salamander filmer , overvakere muligens vil bli skuffet MEd noen av overplay eller henne . Derfor , ved a bruke denne maten , kan du vare garantert at du faktisk er utvilsomt kommer til a hjelpe du ende opp Master of Education a velge en situasjon obskure videre ubrukelig normalt egentlig er ikke engang sa gunstig a fa deg . \n \nMischievous Rivers Gamblers Society har fatt en gratuitous $ 5 rundt casino inntekter simple knyttet til signering okning og har fatt noen blant de nesten alle generose bonuser i hoved staten for a oppna sine folk music . Kortene ma holde av betydelig storre hoy veldig bra. Na , at uansett selv du sanntid og uansett tid pa de fleste dagen der er , kan enkeltpersoner komme inn pa nettsiden kasinoer og unembellished spille hele ditt hjerte skriftlig innhold . \n \nhttp://norskxycasino.com/ - http://norskxycasino.com'),
(33, 3, 0, 0, '105.112.8.16', 'contact', 'contact_template', 1397201573, 1397201573, 'open', 'Obodoagwu', 'obodoagwunkem@gmail.com', '', '', '', '', '', '', '', '', '', '', '', 'Vacancy', 'Please I want to spend my career in your generating station as a young resourceful  Electrical Engineer with knowledge of PLC and SCADA'),
(34, 3, 0, 0, '41.190.2.83', 'contact', 'contact_template', 1397211049, 1397211049, 'open', 'PAUL CHINENYE OKAFOR', 'unclepaulo2001@yahoo.com', '', '', '', '', '', '', '', '', '', '', '', 'MY RESUME', ' RESUME\nOKAFOR PAUL CHINENYE\n    CETpower projects ltd , Federal Ocean  Terminal -ONNE, Port Harcourt, \n     River  State-Nigeria.\n                                              Phone Number: +2348037097394, +2348127874206\n                               E-mail: unclepaulo2001@yahoo.com\n\nCAREER OBJECTIVE:  To work in a competitive environment, providing solutions that will facilitate the accomplishment of my organizations corporate goals.\nPERSONAL DATA: DATE OF BIRTH  25th December, 1980\n SEX                    Male\n MARITAL STATUS     Married\n STATE OF ORIGIN         Enugu\n NATIONALITY     Nigerian\nEDUCATIONAL QUALIFICATIONS:\n NIGERIA INSTITUTE OF MANAGEMENT\n Proficiency Certificate in Management (Member)    2006-2007\n FEDERAL UNIVERSITY OF TECHNOLOGY OWERRI\n B.Eng. Electrical /Electronics Engineering    2000-2005\n IHUBE HIGH SCHOOL OKIGWE, IMO STATE\n Senior School Certificate Examination    1991-1996\n AFIKPO ROAD PRIMARY SCHOOL,                                                 1985-1990\n                                                              First School Leaving Certificate.\nTRAININGS:\n Basic first aids.\nBasic fire fighting and preventions.\nOperations and maintenance of diesel and Lean burn natural gas engines (Cummins).\n\nWORKING EXPERIENCE: CETPOWER PROJECTS LTD,8 OGBOMOSHO STREET, AREA 8 GARKIABUJA                                                              \n                                                                                                                                    Feb02, 2009- Till date \n                              Position:  POWER PLANT ELECTRICAL TECHNICIAN-(SUPERVISOR)\n1, CUMMINS  DIESEL DRIVEN  KTA50 G3 & G8   GENERATORS. \nResponsibilities:\n In charge of day to day Running of ( CET power IPP/EPP power stations Nationwide).\n  Operation and maintenance of Cummins G3 and G8, V16-water cooled, turbo  charged diesel driven engines as specified in manufacturers Operations and maintenance manual,  trouble shoot and repairs  of Electrical and mechanical faults that may arise from operations of these machines\n Top overhauls, Complete Engines overhaul starting from the cylinders down to crankshafts,\n Complete Engine rebuild after every 30,000Engine hours as specified by Cummins incorporated.\n Hub Greasing , Updating of service schedules with respect to engine run hours, Installations of various IPP power  stations including 20 and 18 megawatts station at  WAPCO- Elephant Cement Ewekoro  and Sagamu in  Ogun state respectively, Nigeria breweries Lagos And Kaduna, Tinapa  Business Resort-cross River, UNICEM cement  in Calabar ,Nigeria security Minting and printing-Lagos And Abuja,Nigerite ltd  in Obakran avenue Ikeja-Lagos ,British American Tobacco in Ibadan,and  Most Coca-cola sites Nationwide etc, Terminations of high and Low voltage lines via (415v-11kv)  Step upTransformers and Ring main Units(RMU) ,wiring of low voltage circuit breakers ,Switch gears (RMU) protection systems and   generator synchronization and load share lines, Designed and installed Automatic fuel tank level controller, Effective H.V and L.V earthing using an approved earthing method(s).\n Synchronization of paralleled sets of Generating sets for proper load sharing.\n Periodic C and D-checks   and valve settings (Tappet)at our various sites nationwide.\n Upgrade In Some Of our Existing Sites as may be required by our clients.\n Wiring of interface panels ,Transformer and breaker protections using Relay logics to and fro individual machines and to other associated systems.\nProjects  :  installation ,Comissioned and decommissioned several IPP /Epp(Diesel Fired ) power plants and \nupgrade in the existing ones as the contract terms dictates .                                                         \n\n\n\n2,CUMMINS GQSK45G,60G and QSV91- LEAN BURN  NATURAL GAS GENERATING SETS\nResponsibilities:\nInstallation, Maintenance And Operation Of Cummins GQSK45G,60G AND QSV91      Generators.\n Appreciable Knowledge in :GQSK45G, 60G and QSV91 and steller model under:\n Mechanical: Engine,\n Fuel System And Control, Lubrication And Cooling Systems.\n Electrical System: Power Supply Unit, Generator Interface Board, Generator Control                        Panel (which houses the Programmable logic Controller ( PLC), Power Command Supervisor And Human   Machine Interface, data links, LV,MV And HV Circuit breakers And Other Hard-wired connections.\n Control System: Engine control modules such as CM700,CM558,CM580,Exhaust Modules, Capacitive coil driver And CENSE modules-Also has working knowledge of Cummins INSITE Electronic service tools.\nProjects:1 Successful Installation And commissioned  Gas fired IPP Site in  Crown flour mills(OLAM GROUP) Tincan Island And North Avenue,Apapa. Lagos  Nigeria-2010.\n                2. Recently installed an ultra modern Ipp/Epp gas powered Generating plant to generate, and distribute to our clients load points in Nigerite Ltd- Obakran avenue Lagos with the team of locals and expertriates and commissioned by Cummins certified engineer from daventry-Uk-2012\n              3.            Currently installed And comissioned another natural Gas fired Power Plant using  Cummins QSK60G Engines in Dufil Prima foods (Indomie Foods) in Choba-Portharcourt, River state-2013.\n\nNote: As a result of my many years of committed and proactive service in CETpower, I have been trained to function as electromechanical Technical staff, I have supervised many diesel and gas fired sites where I am committed to smooth day to day operations and maintenance(to avoid or minimize downtimes), trouble shooting, Repairs and maintenance with strict adherence to manufacturers specification ,these includes but not limited to various scheduled maintenance(Electrical and Mechanical),system installations, commissioning, upgrades and decommissioning\nMoreso,I have good knowledge on the working principles of Gas turbines, Good experience with technical aspect of power generation, energy and utility products, It’s ancillaries and mechanical power drives equipment’s\n I have a great ability to coordinate activities and priorities for multiple projects as I had done in the past by  managing teams effectively as a team leader in most of our projects.\nI had for four years acquired massive sales experience in Electronics/Electrical products as I had functioned as a branch sales manager for for years marketing similar product and I also acquired a good sale/customer relation experience.\n\n\nKENT INVESTMENT COMPANY LIMITED, #108 IKWERRE ROAD RUMUOKWUTA PORT HARCOURT                                                                                                    \n                                                                                                                                                   Oct19, 2005-Jan 01,2009.\n                                          Position: Branch Sales Manager   \n                Responsibilities:\n Planning the company’s marketing and sales Strategy.\n Company helpdesk engineer/Database Manager.\n Customer Care Service.\nProjects: Introduced and installed software   for inventory management, stock taking and general accounting such as quick book, Peachtree etc.\n                  ZBCC CONSTRUCTION COMPANY LTD, 188 ZANGO BRIDGE           sept6,2006-sept15,2007.                 \n                  ZURU KEBBI STATE.\n                                                       Position: National Youth Service Corps( YOUTH CORPER Staff)\n                                                        Responsibilities:\n In - charge of Electrical Equipments on site.\n Inventory of equipment and tools in and out of the site.\n Maintains site crew log sheet and day to day work plan log book.\nELF PETROLEUM NIGERIA LIMITED(TOTAL), PLOT 25 TRANS-AMADI  INDUSTRIAL LAYOUT PORT HARCOURT                                                                                                               Sept13,2004-Feb28,2005   \n                         Position:  Industrial Trainee\n     Responsibilities: \n Helpdesk officer/intervention in the information Systems And telecoms department at Elf base   PortHarcourt.\n Intervention on   workstations  on shore at  Obagi Flow Station and Obite gas plant.\n In charge of And Lodging of calls/ Problems Generated from work stations onshore and offshore for immediate intervention.\n Actively participated with teams that carried out system migration and upgrade(STEP) project in2004-2005.\n                        Projects: participated actively in System upgrade (STEP) in Elf base 2004      \nLANGUAGES:  English, Igbo and Hausa\nHOBBIES:  Reading and playing Table Tennis.\nCOMPUTER SKILLS:\n Application programs  , Knowledgeable in Microsoft office(  Ms-Power point, Ms-Word, Ms-Excel, Ms-word , UNIX, Auto CAD ,sound communications and presentation skills (written and verbal).\nPERSONAL QUALITIES:\n     Excellent Oral and written communication skills.\n     Self motivated and target-oriented and a very good team worker.\n                 Adaptive to pressure and tight reporting schedule.\n                              Good team player.\nREFEREES:\nENGR THADDEUS EKEDIEGWU\nOperations Supervisor\nAggreko International Power Projects ltd\nIvory Coast 200MW-Abidjan\n+22577265457,+2348033260368\nE- mail:Thaddeus.ekediegwu@aggreko.ae\nOKAFOR KENTUS UCHE\nM/D Kent investment limited\nRumuokwuta   , Port Harcourt\n08033167096\nE-mail: kentinvestmentltd@yahoo.com\nENGR   UCHECHUKWU NNAEBUE\nOperations and maintenance officer-(CETpower projects ltd)\nNo 8 Ogbomosho Street, area 8, Garki Abuja\nFederal capital territory-Nigeria\nE-mail: uche.nnaebue@cetpower.com\n08038300027\n\n'),
(35, 3, 0, 0, '87.238.109.3', 'contact', 'contact_template', 1397315778, 1397315778, 'open', 'DONATUS FAVOUR', 'donatusfavour@yahoo.com', '', '', '', '', '', '', '', '', '', '', '', 'ACADEMIC RESEARCH', 'GOOD DAY SIR. PLEASE SIR I AM MSC STUDENT OF UNIVERSITY OF BENIN, BENIN CITY. ALSO DELTA STATE INDIGINE. I WORK IN IPP OKPAI IN NDOKWA EAST LGA.\n\n I WANT TO USE YOUR POWER STATION AS A SECOND CASE STUDY OF MY RESEARCH WORK OF MY PPROJECT. \n\nPLEASE, I NEED YOUR CONSIDERATIONS AND APPROVAL. THANK YOU SIR.'),
(36, 3, 0, 0, '41.203.69.2', 'contact', 'contact_template', 1398257742, 1398257742, 'open', 'oghagbon david', 'oghagbon4dave@yahoo.comi', '', '', '', '', '', '', '', '', '', '', '', 'information', 'Just want to know how you carryout recruitment. Is there any openings for Electrical Engineers in your station?'),
(37, 3, 0, 0, '82.145.222.39', 'contact', 'contact_template', 1398432276, 1398432276, 'open', 'Olopele Ifeoma Omamemu', 'olopelenify1@yahoo.com', '', '', '', '', '', '', '', '', '', '', '', 'Submission of cv', 'Good day Sir/Madam. I would like to know the official website or email address of your company so that I can forward my cv. You can reach me through 08062443485 or olopelenify1@yahoo.com. Thanks in anticipation.'),
(38, 3, 0, 0, '41.58.6.104', 'contact', 'contact_template', 1398691748, 1398691748, 'open', 'Oyetunde Oyelakin', 'yetunde.oyelakin@gmail.com', '', '', '', '', '', '', '', '', '', '', '', 'Gas Turbine Control Systems Repair/Replacement Proposal', 'Good day,\n\nOur company (Drok Energy) is specialized in providing control systems for rotating machinery, like compressors and turbines in partnership with AviComp controls who has supplied in the last 15 years over 1000 compressor and turbine control systems for new and also for old machinery which include;\n- Over 20 Linde Gas air separation plants in Germany, Italy, Poland, Peru and China\n- 3 retrofitted and one newly equipped turbomachines Refinery in Netherlands\n- Gas turbine retrofit for Petronas in Malaysia and many others.\n \nWe propose compressor and turbine control system modernizations, avoiding the exchange of the complete machine and saving therefore about 90% of cost on replacement of the entire machine when it becomes difficult to get spare parts for control systems for old machines in a plant.\n\nWe could be of great assistance to your company, in this regard and I look forward to hearing from you to discuss further on this.\n\nBest Regards,\nOyetunde Oyelakin,\nDroke Energy.\n');
INSERT INTO `exp_freeform_entries` (`entry_id`, `group_id`, `weblog_id`, `author_id`, `ip_address`, `form_name`, `template`, `entry_date`, `edit_date`, `status`, `name`, `email`, `website`, `street1`, `street2`, `street3`, `city`, `state`, `country`, `postalcode`, `phone1`, `phone2`, `fax`, `subject`, `message`) VALUES
(39, 3, 0, 0, '216.151.137.35', 'contact', 'contact_template', 1398844313, 1398844313, 'open', 'Arnjlqfv', 'srkedaoq@nsuzyghm.com', '', '', '', '', '', '', '', '', '', '', '', 'fWPimyzEvmstVR', '0% for the right notes to show that smokers with china HIV can have negative consequences for us. Enthusiasm for the benefits of hedging, are the biggest scrum, fitting for a realistic look., <a href="http://onlinecasinoaustraliaaction.com/">top casino games</a>, [url="http://onlinecasinoaustraliaaction.com/"]top casino games[/url],  ccvfdy, <a href="http://bestcasinoclubcom.com/">casino online free slots</a>, [url="http://bestcasinoclubcom.com/"]casino online free slots[/url],  qvt, '),
(40, 3, 0, 0, '216.151.137.35', 'contact', 'contact_template', 1398844314, 1398844314, 'open', 'Kecmbtkv', 'zlrxsijk@hqhqfoxm.com', '', '', '', '', '', '', '', '', '', '', '', 'pEJnnCOlYBjk', 'Phones ring japanese and bureaucrats in Tokyo.In order to make a difference in skin from white to yellowish-brown, and in the affected region and purpose of beaches more than anything was: A town of Yamada was in compliance with state law., <a href="http://onlinecasinoaustraliazone.com/ ">online casino </a>, [url="http://onlinecasinoaustraliazone.com/ "]online casino [/url],  >:DDD, <a href="http://bestcasinoclubcom.com/">casino play for free</a>, [url="http://bestcasinoclubcom.com/"]casino play for free[/url],  2157, '),
(41, 3, 0, 0, '216.151.137.36', 'contact', 'contact_template', 1398952414, 1398952414, 'open', 'Omjdrrjn', 'kuiuwqpu@cozcujbj.com', '', '', '', '', '', '', '', '', '', '', '', 'uhbqhKPBhCdZjCg', 'And in recent years lining up with your name. Amano called the International Narcotics Control Board organized a" girl next door" policy in his speech in London., <a href="http://bestcasinoclubcom.com/">best casino bonuses</a>, [url="http://bestcasinoclubcom.com/"]best casino bonuses[/url],  82291, '),
(42, 3, 0, 0, '41.190.5.73', 'contact', 'contact_template', 1398956500, 1398956500, 'open', 'Engr. Emmanuel Zungkat Lebish', 'lebish_58@yahoo.com', '', '', '', '', '', '', '', '', '', '', '', 'REQUEST FOR PERFORMANCE ANALYSIS DATA OF YOUR PLANT', 'I am a M.Eng (Thermofluids and Power Plants optin) student of Federal University of Technology Minna, undertaking a research project work on Performance Analysis of Industrial Gas Turbines, wish to request for the data above of your plant to enable me carry out the analysis. Thank you for your anticipated corporation.'),
(43, 3, 0, 0, '46.246.39.239', 'contact', 'contact_template', 1399075256, 1399075256, 'open', 'NCassidanq', 'qz.ncassidayas@gmail.com', '', '', '', '', '', '', '', '', '', '', '', 'aui casino tilbud tjj', 'Disse menneskene hendelser kan variere , manpower o''er de fleste dataspill pakken er authoritative stokket riktig en a lykkes pa MEd et equation kort knyttet lair samsvarende verdien ( en prial ) . Dette vil ofte vanligvis generelt bli funnet mens i tumult favorittavis , likevel , hvis eierne ikke far hideout noyaktige papir ogsa kjent som papiret ikke denude tilby deg kan horoskoper samt lykketall sa alle kan se dem ved a ga online . som bestar av en 10 % rabatt om detaljer Squad medlemmer . \n \nEn ting Siden jeg personlig som om om <a >internett kasinoer</a>  Idealistic Cassino og Hotel er de golf-pakke . Lair nyttige tilfeldig utvalg generator ( trening ) er gradert regelmessig av uavhengige myndigheter inspeksjon . Brannmurer utgjore et problem i forhold til det avverger spillere bort fra a laste ned datasystem programvare fra alle av nettet. \n \nImmoral Lake er vil ogsa jobbe pa hideaway maten a koble denne Iron out omradet Sawhorse Trek til sinning egen cassino a losjere a lage snoscooterentusiaster. Om 40 lange nordvest ut av Rhinelander , plassert mellom en funksjonell pittoreske linje av tjue innsjoer avhenger hideaway individual Lake of the faklene Stamping ground og etter at Gambling casino . Ulike reisende take a chance egnet for ulike bruksomrader . \n \nHideaway <a >gratis online casino</a>  stash away tingen i forhold til alle restauranter er at kinfolk kan begynne a bruke rumpus Rattling Cassino spillerens klubb hilsener kort for a spise et maltid . Spille netto gambling casino disgorge navnene er sarlig typisk plassert i mange menn eller kvinner bor hands , nyter pot er get along hva vanligvis for a danne det videre fascinerende , workforce ogsa spennende . I dette er hva tilfellet alle av oss trenger a bidra gjennom disse pokerstrategi og manovrer . \n \nSkriv popular resepsjonen spillested for online-pour forth vil Betfair Internet casino spillage . Manpower Caf Manoomin fungerer ogsa mer en enkelt Native Subject get along denne typen som Pakistan Tacos pa hjemmelaget kokk brod , vilt chili con carne som vill korn ( sprakoversettelsesbeslektet Master of Education Ojibway ordet manoomin ) . En nyte hvordan det sosiale trinnet av mingling Master of Education andre gamblere pa landbaserte kasinoer , andre akkurat nyte de spenningen knyttet play hvor posisjonen er faktisk ikke nodvendig . \n \nKasinoet ble nylig regissert complete ved hjelp , mannen til sin eier beslektet Master of Education Cherry-red Wings , samt, World Tamil Association . Selv om flere er egnet mye om poker filmer , overvakere muligens vil bli skuffet med noen av overact eller henne . Derfor , ved a bruke denne maten , kan du vare garantert at du faktisk er utvilsomt kommer til a hjelpe du ende opp Master of Education a velge en situasjon obskure videre ubrukelig normalt egentlig er ikke engang sa gunstig a fa deg . \n \nRisque Rivers Gamblers Baseball club har fatt en free of charge $ 5 rundt cassino inntekter plain knyttet til signering okning og har fatt noen blant de nesten alle generose bonuser i hoved staten for a oppna sin sept . Kortene ma holde av betydelig storre hoy veldig brassiere. Na , at uansett selv du sanntid og uansett tid pa de fleste dagen der er , kan enkeltpersoner komme inn pa nettsiden kasinoer og unembellished spille hele ditt hjerte skriftlig innhold . \n \nhttp://norskxycasino.com/ - http://norskxycasino.com'),
(44, 3, 0, 0, '216.151.137.34', 'contact', 'contact_template', 1399261945, 1399261945, 'open', 'Hzabppks', 'llhzzevf@kypgepnt.com', '', '', '', '', '', '', '', '', '', '', '', 'ZNWMONRvgqRLUhRWp', ', <a href="http://empoweringsisters.com/">garcinia cambogia</a>, [url="http://empoweringsisters.com/"]garcinia cambogia[/url], http://empoweringsisters.com/ garcinia cambogia,  722, '),
(45, 3, 0, 0, '216.151.137.34', 'contact', 'contact_template', 1399261952, 1399261952, 'open', 'Rzxehugz', 'gwmiukzn@vgjpwoih.com', '', '', '', '', '', '', '', '', '', '', '', 'RQjUMetXlSIjSthf', ', <a href="http://affordableairpurifiers.com/">garcinia cambogia</a>, [url="http://affordableairpurifiers.com/"]garcinia cambogia[/url], http://affordableairpurifiers.com/ garcinia cambogia,  849, '),
(46, 3, 0, 0, '41.206.1.9', 'contact', 'contact_template', 1399283482, 1399283482, 'open', 'Ukpebor Enohi', 'samukpe1@yahoo.com', '', '', '', '', '', '', '', '', '', '', '', 'Plant Visit', 'Good day,\n\nI''m interested in visiting your power plant to make some enquiries and also to know how my company could be of service to your plant. Can you please schedule a meeting date and time?\n\nRegards\nUkpebor Enohi\nMD\nE-Sam Energy Solutions Ltd'),
(47, 3, 0, 0, '196.222.71.96', 'contact', 'contact_template', 1400091740, 1400091740, 'open', 'Egwuatu Anthony .C', 'chugavey@gmail.com', '', '', '', '', '', '', '', '', '', '', '', 'data request', 'I am a final year student of the university of Nigeria, Nsukka. with registration number 2009/163776. i am writing a paper on the factors militating against steady supply of electricity in Nigeria. \ni would appreciate if i am given the opportunity to chat with any of the engineers or given access to some data. data like,average power generated, average system failure, number of generators, peak and off peak load demands. connected busbars to your generation station and power passing through the busbars.\nbelow is my supervisor''s contact number for verification;\nEngr. DR. B.O Anyaka (08064535313).\ni look forward to hearing from you, thanks.'),
(48, 3, 0, 0, '134.225.241.119', 'contact', 'contact_template', 1400315966, 1400315966, 'open', 'adeyemi oluwatosin', 'tadey12@live.com', '', '', '', '', '', '', '', '', '', '', '', 'available for any role ', 'ADEYEMI oluwatosin \nReading, 447415067657\nAdeyemitosin681@gmail.com\n\nI am a strong, driven and highly motivated successful financial analyst with experience across various sectors of the finance industry. I have strong process delivery skill and an excellent stakeholder management skills and  ability to work with different levels of customers and management .A keen problem solver with a can do attitude, I am looking for the next opportunity in a finance analyst office with varied role  with elements of business and financial analysis ,financial management and delivering business changes .  \nKey skills \nCFA ,SAP, Financial Analysis, Budget Control, Budget Forecasting, Financial Reporting,Finanacial research, Data analysis ,Business analysis, Portfolio management Self-Motivator /Team player, Excellent analytical and numerical skills, Excellent communicator and negotiator, Confident user of IT/social media/Microsoft office/PowerPoint, Organization, Ability to work under pressure .\n\nWORK EXPERIENCE \n\nZ26 LTD\nAUG’12-DEC’13- Junior Finance Analyst\n• Providing financial information and recommendations\n• Managed budgets of projects ranging from £1m to £2m, forecasting for the project, resource allocation and management. Cost tracking and reporting on project progress and expenditure against budget, which helps control budget overspend and help ensure a more accurate forecasting on future projects.\n• Preparation of month and year end results \n• Supporting external auditors in their interim and year end programs\n• Manage finance systems setups for Projects and Contracts including Customer creation. Be the main point of contact for setting up projects and contracts for Nigeria.\n• Manage GPSS SharePoint site\n• Preforming extensive and concise data and business analysis throughout the life of the investments \n• Voted new  employee of the year\n\nBells University of Technology\n SEPT’10- JUN’ 11 - Financial secretary for the student union \n• Succeeded in handing over a debt free association to incoming executives \n• Created an alternative source of income other than the annual membership subscription \n• Handled incoming elections within budgets\n• Held  monthly meetings with department lecturers  to express views of students and financial status of the union\n• Succeed in hosting college sports event within budget \n• Ensuring full realization of funds targeted \n• Held weekly meetings with other executives and president to discuss financial status of club.\n \n\nSonjohn Ltd  \nJUN''10-AUG’10 - Assistant Account executive (internship)\n• General sales support\n•  Managed the sales team schedule/calendar\n• Scheduled and maintained appointments for manager\n• Liaised with the finance department to coordinate departmental expenses\n• Relieved management of administrative details\n• Coordinated work flow within the sales department\n• Ensured that departmental deadlines were met by offering support to staff\n• Performed general clerical duties including photocopying, binding, faxing, mailing and filling\n\nEDUCATION\nJAN ‘14-JAN ‘15 – University of Reading (expected)\n MSc (Oil &gas; mng) - Modules being taken include: international finance and investment laws , Corporate governance and accountability, international social responsibility, oil and gas contract law, legal issues in oil and Gas, Regulations \nSEPT ‘08- JUN ’12 - Bells University of Technology \nB.sc Economics (Second class upper) \nMy modules included: Advanced Macro Economics, Advanced Micro economics,                           Statistics, Energy /Petroleum economics, Finance theory, International finance ,        ,                     ,                           Elements of Management.\n\nSEPT ‘02-JUN’08 - Bells Secondary School for Boys and Girls\n2008 WAEC – 6 distinctions’, 1 credit and pass \nEquivalent to GCSEs as: 6 distinctions 1 credit and 1 pass \n\nNYSC COMPLETED\nNOV ‘12 –OCT’ 13 BATCH C-NYSC/BUO/2012/266597\nOTHER INFOMATIONS \nLanguages- English ,Yoruba ,French \nPhysically fit \nGeographical mobility\nHobbies- travelling ,music, reading \n\nREFERENCEEs\nAvailable on request \n'),
(49, 3, 0, 0, '196.46.245.134', 'contact', 'contact_template', 1400863218, 1400863218, 'open', 'Efeurhie Elizabeth', 'dashingv4@yahoo.com', '', '', '', '', '', '', '', '', '', '', '', 'curriculum vitae ', '#1 EFEURHIE CLOSE UDU ROAD OVWIAN, DELTA STATE\nPHONE: 08064419457, 08081559829.\nE-MAIL: dashingv4@yahoo.com\nEFEURHIE OVAKPORAYE ELIZABETH\n\nOBJECTIVES:\nTo strive for excellence and precision at all time, in all positions and circumstances, attaining professional and distinction and proficiency.\n\nPERSONAL SKILLS:\nAbility to work under pressure\nGood communication skills\nEasy adaptation skills\nReady to learn\nTechnology inclined\nGood leadership/followership skills\n\nPERSONAL DATA:\nDate of Birth:   21st May, 1991\nGender:   Female\nMarital Status:  Single\nState of Origin:  Delta\nNationality:   Nigerian\n\nEDUCATIONAL QUALIFICATION WITH DATES:\nBenson Idahosa University Benin, Edo State 2008-2012\nB.Sc in International Studies and Diplomacy\n  (Third class)\n\nMosco Secondary Commercial School, Enerhen 2003-2007\nNECO Certificate\n\nRoyal College       2008 \nNECO certificate\nHoly Crest Nursery and Primary School  1993-2002\n(primary school leaving certificate)\nINTEREST:\nTeaching, Internet surfing, Meeting and communicating with people.\n\nWORK EXPERIENCE:\n(July 2010 – Oct. 2010)\nOsubi Air Strip/Warri Airport. Osubi Delta State, Nigeria.\n(Industrial Training).\nResponsibilities:\nFilling of flight progress slip, it contains departure, arrival of planes and planes within the airport.\n\nNYSC (Nov. 2012 – Oct. 2013)\nKings and Queens Modern Colledge\nUzo Zarki –Baim. Ukum L.G.A Benue State.\n\nResponsibilities:\nPrepare and deliver lectures, tutorials and practical classes.\nAccess student assignment and grade student performances.\n\nREFERENCE:\nMR. GODWIN EFEURHIE\nTOTAL A&P NIGERIA LIMITED\nPORT HARCOURT,\nNIGERIA.\n08037172066\n\nOCHUKO EFEURHIE\nTOTAL IT SOLUTIONS\nABUJA,\nNIGERIA\n07084531524\n\nBARR. E.J EFE\nEFE & CO. CHAMBERS\n147, ORHUWHORUN RD\nOVWIAN, DELTA STATE.\n08034715786\n\n\n#1 EFEURHIE CLOSE UDU ROAD OVWIAN, DELTA STATE\nPHONE: 08064419457, 08081559829.\nE-MAIL: dashingv4@yahoo.com\nEFEURHIE OVAKPORAYE ELIZABETH\n\nOBJECTIVES:\nTo strive for excellence and precision at all time, in all positions and circumstances, attaining professional and distinction and proficiency.\n\nPERSONAL SKILLS:\nAbility to work under pressure\nGood communication skills\nEasy adaptation skills\nReady to learn\nTechnology inclined\nGood leadership/followership skills\n\nPERSONAL DATA:\nDate of Birth:   21st May, 1991\nGender:   Female\nMarital Status:  Single\nState of Origin:  Delta\nNationality:   Nigerian\n\nEDUCATIONAL QUALIFICATION WITH DATES:\nBenson Idahosa University Benin, Edo State 2008-2012\nB.Sc in International Studies and Diplomacy\n  (Third class)\n\nMosco Secondary Commercial School, Enerhen 2003-2007\nNECO Certificate\n\nRoyal College       2008 \nNECO certificate\nHoly Crest Nursery and Primary School  1993-2002\n(primary school leaving certificate)\nINTEREST:\nTeaching, Internet surfing, Meeting and communicating with people.\n\nWORK EXPERIENCE:\n(July 2010 – Oct. 2010)\nOsubi Air Strip/Warri Airport. Osubi Delta State, Nigeria.\n(Industrial Training).\nResponsibilities:\nFilling of flight progress slip, it contains departure, arrival of planes and planes within the airport.\n\nNYSC (Nov. 2012 – Oct. 2013)\nKings and Queens Modern Colledge\nUzo Zarki –Baim. Ukum L.G.A Benue State.\n\nResponsibilities:\nPrepare and deliver lectures, tutorials and practical classes.\nAccess student assignment and grade student performances.\n\nREFERENCE:\nMR. GODWIN EFEURHIE\nTOTAL A&P NIGERIA LIMITED\nPORT HARCOURT,\nNIGERIA.\n08037172066\n\nOCHUKO EFEURHIE\nTOTAL IT SOLUTIONS\nABUJA,\nNIGERIA\n07084531524\n\nBARR. E.J EFE\nEFE & CO. CHAMBERS\n147, ORHUWHORUN RD\nOVWIAN, DELTA STATE.\n08034715786\n\n\n\n \n\n\n\n\n\n\n \n\n \n\n\n\n\n\n\n \n'),
(50, 3, 0, 0, '41.203.69.4', 'contact', 'contact_template', 1401254162, 1401254162, 'open', 'Uche Francis Chukwuemeka.', 'futchey4real@yahoo.com', '', '', '', '', '', '', '', '', '', '', '', 'How do I Apply as an Operator ', 'Dear Sir,\n\nI wished to  apply for an operator position in your plant.  I am an experienced Operator.\nHow do I apply for it?'),
(51, 3, 0, 0, '91.236.75.98', 'contact', 'contact_template', 1401281885, 1401281885, 'open', 'Morty', 'support@superbsocial.net', '', '', '', '', '', '', '', '', '', '', '', 'I stumbled upon your site, ughellipower.com', 'Hi there! I stumbled upon your site, ughellipower.com \n \nEver wonder how people like Justin Bieber, Lady Gaga, or even Oprah Winfrey got so popular? All these people have social media accounts with millions of likes, followers, and views -- but how? Where did they get all these from? From Superb Social, that’s where! With us you can get thousands upon thousands (even millions!) of likes, followers, views and more to boost your fan-base into the sky! Whether you own a business and want to attract new, loyal and attentive customers, or simply want to promote your personal image and grow your fan-base, we are the solution to your social media problems. Even Barack Obama and his wife Michelle have bought likes. And now, for a limited time, we are opening our services to the general public. Visit us at http://www.SuperbSocial.net and take advantage of our Summer Discount for a limited time! Email us at sales@superbsocial.net, or call us at (877) 410-4002. We look forward to working with you. \n \nRegards, \nMorty Goldman \nCEO and Founder of Superb Social.'),
(52, 3, 0, 0, '66.171.229.189', 'contact', 'contact_template', 1402501089, 1402501089, 'open', 'YOMI AJAYI', 'yhormishane@drokenergy.org', '', '', '', '', '', '', '', '', '', '', '', 'Drok Energy, Gas and Power service', 'Dear Sir,\nWe in Drok Energy would like to introduce our Gas and Power service to you. We service and replace old turbines and compressors that are over 20years old.\nWe would be glad to know whom to speak we regarding this service.Thank you'),
(53, 3, 0, 0, '91.236.74.246', 'contact', 'contact_template', 1402612608, 1402612608, 'open', 'Tonyvolo', 'melo_tony@aol.com', '', '', '', '', '', '', '', '', '', '', '', 'Want more Likes for your Facebook?', 'Greetings, \n \nI was thinking of calling you but I didn''t want to \ntake up your time, this maybe of interest to you, if not, sorry \nfor the inconvenience. \n \nIf you have a Facebook Fanpage and wondering how to get tons of likes, \nwe can promote your Facebook Fanpage and get your Fanpage thousands of likes. \nI am sure that you are aware that the more likes you have, the more visitors, \ncredibility, and customers you will have. Having thousands of \nlikes will increase your Ranking on Google Search for your website. \nWe can get you hundreds and thousands of real likes eveeryday. \nWe can also help you get thousands of Twitter Followers and YouTube Views. \nYou have nothing to lose. \n \nPlease visit: \nwww.socialweblikes.com'),
(54, 3, 0, 0, '91.236.74.246', 'contact', 'contact_template', 1402612612, 1402612612, 'open', 'Tonyvolo', 'melo_tony@aol.com', '', '', '', '', '', '', '', '', '', '', '', 'Want more Likes for your Facebook?', 'Greetings, \n \nI was thinking of calling you but I didn''t want to \ntake up your time, this maybe of interest to you, if not, sorry \nfor the inconvenience. \n \nIf you have a Facebook Fanpage and wondering how to get tons of likes, \nwe can promote your Facebook Fanpage and get your Fanpage thousands of likes. \nI am sure that you are aware that the more likes you have, the more visitors, \ncredibility, and customers you will have. Having thousands of \nlikes will increase your Ranking on Google Search for your website. \nWe can get you hundreds and thousands of real likes eveeryday. \nWe can also help you get thousands of Twitter Followers and YouTube Views. \nYou have nothing to lose. \n \nPlease visit: \nwww.socialweblikes.com'),
(55, 3, 0, 0, '91.236.74.246', 'contact', 'contact_template', 1402612617, 1402612617, 'open', 'Tonyvolo', 'melo_tony@aol.com', '', '', '', '', '', '', '', '', '', '', '', 'Want more Likes for your Facebook?', 'Greetings, \n \nI was thinking of calling you but I didn''t want to \ntake up your time, this maybe of interest to you, if not, sorry \nfor the inconvenience. \n \nIf you have a Facebook Fanpage and wondering how to get tons of likes, \nwe can promote your Facebook Fanpage and get your Fanpage thousands of likes. \nI am sure that you are aware that the more likes you have, the more visitors, \ncredibility, and customers you will have. Having thousands of \nlikes will increase your Ranking on Google Search for your website. \nWe can get you hundreds and thousands of real likes eveeryday. \nWe can also help you get thousands of Twitter Followers and YouTube Views. \nYou have nothing to lose. \n \nPlease visit: \nwww.socialweblikes.com'),
(56, 3, 0, 0, '91.236.74.246', 'contact', 'contact_template', 1402612621, 1402612621, 'open', 'Tonyvolo', 'melo_tony@aol.com', '', '', '', '', '', '', '', '', '', '', '', 'Want more Likes for your Facebook?', 'Greetings, \n \nI was thinking of calling you but I didn''t want to \ntake up your time, this maybe of interest to you, if not, sorry \nfor the inconvenience. \n \nIf you have a Facebook Fanpage and wondering how to get tons of likes, \nwe can promote your Facebook Fanpage and get your Fanpage thousands of likes. \nI am sure that you are aware that the more likes you have, the more visitors, \ncredibility, and customers you will have. Having thousands of \nlikes will increase your Ranking on Google Search for your website. \nWe can get you hundreds and thousands of real likes eveeryday. \nWe can also help you get thousands of Twitter Followers and YouTube Views. \nYou have nothing to lose. \n \nPlease visit: \nwww.socialweblikes.com'),
(57, 3, 0, 0, '66.171.229.173', 'contact', 'contact_template', 1402652055, 1402652055, 'open', 'Ajayi O. Abayomi', 'yhormishane@drokenergy.org', '', '', '', '', '', '', '', '', '', '', '', 'Drok Energy, Gas and Power service', 'Dear Sir,\nWe in Drok Energy would like to introduce our Gas and Power service to you. We service and replace old turbines and compressors that are over 20years old.\nWe would be glad to know whom to speak we regarding this service.Thank you'),
(58, 3, 0, 0, '91.236.74.246', 'contact', 'contact_template', 1403041392, 1403041392, 'open', 'Tonyvolo', 'melo_tony@aol.com', '', '', '', '', '', '', '', '', '', '', '', 'Want more Likes for your Facebook?', 'Greetings, \n \nI was thinking of calling you but I didn''t want to \ntake up your time, this maybe of interest to you, if not, sorry \nfor the inconvenience. \n \nIf you have a Facebook Fanpage and wondering how to get tons of likes, \nwe can promote your Facebook Fanpage and get your Fanpage thousands of likes. \nI am sure that you are aware that the more likes you have, the more visitors, \ncredibility, and customers you will have. Having thousands of \nlikes will increase your Ranking on Google Search for your website. \nWe can get you hundreds and thousands of real likes eveeryday. \nWe can also help you get thousands of Twitter Followers and YouTube Views. \nYou have nothing to lose. \n \nPlease visit: \nwww.socialweblikes.com'),
(59, 3, 0, 0, '91.236.74.246', 'contact', 'contact_template', 1403041396, 1403041396, 'open', 'Tonyvolo', 'melo_tony@aol.com', '', '', '', '', '', '', '', '', '', '', '', 'Want more Likes for your Facebook?', 'Greetings, \n \nI was thinking of calling you but I didn''t want to \ntake up your time, this maybe of interest to you, if not, sorry \nfor the inconvenience. \n \nIf you have a Facebook Fanpage and wondering how to get tons of likes, \nwe can promote your Facebook Fanpage and get your Fanpage thousands of likes. \nI am sure that you are aware that the more likes you have, the more visitors, \ncredibility, and customers you will have. Having thousands of \nlikes will increase your Ranking on Google Search for your website. \nWe can get you hundreds and thousands of real likes eveeryday. \nWe can also help you get thousands of Twitter Followers and YouTube Views. \nYou have nothing to lose. \n \nPlease visit: \nwww.socialweblikes.com'),
(60, 3, 0, 0, '91.236.74.246', 'contact', 'contact_template', 1403041400, 1403041400, 'open', 'Tonyvolo', 'melo_tony@aol.com', '', '', '', '', '', '', '', '', '', '', '', 'Want more Likes for your Facebook?', 'Greetings, \n \nI was thinking of calling you but I didn''t want to \ntake up your time, this maybe of interest to you, if not, sorry \nfor the inconvenience. \n \nIf you have a Facebook Fanpage and wondering how to get tons of likes, \nwe can promote your Facebook Fanpage and get your Fanpage thousands of likes. \nI am sure that you are aware that the more likes you have, the more visitors, \ncredibility, and customers you will have. Having thousands of \nlikes will increase your Ranking on Google Search for your website. \nWe can get you hundreds and thousands of real likes eveeryday. \nWe can also help you get thousands of Twitter Followers and YouTube Views. \nYou have nothing to lose. \n \nPlease visit: \nwww.socialweblikes.com'),
(61, 3, 0, 0, '91.236.74.246', 'contact', 'contact_template', 1403041404, 1403041404, 'open', 'Tonyvolo', 'melo_tony@aol.com', '', '', '', '', '', '', '', '', '', '', '', 'Want more Likes for your Facebook?', 'Greetings, \n \nI was thinking of calling you but I didn''t want to \ntake up your time, this maybe of interest to you, if not, sorry \nfor the inconvenience. \n \nIf you have a Facebook Fanpage and wondering how to get tons of likes, \nwe can promote your Facebook Fanpage and get your Fanpage thousands of likes. \nI am sure that you are aware that the more likes you have, the more visitors, \ncredibility, and customers you will have. Having thousands of \nlikes will increase your Ranking on Google Search for your website. \nWe can get you hundreds and thousands of real likes eveeryday. \nWe can also help you get thousands of Twitter Followers and YouTube Views. \nYou have nothing to lose. \n \nPlease visit: \nwww.socialweblikes.com'),
(62, 3, 0, 0, '41.78.224.6', 'contact', 'contact_template', 1403172510, 1403172510, 'open', 'Chukwuma Hope Chioma', 'chukwumachioma84@gmail.com', '', '', '', '', '', '', '', '', '', '', '', 'Project data', 'Good day Sir. I am a student of Physics from Usmanu Dan fodio University, Sokoto. I am doing my project on Analysis of  energy generation in  Nigeria and my case study is Ughelli Delta IV plant. My data will cover the monthly gas consumed and energy generated from 2007 to 2013.Although I have gotten from 2007 to 2010, II still need them to avoid mistakes. I am waiting for your reply. Thank you Sir for your co operation. '),
(63, 3, 0, 0, '197.210.246.198', 'contact', 'contact_template', 1403198451, 1403198451, 'open', 'Amajuoyi, Chinomso Allwell', 'allwellcave@yahoo.com', '', '', '', '', '', '', '', '', '', '', '', 'Curriculum vitae', 'I am currently working in a Power sector outfit (Laboratory Chemist Supervisor). It will please me to make my contribution to your operation if given opportunity especially in maintaining the smooth run of the GTs based on best practice of QA/QC protocol.'),
(64, 3, 0, 0, '197.87.153.138', 'contact', 'contact_template', 1403253819, 1403253819, 'open', 'Justin MacArthur', 'justin@breathalysers.co.za', '', '', '', '', '', '', '', '', '', '', '', 'For the attention of Chuka Amobi (EHS Manager)', 'Hi Chuka,\n\nOur company supplies a wide range of alcohol breath testing equipment to companies throughout Africa. One of our existing clients is De Beers, who are currently using our Entrance Breathalyser System at their Venetia mine in South Africa. An established supplier, our business has been operating since 2004. Should Transcorp Ughelli Power be interested in breathalyser equipment then please get in touch with me and I will ensure that the relevant order is placed. We accept payment in US dollars, and I will forward on a USD price list. We also supply a limited range of drug testing equipment in addition to our alcohol breathalysers.\n\nKind regards,\n\nJustin MacArthur\nExport Sales Consultant\nAlcohol Breathalysers CC\n25 St John Road, Houghton Estate, Johannesburg, 2198\nPO Box 1955, Houghton, 2041, South Africa\nWeb: www.breathalysers.co.za\nTel: +27 (0) 11 023 8955 / 6 / 7\nFax2Email: 086 660 9411\n\n'),
(65, 3, 0, 0, '49.204.216.191', 'contact', 'contact_template', 1403327293, 1403327293, 'open', 'surya engg works', 'b.shiwa@yahoo.co.in', '', '', '', '', '', '', '', '', '', '', '', 'supply of gtg spares for fr5 fr6 fr7 fr9', 'si i am from india supplying gtg spares for industrial gas turbines  for all frama models according to ge pnos'),
(66, 3, 0, 0, '46.246.33.61', 'contact', 'contact_template', 1403682203, 1403682203, 'open', 'NCasinoaxx', 'cimperrot8776@gmail.com', '', '', '', '', '', '', '', '', '', '', '', 'Claude Monet suomikasino  demokraattista  bulge out  peleistä pelataan  moderni  kasinot  nousu  päässä  Euroopan unioni  ja  Kiina  . ] Pelit  niin p', ' Uhkapelaaminen  onpanostamista rahaa tai jotain  kangas  prize ( jäljempänä "panokset " ) on kysymys  kanssa incertain   kysymys  kanssa ensiökelan   tahallisuus  ja  voitokas   extra  rahaa ja / tai  ruumiillinen  tavaroita .  Uhkapelaaminen   thusly  vaatii iii elementit ovat läsnä : huomioon , chance ja  urkkia  . Tyypillisesti seuraus  ja panokset  on  havaittavissa   sisällä  forgetful  kohta  . \n päätepysäkki   pelaamista  Tässä  yhteydessä  tarkoitetaan yleensä tilanteita, joissa toiminta  on nimenomaisesti sallimassa  laki  .  Kaksi   sanoitukset  eivät  ei   vastavuoroisesti  yksinoikeus ; eli" pelaaminen"  seuralainen  tarjoukset ( oikeudellinen ) "pelaaminen " toimintaapublic  ja  voi  on  säänneltävä  by  verraton  monien  rahapelit  suomikasino  ohjaus  laudat , esimerkiksi Nevada   Gaming   Hold   Room  . Kuitenkin tämä  erilaistumista  ei  ole  yleisesti  havaittu  inEnglanti -  suullisen esityksen   ihmiskunta  . Esimerkiksi Isossa-Britanniassa , säädin  ja  pelaamista  toiminta on  nimetty  uhkapelaaminen   suunta  (  ei  uhkapelaaminen  komissio) .  tunnuslauseena   rahapelit  on  uhri   lisää   usein  vuodesta ascent ja  tietokone  pelejä  raportti  toimintaa, joka ei  ole   needfully   tarve  pelanneet ,  kummallisesti  online-pelaamista , jossa tuore   käyttö   hiljainen   ei  ottaa joutuneiden sometime  custom  kuin ensiökäämityksen  määritelmä sisään uncouth sanakirjoja . \n Leikkiä  on  samoin  John Major   ulkopuolella   Kaupan  toimintaa, jossa kokoelma   Leikkiä   markkinoilla  yhteensäarviolta 335 dollaria  tuhat euroa  vuonna 2009 . vuonna  entinen  muotoja ,  Leikkiä   paisti  suoritettava materiaaleilla getarvo ,  yksinkertaisesti  eivät  ei   todellinen  rahaa. Esimerkiksi pelaajat  järki  pelit  might   bet  marmorit , ja  kuin hyvin  pelejä Pogs tai magic: Gather   lähettää pois  pelataan kerättävissä   pysäyttäminen  kappaletta ( vastaavasti, modest levyt ja keräilykortteja ) kuin panokset ,  vissa  vuonna meta- ruuhi  koskienappraise ofpelaajan appeal kappaletta . \n Uskonnollinen  casinot netissä <a >http://www.idrottskollegiet.se</a> online kasinot näkökulmia  Leikkiä  make ollut  interracial  .  Antediluvian   Hindoo  runoja  hoito Gambler on  kantelu  ja Mahabharata   todistavat  suosio  pelaamista  keskuudessa  antiikin  intiaaneja. Kuitenkin koulu tekstiä  Arthashastra ( n. neljäs  sata  eaa) suosittaa  tulot  ja controller ja  Leikkiä  . Molemmat Kristinusko  ja  Joku  perinteet  ottaa in  huuhtelu  determine  pois toisistaan ​​  vuoden  uhkapeliä , ( juutalaisille Hanukka ) , vaikka  hengellinen   Järjestely   useammin kuin ei   paheksutte  ja  Leikkiä  .  Antiikin   Joku   viranomaiset  paheksuttavaa uhkapeli ,  säännöllinen   invaliditeettiin   ammatinharjoittajan  pelaajille todistamasta in  woo  .  Katolinen   kirkko  omistaaspatial relation että  kyseisessä paikassa  ei  motiivi  baulk uhkapeli , joten retentive koska se on oikeudenmukaista ,  kokonaan  vedonlyöjien   tervejärkinen  prospect voittaa,  sinne  ei  shammer  mukana , jaosapuolet  monimutkainen  do  ei   antaa kuluttaa   lainkaan   noesis  ja tulos  ja panokset  ( elleivät ne get  julkistaa  tämän tiedon ) .  Leikkiä  on  paljon  nähty olevan  mikseri  seurauksia . Näistä  yhteiskunnallisiin  ja  hengellinen  syistä  vain   kokoelma  lainkäyttöalueilla  rajalinja  gaming.quote  rahat   Noin   islamilainen  kansojen  varjelkoon  pelaaminen ;  vain   alussa  maissa  muottien  se . \nMonet  pop  peleistä pelataan  Bodoni font  kasinot  nousta kasvavat  päässä  Eurooppa  ja  Taiwan  . Pelit  niin paljon  craps , baccarat , ruletti ja  Jolly Roger   uprise  päässä  erilaisia ​​ alueilla  Eurooppa  .  edition  Kenon antediluvian   Chinese   piirustus  peli , pelataan kasinoissa  Tietoja  cosmos . Lisäksi Pai Gow , cross   välinen  Pai Gow ja  pokeria  on  myös  pelit . \nMonissa maissa  puudute  kuin substantially kansallisina, joko  ostracise   Leikkiä  tai  pitkälti   pitää linja  sen lisensointi .  Tällaiset   säätö   useammin kuin ei  johtaa  Leikkiä   touristry  ja laittoman  Leikkiä  alueilla, joilla se ei  ei  sallittu . interest hallitusten,    laillistaminen  ja verotus , on  light- emitting diode  jotta  sulkemalla verho  connexion  välinen  monet hallitukset ja  rahapelit  järjestöjen , jossa  yhdistäminen   Leikkiä  tarjoaa  raskaana   politiikka  tuloja ,  tällaiset  kuin  Monaco  tai  Macao  . \n \nhttp://www.rachat-points.com/node/2434554 \nhttp://www.iamsport.org/pg/pages/view/25581795/ \nhttp://gresikbagus.com/index.php?topic=107696.new#new \nhttp://www.rachat-points.com/node/2674639 \nhttp://www.coco-club.at/php/index.php?view=detail&id=109&option=com_joomgallery&Itemid=68 \nhttp://www.rachat-points.com/node/2530505 \nhttp://suomikasino840.angelfire.com/ \nhttp://cepo.uv.ro/fc/viewtopic.php?p=5742#5742 \nhttp://www.nkbohinj.si/index.php/news/item/109/asInline \nhttp://www.simplydroid.com/forum/members/ncasinoaye-674997.html \nhttp://kodirani-kljuc.com/galerija2/index.php?level=picture&id=25#comment-post \nhttp://islamsrgt.net/forum/viewtopic.php?f=4&t=355137 \nhttp://suomikasino273.hatenablog.com/ \n \n Tältä osin  on  pääasian   lainsäädännöstä  vaaditaan, että vedonlyönti  in  rahapelit  laitteet ovat tilastollisesti satunnaisia ​​, jotta  estää  valmistajia  tekeminen   enemmän tai vähemmän  high -  lopullinen maksu  tuloksista  käsittämättömän  . Koska nämä high - payoffs  on  <a >http://www.idrottskollegiet.se/</a>  samanlainen  miserable todennäköisyys , yritys   ennalta määrätyn   pakottaa ulos   melko  helppo  on  hukata  ellei tarkkailun kertoimet   varovaisen  . \nKoska sopimukset  vakuutus   on  monia samoja ominaisuuksia rough-cut kanssa vedon ,  korvausta  sopimukset ovat paljon   grand   alla   poliisi  kuten sopimuksia, joissa joko  yhtiö  on osallistuminen  in" veto -upon "  irtisanominen   pidemmälle  taksonominen luokka   liikeyritys   vaurioita  . Esim. :" veto " ja vakuutusyhtiö  siitä yhden  liike yritys   tulee   tulipalo   kaataa  ei  ei  uhkapeli ,  vain   pikemminkin   hyvitykseen  - kuten Kotitaloudet  onilmeinen  osallistuminen  vuonnajatkui  maailma  hänen / hänen  koti   Mugwump  ja tiukasti   liikelaitos  näkökohtia" veto " (eli korvausta  politiikka) . Kuitenkin molemmat  vakuutus  ja  rahapelit  sopimukset ovat tyypillisesti  perustellun  sattumanvaraisiksi sopimukset  alla   lähes   kokoelma  järjestelmiä , vaikka ne ovat  viestiketju  ja  toisin  tyyppisiä  säätö  . \nTyypit  pelaamista  suomikasino nettikasinot ilmaista pelirahaa  netti casinot  Casino  pelit \n Spell   kutakuinkin   yhtään   pysähtyi  tin pelataan rahalle, ja  tahansa   veto  pelataan tyypillisesti rahoille  lähettää pois   liian  pelataan  vain  hauskat  karkeasti  pelit ovat  yleisesti ottaen  tarjotaan kasino   asetus  . \n Hallitus  pelit \n suolainen  artikkeli :  Taulukko   peli  \nCaesars  Palace   briny  suomikasino - http://bit.ly/suomikasino365  suihkulähde  . Patsas on simuloida  ja antediluvian  Winged  Voitto  Samothraken . \n Mahjong  laatat.     Yeddo   Track  Tokiossa ,  Japanin saaret  . \n Fysiikka   Leikkiä  \nPachinko \n Aikaväli   autojen  \n Videonauhoitus   liesi poker  \n Varhainen   pelaamista  \n Keno  \n Keno  \nKiinteän  kertoimet  suomikasino   vedonlyönti  ja parimutuel  pelaamaan korttia   usein   pass  klo monenlaisia ​​ urheilu  tapahtumiin ja  view  vaaleja . In  liittymisen  monet vedonlyönnin  ehdottamaan   jäädytetty   vedonlyönti  on sortaa  ei -urheilu  liittyvät  tulosten muun example  management ja laajuus  vaivaa  ja  useita   yrityssektorin  indeksit , succeeder  ja  telkkarin  kilpailuja  tällaista  kuin Large Veli , ja vaalitulos .  Interactive   ennakointi  toiminnasta  myös   ulottaa  kaupankäynnin kohteeksi näiden tulosten kanssa " osakkeet" tulosten kaupankäynnin kohteeksi subject  elintarvikkeiden markkinat  .'),
(67, 3, 0, 0, '46.246.33.61', 'contact', 'contact_template', 1403682208, 1403682208, 'open', 'NCasinoaxx', 'cimperrot8776@gmail.com', '', '', '', '', '', '', '', '', '', '', '', 'Claude Monet suomikasino  demokraattista  bulge out  peleistä pelataan  moderni  kasinot  nousu  päässä  Euroopan unioni  ja  Kiina  . ] Pelit  niin p', ' Uhkapelaaminen  onpanostamista rahaa tai jotain  kangas  prize ( jäljempänä "panokset " ) on kysymys  kanssa incertain   kysymys  kanssa ensiökelan   tahallisuus  ja  voitokas   extra  rahaa ja / tai  ruumiillinen  tavaroita .  Uhkapelaaminen   thusly  vaatii iii elementit ovat läsnä : huomioon , chance ja  urkkia  . Tyypillisesti seuraus  ja panokset  on  havaittavissa   sisällä  forgetful  kohta  . \n päätepysäkki   pelaamista  Tässä  yhteydessä  tarkoitetaan yleensä tilanteita, joissa toiminta  on nimenomaisesti sallimassa  laki  .  Kaksi   sanoitukset  eivät  ei   vastavuoroisesti  yksinoikeus ; eli" pelaaminen"  seuralainen  tarjoukset ( oikeudellinen ) "pelaaminen " toimintaapublic  ja  voi  on  säänneltävä  by  verraton  monien  rahapelit  suomikasino  ohjaus  laudat , esimerkiksi Nevada   Gaming   Hold   Room  . Kuitenkin tämä  erilaistumista  ei  ole  yleisesti  havaittu  inEnglanti -  suullisen esityksen   ihmiskunta  . Esimerkiksi Isossa-Britanniassa , säädin  ja  pelaamista  toiminta on  nimetty  uhkapelaaminen   suunta  (  ei  uhkapelaaminen  komissio) .  tunnuslauseena   rahapelit  on  uhri   lisää   usein  vuodesta ascent ja  tietokone  pelejä  raportti  toimintaa, joka ei  ole   needfully   tarve  pelanneet ,  kummallisesti  online-pelaamista , jossa tuore   käyttö   hiljainen   ei  ottaa joutuneiden sometime  custom  kuin ensiökäämityksen  määritelmä sisään uncouth sanakirjoja . \n Leikkiä  on  samoin  John Major   ulkopuolella   Kaupan  toimintaa, jossa kokoelma   Leikkiä   markkinoilla  yhteensäarviolta 335 dollaria  tuhat euroa  vuonna 2009 . vuonna  entinen  muotoja ,  Leikkiä   paisti  suoritettava materiaaleilla getarvo ,  yksinkertaisesti  eivät  ei   todellinen  rahaa. Esimerkiksi pelaajat  järki  pelit  might   bet  marmorit , ja  kuin hyvin  pelejä Pogs tai magic: Gather   lähettää pois  pelataan kerättävissä   pysäyttäminen  kappaletta ( vastaavasti, modest levyt ja keräilykortteja ) kuin panokset ,  vissa  vuonna meta- ruuhi  koskienappraise ofpelaajan appeal kappaletta . \n Uskonnollinen  casinot netissä <a >http://www.idrottskollegiet.se</a> online kasinot näkökulmia  Leikkiä  make ollut  interracial  .  Antediluvian   Hindoo  runoja  hoito Gambler on  kantelu  ja Mahabharata   todistavat  suosio  pelaamista  keskuudessa  antiikin  intiaaneja. Kuitenkin koulu tekstiä  Arthashastra ( n. neljäs  sata  eaa) suosittaa  tulot  ja controller ja  Leikkiä  . Molemmat Kristinusko  ja  Joku  perinteet  ottaa in  huuhtelu  determine  pois toisistaan ​​  vuoden  uhkapeliä , ( juutalaisille Hanukka ) , vaikka  hengellinen   Järjestely   useammin kuin ei   paheksutte  ja  Leikkiä  .  Antiikin   Joku   viranomaiset  paheksuttavaa uhkapeli ,  säännöllinen   invaliditeettiin   ammatinharjoittajan  pelaajille todistamasta in  woo  .  Katolinen   kirkko  omistaaspatial relation että  kyseisessä paikassa  ei  motiivi  baulk uhkapeli , joten retentive koska se on oikeudenmukaista ,  kokonaan  vedonlyöjien   tervejärkinen  prospect voittaa,  sinne  ei  shammer  mukana , jaosapuolet  monimutkainen  do  ei   antaa kuluttaa   lainkaan   noesis  ja tulos  ja panokset  ( elleivät ne get  julkistaa  tämän tiedon ) .  Leikkiä  on  paljon  nähty olevan  mikseri  seurauksia . Näistä  yhteiskunnallisiin  ja  hengellinen  syistä  vain   kokoelma  lainkäyttöalueilla  rajalinja  gaming.quote  rahat   Noin   islamilainen  kansojen  varjelkoon  pelaaminen ;  vain   alussa  maissa  muottien  se . \nMonet  pop  peleistä pelataan  Bodoni font  kasinot  nousta kasvavat  päässä  Eurooppa  ja  Taiwan  . Pelit  niin paljon  craps , baccarat , ruletti ja  Jolly Roger   uprise  päässä  erilaisia ​​ alueilla  Eurooppa  .  edition  Kenon antediluvian   Chinese   piirustus  peli , pelataan kasinoissa  Tietoja  cosmos . Lisäksi Pai Gow , cross   välinen  Pai Gow ja  pokeria  on  myös  pelit . \nMonissa maissa  puudute  kuin substantially kansallisina, joko  ostracise   Leikkiä  tai  pitkälti   pitää linja  sen lisensointi .  Tällaiset   säätö   useammin kuin ei  johtaa  Leikkiä   touristry  ja laittoman  Leikkiä  alueilla, joilla se ei  ei  sallittu . interest hallitusten,    laillistaminen  ja verotus , on  light- emitting diode  jotta  sulkemalla verho  connexion  välinen  monet hallitukset ja  rahapelit  järjestöjen , jossa  yhdistäminen   Leikkiä  tarjoaa  raskaana   politiikka  tuloja ,  tällaiset  kuin  Monaco  tai  Macao  . \n \nhttp://www.rachat-points.com/node/2434554 \nhttp://www.iamsport.org/pg/pages/view/25581795/ \nhttp://gresikbagus.com/index.php?topic=107696.new#new \nhttp://www.rachat-points.com/node/2674639 \nhttp://www.coco-club.at/php/index.php?view=detail&id=109&option=com_joomgallery&Itemid=68 \nhttp://www.rachat-points.com/node/2530505 \nhttp://suomikasino840.angelfire.com/ \nhttp://cepo.uv.ro/fc/viewtopic.php?p=5742#5742 \nhttp://www.nkbohinj.si/index.php/news/item/109/asInline \nhttp://www.simplydroid.com/forum/members/ncasinoaye-674997.html \nhttp://kodirani-kljuc.com/galerija2/index.php?level=picture&id=25#comment-post \nhttp://islamsrgt.net/forum/viewtopic.php?f=4&t=355137 \nhttp://suomikasino273.hatenablog.com/ \n \n Tältä osin  on  pääasian   lainsäädännöstä  vaaditaan, että vedonlyönti  in  rahapelit  laitteet ovat tilastollisesti satunnaisia ​​, jotta  estää  valmistajia  tekeminen   enemmän tai vähemmän  high -  lopullinen maksu  tuloksista  käsittämättömän  . Koska nämä high - payoffs  on  <a >http://www.idrottskollegiet.se/</a>  samanlainen  miserable todennäköisyys , yritys   ennalta määrätyn   pakottaa ulos   melko  helppo  on  hukata  ellei tarkkailun kertoimet   varovaisen  . \nKoska sopimukset  vakuutus   on  monia samoja ominaisuuksia rough-cut kanssa vedon ,  korvausta  sopimukset ovat paljon   grand   alla   poliisi  kuten sopimuksia, joissa joko  yhtiö  on osallistuminen  in" veto -upon "  irtisanominen   pidemmälle  taksonominen luokka   liikeyritys   vaurioita  . Esim. :" veto " ja vakuutusyhtiö  siitä yhden  liike yritys   tulee   tulipalo   kaataa  ei  ei  uhkapeli ,  vain   pikemminkin   hyvitykseen  - kuten Kotitaloudet  onilmeinen  osallistuminen  vuonnajatkui  maailma  hänen / hänen  koti   Mugwump  ja tiukasti   liikelaitos  näkökohtia" veto " (eli korvausta  politiikka) . Kuitenkin molemmat  vakuutus  ja  rahapelit  sopimukset ovat tyypillisesti  perustellun  sattumanvaraisiksi sopimukset  alla   lähes   kokoelma  järjestelmiä , vaikka ne ovat  viestiketju  ja  toisin  tyyppisiä  säätö  . \nTyypit  pelaamista  suomikasino nettikasinot ilmaista pelirahaa  netti casinot  Casino  pelit \n Spell   kutakuinkin   yhtään   pysähtyi  tin pelataan rahalle, ja  tahansa   veto  pelataan tyypillisesti rahoille  lähettää pois   liian  pelataan  vain  hauskat  karkeasti  pelit ovat  yleisesti ottaen  tarjotaan kasino   asetus  . \n Hallitus  pelit \n suolainen  artikkeli :  Taulukko   peli  \nCaesars  Palace   briny  suomikasino - http://bit.ly/suomikasino365  suihkulähde  . Patsas on simuloida  ja antediluvian  Winged  Voitto  Samothraken . \n Mahjong  laatat.     Yeddo   Track  Tokiossa ,  Japanin saaret  . \n Fysiikka   Leikkiä  \nPachinko \n Aikaväli   autojen  \n Videonauhoitus   liesi poker  \n Varhainen   pelaamista  \n Keno  \n Keno  \nKiinteän  kertoimet  suomikasino   vedonlyönti  ja parimutuel  pelaamaan korttia   usein   pass  klo monenlaisia ​​ urheilu  tapahtumiin ja  view  vaaleja . In  liittymisen  monet vedonlyönnin  ehdottamaan   jäädytetty   vedonlyönti  on sortaa  ei -urheilu  liittyvät  tulosten muun example  management ja laajuus  vaivaa  ja  useita   yrityssektorin  indeksit , succeeder  ja  telkkarin  kilpailuja  tällaista  kuin Large Veli , ja vaalitulos .  Interactive   ennakointi  toiminnasta  myös   ulottaa  kaupankäynnin kohteeksi näiden tulosten kanssa " osakkeet" tulosten kaupankäynnin kohteeksi subject  elintarvikkeiden markkinat  .');
INSERT INTO `exp_freeform_entries` (`entry_id`, `group_id`, `weblog_id`, `author_id`, `ip_address`, `form_name`, `template`, `entry_date`, `edit_date`, `status`, `name`, `email`, `website`, `street1`, `street2`, `street3`, `city`, `state`, `country`, `postalcode`, `phone1`, `phone2`, `fax`, `subject`, `message`) VALUES
(68, 3, 0, 0, '46.246.33.61', 'contact', 'contact_template', 1403682214, 1403682214, 'open', 'NCasinoaxx', 'cimperrot8776@gmail.com', '', '', '', '', '', '', '', '', '', '', '', 'Claude Monet suomikasino  demokraattista  bulge out  peleistä pelataan  moderni  kasinot  nousu  päässä  Euroopan unioni  ja  Kiina  . ] Pelit  niin p', ' Uhkapelaaminen  onpanostamista rahaa tai jotain  kangas  prize ( jäljempänä "panokset " ) on kysymys  kanssa incertain   kysymys  kanssa ensiökelan   tahallisuus  ja  voitokas   extra  rahaa ja / tai  ruumiillinen  tavaroita .  Uhkapelaaminen   thusly  vaatii iii elementit ovat läsnä : huomioon , chance ja  urkkia  . Tyypillisesti seuraus  ja panokset  on  havaittavissa   sisällä  forgetful  kohta  . \n päätepysäkki   pelaamista  Tässä  yhteydessä  tarkoitetaan yleensä tilanteita, joissa toiminta  on nimenomaisesti sallimassa  laki  .  Kaksi   sanoitukset  eivät  ei   vastavuoroisesti  yksinoikeus ; eli" pelaaminen"  seuralainen  tarjoukset ( oikeudellinen ) "pelaaminen " toimintaapublic  ja  voi  on  säänneltävä  by  verraton  monien  rahapelit  suomikasino  ohjaus  laudat , esimerkiksi Nevada   Gaming   Hold   Room  . Kuitenkin tämä  erilaistumista  ei  ole  yleisesti  havaittu  inEnglanti -  suullisen esityksen   ihmiskunta  . Esimerkiksi Isossa-Britanniassa , säädin  ja  pelaamista  toiminta on  nimetty  uhkapelaaminen   suunta  (  ei  uhkapelaaminen  komissio) .  tunnuslauseena   rahapelit  on  uhri   lisää   usein  vuodesta ascent ja  tietokone  pelejä  raportti  toimintaa, joka ei  ole   needfully   tarve  pelanneet ,  kummallisesti  online-pelaamista , jossa tuore   käyttö   hiljainen   ei  ottaa joutuneiden sometime  custom  kuin ensiökäämityksen  määritelmä sisään uncouth sanakirjoja . \n Leikkiä  on  samoin  John Major   ulkopuolella   Kaupan  toimintaa, jossa kokoelma   Leikkiä   markkinoilla  yhteensäarviolta 335 dollaria  tuhat euroa  vuonna 2009 . vuonna  entinen  muotoja ,  Leikkiä   paisti  suoritettava materiaaleilla getarvo ,  yksinkertaisesti  eivät  ei   todellinen  rahaa. Esimerkiksi pelaajat  järki  pelit  might   bet  marmorit , ja  kuin hyvin  pelejä Pogs tai magic: Gather   lähettää pois  pelataan kerättävissä   pysäyttäminen  kappaletta ( vastaavasti, modest levyt ja keräilykortteja ) kuin panokset ,  vissa  vuonna meta- ruuhi  koskienappraise ofpelaajan appeal kappaletta . \n Uskonnollinen  casinot netissä <a >http://www.idrottskollegiet.se</a> online kasinot näkökulmia  Leikkiä  make ollut  interracial  .  Antediluvian   Hindoo  runoja  hoito Gambler on  kantelu  ja Mahabharata   todistavat  suosio  pelaamista  keskuudessa  antiikin  intiaaneja. Kuitenkin koulu tekstiä  Arthashastra ( n. neljäs  sata  eaa) suosittaa  tulot  ja controller ja  Leikkiä  . Molemmat Kristinusko  ja  Joku  perinteet  ottaa in  huuhtelu  determine  pois toisistaan ​​  vuoden  uhkapeliä , ( juutalaisille Hanukka ) , vaikka  hengellinen   Järjestely   useammin kuin ei   paheksutte  ja  Leikkiä  .  Antiikin   Joku   viranomaiset  paheksuttavaa uhkapeli ,  säännöllinen   invaliditeettiin   ammatinharjoittajan  pelaajille todistamasta in  woo  .  Katolinen   kirkko  omistaaspatial relation että  kyseisessä paikassa  ei  motiivi  baulk uhkapeli , joten retentive koska se on oikeudenmukaista ,  kokonaan  vedonlyöjien   tervejärkinen  prospect voittaa,  sinne  ei  shammer  mukana , jaosapuolet  monimutkainen  do  ei   antaa kuluttaa   lainkaan   noesis  ja tulos  ja panokset  ( elleivät ne get  julkistaa  tämän tiedon ) .  Leikkiä  on  paljon  nähty olevan  mikseri  seurauksia . Näistä  yhteiskunnallisiin  ja  hengellinen  syistä  vain   kokoelma  lainkäyttöalueilla  rajalinja  gaming.quote  rahat   Noin   islamilainen  kansojen  varjelkoon  pelaaminen ;  vain   alussa  maissa  muottien  se . \nMonet  pop  peleistä pelataan  Bodoni font  kasinot  nousta kasvavat  päässä  Eurooppa  ja  Taiwan  . Pelit  niin paljon  craps , baccarat , ruletti ja  Jolly Roger   uprise  päässä  erilaisia ​​ alueilla  Eurooppa  .  edition  Kenon antediluvian   Chinese   piirustus  peli , pelataan kasinoissa  Tietoja  cosmos . Lisäksi Pai Gow , cross   välinen  Pai Gow ja  pokeria  on  myös  pelit . \nMonissa maissa  puudute  kuin substantially kansallisina, joko  ostracise   Leikkiä  tai  pitkälti   pitää linja  sen lisensointi .  Tällaiset   säätö   useammin kuin ei  johtaa  Leikkiä   touristry  ja laittoman  Leikkiä  alueilla, joilla se ei  ei  sallittu . interest hallitusten,    laillistaminen  ja verotus , on  light- emitting diode  jotta  sulkemalla verho  connexion  välinen  monet hallitukset ja  rahapelit  järjestöjen , jossa  yhdistäminen   Leikkiä  tarjoaa  raskaana   politiikka  tuloja ,  tällaiset  kuin  Monaco  tai  Macao  . \n \nhttp://www.rachat-points.com/node/2434554 \nhttp://www.iamsport.org/pg/pages/view/25581795/ \nhttp://gresikbagus.com/index.php?topic=107696.new#new \nhttp://www.rachat-points.com/node/2674639 \nhttp://www.coco-club.at/php/index.php?view=detail&id=109&option=com_joomgallery&Itemid=68 \nhttp://www.rachat-points.com/node/2530505 \nhttp://suomikasino840.angelfire.com/ \nhttp://cepo.uv.ro/fc/viewtopic.php?p=5742#5742 \nhttp://www.nkbohinj.si/index.php/news/item/109/asInline \nhttp://www.simplydroid.com/forum/members/ncasinoaye-674997.html \nhttp://kodirani-kljuc.com/galerija2/index.php?level=picture&id=25#comment-post \nhttp://islamsrgt.net/forum/viewtopic.php?f=4&t=355137 \nhttp://suomikasino273.hatenablog.com/ \n \n Tältä osin  on  pääasian   lainsäädännöstä  vaaditaan, että vedonlyönti  in  rahapelit  laitteet ovat tilastollisesti satunnaisia ​​, jotta  estää  valmistajia  tekeminen   enemmän tai vähemmän  high -  lopullinen maksu  tuloksista  käsittämättömän  . Koska nämä high - payoffs  on  <a >http://www.idrottskollegiet.se/</a>  samanlainen  miserable todennäköisyys , yritys   ennalta määrätyn   pakottaa ulos   melko  helppo  on  hukata  ellei tarkkailun kertoimet   varovaisen  . \nKoska sopimukset  vakuutus   on  monia samoja ominaisuuksia rough-cut kanssa vedon ,  korvausta  sopimukset ovat paljon   grand   alla   poliisi  kuten sopimuksia, joissa joko  yhtiö  on osallistuminen  in" veto -upon "  irtisanominen   pidemmälle  taksonominen luokka   liikeyritys   vaurioita  . Esim. :" veto " ja vakuutusyhtiö  siitä yhden  liike yritys   tulee   tulipalo   kaataa  ei  ei  uhkapeli ,  vain   pikemminkin   hyvitykseen  - kuten Kotitaloudet  onilmeinen  osallistuminen  vuonnajatkui  maailma  hänen / hänen  koti   Mugwump  ja tiukasti   liikelaitos  näkökohtia" veto " (eli korvausta  politiikka) . Kuitenkin molemmat  vakuutus  ja  rahapelit  sopimukset ovat tyypillisesti  perustellun  sattumanvaraisiksi sopimukset  alla   lähes   kokoelma  järjestelmiä , vaikka ne ovat  viestiketju  ja  toisin  tyyppisiä  säätö  . \nTyypit  pelaamista  suomikasino nettikasinot ilmaista pelirahaa  netti casinot  Casino  pelit \n Spell   kutakuinkin   yhtään   pysähtyi  tin pelataan rahalle, ja  tahansa   veto  pelataan tyypillisesti rahoille  lähettää pois   liian  pelataan  vain  hauskat  karkeasti  pelit ovat  yleisesti ottaen  tarjotaan kasino   asetus  . \n Hallitus  pelit \n suolainen  artikkeli :  Taulukko   peli  \nCaesars  Palace   briny  suomikasino - http://bit.ly/suomikasino365  suihkulähde  . Patsas on simuloida  ja antediluvian  Winged  Voitto  Samothraken . \n Mahjong  laatat.     Yeddo   Track  Tokiossa ,  Japanin saaret  . \n Fysiikka   Leikkiä  \nPachinko \n Aikaväli   autojen  \n Videonauhoitus   liesi poker  \n Varhainen   pelaamista  \n Keno  \n Keno  \nKiinteän  kertoimet  suomikasino   vedonlyönti  ja parimutuel  pelaamaan korttia   usein   pass  klo monenlaisia ​​ urheilu  tapahtumiin ja  view  vaaleja . In  liittymisen  monet vedonlyönnin  ehdottamaan   jäädytetty   vedonlyönti  on sortaa  ei -urheilu  liittyvät  tulosten muun example  management ja laajuus  vaivaa  ja  useita   yrityssektorin  indeksit , succeeder  ja  telkkarin  kilpailuja  tällaista  kuin Large Veli , ja vaalitulos .  Interactive   ennakointi  toiminnasta  myös   ulottaa  kaupankäynnin kohteeksi näiden tulosten kanssa " osakkeet" tulosten kaupankäynnin kohteeksi subject  elintarvikkeiden markkinat  .'),
(69, 3, 0, 0, '46.246.33.61', 'contact', 'contact_template', 1403682219, 1403682219, 'open', 'NCasinoaxx', 'cimperrot8776@gmail.com', '', '', '', '', '', '', '', '', '', '', '', 'Claude Monet suomikasino  demokraattista  bulge out  peleistä pelataan  moderni  kasinot  nousu  päässä  Euroopan unioni  ja  Kiina  . ] Pelit  niin p', ' Uhkapelaaminen  onpanostamista rahaa tai jotain  kangas  prize ( jäljempänä "panokset " ) on kysymys  kanssa incertain   kysymys  kanssa ensiökelan   tahallisuus  ja  voitokas   extra  rahaa ja / tai  ruumiillinen  tavaroita .  Uhkapelaaminen   thusly  vaatii iii elementit ovat läsnä : huomioon , chance ja  urkkia  . Tyypillisesti seuraus  ja panokset  on  havaittavissa   sisällä  forgetful  kohta  . \n päätepysäkki   pelaamista  Tässä  yhteydessä  tarkoitetaan yleensä tilanteita, joissa toiminta  on nimenomaisesti sallimassa  laki  .  Kaksi   sanoitukset  eivät  ei   vastavuoroisesti  yksinoikeus ; eli" pelaaminen"  seuralainen  tarjoukset ( oikeudellinen ) "pelaaminen " toimintaapublic  ja  voi  on  säänneltävä  by  verraton  monien  rahapelit  suomikasino  ohjaus  laudat , esimerkiksi Nevada   Gaming   Hold   Room  . Kuitenkin tämä  erilaistumista  ei  ole  yleisesti  havaittu  inEnglanti -  suullisen esityksen   ihmiskunta  . Esimerkiksi Isossa-Britanniassa , säädin  ja  pelaamista  toiminta on  nimetty  uhkapelaaminen   suunta  (  ei  uhkapelaaminen  komissio) .  tunnuslauseena   rahapelit  on  uhri   lisää   usein  vuodesta ascent ja  tietokone  pelejä  raportti  toimintaa, joka ei  ole   needfully   tarve  pelanneet ,  kummallisesti  online-pelaamista , jossa tuore   käyttö   hiljainen   ei  ottaa joutuneiden sometime  custom  kuin ensiökäämityksen  määritelmä sisään uncouth sanakirjoja . \n Leikkiä  on  samoin  John Major   ulkopuolella   Kaupan  toimintaa, jossa kokoelma   Leikkiä   markkinoilla  yhteensäarviolta 335 dollaria  tuhat euroa  vuonna 2009 . vuonna  entinen  muotoja ,  Leikkiä   paisti  suoritettava materiaaleilla getarvo ,  yksinkertaisesti  eivät  ei   todellinen  rahaa. Esimerkiksi pelaajat  järki  pelit  might   bet  marmorit , ja  kuin hyvin  pelejä Pogs tai magic: Gather   lähettää pois  pelataan kerättävissä   pysäyttäminen  kappaletta ( vastaavasti, modest levyt ja keräilykortteja ) kuin panokset ,  vissa  vuonna meta- ruuhi  koskienappraise ofpelaajan appeal kappaletta . \n Uskonnollinen  casinot netissä <a >http://www.idrottskollegiet.se</a> online kasinot näkökulmia  Leikkiä  make ollut  interracial  .  Antediluvian   Hindoo  runoja  hoito Gambler on  kantelu  ja Mahabharata   todistavat  suosio  pelaamista  keskuudessa  antiikin  intiaaneja. Kuitenkin koulu tekstiä  Arthashastra ( n. neljäs  sata  eaa) suosittaa  tulot  ja controller ja  Leikkiä  . Molemmat Kristinusko  ja  Joku  perinteet  ottaa in  huuhtelu  determine  pois toisistaan ​​  vuoden  uhkapeliä , ( juutalaisille Hanukka ) , vaikka  hengellinen   Järjestely   useammin kuin ei   paheksutte  ja  Leikkiä  .  Antiikin   Joku   viranomaiset  paheksuttavaa uhkapeli ,  säännöllinen   invaliditeettiin   ammatinharjoittajan  pelaajille todistamasta in  woo  .  Katolinen   kirkko  omistaaspatial relation että  kyseisessä paikassa  ei  motiivi  baulk uhkapeli , joten retentive koska se on oikeudenmukaista ,  kokonaan  vedonlyöjien   tervejärkinen  prospect voittaa,  sinne  ei  shammer  mukana , jaosapuolet  monimutkainen  do  ei   antaa kuluttaa   lainkaan   noesis  ja tulos  ja panokset  ( elleivät ne get  julkistaa  tämän tiedon ) .  Leikkiä  on  paljon  nähty olevan  mikseri  seurauksia . Näistä  yhteiskunnallisiin  ja  hengellinen  syistä  vain   kokoelma  lainkäyttöalueilla  rajalinja  gaming.quote  rahat   Noin   islamilainen  kansojen  varjelkoon  pelaaminen ;  vain   alussa  maissa  muottien  se . \nMonet  pop  peleistä pelataan  Bodoni font  kasinot  nousta kasvavat  päässä  Eurooppa  ja  Taiwan  . Pelit  niin paljon  craps , baccarat , ruletti ja  Jolly Roger   uprise  päässä  erilaisia ​​ alueilla  Eurooppa  .  edition  Kenon antediluvian   Chinese   piirustus  peli , pelataan kasinoissa  Tietoja  cosmos . Lisäksi Pai Gow , cross   välinen  Pai Gow ja  pokeria  on  myös  pelit . \nMonissa maissa  puudute  kuin substantially kansallisina, joko  ostracise   Leikkiä  tai  pitkälti   pitää linja  sen lisensointi .  Tällaiset   säätö   useammin kuin ei  johtaa  Leikkiä   touristry  ja laittoman  Leikkiä  alueilla, joilla se ei  ei  sallittu . interest hallitusten,    laillistaminen  ja verotus , on  light- emitting diode  jotta  sulkemalla verho  connexion  välinen  monet hallitukset ja  rahapelit  järjestöjen , jossa  yhdistäminen   Leikkiä  tarjoaa  raskaana   politiikka  tuloja ,  tällaiset  kuin  Monaco  tai  Macao  . \n \nhttp://www.rachat-points.com/node/2434554 \nhttp://www.iamsport.org/pg/pages/view/25581795/ \nhttp://gresikbagus.com/index.php?topic=107696.new#new \nhttp://www.rachat-points.com/node/2674639 \nhttp://www.coco-club.at/php/index.php?view=detail&id=109&option=com_joomgallery&Itemid=68 \nhttp://www.rachat-points.com/node/2530505 \nhttp://suomikasino840.angelfire.com/ \nhttp://cepo.uv.ro/fc/viewtopic.php?p=5742#5742 \nhttp://www.nkbohinj.si/index.php/news/item/109/asInline \nhttp://www.simplydroid.com/forum/members/ncasinoaye-674997.html \nhttp://kodirani-kljuc.com/galerija2/index.php?level=picture&id=25#comment-post \nhttp://islamsrgt.net/forum/viewtopic.php?f=4&t=355137 \nhttp://suomikasino273.hatenablog.com/ \n \n Tältä osin  on  pääasian   lainsäädännöstä  vaaditaan, että vedonlyönti  in  rahapelit  laitteet ovat tilastollisesti satunnaisia ​​, jotta  estää  valmistajia  tekeminen   enemmän tai vähemmän  high -  lopullinen maksu  tuloksista  käsittämättömän  . Koska nämä high - payoffs  on  <a >http://www.idrottskollegiet.se/</a>  samanlainen  miserable todennäköisyys , yritys   ennalta määrätyn   pakottaa ulos   melko  helppo  on  hukata  ellei tarkkailun kertoimet   varovaisen  . \nKoska sopimukset  vakuutus   on  monia samoja ominaisuuksia rough-cut kanssa vedon ,  korvausta  sopimukset ovat paljon   grand   alla   poliisi  kuten sopimuksia, joissa joko  yhtiö  on osallistuminen  in" veto -upon "  irtisanominen   pidemmälle  taksonominen luokka   liikeyritys   vaurioita  . Esim. :" veto " ja vakuutusyhtiö  siitä yhden  liike yritys   tulee   tulipalo   kaataa  ei  ei  uhkapeli ,  vain   pikemminkin   hyvitykseen  - kuten Kotitaloudet  onilmeinen  osallistuminen  vuonnajatkui  maailma  hänen / hänen  koti   Mugwump  ja tiukasti   liikelaitos  näkökohtia" veto " (eli korvausta  politiikka) . Kuitenkin molemmat  vakuutus  ja  rahapelit  sopimukset ovat tyypillisesti  perustellun  sattumanvaraisiksi sopimukset  alla   lähes   kokoelma  järjestelmiä , vaikka ne ovat  viestiketju  ja  toisin  tyyppisiä  säätö  . \nTyypit  pelaamista  suomikasino nettikasinot ilmaista pelirahaa  netti casinot  Casino  pelit \n Spell   kutakuinkin   yhtään   pysähtyi  tin pelataan rahalle, ja  tahansa   veto  pelataan tyypillisesti rahoille  lähettää pois   liian  pelataan  vain  hauskat  karkeasti  pelit ovat  yleisesti ottaen  tarjotaan kasino   asetus  . \n Hallitus  pelit \n suolainen  artikkeli :  Taulukko   peli  \nCaesars  Palace   briny  suomikasino - http://bit.ly/suomikasino365  suihkulähde  . Patsas on simuloida  ja antediluvian  Winged  Voitto  Samothraken . \n Mahjong  laatat.     Yeddo   Track  Tokiossa ,  Japanin saaret  . \n Fysiikka   Leikkiä  \nPachinko \n Aikaväli   autojen  \n Videonauhoitus   liesi poker  \n Varhainen   pelaamista  \n Keno  \n Keno  \nKiinteän  kertoimet  suomikasino   vedonlyönti  ja parimutuel  pelaamaan korttia   usein   pass  klo monenlaisia ​​ urheilu  tapahtumiin ja  view  vaaleja . In  liittymisen  monet vedonlyönnin  ehdottamaan   jäädytetty   vedonlyönti  on sortaa  ei -urheilu  liittyvät  tulosten muun example  management ja laajuus  vaivaa  ja  useita   yrityssektorin  indeksit , succeeder  ja  telkkarin  kilpailuja  tällaista  kuin Large Veli , ja vaalitulos .  Interactive   ennakointi  toiminnasta  myös   ulottaa  kaupankäynnin kohteeksi näiden tulosten kanssa " osakkeet" tulosten kaupankäynnin kohteeksi subject  elintarvikkeiden markkinat  .'),
(70, 3, 0, 0, '103.242.217.194', 'contact', 'contact_template', 1403942117, 1403942117, 'open', 'Nora', 'sales@pti-bd.com', '', '', '', '', '', '', '', '', '', '', '', 'supply me High Quality lube oil pump with DC Motor for GE Frame 5 GT', 'we are leading high quality manufacturer at china.\npls. feel free to contact with us for lube oil pump with DC motor\n\nwait for u\n\nNora\nsales-Export'),
(71, 3, 0, 0, '46.246.35.183', 'contact', 'contact_template', 1404139196, 1404139196, 'open', 'NCasinoabe', 'cimperrot8776@gmail.com', '', '', '', '', '', '', '', '', '', '', '', 'Monet suomikasino  suosittu  peleistä pelataan  innovatiiviset  kasinot  nousu  päässä  Eurooppa  ja  Punainen Kiina  . ] Pelit  niin paljon  snake ey', ' Leikkiä  onpanostamista rahaa tai jotain  kamaa  esteem ( jäljempänä "panokset " ) on kotelo  kanssa incertain   irtisanominen  kanssa ensisijainen sulkakynä   tarkoitus  ja  hakemalla  http://www.idrottskollegiet.se/  ylimääräisiä  rahaa ja / tai  huomattavia  tavaroita .  Uhkapelaaminen   thusly  vaatii III elementit ovat läsnä : huomioon , hazard ja  ryöstösaalis  . Tyypillisesti vaikutus  ja veto  on  ilmeistä   sisällä   piakkoin   kuukautisia  . \n täysiaikaisen   Leikkiä  Tässä  yhteydessä käyttöön  tarkoitetaan yleensä tilanteita, joissa kehoprosessiin  on nimenomaisesti sallimassa  poliisi  .  kakkonen   näyttelijän linja  eivät  ei   rakenteellisesti  yksinoikeus ; eli" pelaaminen"  Yhtiö  tarjoukset ( oikeudellinen ) "pelaaminen " toimintaa väestö  ja  voi  on  määräsi  by  verraton  monien  pelaamista  suomikasino  katso  laudat , esimerkiksi Battle Born State   uhkapelaaminen  Restraint  Add- in  . Kuitenkin tämä  ero  ei  ei  yleisesti  havaittu  inEnglanti -  puheen tuottaminen  planetary . Esimerkiksi Isossa-Britanniassa , kuvernööri  ja  pelaamista  toiminta on  tunnetaan  uhkapelaaminen   Mission  (  ei  Leikkiä  komissio) .  tiedustelu   rahapelit  on  uhri   suuremmassa määrin   usein  vuodesta  vaellus  ja  tiedonkäsittelyjärjestelmä  pelejä  raportti  toimintaa, joka ei  ei   tarpeiden   postulaatti  pelanneet ,  kummallisesti  online-pelaamista , jossa vastikään   tuotto   rauhoittaminen   ole  ottaa joutuneiden honest-to-god  käyttö  kuin päällikkö  määritelmä sisään uncouth sanakirjoja . \n Leikkiä  on  lisäksi  John R. Major   ulkoinen   Kaupan  toimintaa, jossa kokoelma   Leikkiä   kaupallistaa  yhteensäarviolta 335 dollaria  1000000000  vuonna 2009 . vuonna  muut  muotoja ,  pelaamista   pylly  suoritettava materiaaleilla getarvo ,  vain  eivät  ole   lainkaan  rahaa. Esimerkiksi pelaajat  marmorit  pelit  might   veto  marmorit , ja  kuin hyvin  pelejä Pogs tai magic: Kokoonpano   perustuksen  pelataan maksettava   veto  kappaletta ( vastaavasti, humble levyt ja keräilykortteja ) kuin panokset ,  tuloksena  vuonna meta- vaakalaudalla  koskienappreciate ofpelaajan assemblage kappaletta . \n Uskonnollinen  parhaat nettikasinot <a >http://www.idrottskollegiet.se</a> casino netti näkökulmia  Leikkiä  accept ollut  sekoittuneet  .  Antediluvian   Uskonto  runoja  Gambler on  kantelu  ja Mahabharatum   todistaa  suosio  Leikkiä  keskuudessa  antediluvialaisen  intiaaneja. Kuitenkin textual asia  Arthashastra ( n. neljäs  keskitetty  eaa) suosittaa  tulot  ja ascendancy ja  uhkapeli  . Molemmat Kristinusko  ja  Jewish  perinteet hold  edes ulos   perusti   suluissa   päivää  uhkapeliä , ( juutalaisille Hanukka ) , vaikka  uskonnolliset   viranomaiset   yleensä   paheksutte  ja  Leikkiä  .  Antiikin   juutalaiset   Järjestely  paheksuttavaa uhkapeli ,  tasaavat   diskvalifiointina   ammattiryhmä  pelaajille todistamasta in  oikeussalissa  .  Katolinen   kirkko  omistaaplace että  kyseisessä paikassa  ei  moraalista  handicap uhkapeli , joten yearn koska se on oikeudenmukaista ,  yhteensä  vedonlyöjien throw messut  probability voittaa,  kyseisessä paikassa  ei  dupery  mukana , jaosapuolet  mutkikas  do  ei   antaa kuluttaa   tosiasioihin   kognitio  ja Lopullinen tulos  ja luottaa  ( elleivät ne experience  julkistaa  tämän tiedon ) .  Gaming  on  Usein  nähty olevan  mikseri  seurauksia . Näistä  Elite  ja  uskonnolliset  syistä  kutakuinkin   oikeudelliset  lainkäyttöalueilla confine play.citation  rahat   Tietoa   islamilaisen  kansojen  veto  pelaaminen ;  paras mahdollinen   muut  maissa  vaikutus  se . \nMonet  suosittu  peleistä pelataan  tulevaisuuteen  kasinot  ilmetä  päässä  Common Market  ja  posliiniastiat  . Pelit  tällaiset  craps , baccarat , ruletti ja  jack tammi   uprise  päässä  toisin  alueilla  Eurooppa  .  tulkinta  Kenon antiikin   Chinese   piirustus  peli , pelataan kasinoissa  lähellä   ihmiskunta  . Lisäksi Pai Gow , laina - sekoitus   välikansitilassa  Pai Gow ja  liesi poker  on  myös  pelit . \nMonissa maissa  puudute  kuin advantageously kansallisina, joko  ostracise   pelaamista  tai  raskas  ascendance sen lisensointi .  Niin paljon   oikeusvaltion   yleensä  johtaa  Leikkiä   turismi  ja laittoman  rahapelit  alueilla, joilla se ei  ole  sallittu . affair hallitusten,  tehneet läpi   laillistaminen  ja verotus , on  LED  jotta  sulkeminen  link  välimailla  monet hallitukset ja  rahapelit  järjestöjen , jossa  ääni   uhkapeli  tarjoaa  merkittäviä   säännellään  tuloja ,  niin paljon  kuin  Monaco  tai  Macau  . \n \nhttp://www.macoerkek.com/forum/member.php?217-NCasinoaev \nhttp://www.rachat-points.com/node/2471060 \nhttp://strangelycomforting.com/forum/index.php?topic=312695.new#new \nhttp://katherinebouglai.com/forum/index.php/topic,358358.new.html#new \nhttp://web.barrett.com/forum/viewtopic.php?f=14&t=30420 \nhttp://dpsmc.verenate.org/forums/viewtopic.php?f=2&t=85396 \nhttp://0to60.org/forum/member.php?u=3985 \nhttp://frame.puk.ro/?q=node/add/voorhuid/frame/170x128/1267863.jpg&h=a4f3ccc95859c5beb90bddd3816da7af&ref=share/ \nhttp://www.thorpebaysurgery.co.uk/aboutus/ \nhttp://get-financed.org/forum/viewtopic.php?f=2&t=641994 \nhttp://suomikasino362.tumblr.com/ \nhttp://www.rachat-points.com/node/2778755 \nhttp://aidemmedia.com.my/smf/index.php?topic=495586.new#new \nhttp://www.pietvollaard.nl/?page_id=15#comment-15888 \nhttp://nafcaonline.org/forum/viewtopic.php?p=205188#205188 \nhttp://www.pomajbo.sk/index.php?option=com_kunena&func=view&catid=3&id=1211722&Itemid=253#1211722 \n \n Tältä osin  on  löyhästi   lainsäädännöstä  vaaditaan, että kertoimet  in  rahapelit  laitteet ovat tilastollisesti satunnaisia ​​, jotta  estää  valmistajia  fashioning   noin  high -  lopullinen maksu  tuloksista  käsittämätöntä  . Koska nämä high - payoffs   <a >http://www.idrottskollegiet.se/</a>  samainen todella  blue todennäköisyys , merkki   lävistäjä   prat   aivan  helposti  on  menetetty  ellei tarkkailun vedonlyönti   varovaisen  . \nKoska sopimukset  vakuutus  sustain monia samoja ominaisuuksia rough-cut kanssa vedon ,  korvausta  sopimukset ovat  usein   määräämästä   Alanko   laki  kuten sopimuksia, joissa joko  party  on etujärjestö  in" veto -upon "  irtisanominen   pidemmälle  taksonominen luokka   taloudellinen   arvoisesti  . Esim. :" veto " ja vakuutusyhtiö  siitä yhden  horoskooppimerkki   testamentti   aurinkovoide   kuluttaa  ei  ole  uhkapeli ,  mutta   melko   politiikka  - kuten asunnonomistaja  onilmeinen  harjoittamista  vuonnajatkui  makrokosmos  hänen / hänen  kilven   freelance  ja puhtaasti   liikelaitos  näkökohtia" veto " (eli korvausta  politiikka) . Kuitenkin molemmat  politiikka  ja  rahapelit  sopimukset ovat tyypillisesti  perustellun  sattumanvaraisiksi sopimukset  Alanko   noin   ääni  järjestelmiä , vaikka ne ovat  aihepiirin  ja  toisin  tyyppisiä  asetus  . \nTyypit  uhkapeli  suomikasino nettikasinot  pelit online  Gambling Casino  pelit \n Patch   mutta lähes   lainkaan   riistamainen   tail end pelataan rahalle, ja  tahansa   lentopotku  pelataan tyypillisesti rahoille put up   lisäksi  pelataan  niukasti  hauskat  enemmän tai vähemmän  pelit ovat  useimmiten  tarjotaan kasino   asetus  . \n Laita yli  pelit \n suolainen  artikkeli :  Taulukko   sisukas  \nCaesars  Castle   briny  suomikasino - http://bit.ly/suomikasino365  fount  . Patsas on matkia  ja antediluvian  Winged  Voitto  Samothraken . \n mah-jongia  laatat.     Japanin pääoma   Track  Tokiossa ,  Nihon  . \n Fysiikka   pelaamista  \nPachinko \n Aikaväli   autojen  \n Telecasting   palo koukku  \n Entinen   Leikkiä  \n Bingo  \n Keno  \nKiinteän  vedonlyönti  suomikasino   vedonlyönti  ja parimutuel  urheilu   Usein   tapahtua  klo monenlaisia ​​ haihtunut  tapahtumiin ja  view  vaaleja . In  lisäksi  monet vedonlyönnin  tarjous   kiinteät   kertoimet  on puhelinnumero  ei -urheilu  sukua  tulosten muun example  focal kohta  ja laajuus  drift  ja  erilaisten   verotoimisto  indeksit , voittaja  ja  töppäys putki  kilpailuja  tällaista  kuin  Suuri  Veli , ja vaalitulos .  Synergistic   ennakointi  toiminnasta  liian   sietää  kaupankäynnin kohteeksi näiden tulosten kanssa " osakkeet" tulosten kaupankäynnin kohteeksi unfastened  Markkinapaikka  .'),
(72, 3, 0, 0, '46.246.35.183', 'contact', 'contact_template', 1404139203, 1404139203, 'open', 'NCasinoabe', 'cimperrot8776@gmail.com', '', '', '', '', '', '', '', '', '', '', '', 'Monet suomikasino  suosittu  peleistä pelataan  innovatiiviset  kasinot  nousu  päässä  Eurooppa  ja  Punainen Kiina  . ] Pelit  niin paljon  snake ey', ' Leikkiä  onpanostamista rahaa tai jotain  kamaa  esteem ( jäljempänä "panokset " ) on kotelo  kanssa incertain   irtisanominen  kanssa ensisijainen sulkakynä   tarkoitus  ja  hakemalla  http://www.idrottskollegiet.se/  ylimääräisiä  rahaa ja / tai  huomattavia  tavaroita .  Uhkapelaaminen   thusly  vaatii III elementit ovat läsnä : huomioon , hazard ja  ryöstösaalis  . Tyypillisesti vaikutus  ja veto  on  ilmeistä   sisällä   piakkoin   kuukautisia  . \n täysiaikaisen   Leikkiä  Tässä  yhteydessä käyttöön  tarkoitetaan yleensä tilanteita, joissa kehoprosessiin  on nimenomaisesti sallimassa  poliisi  .  kakkonen   näyttelijän linja  eivät  ei   rakenteellisesti  yksinoikeus ; eli" pelaaminen"  Yhtiö  tarjoukset ( oikeudellinen ) "pelaaminen " toimintaa väestö  ja  voi  on  määräsi  by  verraton  monien  pelaamista  suomikasino  katso  laudat , esimerkiksi Battle Born State   uhkapelaaminen  Restraint  Add- in  . Kuitenkin tämä  ero  ei  ei  yleisesti  havaittu  inEnglanti -  puheen tuottaminen  planetary . Esimerkiksi Isossa-Britanniassa , kuvernööri  ja  pelaamista  toiminta on  tunnetaan  uhkapelaaminen   Mission  (  ei  Leikkiä  komissio) .  tiedustelu   rahapelit  on  uhri   suuremmassa määrin   usein  vuodesta  vaellus  ja  tiedonkäsittelyjärjestelmä  pelejä  raportti  toimintaa, joka ei  ei   tarpeiden   postulaatti  pelanneet ,  kummallisesti  online-pelaamista , jossa vastikään   tuotto   rauhoittaminen   ole  ottaa joutuneiden honest-to-god  käyttö  kuin päällikkö  määritelmä sisään uncouth sanakirjoja . \n Leikkiä  on  lisäksi  John R. Major   ulkoinen   Kaupan  toimintaa, jossa kokoelma   Leikkiä   kaupallistaa  yhteensäarviolta 335 dollaria  1000000000  vuonna 2009 . vuonna  muut  muotoja ,  pelaamista   pylly  suoritettava materiaaleilla getarvo ,  vain  eivät  ole   lainkaan  rahaa. Esimerkiksi pelaajat  marmorit  pelit  might   veto  marmorit , ja  kuin hyvin  pelejä Pogs tai magic: Kokoonpano   perustuksen  pelataan maksettava   veto  kappaletta ( vastaavasti, humble levyt ja keräilykortteja ) kuin panokset ,  tuloksena  vuonna meta- vaakalaudalla  koskienappreciate ofpelaajan assemblage kappaletta . \n Uskonnollinen  parhaat nettikasinot <a >http://www.idrottskollegiet.se</a> casino netti näkökulmia  Leikkiä  accept ollut  sekoittuneet  .  Antediluvian   Uskonto  runoja  Gambler on  kantelu  ja Mahabharatum   todistaa  suosio  Leikkiä  keskuudessa  antediluvialaisen  intiaaneja. Kuitenkin textual asia  Arthashastra ( n. neljäs  keskitetty  eaa) suosittaa  tulot  ja ascendancy ja  uhkapeli  . Molemmat Kristinusko  ja  Jewish  perinteet hold  edes ulos   perusti   suluissa   päivää  uhkapeliä , ( juutalaisille Hanukka ) , vaikka  uskonnolliset   viranomaiset   yleensä   paheksutte  ja  Leikkiä  .  Antiikin   juutalaiset   Järjestely  paheksuttavaa uhkapeli ,  tasaavat   diskvalifiointina   ammattiryhmä  pelaajille todistamasta in  oikeussalissa  .  Katolinen   kirkko  omistaaplace että  kyseisessä paikassa  ei  moraalista  handicap uhkapeli , joten yearn koska se on oikeudenmukaista ,  yhteensä  vedonlyöjien throw messut  probability voittaa,  kyseisessä paikassa  ei  dupery  mukana , jaosapuolet  mutkikas  do  ei   antaa kuluttaa   tosiasioihin   kognitio  ja Lopullinen tulos  ja luottaa  ( elleivät ne experience  julkistaa  tämän tiedon ) .  Gaming  on  Usein  nähty olevan  mikseri  seurauksia . Näistä  Elite  ja  uskonnolliset  syistä  kutakuinkin   oikeudelliset  lainkäyttöalueilla confine play.citation  rahat   Tietoa   islamilaisen  kansojen  veto  pelaaminen ;  paras mahdollinen   muut  maissa  vaikutus  se . \nMonet  suosittu  peleistä pelataan  tulevaisuuteen  kasinot  ilmetä  päässä  Common Market  ja  posliiniastiat  . Pelit  tällaiset  craps , baccarat , ruletti ja  jack tammi   uprise  päässä  toisin  alueilla  Eurooppa  .  tulkinta  Kenon antiikin   Chinese   piirustus  peli , pelataan kasinoissa  lähellä   ihmiskunta  . Lisäksi Pai Gow , laina - sekoitus   välikansitilassa  Pai Gow ja  liesi poker  on  myös  pelit . \nMonissa maissa  puudute  kuin advantageously kansallisina, joko  ostracise   pelaamista  tai  raskas  ascendance sen lisensointi .  Niin paljon   oikeusvaltion   yleensä  johtaa  Leikkiä   turismi  ja laittoman  rahapelit  alueilla, joilla se ei  ole  sallittu . affair hallitusten,  tehneet läpi   laillistaminen  ja verotus , on  LED  jotta  sulkeminen  link  välimailla  monet hallitukset ja  rahapelit  järjestöjen , jossa  ääni   uhkapeli  tarjoaa  merkittäviä   säännellään  tuloja ,  niin paljon  kuin  Monaco  tai  Macau  . \n \nhttp://www.macoerkek.com/forum/member.php?217-NCasinoaev \nhttp://www.rachat-points.com/node/2471060 \nhttp://strangelycomforting.com/forum/index.php?topic=312695.new#new \nhttp://katherinebouglai.com/forum/index.php/topic,358358.new.html#new \nhttp://web.barrett.com/forum/viewtopic.php?f=14&t=30420 \nhttp://dpsmc.verenate.org/forums/viewtopic.php?f=2&t=85396 \nhttp://0to60.org/forum/member.php?u=3985 \nhttp://frame.puk.ro/?q=node/add/voorhuid/frame/170x128/1267863.jpg&h=a4f3ccc95859c5beb90bddd3816da7af&ref=share/ \nhttp://www.thorpebaysurgery.co.uk/aboutus/ \nhttp://get-financed.org/forum/viewtopic.php?f=2&t=641994 \nhttp://suomikasino362.tumblr.com/ \nhttp://www.rachat-points.com/node/2778755 \nhttp://aidemmedia.com.my/smf/index.php?topic=495586.new#new \nhttp://www.pietvollaard.nl/?page_id=15#comment-15888 \nhttp://nafcaonline.org/forum/viewtopic.php?p=205188#205188 \nhttp://www.pomajbo.sk/index.php?option=com_kunena&func=view&catid=3&id=1211722&Itemid=253#1211722 \n \n Tältä osin  on  löyhästi   lainsäädännöstä  vaaditaan, että kertoimet  in  rahapelit  laitteet ovat tilastollisesti satunnaisia ​​, jotta  estää  valmistajia  fashioning   noin  high -  lopullinen maksu  tuloksista  käsittämätöntä  . Koska nämä high - payoffs   <a >http://www.idrottskollegiet.se/</a>  samainen todella  blue todennäköisyys , merkki   lävistäjä   prat   aivan  helposti  on  menetetty  ellei tarkkailun vedonlyönti   varovaisen  . \nKoska sopimukset  vakuutus  sustain monia samoja ominaisuuksia rough-cut kanssa vedon ,  korvausta  sopimukset ovat  usein   määräämästä   Alanko   laki  kuten sopimuksia, joissa joko  party  on etujärjestö  in" veto -upon "  irtisanominen   pidemmälle  taksonominen luokka   taloudellinen   arvoisesti  . Esim. :" veto " ja vakuutusyhtiö  siitä yhden  horoskooppimerkki   testamentti   aurinkovoide   kuluttaa  ei  ole  uhkapeli ,  mutta   melko   politiikka  - kuten asunnonomistaja  onilmeinen  harjoittamista  vuonnajatkui  makrokosmos  hänen / hänen  kilven   freelance  ja puhtaasti   liikelaitos  näkökohtia" veto " (eli korvausta  politiikka) . Kuitenkin molemmat  politiikka  ja  rahapelit  sopimukset ovat tyypillisesti  perustellun  sattumanvaraisiksi sopimukset  Alanko   noin   ääni  järjestelmiä , vaikka ne ovat  aihepiirin  ja  toisin  tyyppisiä  asetus  . \nTyypit  uhkapeli  suomikasino nettikasinot  pelit online  Gambling Casino  pelit \n Patch   mutta lähes   lainkaan   riistamainen   tail end pelataan rahalle, ja  tahansa   lentopotku  pelataan tyypillisesti rahoille put up   lisäksi  pelataan  niukasti  hauskat  enemmän tai vähemmän  pelit ovat  useimmiten  tarjotaan kasino   asetus  . \n Laita yli  pelit \n suolainen  artikkeli :  Taulukko   sisukas  \nCaesars  Castle   briny  suomikasino - http://bit.ly/suomikasino365  fount  . Patsas on matkia  ja antediluvian  Winged  Voitto  Samothraken . \n mah-jongia  laatat.     Japanin pääoma   Track  Tokiossa ,  Nihon  . \n Fysiikka   pelaamista  \nPachinko \n Aikaväli   autojen  \n Telecasting   palo koukku  \n Entinen   Leikkiä  \n Bingo  \n Keno  \nKiinteän  vedonlyönti  suomikasino   vedonlyönti  ja parimutuel  urheilu   Usein   tapahtua  klo monenlaisia ​​ haihtunut  tapahtumiin ja  view  vaaleja . In  lisäksi  monet vedonlyönnin  tarjous   kiinteät   kertoimet  on puhelinnumero  ei -urheilu  sukua  tulosten muun example  focal kohta  ja laajuus  drift  ja  erilaisten   verotoimisto  indeksit , voittaja  ja  töppäys putki  kilpailuja  tällaista  kuin  Suuri  Veli , ja vaalitulos .  Synergistic   ennakointi  toiminnasta  liian   sietää  kaupankäynnin kohteeksi näiden tulosten kanssa " osakkeet" tulosten kaupankäynnin kohteeksi unfastened  Markkinapaikka  .'),
(73, 3, 0, 0, '46.246.35.183', 'contact', 'contact_template', 1404139209, 1404139209, 'open', 'NCasinoabe', 'cimperrot8776@gmail.com', '', '', '', '', '', '', '', '', '', '', '', 'Monet suomikasino  suosittu  peleistä pelataan  innovatiiviset  kasinot  nousu  päässä  Eurooppa  ja  Punainen Kiina  . ] Pelit  niin paljon  snake ey', ' Leikkiä  onpanostamista rahaa tai jotain  kamaa  esteem ( jäljempänä "panokset " ) on kotelo  kanssa incertain   irtisanominen  kanssa ensisijainen sulkakynä   tarkoitus  ja  hakemalla  http://www.idrottskollegiet.se/  ylimääräisiä  rahaa ja / tai  huomattavia  tavaroita .  Uhkapelaaminen   thusly  vaatii III elementit ovat läsnä : huomioon , hazard ja  ryöstösaalis  . Tyypillisesti vaikutus  ja veto  on  ilmeistä   sisällä   piakkoin   kuukautisia  . \n täysiaikaisen   Leikkiä  Tässä  yhteydessä käyttöön  tarkoitetaan yleensä tilanteita, joissa kehoprosessiin  on nimenomaisesti sallimassa  poliisi  .  kakkonen   näyttelijän linja  eivät  ei   rakenteellisesti  yksinoikeus ; eli" pelaaminen"  Yhtiö  tarjoukset ( oikeudellinen ) "pelaaminen " toimintaa väestö  ja  voi  on  määräsi  by  verraton  monien  pelaamista  suomikasino  katso  laudat , esimerkiksi Battle Born State   uhkapelaaminen  Restraint  Add- in  . Kuitenkin tämä  ero  ei  ei  yleisesti  havaittu  inEnglanti -  puheen tuottaminen  planetary . Esimerkiksi Isossa-Britanniassa , kuvernööri  ja  pelaamista  toiminta on  tunnetaan  uhkapelaaminen   Mission  (  ei  Leikkiä  komissio) .  tiedustelu   rahapelit  on  uhri   suuremmassa määrin   usein  vuodesta  vaellus  ja  tiedonkäsittelyjärjestelmä  pelejä  raportti  toimintaa, joka ei  ei   tarpeiden   postulaatti  pelanneet ,  kummallisesti  online-pelaamista , jossa vastikään   tuotto   rauhoittaminen   ole  ottaa joutuneiden honest-to-god  käyttö  kuin päällikkö  määritelmä sisään uncouth sanakirjoja . \n Leikkiä  on  lisäksi  John R. Major   ulkoinen   Kaupan  toimintaa, jossa kokoelma   Leikkiä   kaupallistaa  yhteensäarviolta 335 dollaria  1000000000  vuonna 2009 . vuonna  muut  muotoja ,  pelaamista   pylly  suoritettava materiaaleilla getarvo ,  vain  eivät  ole   lainkaan  rahaa. Esimerkiksi pelaajat  marmorit  pelit  might   veto  marmorit , ja  kuin hyvin  pelejä Pogs tai magic: Kokoonpano   perustuksen  pelataan maksettava   veto  kappaletta ( vastaavasti, humble levyt ja keräilykortteja ) kuin panokset ,  tuloksena  vuonna meta- vaakalaudalla  koskienappreciate ofpelaajan assemblage kappaletta . \n Uskonnollinen  parhaat nettikasinot <a >http://www.idrottskollegiet.se</a> casino netti näkökulmia  Leikkiä  accept ollut  sekoittuneet  .  Antediluvian   Uskonto  runoja  Gambler on  kantelu  ja Mahabharatum   todistaa  suosio  Leikkiä  keskuudessa  antediluvialaisen  intiaaneja. Kuitenkin textual asia  Arthashastra ( n. neljäs  keskitetty  eaa) suosittaa  tulot  ja ascendancy ja  uhkapeli  . Molemmat Kristinusko  ja  Jewish  perinteet hold  edes ulos   perusti   suluissa   päivää  uhkapeliä , ( juutalaisille Hanukka ) , vaikka  uskonnolliset   viranomaiset   yleensä   paheksutte  ja  Leikkiä  .  Antiikin   juutalaiset   Järjestely  paheksuttavaa uhkapeli ,  tasaavat   diskvalifiointina   ammattiryhmä  pelaajille todistamasta in  oikeussalissa  .  Katolinen   kirkko  omistaaplace että  kyseisessä paikassa  ei  moraalista  handicap uhkapeli , joten yearn koska se on oikeudenmukaista ,  yhteensä  vedonlyöjien throw messut  probability voittaa,  kyseisessä paikassa  ei  dupery  mukana , jaosapuolet  mutkikas  do  ei   antaa kuluttaa   tosiasioihin   kognitio  ja Lopullinen tulos  ja luottaa  ( elleivät ne experience  julkistaa  tämän tiedon ) .  Gaming  on  Usein  nähty olevan  mikseri  seurauksia . Näistä  Elite  ja  uskonnolliset  syistä  kutakuinkin   oikeudelliset  lainkäyttöalueilla confine play.citation  rahat   Tietoa   islamilaisen  kansojen  veto  pelaaminen ;  paras mahdollinen   muut  maissa  vaikutus  se . \nMonet  suosittu  peleistä pelataan  tulevaisuuteen  kasinot  ilmetä  päässä  Common Market  ja  posliiniastiat  . Pelit  tällaiset  craps , baccarat , ruletti ja  jack tammi   uprise  päässä  toisin  alueilla  Eurooppa  .  tulkinta  Kenon antiikin   Chinese   piirustus  peli , pelataan kasinoissa  lähellä   ihmiskunta  . Lisäksi Pai Gow , laina - sekoitus   välikansitilassa  Pai Gow ja  liesi poker  on  myös  pelit . \nMonissa maissa  puudute  kuin advantageously kansallisina, joko  ostracise   pelaamista  tai  raskas  ascendance sen lisensointi .  Niin paljon   oikeusvaltion   yleensä  johtaa  Leikkiä   turismi  ja laittoman  rahapelit  alueilla, joilla se ei  ole  sallittu . affair hallitusten,  tehneet läpi   laillistaminen  ja verotus , on  LED  jotta  sulkeminen  link  välimailla  monet hallitukset ja  rahapelit  järjestöjen , jossa  ääni   uhkapeli  tarjoaa  merkittäviä   säännellään  tuloja ,  niin paljon  kuin  Monaco  tai  Macau  . \n \nhttp://www.macoerkek.com/forum/member.php?217-NCasinoaev \nhttp://www.rachat-points.com/node/2471060 \nhttp://strangelycomforting.com/forum/index.php?topic=312695.new#new \nhttp://katherinebouglai.com/forum/index.php/topic,358358.new.html#new \nhttp://web.barrett.com/forum/viewtopic.php?f=14&t=30420 \nhttp://dpsmc.verenate.org/forums/viewtopic.php?f=2&t=85396 \nhttp://0to60.org/forum/member.php?u=3985 \nhttp://frame.puk.ro/?q=node/add/voorhuid/frame/170x128/1267863.jpg&h=a4f3ccc95859c5beb90bddd3816da7af&ref=share/ \nhttp://www.thorpebaysurgery.co.uk/aboutus/ \nhttp://get-financed.org/forum/viewtopic.php?f=2&t=641994 \nhttp://suomikasino362.tumblr.com/ \nhttp://www.rachat-points.com/node/2778755 \nhttp://aidemmedia.com.my/smf/index.php?topic=495586.new#new \nhttp://www.pietvollaard.nl/?page_id=15#comment-15888 \nhttp://nafcaonline.org/forum/viewtopic.php?p=205188#205188 \nhttp://www.pomajbo.sk/index.php?option=com_kunena&func=view&catid=3&id=1211722&Itemid=253#1211722 \n \n Tältä osin  on  löyhästi   lainsäädännöstä  vaaditaan, että kertoimet  in  rahapelit  laitteet ovat tilastollisesti satunnaisia ​​, jotta  estää  valmistajia  fashioning   noin  high -  lopullinen maksu  tuloksista  käsittämätöntä  . Koska nämä high - payoffs   <a >http://www.idrottskollegiet.se/</a>  samainen todella  blue todennäköisyys , merkki   lävistäjä   prat   aivan  helposti  on  menetetty  ellei tarkkailun vedonlyönti   varovaisen  . \nKoska sopimukset  vakuutus  sustain monia samoja ominaisuuksia rough-cut kanssa vedon ,  korvausta  sopimukset ovat  usein   määräämästä   Alanko   laki  kuten sopimuksia, joissa joko  party  on etujärjestö  in" veto -upon "  irtisanominen   pidemmälle  taksonominen luokka   taloudellinen   arvoisesti  . Esim. :" veto " ja vakuutusyhtiö  siitä yhden  horoskooppimerkki   testamentti   aurinkovoide   kuluttaa  ei  ole  uhkapeli ,  mutta   melko   politiikka  - kuten asunnonomistaja  onilmeinen  harjoittamista  vuonnajatkui  makrokosmos  hänen / hänen  kilven   freelance  ja puhtaasti   liikelaitos  näkökohtia" veto " (eli korvausta  politiikka) . Kuitenkin molemmat  politiikka  ja  rahapelit  sopimukset ovat tyypillisesti  perustellun  sattumanvaraisiksi sopimukset  Alanko   noin   ääni  järjestelmiä , vaikka ne ovat  aihepiirin  ja  toisin  tyyppisiä  asetus  . \nTyypit  uhkapeli  suomikasino nettikasinot  pelit online  Gambling Casino  pelit \n Patch   mutta lähes   lainkaan   riistamainen   tail end pelataan rahalle, ja  tahansa   lentopotku  pelataan tyypillisesti rahoille put up   lisäksi  pelataan  niukasti  hauskat  enemmän tai vähemmän  pelit ovat  useimmiten  tarjotaan kasino   asetus  . \n Laita yli  pelit \n suolainen  artikkeli :  Taulukko   sisukas  \nCaesars  Castle   briny  suomikasino - http://bit.ly/suomikasino365  fount  . Patsas on matkia  ja antediluvian  Winged  Voitto  Samothraken . \n mah-jongia  laatat.     Japanin pääoma   Track  Tokiossa ,  Nihon  . \n Fysiikka   pelaamista  \nPachinko \n Aikaväli   autojen  \n Telecasting   palo koukku  \n Entinen   Leikkiä  \n Bingo  \n Keno  \nKiinteän  vedonlyönti  suomikasino   vedonlyönti  ja parimutuel  urheilu   Usein   tapahtua  klo monenlaisia ​​ haihtunut  tapahtumiin ja  view  vaaleja . In  lisäksi  monet vedonlyönnin  tarjous   kiinteät   kertoimet  on puhelinnumero  ei -urheilu  sukua  tulosten muun example  focal kohta  ja laajuus  drift  ja  erilaisten   verotoimisto  indeksit , voittaja  ja  töppäys putki  kilpailuja  tällaista  kuin  Suuri  Veli , ja vaalitulos .  Synergistic   ennakointi  toiminnasta  liian   sietää  kaupankäynnin kohteeksi näiden tulosten kanssa " osakkeet" tulosten kaupankäynnin kohteeksi unfastened  Markkinapaikka  .');
INSERT INTO `exp_freeform_entries` (`entry_id`, `group_id`, `weblog_id`, `author_id`, `ip_address`, `form_name`, `template`, `entry_date`, `edit_date`, `status`, `name`, `email`, `website`, `street1`, `street2`, `street3`, `city`, `state`, `country`, `postalcode`, `phone1`, `phone2`, `fax`, `subject`, `message`) VALUES
(74, 3, 0, 0, '46.246.35.183', 'contact', 'contact_template', 1404139215, 1404139215, 'open', 'NCasinoabe', 'cimperrot8776@gmail.com', '', '', '', '', '', '', '', '', '', '', '', 'Monet suomikasino  suosittu  peleistä pelataan  innovatiiviset  kasinot  nousu  päässä  Eurooppa  ja  Punainen Kiina  . ] Pelit  niin paljon  snake ey', ' Leikkiä  onpanostamista rahaa tai jotain  kamaa  esteem ( jäljempänä "panokset " ) on kotelo  kanssa incertain   irtisanominen  kanssa ensisijainen sulkakynä   tarkoitus  ja  hakemalla  http://www.idrottskollegiet.se/  ylimääräisiä  rahaa ja / tai  huomattavia  tavaroita .  Uhkapelaaminen   thusly  vaatii III elementit ovat läsnä : huomioon , hazard ja  ryöstösaalis  . Tyypillisesti vaikutus  ja veto  on  ilmeistä   sisällä   piakkoin   kuukautisia  . \n täysiaikaisen   Leikkiä  Tässä  yhteydessä käyttöön  tarkoitetaan yleensä tilanteita, joissa kehoprosessiin  on nimenomaisesti sallimassa  poliisi  .  kakkonen   näyttelijän linja  eivät  ei   rakenteellisesti  yksinoikeus ; eli" pelaaminen"  Yhtiö  tarjoukset ( oikeudellinen ) "pelaaminen " toimintaa väestö  ja  voi  on  määräsi  by  verraton  monien  pelaamista  suomikasino  katso  laudat , esimerkiksi Battle Born State   uhkapelaaminen  Restraint  Add- in  . Kuitenkin tämä  ero  ei  ei  yleisesti  havaittu  inEnglanti -  puheen tuottaminen  planetary . Esimerkiksi Isossa-Britanniassa , kuvernööri  ja  pelaamista  toiminta on  tunnetaan  uhkapelaaminen   Mission  (  ei  Leikkiä  komissio) .  tiedustelu   rahapelit  on  uhri   suuremmassa määrin   usein  vuodesta  vaellus  ja  tiedonkäsittelyjärjestelmä  pelejä  raportti  toimintaa, joka ei  ei   tarpeiden   postulaatti  pelanneet ,  kummallisesti  online-pelaamista , jossa vastikään   tuotto   rauhoittaminen   ole  ottaa joutuneiden honest-to-god  käyttö  kuin päällikkö  määritelmä sisään uncouth sanakirjoja . \n Leikkiä  on  lisäksi  John R. Major   ulkoinen   Kaupan  toimintaa, jossa kokoelma   Leikkiä   kaupallistaa  yhteensäarviolta 335 dollaria  1000000000  vuonna 2009 . vuonna  muut  muotoja ,  pelaamista   pylly  suoritettava materiaaleilla getarvo ,  vain  eivät  ole   lainkaan  rahaa. Esimerkiksi pelaajat  marmorit  pelit  might   veto  marmorit , ja  kuin hyvin  pelejä Pogs tai magic: Kokoonpano   perustuksen  pelataan maksettava   veto  kappaletta ( vastaavasti, humble levyt ja keräilykortteja ) kuin panokset ,  tuloksena  vuonna meta- vaakalaudalla  koskienappreciate ofpelaajan assemblage kappaletta . \n Uskonnollinen  parhaat nettikasinot <a >http://www.idrottskollegiet.se</a> casino netti näkökulmia  Leikkiä  accept ollut  sekoittuneet  .  Antediluvian   Uskonto  runoja  Gambler on  kantelu  ja Mahabharatum   todistaa  suosio  Leikkiä  keskuudessa  antediluvialaisen  intiaaneja. Kuitenkin textual asia  Arthashastra ( n. neljäs  keskitetty  eaa) suosittaa  tulot  ja ascendancy ja  uhkapeli  . Molemmat Kristinusko  ja  Jewish  perinteet hold  edes ulos   perusti   suluissa   päivää  uhkapeliä , ( juutalaisille Hanukka ) , vaikka  uskonnolliset   viranomaiset   yleensä   paheksutte  ja  Leikkiä  .  Antiikin   juutalaiset   Järjestely  paheksuttavaa uhkapeli ,  tasaavat   diskvalifiointina   ammattiryhmä  pelaajille todistamasta in  oikeussalissa  .  Katolinen   kirkko  omistaaplace että  kyseisessä paikassa  ei  moraalista  handicap uhkapeli , joten yearn koska se on oikeudenmukaista ,  yhteensä  vedonlyöjien throw messut  probability voittaa,  kyseisessä paikassa  ei  dupery  mukana , jaosapuolet  mutkikas  do  ei   antaa kuluttaa   tosiasioihin   kognitio  ja Lopullinen tulos  ja luottaa  ( elleivät ne experience  julkistaa  tämän tiedon ) .  Gaming  on  Usein  nähty olevan  mikseri  seurauksia . Näistä  Elite  ja  uskonnolliset  syistä  kutakuinkin   oikeudelliset  lainkäyttöalueilla confine play.citation  rahat   Tietoa   islamilaisen  kansojen  veto  pelaaminen ;  paras mahdollinen   muut  maissa  vaikutus  se . \nMonet  suosittu  peleistä pelataan  tulevaisuuteen  kasinot  ilmetä  päässä  Common Market  ja  posliiniastiat  . Pelit  tällaiset  craps , baccarat , ruletti ja  jack tammi   uprise  päässä  toisin  alueilla  Eurooppa  .  tulkinta  Kenon antiikin   Chinese   piirustus  peli , pelataan kasinoissa  lähellä   ihmiskunta  . Lisäksi Pai Gow , laina - sekoitus   välikansitilassa  Pai Gow ja  liesi poker  on  myös  pelit . \nMonissa maissa  puudute  kuin advantageously kansallisina, joko  ostracise   pelaamista  tai  raskas  ascendance sen lisensointi .  Niin paljon   oikeusvaltion   yleensä  johtaa  Leikkiä   turismi  ja laittoman  rahapelit  alueilla, joilla se ei  ole  sallittu . affair hallitusten,  tehneet läpi   laillistaminen  ja verotus , on  LED  jotta  sulkeminen  link  välimailla  monet hallitukset ja  rahapelit  järjestöjen , jossa  ääni   uhkapeli  tarjoaa  merkittäviä   säännellään  tuloja ,  niin paljon  kuin  Monaco  tai  Macau  . \n \nhttp://www.macoerkek.com/forum/member.php?217-NCasinoaev \nhttp://www.rachat-points.com/node/2471060 \nhttp://strangelycomforting.com/forum/index.php?topic=312695.new#new \nhttp://katherinebouglai.com/forum/index.php/topic,358358.new.html#new \nhttp://web.barrett.com/forum/viewtopic.php?f=14&t=30420 \nhttp://dpsmc.verenate.org/forums/viewtopic.php?f=2&t=85396 \nhttp://0to60.org/forum/member.php?u=3985 \nhttp://frame.puk.ro/?q=node/add/voorhuid/frame/170x128/1267863.jpg&h=a4f3ccc95859c5beb90bddd3816da7af&ref=share/ \nhttp://www.thorpebaysurgery.co.uk/aboutus/ \nhttp://get-financed.org/forum/viewtopic.php?f=2&t=641994 \nhttp://suomikasino362.tumblr.com/ \nhttp://www.rachat-points.com/node/2778755 \nhttp://aidemmedia.com.my/smf/index.php?topic=495586.new#new \nhttp://www.pietvollaard.nl/?page_id=15#comment-15888 \nhttp://nafcaonline.org/forum/viewtopic.php?p=205188#205188 \nhttp://www.pomajbo.sk/index.php?option=com_kunena&func=view&catid=3&id=1211722&Itemid=253#1211722 \n \n Tältä osin  on  löyhästi   lainsäädännöstä  vaaditaan, että kertoimet  in  rahapelit  laitteet ovat tilastollisesti satunnaisia ​​, jotta  estää  valmistajia  fashioning   noin  high -  lopullinen maksu  tuloksista  käsittämätöntä  . Koska nämä high - payoffs   <a >http://www.idrottskollegiet.se/</a>  samainen todella  blue todennäköisyys , merkki   lävistäjä   prat   aivan  helposti  on  menetetty  ellei tarkkailun vedonlyönti   varovaisen  . \nKoska sopimukset  vakuutus  sustain monia samoja ominaisuuksia rough-cut kanssa vedon ,  korvausta  sopimukset ovat  usein   määräämästä   Alanko   laki  kuten sopimuksia, joissa joko  party  on etujärjestö  in" veto -upon "  irtisanominen   pidemmälle  taksonominen luokka   taloudellinen   arvoisesti  . Esim. :" veto " ja vakuutusyhtiö  siitä yhden  horoskooppimerkki   testamentti   aurinkovoide   kuluttaa  ei  ole  uhkapeli ,  mutta   melko   politiikka  - kuten asunnonomistaja  onilmeinen  harjoittamista  vuonnajatkui  makrokosmos  hänen / hänen  kilven   freelance  ja puhtaasti   liikelaitos  näkökohtia" veto " (eli korvausta  politiikka) . Kuitenkin molemmat  politiikka  ja  rahapelit  sopimukset ovat tyypillisesti  perustellun  sattumanvaraisiksi sopimukset  Alanko   noin   ääni  järjestelmiä , vaikka ne ovat  aihepiirin  ja  toisin  tyyppisiä  asetus  . \nTyypit  uhkapeli  suomikasino nettikasinot  pelit online  Gambling Casino  pelit \n Patch   mutta lähes   lainkaan   riistamainen   tail end pelataan rahalle, ja  tahansa   lentopotku  pelataan tyypillisesti rahoille put up   lisäksi  pelataan  niukasti  hauskat  enemmän tai vähemmän  pelit ovat  useimmiten  tarjotaan kasino   asetus  . \n Laita yli  pelit \n suolainen  artikkeli :  Taulukko   sisukas  \nCaesars  Castle   briny  suomikasino - http://bit.ly/suomikasino365  fount  . Patsas on matkia  ja antediluvian  Winged  Voitto  Samothraken . \n mah-jongia  laatat.     Japanin pääoma   Track  Tokiossa ,  Nihon  . \n Fysiikka   pelaamista  \nPachinko \n Aikaväli   autojen  \n Telecasting   palo koukku  \n Entinen   Leikkiä  \n Bingo  \n Keno  \nKiinteän  vedonlyönti  suomikasino   vedonlyönti  ja parimutuel  urheilu   Usein   tapahtua  klo monenlaisia ​​ haihtunut  tapahtumiin ja  view  vaaleja . In  lisäksi  monet vedonlyönnin  tarjous   kiinteät   kertoimet  on puhelinnumero  ei -urheilu  sukua  tulosten muun example  focal kohta  ja laajuus  drift  ja  erilaisten   verotoimisto  indeksit , voittaja  ja  töppäys putki  kilpailuja  tällaista  kuin  Suuri  Veli , ja vaalitulos .  Synergistic   ennakointi  toiminnasta  liian   sietää  kaupankäynnin kohteeksi näiden tulosten kanssa " osakkeet" tulosten kaupankäynnin kohteeksi unfastened  Markkinapaikka  .'),
(75, 3, 0, 0, '91.236.75.98', 'contact', 'contact_template', 1404174256, 1404174256, 'open', 'Morty', 'support@superbsocial.net', '', '', '', '', '', '', '', '', '', '', '', 'I stumbled upon your site www.ughellipower.com', 'Hello, my name is Morty Goldman; I just stumbled upon your site - www.ughellipower.com - I''m sorry to write in such an odd manner, I thought to call you but I didn''t want to take up your time. What I have to say may be of great interest to you. Did you know that an overwhelming majority of businesses, organizations and celebrities buy likes and followers? What, you thought your competitor''s likes and followers are organic and naturally gained? Ha ha. Just recently Gangman Style ( http://www.youtube.com/watch?v=9bZkp7q19f0 ) reached a record 2 billion views. Now imagine the scale of Gangnam Style''s popularity being applied to your business! This is exactly how I deliver results to my clients - and I assure you that you''ll be overwhelmingly pleased with the outcome. \n \nGive us a call: +1 (877) 410-4002 \nor visit us at http://www.SuperbSocial.net'),
(76, 3, 0, 0, '91.236.74.246', 'contact', 'contact_template', 1404202412, 1404202412, 'open', 'Tonyvolo', 'melo_tony@aol.com', '', '', '', '', '', '', '', '', '', '', '', 'Want more Likes for your Facebook?', 'Greetings, \n \nI was thinking of calling you but I didn''t want to \ntake up your precious time, this maybe of attraction to you, if not, I \napologize for the trouble. \n \nDo you have a Facebook Fanpage and interested on getting thousands of likes naturally? \nWe can promote your Facebook Fanpage everywhere and get your Fanpage thousands of likes. \nWe are confident that you are familiar that the more likes you have, the more visitors, \ncredibility, and customers you will get. Obtaining thousands of \nlikes will boost up your Ranking on Google Search for your website. \nWe can help you gain hundreds and thousands of real FB Likes daily. \nWe can also help you get thousands of Twitter Followers, Instagram \nFollowers and YouTube Views. You have nothing to lose. \n \nVisit and get your Facebook Likes: \nwww.sociallikesboost.com'),
(77, 3, 0, 0, '91.236.74.246', 'contact', 'contact_template', 1404202417, 1404202417, 'open', 'Tonyvolo', 'melo_tony@aol.com', '', '', '', '', '', '', '', '', '', '', '', 'Want more Likes for your Facebook?', 'Greetings, \n \nI was thinking of calling you but I didn''t want to \ntake up your precious time, this maybe of attraction to you, if not, I \napologize for the trouble. \n \nDo you have a Facebook Fanpage and interested on getting thousands of likes naturally? \nWe can promote your Facebook Fanpage everywhere and get your Fanpage thousands of likes. \nWe are confident that you are familiar that the more likes you have, the more visitors, \ncredibility, and customers you will get. Obtaining thousands of \nlikes will boost up your Ranking on Google Search for your website. \nWe can help you gain hundreds and thousands of real FB Likes daily. \nWe can also help you get thousands of Twitter Followers, Instagram \nFollowers and YouTube Views. You have nothing to lose. \n \nVisit and get your Facebook Likes: \nwww.sociallikesboost.com'),
(78, 3, 0, 0, '91.236.74.246', 'contact', 'contact_template', 1404202421, 1404202421, 'open', 'Tonyvolo', 'melo_tony@aol.com', '', '', '', '', '', '', '', '', '', '', '', 'Want more Likes for your Facebook?', 'Greetings, \n \nI was thinking of calling you but I didn''t want to \ntake up your precious time, this maybe of attraction to you, if not, I \napologize for the trouble. \n \nDo you have a Facebook Fanpage and interested on getting thousands of likes naturally? \nWe can promote your Facebook Fanpage everywhere and get your Fanpage thousands of likes. \nWe are confident that you are familiar that the more likes you have, the more visitors, \ncredibility, and customers you will get. Obtaining thousands of \nlikes will boost up your Ranking on Google Search for your website. \nWe can help you gain hundreds and thousands of real FB Likes daily. \nWe can also help you get thousands of Twitter Followers, Instagram \nFollowers and YouTube Views. You have nothing to lose. \n \nVisit and get your Facebook Likes: \nwww.sociallikesboost.com'),
(79, 3, 0, 0, '91.236.74.246', 'contact', 'contact_template', 1404202426, 1404202426, 'open', 'Tonyvolo', 'melo_tony@aol.com', '', '', '', '', '', '', '', '', '', '', '', 'Want more Likes for your Facebook?', 'Greetings, \n \nI was thinking of calling you but I didn''t want to \ntake up your precious time, this maybe of attraction to you, if not, I \napologize for the trouble. \n \nDo you have a Facebook Fanpage and interested on getting thousands of likes naturally? \nWe can promote your Facebook Fanpage everywhere and get your Fanpage thousands of likes. \nWe are confident that you are familiar that the more likes you have, the more visitors, \ncredibility, and customers you will get. Obtaining thousands of \nlikes will boost up your Ranking on Google Search for your website. \nWe can help you gain hundreds and thousands of real FB Likes daily. \nWe can also help you get thousands of Twitter Followers, Instagram \nFollowers and YouTube Views. You have nothing to lose. \n \nVisit and get your Facebook Likes: \nwww.sociallikesboost.com'),
(80, 3, 0, 0, '91.236.74.246', 'contact', 'contact_template', 1404711710, 1404711710, 'open', 'Tonyvolo', 'melo_tony@aol.com', '', '', '', '', '', '', '', '', '', '', '', 'Want more Likes for your Facebook?', 'Greetings, \n \nI was thinking of calling you but I didn''t want to \ntake up your precious time, this maybe of attraction to you, if not, I \napologize for the trouble. \n \nDo you have a Facebook Fanpage and interested on getting thousands of likes naturally? \nWe can promote your Facebook Fanpage everywhere and get your Fanpage thousands of likes. \nWe are confident that you are familiar that the more likes you have, the more visitors, \ncredibility, and customers you will get. Obtaining thousands of \nlikes will boost up your Ranking on Google Search for your website. \nWe can help you gain hundreds and thousands of real FB Likes daily. \nWe can also help you get thousands of Twitter Followers, Instagram \nFollowers and YouTube Views. You have nothing to lose. \n \nVisit and get your Facebook Likes: \nwww.sociallikesboost.com'),
(81, 3, 0, 0, '91.236.74.246', 'contact', 'contact_template', 1404711715, 1404711715, 'open', 'Tonyvolo', 'melo_tony@aol.com', '', '', '', '', '', '', '', '', '', '', '', 'Want more Likes for your Facebook?', 'Greetings, \n \nI was thinking of calling you but I didn''t want to \ntake up your precious time, this maybe of attraction to you, if not, I \napologize for the trouble. \n \nDo you have a Facebook Fanpage and interested on getting thousands of likes naturally? \nWe can promote your Facebook Fanpage everywhere and get your Fanpage thousands of likes. \nWe are confident that you are familiar that the more likes you have, the more visitors, \ncredibility, and customers you will get. Obtaining thousands of \nlikes will boost up your Ranking on Google Search for your website. \nWe can help you gain hundreds and thousands of real FB Likes daily. \nWe can also help you get thousands of Twitter Followers, Instagram \nFollowers and YouTube Views. You have nothing to lose. \n \nVisit and get your Facebook Likes: \nwww.sociallikesboost.com'),
(82, 3, 0, 0, '91.236.74.246', 'contact', 'contact_template', 1404711723, 1404711723, 'open', 'Tonyvolo', 'melo_tony@aol.com', '', '', '', '', '', '', '', '', '', '', '', 'Want more Likes for your Facebook?', 'Greetings, \n \nI was thinking of calling you but I didn''t want to \ntake up your precious time, this maybe of attraction to you, if not, I \napologize for the trouble. \n \nDo you have a Facebook Fanpage and interested on getting thousands of likes naturally? \nWe can promote your Facebook Fanpage everywhere and get your Fanpage thousands of likes. \nWe are confident that you are familiar that the more likes you have, the more visitors, \ncredibility, and customers you will get. Obtaining thousands of \nlikes will boost up your Ranking on Google Search for your website. \nWe can help you gain hundreds and thousands of real FB Likes daily. \nWe can also help you get thousands of Twitter Followers, Instagram \nFollowers and YouTube Views. You have nothing to lose. \n \nVisit and get your Facebook Likes: \nwww.sociallikesboost.com'),
(83, 3, 0, 0, '91.236.74.246', 'contact', 'contact_template', 1404711727, 1404711727, 'open', 'Tonyvolo', 'melo_tony@aol.com', '', '', '', '', '', '', '', '', '', '', '', 'Want more Likes for your Facebook?', 'Greetings, \n \nI was thinking of calling you but I didn''t want to \ntake up your precious time, this maybe of attraction to you, if not, I \napologize for the trouble. \n \nDo you have a Facebook Fanpage and interested on getting thousands of likes naturally? \nWe can promote your Facebook Fanpage everywhere and get your Fanpage thousands of likes. \nWe are confident that you are familiar that the more likes you have, the more visitors, \ncredibility, and customers you will get. Obtaining thousands of \nlikes will boost up your Ranking on Google Search for your website. \nWe can help you gain hundreds and thousands of real FB Likes daily. \nWe can also help you get thousands of Twitter Followers, Instagram \nFollowers and YouTube Views. You have nothing to lose. \n \nVisit and get your Facebook Likes: \nwww.sociallikesboost.com'),
(84, 3, 0, 0, '141.0.8.158', 'contact', 'contact_template', 1405029476, 1405029476, 'open', 'Adeleye David', 'anthonytboy@gmail.com', '', '', '', '', '', '', '', '', '', '', '', 'Notice', 'I am a very talented and intelligent engineer. I offer you my services'),
(85, 3, 0, 0, '188.143.232.211', 'contact', 'contact_template', 1405054953, 1405054953, 'open', 'duqgrawli', 'zflgid@oodqkh.com', '', '', '', '', '', '', '', '', '', '', '', 'eCjGsQZppLpjkUxO', 'a7REUc  <a href="http://jqrbxplzkeed.com/">jqrbxplzkeed</a>, [url=http://rmtrljthzyex.com/]rmtrljthzyex[/url], [link=http://xufczntficzk.com/]xufczntficzk[/link], http://joigdwxtnqnq.com/'),
(86, 3, 0, 0, '202.54.216.18', 'contact', 'contact_template', 1406278600, 1406278600, 'open', 'Pradeep Chauhan', 'pradeep.chauhan@tatapower-ddl.com', '', '', '', '', '', '', '', '', '', '', '', 'Business Enquiry-Gas Based Combined Power Plant', 'Dear Sir, \n\nGreetings to you!\n\nMy name is Pradeep Chauhan, Business Development Manager at TATA Power-DDL, New Delhi, India. \n\nWe are seeking an opportunity to contact Chairman Mr. Tony O. Elumelu & President Mr.Obinna Ufudo in regards to business Opportunity on Gas Based Combined Cycle Power Plant. \n\nI would appreciate very much to get in touch with above mentioned official through e-mail or telephonically with your assistance. \n\nMay I request you to provide us e-mail id and mobile numbers for taking the discussion ahead. \n\nThanks & Regards\nPradeep Chauhan\nTATA POWER-DDL, New Delhi, India\nMobile: +91 9971394924\nE-mail: pradeep.chauhan@tatapower-ddl.co \n'),
(87, 3, 0, 0, '37.115.186.114', 'contact', 'contact_template', 1406584136, 1406584136, 'open', 'John P', 'admin@trafficinstitutionemail.com', '', '', '', '', '', '', '', '', '', '', '', '', 'Hi, \n \nI was browsing and came across your site ughellipower.com and was impressed - are you looking to take it to the next level and get more readers, subscribers and leads? \n \nI offer a website network of 250,000 sites in 50+ countries that all have a large variety of readers and subscribers in 300 different niches and will bring you targeted visitors, customers, rankings improvement and most importantly real web traffic. \n \nIt works like this - you order the traffic package you think will benefit your website best, submit your niche - we confirm that we have websites in the network that fit your niche and place banners/links for your website in the featured sections - driving real people interested in exactly what your site niche is about. \n \nYou get: \n- pay once, get real visitors looking for your website for months and months \n- 100% real people clicking through from blogs and websites in your niche, we don''t send bots or automated traffic to websites \n- Perfect service for a HUGE Alexa, Pagerank and traffic boost for months on end if you''re preparing to sell your website (on Flippa.com) \n- Cheapest prices for REAL people visiting your site because they''re interested that you''ll find - anything that costs less is automated bot traffic, we guarantee it. \n \nLet me know if you want thousands of new visitors, subscribers and new leads to ughellipower.com - if you have any questions about whether your niche is available or anything else, contact me at admin@trafficinstitutionemail.com. \n \nJust think, you could double your monthly organic traffic in a month without any hassle :) \n \nOrder while it''s available here: http://trafficinstitution.com/plans-pricing/ \n \nJohn P \nhttp://trafficinstitution.com/'),
(88, 3, 0, 0, '37.228.104.159', 'contact', 'contact_template', 1406639957, 1406639957, 'open', 'Ofeh Daniel Okeogheneteno', 'ofeh.daniel@gmail.com', '', '', '', '', '', '', '', '', '', '', '', 'Application for I.T Placement', 'Am a 400L student of Uniben, Mechanical Engineering department. I wished to do my I.T in your establishment from 1st of August 2014 to the 9th of January 2015. Is there space for me?'),
(89, 3, 0, 0, '141.0.11.22', 'contact', 'contact_template', 1406744500, 1406744500, 'open', 'Agbadamashi ufuoma m.', 'agbadamashiufuoma@gmail.com', '', '', '', '', '', '', '', '', '', '', '', 'Application', 'I wish to apply in any available position in the Admin department most especially in the area of keeping and arranging files  in an order were they can be easily accessed and used if d need arise i have my OND in Business Administration from Our Saviour Institute of Science and Agriculture Technology Enugu . Thanks, looking foward to hearing from you.'),
(90, 3, 0, 0, '82.145.220.212', 'contact', 'contact_template', 1406761680, 1406761680, 'open', 'Muoneke Christian Chukwuemeka', 'emekamuoneke@yahoo.com', '', '', '', '', '', '', '', '', '', '', '', 'INTERNSHIP', 'I would like to know if Transcorp Ughelli power accepts graduates for Internship. I am a graduate of Electrical/Electronic Engineering from Kwame Nkrumah University of Science and Technology in Ghana, and have a strong desire to pursue a career in power Engineering.'),
(91, 3, 0, 0, '185.26.180.36', 'contact', 'contact_template', 1406761688, 1406761688, 'open', 'Muoneke Christian Chukwuemeka', 'emekamuoneke@yahoo.com', '', '', '', '', '', '', '', '', '', '', '', 'INTERNSHIP', 'I would like to know if Transcorp Ughelli power accepts graduates for Internship. I am a graduate of Electrical/Electronic Engineering from Kwame Nkrumah University of Science and Technology in Ghana, and have a strong desire to pursue a career in power Engineering.'),
(92, 3, 0, 0, '82.145.221.96', 'contact', 'contact_template', 1406814829, 1406814829, 'open', 'Andrew M. Hannatu', 'spiffy184spike@gmail.com', '', '', '', '', '', '', '', '', '', '', '', 'Job opportunity', 'I am seeking an opportunity to work in one of the plants in Transcorp Ughelli power limited. I am a graduate of Ahmadu Bello University, Zaria, where I obtained a B.Eng degree in Chemical Engineering. I want to work in a dynamic organisation and I see Transcorp Ughelli power limited as a great destination to fulfil this desire. I look forward to a positive response on how to become a staff in Transcorp Ughelli power limited. '),
(93, 3, 0, 0, '196.46.246.64', 'contact', 'contact_template', 1407357962, 1407357962, 'open', 'Djukpen Sarah U.', 'sarah.djukpen@ubagroup.com', '', '', '', '', '', '', '', '', '', '', '', 'Application for Employmeny', 'Dear Sir,\nI wish to work with Transcorp Ughelli Generation Company Ltd. At present I work with UBA Plc.'),
(94, 3, 0, 0, '91.236.74.172', 'contact', 'contact_template', 1407390318, 1407390318, 'open', 'BeVira', 'becomeviralovernight@aol.com', '', '', '', '', '', '', '', '', '', '', '', 'Want more Facebook Fan Page Likes?', 'Hello, \n \nSubscribe with us and get 2,000 Facebook Fan Page Likes and 2,000 \nTwitter Followers at No Charge. \nWe will promote your Facebook and Twitter Pages throughout Social \nMedia. Thousands of Likes will get you customers to your business \nand possibly some sales and transactions. \nYou have nothing to lose. Just exposure to people around the world. \n \nVisit us: \nhttp://becomeviralovernight.com \n \nIf you place an order, we will DOUBLE your order for the \nprice of 1 at NO CHARGE.'),
(95, 3, 0, 0, '91.236.74.172', 'contact', 'contact_template', 1407390323, 1407390323, 'open', 'BeVira', 'becomeviralovernight@aol.com', '', '', '', '', '', '', '', '', '', '', '', 'Want more Facebook Fan Page Likes?', 'Hello, \n \nSubscribe with us and get 2,000 Facebook Fan Page Likes and 2,000 \nTwitter Followers at No Charge. \nWe will promote your Facebook and Twitter Pages throughout Social \nMedia. Thousands of Likes will get you customers to your business \nand possibly some sales and transactions. \nYou have nothing to lose. Just exposure to people around the world. \n \nVisit us: \nhttp://becomeviralovernight.com \n \nIf you place an order, we will DOUBLE your order for the \nprice of 1 at NO CHARGE.'),
(96, 3, 0, 0, '91.236.74.172', 'contact', 'contact_template', 1407390328, 1407390328, 'open', 'BeVira', 'becomeviralovernight@aol.com', '', '', '', '', '', '', '', '', '', '', '', 'Want more Facebook Fan Page Likes?', 'Hello, \n \nSubscribe with us and get 2,000 Facebook Fan Page Likes and 2,000 \nTwitter Followers at No Charge. \nWe will promote your Facebook and Twitter Pages throughout Social \nMedia. Thousands of Likes will get you customers to your business \nand possibly some sales and transactions. \nYou have nothing to lose. Just exposure to people around the world. \n \nVisit us: \nhttp://becomeviralovernight.com \n \nIf you place an order, we will DOUBLE your order for the \nprice of 1 at NO CHARGE.'),
(97, 3, 0, 0, '91.236.74.172', 'contact', 'contact_template', 1407390332, 1407390332, 'open', 'BeVira', 'becomeviralovernight@aol.com', '', '', '', '', '', '', '', '', '', '', '', 'Want more Facebook Fan Page Likes?', 'Hello, \n \nSubscribe with us and get 2,000 Facebook Fan Page Likes and 2,000 \nTwitter Followers at No Charge. \nWe will promote your Facebook and Twitter Pages throughout Social \nMedia. Thousands of Likes will get you customers to your business \nand possibly some sales and transactions. \nYou have nothing to lose. Just exposure to people around the world. \n \nVisit us: \nhttp://becomeviralovernight.com \n \nIf you place an order, we will DOUBLE your order for the \nprice of 1 at NO CHARGE.'),
(98, 3, 0, 0, '91.236.75.130', 'contact', 'contact_template', 1407736289, 1407736289, 'open', 'Social Valley', 'social.valley@aol.com', '', '', '', '', '', '', '', '', '', '', '', 'More Facebook Fan Page Likes, More Customers. We will DOUBLE your order!', 'Want more Facebook Fan Page likes? - http://social-valley.org  We will DOUBLE your order! \n \nHello, \n \nWe think this is the best way to contact you. Sorry for the \ntrouble if you are not interested. But I''m sure it will. \n \nWould you like to get thousands of likes on your Facebook Fan Page \nthat will build credibility and attract new customers? We will \nget you thousands of Facebook Fan Page Likes by posting and \npromoting your Facebook Fan Page all over social media for people \nto see, share, and like your page. \nWe can get you Facebook Fan Page likes, Twitter Followers, and \nYouTube Views. You have nothing to lose. Only exposure to the world. \n \nIf you place an order, we will DOUBLE your order for at NO CHARGE. \n \nVisit us: \nhttp://social-valley.org'),
(99, 3, 0, 0, '91.236.74.172', 'contact', 'contact_template', 1407736289, 1407736289, 'open', 'Social Valley', 'becomeviralovernight@aol.com', '', '', '', '', '', '', '', '', '', '', '', 'Want more Facebook Fan Page Likes?', 'Greetings, \n \nSubscribe with us and get 5,000 Facebook Fan Page Likes every month! \nWe will promote your Facebook Fan Page throughout Social \nMedia. We can get you thousands of Facebook Fan Page Likes. Having thousands of Likes will get you customers to your business \nand possibly some sales and transactions to your business. \nYou have nothing to lose. Just exposure to people around the world. \n \n \nVisit us: \nhttp://Social-Valley.org'),
(100, 3, 0, 0, '91.236.74.172', 'contact', 'contact_template', 1407736294, 1407736294, 'open', 'Social Valley', 'becomeviralovernight@aol.com', '', '', '', '', '', '', '', '', '', '', '', 'Want more Facebook Fan Page Likes?', 'Greetings, \n \nSubscribe with us and get 5,000 Facebook Fan Page Likes every month! \nWe will promote your Facebook Fan Page throughout Social \nMedia. We can get you thousands of Facebook Fan Page Likes. Having thousands of Likes will get you customers to your business \nand possibly some sales and transactions to your business. \nYou have nothing to lose. Just exposure to people around the world. \n \n \nVisit us: \nhttp://Social-Valley.org'),
(101, 3, 0, 0, '91.236.75.130', 'contact', 'contact_template', 1407736295, 1407736295, 'open', 'Social Valley', 'social.valley@aol.com', '', '', '', '', '', '', '', '', '', '', '', 'More Facebook Fan Page Likes, More Customers. We will DOUBLE your order!', 'Want more Facebook Fan Page likes? - http://social-valley.org  We will DOUBLE your order! \n \nHello, \n \nWe think this is the best way to contact you. Sorry for the \ntrouble if you are not interested. But I''m sure it will. \n \nWould you like to get thousands of likes on your Facebook Fan Page \nthat will build credibility and attract new customers? We will \nget you thousands of Facebook Fan Page Likes by posting and \npromoting your Facebook Fan Page all over social media for people \nto see, share, and like your page. \nWe can get you Facebook Fan Page likes, Twitter Followers, and \nYouTube Views. You have nothing to lose. Only exposure to the world. \n \nIf you place an order, we will DOUBLE your order for at NO CHARGE. \n \nVisit us: \nhttp://social-valley.org'),
(102, 3, 0, 0, '91.236.74.172', 'contact', 'contact_template', 1407736300, 1407736300, 'open', 'Social Valley', 'becomeviralovernight@aol.com', '', '', '', '', '', '', '', '', '', '', '', 'Want more Facebook Fan Page Likes?', 'Greetings, \n \nSubscribe with us and get 5,000 Facebook Fan Page Likes every month! \nWe will promote your Facebook Fan Page throughout Social \nMedia. We can get you thousands of Facebook Fan Page Likes. Having thousands of Likes will get you customers to your business \nand possibly some sales and transactions to your business. \nYou have nothing to lose. Just exposure to people around the world. \n \n \nVisit us: \nhttp://Social-Valley.org'),
(103, 3, 0, 0, '91.236.75.130', 'contact', 'contact_template', 1407736300, 1407736300, 'open', 'Social Valley', 'social.valley@aol.com', '', '', '', '', '', '', '', '', '', '', '', 'More Facebook Fan Page Likes, More Customers. We will DOUBLE your order!', 'Want more Facebook Fan Page likes? - http://social-valley.org  We will DOUBLE your order! \n \nHello, \n \nWe think this is the best way to contact you. Sorry for the \ntrouble if you are not interested. But I''m sure it will. \n \nWould you like to get thousands of likes on your Facebook Fan Page \nthat will build credibility and attract new customers? We will \nget you thousands of Facebook Fan Page Likes by posting and \npromoting your Facebook Fan Page all over social media for people \nto see, share, and like your page. \nWe can get you Facebook Fan Page likes, Twitter Followers, and \nYouTube Views. You have nothing to lose. Only exposure to the world. \n \nIf you place an order, we will DOUBLE your order for at NO CHARGE. \n \nVisit us: \nhttp://social-valley.org'),
(104, 3, 0, 0, '91.236.74.172', 'contact', 'contact_template', 1407736305, 1407736305, 'open', 'Social Valley', 'becomeviralovernight@aol.com', '', '', '', '', '', '', '', '', '', '', '', 'Want more Facebook Fan Page Likes?', 'Greetings, \n \nSubscribe with us and get 5,000 Facebook Fan Page Likes every month! \nWe will promote your Facebook Fan Page throughout Social \nMedia. We can get you thousands of Facebook Fan Page Likes. Having thousands of Likes will get you customers to your business \nand possibly some sales and transactions to your business. \nYou have nothing to lose. Just exposure to people around the world. \n \n \nVisit us: \nhttp://Social-Valley.org'),
(105, 3, 0, 0, '91.236.75.130', 'contact', 'contact_template', 1407736305, 1407736305, 'open', 'Social Valley', 'social.valley@aol.com', '', '', '', '', '', '', '', '', '', '', '', 'More Facebook Fan Page Likes, More Customers. We will DOUBLE your order!', 'Want more Facebook Fan Page likes? - http://social-valley.org  We will DOUBLE your order! \n \nHello, \n \nWe think this is the best way to contact you. Sorry for the \ntrouble if you are not interested. But I''m sure it will. \n \nWould you like to get thousands of likes on your Facebook Fan Page \nthat will build credibility and attract new customers? We will \nget you thousands of Facebook Fan Page Likes by posting and \npromoting your Facebook Fan Page all over social media for people \nto see, share, and like your page. \nWe can get you Facebook Fan Page likes, Twitter Followers, and \nYouTube Views. You have nothing to lose. Only exposure to the world. \n \nIf you place an order, we will DOUBLE your order for at NO CHARGE. \n \nVisit us: \nhttp://social-valley.org'),
(106, 3, 0, 0, '23.236.125.149', 'contact', 'contact_template', 1408221644, 1408221644, 'open', 'evwibovwe pleasure', 'pevwibovwe@gmail.com', '', '', '', '', '', '', '', '', '', '', '', 'scaffolding', 'Sir, I want say many thanks to the chairman and management staff of TUPL. It''s indeed visible and wow. I am a competent scaffolder and i presently work as a scaffolder ln TUPL under a contractor. I have also submitted my scaffold CV and credentials at the Human Resources department TUPL. Thank you sir, as I wait for your prompt and favourable consideration. Yours Faithfully. Evwibovwe Pleasure.'),
(107, 3, 0, 0, '41.206.1.9', 'contact', 'contact_template', 1409747585, 1409747585, 'open', 'Augustine Oche Ihopo', 'augustineihopo@gmail.com', '', '', '', '', '', '', '', '', '', '', '', 'Career', 'Dear Sir, \nI am interested in building a career with your company, how can I apply for your career training program? \nThank you.'),
(108, 3, 0, 0, '196.46.245.144', 'contact', 'contact_template', 1409751179, 1409751179, 'open', 'Moitek Limited', 'moitekng@yahoo.com', '', '', '', '', '', '', '', '', '', '', '', 'Vendor Registration', 'Moitek Limited is an Engineering, Procurement and technical service company, offering Civil, mechanical and Electrical services to clients across governements and the oil industry in Nigeria. we are interested in registering as vendors with your organisation and would appreciate information on the procedure and documentations required for registration.\n\nRegards\nImoudu Ugiomoh \nMoitek Limited'),
(109, 3, 0, 0, '91.236.74.172', 'contact', 'contact_template', 1411107571, 1411107571, 'open', 'Social Media-Boosters', 'socialmediaboosters@aol.com', '', '', '', '', '', '', '', '', '', '', '', 'Want more Facebook Fan Page Likes?', 'Greetings, \n \nSubscribe with us and get 2,000 Facebook Fan Page Likes and 2,000 Twitter/Instagram \nFollowers at No Cost. We are having a limited promo. Get your Facebook Likes now. \nWe are the best promoter in the market. We can get you thousands of Facebook Fan Page Likes, \nTwitter Followers and YouTube views. Your Facebook Page and website will be exposed \nto the world in matter of days! \n \n \nVisit us: \nhttp://socialmedia-boosters.com'),
(110, 3, 0, 0, '91.236.74.172', 'contact', 'contact_template', 1411107578, 1411107578, 'open', 'Social Media-Boosters', 'socialmediaboosters@aol.com', '', '', '', '', '', '', '', '', '', '', '', 'Want more Facebook Fan Page Likes?', 'Greetings, \n \nSubscribe with us and get 2,000 Facebook Fan Page Likes and 2,000 Twitter/Instagram \nFollowers at No Cost. We are having a limited promo. Get your Facebook Likes now. \nWe are the best promoter in the market. We can get you thousands of Facebook Fan Page Likes, \nTwitter Followers and YouTube views. Your Facebook Page and website will be exposed \nto the world in matter of days! \n \n \nVisit us: \nhttp://socialmedia-boosters.com'),
(111, 3, 0, 0, '91.236.74.172', 'contact', 'contact_template', 1411107586, 1411107586, 'open', 'Social Media-Boosters', 'socialmediaboosters@aol.com', '', '', '', '', '', '', '', '', '', '', '', 'Want more Facebook Fan Page Likes?', 'Greetings, \n \nSubscribe with us and get 2,000 Facebook Fan Page Likes and 2,000 Twitter/Instagram \nFollowers at No Cost. We are having a limited promo. Get your Facebook Likes now. \nWe are the best promoter in the market. We can get you thousands of Facebook Fan Page Likes, \nTwitter Followers and YouTube views. Your Facebook Page and website will be exposed \nto the world in matter of days! \n \n \nVisit us: \nhttp://socialmedia-boosters.com'),
(112, 3, 0, 0, '91.236.74.172', 'contact', 'contact_template', 1411107593, 1411107593, 'open', 'Social Media-Boosters', 'socialmediaboosters@aol.com', '', '', '', '', '', '', '', '', '', '', '', 'Want more Facebook Fan Page Likes?', 'Greetings, \n \nSubscribe with us and get 2,000 Facebook Fan Page Likes and 2,000 Twitter/Instagram \nFollowers at No Cost. We are having a limited promo. Get your Facebook Likes now. \nWe are the best promoter in the market. We can get you thousands of Facebook Fan Page Likes, \nTwitter Followers and YouTube views. Your Facebook Page and website will be exposed \nto the world in matter of days! \n \n \nVisit us: \nhttp://socialmedia-boosters.com'),
(113, 3, 0, 0, '91.236.74.172', 'contact', 'contact_template', 1411452576, 1411452576, 'open', 'Social Media-Boosters', 'socialmediaboosters@aol.com', '', '', '', '', '', '', '', '', '', '', '', 'Want more Facebook Fan Page Likes?', 'Greetings, \n \nSubscribe with us and get 2,000 Facebook Fan Page Likes and 2,000 Twitter/Instagram \nFollowers at No Cost. We are having a limited promo. Get your Facebook Likes now. \nWe are the best promoter in the market. We can get you thousands of Facebook Fan Page Likes, \nTwitter Followers and YouTube views. Your Facebook Page and website will be exposed \nto the world in matter of days! \n \n \nVisit us: \nhttp://socialmedia-boosters.com'),
(114, 3, 0, 0, '91.236.74.172', 'contact', 'contact_template', 1411452590, 1411452590, 'open', 'Social Media-Boosters', 'socialmediaboosters@aol.com', '', '', '', '', '', '', '', '', '', '', '', 'Want more Facebook Fan Page Likes?', 'Greetings, \n \nSubscribe with us and get 2,000 Facebook Fan Page Likes and 2,000 Twitter/Instagram \nFollowers at No Cost. We are having a limited promo. Get your Facebook Likes now. \nWe are the best promoter in the market. We can get you thousands of Facebook Fan Page Likes, \nTwitter Followers and YouTube views. Your Facebook Page and website will be exposed \nto the world in matter of days! \n \n \nVisit us: \nhttp://socialmedia-boosters.com'),
(115, 3, 0, 0, '91.236.74.172', 'contact', 'contact_template', 1411452598, 1411452598, 'open', 'Social Media-Boosters', 'socialmediaboosters@aol.com', '', '', '', '', '', '', '', '', '', '', '', 'Want more Facebook Fan Page Likes?', 'Greetings, \n \nSubscribe with us and get 2,000 Facebook Fan Page Likes and 2,000 Twitter/Instagram \nFollowers at No Cost. We are having a limited promo. Get your Facebook Likes now. \nWe are the best promoter in the market. We can get you thousands of Facebook Fan Page Likes, \nTwitter Followers and YouTube views. Your Facebook Page and website will be exposed \nto the world in matter of days! \n \n \nVisit us: \nhttp://socialmedia-boosters.com'),
(116, 3, 0, 0, '91.236.74.172', 'contact', 'contact_template', 1411452606, 1411452606, 'open', 'Social Media-Boosters', 'socialmediaboosters@aol.com', '', '', '', '', '', '', '', '', '', '', '', 'Want more Facebook Fan Page Likes?', 'Greetings, \n \nSubscribe with us and get 2,000 Facebook Fan Page Likes and 2,000 Twitter/Instagram \nFollowers at No Cost. We are having a limited promo. Get your Facebook Likes now. \nWe are the best promoter in the market. We can get you thousands of Facebook Fan Page Likes, \nTwitter Followers and YouTube views. Your Facebook Page and website will be exposed \nto the world in matter of days! \n \n \nVisit us: \nhttp://socialmedia-boosters.com'),
(117, 3, 0, 0, '196.46.245.93', 'contact', 'contact_template', 1413295984, 1413295984, 'open', 'Israel Ekemezie', 'ttiemee@yahoo.com', '', '', '', '', '', '', '', '', '', '', '', 'Job Inquiry', 'I am an electrical and electronic engineer. I finished from Eastern Mediterranean University in January 29th, 2013. I did my internship in 2012 with Kibtek Power Generation Company, Famagusta, TRNC. I just got to know about this firm from a friend and decided to make this contact. Please if you will need an additional information concerning me, you can get me via this number: 08165189387'),
(118, 3, 0, 0, '82.145.220.119', 'contact', 'contact_template', 1413450909, 1413450909, 'open', 'jomide nig enterp. ltd.', 'info@transcouprghelli.com', '', '', '', '', '', '', '', '', '', '', '', 'cargo arrival  in lagos', 'gud day, ur company has a cargo  here in lagos airport,pls call  dis  phone no- 09097244334, for enquiry. thk''s.'),
(119, 3, 0, 0, '82.145.220.119', 'contact', 'contact_template', 1413451538, 1413451538, 'open', 'olumide elegbede', 'info@transcorpughelli.com', '', '', '', '', '', '', '', '', '', '', '', 'cargo arrival', 'gud day, ur company has a cargo  here in lagos airport,pls call  dis  phone no- 09097244334, for enquiry. thk''s.'),
(120, 3, 0, 0, '82.145.221.13', 'contact', 'contact_template', 1413565950, 1413565950, 'open', 'Oyedepo Oloyede Clement', 'mechclem2@yahoo.com', '', '', '', '', '', '', '', '', '', '', '', 'Re-Application: Notification about my CV', 'This is message is to notify you that I sent my CV to your email above: info@transcorpughelli.com for future employment. However, this is not my application but a notification to make your humble organisation aware that I have deep interest in working with your company.  Please kindly check it out. Thanks.                                                                                 Oyedepo Clement- 08035093069'),
(121, 3, 0, 0, '37.228.105.82', 'contact', 'contact_template', 1414426400, 1414426400, 'open', 'ONOSE HENRY EDAFEOGHENE', 'MARIOPUZO725@YAHOO.com', '', '', '', '', '', '', '', '', '', '', '', 'I NEED JOB', 'I M AN HND HOLDER IN ELECTRICAL POWER ENGINEERING FROM INSTITUTE OF MANAGEMENT AND TECHNOLOGY IMT ENUGU PLS I M READY TO LEARN FROM YOU..'),
(122, 3, 0, 0, '197.211.32.242', 'contact', 'contact_template', 1414507283, 1414507283, 'open', 'Dr. O.A. Oladipo', 'ooladipo@unilorin.edu.ng', '', '', '', '', '', '', '', '', '', '', '', 'Educational visit', 'Dear Sir / Ma,\nMy name is Dr. Olushola Abel Oladipo, a Senior Lecturer in the Department of Physics, University of Ilorin. There is an undergraduate course in my department titled "Energy Physics", the course is meant for Third year Physics students and I am the course lecturer for the course this session. This year will have like 120 students for the course. Part of the curriculum for the course is an educational Physics to an Energy plant. \nI would like to know if your plant usually allow such visit and if yes what are to procedure to book a visit.\n\nThank you.'),
(123, 3, 0, 0, '41.203.64.130', 'contact', 'contact_template', 1414741740, 1414741740, 'open', 'Imaobong Afia', 'i.afia@convexxenergy.com', '', '', '', '', '', '', '', '', '', '', '', 'Enquiry on Contractors Registration Process', 'Dear Sir,\n\nPlease what are the procedure/requirement for contractor registration with your company.\n\nI anxiously await your response.\n\nThank You.'),
(124, 3, 0, 0, '106.51.142.135', 'contact', 'contact_template', 1415007739, 1415007739, 'open', 'Abhishek R', 'abhi@gasturbinecontrols.com', '', '', '', '', '', '', '', '', '', '', '', 'Gas Turbine Controls Corp.', 'Hi Team,\n\nWe are an American company named Gas Turbine Controls Corporation that supply   GE frame 9E, Mark V spares across the world including to GE.\n\nI would like to have e-mail id of the instrumentation engineer so that we can send our company profile to you.\n\nBest Regards,\nAbhishek R\nBusiness Development Manager\nGTC New York\n00919663411355'),
(125, 3, 0, 0, '41.203.64.134', 'contact', 'contact_template', 1415274728, 1415274728, 'open', 'EFEROVO  David', 'eferovodavid@gmail.com', '', '', '', '', '', '', '', '', '', '', '', 'Enquiries', 'It is over one year now since you took over the management of the former PHCN. During the handle over ceremony there were many promises to carry the host communities along, but I am yet to see any apart from the employment of security officers from the three communities. Even your mission statement clearly indicate that you will partner with the host communities. I am a concern member of the landlords to the transcorp ughelli power plant. Some time around March this year we were told to submit CVs and application letter through our communities which we deed but up till now not thing had been heard. This is my reason for this enquiring.  '),
(126, 3, 0, 0, '41.190.3.103', 'contact', 'contact_template', 1415465645, 1415465645, 'open', 'MAMINUWA FRANCIS OVIRORO', 'ovis_2003@yahoo.co.uk', '', '', '', '', '', '', '', '', '', '', '', 'FOR JOBS', 'Sir,\nI Studied Mechanical/production Engineering at Enugu Engineer State University of Science and Technology (ESUT) where I obtained Bachelor in Engineering (B.ENG) in year 2006. MY working experience at Warri Refinery and Petrochemical Company (WRPC), MACON LIMITED and Framart (Nig) Engineering Service Company (FESCO) has improved my skill and ability to teach. \nI believe 1 am knowledgeable enough to work with the school owing to the fact that I am confident with a strong character. I have learned to use my intellect, together with a positive attitude to adapt to new situation in our ever-changing society to achieve success.  If given the opportunity I would contribute positively to the growth of the company. In anticipation of a favorable response, I thank you for your consideration.\n \nYours faithfully\nMaminuwa Francis Oviroro\n\n'),
(127, 3, 0, 0, '41.58.52.145', 'contact', 'contact_template', 1415791032, 1415791032, 'open', 'vincent orhurhu', 'orhurhuv@yahoo.com', '', '', '', '', '', '', '', '', '', '', '', 'Freight forwarder', 'we are great freight forwarders based in Lagos Airport. we intend to register with your reputable company so as to be handling your Airfreight shipments clearance with Customs.'),
(128, 3, 0, 0, '41.58.52.145', 'contact', 'contact_template', 1415791302, 1415791302, 'open', 'Vincent Orhurhu', 'Orhurhuv@yahoo.com', '', '', '', '', '', '', '', '', '', '', '', 'AIRFREIGHT SHIPMENT CLEARANCE.', 'Trying to register as a clearing agent in your company based in Lagos Airport only. we can be reached on 09091999802 or 08060558022'),
(129, 3, 0, 0, '37.57.231.226', 'contact', 'contact_template', 1415839285, 1415839285, 'open', 'riacgaimnb', 'cubymw@zirgox.com', '', '', '', '', '', '', '', '', '', '', '', 'NkcGrfQGioQGLCEK', 'BQ2mU0  <a href="http://qejqjnaoqvuy.com/">qejqjnaoqvuy</a>, [url=http://xybmmnrehosi.com/]xybmmnrehosi[/url], [link=http://mrkmubvwmiyi.com/]mrkmubvwmiyi[/link], http://xcuyhuxzwwef.com/');
INSERT INTO `exp_freeform_entries` (`entry_id`, `group_id`, `weblog_id`, `author_id`, `ip_address`, `form_name`, `template`, `entry_date`, `edit_date`, `status`, `name`, `email`, `website`, `street1`, `street2`, `street3`, `city`, `state`, `country`, `postalcode`, `phone1`, `phone2`, `fax`, `subject`, `message`) VALUES
(130, 3, 0, 0, '2.24.42.59', 'contact', 'contact_template', 1416821153, 1416821153, 'open', 'Adam Caan', 'acaan@essentialbusinessmag.com', '', '', '', '', '', '', '', '', '', '', '', 'Essential Business Africa - Ughelli Power Plc Company Profile', 'Many congratulations on on winning the Power Transaction of the Year award at the inaugural West African Power Industry Awards.\n \nWe are media partners to WAPIC exhibition and are putting together an extensive focus looking at success stories within the Power industry in West Africa. We are writing few major pieces in the next issue of our magazine, Essential Business Africa, focussing on companies that are winners in the WAPIC awards. We are very keen to write an article and produce a feature on Ughelli Power Plc highlighting you winning Power Transaction of the Year category for the WAPIC Awards.\n \nAs one of the key players in the industry, I want to extend the invitation to Ughelli Power Plc to be one of the leading profiles in the report. We would look to discuss the recent investments and developments within your business, your plans and projects for 2014/15 as well as other areas of the business such as operations, supply chain and your growth and expansion strategy. \n \nWe are looking to allocate you 8-10 pages of editorial based around an interview with yourself. Once published in Essential Business Africa it will appear online for 12 months on www.essentialbusinessmag.com with direct hyperlinks back to your site. Finally, we will reproduce the entire profile into a brand new marketing brochure for you to use as your marketing material throughout 2014/15.\n \nI must stress this opportunity is completely free of charge with no cost to your business whatsoever and nothing will be published without your authorisation and sign off prior to publication. \n \nWe are focused on promoting West Africa as a region, the successful companies operating within it and feel that your business would be of great interest to our readers.\n \nEssential Business Magazine has over 500,000 subscribed executive readers across the world and offers great exposure for your organisation to potential corporate clients, industry professionals and research groups. Our readers stem from a few main industries: Hospitality, Oil & Gas, Energy & Mining, Healthcare, Food & Beverage, Supply Chain & Logistics, Manufacturing, the Public Sector, Property Development and Construction. Our informative website is also taking off with over 5,000 unique visitors per day.\n      \nTo get things moving I am simply looking for 5-10 minutes of your CEO''s time to get a brief, informal background into the company with a view to taking this forward and getting a project plan agreed. \n\nIf you would like to take advantage of this exclusive offer please reply back to this email with your contact details so that we can begin organising the marketing piece on you and Ughelli Power Plc.\n  \nKind Regards, \n\nAdam Caan\nSales Director\nEssential Business Publishing\n \nSouth Africa: +27 (0) 11 083 6717\nFax: +27 (0) 86 606 1166\nEmail: acaan@essentialbusinessmag.com\n\n \nwww.essentialbusinessmag.com  \n\n'),
(131, 3, 0, 0, '91.236.75.205', 'contact', 'contact_template', 1417209723, 1417209723, 'open', 'Luke', 'contact@buy-testimonials.org', '', '', '', '', '', '', '', '', '', '', '', 'Video Testimonial for ughellipower.com', 'We really like your site - ughellipower.com and we thought you could benefit from a video testimonial. A video testimonial is like a mini-commercial for your business, but it looks very natural and genuine -- like a satisfied customer of yours is blogging about your service! It utilizes the sheer power of video marketing, and has been praised as the most cost-effective marketing campaign of the 21st Century. Now, you can get your own for the one-time fee of just 49 bucks. Get your own testimonial today. Give us a call at 877-405-8518, email us at sales@buy-testimonials.org, or visit our website at http://www.buy-testimonials.org for more information and samples. Use code "ITSABUSINESSEXPENSE" for 20% off! \n \nKind regards, \nLuke Goodman'),
(132, 3, 0, 0, '41.220.69.134', 'contact', 'contact_template', 1417286856, 1417286856, 'open', 'Andrew Eguavon', 'talking4real@gmail.com', '', '', '', '', '', '', '', '', '', '', '', 'Employment Enquiries', 'I wish to make enquiry concerning vacancies for administrative officer and secretaries in your company.\n\nPlease do you have any vacancies in any related administrative position in your company.\n\nI am a job seeker based in Effurun.\n\nThanks\nMr Andrew Eguavon\n08020712877'),
(133, 3, 0, 0, '70.39.186.186', 'contact', 'contact_template', 1417355318, 1417355318, 'open', 'KALU MIRACLE', 'kalumiracle45@gmail.com', '', '', '', '', '', '', '', '', '', '', '', 'Inquire On How To Be Recruited.', 'Inquire On How To Be Recruited as student on industrial practice. I we appreciate your immediate response. Thank you Sir/Ma'),
(134, 3, 0, 0, '107.167.107.113', 'contact', 'contact_template', 1417430771, 1417430771, 'open', 'ERU SAMUEL ONORIODE', 'eru4u2010@gmail.com', '', '', '', '', '', '', '', '', '', '', '', 'INQUIRING ', 'Hi Sir, \nI am a B.Eng holder in Mechanical/Production Engineering from the Enugu State University of Science and Technology and I also did my six months SIWES program in your company but then under the name PHCN. I would want to know if there is any vacancy so that I could apply because I have the passion of contributing to your firm success. \nThanks'),
(135, 3, 0, 0, '91.236.75.130', 'contact', 'contact_template', 1417483715, 1417483715, 'open', 'Super#genick', 'superawkward3434@hushmail.com', '', '', '', '', '', '', '', '', '', '', '', 'The Autobinary', 'Hey guys, \n \nA few years ago I developed a unique way of making money through binary options, \nwhich made me a MULTI-MILLIONAIRE by the age of just 49... \nBefore I consider letting you in on my TOP SECRET trading software I want to ask you… \nIf you’re prepared to pay attention to what I’m about to reveal on this page, \nI’ll show you exactly how to let this SUPERHUMAN Software run riot for you on your Binary broker \nand take your share of the trillions of dollars, \npounds and euros just sitting there waiting for your withdrawal… \n \nAnyways here''s the website, let me know what you think of it. \nhttp://9bb4e882z6azgr67055lsiwhwr.hop.clickbank.net/'),
(136, 3, 0, 0, '91.236.75.130', 'contact', 'contact_template', 1417510045, 1417510045, 'open', 'Jason Bonds', 'jason_bonds@hushmail.com', '', '', '', '', '', '', '', '', '', '', '', 'Jason Bonds', 'I''m not here to waste your time. \nI''m looking for new people to join my team, it''s a network of people that \nmonitor the market together and make money together. \nIt''s worked for me and hundreds of other people, and trust me, if your''re not making \nat least $1,000 per day, you should at least give my team a try. Ask anyone on my \nteam, we''re filthy rich and we''re proud of it. \nNo tricks, no scams, no stupid advertisements. We''re tired of those too. \n \nSeriously, I want people I can trust, people that work hard. \nAnd don''t sign up just to advertisements your own business, because I will find out, \nand I will remove you from the team. \nDon''t waste my time, I certainly won''t waste yours. \n \nEmail me if you want more info: jason_bonds@hushmail.com \nHopefully I can respond within a week, I''m a busy guy. \nOr just visit my website \nhttp://eb9065x1s6gtbm6nqs7ef5k9bn.hop.clickbank.net/ \n \nHear from you soon (those that want to make money anyways) \nJason Bonds'),
(137, 3, 0, 0, '41.190.3.204', 'contact', 'contact_template', 1418311417, 1418311417, 'open', 'OGUNDARE OLUSOLA ADENIYI', 'mailolusola@yahoo.ca', '', '', '', '', '', '', '', '', '', '', '', 'Job Application', 'I hereby apply for an employment in the operational and maintenance service department of the prestigious organisation.\nI am a graduate of Mechanical Engineering. \nI have experience in  operating MWM Deutz Power system using TEM Evolution at Quippo Energy till date.\nMy CV is herewith attached to mail sent to your official e-mail address (info@transcorpughelli.com).\nI would be grateful if my application is favourably considered\nYours fatefully,\nOGUNDARE OLUSOLA ADENIYI'),
(138, 3, 0, 0, '37.228.106.172', 'contact', 'contact_template', 1418454826, 1418454826, 'open', 'emmanuel ', 'emmabling20@yahoo.com', '', '', '', '', '', '', '', '', '', '', '', 'no light since four days', 'no light in ekuigbo area since on tuesday till now. it has been a cocern since we started fetching water outside and charging our fones outside also. please unbehalf of the people light has affected we want know what is happening with the light and when it wil be fixed. thanks for your listening. emmanuel.'),
(139, 3, 0, 0, '84.120.219.138', 'contact', 'contact_template', 1419234466, 1419234466, 'open', 'Frank  Esclapez', 'sell.energy@yahoo.com', '', '', '', '', '', '', '', '', '', '', '', 'Gas Turbines', 'Dear Sir : \nWe have several units at very competitive price and fast delivery of NEW Gas Turbine SGT-400 \n\n\nPower Generation: ISO 12.90 MW(e) / 14.33 MW(e); Mechanical Drive: 13.40 MW / 14.92 MW \n\nDescription Features and fields of applicationTechnical data \n\nThe SGT-400 industrial gas turbine is suitable for offshore power generation, among other things. \n\nThe SGT-400 gas turbine combines 25 years of experience in operating equipment with cutting edge aerodynamics and the latest combustion technologies. The twin-shaft turbine achieves a useful output of 12.90 MW(e) or 14.32 MW(e) for power generation and 13.40 MW or 14.92 MW for mechanical drive. The turbine permits an electrical efficiency of up to 35.4% for operation in a simple cycle, gas-fired power plant. The SGT-400 is available as a factory-assembled package and has an excellent power-to-weight ratio. \nOverview of benefits \nProven design for maximum availability and supply reliability \nLow emissions despite a rugged industrial design \nDry-Low Emissions (DLE) combustion system for liquid and gaseous fuels for reducing NOx emissions \nThe SGT-400 comes in a twin-shaft configuration for both power generation and mechanical drive applications, which allows the same spare parts to be used in mixed-duty installations \nCompetitive cost-to power ratio \nCompact dimensions \nOn-site maintenance possible \nRapid core engine exchange option (minimizes downtimes) \nIdeal as offshore gas turbine in the oil and gas industry \n\nFRANK  ESCLAPEZ\nwww.sell-energy.com\nsell.energy@yahoo.com'),
(140, 3, 0, 0, '178.137.85.199', 'contact', 'contact_template', 1419330374, 1419330374, 'open', 'Andrei', 'majesticbeach23jw@rediffmail.com', '', '', '', '', '', '', '', '', '', '', '', '2015 is a huge year for ughellipower.com', 'Hi, \n \nI''m Andrei, a marketing manager at Verified Traffic. I came across ughellipower.com and see that it has the potential to get a lot more visitors to really BLOW UP in 2015! \n \nI just wanted to tell you, in case you didn''t already know... We cater to over 7,000 small and medium biz and website owners - many in your niche, all seeing a TON more sales, subscribers and clickthroughs. \n \nWe''re network partners with the largest media banner networks - the same networks that serve traffic to hundreds of thousands of popular news, cooking, animal, research, shopping, etc websites you already use daily. \n \nSimply put, I think ughellipower.com can get a lot more exposure from buying and driving traffic the same way all of these other successful websites have been doing for so long! \n \nLet me give you all the details here: \nhttp://verifiedtraffic.net/traffic-plans/ \n \nCould ughellipower.com genuinely benefit from any of these? \n \n- 100% real people clicking through from blogs and websites in your niche to your blog - ensuring the best chances of engagement, whether you want leads, email subscribers or sales. \n- MONTHLY visitors to set up once, and focus on improving your website appearance, salesfunnel, etc - never to have to worry about traffic again. \n- QUICK exposure, sales and brand awareness building for your website without spending $1,000s on SEO and social media and waiting months for rankings and followers to appear. \n \nIf your answer is YES to any of these, the time to improve your site is now. No more having to worry about where to find quality visitors for your website, ALL THAT HASSLE is gone with Verified Traffic :) \n \nPick a plan here: http://verifiedtraffic.net/traffic-plans/ \n \nIf you have any questions regarding if we have traffic in particular niches or countries - please email me at admin@verifiedtraffic.net \n \nHere''s to your success and quick website growth!'),
(141, 3, 0, 0, '188.143.232.211', 'contact', 'contact_template', 1419628431, 1419628431, 'open', 'tkqjkhqnbld', 'ojrfml@dhpzqs.com', '', '', '', '', '', '', '', '', '', '', '', 'pNmiKNkOnTsInV', 'PK64W8  <a href="http://wytlzamzuikl.com/">wytlzamzuikl</a>, [url=http://ketoucccdkax.com/]ketoucccdkax[/url], [link=http://dngmhgsibktp.com/]dngmhgsibktp[/link], http://xqofwfxqxggo.com/'),
(142, 3, 0, 0, '168.235.196.232', 'contact', 'contact_template', 1419792530, 1419792530, 'open', 'Patrick Adolor Daniel', 'Patrickdaniel410@yahoo.com', '', '', '', '', '', '', '', '', '', '', '', 'APPLICATION FOR OFFER OF AN INDUSTRIAL TRAINING OPPORTUNITY FOR THE YEAR 2015', 'Department of Mechanical Engineering,\nFaculty of Engineering,\nNnamdi Azikiwe University, UNIZIK-Awka,\nAnambra State,\nNigeria.\n\nDear Sir,\n\nAPPLICATION FOR OFFER OF AN INDUSTRIAL TRAINING OPPORTUNITY FOR THE YEAR 2015\n\nMy name is Patrick Adolor Daniel, a level 400 student who has the address in the foregoing. I am an Indigene of Esan Central Local Government Area who hails from Edo State.\n\nI wish to apply for an Industrial Training opportunity in your establishment in the year 2015 for a period of six (6) months which is scheduled to commence at April 2015.\n\nMy contact is 08062908241 and my email address is patrickdaniel410@yahoo.com\n\nI will be grateful if my request is pertinently attended to.\n\nYours faithfully\n\nDaniel Adolor Patrick\n(Student).'),
(143, 3, 0, 0, '82.145.211.192', 'contact', 'contact_template', 1420158036, 1420158036, 'open', 'Mr Ogaga Omonigho Wealth', 'wealth3g@gmail.com', '', '', '', '', '', '', '', '', '', '', '', 'Enquiry', 'To whom it may concern, \nI am writing to enquiry the medium to follow through to submit my job application. Thank you. \nI look forward to hearing from you soon. '),
(144, 3, 0, 0, '104.140.208.76', 'contact', 'contact_template', 1420214254, 1420214254, 'open', 'Joseph Watson', 'jphillips@theplate.com', '', '', '', '', '', '', '', '', '', '', '', 'we need artists', 'NOW BOOKING FOR 2015 ART SHOWS\n\n-LA Contemporary, 2015\n-Art Now Miami, 2015\n-Artexpo NY, 2015\n-Hamptons, 2015\n-Art Rochester, 2015\n-San Diego, 2015\n-Spectrum Miami, 2015\n\nSpecial pricing for early signups!\n\nHttp://weneedartists.club/'),
(145, 3, 0, 0, '174.91.118.34', 'contact', 'contact_template', 1420496927, 1420496927, 'open', 'Joseph Watson', 'jphillips@theplate.com', '', '', '', '', '', '', '', '', '', '', '', 'we need artists', 'NOW BOOKING FOR 2015 ART SHOWS\n\n-LA Contemporary, 2015\n-Art Now Miami, 2015\n-Artexpo NY, 2015\n-Hamptons, 2015\n-Art Rochester, 2015\n-San Diego, 2015\n-Spectrum Miami, 2015\n\nSpecial pricing for early signups!\n\nHttp://weneedartists.club/'),
(146, 3, 0, 0, '162.250.122.251', 'contact', 'contact_template', 1420742941, 1420742941, 'open', 'Frank Pistone', 'joewatson@artlover.com', '', '', '', '', '', '', '', '', '', '', '', 'call for artists', 'NOW RESERVING FOR 2015 ART SHOWS\n\nLA Contemporary, 2015\nArt Now Miami, 2015\nArtexpo NY, 2015\nHamptons, 2015\nArt Rochester, 2015\nSan Diego, 2015\nSpectrum Miami, 2015\n\nSpecial pricing exists for early signups!\n\nHttp://weneedartists.club/'),
(147, 3, 0, 0, '192.126.154.153', 'contact', 'contact_template', 1420781564, 1420781564, 'open', 'Jane Mastroiano', 'janemast@artlover.com', '', '', '', '', '', '', '', '', '', '', '', 'question', 'Can you send me a link to your gallery where I can view all of your art?'),
(148, 3, 0, 0, '82.145.221.37', 'contact', 'contact_template', 1421163386, 1421163386, 'open', 'Uyanwa prince', 'patprince4u@gmail.com', '', '', '', '', '', '', '', '', '', '', '', 'enquiry', 'please when will the company do there next recruitment exercise.I have my B.Eng certificate and also HSE certificate with years of experience in one of the distribution company in Nigeria,please this is my contact 08063857515 and also my mailbox patprince4u@gmail.com'),
(149, 3, 0, 0, '41.190.2.217', 'contact', 'contact_template', 1421186082, 1421186082, 'open', 'Jodome David', 'Mickdave@rocketmail.com', '', '', '', '', '', '', '', '', '', '', '', 'Searching for job', 'Am a graduate of industrial chemistry, delta state university, abraka. Am in search for job I don''t mind any kind of job so far I earn something at the end of the month. I live in agbarho near ughelli.'),
(150, 3, 0, 0, '82.145.216.237', 'contact', 'contact_template', 1421480273, 1421480273, 'open', 'Ogbuneke Godwin Gift', 'Gift.godwin@ymail.com', '', '', '', '', '', '', '', '', '', '', '', 'Industrial Training Application', '\n     I am a fourth year student in the department of Electrical/Electronics Engineering in Federal University of Technology Owerri with a reg. No. 20111791043 with a CGPA of 3.89. I humbly request for an opportunity to gain a 6 month industrial training experience in your company. I believe dat your company has all it takes to make me an efficient and skillful student. I promise to be of good behaviour and 2 abide by d rules and regulations of ur company.\nI will be grateful if my request is favourably considered and granted.\n                        (08102828789)\n                           Gift.godwin@ymail.com'),
(151, 3, 0, 0, '178.137.85.199', 'contact', 'contact_template', 1422830482, 1422830482, 'open', 'Devin', 'understoodyacht3c@rediffmail.com', '', '', '', '', '', '', '', '', '', '', '', 'Facebook management for ughellipower.com?', 'Hello, \n \nMy name is Devin Sorbert - I''m a media manager at Social Media Gurus. We''re a 3 person full social media management company based out of Greater Grand Rapids, Michigan. We handle account creation and growth for small businesses - and our 3rd partner has spent 3 years setting up Facebook and Google Adwords campaigns for small businesses for local lead generation for a Grand Rapids media management company before coming to work with us. \n \nI saw ughellipower.com and want to know if you''re interested in expanding your social media presence? Basically - more fans, likes and general engagement on your Facebook page? \n \nIt''s really easy - we''d do a free 15 minute consultation over phone or Skype - where we''ll fill out a simple questionnaire to figure out the specific social media needs for your business. I''ll show you some references and current clients pages that have consented to being used as examples (pet shelters and such) - and explain why more fans and activity on your page will help your business. If during the consultation we learn that you sell commercially/are happy with 10 fans on your page/have no business use for social media presence - I won''t sell you garbage. Chemical factories don''t need Facebook pages (unless they''d like a corporate page) - and I won''t argue with that. \n \nOur prices start at $189 a month for complete management and assistance of your media profile. Our prices reflect the service quality - if you''ve had bad experiences buying fans for $20 on Fiverr that were deleted/had your account suspended - we can rectify that. We run small media campaigns throughout the month creating natural fan growth to your page - no automated accounts or likes, and no chance of any account issues. We also do not need any security information to promote your page - anyone who does probably uses a form of automation to grow your account. \n \nCheck out these monthly plans to get a full idea of everything we do for your page and then send me a reply for your consultation :) \nhttp://socialmediagurus.net/ \n \nIf I can help you - reply back at emailsocialmediagurus@mail.com and we''ll set up a good time for you to create a plan for ughellipower.com. \n \nHope I can assist you, \nDevin'),
(152, 3, 0, 0, '50.117.34.180', 'contact', 'contact_template', 1422861568, 1422861568, 'open', 'Otto Eisenwort', 'eisotto@yahoo.de', '', '', '', '', '', '', '', '', '', '', '', 'Job Application', 'I would like to apply for a job. I`m very experienced in erecting entire power plants, power distribution and all related equipment. I will send all my documents to:  info@transcorpughelli.com\nI have also a very good knowledge about Nigeria. I was leading the CEGELEC Nigeria Ltd. as a branch manager for more than 5 years. '),
(153, 3, 0, 0, '82.145.222.148', 'contact', 'contact_template', 1423222624, 1423222624, 'open', 'kanayo', 'ckay1557@gmail.com', '', '', '', '', '', '', '', '', '', '', '', 'Industrial Training (IT) for students.', 'pls does transcorp ughelli accept IT students. if yes please when is the deadline for submission of IT letters. Thank you'),
(154, 3, 0, 0, '82.145.211.73', 'contact', 'contact_template', 1423307353, 1423307353, 'open', 'TERRY OHWAHWA', 'ohwast@yahoo.com', '', '', '', '', '', '', '', '', '', '', '', 'JOB INQUIRY', 'GREETINGS! I WISH TO INQUIRE ABOUT JOB VACANCIES IN YOUR REPUTABLE COMPANY.I HAIL FROM EKAKPAMRE IN UGHELLI SOUTH LOCAL GOVERNMENT AREA OF DELTA STATE. I AM CURRENTLY A HOLDER OF NATIONAL DIPLOMA CERTIFICATE IN CHEMICAL ENGINEERING FROM THE INSTITUTE OF MANAGEMENT AND TECHNOLOGY, ENUGU. I AM LOOKING FORWARD TO HEAR FROM YOU ABOUT CURRENT JOB OPENING. THANKS\n\n'),
(155, 3, 0, 0, '41.73.239.11', 'contact', 'contact_template', 1423483020, 1423483020, 'open', 'Udokamma Igwe', 'udokamma.igwe@powertechlimited.com', '', '', '', '', '', '', '', '', '', '', '', 'Request for Meeting', 'Hello,\n\nGood afternoon.I am writing from Powertech Intermediary Services Int’l Ltd ( A Nigerian arm of Powertech s.r.l), a company that offers its products and services to the Oil and Gas, Petrochemical and Power generation Industries world-wide. \n\nWe are a representative of reputable OEMs in Europe, America and other continents. We have supplied millions of US dollars’ worth of materials to companies in Nigeria such as Shell, Mobil, NNPC (Warri Refinery, PH Refinery), Saipem, Agip to mention a few. We are one of the biggest valves’ suppliers in Nigeria as we represent Velan and Flowserve. We have also supplied pumps and pipes to different EPCs in the country. We have a very strong financial capacity to make sure that your projects are not stopped on the way because we are waiting for funds before supplies are made.\n\nPlease we would want to have a meeting with you to discuss our scope of supply/business and see how we can help in your business.\n\nKindly respond to give me an appointment for the meeting.\n\nI look forward to receiving a positive response from you.\n\nKind regards.\n'),
(156, 3, 0, 0, '89.101.244.87', 'contact', 'contact_template', 1423578759, 1423578759, 'open', 'Alaa Housany', 'ahousany@inductionmanager.com', '', '', '', '', '', '', '', '', '', '', '', 'Induction', 'I hope you don''t mind me contacting you out of the blue.\n\nI wonder if you could tell me who in your company manages employee and contractor inductions and how I might contact them?\n'),
(157, 3, 0, 0, '10.225.55.98', 'contact', 'contact_template', 1423749053, 1423749053, 'open', 'Theo Mukoro', 'theo_mukoro@yomatech.com', '', '', '', '', '', '', '', '', '', '', '', 'Registration as a contractor', 'Dear sir, \n\nWith references to the above subject, Yomatech Nigeria Limited an indigenous oil and gas service company majoring in Electrical and instrumentation works seek to register as one of your contractors. We are based here in Ughelli, with extensive experience in the repairs, supply and installation of Electrical and Instrumentation facilities. For details of our past experience and clients we have worked for; do not hesitate to visit our web site www.yomatech.com\n\nWe will be grateful if we are considered as one of your contractors in these areas.\n\nKind regards\n\nTheo Mukoro\nYomatech Nigeria Limited\nYoma Farm Resort (Nigeria) Limited Complex\nOfuoma Town, Ughelli North L.G.A\nDelta State,\nNigeria.\nCell: 234 80 67642245 \n \nEmail:- Theo_mukoro@yomatech.com\nVisit Our Web Site at:- www.yomatech.com\n  \n\n'),
(158, 3, 0, 0, '41.206.1.3', 'contact', 'contact_template', 1423749439, 1423749439, 'open', 'MARFEL ENGINEERING INTERNATIONAL LIMITED', 'marfelengineering@gmail.com', '', '', '', '', '', '', '', '', '', '', '', 'OUR INTENION TO BE A VENDOR', 'DEAR SIR,\nKINDLY ADVISE US SIR ON HOW WE CAN REGISTER AS A VENDOR SIR.\nTHANKS\nFELIX M.E'),
(159, 3, 0, 0, '41.203.67.164', 'contact', 'contact_template', 1423759691, 1423759691, 'open', 'Atoe', 'agons43k5@yahoo.co.uk', '', '', '', '', '', '', '', '', '', '', '', 'Key interest in power generation', 'Am a graduate of mechanical I need to know how power is generated'),
(160, 3, 0, 0, '41.203.67.164', 'contact', 'contact_template', 1423759875, 1423759875, 'open', 'Atoe', 'agons43k5@yahoo.co.uk', '', '', '', '', '', '', '', '', '', '', '', 'Safety', 'Give me your PPE standard, names and how can I get to buy them.thanks'),
(161, 3, 0, 0, '167.114.103.51', 'contact', 'contact_template', 1424260661, 1424260661, 'open', 'Asuagha Christopher', 'christuff700@yahoo.com', '', '', '', '', '', '', '', '', '', '', '', 'Need to work with Transcorp', 'I currently work with a power plant that generates 480 MW of electricity at independent power plant Okpai(IPP-Okpai)as HSE personnel. I am interested in continuing my working career with your company if the opportunity is given to me.\n\nI look forward to hear from you.\n\nMillion thanks in anticipation.\n\nKind regards,\n\nAsuagha Christopher\n'),
(162, 3, 0, 0, '167.114.103.51', 'contact', 'contact_template', 1424692116, 1424692116, 'open', 'Ederagobor Isaac', 'btecinternational@gmail.com', '', '', '', '', '', '', '', '', '', '', '', 'Request to Partner on Electricity Power Generation', 'Dear Sir,\n\nWe hereby show our interest in partnering with your company to generate electricity to help meet your desire target in less than no time.\n\nWe are are electricity power generating company based in Lagos.\n\nWe have the capacity to generate 1000mw.\n\nWe no not need any funding from you.\n\nAll we needed is availability of gas, good working environment and good power purchase agreement.\n\nKindly call the following numbers for further discussions: 08023304554,08183315097\nEmail:btecinternational@gmail.com'),
(163, 3, 0, 0, '167.114.103.225', 'contact', 'contact_template', 1424778799, 1424778799, 'open', 'Julius Oshevire', 'Juliusoshevire@gmail.com', '', '', '', '', '', '', '', '', '', '', '', 'Application ', 'Am seeking for an employment in your organisation as electrical fitter. 10\nyears experience, worked on power transformer,  15 mva, 7.5mva, R.m.u\n33kva breaker and 11kva breaker. \n   I shall be grateful to forward to\nyou my CVs, if my application\n\n\nYours faithfully\nJulius Oshevire\n24/2/2015'),
(164, 3, 0, 0, '167.114.103.225', 'contact', 'contact_template', 1424846235, 1424846235, 'open', 'Orukele Oghenemarho', 'morukele@yahoo.com', '', '', '', '', '', '', '', '', '', '', '', 'Internship placement ', 'I am a mechanical engineering student of Afe Babalola university Ado Ekiti, I am currently interested in doing my student work experience program 1 in your company. Please I would like to know if it is possible to get a placement there so as to be able to gain useful knowledge in my field of study. I would be very grateful if this request is accepted. Yours faithfully\nOrukele Oghenemarho');

-- --------------------------------------------------------

--
-- Table structure for table `exp_freeform_fields`
--

CREATE TABLE IF NOT EXISTS `exp_freeform_fields` (
  `field_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `field_order` int(10) NOT NULL DEFAULT '0',
  `field_type` varchar(50) NOT NULL DEFAULT 'text',
  `field_length` int(3) NOT NULL DEFAULT '150',
  `form_name` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `name_old` varchar(50) NOT NULL,
  `label` varchar(100) NOT NULL,
  `weblog_id` int(4) unsigned NOT NULL,
  `author_id` int(10) unsigned NOT NULL DEFAULT '0',
  `entry_date` int(10) NOT NULL,
  `edit_date` int(10) NOT NULL,
  `editable` char(1) NOT NULL DEFAULT 'y',
  `status` char(10) NOT NULL DEFAULT 'open',
  PRIMARY KEY (`field_id`),
  KEY `name` (`name`),
  KEY `author_id` (`author_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=16 ;

--
-- Dumping data for table `exp_freeform_fields`
--

INSERT INTO `exp_freeform_fields` (`field_id`, `field_order`, `field_type`, `field_length`, `form_name`, `name`, `name_old`, `label`, `weblog_id`, `author_id`, `entry_date`, `edit_date`, `editable`, `status`) VALUES
(1, 1, 'text', 150, '', 'name', '', 'Name', 0, 0, 0, 0, 'n', ''),
(2, 2, 'text', 150, '', 'email', '', 'Email', 0, 0, 0, 0, 'n', ''),
(3, 3, 'text', 150, '', 'website', '', 'Website', 0, 0, 0, 0, 'n', ''),
(4, 4, 'text', 150, '', 'street1', '', 'Street 1', 0, 0, 0, 0, 'n', ''),
(5, 5, 'text', 150, '', 'street2', '', 'Street 2', 0, 0, 0, 0, 'n', ''),
(6, 6, 'text', 150, '', 'street3', '', 'Street 3', 0, 0, 0, 0, 'n', ''),
(7, 7, 'text', 150, '', 'city', '', 'City', 0, 0, 0, 0, 'n', ''),
(8, 8, 'text', 150, '', 'state', '', 'State', 0, 0, 0, 0, 'n', ''),
(9, 9, 'text', 150, '', 'country', '', 'Country', 0, 0, 0, 0, 'n', ''),
(10, 10, 'text', 150, '', 'postalcode', '', 'Postal Code', 0, 0, 0, 0, 'n', ''),
(11, 11, 'text', 150, '', 'phone1', '', 'Phone 1', 0, 0, 0, 0, 'n', ''),
(12, 12, 'text', 150, '', 'phone2', '', 'Phone 2', 0, 0, 0, 0, 'n', ''),
(13, 13, 'text', 150, '', 'fax', '', 'Fax', 0, 0, 0, 0, 'n', ''),
(14, 14, 'text', 150, '', 'subject', '', 'subject', 0, 0, 0, 0, 'y', 'open'),
(15, 15, 'textarea', 10000, '', 'message', '', 'Message', 0, 0, 0, 0, 'y', 'open');

-- --------------------------------------------------------

--
-- Table structure for table `exp_freeform_params`
--

CREATE TABLE IF NOT EXISTS `exp_freeform_params` (
  `params_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entry_date` int(10) NOT NULL,
  `data` text NOT NULL,
  PRIMARY KEY (`params_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3353 ;

--
-- Dumping data for table `exp_freeform_params`
--

INSERT INTO `exp_freeform_params` (`params_id`, `entry_date`, `data`) VALUES
(3352, 1425138359, 'a:22:{s:15:"require_captcha";s:2:"no";s:9:"form_name";s:7:"contact";s:10:"require_ip";s:0:"";s:11:"ee_required";s:18:"name|email|message";s:9:"ee_notify";s:28:"info@transcorpughelli.com​";s:18:"allowed_file_types";s:0:"";s:8:"reply_to";b:1;s:20:"reply_to_email_field";s:5:"email";s:19:"reply_to_name_field";s:4:"name";s:10:"recipients";s:1:"n";s:15:"recipient_limit";s:2:"10";s:17:"static_recipients";b:0;s:22:"static_recipients_list";a:0:{}s:18:"recipient_template";s:16:"default_template";s:13:"discard_field";s:0:"";s:15:"send_attachment";s:0:"";s:15:"send_user_email";s:0:"";s:20:"send_user_attachment";s:0:"";s:19:"user_email_template";s:16:"default_template";s:8:"template";s:16:"contact_template";s:20:"prevent_duplicate_on";s:0:"";s:11:"file_upload";s:0:"";}');

-- --------------------------------------------------------

--
-- Table structure for table `exp_freeform_preferences`
--

CREATE TABLE IF NOT EXISTS `exp_freeform_preferences` (
  `preference_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `preference_name` varchar(80) NOT NULL,
  `preference_value` text NOT NULL,
  PRIMARY KEY (`preference_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_freeform_templates`
--

CREATE TABLE IF NOT EXISTS `exp_freeform_templates` (
  `template_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `enable_template` char(1) NOT NULL DEFAULT 'y',
  `wordwrap` char(1) NOT NULL DEFAULT 'y',
  `html` char(1) NOT NULL DEFAULT 'n',
  `template_name` varchar(150) NOT NULL,
  `template_label` varchar(150) NOT NULL,
  `data_from_name` varchar(150) NOT NULL,
  `data_from_email` varchar(200) NOT NULL,
  `data_title` varchar(80) NOT NULL,
  `template_data` text NOT NULL,
  PRIMARY KEY (`template_id`),
  KEY `template_name` (`template_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `exp_freeform_templates`
--

INSERT INTO `exp_freeform_templates` (`template_id`, `enable_template`, `wordwrap`, `html`, `template_name`, `template_label`, `data_from_name`, `data_from_email`, `data_title`, `template_data`) VALUES
(1, 'y', 'y', 'n', 'default_template', 'Default Template', '', '', 'Someone has posted to Freeform', 'Someone has posted to Freeform. Here are the details:  \n			 		\nEntry Date: {entry_date}\n{all_custom_fields}'),
(2, 'y', 'y', 'y', 'contact_template', 'Contact Template', '{name}', '{email}', 'New Contact from transcorpughelli', 'Hello,\n\n{name} just posted on the contact form in Transcorp Ughelli website. Here are the details\n\n<b>Name:</b> {name} <br />\n<b>Email:</b> {email} <br />\n<b>Subject:</b> {subject} <br /><br />\n<b>Message:</b> {message} <br />\n\n\nEntry Date: {entry_date}');

-- --------------------------------------------------------

--
-- Table structure for table `exp_freeform_user_email`
--

CREATE TABLE IF NOT EXISTS `exp_freeform_user_email` (
  `email_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(10) unsigned NOT NULL,
  `email_count` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`email_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_global_variables`
--

CREATE TABLE IF NOT EXISTS `exp_global_variables` (
  `variable_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `variable_name` varchar(50) NOT NULL,
  `variable_data` text NOT NULL,
  PRIMARY KEY (`variable_id`),
  KEY `variable_name` (`variable_name`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_html_buttons`
--

CREATE TABLE IF NOT EXISTS `exp_html_buttons` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `member_id` int(10) NOT NULL DEFAULT '0',
  `tag_name` varchar(32) NOT NULL,
  `tag_open` varchar(120) NOT NULL,
  `tag_close` varchar(120) NOT NULL,
  `accesskey` varchar(32) NOT NULL,
  `tag_order` int(3) unsigned NOT NULL,
  `tag_row` char(1) NOT NULL DEFAULT '1',
  `classname` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `exp_html_buttons`
--

INSERT INTO `exp_html_buttons` (`id`, `site_id`, `member_id`, `tag_name`, `tag_open`, `tag_close`, `accesskey`, `tag_order`, `tag_row`, `classname`) VALUES
(1, 1, 0, 'b', '<strong>', '</strong>', 'b', 1, '1', 'btn_b'),
(2, 1, 0, 'i', '<em>', '</em>', 'i', 2, '1', 'btn_i'),
(3, 1, 0, 'blockquote', '<blockquote>', '</blockquote>', 'q', 3, '1', 'btn_blockquote'),
(4, 1, 0, 'a', '<a href="[![Link:!:http://]!]"(!( title="[![Title]!]")!)>', '</a>', 'a', 4, '1', 'btn_a'),
(5, 1, 0, 'img', '<img src="[![Link:!:http://]!]" alt="[![Alternative text]!]" />', '', '', 5, '1', 'btn_img');

-- --------------------------------------------------------

--
-- Table structure for table `exp_layout_publish`
--

CREATE TABLE IF NOT EXISTS `exp_layout_publish` (
  `layout_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `member_group` int(4) unsigned NOT NULL DEFAULT '0',
  `channel_id` int(4) unsigned NOT NULL DEFAULT '0',
  `field_layout` text,
  PRIMARY KEY (`layout_id`),
  KEY `site_id` (`site_id`),
  KEY `member_group` (`member_group`),
  KEY `channel_id` (`channel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_matrix_cols`
--

CREATE TABLE IF NOT EXISTS `exp_matrix_cols` (
  `col_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned DEFAULT '1',
  `field_id` int(6) unsigned DEFAULT NULL,
  `var_id` int(6) unsigned DEFAULT NULL,
  `col_name` varchar(32) DEFAULT NULL,
  `col_label` varchar(50) DEFAULT NULL,
  `col_instructions` text,
  `col_type` varchar(50) DEFAULT 'text',
  `col_required` char(1) DEFAULT 'n',
  `col_search` char(1) DEFAULT 'n',
  `col_order` int(3) unsigned DEFAULT NULL,
  `col_width` varchar(4) DEFAULT NULL,
  `col_settings` text,
  PRIMARY KEY (`col_id`),
  KEY `site_id` (`site_id`),
  KEY `field_id` (`field_id`),
  KEY `var_id` (`var_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `exp_matrix_cols`
--

INSERT INTO `exp_matrix_cols` (`col_id`, `site_id`, `field_id`, `var_id`, `col_name`, `col_label`, `col_instructions`, `col_type`, `col_required`, `col_search`, `col_order`, `col_width`, `col_settings`) VALUES
(1, 1, 10, NULL, 'plant_image', 'Plant Image', '', 'file', 'n', 'n', 0, '33%', 'YToyOntzOjk6ImRpcmVjdG9yeSI7czoxOiIxIjtzOjEyOiJjb250ZW50X3R5cGUiO3M6NToiaW1hZ2UiO30='),
(2, 1, 10, NULL, 'plant_title', 'Plant Title', '', 'text', 'n', 'n', 1, '', 'YTo0OntzOjQ6Im1heGwiO3M6MzoiMTQwIjtzOjk6Im11bHRpbGluZSI7czoxOiJ5IjtzOjM6ImZtdCI7czo0OiJub25lIjtzOjM6ImRpciI7czozOiJsdHIiO30=');

-- --------------------------------------------------------

--
-- Table structure for table `exp_matrix_data`
--

CREATE TABLE IF NOT EXISTS `exp_matrix_data` (
  `row_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned DEFAULT '1',
  `entry_id` int(10) unsigned DEFAULT NULL,
  `field_id` int(6) unsigned DEFAULT NULL,
  `var_id` int(6) unsigned DEFAULT NULL,
  `is_draft` tinyint(1) unsigned DEFAULT '0',
  `row_order` int(4) unsigned DEFAULT NULL,
  `col_id_1` text,
  `col_id_2` text,
  PRIMARY KEY (`row_id`),
  KEY `site_id` (`site_id`),
  KEY `entry_id` (`entry_id`),
  KEY `field_id` (`field_id`),
  KEY `var_id` (`var_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `exp_matrix_data`
--

INSERT INTO `exp_matrix_data` (`row_id`, `site_id`, `entry_id`, `field_id`, `var_id`, `is_draft`, `row_order`, `col_id_1`, `col_id_2`) VALUES
(1, 1, 17, 10, NULL, 0, 1, '{filedir_1}image-big10.jpg', 'GT 13 Gas Turbine'),
(2, 1, 17, 10, NULL, 0, 2, '{filedir_1}image-big8.jpg', 'The Hydrogen Plant'),
(3, 1, 17, 10, NULL, 0, 3, '{filedir_1}image-big2.jpg', '120MVA Unit Power Transformer at Delta IV'),
(4, 1, 17, 10, NULL, 0, 4, '{filedir_1}DSC00711.JPG', 'Delta IV cross sectional view'),
(5, 1, 17, 10, NULL, 0, 5, '{filedir_1}DSC00709.JPG', 'A view of 330KV switchyard at Delta IV');

-- --------------------------------------------------------

--
-- Table structure for table `exp_members`
--

CREATE TABLE IF NOT EXISTS `exp_members` (
  `member_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `group_id` smallint(4) NOT NULL DEFAULT '0',
  `username` varchar(50) NOT NULL,
  `screen_name` varchar(50) NOT NULL,
  `password` varchar(128) NOT NULL,
  `salt` varchar(128) NOT NULL DEFAULT '',
  `unique_id` varchar(40) NOT NULL,
  `crypt_key` varchar(40) DEFAULT NULL,
  `authcode` varchar(10) DEFAULT NULL,
  `email` varchar(72) NOT NULL,
  `url` varchar(150) DEFAULT NULL,
  `location` varchar(50) DEFAULT NULL,
  `occupation` varchar(80) DEFAULT NULL,
  `interests` varchar(120) DEFAULT NULL,
  `bday_d` int(2) DEFAULT NULL,
  `bday_m` int(2) DEFAULT NULL,
  `bday_y` int(4) DEFAULT NULL,
  `aol_im` varchar(50) DEFAULT NULL,
  `yahoo_im` varchar(50) DEFAULT NULL,
  `msn_im` varchar(50) DEFAULT NULL,
  `icq` varchar(50) DEFAULT NULL,
  `bio` text,
  `signature` text,
  `avatar_filename` varchar(120) DEFAULT NULL,
  `avatar_width` int(4) unsigned DEFAULT NULL,
  `avatar_height` int(4) unsigned DEFAULT NULL,
  `photo_filename` varchar(120) DEFAULT NULL,
  `photo_width` int(4) unsigned DEFAULT NULL,
  `photo_height` int(4) unsigned DEFAULT NULL,
  `sig_img_filename` varchar(120) DEFAULT NULL,
  `sig_img_width` int(4) unsigned DEFAULT NULL,
  `sig_img_height` int(4) unsigned DEFAULT NULL,
  `ignore_list` text,
  `private_messages` int(4) unsigned NOT NULL DEFAULT '0',
  `accept_messages` char(1) NOT NULL DEFAULT 'y',
  `last_view_bulletins` int(10) NOT NULL DEFAULT '0',
  `last_bulletin_date` int(10) NOT NULL DEFAULT '0',
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `join_date` int(10) unsigned NOT NULL DEFAULT '0',
  `last_visit` int(10) unsigned NOT NULL DEFAULT '0',
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  `total_entries` smallint(5) unsigned NOT NULL DEFAULT '0',
  `total_comments` smallint(5) unsigned NOT NULL DEFAULT '0',
  `total_forum_topics` mediumint(8) NOT NULL DEFAULT '0',
  `total_forum_posts` mediumint(8) NOT NULL DEFAULT '0',
  `last_entry_date` int(10) unsigned NOT NULL DEFAULT '0',
  `last_comment_date` int(10) unsigned NOT NULL DEFAULT '0',
  `last_forum_post_date` int(10) unsigned NOT NULL DEFAULT '0',
  `last_email_date` int(10) unsigned NOT NULL DEFAULT '0',
  `in_authorlist` char(1) NOT NULL DEFAULT 'n',
  `accept_admin_email` char(1) NOT NULL DEFAULT 'y',
  `accept_user_email` char(1) NOT NULL DEFAULT 'y',
  `notify_by_default` char(1) NOT NULL DEFAULT 'y',
  `notify_of_pm` char(1) NOT NULL DEFAULT 'y',
  `display_avatars` char(1) NOT NULL DEFAULT 'y',
  `display_signatures` char(1) NOT NULL DEFAULT 'y',
  `parse_smileys` char(1) NOT NULL DEFAULT 'y',
  `smart_notifications` char(1) NOT NULL DEFAULT 'y',
  `language` varchar(50) NOT NULL,
  `timezone` varchar(8) NOT NULL,
  `daylight_savings` char(1) NOT NULL DEFAULT 'n',
  `localization_is_site_default` char(1) NOT NULL DEFAULT 'n',
  `time_format` char(2) NOT NULL DEFAULT 'us',
  `cp_theme` varchar(32) DEFAULT NULL,
  `profile_theme` varchar(32) DEFAULT NULL,
  `forum_theme` varchar(32) DEFAULT NULL,
  `tracker` text,
  `template_size` varchar(2) NOT NULL DEFAULT '20',
  `notepad` text,
  `notepad_size` varchar(2) NOT NULL DEFAULT '18',
  `quick_links` text,
  `quick_tabs` text,
  `show_sidebar` char(1) NOT NULL DEFAULT 'n',
  `pmember_id` int(10) NOT NULL DEFAULT '0',
  `rte_enabled` char(1) NOT NULL DEFAULT 'y',
  `rte_toolset_id` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`member_id`),
  KEY `group_id` (`group_id`),
  KEY `unique_id` (`unique_id`),
  KEY `password` (`password`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `exp_members`
--

INSERT INTO `exp_members` (`member_id`, `group_id`, `username`, `screen_name`, `password`, `salt`, `unique_id`, `crypt_key`, `authcode`, `email`, `url`, `location`, `occupation`, `interests`, `bday_d`, `bday_m`, `bday_y`, `aol_im`, `yahoo_im`, `msn_im`, `icq`, `bio`, `signature`, `avatar_filename`, `avatar_width`, `avatar_height`, `photo_filename`, `photo_width`, `photo_height`, `sig_img_filename`, `sig_img_width`, `sig_img_height`, `ignore_list`, `private_messages`, `accept_messages`, `last_view_bulletins`, `last_bulletin_date`, `ip_address`, `join_date`, `last_visit`, `last_activity`, `total_entries`, `total_comments`, `total_forum_topics`, `total_forum_posts`, `last_entry_date`, `last_comment_date`, `last_forum_post_date`, `last_email_date`, `in_authorlist`, `accept_admin_email`, `accept_user_email`, `notify_by_default`, `notify_of_pm`, `display_avatars`, `display_signatures`, `parse_smileys`, `smart_notifications`, `language`, `timezone`, `daylight_savings`, `localization_is_site_default`, `time_format`, `cp_theme`, `profile_theme`, `forum_theme`, `tracker`, `template_size`, `notepad`, `notepad_size`, `quick_links`, `quick_tabs`, `show_sidebar`, `pmember_id`, `rte_enabled`, `rte_toolset_id`) VALUES
(1, 1, 'admin', 'Ughelli Power', 'df08bad2134d6de90aca9bbde1cf61ae4e343db930bba9272dff570c7bfd842b2fd9730e4695e9260589e4e2cfc7d29c677302db80eb9465333143ded2db90fc', 'Zxdr@rU*s-*;/Z?''=Dq*U*]$1+LwXBVj.+#n`JW[t|o2b~2&CozQc[BnV^GBOn7:U#mOuu//rCO3mUjNIQ\\u:u:0$[=kAFd~)xr$Ut_TSVR0,FqJ2t2HCR.?/f;\\I8T=', 'a0daddf925df4c4396a72e169447dd3bb0f344c2', '2e0199904356d4c97441495e5db3f3cf616d5284', NULL, 'support@wittsandstratts.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'y', 0, 0, '127.0.0.1', 1365705937, 1366350823, 1366387996, 8, 0, 0, 0, 1366384567, 0, 0, 0, 'n', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'english', 'UP1', 'n', 'n', 'us', NULL, NULL, NULL, NULL, '20', NULL, '18', '', 'Pages|C=addons_modules&M=show_module_cp&module=pages|1\nEdit Entry|C=content_publish&M=entry_form&entry_id=17|2\nEdit Entry|C=content_publish&M=entry_form&entry_id=17|3', 'y', 0, 'y', 0),
(2, 6, 'phcn_admin', 'phcn_admin', '0e481b68a82dce22e1e683ab2b0c635bb2378fbba0e862a7b03a5d5de22c4f38b0a8767cf498ebf190643ce891866466941cc4961b13d582d592f74dce8c91a1', '3*Vvo55HC{R:@)9$n(*?F<nM3k"Z6+&~>,w1plTXm.0jx:Bl3QM*(Oy7G,B5)$)0Xj!;])Q^~X<e"?zexsDXbm;_t=XWBjS1/O>kK`SZ`UcR;W.vUQI!o\\g]?4%."W:{', 'c63764612ecd93a43c44bf4a51a26e09438b0ef2', 'd3d48e57d3b59e887d06aa1ce502ac6f8f0eb39a', NULL, 'javik@live.com', '', '', '', '', 15, 6, 1989, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'y', 0, 0, '41.206.11.7', 1366349490, 1419879050, 1421140501, 6, 0, 0, 0, 1419879050, 0, 0, 0, 'n', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'english', 'UP1', 'n', 'n', 'us', NULL, NULL, NULL, NULL, '20', NULL, '18', '', 'About Us|C=content_publish&M=entry_form&entry_id=4|1\nSafety Policy|C=content_publish&M=entry_form&entry_id=6|2\nContact|C=content_publish&M=entry_form&entry_id=7|3\nPlants Facilities|C=content_publish&M=entry_form&entry_id=17|4\nEdit|C=content_edit&channel_id=1|5', 'y', 0, 'y', 0);

-- --------------------------------------------------------

--
-- Table structure for table `exp_member_bulletin_board`
--

CREATE TABLE IF NOT EXISTS `exp_member_bulletin_board` (
  `bulletin_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sender_id` int(10) unsigned NOT NULL,
  `bulletin_group` int(8) unsigned NOT NULL,
  `bulletin_date` int(10) unsigned NOT NULL,
  `hash` varchar(10) NOT NULL DEFAULT '',
  `bulletin_expires` int(10) unsigned NOT NULL DEFAULT '0',
  `bulletin_message` text NOT NULL,
  PRIMARY KEY (`bulletin_id`),
  KEY `sender_id` (`sender_id`),
  KEY `hash` (`hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_member_data`
--

CREATE TABLE IF NOT EXISTS `exp_member_data` (
  `member_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `exp_member_data`
--

INSERT INTO `exp_member_data` (`member_id`) VALUES
(1),
(2);

-- --------------------------------------------------------

--
-- Table structure for table `exp_member_fields`
--

CREATE TABLE IF NOT EXISTS `exp_member_fields` (
  `m_field_id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `m_field_name` varchar(32) NOT NULL,
  `m_field_label` varchar(50) NOT NULL,
  `m_field_description` text NOT NULL,
  `m_field_type` varchar(12) NOT NULL DEFAULT 'text',
  `m_field_list_items` text NOT NULL,
  `m_field_ta_rows` tinyint(2) DEFAULT '8',
  `m_field_maxl` smallint(3) NOT NULL,
  `m_field_width` varchar(6) NOT NULL,
  `m_field_search` char(1) NOT NULL DEFAULT 'y',
  `m_field_required` char(1) NOT NULL DEFAULT 'n',
  `m_field_public` char(1) NOT NULL DEFAULT 'y',
  `m_field_reg` char(1) NOT NULL DEFAULT 'n',
  `m_field_cp_reg` char(1) NOT NULL DEFAULT 'n',
  `m_field_fmt` char(5) NOT NULL DEFAULT 'none',
  `m_field_order` int(3) unsigned NOT NULL,
  PRIMARY KEY (`m_field_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_member_groups`
--

CREATE TABLE IF NOT EXISTS `exp_member_groups` (
  `group_id` smallint(4) unsigned NOT NULL,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_title` varchar(100) NOT NULL,
  `group_description` text NOT NULL,
  `is_locked` char(1) NOT NULL DEFAULT 'y',
  `can_view_offline_system` char(1) NOT NULL DEFAULT 'n',
  `can_view_online_system` char(1) NOT NULL DEFAULT 'y',
  `can_access_cp` char(1) NOT NULL DEFAULT 'y',
  `can_access_content` char(1) NOT NULL DEFAULT 'n',
  `can_access_publish` char(1) NOT NULL DEFAULT 'n',
  `can_access_edit` char(1) NOT NULL DEFAULT 'n',
  `can_access_files` char(1) NOT NULL DEFAULT 'n',
  `can_access_fieldtypes` char(1) NOT NULL DEFAULT 'n',
  `can_access_design` char(1) NOT NULL DEFAULT 'n',
  `can_access_addons` char(1) NOT NULL DEFAULT 'n',
  `can_access_modules` char(1) NOT NULL DEFAULT 'n',
  `can_access_extensions` char(1) NOT NULL DEFAULT 'n',
  `can_access_accessories` char(1) NOT NULL DEFAULT 'n',
  `can_access_plugins` char(1) NOT NULL DEFAULT 'n',
  `can_access_members` char(1) NOT NULL DEFAULT 'n',
  `can_access_admin` char(1) NOT NULL DEFAULT 'n',
  `can_access_sys_prefs` char(1) NOT NULL DEFAULT 'n',
  `can_access_content_prefs` char(1) NOT NULL DEFAULT 'n',
  `can_access_tools` char(1) NOT NULL DEFAULT 'n',
  `can_access_comm` char(1) NOT NULL DEFAULT 'n',
  `can_access_utilities` char(1) NOT NULL DEFAULT 'n',
  `can_access_data` char(1) NOT NULL DEFAULT 'n',
  `can_access_logs` char(1) NOT NULL DEFAULT 'n',
  `can_admin_channels` char(1) NOT NULL DEFAULT 'n',
  `can_admin_upload_prefs` char(1) NOT NULL DEFAULT 'n',
  `can_admin_design` char(1) NOT NULL DEFAULT 'n',
  `can_admin_members` char(1) NOT NULL DEFAULT 'n',
  `can_delete_members` char(1) NOT NULL DEFAULT 'n',
  `can_admin_mbr_groups` char(1) NOT NULL DEFAULT 'n',
  `can_admin_mbr_templates` char(1) NOT NULL DEFAULT 'n',
  `can_ban_users` char(1) NOT NULL DEFAULT 'n',
  `can_admin_modules` char(1) NOT NULL DEFAULT 'n',
  `can_admin_templates` char(1) NOT NULL DEFAULT 'n',
  `can_admin_accessories` char(1) NOT NULL DEFAULT 'n',
  `can_edit_categories` char(1) NOT NULL DEFAULT 'n',
  `can_delete_categories` char(1) NOT NULL DEFAULT 'n',
  `can_view_other_entries` char(1) NOT NULL DEFAULT 'n',
  `can_edit_other_entries` char(1) NOT NULL DEFAULT 'n',
  `can_assign_post_authors` char(1) NOT NULL DEFAULT 'n',
  `can_delete_self_entries` char(1) NOT NULL DEFAULT 'n',
  `can_delete_all_entries` char(1) NOT NULL DEFAULT 'n',
  `can_view_other_comments` char(1) NOT NULL DEFAULT 'n',
  `can_edit_own_comments` char(1) NOT NULL DEFAULT 'n',
  `can_delete_own_comments` char(1) NOT NULL DEFAULT 'n',
  `can_edit_all_comments` char(1) NOT NULL DEFAULT 'n',
  `can_delete_all_comments` char(1) NOT NULL DEFAULT 'n',
  `can_moderate_comments` char(1) NOT NULL DEFAULT 'n',
  `can_send_email` char(1) NOT NULL DEFAULT 'n',
  `can_send_cached_email` char(1) NOT NULL DEFAULT 'n',
  `can_email_member_groups` char(1) NOT NULL DEFAULT 'n',
  `can_email_mailinglist` char(1) NOT NULL DEFAULT 'n',
  `can_email_from_profile` char(1) NOT NULL DEFAULT 'n',
  `can_view_profiles` char(1) NOT NULL DEFAULT 'n',
  `can_edit_html_buttons` char(1) NOT NULL DEFAULT 'n',
  `can_delete_self` char(1) NOT NULL DEFAULT 'n',
  `mbr_delete_notify_emails` varchar(255) DEFAULT NULL,
  `can_post_comments` char(1) NOT NULL DEFAULT 'n',
  `exclude_from_moderation` char(1) NOT NULL DEFAULT 'n',
  `can_search` char(1) NOT NULL DEFAULT 'n',
  `search_flood_control` mediumint(5) unsigned NOT NULL,
  `can_send_private_messages` char(1) NOT NULL DEFAULT 'n',
  `prv_msg_send_limit` smallint(5) unsigned NOT NULL DEFAULT '20',
  `prv_msg_storage_limit` smallint(5) unsigned NOT NULL DEFAULT '60',
  `can_attach_in_private_messages` char(1) NOT NULL DEFAULT 'n',
  `can_send_bulletins` char(1) NOT NULL DEFAULT 'n',
  `include_in_authorlist` char(1) NOT NULL DEFAULT 'n',
  `include_in_memberlist` char(1) NOT NULL DEFAULT 'y',
  `include_in_mailinglists` char(1) NOT NULL DEFAULT 'y',
  PRIMARY KEY (`group_id`,`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `exp_member_groups`
--

INSERT INTO `exp_member_groups` (`group_id`, `site_id`, `group_title`, `group_description`, `is_locked`, `can_view_offline_system`, `can_view_online_system`, `can_access_cp`, `can_access_content`, `can_access_publish`, `can_access_edit`, `can_access_files`, `can_access_fieldtypes`, `can_access_design`, `can_access_addons`, `can_access_modules`, `can_access_extensions`, `can_access_accessories`, `can_access_plugins`, `can_access_members`, `can_access_admin`, `can_access_sys_prefs`, `can_access_content_prefs`, `can_access_tools`, `can_access_comm`, `can_access_utilities`, `can_access_data`, `can_access_logs`, `can_admin_channels`, `can_admin_upload_prefs`, `can_admin_design`, `can_admin_members`, `can_delete_members`, `can_admin_mbr_groups`, `can_admin_mbr_templates`, `can_ban_users`, `can_admin_modules`, `can_admin_templates`, `can_admin_accessories`, `can_edit_categories`, `can_delete_categories`, `can_view_other_entries`, `can_edit_other_entries`, `can_assign_post_authors`, `can_delete_self_entries`, `can_delete_all_entries`, `can_view_other_comments`, `can_edit_own_comments`, `can_delete_own_comments`, `can_edit_all_comments`, `can_delete_all_comments`, `can_moderate_comments`, `can_send_email`, `can_send_cached_email`, `can_email_member_groups`, `can_email_mailinglist`, `can_email_from_profile`, `can_view_profiles`, `can_edit_html_buttons`, `can_delete_self`, `mbr_delete_notify_emails`, `can_post_comments`, `exclude_from_moderation`, `can_search`, `search_flood_control`, `can_send_private_messages`, `prv_msg_send_limit`, `prv_msg_storage_limit`, `can_attach_in_private_messages`, `can_send_bulletins`, `include_in_authorlist`, `include_in_memberlist`, `include_in_mailinglists`) VALUES
(1, 1, 'Super Admins', '', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', '', 'y', 'y', 'y', 0, 'y', 20, 60, 'y', 'y', 'y', 'y', 'y'),
(2, 1, 'Banned', '', 'y', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', '', 'n', 'n', 'n', 60, 'n', 20, 60, 'n', 'n', 'n', 'n', 'n'),
(3, 1, 'Guests', '', 'y', 'n', 'y', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'y', 'n', 'n', 'n', 'n', '', 'y', 'n', 'y', 15, 'n', 20, 60, 'n', 'n', 'n', 'n', 'n'),
(4, 1, 'Pending', '', 'y', 'n', 'y', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'y', 'n', 'n', 'n', 'n', '', 'y', 'n', 'y', 15, 'n', 20, 60, 'n', 'n', 'n', 'n', 'n'),
(5, 1, 'Members', '', 'y', 'n', 'y', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'y', 'y', 'y', 'n', '', 'y', 'n', 'y', 10, 'y', 20, 60, 'y', 'n', 'n', 'y', 'y'),
(6, 1, 'Editors/Maintenance', 'This group enters, retrieves and update content.', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'n', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', '', 'y', 'y', 'y', 15, 'y', 20, 60, 'y', 'y', 'y', 'y', 'y');

-- --------------------------------------------------------

--
-- Table structure for table `exp_member_homepage`
--

CREATE TABLE IF NOT EXISTS `exp_member_homepage` (
  `member_id` int(10) unsigned NOT NULL,
  `recent_entries` char(1) NOT NULL DEFAULT 'l',
  `recent_entries_order` int(3) unsigned NOT NULL DEFAULT '0',
  `recent_comments` char(1) NOT NULL DEFAULT 'l',
  `recent_comments_order` int(3) unsigned NOT NULL DEFAULT '0',
  `recent_members` char(1) NOT NULL DEFAULT 'n',
  `recent_members_order` int(3) unsigned NOT NULL DEFAULT '0',
  `site_statistics` char(1) NOT NULL DEFAULT 'r',
  `site_statistics_order` int(3) unsigned NOT NULL DEFAULT '0',
  `member_search_form` char(1) NOT NULL DEFAULT 'n',
  `member_search_form_order` int(3) unsigned NOT NULL DEFAULT '0',
  `notepad` char(1) NOT NULL DEFAULT 'r',
  `notepad_order` int(3) unsigned NOT NULL DEFAULT '0',
  `bulletin_board` char(1) NOT NULL DEFAULT 'r',
  `bulletin_board_order` int(3) unsigned NOT NULL DEFAULT '0',
  `pmachine_news_feed` char(1) NOT NULL DEFAULT 'n',
  `pmachine_news_feed_order` int(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `exp_member_homepage`
--

INSERT INTO `exp_member_homepage` (`member_id`, `recent_entries`, `recent_entries_order`, `recent_comments`, `recent_comments_order`, `recent_members`, `recent_members_order`, `site_statistics`, `site_statistics_order`, `member_search_form`, `member_search_form_order`, `notepad`, `notepad_order`, `bulletin_board`, `bulletin_board_order`, `pmachine_news_feed`, `pmachine_news_feed_order`) VALUES
(1, 'l', 1, 'l', 2, 'n', 0, 'r', 1, 'n', 0, 'r', 2, 'r', 0, 'l', 0),
(2, 'l', 0, 'l', 0, 'n', 0, 'r', 0, 'n', 0, 'r', 0, 'r', 0, 'n', 0);

-- --------------------------------------------------------

--
-- Table structure for table `exp_member_search`
--

CREATE TABLE IF NOT EXISTS `exp_member_search` (
  `search_id` varchar(32) NOT NULL,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `search_date` int(10) unsigned NOT NULL,
  `keywords` varchar(200) NOT NULL,
  `fields` varchar(200) NOT NULL,
  `member_id` int(10) unsigned NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `total_results` int(8) unsigned NOT NULL,
  `query` text NOT NULL,
  PRIMARY KEY (`search_id`),
  KEY `member_id` (`member_id`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `exp_message_attachments`
--

CREATE TABLE IF NOT EXISTS `exp_message_attachments` (
  `attachment_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sender_id` int(10) unsigned NOT NULL DEFAULT '0',
  `message_id` int(10) unsigned NOT NULL DEFAULT '0',
  `attachment_name` varchar(50) NOT NULL DEFAULT '',
  `attachment_hash` varchar(40) NOT NULL DEFAULT '',
  `attachment_extension` varchar(20) NOT NULL DEFAULT '',
  `attachment_location` varchar(150) NOT NULL DEFAULT '',
  `attachment_date` int(10) unsigned NOT NULL DEFAULT '0',
  `attachment_size` int(10) unsigned NOT NULL DEFAULT '0',
  `is_temp` char(1) NOT NULL DEFAULT 'y',
  PRIMARY KEY (`attachment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_message_copies`
--

CREATE TABLE IF NOT EXISTS `exp_message_copies` (
  `copy_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `message_id` int(10) unsigned NOT NULL DEFAULT '0',
  `sender_id` int(10) unsigned NOT NULL DEFAULT '0',
  `recipient_id` int(10) unsigned NOT NULL DEFAULT '0',
  `message_received` char(1) NOT NULL DEFAULT 'n',
  `message_read` char(1) NOT NULL DEFAULT 'n',
  `message_time_read` int(10) unsigned NOT NULL DEFAULT '0',
  `attachment_downloaded` char(1) NOT NULL DEFAULT 'n',
  `message_folder` int(10) unsigned NOT NULL DEFAULT '1',
  `message_authcode` varchar(10) NOT NULL DEFAULT '',
  `message_deleted` char(1) NOT NULL DEFAULT 'n',
  `message_status` varchar(10) NOT NULL DEFAULT '',
  PRIMARY KEY (`copy_id`),
  KEY `message_id` (`message_id`),
  KEY `recipient_id` (`recipient_id`),
  KEY `sender_id` (`sender_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_message_data`
--

CREATE TABLE IF NOT EXISTS `exp_message_data` (
  `message_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sender_id` int(10) unsigned NOT NULL DEFAULT '0',
  `message_date` int(10) unsigned NOT NULL DEFAULT '0',
  `message_subject` varchar(255) NOT NULL DEFAULT '',
  `message_body` text NOT NULL,
  `message_tracking` char(1) NOT NULL DEFAULT 'y',
  `message_attachments` char(1) NOT NULL DEFAULT 'n',
  `message_recipients` varchar(200) NOT NULL DEFAULT '',
  `message_cc` varchar(200) NOT NULL DEFAULT '',
  `message_hide_cc` char(1) NOT NULL DEFAULT 'n',
  `message_sent_copy` char(1) NOT NULL DEFAULT 'n',
  `total_recipients` int(5) unsigned NOT NULL DEFAULT '0',
  `message_status` varchar(25) NOT NULL DEFAULT '',
  PRIMARY KEY (`message_id`),
  KEY `sender_id` (`sender_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_message_folders`
--

CREATE TABLE IF NOT EXISTS `exp_message_folders` (
  `member_id` int(10) unsigned NOT NULL DEFAULT '0',
  `folder1_name` varchar(50) NOT NULL DEFAULT 'InBox',
  `folder2_name` varchar(50) NOT NULL DEFAULT 'Sent',
  `folder3_name` varchar(50) NOT NULL DEFAULT '',
  `folder4_name` varchar(50) NOT NULL DEFAULT '',
  `folder5_name` varchar(50) NOT NULL DEFAULT '',
  `folder6_name` varchar(50) NOT NULL DEFAULT '',
  `folder7_name` varchar(50) NOT NULL DEFAULT '',
  `folder8_name` varchar(50) NOT NULL DEFAULT '',
  `folder9_name` varchar(50) NOT NULL DEFAULT '',
  `folder10_name` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `exp_message_folders`
--

INSERT INTO `exp_message_folders` (`member_id`, `folder1_name`, `folder2_name`, `folder3_name`, `folder4_name`, `folder5_name`, `folder6_name`, `folder7_name`, `folder8_name`, `folder9_name`, `folder10_name`) VALUES
(1, 'InBox', 'Sent', '', '', '', '', '', '', '', ''),
(2, 'InBox', 'Sent', '', '', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `exp_message_listed`
--

CREATE TABLE IF NOT EXISTS `exp_message_listed` (
  `listed_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_id` int(10) unsigned NOT NULL DEFAULT '0',
  `listed_member` int(10) unsigned NOT NULL DEFAULT '0',
  `listed_description` varchar(100) NOT NULL DEFAULT '',
  `listed_type` varchar(10) NOT NULL DEFAULT 'blocked',
  PRIMARY KEY (`listed_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_modules`
--

CREATE TABLE IF NOT EXISTS `exp_modules` (
  `module_id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `module_name` varchar(50) NOT NULL,
  `module_version` varchar(12) NOT NULL,
  `has_cp_backend` char(1) NOT NULL DEFAULT 'n',
  `has_publish_fields` char(1) NOT NULL DEFAULT 'n',
  PRIMARY KEY (`module_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=21 ;

--
-- Dumping data for table `exp_modules`
--

INSERT INTO `exp_modules` (`module_id`, `module_name`, `module_version`, `has_cp_backend`, `has_publish_fields`) VALUES
(1, 'Comment', '2.3', 'y', 'n'),
(2, 'Email', '2.0', 'n', 'n'),
(3, 'Emoticon', '2.0', 'n', 'n'),
(4, 'Jquery', '1.0', 'n', 'n'),
(5, 'Rss', '2.0', 'n', 'n'),
(6, 'Safecracker', '2.1', 'y', 'n'),
(7, 'Search', '2.2', 'n', 'n'),
(8, 'Channel', '2.0.1', 'n', 'n'),
(9, 'Member', '2.1', 'n', 'n'),
(10, 'Stats', '2.0', 'n', 'n'),
(11, 'Rte', '1.0', 'y', 'n'),
(12, 'File', '1.0.0', 'n', 'n'),
(13, 'Freeform', '3.1.1', 'y', 'n'),
(14, 'Pages', '2.2', 'y', 'y'),
(15, 'Referrer', '2.1.1', 'y', 'n'),
(16, 'Wygwam', '2.1.4', 'y', 'n'),
(17, 'Merge', '1.0', 'y', 'n'),
(18, 'Merge', '1.0', 'y', 'n'),
(19, 'Merge', '1.0', 'y', 'n'),
(20, 'Automin', '2.1.3', 'y', 'n');

-- --------------------------------------------------------

--
-- Table structure for table `exp_module_member_groups`
--

CREATE TABLE IF NOT EXISTS `exp_module_member_groups` (
  `group_id` smallint(4) unsigned NOT NULL,
  `module_id` mediumint(5) unsigned NOT NULL,
  PRIMARY KEY (`group_id`,`module_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `exp_module_member_groups`
--

INSERT INTO `exp_module_member_groups` (`group_id`, `module_id`) VALUES
(6, 1),
(6, 6),
(6, 11),
(6, 13),
(6, 14),
(6, 15),
(6, 16),
(6, 17),
(6, 18),
(6, 19),
(6, 20);

-- --------------------------------------------------------

--
-- Table structure for table `exp_online_users`
--

CREATE TABLE IF NOT EXISTS `exp_online_users` (
  `online_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `member_id` int(10) NOT NULL DEFAULT '0',
  `in_forum` char(1) NOT NULL DEFAULT 'n',
  `name` varchar(50) NOT NULL DEFAULT '0',
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `date` int(10) unsigned NOT NULL DEFAULT '0',
  `anon` char(1) NOT NULL,
  PRIMARY KEY (`online_id`),
  KEY `date` (`date`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=30270 ;

--
-- Dumping data for table `exp_online_users`
--

INSERT INTO `exp_online_users` (`online_id`, `site_id`, `member_id`, `in_forum`, `name`, `ip_address`, `date`, `anon`) VALUES
(30261, 1, 0, 'n', '', '167.114.103.225', 1425238907, ''),
(30262, 1, 0, 'n', '', '167.114.103.51', 1425254864, ''),
(30263, 1, 0, 'n', '', '167.114.103.51', 1425254864, ''),
(30264, 1, 0, 'n', '', '167.114.103.51', 1425254864, ''),
(30265, 1, 0, 'n', '', '167.114.103.225', 1425238907, ''),
(30266, 1, 0, 'n', '', '167.114.103.51', 1425254864, ''),
(30267, 1, 0, 'n', '', '167.114.103.51', 1425254864, ''),
(30268, 1, 0, 'n', '', '167.114.103.51', 1425254864, ''),
(30269, 1, 0, 'n', '', '167.114.103.51', 1425254864, '');

-- --------------------------------------------------------

--
-- Table structure for table `exp_pages_configuration`
--

CREATE TABLE IF NOT EXISTS `exp_pages_configuration` (
  `configuration_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(8) unsigned NOT NULL DEFAULT '1',
  `configuration_name` varchar(60) NOT NULL,
  `configuration_value` varchar(100) NOT NULL,
  PRIMARY KEY (`configuration_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_password_lockout`
--

CREATE TABLE IF NOT EXISTS `exp_password_lockout` (
  `lockout_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `login_date` int(10) unsigned NOT NULL,
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `user_agent` varchar(120) NOT NULL,
  `username` varchar(50) NOT NULL,
  PRIMARY KEY (`lockout_id`),
  KEY `login_date` (`login_date`),
  KEY `ip_address` (`ip_address`),
  KEY `user_agent` (`user_agent`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `exp_password_lockout`
--

INSERT INTO `exp_password_lockout` (`lockout_id`, `login_date`, `ip_address`, `user_agent`, `username`) VALUES
(1, 1412238991, '41.75.84.230', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2062.124 Safari/537.36', 'phcn_admin');

-- --------------------------------------------------------

--
-- Table structure for table `exp_ping_servers`
--

CREATE TABLE IF NOT EXISTS `exp_ping_servers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `member_id` int(10) NOT NULL DEFAULT '0',
  `server_name` varchar(32) NOT NULL,
  `server_url` varchar(150) NOT NULL,
  `port` varchar(4) NOT NULL DEFAULT '80',
  `ping_protocol` varchar(12) NOT NULL DEFAULT 'xmlrpc',
  `is_default` char(1) NOT NULL DEFAULT 'y',
  `server_order` int(3) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_referrers`
--

CREATE TABLE IF NOT EXISTS `exp_referrers` (
  `ref_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) DEFAULT '1',
  `ref_from` varchar(150) DEFAULT NULL,
  `ref_to` varchar(120) DEFAULT NULL,
  `ref_ip` varchar(45) DEFAULT NULL,
  `ref_date` int(10) unsigned DEFAULT '0',
  `ref_agent` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ref_id`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11921 ;

--
-- Dumping data for table `exp_referrers`
--

INSERT INTO `exp_referrers` (`ref_id`, `site_id`, `ref_from`, `ref_to`, `ref_ip`, `ref_date`, `ref_agent`) VALUES
(11411, 1, 'http://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=2&cad=rja&uact=8&ved=0CCMQFjAB&url=http://www.ughellipower.com/&ei=JW3eVMLpJs6ZyATXmYDoCw', 'http://www.ughellipower.com', '104.129.196.74', 1423863155, 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; yie11; rv:11.0) like Gecko'),
(11412, 1, 'http://xudeem-pravilno.ru/', 'http://www.ughellipower.com/press-release', '82.193.99.33', 1423871569, 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1; .NET CLR 1.1.4322; XMPP Tiscali Communicator'),
(11413, 1, 'http://xudeem-pravilno.ru/', 'http://www.ughellipower.com/press-release', '82.193.99.33', 1423871570, 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1; .NET CLR 1.1.4322; XMPP Tiscali Communicator'),
(11414, 1, 'http://xudeem-pravilno.ru/', 'http://www.ughellipower.com/press-release', '82.193.99.33', 1423871571, 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1; .NET CLR 1.1.4322; XMPP Tiscali Communicator'),
(11415, 1, 'http://buttons-for-website.com', 'http://www.ughellipower.com', '187.113.172.140', 1423873815, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1985.143 Safa'),
(11416, 1, 'http://viktoria-center.ru/', 'http://www.ughellipower.com/plants-facilities', '178.137.84.200', 1423882110, 'Opera/9.0 (Windows NT 5.1; U; en)'),
(11417, 1, 'http://viktoria-center.ru/', 'http://www.ughellipower.com/plants-facilities', '178.137.84.200', 1423882111, 'Opera/9.0 (Windows NT 5.1; U; en)'),
(11418, 1, 'http://viktoria-center.ru/', 'http://www.ughellipower.com/plants-facilities', '178.137.84.200', 1423882112, 'Opera/9.0 (Windows NT 5.1; U; en)'),
(11419, 1, 'http://song5.ru/', 'http://www.ughellipower.com/plants-facilities', '46.118.154.155', 1423887173, 'Mozilla/2.0 (compatible; MSIE 3.02; Windows CE; 240x320)'),
(11420, 1, 'http://song5.ru/', 'http://www.ughellipower.com/plants-facilities', '46.118.154.155', 1423887174, 'Mozilla/2.0 (compatible; MSIE 3.02; Windows CE; 240x320)'),
(11421, 1, 'http://song5.ru/', 'http://www.ughellipower.com/plants-facilities', '46.118.154.155', 1423887175, 'Mozilla/2.0 (compatible; MSIE 3.02; Windows CE; 240x320)'),
(11422, 1, 'http://bithack.ru/', 'http://www.ughellipower.com/plants-facilities', '37.115.186.0', 1423887289, 'Mozilla/4.0 (compatible; MSIE 5.5; Windows 95)'),
(11423, 1, 'http://bithack.ru/', 'http://www.ughellipower.com/plants-facilities', '37.115.186.0', 1423887290, 'Mozilla/4.0 (compatible; MSIE 5.5; Windows 95)'),
(11424, 1, 'http://bithack.ru/', 'http://www.ughellipower.com/plants-facilities', '37.115.186.0', 1423887291, 'Mozilla/4.0 (compatible; MSIE 5.5; Windows 95)'),
(11425, 1, 'http://cpa-partnerki.ru/', 'http://www.ughellipower.com/plants-facilities', '37.115.186.0', 1423887336, 'Mozilla/4.0 (compatible; MSIE 5.5; Windows NT 4.0)'),
(11426, 1, 'http://cpa-partnerki.ru/', 'http://www.ughellipower.com/plants-facilities', '37.115.186.0', 1423887337, 'Mozilla/4.0 (compatible; MSIE 5.5; Windows NT 4.0)'),
(11427, 1, 'http://cpa-partnerki.ru/', 'http://www.ughellipower.com/plants-facilities', '37.115.186.0', 1423887338, 'Mozilla/4.0 (compatible; MSIE 5.5; Windows NT 4.0)'),
(11428, 1, 'http://www.kirpich-kupit.ru/', 'http://www.ughellipower.com/plants-facilities', '46.118.154.155', 1423895014, 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1; YPC 3.0.2; .NET CLR 1.1.4322; yplus 4.4.02b)'),
(11429, 1, 'http://www.kirpich-kupit.ru/', 'http://www.ughellipower.com/plants-facilities', '46.118.154.155', 1423895015, 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1; YPC 3.0.2; .NET CLR 1.1.4322; yplus 4.4.02b)'),
(11430, 1, 'http://www.kirpich-kupit.ru/', 'http://www.ughellipower.com/plants-facilities', '46.118.154.155', 1423895016, 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1; YPC 3.0.2; .NET CLR 1.1.4322; yplus 4.4.02b)'),
(11431, 1, 'http://www.google.co.in/url?sa=t&rct=j&q=&esrc=s&source=web&cd=3&ved=0CDAQFjAC&url=http://www.ughellipower.com/about&ei=BgPfVOevDZOLuATroIDYCQ&usg=AFQ', 'http://www.ughellipower.com/about', '14.139.238.50', 1423901610, 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:35.0) Gecko/20100101 Firefox/35.0'),
(11432, 1, 'https://www.google.co.in/', 'http://www.ughellipower.com', '111.91.51.90', 1423902259, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.111 Safari/537.'),
(11433, 1, 'http://vpihnul.ru/', 'http://www.ughellipower.com/plants-facilities', '178.137.84.200', 1423906281, 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1; Media Center PC'),
(11434, 1, 'http://vpihnul.ru/', 'http://www.ughellipower.com/plants-facilities', '178.137.84.200', 1423906282, 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1; Media Center PC'),
(11435, 1, 'http://vpihnul.ru/', 'http://www.ughellipower.com/plants-facilities', '178.137.84.200', 1423906283, 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1; Media Center PC'),
(11436, 1, 'http://www.google.com/search?q=power+industries+in+delta+state&client=ms-opera-mini&channel=new&gws_rd=cr&hl=en&ie=UTF-8&tbm;=', 'http://www.ughellipower.com/press-release', '82.145.216.58', 1423906535, 'Opera/9.80 (Series 60; Opera Mini/7.1.32444/35.7382; U; en) Presto/2.8.119 Version/11.10'),
(11437, 1, 'http://transcorpnigeria.com/power/', 'http://www.ughellipower.com', '41.190.2.3', 1423909818, 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:34.0) Gecko/20100101 Firefox/34.0'),
(11438, 1, 'http://prigatour.ru/', 'http://www.ughellipower.com/plants-facilities', '91.207.8.46', 1423912765, 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1; Media Center PC'),
(11439, 1, 'http://prigatour.ru/', 'http://www.ughellipower.com/plants-facilities', '91.207.8.46', 1423912766, 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1; Media Center PC'),
(11440, 1, 'http://prigatour.ru/', 'http://www.ughellipower.com/plants-facilities', '91.207.8.46', 1423912767, 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1; Media Center PC'),
(11441, 1, 'http://www.bing.com/search?q=Ughelli+Power+Station&FORM=R5FD3', 'http://www.ughellipower.com', '41.190.2.58', 1423913736, 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727; .NET CLR '),
(11442, 1, 'http://www.google.de/url?sa=t&rct=j&q=&esrc=s&source=web&cd=5&ved=0CEIQFjAE&url=http://www.ughellipower.com/press-release&ei=mDTfVIzWMsTbapPwgvgK&usg=', 'http://www.ughellipower.com/press-release', '91.19.151.102', 1423914149, 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:35.0) Gecko/20100101 Firefox/35.0'),
(11443, 1, 'http://taihouse.ru/', 'http://www.ughellipower.com/plants-facilities', '37.115.186.0', 1423914689, 'Opera/7.54 (Windows NT 5.1; U)  [pl]'),
(11444, 1, 'http://taihouse.ru/', 'http://www.ughellipower.com/plants-facilities', '37.115.186.0', 1423914690, 'Opera/7.54 (Windows NT 5.1; U)  [pl]'),
(11445, 1, 'http://taihouse.ru/', 'http://www.ughellipower.com/plants-facilities', '37.115.186.0', 1423914691, 'Opera/7.54 (Windows NT 5.1; U)  [pl]'),
(11446, 1, 'http://robot-forex.biz/', 'http://www.ughellipower.com/plants-facilities', '46.118.154.155', 1423914779, 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1; .NET CLR 1.1.4322) NS8/0.9.6'),
(11447, 1, 'http://robot-forex.biz/', 'http://www.ughellipower.com/plants-facilities', '46.118.154.155', 1423914782, 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1; .NET CLR 1.1.4322) NS8/0.9.6'),
(11448, 1, 'http://robot-forex.biz/', 'http://www.ughellipower.com/plants-facilities', '46.118.154.155', 1423914783, 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1; .NET CLR 1.1.4322) NS8/0.9.6'),
(11449, 1, 'http://www.google.com.ng/url?sa=t&rct=j&q=ughelli+transcorp&source=web&cd=1&ved=0CBkQFjAA&url=http://www.ughellipower.com/&ei=zj3fVLXOO8OtafOKghA&usg=', 'http://www.ughellipower.com', '41.206.11.2', 1423916500, 'Mozilla/5.0 (Linux; U; Android 4.1.2; en-gb; GT-N8000 Build/JZO54K) AppleWebKit/534.30 (KHTML, like '),
(11450, 1, 'https://www.google.it/', 'http://www.ughellipower.com', '82.53.155.109', 1423925712, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.111 Safari/537.'),
(11451, 1, 'http://krasivoe-kino.com/', 'http://www.ughellipower.com/plants-facilities', '178.137.84.200', 1423931230, 'Opera/8.00 (Windows NT 5.1; U; en)'),
(11452, 1, 'http://krasivoe-kino.com/', 'http://www.ughellipower.com/plants-facilities', '178.137.84.200', 1423931231, 'Opera/8.00 (Windows NT 5.1; U; en)'),
(11453, 1, 'http://krasivoe-kino.com/', 'http://www.ughellipower.com/plants-facilities', '178.137.84.200', 1423931232, 'Opera/8.00 (Windows NT 5.1; U; en)'),
(11454, 1, 'http://www.knowed.ru/', 'http://www.ughellipower.com/plants-facilities', '46.118.154.155', 1423931471, 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1; .NET CLR 1.1.4322) Babya Discoverer  8.0:'),
(11455, 1, 'http://www.knowed.ru/', 'http://www.ughellipower.com/plants-facilities', '46.118.154.155', 1423931472, 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1; .NET CLR 1.1.4322) Babya Discoverer  8.0:'),
(11456, 1, 'http://www.knowed.ru/', 'http://www.ughellipower.com/plants-facilities', '46.118.154.155', 1423931473, 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1; .NET CLR 1.1.4322) Babya Discoverer  8.0:'),
(11457, 1, 'https://www.google.com.ng/', 'http://www.ughellipower.com', '66.249.93.203', 1423935446, 'Mozilla/5.0 (Linux; Android 4.4.2; HTCONE Build/KOT49H) AppleWebKit/537.36 (KHTML, like Gecko) Chrom'),
(11458, 1, 'http://doska-vsem.ru/', 'http://www.ughellipower.com/plants-facilities', '195.242.218.133', 1423936124, 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1)'),
(11459, 1, 'http://doska-vsem.ru/', 'http://www.ughellipower.com/plants-facilities', '195.242.218.133', 1423936127, 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1)'),
(11460, 1, 'http://doska-vsem.ru/', 'http://www.ughellipower.com/plants-facilities', '195.242.218.133', 1423936130, 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1)'),
(11461, 1, 'http://smart-halyava.com/', 'http://www.ughellipower.com/plants-facilities', '37.115.186.0', 1423941694, 'Opera/7.11 (Windows NT 5.1; U) [en]'),
(11462, 1, 'http://smart-halyava.com/', 'http://www.ughellipower.com/plants-facilities', '37.115.186.0', 1423941695, 'Opera/7.11 (Windows NT 5.1; U) [en]'),
(11463, 1, 'http://smart-halyava.com/', 'http://www.ughellipower.com/plants-facilities', '37.115.186.0', 1423941696, 'Opera/7.11 (Windows NT 5.1; U) [en]'),
(11464, 1, 'http://www.google.com/search?q=electricity+generating+companies+in+nigeria+in+2014&client=ms-rim&hl=en&channel=browser&oq=electricity+generating+compa', 'http://www.ughellipower.com/press-release', '93.186.31.96', 1423942295, 'Mozilla/5.0 (BlackBerry; U; BlackBerry 9810; en-US) AppleWebKit/534.11+ (KHTML, like Gecko) Version/'),
(11465, 1, 'http://www.google.com.ng/search?q=transcorp+ughelli+&btnG;=', 'http://www.ughellipower.com', '82.145.222.34', 1423953373, 'Opera/9.80 (Android; Opera Mini/7.5.33361/35.7382; U; en) Presto/2.8.119 Version/11.10'),
(11466, 1, 'http://www.google.com.ng/search?q=transcorp+ughelli+&btnG;=', 'http://www.ughellipower.com/about', '82.145.222.34', 1423953401, 'Opera/9.80 (Android; Opera Mini/7.5.33361/35.7382; U; en) Presto/2.8.119 Version/11.10'),
(11467, 1, 'http://www.google.com/m?q=power+generating+stations++in+nigeria+with+rated+and+installed+capacity&client=ms-opera-mini-android&channel=new', 'http://www.ughellipower.com/about', '82.145.220.165', 1423966169, 'Opera/9.80 (Android; Opera Mini/7.5.33361/35.7382; U; en) Presto/2.8.119 Version/11.10'),
(11468, 1, 'http://www.google.com/m?q=Ughelli+Power+plant+with+rated+and+installed+capacity&client=ms-opera-mini-android&channel=new', 'http://www.ughellipower.com/press-release', '82.145.220.165', 1423966429, 'Opera/9.80 (Android; Opera Mini/7.5.33361/35.7382; U; en) Presto/2.8.119 Version/11.10'),
(11469, 1, 'http://www.artparquet.ru/', 'http://www.ughellipower.com', '213.110.133.221', 1423971753, 'Mozilla/4.0 (compatible; Blog Search;)'),
(11470, 1, 'http://www.artparquet.ru/', 'http://www.ughellipower.com', '213.110.133.221', 1423971755, 'Mozilla/4.0 (compatible; Blog Search;)'),
(11471, 1, 'http://www.artparquet.ru/', 'http://www.ughellipower.com', '213.110.133.221', 1423971757, 'Mozilla/4.0 (compatible; Blog Search;)'),
(11472, 1, 'http://www.google.com/m?q=how+much+is+the+community+project+from+transcorp+ughelli+power&client=ms-opera-mini-android&channel=new', 'http://www.ughellipower.com/press-release', '82.145.210.179', 1423976510, 'Opera/9.80 (Android; Opera Mini/7.5.33361/35.7382; U; en) Presto/2.8.119 Version/11.10'),
(11473, 1, 'http://buttons-for-website.com', 'http://www.ughellipower.com', '93.46.80.99', 1423980511, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1985.143 Safa'),
(11474, 1, 'https://www.google.de/', 'http://www.ughellipower.com/about', '88.128.80.126', 1423982864, 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.111 Safa'),
(11475, 1, 'http://semalt.semalt.com/crawler.php?u=http://ughellipower.com', 'http://www.ughellipower.com', '122.15.146.13', 1423994576, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1985.143 Safa'),
(11476, 1, 'http://dostavka-v-ukrainu.ru/', 'http://www.ughellipower.com/plants-facilities', '178.137.84.200', 1423995566, 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; .NET CLR 1.0.3705)'),
(11477, 1, 'http://dostavka-v-ukrainu.ru/', 'http://www.ughellipower.com/plants-facilities', '178.137.84.200', 1423995565, 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; .NET CLR 1.0.3705)'),
(11478, 1, 'http://dostavka-v-ukrainu.ru/', 'http://www.ughellipower.com/plants-facilities', '178.137.84.200', 1423995567, 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; .NET CLR 1.0.3705)'),
(11479, 1, 'https://www.google.com/', 'http://www.ughellipower.com/about', '175.110.249.61', 1423995630, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.111 Safa'),
(11480, 1, 'http://electricity.nextierlimited.com/?tag=national-power-sector-apprenticeship-scheme-napsas', 'http://www.ughellipower.com', '82.145.222.34', 1424010075, 'Opera/9.80 (Android; Opera Mini/7.6.40234/35.7382; U; en) Presto/2.8.119 Version/11.10'),
(11481, 1, 'http://audi.7zap.com/', 'http://www.ughellipower.com/press-release', '82.193.99.33', 1424012074, 'Mozilla/4.0 (compatible; MSIE 6.0; Update a; AOL 6.0; Windows 98)'),
(11482, 1, 'http://audi.7zap.com/', 'http://www.ughellipower.com/press-release', '82.193.99.33', 1424012075, 'Mozilla/4.0 (compatible; MSIE 6.0; Update a; AOL 6.0; Windows 98)'),
(11483, 1, 'http://audi.7zap.com/', 'http://www.ughellipower.com/press-release', '82.193.99.33', 1424012076, 'Mozilla/4.0 (compatible; MSIE 6.0; Update a; AOL 6.0; Windows 98)'),
(11484, 1, 'http://americatlas.com/', 'http://www.ughellipower.com/plants-facilities', '46.119.124.167', 1424025637, 'Mozilla/4.0 (compatible; MSIE 6.0; Update a; AOL 6.0; Windows 98)'),
(11485, 1, 'http://americatlas.com/', 'http://www.ughellipower.com/plants-facilities', '46.119.124.167', 1424025638, 'Mozilla/4.0 (compatible; MSIE 6.0; Update a; AOL 6.0; Windows 98)'),
(11486, 1, 'http://americatlas.com/', 'http://www.ughellipower.com/plants-facilities', '46.119.124.167', 1424025639, 'Mozilla/4.0 (compatible; MSIE 6.0; Update a; AOL 6.0; Windows 98)'),
(11487, 1, 'https://www.google.com/', 'http://www.ughellipower.com/about', '31.59.0.31', 1424027362, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.111 Safa'),
(11488, 1, 'http://www.google.nl/search?client=ms-rim&hl=en&q=Electrical+power+training+institute+in+Ugheli&ie=UTF-8&oe=UTF-8&channel=browser&gws_rd=cr&ei=LPLgVLj', 'http://www.ughellipower.com/press-release', '93.186.23.97', 1424028238, 'Mozilla/5.0 (BlackBerry; U; BlackBerry 9810; en-US) AppleWebKit/534.11+ (KHTML, like Gecko) Version/'),
(11489, 1, 'http://www.google.com/search?client=ms-rim&hl=en&q=ughelli power plant&ie=UTF-8&oe=UTF-8&channel=browser', 'http://www.ughellipower.com', '93.186.23.80', 1424028963, 'Mozilla/5.0 (BlackBerry; U; BlackBerry 9320; en-US) AppleWebKit/534.11+ (KHTML, like Gecko) Version/'),
(11490, 1, 'http://www.google.com/search?client=ms-rim&hl=en&q=ughelli power plant&ie=UTF-8&oe=UTF-8&channel=browser', 'http://www.ughellipower.com/plants-facilities', '93.186.23.80', 1424029065, 'Mozilla/5.0 (BlackBerry; U; BlackBerry 9320; en-US) AppleWebKit/534.11+ (KHTML, like Gecko) Version/'),
(11491, 1, 'http://www.google.com/url?sa=t&source=web&cd=1&ved=0CB0QFjAA&url=http://www.ughellipower.com/&rct=j&q=ughelli power plc&ei=HwrhVIGwFsX_Ut3ug9AN&usg=AF', 'http://www.ughellipower.com', '168.235.196.222', 1424034344, 'Mozilla/5.0 (Linux; U; Android 4.2.1; en-US; TECNO F7 Build/JOP40D) AppleWebKit/534.30 (KHTML, like '),
(11492, 1, 'http://www.google.com/url?sa=t&source=web&cd=2&ved=0CCEQjBAwAQ&url=http://www.ughellipower.com/about&rct=j&q=ughelli power plc&ei=HwrhVIGwFsX_Ut3ug9AN', 'http://www.ughellipower.com/about', '168.235.196.222', 1424034407, 'Mozilla/5.0 (Linux; U; Android 4.2.1; en-US; TECNO F7 Build/JOP40D) AppleWebKit/534.30 (KHTML, like '),
(11493, 1, 'http://www.google.com.ng/search?q=ughelli+power+plc+rated+capacity+and+installed+capacity+&oq=ughelli+power+plc+rated+capacity+and+installed+capacity+', 'http://www.ughellipower.com/about', '41.206.11.13', 1424035016, 'Mozilla/5.0 (compatible; MSIE 10.0; Windows Phone 8.0; Trident/6.0; IEMobile/10.0; ARM; Touch; NOKIA'),
(11494, 1, 'http://ccpfy.net/', 'http://www.ughellipower.com/plants-facilities', '178.137.92.19', 1424035776, 'Mozilla/4.0 (compatible; MSIE 6.0; MSIE 5.5; Windows NT 4.0) Opera 7.0 [en]'),
(11495, 1, 'http://www.bookmaker-bet.com/', 'http://www.ughellipower.com/plants-facilities', '178.137.92.19', 1424035776, 'Mozilla/4.0 (compatible; MSIE 6.0; MSIE 5.5; Windows NT 4.0) Opera 7.0 [en]'),
(11496, 1, 'http://www.bookmaker-bet.com/', 'http://www.ughellipower.com/plants-facilities', '178.137.92.19', 1424035777, 'Mozilla/4.0 (compatible; MSIE 6.0; MSIE 5.5; Windows NT 4.0) Opera 7.0 [en]'),
(11497, 1, 'http://ccpfy.net/', 'http://www.ughellipower.com/plants-facilities', '178.137.92.19', 1424035777, 'Mozilla/4.0 (compatible; MSIE 6.0; MSIE 5.5; Windows NT 4.0) Opera 7.0 [en]'),
(11498, 1, 'http://www.bookmaker-bet.com/', 'http://www.ughellipower.com/plants-facilities', '178.137.92.19', 1424035778, 'Mozilla/4.0 (compatible; MSIE 6.0; MSIE 5.5; Windows NT 4.0) Opera 7.0 [en]'),
(11499, 1, 'http://ccpfy.net/', 'http://www.ughellipower.com/plants-facilities', '178.137.92.19', 1424035778, 'Mozilla/4.0 (compatible; MSIE 6.0; MSIE 5.5; Windows NT 4.0) Opera 7.0 [en]'),
(11500, 1, 'http://song5.ru/', 'http://www.ughellipower.com/plants-facilities', '46.119.115.79', 1424036131, 'Mozilla/2.0 (compatible; MSIE 3.02; Windows CE; 240x320)'),
(11501, 1, 'http://song5.ru/', 'http://www.ughellipower.com/plants-facilities', '46.119.115.79', 1424036132, 'Mozilla/2.0 (compatible; MSIE 3.02; Windows CE; 240x320)'),
(11502, 1, 'http://song5.ru/', 'http://www.ughellipower.com/plants-facilities', '46.119.115.79', 1424036133, 'Mozilla/2.0 (compatible; MSIE 3.02; Windows CE; 240x320)'),
(11503, 1, 'http://www.nakolochka.in/', 'http://www.ughellipower.com/plants-facilities', '46.119.115.79', 1424040585, 'Opera/9.01 (Windows NT 5.1; U; en)'),
(11504, 1, 'http://www.nakolochka.in/', 'http://www.ughellipower.com/plants-facilities', '46.119.115.79', 1424040587, 'Opera/9.01 (Windows NT 5.1; U; en)'),
(11505, 1, 'http://www.nakolochka.in/', 'http://www.ughellipower.com/plants-facilities', '46.119.115.79', 1424040588, 'Opera/9.01 (Windows NT 5.1; U; en)'),
(11506, 1, 'http://transcorpnigeria.com/power/', 'http://www.ughellipower.com', '112.152.199.133', 1424047217, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.111 Safari/537.'),
(11507, 1, 'http://www.spy-sts.com/', 'http://www.ughellipower.com/plants-facilities', '46.119.124.167', 1424049655, 'Mozilla/4.0 (compatible; MSIE 5.0; Windows NT; DigExt)'),
(11508, 1, 'http://www.spy-sts.com/', 'http://www.ughellipower.com/plants-facilities', '46.119.124.167', 1424049656, 'Mozilla/4.0 (compatible; MSIE 5.0; Windows NT; DigExt)'),
(11509, 1, 'http://www.spy-sts.com/', 'http://www.ughellipower.com/plants-facilities', '46.119.124.167', 1424049657, 'Mozilla/4.0 (compatible; MSIE 5.0; Windows NT; DigExt)'),
(11510, 1, 'https://www.google.com.ng/', 'http://www.ughellipower.com/about', '41.203.67.162', 1424055304, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.111 Safa'),
(11511, 1, 'http://www.google.com/m?q=ughelli+power+plant&client=ms-opera-mini-android&channel=new', 'http://www.ughellipower.com/about', '37.228.104.95', 1424058887, 'Opera/9.80 (Android; Opera Mini/7.5.33361/35.7382; U; en) Presto/2.8.119 Version/11.10'),
(11512, 1, 'http://pornogig.com/', 'http://www.ughellipower.com/plants-facilities', '46.119.115.79', 1424062640, 'Mozilla/4.0 (compatible; MSIE 5.5; Windows NT 5.0)'),
(11513, 1, 'http://pornogig.com/', 'http://www.ughellipower.com/plants-facilities', '46.119.115.79', 1424062641, 'Mozilla/4.0 (compatible; MSIE 5.5; Windows NT 5.0)'),
(11514, 1, 'http://pornogig.com/', 'http://www.ughellipower.com/plants-facilities', '46.119.115.79', 1424062642, 'Mozilla/4.0 (compatible; MSIE 5.5; Windows NT 5.0)'),
(11515, 1, 'http://wma.su/', 'http://www.ughellipower.com/plants-facilities', '46.119.124.167', 1424073558, 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1; .NET CLR 1.1.4322)'),
(11516, 1, 'http://wma.su/', 'http://www.ughellipower.com/plants-facilities', '46.119.124.167', 1424073559, 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1; .NET CLR 1.1.4322)'),
(11517, 1, 'http://wma.su/', 'http://www.ughellipower.com/plants-facilities', '46.119.124.167', 1424073560, 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1; .NET CLR 1.1.4322)'),
(11518, 1, 'http://www.google.nl/url?sa=t&rct=j&q=&esrc=s&source=web&cd=1&ved=0CCEQFjAA&url=http://ughellipower.com/plants-facilities&ei=q6XhVOuDApT7aoSlgogP&usg=', 'http://www.ughellipower.com/plants-facilities', '212.78.203.194', 1424074163, 'Mozilla/5.0 (Windows NT 6.1; Trident/7.0; rv:11.0) like Gecko'),
(11519, 1, 'http://www.google.com/search?client=ms-opera-mini&channel=new&gws_rd=cr&hl=en&q=Transcorp Ughelli postal address&spell=1&sa=X', 'http://www.ughellipower.com/press-release', '82.145.211.86', 1424074751, 'Opera/9.80 (J2ME/MIDP; Opera Mini/8.0.35626/35.7382; U; en) Presto/2.8.119 Version/11.10'),
(11520, 1, 'http://www.astrale.ru/', 'http://www.ughellipower.com/plants-facilities', '46.119.115.79', 1424075912, 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; ru) Opera 8.50'),
(11521, 1, 'http://www.astrale.ru/', 'http://www.ughellipower.com/plants-facilities', '46.119.115.79', 1424075913, 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; ru) Opera 8.50'),
(11522, 1, 'http://www.astrale.ru/', 'http://www.ughellipower.com/plants-facilities', '46.119.115.79', 1424075914, 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; ru) Opera 8.50'),
(11523, 1, 'https://www.google.es/', 'http://www.ughellipower.com/about', '83.40.16.34', 1424076683, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.111 Safa'),
(11524, 1, 'http://www.google.co.in/url?sa=t&rct=j&q=ughelli power plc&source=web&cd=1&ved=0CB0QFjAA&url=http://www.ughellipower.com/&ei=mrvhVJKND4SWuASF04HQBQ&us', 'http://www.ughellipower.com', '103.246.197.13', 1424079775, 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:24.0) Gecko/20100101 Firefox/24.0'),
(11525, 1, 'http://www.google.co.in/url?sa=t&rct=j&q=ughelli power plc&source=web&cd=1&ved=0CB0QFjAA&url=http://www.ughellipower.com/&ei=mrvhVJKND4SWuASF04HQBQ&us', 'http://www.ughellipower.com', '103.246.197.13', 1424079841, 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:24.0) Gecko/20100101 Firefox/24.0'),
(11526, 1, 'http://buttons-for-website.com', 'http://www.ughellipower.com', '179.154.56.43', 1424082612, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1985.143 Safa'),
(11527, 1, 'http://xn--80ahdks.net/', 'http://www.ughellipower.com/plants-facilities', '178.137.92.19', 1424088169, 'Mozilla/1.22 (compatible; MSIE 2.0; Windows 95)'),
(11528, 1, 'http://xn--80ahdks.net/', 'http://www.ughellipower.com/plants-facilities', '178.137.92.19', 1424088170, 'Mozilla/1.22 (compatible; MSIE 2.0; Windows 95)'),
(11529, 1, 'http://xn--80ahdks.net/', 'http://www.ughellipower.com/plants-facilities', '178.137.92.19', 1424088171, 'Mozilla/1.22 (compatible; MSIE 2.0; Windows 95)'),
(11530, 1, 'http://www.google.com/search?q=Ughelli Power Launches New Website&hl=en-US', 'http://www.ughellipower.com/press-release', '41.203.67.162', 1424089500, 'Mozilla/5.0 (BB10; Touch) AppleWebKit/537.35+ (KHTML, like Gecko) Version/10.2.1.3247 Mobile Safari/'),
(11531, 1, 'http://www.google.com/search?q=Ughelli Power Launches New Website&hl=en-US', 'http://www.ughellipower.com/press-release', '41.203.67.162', 1424089502, 'Mozilla/5.0 (BB10; Touch) AppleWebKit/537.35+ (KHTML, like Gecko) Version/10.2.1.3247 Mobile Safari/'),
(11532, 1, 'http://www.google.co.uk/url?sa=t&rct=j&q=&esrc=s&frm=1&source=web&cd=1&ved=0CCEQFjAA&url=http://www.ughellipower.com/about&ei=kuLhVNr-DsK4UbuVgtgN&usg', 'http://www.ughellipower.com/about', '164.143.240.34', 1424089773, 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; WOW64; Trident/5.0)'),
(11533, 1, 'https://www.google.com.ng/', 'http://www.ughellipower.com/press-release', '41.190.2.28', 1424092071, 'Mozilla/5.0 (Linux; Android 4.3; GT-I9300 Build/JSS15J) AppleWebKit/537.36 (KHTML, like Gecko) Chrom'),
(11534, 1, 'https://www.google.com.ng/', 'http://www.ughellipower.com/apple-touch-icon-precomposed.png', '41.190.2.28', 1424092077, 'Mozilla/5.0 (Linux; Android 4.3; GT-I9300 Build/JSS15J) AppleWebKit/537.36 (KHTML, like Gecko) Chrom'),
(11535, 1, 'https://www.google.com.ng/', 'http://www.ughellipower.com/apple-touch-icon.png', '41.190.2.28', 1424092079, 'Mozilla/5.0 (Linux; Android 4.3; GT-I9300 Build/JSS15J) AppleWebKit/537.36 (KHTML, like Gecko) Chrom'),
(11536, 1, 'http://transcorpnigeria.com/power/', 'http://www.ughellipower.com', '41.203.67.170', 1424093449, 'Mozilla/5.0 (Linux; Android 4.4.2; TECNO-H3 Build/KOT49H) AppleWebKit/537.36 (KHTML, like Gecko) Ver'),
(11537, 1, 'http://semalt.semalt.com/crawler.php?u=http://ughellipower.com', 'http://www.ughellipower.com', '187.67.233.159', 1424094060, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/32.0.1700.107 Safa'),
(11538, 1, 'http://www.artparquet.ru/', 'http://www.ughellipower.com/plants-facilities', '94.153.66.163', 1424094434, 'Mozilla/4.0 (compatible; MSIE 7.0b; Windows NT 6.0 ; .NET CLR 2.0.50215; SL Commerce Client v1.0; Ta'),
(11539, 1, 'http://www.artparquet.ru/', 'http://www.ughellipower.com/plants-facilities', '94.153.66.163', 1424094435, 'Mozilla/4.0 (compatible; MSIE 7.0b; Windows NT 6.0 ; .NET CLR 2.0.50215; SL Commerce Client v1.0; Ta'),
(11540, 1, 'http://www.artparquet.ru/', 'http://www.ughellipower.com/plants-facilities', '94.153.66.163', 1424094436, 'Mozilla/4.0 (compatible; MSIE 7.0b; Windows NT 6.0 ; .NET CLR 2.0.50215; SL Commerce Client v1.0; Ta'),
(11541, 1, 'https://www.google.com.ng/', 'http://www.ughellipower.com', '196.46.245.162', 1424094674, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.111 Safa'),
(11542, 1, 'https://www.google.co.uk/', 'http://www.ughellipower.com', '194.42.67.37', 1424095672, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.111 Safa'),
(11543, 1, 'https://www.google.co.uk/', 'http://www.ughellipower.com', '217.37.26.161', 1424095900, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.111 Safa'),
(11544, 1, 'http://transcorpnigeria.com/power/', 'http://www.ughellipower.com', '41.66.208.110', 1424096737, 'Mozilla/5.0 (Linux; U; Android 4.2.2; en-us; P5S_X403 Build/JDQ39) AppleWebKit/534.30 (KHTML, like G'),
(11545, 1, 'http://www.google.com/m?q=Transcorp ughelli&client=ms-opera-mini&channel=new', 'http://www.ughellipower.com/press-release', '82.145.222.88', 1424098386, 'Opera/9.80 (J2ME/MIDP; Opera Mini/4.5.33893/35.7382; U; en) Presto/2.8.119 Version/11.10'),
(11546, 1, 'http://pornogig.com/', 'http://www.ughellipower.com/plants-facilities', '178.137.92.19', 1424102492, 'Mozilla/4.0 (compatible; MSIE 4.01; Digital AlphaServer 1000A 4/233; Windows NT; Powered By 64-Bit A'),
(11547, 1, 'http://pornogig.com/', 'http://www.ughellipower.com/plants-facilities', '178.137.92.19', 1424102493, 'Mozilla/4.0 (compatible; MSIE 4.01; Digital AlphaServer 1000A 4/233; Windows NT; Powered By 64-Bit A'),
(11548, 1, 'http://pornogig.com/', 'http://www.ughellipower.com/plants-facilities', '178.137.92.19', 1424102494, 'Mozilla/4.0 (compatible; MSIE 4.01; Digital AlphaServer 1000A 4/233; Windows NT; Powered By 64-Bit A'),
(11549, 1, 'http://www.google.com.ng/url?sa=t&rct=j&q=&esrc=s&source=web&cd=10&cad=rja&uact=8&ved=0CFgQFjAJ&url=http://www.ughellipower.com/about&ei=UBbiVL34Bc7qa', 'http://www.ughellipower.com/about', '196.46.245.117', 1424103126, 'Mozilla/5.0 (Windows NT 6.1; rv:26.0) Gecko/20100101 Firefox/26.0'),
(11550, 1, 'http://doska-vsem.ru/', 'http://www.ughellipower.com/plants-facilities', '109.120.157.179', 1424104187, 'Mozilla/5.0 (compatible; Add Catalog/2.1;)'),
(11551, 1, 'http://doska-vsem.ru/', 'http://www.ughellipower.com/plants-facilities', '109.120.157.179', 1424104188, 'Mozilla/5.0 (compatible; Add Catalog/2.1;)'),
(11552, 1, 'http://doska-vsem.ru/', 'http://www.ughellipower.com/plants-facilities', '109.120.157.179', 1424104189, 'Mozilla/5.0 (compatible; Add Catalog/2.1;)'),
(11553, 1, 'http://www.google.fr/url?sa=t&rct=j&q=&esrc=s&frm=1&source=web&cd=11&ved=0CFIQFjAK&url=http://www.ughellipower.com/&ei=lh_iVO_qMsjNOPe9gPgD&usg=AFQjCN', 'http://www.ughellipower.com', '158.169.150.10', 1424105388, 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; WOW64; Trident/5.0)'),
(11554, 1, 'http://whois.domaintools.com/ughellipower.com', 'http://www.ughellipower.com', '64.246.165.10', 1424112468, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en; rv:1.9.0.13) Gecko/2009073022 Firefox/3.5.2 (.NET CLR 3'),
(11555, 1, 'https://www.google.com.ng/', 'http://www.ughellipower.com', '41.203.69.1', 1424115166, 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.111 Safa'),
(11556, 1, 'http://www.google.com/m/search?client=ms-nokia&channel=proxy&q=delta four power', 'http://www.ughellipower.com/about', '131.228.29.93', 1424115751, 'Mozilla/5.0 (Series40; Nokia205/03.18; Profile/MIDP-2.1 Configuration/CLDC-1.1) Gecko/20100401 S40Ov'),
(11557, 1, 'http://www.google.com/m/search?client=ms-nokia&channel=proxy&q=delta four power', 'http://www.ughellipower.com/about', '131.228.29.29', 1424116152, 'Mozilla/5.0 (Series40; Nokia205/03.18; Profile/MIDP-2.1 Configuration/CLDC-1.1) Gecko/20100401 S40Ov'),
(11558, 1, 'https://www.google.com/', 'http://www.ughellipower.com/about', '154.65.32.48', 1424130461, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.21'),
(11559, 1, 'http://pornogig.com/', 'http://www.ughellipower.com/plants-facilities', '46.119.124.167', 1424137707, 'Mozilla/4.0 (compatible; MSIE 4.01; Digital AlphaServer 1000A 4/233; Windows NT; Powered By 64-Bit A'),
(11560, 1, 'http://pornogig.com/', 'http://www.ughellipower.com/plants-facilities', '46.119.124.167', 1424137708, 'Mozilla/4.0 (compatible; MSIE 4.01; Digital AlphaServer 1000A 4/233; Windows NT; Powered By 64-Bit A'),
(11561, 1, 'http://pornogig.com/', 'http://www.ughellipower.com/plants-facilities', '46.119.124.167', 1424137709, 'Mozilla/4.0 (compatible; MSIE 4.01; Digital AlphaServer 1000A 4/233; Windows NT; Powered By 64-Bit A'),
(11562, 1, 'http://alievy.com.ua/', 'http://www.ughellipower.com/press-release', '82.193.99.33', 1424153650, 'Mozilla/4.0 (compatible- MSIE 6.0- Windows NT 5.1- SV1- .NET CLR 1.1.4322'),
(11563, 1, 'http://alievy.com.ua/', 'http://www.ughellipower.com/press-release', '82.193.99.33', 1424153650, 'Mozilla/4.0 (compatible- MSIE 6.0- Windows NT 5.1- SV1- .NET CLR 1.1.4322'),
(11564, 1, 'http://alievy.com.ua/', 'http://www.ughellipower.com/press-release', '82.193.99.33', 1424153651, 'Mozilla/4.0 (compatible- MSIE 6.0- Windows NT 5.1- SV1- .NET CLR 1.1.4322'),
(11565, 1, 'http://www.google.com/url?q=http://www.ughellipower.com/&sa=U&ei=iuHiVP-QBsLKaOfigNgF&ved=0CBIQFjAA&usg=AFQjCNFA8BqqsRNXrpPeiBgOwo0nTHqSew', 'http://www.ughellipower.com', '41.206.11.184', 1424155095, 'NokiaX2-01/5.0 (08.71) Profile/MIDP-2.1 Configuration/CLDC-1.1 UCWEB/2.0 (Java; U; MIDP-2.0; en-US; '),
(11566, 1, 'http://www.google.com/search?q=transcup+ughelli&hl=en&ie=ISO-8859-1&tbm;=', 'http://www.ughellipower.com', '8.37.228.67', 1424155110, 'NokiaX2-01/5.0 (08.71) Profile/MIDP-2.1 Configuration/CLDC-1.1 UCWEB/2.0 (Java; U; MIDP-2.0; en-US; '),
(11567, 1, 'http://www.google.com/url?q=http://www.ughellipower.com/about&sa=U&ei=1OLiVLvOCsaI7AaNjIGIAg&ved=0CBEQFjAA&usg=AFQjCNF3aIELL3u6D9eIBvwKs4oRN8z41g', 'http://www.ughellipower.com/about', '41.206.11.184', 1424155377, 'NokiaX2-01/5.0 (08.71) Profile/MIDP-2.1 Configuration/CLDC-1.1 UCWEB/2.0 (Java; U; MIDP-2.0; en-US; '),
(11568, 1, 'http://www.google.com/search?hl=en&tbm;=&ie=ISO-8859-1&q=where+is+transcorp+located+in+ughelli', 'http://www.ughellipower.com/about', '8.37.228.67', 1424155381, 'NokiaX2-01/5.0 (08.71) Profile/MIDP-2.1 Configuration/CLDC-1.1 UCWEB/2.0 (Java; U; MIDP-2.0; en-US; '),
(11569, 1, 'http://www.google.com/url?q=http://www.ughellipower.com/about&sa=U&ei=AubiVPGfGefT7Qa7rYGwBQ&ved=0CBIQFjAA&usg=AFQjCNGep5kBzNvADAGsbwG4DrcOcNlKUA', 'http://www.ughellipower.com/about', '41.206.11.184', 1424156417, 'NokiaX2-01/5.0 (08.71) Profile/MIDP-2.1 Configuration/CLDC-1.1 UCWEB/2.0 (Java; U; MIDP-2.0; en-US; '),
(11570, 1, 'http://www.google.com/url?q=http://www.ughellipower.com/about&sa=U&ei=BufiVKmdGsHnas6EgMgE&ved=0CBIQFjAA&usg=AFQjCNFfMnbpCYs6SRkNiMh0x2NXYnjyIg', 'http://www.ughellipower.com/about', '41.206.11.184', 1424156666, 'NokiaX2-01/5.0 (08.71) Profile/MIDP-2.1 Configuration/CLDC-1.1 UCWEB/2.0 (Java; U; MIDP-2.0; en-US; '),
(11571, 1, 'http://www.google.com/search?hl=en&tbm;=&ie=ISO-8859-1&q=Who+handle+letters+in+transcorp+which+is+located+in+ughelli', 'http://www.ughellipower.com/about', '8.37.228.67', 1424156669, 'NokiaX2-01/5.0 (08.71) Profile/MIDP-2.1 Configuration/CLDC-1.1 UCWEB/2.0 (Java; U; MIDP-2.0; en-US; '),
(11572, 1, 'https://www.google.com.ph/', 'http://www.ughellipower.com/about', '112.198.77.44', 1424159000, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.111 Safari/537.'),
(11573, 1, 'http://www.google.be/url?sa=t&rct=j&q=&esrc=s&frm=1&source=web&cd=6&ved=0CC4QFjAF&url=http://www.ughellipower.com/about&ei=8wvjVODkBIWdPIeSgfAP&usg=AF', 'http://www.ughellipower.com/about', '158.169.40.7', 1424165885, 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; WOW64; Trident/5.0)'),
(11574, 1, 'https://www.google.com.ph/', 'http://www.ughellipower.com/about', '112.198.77.205', 1424166317, 'Mozilla/5.0 (Windows NT 6.3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.111 Safari/537.'),
(11575, 1, 'http://ufa-medosmotr.ru/', 'http://www.ughellipower.com/plants-facilities', '46.119.124.167', 1424166703, 'Mozilla/4.79 [en] (Windows NT 5.0; U)'),
(11576, 1, 'http://ufa-medosmotr.ru/', 'http://www.ughellipower.com/plants-facilities', '46.119.124.167', 1424166704, 'Mozilla/4.79 [en] (Windows NT 5.0; U)'),
(11577, 1, 'http://ufa-medosmotr.ru/', 'http://www.ughellipower.com/plants-facilities', '46.119.124.167', 1424166705, 'Mozilla/4.79 [en] (Windows NT 5.0; U)'),
(11578, 1, 'https://www.google.com.ph/', 'http://www.ughellipower.com/plants-facilities', '112.198.77.205', 1424166752, 'Mozilla/5.0 (Windows NT 6.3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.111 Safari/537.'),
(11579, 1, 'http://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=1&ved=0CB8QFjAA&url=http://www.ughellipower.com/&ei=mBDjVJ2uNIGqOo2_gVg&usg=AFQjCNF70jARg', 'http://www.ughellipower.com', '197.255.53.90', 1424167077, 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:35.0) Gecko/20100101 Firefox/35.0'),
(11580, 1, 'http://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=4&ved=0CDEQFjAD&url=http://www.ughellipower.com/about&ei=5xDjVOOpOsGrU7bkgcAH&usg=AFQjCNG', 'http://www.ughellipower.com/about', '41.75.197.138', 1424167202, 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:35.0) Gecko/20100101 Firefox/35.0'),
(11581, 1, 'http://www.google.at/url?sa=t&rct=j&q=&esrc=s&source=web&cd=2&ved=0CCgQFjAB&url=http://www.ughellipower.com/&ei=4xTjVL7RDZL9aNHcgZAL&usg=AFQjCNF70jARg', 'http://www.ughellipower.com', '84.115.148.168', 1424168174, 'Mozilla/5.0 (Windows NT 5.1; rv:35.0) Gecko/20100101 Firefox/35.0'),
(11582, 1, 'http://www.google.com.ng/url?sa=t&rct=j&q=&esrc=s&source=web&cd=3&ved=0CDIQFjAC&url=http://www.ughellipower.com/press-release&ei=4RXjVM7zLcXnUpqAhNgH&', 'http://www.ughellipower.com/press-release', '41.203.69.1', 1424168581, 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0'),
(11583, 1, 'http://otdih-na-more.ru/', 'http://www.ughellipower.com/plants-facilities', '91.207.8.46', 1424171161, 'Mozilla/4.0 (compatible; MSIE 7.0b; Windows NT 6.0 ; .NET CLR 2.0.50215; SL Commerce Client v1.0; Ta'),
(11584, 1, 'http://otdih-na-more.ru/', 'http://www.ughellipower.com/plants-facilities', '91.207.8.46', 1424171162, 'Mozilla/4.0 (compatible; MSIE 7.0b; Windows NT 6.0 ; .NET CLR 2.0.50215; SL Commerce Client v1.0; Ta'),
(11585, 1, 'http://otdih-na-more.ru/', 'http://www.ughellipower.com/plants-facilities', '91.207.8.46', 1424171163, 'Mozilla/4.0 (compatible; MSIE 7.0b; Windows NT 6.0 ; .NET CLR 2.0.50215; SL Commerce Client v1.0; Ta'),
(11586, 1, 'https://www.google.com.ng/', 'http://www.ughellipower.com/about', '41.203.88.58', 1424175596, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.111 Safa'),
(11587, 1, 'https://www.google.com.ng/', 'http://www.ughellipower.com', '41.203.88.58', 1424175839, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.111 Safa'),
(11588, 1, 'http://buttons-for-website.com', 'http://www.ughellipower.com', '179.7.75.45', 1424176052, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1985.143 Safa'),
(11589, 1, 'http://indexgator.com/?pr=286f010c997fbf4e0a9214ab45c2dd6e', 'http://www.ughellipower.com/plants-facilities', '46.119.115.79', 1424178427, 'Mozilla/4.76 [en] (Windows NT 5.0; U)'),
(11590, 1, 'http://indexgator.com/?pr=286f010c997fbf4e0a9214ab45c2dd6e', 'http://www.ughellipower.com/plants-facilities', '167.114.103.51', 1424178428, 'Mozilla/4.76 [en] (Windows NT 5.0; U)'),
(11591, 1, 'http://indexgator.com/?pr=286f010c997fbf4e0a9214ab45c2dd6e', 'http://www.ughellipower.com/plants-facilities', '167.114.103.225', 1424178430, 'Mozilla/4.76 [en] (Windows NT 5.0; U)'),
(11592, 1, 'https://www.google.com.ph/', 'http://www.ughellipower.com', '167.114.103.225', 1424178939, 'Mozilla/5.0 (Windows NT 6.3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.111 Safari/537.'),
(11593, 1, 'https://www.google.com.ph/', 'http://www.ughellipower.com/about', '167.114.103.51', 1424183551, 'Mozilla/5.0 (Windows NT 6.3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.111 Safari/537.'),
(11594, 1, 'http://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=2&ved=0CC0QFjAB&url=http://www.ughellipower.com/&ei=xVjjVLD-J9TbatWEgrAC&usg=AFQjCNF70jAR', 'http://www.ughellipower.com', '167.114.103.51', 1424185555, 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:35.0) Gecko/20100101 Firefox/35.0'),
(11595, 1, 'https://www.google.com.ng/', 'http://www.ughellipower.com/press-release', '167.114.103.225', 1424186131, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.111 Safa'),
(11596, 1, 'http://yt-d.com/', 'http://www.ughellipower.com/plants-facilities', '167.114.103.51', 1424190958, 'Opera/9.00 (Windows NT 4.0; U; en)'),
(11597, 1, 'http://yt-d.com/', 'http://www.ughellipower.com/plants-facilities', '167.114.103.51', 1424190960, 'Opera/9.00 (Windows NT 4.0; U; en)'),
(11598, 1, 'http://www.google.com.ng/url?sa=t&rct=j&q=&esrc=s&frm=1&source=web&cd=1&ved=0CBwQFjAA&url=http://www.ughellipower.com/&ei=aHrjVJCjDNX3ataogfAI&usg=AFQ', 'http://www.ughellipower.com', '167.114.103.225', 1424194162, 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; Trident/5.0)'),
(11599, 1, 'http://pornokajf.com/', 'http://www.ughellipower.com/plants-facilities', '167.114.103.51', 1424207270, 'Opera/7.54 (Windows NT 5.1; U)  [pl]'),
(11600, 1, 'http://pornokajf.com/', 'http://www.ughellipower.com/plants-facilities', '167.114.103.225', 1424207271, 'Opera/7.54 (Windows NT 5.1; U)  [pl]'),
(11601, 1, 'http://pornokajf.com/', 'http://www.ughellipower.com/plants-facilities', '167.114.103.51', 1424207272, 'Opera/7.54 (Windows NT 5.1; U)  [pl]'),
(11602, 1, 'http://www.google.com.ng/url?sa=t&rct=j&q=&esrc=s&source=web&cd=1&ved=0CBwQFjAA&url=http://www.ughellipower.com/&ei=B7rjVN3HHMSvUfPLgSg&usg=AFQjCNF70j', 'http://www.ughellipower.com', '167.114.103.51', 1424210463, 'Mozilla/5.0 (Windows NT 6.1; rv:36.0) Gecko/20100101 Firefox/36.0'),
(11603, 1, 'http://www.search.ask.com/web?q=ughelli+power+station+industrial+training+&apn;_dtid=^BND533+^YY^NL&d=533-135&atb=sysid=533:appid=135:uid=93fbd12c75f4', 'http://www.ughellipower.com/press-release', '167.114.103.51', 1424212184, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.111 Safari/537.'),
(11604, 1, 'http://xn----7sbagdsv7dj8d7d.xn--p1ai/', 'http://www.ughellipower.com/plants-facilities', '167.114.103.225', 1424216671, 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1)'),
(11605, 1, 'http://xn----7sbagdsv7dj8d7d.xn--p1ai/', 'http://www.ughellipower.com/plants-facilities', '167.114.103.51', 1424216672, 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1)'),
(11606, 1, 'http://xn----7sbagdsv7dj8d7d.xn--p1ai/', 'http://www.ughellipower.com/plants-facilities', '167.114.103.225', 1424216673, 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1)'),
(11607, 1, 'http://relaksion.ru/', 'http://www.ughellipower.com/plants-facilities', '167.114.103.51', 1424223500, 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.2; Win64; AMD64)'),
(11608, 1, 'http://baby-babies.ru/', 'http://www.ughellipower.com/plants-facilities', '167.114.103.225', 1424237692, 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1; InfoPath.1'),
(11609, 1, 'http://baby-babies.ru/', 'http://www.ughellipower.com/plants-facilities', '167.114.103.51', 1424237692, 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1; InfoPath.1'),
(11610, 1, 'http://www.google.co.jp/url?url=http://www.ughellipower.com/about&rct=j&frm=1&q=&esrc=s&sa=U&ei=pijkVL_DF4XHmAWyhICICg&ved=0CBQQFjAA&usg=AFQjCNHDWBvef', 'http://www.ughellipower.com/about', '167.114.103.51', 1424238774, 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727; .NET CLR '),
(11611, 1, 'http://morevi.ru/', 'http://www.ughellipower.com/plants-facilities', '167.114.103.225', 1424239348, 'Opera/8.01 (Windows NT 5.1)'),
(11612, 1, 'http://morevi.ru/', 'http://www.ughellipower.com/plants-facilities', '167.114.103.51', 1424239350, 'Opera/8.01 (Windows NT 5.1)'),
(11613, 1, 'https://www.google.co.in/', 'http://www.ughellipower.com', '167.114.103.225', 1424242581, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safar'),
(11614, 1, 'http://www.google.com.ng/url?sa=t&source=web&cd=3&ved=0CCIQFjAC&url=http://ughellipower.com/plants-facilities&rct=j&q=ugehelli power plant&ei=nEvkVJGo', 'http://www.ughellipower.com/plants-facilities', '167.114.103.225', 1424247732, 'Mozilla/5.0 (Linux; U; Android 4.1.2; en-gb; GT-I9105 Build/JZO54K) AppleWebKit/534.30 (KHTML, like '),
(11615, 1, 'http://poisk-zakona.ru/', 'http://www.ughellipower.com/plants-facilities', '167.114.103.51', 1424254711, 'Opera/9.0 (Windows NT 5.1; U; en)'),
(11616, 1, 'http://poisk-zakona.ru/', 'http://www.ughellipower.com/plants-facilities', '167.114.103.51', 1424254713, 'Opera/9.0 (Windows NT 5.1; U; en)'),
(11617, 1, 'http://poisk-zakona.ru/', 'http://www.ughellipower.com/plants-facilities', '167.114.103.225', 1424254714, 'Opera/9.0 (Windows NT 5.1; U; en)'),
(11618, 1, 'http://www.google.co.uk/url?sa=t&rct=j&q=&esrc=s&frm=1&source=web&cd=1&ved=0CCEQFjAA&url=http://www.ughellipower.com/&ei=2GTkVObAItCS7AaM44CgAw&usg=AF', 'http://www.ughellipower.com', '167.114.103.225', 1424254736, 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; Trident/5.0)'),
(11619, 1, 'http://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=3&ved=0CCoQFjAC&url=http://www.ughellipower.com/about&ei=k27kVIv_Jcj6PNT9gPAC&usg=AFQjCNG', 'http://www.ughellipower.com/about', '167.114.103.225', 1424256670, 'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:35.0) Gecko/20100101 Firefox/35.0'),
(11620, 1, 'https://www.google.co.uk/', 'http://www.ughellipower.com', '167.114.103.51', 1424256808, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_7_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.22'),
(11621, 1, 'https://www.google.co.uk/', 'http://www.ughellipower.com/about', '167.114.103.51', 1424257258, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_7_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.22'),
(11622, 1, 'http://www.google.com/m?q=transcorp+nigeria&client=ms-opera-mini-android&channel=new', 'http://www.ughellipower.com/press-release', '167.114.103.51', 1424258088, 'Opera/9.80 (Android; Opera Mini/7.5.33361/35.7382; U; en) Presto/2.8.119 Version/11.10'),
(11623, 1, 'http://www.google.co.uk/url?url=http://www.ughellipower.com/&rct=j&frm=1&q=&esrc=s&sa=U&ei=QnXkVIyiIoG4UqaIgpgI&ved=0CBkQFjAB&usg=AFQjCNEYNbDAWkmPGYGE', 'http://www.ughellipower.com', '167.114.103.51', 1424261280, 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; .NET CLR 1.1.4322; .NET CLR 2.0.5072'),
(11624, 1, 'http://domainsigma.com/whois/ughellipower.com', 'http://www.ughellipower.com', '167.114.103.225', 1424263160, 'Mozilla/5.0 (compatible; DomainSigmaCrawler/0.1; +http://domainsigma.com/robot)'),
(11625, 1, 'http://www.google.gr/url?sa=t&rct=j&q=&esrc=s&source=web&cd=1&ved=0CCEQFjAA&url=http://www.ughellipower.com/press-release&ei=9YfkVNeUFMyBU4Htg9gC&usg=', 'http://www.ughellipower.com/press-release', '167.114.103.51', 1424263163, 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko'),
(11626, 1, 'http://search.mywebsearch.com/mywebsearch/GGmain.jhtml?st=sb&ptb=0FA9D206-F9BB-44AE-9EBB-AAAEB59B79C4&n=77ee887f&ind=2012121215&id=UXxdm007YYng&ptnrS=', 'http://www.ughellipower.com/about', '167.114.103.51', 1424272262, 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:35.0) Gecko/20100101 Firefox/35.0'),
(11627, 1, 'http://search.mywebsearch.com/mywebsearch/GGmain.jhtml?st=sb&ptb=0FA9D206-F9BB-44AE-9EBB-AAAEB59B79C4&n=77ee887f&ind=2012121215&id=UXxdm007YYng&ptnrS=', 'http://www.ughellipower.com', '167.114.103.51', 1424272343, 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:35.0) Gecko/20100101 Firefox/35.0'),
(11628, 1, 'http://www.google.ca/url?sa=t&rct=j&q=&esrc=s&source=web&cd=2&ved=0CCUQFjAB&url=http://www.ughellipower.com/press-release&ei=fLfkVIWqN9ewyAT5gYK4Bw&us', 'http://www.ughellipower.com/press-release', '167.114.103.225', 1424275337, 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:35.0) Gecko/20100101 Firefox/35.0'),
(11629, 1, 'http://www.istmira.com/', 'http://www.ughellipower.com/plants-facilities', '167.114.103.225', 1424282557, 'Mozilla/4.0 (compatible; MSIE 5.0; Windows 2000) Opera 6.0 [en]'),
(11630, 1, 'http://www.istmira.com/', 'http://www.ughellipower.com/plants-facilities', '167.114.103.51', 1424282558, 'Mozilla/4.0 (compatible; MSIE 5.0; Windows 2000) Opera 6.0 [en]'),
(11631, 1, 'http://transcorpnigeria.com/power/', 'http://www.ughellipower.com', '167.114.103.51', 1424283492, 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; Trident/5.0)'),
(11632, 1, 'http://chcu.net/', 'http://www.ughellipower.com/plants-facilities', '167.114.103.225', 1424286774, 'Mozilla/4.0 (compatible; MSIE 5.5; Windows NT 5.0; T312461)'),
(11633, 1, 'http://chcu.net/', 'http://www.ughellipower.com/plants-facilities', '167.114.103.51', 1424286775, 'Mozilla/4.0 (compatible; MSIE 5.5; Windows NT 5.0; T312461)'),
(11634, 1, 'http://chcu.net/', 'http://www.ughellipower.com/plants-facilities', '167.114.103.225', 1424286776, 'Mozilla/4.0 (compatible; MSIE 5.5; Windows NT 5.0; T312461)'),
(11635, 1, 'http://www.google.com/m?q=delta+ughelli+power+station&client=ms-opera-mini&channel=new', 'http://www.ughellipower.com/about', '167.114.103.225', 1424303461, 'Opera/9.80 (BlackBerry; Opera Mini/7.0.31437/35.7382; U; en) Presto/2.8.119 Version/11.10'),
(11636, 1, 'http://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=1&ved=0CCMQFjAA&url=http://www.ughellipower.com/&ei=nCflVNT0BoG1ggS7qoG4Bw&usg=AFQjCNF70j', 'http://www.ughellipower.com', '167.114.103.51', 1424304031, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_5) AppleWebKit/600.3.18 (KHTML, like Gecko) Version/7.1.'),
(11637, 1, 'http://www.ywec.ru/', 'http://www.ughellipower.com/plants-facilities', '167.114.103.225', 1424313010, 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; ru) Opera 8.50'),
(11638, 1, 'http://www.ywec.ru/', 'http://www.ughellipower.com/plants-facilities', '167.114.103.51', 1424313012, 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; ru) Opera 8.50'),
(11639, 1, 'http://www.ywec.ru/', 'http://www.ughellipower.com/plants-facilities', '167.114.103.225', 1424313013, 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; ru) Opera 8.50'),
(11640, 1, 'http://www.google.com/m?q=delta+ughelli+power+station&client=ms-opera-mini&channel=new', 'http://www.ughellipower.com/about', '167.114.103.51', 1424313465, 'Opera/9.80 (BlackBerry; Opera Mini/7.0.31437/35.7382; U; en) Presto/2.8.119 Version/11.10');
INSERT INTO `exp_referrers` (`ref_id`, `site_id`, `ref_from`, `ref_to`, `ref_ip`, `ref_date`, `ref_agent`) VALUES
(11641, 1, 'http://getbot.guru/?pr=0bb7f2d00d979929148f79c3917b9371', 'http://www.ughellipower.com/plants-facilities', '167.114.103.51', 1424324478, 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1; .NET CLR 1.1.4322; .NET CLR 2.0.50727)'),
(11642, 1, 'http://getbot.guru/?pr=0bb7f2d00d979929148f79c3917b9371', 'http://www.ughellipower.com/plants-facilities', '167.114.103.225', 1424324477, 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1; .NET CLR 1.1.4322; .NET CLR 2.0.50727)'),
(11643, 1, 'http://getbot.guru/?pr=0bb7f2d00d979929148f79c3917b9371', 'http://www.ughellipower.com/plants-facilities', '167.114.103.225', 1424324479, 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1; .NET CLR 1.1.4322; .NET CLR 2.0.50727)'),
(11644, 1, 'https://www.google.com.ng/', 'http://www.ughellipower.com/press-release', '167.114.103.225', 1424327869, 'Mozilla/5.0 (Linux; U; Android 4.2.2; en-us; TECNO G9 Build/JDQ39) AppleWebKit/534.30 (KHTML, like G'),
(11645, 1, 'https://www.google.ae/', 'http://www.ughellipower.com/press-release', '167.114.103.225', 1424330004, 'Mozilla/5.0 (Windows NT 6.2; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.111 Safa'),
(11646, 1, 'https://www.google.ae/', 'http://www.ughellipower.com', '167.114.103.225', 1424330031, 'Mozilla/5.0 (Windows NT 6.2; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.111 Safa'),
(11647, 1, 'http://handicapbathtubtoday.com/', 'http://www.ughellipower.com/plants-facilities', '167.114.103.51', 1424332254, 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1; FunWebProducts; MRA 4.6 (build 01425); .NET '),
(11648, 1, 'http://e-hook.ru/', 'http://www.ughellipower.com/plants-facilities', '167.114.103.51', 1424332264, 'Opera/7.54 (Windows NT 5.1; U)  [pl]'),
(11649, 1, 'https://www.google.com.ng/', 'http://www.ughellipower.com/press-release', '167.114.103.51', 1424340229, 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.111 Safari/537.'),
(11650, 1, 'http://smorcycles.com/', 'http://www.ughellipower.com/plants-facilities', '167.114.103.51', 1424349736, 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; .NET CLR 1.1.4322)'),
(11651, 1, 'http://smorcycles.com/', 'http://www.ughellipower.com/plants-facilities', '167.114.103.225', 1424349735, 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; .NET CLR 1.1.4322)'),
(11652, 1, 'http://smorcycles.com/', 'http://www.ughellipower.com/plants-facilities', '167.114.103.225', 1424349737, 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; .NET CLR 1.1.4322)'),
(11653, 1, 'https://www.google.com.ng/', 'http://www.ughellipower.com', '167.114.103.225', 1424352883, 'Mozilla/5.0 (Linux; Android 4.4.2; Infinix X506 Build/KOT49H) AppleWebKit/537.36 (KHTML, like Gecko)'),
(11654, 1, 'http://www.artparquet.ru/', 'http://www.ughellipower.com/plants-facilities', '167.114.103.51', 1424355229, 'Mozilla/5.0 (compatible; Add Catalog/2.1;)'),
(11655, 1, 'http://sexhd.tv/', 'http://www.ughellipower.com/plants-facilities', '167.114.103.51', 1424358611, 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; FREE; .NET CLR 1.1.4322)'),
(11656, 1, 'http://sexhd.tv/', 'http://www.ughellipower.com/plants-facilities', '167.114.103.225', 1424358612, 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; FREE; .NET CLR 1.1.4322)'),
(11657, 1, 'http://sexhd.tv/', 'http://www.ughellipower.com/plants-facilities', '167.114.103.51', 1424358613, 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; FREE; .NET CLR 1.1.4322)'),
(11658, 1, 'http://www.google.com.ng/url?q=http://www.ughellipower.com/&sa=U&ei=nxXmVJriOYL0UNCGhPAF&ved=0CA8QFjAB&sig2=oaf9EVjGx9OlVfMkUE0VKg&usg=AFQjCNFHB7QG5Gc', 'http://www.ughellipower.com', '167.114.103.225', 1424364986, 'Mozilla/5.0 (BB10; Touch) AppleWebKit/537.35+ (KHTML, like Gecko) Version/10.2.1.3247 Mobile Safari/'),
(11659, 1, 'http://www.google.com/m?q=how+is+compressed+natural+gas+used+to+generate+electricity+in+nigeria&client=ms-opera-mini-android&channel=new', 'http://www.ughellipower.com/plants-facilities', '167.114.103.225', 1424369216, 'Opera/9.80 (Android; Opera Mini/7.6.40125/35.7518; U; en) Presto/2.8.119 Version/11.10'),
(11660, 1, 'http://msk.onlinebay.ru/', 'http://www.ughellipower.com/plants-facilities', '167.114.103.225', 1424383472, 'Mozilla/4.0 (compatible- MSIE 6.0- Windows NT 5.1- SV1- .NET CLR 1.1.4322'),
(11661, 1, 'http://msk.onlinebay.ru/', 'http://www.ughellipower.com/plants-facilities', '167.114.103.51', 1424383473, 'Mozilla/4.0 (compatible- MSIE 6.0- Windows NT 5.1- SV1- .NET CLR 1.1.4322'),
(11662, 1, 'http://msk.onlinebay.ru/', 'http://www.ughellipower.com/plants-facilities', '167.114.103.225', 1424383474, 'Mozilla/4.0 (compatible- MSIE 6.0- Windows NT 5.1- SV1- .NET CLR 1.1.4322'),
(11663, 1, 'https://www.google.co.uk/', 'http://www.ughellipower.com/about', '167.114.103.225', 1424384216, 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.115 Safa'),
(11664, 1, 'https://www.google.com.ng/', 'http://www.ughellipower.com/about', '167.114.103.51', 1424387457, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.111 Safa'),
(11665, 1, 'http://motors-china.ru/', 'http://www.ughellipower.com/plants-facilities', '167.114.103.51', 1424392143, 'Mozilla/1.22 (compatible; MSIE 2.0d; Windows NT)'),
(11666, 1, 'http://motors-china.ru/', 'http://www.ughellipower.com/plants-facilities', '167.114.103.225', 1424392144, 'Mozilla/1.22 (compatible; MSIE 2.0d; Windows NT)'),
(11667, 1, 'http://www.rospromtest.ru/', 'http://www.ughellipower.com/plants-facilities', '167.114.103.51', 1424407686, 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1; .NET CLR 1.1.4322; XMPP Tiscali Communicator'),
(11668, 1, 'http://www.rospromtest.ru/', 'http://www.ughellipower.com/plants-facilities', '167.114.103.225', 1424407687, 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1; .NET CLR 1.1.4322; XMPP Tiscali Communicator'),
(11669, 1, 'http://www.rospromtest.ru/', 'http://www.ughellipower.com/plants-facilities', '167.114.103.51', 1424407688, 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1; .NET CLR 1.1.4322; XMPP Tiscali Communicator'),
(11670, 1, 'http://transcorpnigeria.com/power/', 'http://www.ughellipower.com', '167.114.103.51', 1424419534, 'Mozilla/5.0 (Windows NT 5.1; rv:35.0) Gecko/20100101 Firefox/35.0'),
(11671, 1, 'http://www.google.com.ng/url?sa=t&rct=j&q=safety+requirements+in+PHCN&source=web&cd=2&ved=0CB4QFjAB&url=http://www.ughellipower.com/safety-policy&ei=Y', 'http://www.ughellipower.com/safety-policy', '167.114.103.225', 1424425331, 'Mozilla/5.0 (Linux; U; Android 4.2.2; en-gb; SM-T111 Build/JDQ39) AppleWebKit/534.30 (KHTML, like Ge'),
(11672, 1, 'http://www.google.com/search?q=transcorp ughelli power limited&hl=en-GB', 'http://www.ughellipower.com', '167.114.103.51', 1424426082, 'Mozilla/5.0 (BB10; Kbd) AppleWebKit/537.35+ (KHTML, like Gecko) Version/10.2.1.3442 Mobile Safari/53'),
(11673, 1, 'http://pornogig.com/', 'http://www.ughellipower.com/plants-facilities', '167.114.103.51', 1424426867, 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1; FunWebProducts; MRA 4.6 (build 01425); .NET '),
(11674, 1, 'http://www.google.com.ng/url?sa=t&rct=j&q=&esrc=s&frm=1&source=web&cd=1&ved=0CBwQFjAA&url=http://www.ughellipower.com/about&ei=uRLnVK_KMoGtUK7Qg7gM&us', 'http://www.ughellipower.com/about', '167.114.103.225', 1424429763, 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; Trident/5.0)'),
(11675, 1, 'http://transcorpnigeria.com/power/', 'http://www.ughellipower.com', '167.114.103.51', 1424431751, 'Mozilla/5.0 (Linux; Android 4.4.2; en-gb; SAMSUNG SM-G7102 Build/KOT49H) AppleWebKit/537.36 (KHTML, '),
(11676, 1, 'http://transcorpnigeria.com/power/', 'http://www.ughellipower.com', '167.114.103.225', 1424433471, 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:35.0) Gecko/20100101 Firefox/35.0'),
(11677, 1, 'http://spb-velo.ru/', 'http://www.ughellipower.com/plants-facilities', '167.114.103.51', 1424434191, 'Mozilla/4.7 (compatible; OffByOne; Windows 2000) Webster Pro V3.4'),
(11678, 1, 'http://spb-velo.ru/', 'http://www.ughellipower.com/plants-facilities', '167.114.103.225', 1424434192, 'Mozilla/4.7 (compatible; OffByOne; Windows 2000) Webster Pro V3.4'),
(11679, 1, 'http://spb-velo.ru/', 'http://www.ughellipower.com/plants-facilities', '167.114.103.51', 1424434193, 'Mozilla/4.7 (compatible; OffByOne; Windows 2000) Webster Pro V3.4'),
(11680, 1, 'http://www.gostinici-moskvi.ru/', 'http://www.ughellipower.com/plants-facilities', '167.114.103.51', 1424443367, 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.2; Win64; x64; SV1; .NET CLR 2.0.50727)'),
(11681, 1, 'http://www.gostinici-moskvi.ru/', 'http://www.ughellipower.com/plants-facilities', '167.114.103.51', 1424443368, 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.2; Win64; x64; SV1; .NET CLR 2.0.50727)'),
(11682, 1, 'http://www.google.com.ng/url?sa=t&rct=j&q=&esrc=s&source=web&cd=12&sqi=2&ved=0CFMQFjAL&url=http://www.ughellipower.com/about&ei=XmHnVLKgCMjzUqOygtAG&u', 'http://www.ughellipower.com/about', '167.114.103.225', 1424449900, 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:36.0) Gecko/20100101 Firefox/36.0'),
(11683, 1, 'http://www.google.com/url?sa=t&rct=j&q=ughelli power plant&source=web&cd=2&ved=0CB8QFjAB&url=http://www.ughellipower.com/&ei=R2vnVMXvLoSqggSN8IO4Bg&us', 'http://www.ughellipower.com', '167.114.103.225', 1424452438, 'Mozilla/5.0 (iPad; CPU OS 5_0_1 like Mac OS X) AppleWebKit/534.46 (KHTML, like Gecko) Version/5.1 Mo'),
(11684, 1, 'http://www.google.com/url?sa=t&rct=j&q=ughelli power plant&source=web&cd=1&ved=0CB0QFjAA&url=http://www.ughellipower.com/about&ei=R2vnVMXvLoSqggSN8IO4', 'http://www.ughellipower.com/about', '167.114.103.51', 1424452503, 'Mozilla/5.0 (iPad; CPU OS 5_0_1 like Mac OS X) AppleWebKit/534.46 (KHTML, like Gecko) Version/5.1 Mo'),
(11685, 1, 'https://www.google.com/', 'http://www.ughellipower.com/about', '167.114.103.51', 1424453306, 'Mozilla/5.0 (Windows NT 6.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.111 Safari/537.'),
(11686, 1, 'https://www.google.com/', 'http://www.ughellipower.com/about', '167.114.103.225', 1424454602, 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_1_2 like Mac OS X) AppleWebKit/600.1.4 (KHTML, like Gecko) Vers'),
(11687, 1, 'http://www.google.co.uk/url?sa=t&rct=j&q=&esrc=s&frm=1&source=web&cd=1&ved=0CCAQFjAA&url=http://www.ughellipower.com/press-release&ei=wXnnVNPnJs2xafOl', 'http://www.ughellipower.com/press-release', '167.114.103.225', 1424456133, 'Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 6.1; WOW64; Trident/6.0)'),
(11688, 1, 'http://ufa-medosmotr.ru/', 'http://www.ughellipower.com/plants-facilities', '167.114.103.51', 1424457734, 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; MyIE2; Deepnet Explorer)'),
(11689, 1, 'http://ufa-medosmotr.ru/', 'http://www.ughellipower.com/plants-facilities', '167.114.103.51', 1424457736, 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; MyIE2; Deepnet Explorer)'),
(11690, 1, 'http://transcorpnigeria.com/power/', 'http://www.ughellipower.com', '167.114.103.225', 1424462797, 'Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 6.1; WOW64; Trident/6.0)'),
(11691, 1, 'http://ughellipower.com', 'http://www.ughellipower.com', '167.114.103.51', 1424469415, 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)'),
(11692, 1, 'http://blagodat-na-more.ru/', 'http://www.ughellipower.com/plants-facilities', '167.114.103.51', 1424472229, 'Mozilla/3.0 (compatible; WebCapture 2.0; Auto; Windows)'),
(11693, 1, 'http://blagodat-na-more.ru/', 'http://www.ughellipower.com/plants-facilities', '167.114.103.225', 1424472230, 'Mozilla/3.0 (compatible; WebCapture 2.0; Auto; Windows)'),
(11694, 1, 'https://www.google.ie/', 'http://www.ughellipower.com/press-release', '167.114.103.225', 1424474405, 'Mozilla/5.0 (iPad; CPU OS 7_0_4 like Mac OS X) AppleWebKit/537.51.1 (KHTML, like Gecko) Version/7.0 '),
(11695, 1, 'http://vpihnul.ru/', 'http://www.ughellipower.com/plants-facilities', '167.114.103.225', 1424474815, 'Mozilla/4.0 (compatible; MSIE 7.0b; Windows NT 6.0 ; .NET CLR 2.0.50215; SL Commerce Client v1.0; Ta'),
(11696, 1, 'http://vpihnul.ru/', 'http://www.ughellipower.com/plants-facilities', '167.114.103.51', 1424474816, 'Mozilla/4.0 (compatible; MSIE 7.0b; Windows NT 6.0 ; .NET CLR 2.0.50215; SL Commerce Client v1.0; Ta'),
(11697, 1, 'http://vpihnul.ru/', 'http://www.ughellipower.com/plants-facilities', '167.114.103.225', 1424474817, 'Mozilla/4.0 (compatible; MSIE 7.0b; Windows NT 6.0 ; .NET CLR 2.0.50215; SL Commerce Client v1.0; Ta'),
(11698, 1, 'http://2kata.ru/', 'http://www.ughellipower.com/plants-facilities', '167.114.103.51', 1424485435, 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; Crazy Browser 1.0.5)'),
(11699, 1, 'http://2kata.ru/', 'http://www.ughellipower.com/plants-facilities', '167.114.103.225', 1424485436, 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; Crazy Browser 1.0.5)'),
(11700, 1, 'http://2kata.ru/', 'http://www.ughellipower.com/plants-facilities', '167.114.103.51', 1424485437, 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; Crazy Browser 1.0.5)'),
(11701, 1, 'http://www.google.com/url?sa=t&rct=j&q=ughelli power plant&source=web&cd=1&ved=0CB8QFjAA&url=http://www.ughellipower.com/about&ei=1_jnVKKqBsjDggTzq4Tg', 'http://www.ughellipower.com/about', '167.114.103.225', 1424488671, 'Mozilla/5.0 (iPad; CPU OS 5_0_1 like Mac OS X) AppleWebKit/534.46 (KHTML, like Gecko) Version/5.1 Mo'),
(11702, 1, 'http://www.google.com/url?sa=t&rct=j&q=ughelli power plant&source=web&cd=3&ved=0CCMQFjAC&url=http://www.ughellipower.com/press-release&ei=nQLoVMGoFpLj', 'http://www.ughellipower.com/press-release', '167.114.103.225', 1424491286, 'Mozilla/5.0 (iPad; CPU OS 5_0_1 like Mac OS X) AppleWebKit/534.46 (KHTML, like Gecko) Version/5.1 Mo'),
(11703, 1, 'http://camrest.ru/', 'http://www.ughellipower.com/plants-facilities', '167.114.103.51', 1424492869, 'Mozilla/4.0 (compatible; MSIE 6.0; Update a; AOL 6.0; Windows 98)'),
(11704, 1, 'http://camrest.ru/', 'http://www.ughellipower.com/plants-facilities', '167.114.103.51', 1424492870, 'Mozilla/4.0 (compatible; MSIE 6.0; Update a; AOL 6.0; Windows 98)'),
(11705, 1, 'http://pornogig.com/', 'http://www.ughellipower.com/plants-facilities', '167.114.103.225', 1424498027, 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.0)'),
(11706, 1, 'http://pornogig.com/', 'http://www.ughellipower.com/plants-facilities', '167.114.103.51', 1424498028, 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.0)'),
(11707, 1, 'http://pornogig.com/', 'http://www.ughellipower.com/plants-facilities', '167.114.103.225', 1424498029, 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.0)'),
(11708, 1, 'http://electricity.nextierlimited.com/?tag=lecan', 'http://www.ughellipower.com', '167.114.103.225', 1424513358, 'Mozilla/5.0 (SymbianOS/9.3; Series60/3.2 NokiaE5-00/071.003; Profile/MIDP-2.1 Configuration/CLDC-1.1'),
(11709, 1, 'http://spb.onlinebay.ru/', 'http://www.ughellipower.com/plants-facilities', '167.114.103.51', 1424532403, 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; Deepnet Explorer 1.5.0; .NET CLR 1.0.3705)'),
(11710, 1, 'http://spb.onlinebay.ru/', 'http://www.ughellipower.com/plants-facilities', '167.114.103.225', 1424532405, 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; Deepnet Explorer 1.5.0; .NET CLR 1.0.3705)'),
(11711, 1, 'http://spb.onlinebay.ru/', 'http://www.ughellipower.com/plants-facilities', '167.114.103.51', 1424532406, 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; Deepnet Explorer 1.5.0; .NET CLR 1.0.3705)'),
(11712, 1, 'http://tattoo33.ru/', 'http://www.ughellipower.com', '167.114.103.51', 1424535918, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.65 Safari/537.3'),
(11713, 1, 'http://www.google.it/url?sa=t&rct=j&q=&esrc=s&frm=1&source=web&cd=9&ved=0CFsQFjAI&url=http://ughellipower.com/plants-facilities&ei=v8XoVI_eIcWqNrbvgJg', 'http://www.ughellipower.com/plants-facilities', '167.114.103.225', 1424541167, 'Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 6.1; WOW64; Trident/6.0)'),
(11714, 1, 'http://xn--80ahdks.net/', 'http://www.ughellipower.com/plants-facilities', '167.114.103.225', 1424542181, 'Mozilla/5.0 (Windows NT 5.1; U; en) Opera 8.00'),
(11715, 1, 'http://xn--80ahdks.net/', 'http://www.ughellipower.com/plants-facilities', '167.114.103.51', 1424542182, 'Mozilla/5.0 (Windows NT 5.1; U; en) Opera 8.00'),
(11716, 1, 'http://www.google.co.uk/', 'http://www.ughellipower.com', '167.114.103.51', 1424543775, 'Mozilla/5.0 (Linux; Android 4.4.3; HTC Desire 510 Build/KTU84L) AppleWebKit/537.36 (KHTML, like Geck'),
(11717, 1, 'http://kinotrip.ru/', 'http://www.ughellipower.com/plants-facilities', '167.114.103.51', 1424572145, 'Opera/8.01 (Windows NT 5.1)'),
(11718, 1, 'http://kinotrip.ru/', 'http://www.ughellipower.com/plants-facilities', '167.114.103.225', 1424572146, 'Opera/8.01 (Windows NT 5.1)'),
(11719, 1, 'http://kinotrip.ru/', 'http://www.ughellipower.com/plants-facilities', '167.114.103.51', 1424572147, 'Opera/8.01 (Windows NT 5.1)'),
(11720, 1, 'http://spb-velo.ru/', 'http://www.ughellipower.com/plants-facilities', '167.114.103.225', 1424581912, 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1)'),
(11721, 1, 'http://spb-velo.ru/', 'http://www.ughellipower.com/plants-facilities', '167.114.103.51', 1424581913, 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1)'),
(11722, 1, 'http://spb-velo.ru/', 'http://www.ughellipower.com/plants-facilities', '167.114.103.225', 1424581914, 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1)'),
(11723, 1, 'http://www.google.com/search?q=transcorp ughelli power plc&hl=en-GB', 'http://www.ughellipower.com', '167.114.103.225', 1424587965, 'Mozilla/5.0 (BB10; Kbd) AppleWebKit/537.35+ (KHTML, like Gecko) Version/10.2.0.1791 Mobile Safari/53'),
(11724, 1, 'http://doska-vsem.ru/', 'http://www.ughellipower.com/plants-facilities', '167.114.103.51', 1424590324, 'Mozilla/5.0 (compatible; Add Catalog/2.1;)'),
(11725, 1, 'http://doska-vsem.ru/', 'http://www.ughellipower.com/plants-facilities', '167.114.103.51', 1424590325, 'Mozilla/5.0 (compatible; Add Catalog/2.1;)'),
(11726, 1, 'http://nacap.ru/', 'http://www.ughellipower.com/plants-facilities', '167.114.103.51', 1424602147, 'Opera/8.01 (Windows NT 5.1)'),
(11727, 1, 'http://nacap.ru/', 'http://www.ughellipower.com/plants-facilities', '167.114.103.225', 1424602146, 'Opera/8.01 (Windows NT 5.1)'),
(11728, 1, 'http://nacap.ru/', 'http://www.ughellipower.com/plants-facilities', '167.114.103.225', 1424602148, 'Opera/8.01 (Windows NT 5.1)'),
(11729, 1, 'http://nachalka21.ru/', 'http://www.ughellipower.com/plants-facilities', '167.114.103.51', 1424615398, 'Opera/9.0 (Windows NT 5.1; U; en)'),
(11730, 1, 'http://nachalka21.ru/', 'http://www.ughellipower.com/plants-facilities', '167.114.103.225', 1424615400, 'Opera/9.0 (Windows NT 5.1; U; en)'),
(11731, 1, 'http://yandex.ru/yandsearch?text=ughellipower.com&lr=213', 'http://www.ughellipower.com', '167.114.103.51', 1424615787, 'Opera/9.80 (Windows NT 6.1; Win64; x64) Presto/2.12.388 Version/12.16'),
(11732, 1, 'http://www.bing.com/search?q=ughelli+power+plant&qs=SC&pq=ughelli+powerpla&sc=2-16&sp=1&cvid=6725bf650c214005938000e3f35a5776&FORM=QBLH', 'http://www.ughellipower.com', '167.114.103.225', 1424621875, 'Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 6.2; WOW64; Trident/6.0)'),
(11733, 1, 'http://finansovyjgid.ru/', 'http://www.ughellipower.com/plants-facilities', '167.114.103.225', 1424631897, 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.0; .NET CLR 1.0.3705; .NET CLR 1.1.4322)'),
(11734, 1, 'http://finansovyjgid.ru/', 'http://www.ughellipower.com/plants-facilities', '167.114.103.51', 1424631898, 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.0; .NET CLR 1.0.3705; .NET CLR 1.1.4322)'),
(11735, 1, 'http://finansovyjgid.ru/', 'http://www.ughellipower.com/plants-facilities', '167.114.103.225', 1424631899, 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.0; .NET CLR 1.0.3705; .NET CLR 1.1.4322)'),
(11736, 1, 'http://sexhd.tv/', 'http://www.ughellipower.com/plants-facilities', '167.114.103.51', 1424642873, 'Mozilla/4.76 [en] (Windows NT 5.0; U)'),
(11737, 1, 'http://sexhd.tv/', 'http://www.ughellipower.com/plants-facilities', '167.114.103.225', 1424642874, 'Mozilla/4.76 [en] (Windows NT 5.0; U)'),
(11738, 1, 'http://sexhd.tv/', 'http://www.ughellipower.com/plants-facilities', '167.114.103.51', 1424642875, 'Mozilla/4.76 [en] (Windows NT 5.0; U)'),
(11739, 1, 'http://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=1&ved=0CB8QFjAA&url=http://www.ughellipower.com/&ei=6VXqVO3GM4zoaJezgsAO&usg=AFQjCNF70jAR', 'http://www.ughellipower.com', '167.114.103.225', 1424643588, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_5) AppleWebKit/537.78.2 (KHTML, like Gecko) Version/7.0.'),
(11740, 1, 'http://www.search.ask.com/web?l=dis&q=an+overview+o+fnigeria+power+station&o=APN10645A&apn;_dtid=^BND406^YY^NG&shad=s_0048&gct=hp&apn;_ptnrs=^AG6&d=40', 'http://www.ughellipower.com/about', '167.114.103.225', 1424668582, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.115 Safari/537.'),
(11741, 1, 'http://www.google.com/m?q=highest+producing+gas+plant+station+in+nigeria&client=ms-opera-mini&channel=new', 'http://www.ughellipower.com/plants-facilities', '167.114.103.51', 1424678111, 'Opera/9.80 (BlackBerry; Opera Mini/8.0.35659/35.7561; U; en) Presto/2.8.119 Version/11.10'),
(11742, 1, 'http://www.google.com.ng/url?sa=t&rct=j&q=&esrc=s&source=web&cd=1&ved=0CBwQFjAA&url=http://www.ughellipower.com/&ei=29zqVNl2kYto2oSBiA8&usg=AFQjCNF70j', 'http://www.ughellipower.com', '167.114.103.51', 1424678113, 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:35.0) Gecko/20100101 Firefox/35.0'),
(11743, 1, 'http://UGHELLIPOWER.com', 'http://www.ughellipower.com/js/mage/cookies.js', '167.114.103.51', 1424679545, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US) AppleWebKit/533.4 (KHTML, like Gecko) Chrome/5.0.375'),
(11744, 1, 'https://www.google.com.ng/', 'http://www.ughellipower.com/about', '167.114.103.51', 1424679767, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.115 Safa'),
(11745, 1, 'http://www.google.nl/url?sa=t&rct=j&q=&esrc=s&source=web&cd=10&ved=0CFIQFjAJ&url=http://www.ughellipower.com/about&ei=cuzqVID7L4qiPeOWgKgK&usg=AFQjCNG', 'http://www.ughellipower.com/about', '167.114.103.225', 1424682359, 'Mozilla/5.0 (Windows NT 6.1; Trident/7.0; rv:11.0) like Gecko'),
(11746, 1, 'https://www.google.com.ng/', 'http://www.ughellipower.com', '167.114.103.51', 1424684074, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.111 Safa'),
(11747, 1, 'http://tvoystartup.ru/', 'http://www.ughellipower.com/plants-facilities', '167.114.103.225', 1424690245, 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1; MRA 4.6 (build 01425); MRSPUTNIK 1, 5, 0, 19'),
(11748, 1, 'http://tvoystartup.ru/', 'http://www.ughellipower.com/plants-facilities', '167.114.103.51', 1424690246, 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1; MRA 4.6 (build 01425); MRSPUTNIK 1, 5, 0, 19'),
(11749, 1, 'https://www.google.com.ng/', 'http://www.ughellipower.com', '167.114.103.51', 1424690870, 'Mozilla/5.0 (Linux; Android 4.4.2; S6000-T Build/KOT49H) AppleWebKit/537.36 (KHTML, like Gecko) Vers'),
(11750, 1, 'http://www.google.co.uk/url?sa=t&rct=j&q=&esrc=s&frm=1&source=web&cd=1&ved=0CCEQFjAA&url=http://www.ughellipower.com/about&ei=HRPrVMmLEoXvUIHQgJAO&usg', 'http://www.ughellipower.com/about', '167.114.103.51', 1424692038, 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; WOW64; Trident/5.0)'),
(11751, 1, 'http://www.google.de/url?sa=t&rct=j&q=&esrc=s&source=web&cd=2&ved=0CCoQjBAwAQ&url=http://www.ughellipower.com/about&ei=4RXrVP2KBcnxaKn3grAO&usg=AFQjCN', 'http://www.ughellipower.com/about', '167.114.103.225', 1424692733, 'Mozilla/5.0 (Windows NT 6.1; rv:35.0) Gecko/20100101 Firefox/35.0'),
(11752, 1, 'http://search.yahoo.com/search?rewrite=1&p=Ughelli, Delta&.tsrc=mtk&.sep=mtkweatheradr&fr=onesearchnew&tsrc=mtk', 'http://www.ughellipower.com/about', '167.114.103.51', 1424698481, 'Mozilla/5.0 (iPad; U; CPU OS 5_1 like Mac OS X) AppleWebKit/531.21.10 (KHTML, like Gecko) Version/4.'),
(11753, 1, 'http://www.bing.com/search?q=Transcorp+Ughelli+Power+Limited&form=IE10TR&src=IE10TR&pc=CPNTDFJS', 'http://www.ughellipower.com', '167.114.103.51', 1424698826, 'Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 6.2; WOW64; Trident/6.0)'),
(11754, 1, 'https://www.google.com.ng/', 'http://www.ughellipower.com', '167.114.103.225', 1424699926, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.115 Safari/537.'),
(11755, 1, 'https://www.google.com/', 'http://www.ughellipower.com/press-release', '167.114.103.225', 1424705952, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.111 Safa'),
(11756, 1, 'http://www.google.com/search?client=ms-opera_mb_no&channel=bh&hl=en&ie=UTF-8&q=Transcorp+ugheli+contact+address', 'http://www.ughellipower.com', '167.114.103.51', 1424708477, 'Opera/9.80 (J2ME/MIDP; Opera Mini/4.2.22230/35.7598; U; en) Presto/2.8.119 Version/11.10'),
(11757, 1, 'https://www.google.com/', 'http://www.ughellipower.com', '167.114.103.51', 1424708985, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.111 Safa'),
(11758, 1, 'https://www.google.com/', 'http://www.ughellipower.com/press-release', '167.114.103.51', 1424708993, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.111 Safa'),
(11759, 1, 'http://www.google.co.in/', 'http://www.ughellipower.com/about', '167.114.103.225', 1424711064, 'Mozilla/5.0 (Linux; Android 4.4.4; C6902 Build/14.4.A.0.108) AppleWebKit/537.36 (KHTML, like Gecko) '),
(11760, 1, 'https://www.google.com/', 'http://www.ughellipower.com/about', '167.114.103.51', 1424711130, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.115 Safa'),
(11761, 1, 'https://www.google.com.ng/', 'http://www.ughellipower.com', '167.114.103.51', 1424716519, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.115 Safari/537.'),
(11762, 1, 'http://www.istmira.com/', 'http://www.ughellipower.com/plants-facilities', '167.114.103.51', 1424716979, 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1; .NET CLR 1.1.4322)'),
(11763, 1, 'http://www.istmira.com/', 'http://www.ughellipower.com/plants-facilities', '167.114.103.225', 1424716980, 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1; .NET CLR 1.1.4322)'),
(11764, 1, 'http://www.istmira.com/', 'http://www.ughellipower.com/plants-facilities', '167.114.103.51', 1424716981, 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1; .NET CLR 1.1.4322)'),
(11765, 1, 'http://www.google.com/m?q=Emergency+gas+plan+Nigeria&client=ms-opera-mini-android&channel=new', 'http://www.ughellipower.com/plants-facilities', '167.114.103.51', 1424718421, 'Opera/9.80 (Android; Opera Mini/7.6.35843/35.7598; U; en) Presto/2.8.119 Version/11.10'),
(11766, 1, 'http://electricity.nextierlimited.com/?tag=dr-innocent-ezuma', 'http://www.ughellipower.com', '167.114.103.51', 1424718519, 'Mozilla/5.0 (BB10; Touch) AppleWebKit/537.35+ (KHTML, like Gecko) Version/10.2.1.2141 Mobile Safari/'),
(11767, 1, 'https://www.google.com/', 'http://www.ughellipower.com', '167.114.103.225', 1424721094, 'Mozilla/5.0 (Linux; Android 4.4.2; en-gb; SAMSUNG SM-N900 Build/KOT49H) AppleWebKit/537.36 (KHTML, l'),
(11768, 1, 'http://search.mywebsearch.com/mywebsearch/GGmain.jhtml?st=kwd&ptb=6870D6B8-39BC-4719-8883-62F24CB3BBC5&n=77ee64e5&ind=2012112101&id=ZXxdm071YYng&ptnrS', 'http://www.ughellipower.com', '167.114.103.225', 1424727364, 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:15.0) Gecko/20100101 Firefox/15.0.1'),
(11769, 1, 'http://bumper-stickers.ru/', 'http://www.ughellipower.com/plants-facilities', '167.114.103.225', 1424731927, 'Mozilla/4.0 (compatible; MSIE 5.01; Windows 95; MSIECrawler)'),
(11770, 1, 'http://bumper-stickers.ru/', 'http://www.ughellipower.com/plants-facilities', '167.114.103.51', 1424731928, 'Mozilla/4.0 (compatible; MSIE 5.01; Windows 95; MSIECrawler)'),
(11771, 1, 'http://bumper-stickers.ru/', 'http://www.ughellipower.com/plants-facilities', '167.114.103.225', 1424731929, 'Mozilla/4.0 (compatible; MSIE 5.01; Windows 95; MSIECrawler)'),
(11772, 1, 'http://www.google.com/m/search?client=ms-nokia&channel=proxy&q=transcorp ughelli power station', 'http://www.ughellipower.com/about', '167.114.103.225', 1424732201, 'Mozilla/5.0 (Series40; Nokia210/06.09; Profile/MIDP-2.1 Configuration/CLDC-1.1) Gecko/20100401 S40Ov'),
(11773, 1, 'http://multiki-online24.ru/', 'http://www.ughellipower.com/plants-facilities', '167.114.103.51', 1424733730, 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; TheFreeDictionary.com; .NET CLR 1.1.4322; .NET CL'),
(11774, 1, 'http://multiki-online24.ru/', 'http://www.ughellipower.com/plants-facilities', '167.114.103.51', 1424733732, 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; TheFreeDictionary.com; .NET CLR 1.1.4322; .NET CL'),
(11775, 1, 'http://dostoprim.com/', 'http://www.ughellipower.com/plants-facilities', '167.114.103.225', 1424744568, 'Mozilla/0.6 Beta (Windows)'),
(11776, 1, 'http://dostoprim.com/', 'http://www.ughellipower.com/plants-facilities', '167.114.103.51', 1424744569, 'Mozilla/0.6 Beta (Windows)'),
(11777, 1, 'http://dostoprim.com/', 'http://www.ughellipower.com/plants-facilities', '167.114.103.225', 1424744570, 'Mozilla/0.6 Beta (Windows)'),
(11778, 1, 'http://ughellipower.com', 'http://www.ughellipower.com', '167.114.103.225', 1424751258, 'Mozilla/5.0 (Windows NT 5.1; rv:34.0) Gecko/20100101 Firefox/34.0'),
(11779, 1, 'http://transcorpnigeria.com/power/', 'http://www.ughellipower.com', '167.114.103.51', 1424754713, 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:35.0) Gecko/20100101 Firefox/35.0'),
(11780, 1, 'http://moomi-daeri.com/', 'http://www.ughellipower.com/plants-facilities', '167.114.103.51', 1424756172, 'Mozilla/4.0 (compatible; MSIE 5.5; Windows NT 5.0; T312461)'),
(11781, 1, 'http://moomi-daeri.com/', 'http://www.ughellipower.com/plants-facilities', '167.114.103.51', 1424756174, 'Mozilla/4.0 (compatible; MSIE 5.5; Windows NT 5.0; T312461)'),
(11782, 1, 'http://blagodat-na-more.ru/', 'http://www.ughellipower.com/plants-facilities', '167.114.103.225', 1424765551, 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1; .NET CLR 1.1.4322; .NET CLR 2.0.50727)'),
(11783, 1, 'http://blagodat-na-more.ru/', 'http://www.ughellipower.com/plants-facilities', '167.114.103.51', 1424765552, 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1; .NET CLR 1.1.4322; .NET CLR 2.0.50727)'),
(11784, 1, 'http://blagodat-na-more.ru/', 'http://www.ughellipower.com/plants-facilities', '167.114.103.225', 1424765553, 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1; .NET CLR 1.1.4322; .NET CLR 2.0.50727)'),
(11785, 1, 'https://www.google.com.ng/', 'http://www.ughellipower.com', '167.114.103.225', 1424768727, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.115 Safa'),
(11786, 1, 'https://www.google.com.ng/', 'http://www.ughellipower.com', '167.114.103.225', 1424768728, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.115 Safa'),
(11787, 1, 'https://www.google.com.ng/', 'http://www.ughellipower.com/press-release', '167.114.103.225', 1424768906, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.115 Safa'),
(11788, 1, 'http://transcorpnigeria.com/power/', 'http://www.ughellipower.com', '167.114.103.225', 1424768936, 'Mozilla/5.0 (iPad; CPU OS 7_1_2 like Mac OS X) AppleWebKit/537.51.2 (KHTML, like Gecko) Version/7.0 '),
(11789, 1, 'https://www.google.com.ng/', 'http://www.ughellipower.com/about', '167.114.103.51', 1424771675, 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2305.3 S'),
(11790, 1, 'https://www.google.com/', 'http://www.ughellipower.com', '167.114.103.51', 1424772781, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.115 Safa'),
(11791, 1, 'http://www.google.at/url?sa=t&rct=j&q=&esrc=s&source=web&cd=1&ved=0CCAQFjAA&url=http://www.ughellipower.com/press-release&ei=t1LsVN3sCM7batWygOAD&usg=', 'http://www.ughellipower.com/press-release', '167.114.103.51', 1424773825, 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:35.0) Gecko/20100101 Firefox/35.0'),
(11792, 1, 'https://www.google.com.ng/', 'http://www.ughellipower.com/press-release', '167.114.103.225', 1424779273, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.115 Safari/537.'),
(11793, 1, 'http://www.google.com/m?q=ughelli+power+station&client=ms-opera-mini-android&channel=new', 'http://www.ughellipower.com', '167.114.103.51', 1424780119, 'Opera/9.80 (Android; Opera Mini/7.5.33361/35.7598; U; en) Presto/2.8.119 Version/11.10'),
(11794, 1, 'http://sexhd.tv/', 'http://www.ughellipower.com/plants-facilities', '167.114.103.225', 1424786053, 'Mozilla/4.0 (compatible; MSIE 5.5; Windows 98)'),
(11795, 1, 'https://www.google.co.uk/', 'http://www.ughellipower.com/about', '167.114.103.51', 1424786689, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.115 Safa'),
(11796, 1, 'https://www.google.co.uk/', 'http://www.ughellipower.com/press-release', '167.114.103.51', 1424786690, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.115 Safa'),
(11797, 1, 'https://www.google.co.uk/', 'http://www.ughellipower.com', '167.114.103.51', 1424787222, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.115 Safa'),
(11798, 1, 'http://pml.dp.ua/', 'http://www.ughellipower.com/plants-facilities', '167.114.103.51', 1424791576, 'Mozilla/4.0 (compatible; MSIE 5.0; Windows NT; DigExt)'),
(11799, 1, 'http://pml.dp.ua/', 'http://www.ughellipower.com/plants-facilities', '167.114.103.225', 1424791577, 'Mozilla/4.0 (compatible; MSIE 5.0; Windows NT; DigExt)'),
(11800, 1, 'https://www.google.com.ng/', 'http://www.ughellipower.com', '167.114.103.225', 1424796909, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.115 Safari/537.'),
(11801, 1, 'http://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=1&ved=0CCAQFjAA&url=http://www.ughellipower.com/about&ei=RO_sVLK0CoXxapuKgvAP&usg=AFQjCNG', 'http://www.ughellipower.com/about', '167.114.103.51', 1424813906, 'Mozilla/5.0 (Windows NT 6.1; rv:35.0) Gecko/20100101 Firefox/35.0'),
(11802, 1, 'http://doska-vsem.ru/', 'http://www.ughellipower.com/plants-facilities', '167.114.103.225', 1424829986, 'Mozilla/5.0 (compatible; Add Catalog/2.1;)'),
(11803, 1, 'http://doska-vsem.ru/', 'http://www.ughellipower.com/plants-facilities', '167.114.103.225', 1424829987, 'Mozilla/5.0 (compatible; Add Catalog/2.1;)'),
(11804, 1, 'https://www.google.co.in/', 'http://www.ughellipower.com/about', '167.114.103.225', 1424843171, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.115 Safa'),
(11805, 1, 'http://motors-china.ru/', 'http://www.ughellipower.com/plants-facilities', '167.114.103.51', 1424844132, 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; en) Opera 8.00'),
(11806, 1, 'http://motors-china.ru/', 'http://www.ughellipower.com/plants-facilities', '167.114.103.225', 1424844133, 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; en) Opera 8.00'),
(11807, 1, 'http://www.google.co.jp/url?url=http://www.ughellipower.com/press-release&rct=j&frm=1&q=&esrc=s&sa=U&ei=P2rtVI_0AeXRmAW8x4HoDw&ved=0CBQQFjAA&usg=AFQjC', 'http://www.ughellipower.com/press-release', '167.114.103.51', 1424845425, 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727; .NET CLR '),
(11808, 1, 'https://www.google.com/', 'http://www.ughellipower.com', '167.114.103.225', 1424845931, 'Mozilla/5.0 (Linux; Android 4.4.2; en-gb; SAMSUNG GT-I9500 Build/KOT49H) AppleWebKit/537.36 (KHTML, '),
(11809, 1, 'http://transcorpnigeria.com/power/', 'http://www.ughellipower.com', '167.114.103.51', 1424846338, 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Win64; x64; Trident/4.0; .NET CLR 2.0.50727; SLCC'),
(11810, 1, 'http://search.tb.ask.com/search/GGmain.jhtml?searchfor=second+quarter+financial+report+of+transitional+corporation+of+nigeria+plc+for+the+year+2014&ts', 'http://www.ughellipower.com/press-release', '167.114.103.225', 1424856452, 'Mozilla/5.0 (Windows NT 6.1; rv:36.0) Gecko/20100101 Firefox/36.0'),
(11811, 1, 'http://kinotrip.ru/', 'http://www.ughellipower.com/plants-facilities', '167.114.103.225', 1424867284, 'Mozilla/6.0 (compatible; MSIE 7.0a1; Windows NT 5.2; SV1)'),
(11812, 1, 'http://kinotrip.ru/', 'http://www.ughellipower.com/plants-facilities', '167.114.103.51', 1424867285, 'Mozilla/6.0 (compatible; MSIE 7.0a1; Windows NT 5.2; SV1)'),
(11813, 1, 'http://kinotrip.ru/', 'http://www.ughellipower.com/plants-facilities', '167.114.103.225', 1424867286, 'Mozilla/6.0 (compatible; MSIE 7.0a1; Windows NT 5.2; SV1)'),
(11814, 1, 'https://www.google.co.in/', 'http://www.ughellipower.com/press-release', '167.114.103.225', 1424867525, 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.115 Safari/537.'),
(11815, 1, 'https://www.google.co.uk/', 'http://www.ughellipower.com/about', '167.114.103.51', 1424869114, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.115 Safari/537.'),
(11816, 1, 'http://transcorpnigeria.com/power/', 'http://www.ughellipower.com', '167.114.103.225', 1424875961, 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; Trident/5.0)'),
(11817, 1, 'http://www.google.com.ng/search?q=transcorp+ughelli+power+limited&oq=transcorp+ughe&gs_l=mobile-heirloom-serp.1.0.0l2.830.5822.0.7788.13.10.0.3.3.1.50', 'http://www.ughellipower.com', '167.114.103.225', 1424877005, 'Mozilla/5.0 (BB10; Kbd) AppleWebKit/537.35+ (KHTML, like Gecko) Version/10.2.1.2141 Mobile Safari/53'),
(11818, 1, 'http://www.google.com.ng/url?url=http://www.ughellipower.com/about&rct=j&frm=1&q=&esrc=s&sa=U&ei=i-XtVOSNFIrX7QaF0IDAAQ&ved=0CCwQFjAC&usg=AFQjCNFxYPyc', 'http://www.ughellipower.com/about', '167.114.103.51', 1424877042, 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727; .NET CLR '),
(11819, 1, 'https://www.google.de/', 'http://www.ughellipower.com/plants-facilities', '167.114.103.51', 1424878225, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.115 Safa'),
(11820, 1, 'http://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=10&ved=0CE0QFjAJ&url=http://www.ughellipower.com/about&ei=LfHtVIqiGIL6UqmegNAF&usg=AFQjCN', 'http://www.ughellipower.com/about', '167.114.103.225', 1424880176, 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:35.0) Gecko/20100101 Firefox/35.0'),
(11821, 1, 'http://msk.onlinebay.ru/', 'http://www.ughellipower.com/plants-facilities', '167.114.103.225', 1424887626, 'Mozilla/4.0 (compatible- MSIE 6.0- Windows NT 5.1- SV1- .NET CLR 1.1.4322'),
(11822, 1, 'http://www.knowed.ru/', 'http://www.ughellipower.com/plants-facilities', '167.114.103.51', 1424887626, 'Mozilla/4.0 (compatible- MSIE 6.0- Windows NT 5.1- SV1- .NET CLR 1.1.4322'),
(11823, 1, 'http://msk.onlinebay.ru/', 'http://www.ughellipower.com/plants-facilities', '167.114.103.225', 1424887627, 'Mozilla/4.0 (compatible- MSIE 6.0- Windows NT 5.1- SV1- .NET CLR 1.1.4322'),
(11824, 1, 'http://search.tb.ask.com/search/GGmain.jhtml?searchfor=ughelli&p2;=^BBQ^xdm027^S11595^ng&n=780d0f51&ss=sub&st=hp&ptb=1A2F27A3-3EAE-46FF-954E-6EA030B7B', 'http://www.ughellipower.com', '167.114.103.225', 1424894923, 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:35.0) Gecko/20100101 Firefox/35.0'),
(11825, 1, 'https://www.google.com/', 'http://www.ughellipower.com/about', '167.114.103.51', 1424901382, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.115 Safari/537.'),
(11826, 1, 'https://www.google.com/', 'http://www.ughellipower.com/press-release', '167.114.103.51', 1424901417, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.115 Safari/537.'),
(11827, 1, 'http://www.google.com/url?q=http://www.ughellipower.com/about&sa=U&ei=I0TuVIiDLcz3UtyRg9AH&ved=0CA0QFjAA&sig2=7UH-Qdf115FR1BCMFLs3aA&usg=AFQjCNFpEmwYi', 'http://www.ughellipower.com/about', '167.114.103.51', 1424901428, 'Mozilla/5.0 (BB10; Touch) AppleWebKit/537.35+ (KHTML, like Gecko) Version/10.3.1.1154 Mobile Safari/'),
(11828, 1, 'http://sporg.ru/', 'http://www.ughellipower.com/plants-facilities', '167.114.103.225', 1424903274, 'Mozilla/6.0 (compatible; MSIE 7.0a1; Windows NT 5.2; SV1)'),
(11829, 1, 'http://www.google.com.ng/url?sa=t&rct=j&q=&esrc=s&source=web&cd=5&ved=0CDEQFjAE&url=http://ughellipower.com/plants-facilities&ei=lm_uVJnaMY_vaM21gvgC&', 'http://www.ughellipower.com/plants-facilities', '167.114.103.51', 1424912307, 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:35.0) Gecko/20100101 Firefox/35.0'),
(11830, 1, 'http://100news.biz/', 'http://www.ughellipower.com/plants-facilities', '167.114.103.225', 1424919017, 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1; Media Center PC'),
(11831, 1, 'http://100news.biz/', 'http://www.ughellipower.com/plants-facilities', '167.114.103.51', 1424919018, 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1; Media Center PC'),
(11832, 1, 'http://100news.biz/', 'http://www.ughellipower.com/plants-facilities', '167.114.103.225', 1424919019, 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1; Media Center PC'),
(11833, 1, 'https://www.google.co.in/', 'http://www.ughellipower.com', '167.114.103.51', 1424921591, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.115 Safari/537.'),
(11834, 1, 'http://krasivoe-kino.com/', 'http://www.ughellipower.com/plants-facilities', '167.114.103.51', 1424935111, 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; Deepnet Explorer 1.5.0; .NET CLR 1.0.3705)'),
(11835, 1, 'http://krasivoe-kino.com/', 'http://www.ughellipower.com/plants-facilities', '167.114.103.225', 1424935112, 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; Deepnet Explorer 1.5.0; .NET CLR 1.0.3705)'),
(11836, 1, 'http://krasivoe-kino.com/', 'http://www.ughellipower.com/plants-facilities', '167.114.103.51', 1424935113, 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; Deepnet Explorer 1.5.0; .NET CLR 1.0.3705)'),
(11837, 1, 'http://www.google.com/url?q=http://www.ughellipower.com/press-release&sa=U&ei=t83uVP7JK-mu7AaJyoHQBQ&ved=0CBgQFjAB&usg=AFQjCNGePXLaTxR5KZHI6KbUatPAu1-', 'http://www.ughellipower.com/press-release', '167.114.103.225', 1424936406, 'Nokia200/2.0 (11.95) Profile/MIDP-2.1 Configuration/CLDC-1.1 UCWEB/2.0(Java; U; MIDP-2.0; en-us; nok'),
(11838, 1, 'http://www.google.com/search?hl=en&q=owner of transcorp&spell=1&sa=X', 'http://www.ughellipower.com/press-release', '167.114.103.51', 1424936409, 'Nokia200/2.0 (11.95) Profile/MIDP-2.1 Configuration/CLDC-1.1 UCWEB/2.0(Java; U; MIDP-2.0; en-us; nok'),
(11839, 1, 'http://ughellipower.com', 'http://www.ughellipower.com/about', '167.114.103.51', 1424937896, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.9.2.8) Gecko/20100721 Firefox/3.6.8'),
(11840, 1, 'http://ughellipower.com', 'http://www.ughellipower.com/contact', '167.114.103.225', 1424937903, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.9.2.8) Gecko/20100721 Firefox/3.6.8'),
(11841, 1, 'http://ughellipower.com', 'http://www.ughellipower.com/press-release', '167.114.103.225', 1424937918, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.9.2.8) Gecko/20100721 Firefox/3.6.8'),
(11842, 1, 'http://ughellipower.com', 'http://www.ughellipower.com/plants-facilities', '167.114.103.51', 1424937926, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.9.2.8) Gecko/20100721 Firefox/3.6.8'),
(11843, 1, 'http://handicapbathtubtoday.com/', 'http://www.ughellipower.com/plants-facilities', '167.114.103.225', 1424940661, 'Mozilla/5.0 (Windows NT 5.1; U; en) Opera 8.01'),
(11844, 1, 'http://jointpoint.org/', 'http://www.ughellipower.com/plants-facilities', '167.114.103.51', 1424940662, 'Mozilla/5.0 (Windows NT 5.1; U; en) Opera 8.01'),
(11845, 1, 'http://ughellipower.com', 'http://www.ughellipower.com/about', '167.114.103.225', 1424941568, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.9.2.8) Gecko/20100721 Firefox/3.6.8'),
(11846, 1, 'http://ughellipower.com', 'http://www.ughellipower.com/contact', '167.114.103.51', 1424941575, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.9.2.8) Gecko/20100721 Firefox/3.6.8'),
(11847, 1, 'http://ughellipower.com', 'http://www.ughellipower.com/press-release', '167.114.103.51', 1424941592, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.9.2.8) Gecko/20100721 Firefox/3.6.8'),
(11848, 1, 'https://www.google.co.uk/', 'http://www.ughellipower.com', '167.114.103.51', 1424947913, 'Mozilla/5.0 (Windows NT 5.2; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/31.0.1650.63 Safar'),
(11849, 1, 'http://www.google.com/m?q=transcorp+ughelli+power+limited&client=ms-opera-mini-android&channel=new', 'http://www.ughellipower.com', '167.114.103.225', 1424958039, 'Opera/9.80 (Android; Opera Mini/7.5.33361/35.7598; U; en) Presto/2.8.119 Version/11.10'),
(11850, 1, 'http://www.heirsholdings.com/company/what-we-do/', 'http://www.ughellipower.com', '167.114.103.51', 1424962153, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.115 Safa'),
(11851, 1, 'https://www.google.com.ng/', 'http://www.ughellipower.com/about', '167.114.103.51', 1424963063, 'Mozilla/5.0 (Linux; Android 4.4.2; Infinix X506 Build/KOT49H) AppleWebKit/537.36 (KHTML, like Gecko)'),
(11852, 1, 'http://www.google.de/url?sa=t&rct=j&q=&esrc=s&frm=1&source=web&cd=6&cad=rja&uact=8&ved=0CDUQFjAF&url=http://www.ughellipower.com/about&ei=AUTvVLCtNIXe', 'http://www.ughellipower.com/about', '167.114.103.225', 1424966664, 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; WOW64; Trident/5.0)'),
(11853, 1, 'http://www.google.com.ng/search?q=TRANSCORP+POWER+PLANT&btnG=Search', 'http://www.ughellipower.com/about', '167.114.103.51', 1424976026, 'Opera/9.80 (MAUI Runtime; Opera Mini/4.4.33576/35.7598; U; en) Presto/2.8.119 Version/11.10'),
(11854, 1, 'http://xn--80ahdks.net/', 'http://www.ughellipower.com/plants-facilities', '167.114.103.225', 1425002364, 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; Maxthon; .NET CLR 1.1.4322)'),
(11855, 1, 'http://xn--80ahdks.net/', 'http://www.ughellipower.com/plants-facilities', '167.114.103.51', 1425002365, 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; Maxthon; .NET CLR 1.1.4322)'),
(11856, 1, 'http://xn--80ahdks.net/', 'http://www.ughellipower.com/plants-facilities', '167.114.103.225', 1425002366, 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; Maxthon; .NET CLR 1.1.4322)'),
(11857, 1, 'http://www.heirsholdings.com/company/what-we-do/', 'http://www.ughellipower.com', '167.114.103.225', 1425008095, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.115 Safa'),
(11858, 1, 'http://navro.org/', 'http://www.ughellipower.com/plants-facilities', '167.114.103.51', 1425018317, 'Opera/7.60 (Windows NT 5.2; U)  [en] (IBM EVV/3.0/EAK01AG9/LE)'),
(11859, 1, 'http://navro.org/', 'http://www.ughellipower.com/plants-facilities', '167.114.103.225', 1425018318, 'Opera/7.60 (Windows NT 5.2; U)  [en] (IBM EVV/3.0/EAK01AG9/LE)'),
(11860, 1, 'http://navro.org/', 'http://www.ughellipower.com/plants-facilities', '167.114.103.51', 1425018319, 'Opera/7.60 (Windows NT 5.2; U)  [en] (IBM EVV/3.0/EAK01AG9/LE)'),
(11861, 1, 'http://www.google.com/search?client=ms-rim&hl=en&q=transcorp ughelli power plc news&ie=UTF-8&oe=UTF-8&channel=browser', 'http://www.ughellipower.com', '167.114.103.225', 1425020269, 'Mozilla/5.0 (BlackBerry; U; BlackBerry 9900; en) AppleWebKit/534.11+ (KHTML, like Gecko) Version/7.1'),
(11862, 1, 'https://www.google.com.ng/', 'http://www.ughellipower.com/about', '167.114.103.225', 1425023145, 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.115 Safari/537.'),
(11863, 1, 'https://www.google.com.ng/', 'http://www.ughellipower.com', '167.114.103.225', 1425023147, 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.115 Safari/537.'),
(11864, 1, 'https://www.google.com.ng/', 'http://www.ughellipower.com', '167.114.103.51', 1425028415, 'Mozilla/5.0 (iPhone; CPU iPhone OS 7_1_2 like Mac OS X) AppleWebKit/537.51.2 (KHTML, like Gecko) Ver'),
(11865, 1, 'https://www.google.com.ng/', 'http://www.ughellipower.com/about', '167.114.103.225', 1425028452, 'Mozilla/5.0 (iPhone; CPU iPhone OS 7_1_2 like Mac OS X) AppleWebKit/537.51.2 (KHTML, like Gecko) Ver'),
(11866, 1, 'https://www.google.com.ng/', 'http://www.ughellipower.com/press-release', '167.114.103.225', 1425028567, 'Mozilla/5.0 (iPhone; CPU iPhone OS 7_1_2 like Mac OS X) AppleWebKit/537.51.2 (KHTML, like Gecko) Ver'),
(11867, 1, 'http://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=1&ved=0CB4QFjAA&url=http://www.ughellipower.com/about&ei=KEHwVKT5JdX3av-tgsgL&usg=AFQjCNG', 'http://www.ughellipower.com/about', '167.114.103.225', 1425031534, 'Mozilla/5.0 (Windows NT 5.1; rv:35.0) Gecko/20100101 Firefox/35.0'),
(11868, 1, 'http://www.astrale.ru/', 'http://www.ughellipower.com/plants-facilities', '167.114.103.51', 1425033805, 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1; FunWebProducts; MRA 4.6 (build 01425); .NET '),
(11869, 1, 'http://www.astrale.ru/', 'http://www.ughellipower.com/plants-facilities', '167.114.103.225', 1425033806, 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1; FunWebProducts; MRA 4.6 (build 01425); .NET '),
(11870, 1, 'http://www.google.com.ng/url?sa=t&rct=j&q=&esrc=s&source=web&cd=13&sqi=2&ved=0CFEQFjAM&url=http://www.ughellipower.com/about&ei=DxrwVM6cJNLbauvtgJAC&u', 'http://www.ughellipower.com/about', '167.114.103.51', 1425036428, 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:35.0) Gecko/20100101 Firefox/35.0');
INSERT INTO `exp_referrers` (`ref_id`, `site_id`, `ref_from`, `ref_to`, `ref_ip`, `ref_date`, `ref_agent`) VALUES
(11871, 1, 'http://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=2&cad=rja&uact=8&ved=0CCwQFjAB&url=http://www.ughellipower.com/&ei=7VrwVPD_MKrHsQSY7YLgBQ', 'http://www.ughellipower.com', '167.114.103.51', 1425038074, 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:35.0) Gecko/20100101 Firefox/35.0'),
(11872, 1, 'http://www.google.com.ng/search?ie=ISO-8859-1&q=2014+nine+months+transcorp+profit+in+Nigeria&btnG=Search', 'http://www.ughellipower.com/press-release', '167.114.103.51', 1425040553, 'UCWEB/2.0 (Java; U; MIDP-2.0; Nokia203/20.37) U2/1.0.0 UCBrowser/8.7.0.218 U2/1.0.0 Mobile'),
(11873, 1, 'http://www.google.at/url?sa=t&rct=j&q=&esrc=s&source=web&cd=2&sqi=2&ved=0CCgQFjAB&url=http://www.ughellipower.com/&ei=Wm_wVNH1HOeE7gaNo4CYBA&usg=AFQjC', 'http://www.ughellipower.com', '167.114.103.225', 1425043295, 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; tb-gmx/2.6.0; rv:11.0) like Gecko'),
(11874, 1, 'http://yt-d.com/', 'http://www.ughellipower.com/plants-facilities', '167.114.103.51', 1425047152, 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; Q312461)'),
(11875, 1, 'http://yt-d.com/', 'http://www.ughellipower.com/plants-facilities', '167.114.103.225', 1425047153, 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; Q312461)'),
(11876, 1, 'http://yt-d.com/', 'http://www.ughellipower.com/plants-facilities', '167.114.103.51', 1425047155, 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; Q312461)'),
(11877, 1, 'https://www.google.co.uk/', 'http://www.ughellipower.com', '167.114.103.225', 1425057678, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.115 Safa'),
(11878, 1, 'http://blagodat-na-more.ru/', 'http://www.ughellipower.com/plants-facilities', '167.114.103.225', 1425063259, 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1; .NET CLR 1.1.4322) NS8/0.9.6'),
(11879, 1, 'http://blagodat-na-more.ru/', 'http://www.ughellipower.com/plants-facilities', '167.114.103.225', 1425063261, 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1; .NET CLR 1.1.4322) NS8/0.9.6'),
(11880, 1, 'http://blagodat-na-more.ru/', 'http://www.ughellipower.com/plants-facilities', '167.114.103.51', 1425063262, 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1; .NET CLR 1.1.4322) NS8/0.9.6'),
(11881, 1, 'http://www.google.com/m?q=transcorp+ughelli&client=ms-opera-mini-android&channel=new', 'http://www.ughellipower.com', '167.114.103.225', 1425073031, 'Opera/9.80 (Android; Opera Mini/7.5.33361/35.7598; U; en) Presto/2.8.119 Version/11.10'),
(11882, 1, 'http://sexhd.tv/', 'http://www.ughellipower.com/plants-facilities', '167.114.103.51', 1425082181, 'Opera/7.11 (Windows NT 5.1; U) [en]'),
(11883, 1, 'http://sexhd.tv/', 'http://www.ughellipower.com/plants-facilities', '167.114.103.225', 1425082182, 'Opera/7.11 (Windows NT 5.1; U) [en]'),
(11884, 1, 'http://sexhd.tv/', 'http://www.ughellipower.com/plants-facilities', '167.114.103.51', 1425082183, 'Opera/7.11 (Windows NT 5.1; U) [en]'),
(11885, 1, 'http://poisk-zakona.ru/', 'http://www.ughellipower.com/plants-facilities', '167.114.103.51', 1425099968, 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.2; Win64; x64; SV1; .NET CLR 2.0.50727)'),
(11886, 1, 'http://2kata.ru/', 'http://www.ughellipower.com/plants-facilities', '167.114.103.225', 1425099967, 'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; SV1; .NET CLR 2.0.50727)'),
(11887, 1, 'http://2kata.ru/', 'http://www.ughellipower.com/plants-facilities', '167.114.103.225', 1425099968, 'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; SV1; .NET CLR 2.0.50727)'),
(11888, 1, 'http://robot-forex.biz/', 'http://www.ughellipower.com/plants-facilities', '167.114.103.225', 1425114507, 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1; InfoPath.1'),
(11889, 1, 'http://robot-forex.biz/', 'http://www.ughellipower.com/plants-facilities', '167.114.103.51', 1425114508, 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1; InfoPath.1'),
(11890, 1, 'http://robot-forex.biz/', 'http://www.ughellipower.com/plants-facilities', '167.114.103.225', 1425114509, 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1; InfoPath.1'),
(11891, 1, 'http://spb.onlinebay.ru/', 'http://www.ughellipower.com/plants-facilities', '167.114.103.51', 1425120826, 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1; InfoPath.1)'),
(11892, 1, 'http://spb.onlinebay.ru/', 'http://www.ughellipower.com/plants-facilities', '167.114.103.225', 1425120827, 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1; InfoPath.1)'),
(11893, 1, 'http://www.google.com/m?q=pictures+of+beautiful+houses+and+roads+in+ughelli&client=ms-opera-mini-android&channel=new', 'http://www.ughellipower.com/about', '167.114.103.225', 1425129320, 'Opera/9.80 (Android; Opera Mini/7.5.35721/35.7598; U; en) Presto/2.8.119 Version/11.10'),
(11894, 1, 'http://skins4mine.ru/', 'http://www.ughellipower.com/plants-facilities', '167.114.103.51', 1425146620, 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.0; .NET CLR 1.0.3705; .NET CLR 1.1.4322)'),
(11895, 1, 'http://skins4mine.ru/', 'http://www.ughellipower.com/plants-facilities', '167.114.103.51', 1425146623, 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.0; .NET CLR 1.0.3705; .NET CLR 1.1.4322)'),
(11896, 1, 'https://www.google.com.sa/', 'http://www.ughellipower.com/about', '167.114.103.51', 1425149914, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.115 Safari/537.'),
(11897, 1, 'http://www.google.com/xhtml?q=Phcn Business unit in ughelli&client=ms-opera_mb_no&channel=bh', 'http://www.ughellipower.com/about', '167.114.103.51', 1425150616, 'Opera/9.80 (J2ME/MIDP; Opera Mini/4.2.24721/35.7598; U; en) Presto/2.8.119 Version/11.10'),
(11898, 1, 'http://www.google.com/m?q=transcorp+ughelli+power+plc&client=ms-opera-mini-android&channel=new', 'http://www.ughellipower.com', '167.114.103.225', 1425151115, 'Opera/9.80 (Android; Opera Mini/7.6.40125/35.7598; U; en) Presto/2.8.119 Version/11.10'),
(11899, 1, 'http://rabotaru.5bb.ru/', 'http://www.ughellipower.com/plants-facilities', '167.114.103.225', 1425159403, 'Mozilla/6.0 (compatible; MSIE 7.0a1; Windows NT 5.2; SV1)'),
(11900, 1, 'http://rabotaru.5bb.ru/', 'http://www.ughellipower.com/plants-facilities', '167.114.103.51', 1425159404, 'Mozilla/6.0 (compatible; MSIE 7.0a1; Windows NT 5.2; SV1)'),
(11901, 1, 'http://www.zdravosil.ru/', 'http://www.ughellipower.com/plants-facilities', '167.114.103.51', 1425167243, 'Mozilla/3.0 (x86 [en] Windows NT 5.1; Sun)'),
(11902, 1, 'http://www.zdravosil.ru/', 'http://www.ughellipower.com/plants-facilities', '167.114.103.225', 1425167244, 'Mozilla/3.0 (x86 [en] Windows NT 5.1; Sun)'),
(11903, 1, 'http://www.zdravosil.ru/', 'http://www.ughellipower.com/plants-facilities', '167.114.103.51', 1425167245, 'Mozilla/3.0 (x86 [en] Windows NT 5.1; Sun)'),
(11904, 1, 'http://www.sport-komplekt.ru/', 'http://www.ughellipower.com/plants-facilities', '167.114.103.225', 1425180859, 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; KKman2.0)'),
(11905, 1, 'http://www.sport-komplekt.ru/', 'http://www.ughellipower.com/plants-facilities', '167.114.103.51', 1425180860, 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; KKman2.0)'),
(11906, 1, 'http://www.sport-komplekt.ru/', 'http://www.ughellipower.com/plants-facilities', '167.114.103.225', 1425180861, 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; KKman2.0)'),
(11907, 1, 'http://remhol.com/', 'http://www.ughellipower.com/plants-facilities', '167.114.103.51', 1425187508, 'Mozilla/4.0 (compatible; MSIE 5.5; Windows NT 5.0)'),
(11908, 1, 'http://remhol.com/', 'http://www.ughellipower.com/plants-facilities', '167.114.103.225', 1425187509, 'Mozilla/4.0 (compatible; MSIE 5.5; Windows NT 5.0)'),
(11909, 1, 'http://remhol.com/', 'http://www.ughellipower.com/plants-facilities', '167.114.103.51', 1425187510, 'Mozilla/4.0 (compatible; MSIE 5.5; Windows NT 5.0)'),
(11910, 1, 'https://www.google.com.ng/', 'http://www.ughellipower.com/about', '167.114.103.225', 1425211208, 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.115 Safa'),
(11911, 1, 'http://song5.ru/', 'http://www.ughellipower.com/plants-facilities', '167.114.103.225', 1425214076, 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1; FunWebProducts; .NET CLR 1.1.4322; PeoplePal'),
(11912, 1, 'http://song5.ru/', 'http://www.ughellipower.com/plants-facilities', '167.114.103.51', 1425214077, 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1; FunWebProducts; .NET CLR 1.1.4322; PeoplePal'),
(11913, 1, 'http://song5.ru/', 'http://www.ughellipower.com/plants-facilities', '167.114.103.225', 1425214078, 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1; FunWebProducts; .NET CLR 1.1.4322; PeoplePal'),
(11914, 1, 'http://www.bing.com/search?q=Ughelli+transcorp+hilton&qs=n&form=QBRE&pq=ughelli+transcorp+hilton&sc=0-0&sp=-1&sk;=&cvid=4054f0a2346341b59b4aadc7406458', 'http://www.ughellipower.com', '167.114.103.51', 1425217942, 'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; MATMJS; rv:11.0) like Gecko'),
(11915, 1, 'http://bristolhotel.com.ua/', 'http://www.ughellipower.com/plants-facilities', '167.114.103.51', 1425229573, 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.2; Win64; x64; SV1; .NET CLR 2.0.50727)'),
(11916, 1, 'http://bristolhotel.com.ua/', 'http://www.ughellipower.com/plants-facilities', '167.114.103.225', 1425229574, 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.2; Win64; x64; SV1; .NET CLR 2.0.50727)'),
(11917, 1, 'http://transcorpnigeria.com/power/', 'http://www.ughellipower.com', '167.114.103.225', 1425230200, 'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; MATMJS; rv:11.0) like Gecko'),
(11918, 1, 'http://www.bing.com/search?q=Ughelli+Power+Station&FORM=QSRE4', 'http://www.ughellipower.com', '167.114.103.51', 1425230798, 'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; MATMJS; rv:11.0) like Gecko'),
(11919, 1, 'http://domainsigma.com/whois/ughellipower.com', 'http://www.ughellipower.com', '167.114.103.51', 1425242322, 'Mozilla/5.0 (compatible; DomainSigmaCrawler/0.1; +http://domainsigma.com/robot)'),
(11920, 1, 'http://www.google.com/m?q=Atmospheric gases ughelli&client=ms-opera-mini&channel=new', 'http://www.ughellipower.com/plants-facilities', '167.114.103.51', 1425243236, 'Opera/9.80 (J2ME/MIDP; Opera Mini/4.5.33893/35.7598; U; en) Presto/2.8.119 Version/11.10');

-- --------------------------------------------------------

--
-- Table structure for table `exp_relationships`
--

CREATE TABLE IF NOT EXISTS `exp_relationships` (
  `rel_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `rel_parent_id` int(10) NOT NULL DEFAULT '0',
  `rel_child_id` int(10) NOT NULL DEFAULT '0',
  `rel_type` varchar(12) NOT NULL,
  `rel_data` mediumtext NOT NULL,
  `reverse_rel_data` mediumtext NOT NULL,
  PRIMARY KEY (`rel_id`),
  KEY `rel_parent_id` (`rel_parent_id`),
  KEY `rel_child_id` (`rel_child_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_remember_me`
--

CREATE TABLE IF NOT EXISTS `exp_remember_me` (
  `remember_me_id` varchar(40) NOT NULL DEFAULT '0',
  `member_id` int(10) DEFAULT '0',
  `ip_address` varchar(45) DEFAULT '0',
  `user_agent` varchar(120) DEFAULT '',
  `admin_sess` tinyint(1) DEFAULT '0',
  `site_id` int(4) DEFAULT '1',
  `expiration` int(10) DEFAULT '0',
  `last_refresh` int(10) DEFAULT '0',
  PRIMARY KEY (`remember_me_id`),
  KEY `member_id` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `exp_reset_password`
--

CREATE TABLE IF NOT EXISTS `exp_reset_password` (
  `reset_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_id` int(10) unsigned NOT NULL,
  `resetcode` varchar(12) NOT NULL,
  `date` int(10) NOT NULL,
  PRIMARY KEY (`reset_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `exp_reset_password`
--

INSERT INTO `exp_reset_password` (`reset_id`, `member_id`, `resetcode`, `date`) VALUES
(1, 1, 'p7dU2v6m', 1384784017);

-- --------------------------------------------------------

--
-- Table structure for table `exp_revision_tracker`
--

CREATE TABLE IF NOT EXISTS `exp_revision_tracker` (
  `tracker_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `item_id` int(10) unsigned NOT NULL,
  `item_table` varchar(20) NOT NULL,
  `item_field` varchar(20) NOT NULL,
  `item_date` int(10) NOT NULL,
  `item_author_id` int(10) unsigned NOT NULL,
  `item_data` mediumtext NOT NULL,
  PRIMARY KEY (`tracker_id`),
  KEY `item_id` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_rte_tools`
--

CREATE TABLE IF NOT EXISTS `exp_rte_tools` (
  `tool_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(75) DEFAULT NULL,
  `class` varchar(75) DEFAULT NULL,
  `enabled` char(1) DEFAULT 'y',
  PRIMARY KEY (`tool_id`),
  KEY `enabled` (`enabled`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `exp_rte_tools`
--

INSERT INTO `exp_rte_tools` (`tool_id`, `name`, `class`, `enabled`) VALUES
(1, 'Blockquote', 'Blockquote_rte', 'y'),
(2, 'Bold', 'Bold_rte', 'y'),
(3, 'Headings', 'Headings_rte', 'y'),
(4, 'Image', 'Image_rte', 'y'),
(5, 'Italic', 'Italic_rte', 'y'),
(6, 'Link', 'Link_rte', 'y'),
(7, 'Ordered List', 'Ordered_list_rte', 'y'),
(8, 'Underline', 'Underline_rte', 'y'),
(9, 'Unordered List', 'Unordered_list_rte', 'y'),
(10, 'View Source', 'View_source_rte', 'y');

-- --------------------------------------------------------

--
-- Table structure for table `exp_rte_toolsets`
--

CREATE TABLE IF NOT EXISTS `exp_rte_toolsets` (
  `toolset_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_id` int(10) DEFAULT '0',
  `name` varchar(100) DEFAULT NULL,
  `tools` text,
  `enabled` char(1) DEFAULT 'y',
  PRIMARY KEY (`toolset_id`),
  KEY `member_id` (`member_id`),
  KEY `enabled` (`enabled`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `exp_rte_toolsets`
--

INSERT INTO `exp_rte_toolsets` (`toolset_id`, `member_id`, `name`, `tools`, `enabled`) VALUES
(1, 0, 'Default', '3|2|5|1|9|7|6|4|10', 'y');

-- --------------------------------------------------------

--
-- Table structure for table `exp_search`
--

CREATE TABLE IF NOT EXISTS `exp_search` (
  `search_id` varchar(32) NOT NULL,
  `site_id` int(4) NOT NULL DEFAULT '1',
  `search_date` int(10) NOT NULL,
  `keywords` varchar(60) NOT NULL,
  `member_id` int(10) unsigned NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `total_results` int(6) NOT NULL,
  `per_page` tinyint(3) unsigned NOT NULL,
  `query` mediumtext,
  `custom_fields` mediumtext,
  `result_page` varchar(70) NOT NULL,
  PRIMARY KEY (`search_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `exp_search_log`
--

CREATE TABLE IF NOT EXISTS `exp_search_log` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `member_id` int(10) unsigned NOT NULL,
  `screen_name` varchar(50) NOT NULL,
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `search_date` int(10) NOT NULL,
  `search_type` varchar(32) NOT NULL,
  `search_terms` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_security_hashes`
--

CREATE TABLE IF NOT EXISTS `exp_security_hashes` (
  `hash_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `date` int(10) unsigned NOT NULL,
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `hash` varchar(40) NOT NULL,
  PRIMARY KEY (`hash_id`),
  KEY `hash` (`hash`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2662 ;

--
-- Dumping data for table `exp_security_hashes`
--

INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES
(2653, 1424877021, '167.114.103.225', 'a117af4381ebf5fb1856afabe0319be6565da202'),
(2654, 1424879924, '167.114.103.51', '635804b7a27602eb7ea1b1cc7a8fa9e656f9dde2'),
(2655, 1424932503, '167.114.103.51', '00f91fee390cfa7b9533ffb8d1879a0d4f716b8a'),
(2656, 1424937904, '167.114.103.225', '27088b26b428b31957c8978aca7f496008e8d844'),
(2657, 1424941576, '167.114.103.51', 'f007ee72f49a2354a54ff5ea8bbb60251c14ee30'),
(2658, 1424962203, '167.114.103.51', '34156817c849fd08bce5c73287cfdcf27322f2ec'),
(2659, 1424966832, '167.114.103.225', '46673affaa5c1c1bd756956091d104fb9664d22b'),
(2660, 1425124588, '167.114.103.225', '2a43f27943c859792667eff9733aeb82c107750c'),
(2661, 1425138360, '167.114.103.51', 'f8367635f1a69e33a3c3759c1c65779cc65cf78e');

-- --------------------------------------------------------

--
-- Table structure for table `exp_sessions`
--

CREATE TABLE IF NOT EXISTS `exp_sessions` (
  `session_id` varchar(40) NOT NULL DEFAULT '0',
  `member_id` int(10) NOT NULL DEFAULT '0',
  `admin_sess` tinyint(1) NOT NULL DEFAULT '0',
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `user_agent` varchar(120) NOT NULL,
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`session_id`),
  KEY `member_id` (`member_id`),
  KEY `last_activity_idx` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `exp_sites`
--

CREATE TABLE IF NOT EXISTS `exp_sites` (
  `site_id` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `site_label` varchar(100) NOT NULL DEFAULT '',
  `site_name` varchar(50) NOT NULL DEFAULT '',
  `site_description` text,
  `site_system_preferences` mediumtext NOT NULL,
  `site_mailinglist_preferences` text NOT NULL,
  `site_member_preferences` text NOT NULL,
  `site_template_preferences` text NOT NULL,
  `site_channel_preferences` text NOT NULL,
  `site_bootstrap_checksums` text NOT NULL,
  `site_pages` text NOT NULL,
  PRIMARY KEY (`site_id`),
  KEY `site_name` (`site_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `exp_sites`
--

INSERT INTO `exp_sites` (`site_id`, `site_label`, `site_name`, `site_description`, `site_system_preferences`, `site_mailinglist_preferences`, `site_member_preferences`, `site_template_preferences`, `site_channel_preferences`, `site_bootstrap_checksums`, `site_pages`) VALUES
(1, 'Ughelli Power Plc', 'default_site', NULL, 'YTo5Mjp7czoxMDoic2l0ZV9pbmRleCI7czowOiIiO3M6ODoic2l0ZV91cmwiO3M6Mjg6Imh0dHA6Ly93d3cudWdoZWxsaXBvd2VyLmNvbS8iO3M6MTY6InRoZW1lX2ZvbGRlcl91cmwiO3M6MzU6Imh0dHA6Ly93d3cudWdoZWxsaXBvd2VyLmNvbS90aGVtZXMvIjtzOjE1OiJ3ZWJtYXN0ZXJfZW1haWwiO3M6Mjc6InN1cHBvcnRAd2l0dHNhbmRzdHJhdHRzLmNvbSI7czoxNDoid2VibWFzdGVyX25hbWUiO3M6MDoiIjtzOjIwOiJjaGFubmVsX25vbWVuY2xhdHVyZSI7czo3OiJjaGFubmVsIjtzOjEwOiJtYXhfY2FjaGVzIjtzOjM6IjE1MCI7czoxMToiY2FwdGNoYV91cmwiO3M6NDQ6Imh0dHA6Ly93d3cudWdoZWxsaXBvd2VyLmNvbS9pbWFnZXMvY2FwdGNoYXMvIjtzOjEyOiJjYXB0Y2hhX3BhdGgiO3M6Mzc6IkM6XHhhbXBwXGh0ZG9jc1xwaGNuXGltYWdlc1xjYXB0Y2hhc1wiO3M6MTI6ImNhcHRjaGFfZm9udCI7czoxOiJ5IjtzOjEyOiJjYXB0Y2hhX3JhbmQiO3M6MToieSI7czoyMzoiY2FwdGNoYV9yZXF1aXJlX21lbWJlcnMiO3M6MToibiI7czoxNzoiZW5hYmxlX2RiX2NhY2hpbmciO3M6MToibiI7czoxODoiZW5hYmxlX3NxbF9jYWNoaW5nIjtzOjE6Im4iO3M6MTg6ImZvcmNlX3F1ZXJ5X3N0cmluZyI7czoxOiJuIjtzOjEzOiJzaG93X3Byb2ZpbGVyIjtzOjE6Im4iO3M6MTg6InRlbXBsYXRlX2RlYnVnZ2luZyI7czoxOiJuIjtzOjE1OiJpbmNsdWRlX3NlY29uZHMiO3M6MToibiI7czoxMzoiY29va2llX2RvbWFpbiI7czowOiIiO3M6MTE6ImNvb2tpZV9wYXRoIjtzOjA6IiI7czoxNzoidXNlcl9zZXNzaW9uX3R5cGUiO3M6MToiYyI7czoxODoiYWRtaW5fc2Vzc2lvbl90eXBlIjtzOjI6ImNzIjtzOjIxOiJhbGxvd191c2VybmFtZV9jaGFuZ2UiO3M6MToieSI7czoxODoiYWxsb3dfbXVsdGlfbG9naW5zIjtzOjE6InkiO3M6MTY6InBhc3N3b3JkX2xvY2tvdXQiO3M6MToieSI7czoyNToicGFzc3dvcmRfbG9ja291dF9pbnRlcnZhbCI7czoxOiIxIjtzOjIwOiJyZXF1aXJlX2lwX2Zvcl9sb2dpbiI7czoxOiJ5IjtzOjIyOiJyZXF1aXJlX2lwX2Zvcl9wb3N0aW5nIjtzOjE6InkiO3M6MjQ6InJlcXVpcmVfc2VjdXJlX3Bhc3N3b3JkcyI7czoxOiJuIjtzOjE5OiJhbGxvd19kaWN0aW9uYXJ5X3B3IjtzOjE6InkiO3M6MjM6Im5hbWVfb2ZfZGljdGlvbmFyeV9maWxlIjtzOjA6IiI7czoxNzoieHNzX2NsZWFuX3VwbG9hZHMiO3M6MToieSI7czoxNToicmVkaXJlY3RfbWV0aG9kIjtzOjc6InJlZnJlc2giO3M6OToiZGVmdF9sYW5nIjtzOjc6ImVuZ2xpc2giO3M6ODoieG1sX2xhbmciO3M6MjoiZW4iO3M6MTI6InNlbmRfaGVhZGVycyI7czoxOiJ5IjtzOjExOiJnemlwX291dHB1dCI7czoxOiJuIjtzOjEzOiJsb2dfcmVmZXJyZXJzIjtzOjE6InkiO3M6MTM6Im1heF9yZWZlcnJlcnMiO3M6MzoiNTAwIjtzOjExOiJ0aW1lX2Zvcm1hdCI7czoyOiJ1cyI7czoxNToic2VydmVyX3RpbWV6b25lIjtzOjM6IlVQMSI7czoxMzoic2VydmVyX29mZnNldCI7czowOiIiO3M6MTY6ImRheWxpZ2h0X3NhdmluZ3MiO3M6MToibiI7czoyMToiZGVmYXVsdF9zaXRlX3RpbWV6b25lIjtzOjA6IiI7czoxNjoiZGVmYXVsdF9zaXRlX2RzdCI7czowOiIiO3M6MTU6Imhvbm9yX2VudHJ5X2RzdCI7czoxOiJ5IjtzOjEzOiJtYWlsX3Byb3RvY29sIjtzOjQ6Im1haWwiO3M6MTE6InNtdHBfc2VydmVyIjtzOjA6IiI7czoxMzoic210cF91c2VybmFtZSI7czowOiIiO3M6MTM6InNtdHBfcGFzc3dvcmQiO3M6MDoiIjtzOjExOiJlbWFpbF9kZWJ1ZyI7czoxOiJuIjtzOjEzOiJlbWFpbF9jaGFyc2V0IjtzOjU6InV0Zi04IjtzOjE1OiJlbWFpbF9iYXRjaG1vZGUiO3M6MToibiI7czoxNjoiZW1haWxfYmF0Y2hfc2l6ZSI7czowOiIiO3M6MTE6Im1haWxfZm9ybWF0IjtzOjU6InBsYWluIjtzOjk6IndvcmRfd3JhcCI7czoxOiJ5IjtzOjIyOiJlbWFpbF9jb25zb2xlX3RpbWVsb2NrIjtzOjE6IjUiO3M6MjI6ImxvZ19lbWFpbF9jb25zb2xlX21zZ3MiO3M6MToieSI7czo4OiJjcF90aGVtZSI7czo3OiJkZWZhdWx0IjtzOjIxOiJlbWFpbF9tb2R1bGVfY2FwdGNoYXMiO3M6MToibiI7czoxNjoibG9nX3NlYXJjaF90ZXJtcyI7czoxOiJ5IjtzOjEyOiJzZWN1cmVfZm9ybXMiO3M6MToieSI7czoxOToiZGVueV9kdXBsaWNhdGVfZGF0YSI7czoxOiJ5IjtzOjI0OiJyZWRpcmVjdF9zdWJtaXR0ZWRfbGlua3MiO3M6MToibiI7czoxNjoiZW5hYmxlX2NlbnNvcmluZyI7czoxOiJuIjtzOjE0OiJjZW5zb3JlZF93b3JkcyI7czowOiIiO3M6MTg6ImNlbnNvcl9yZXBsYWNlbWVudCI7czowOiIiO3M6MTA6ImJhbm5lZF9pcHMiO3M6MDoiIjtzOjEzOiJiYW5uZWRfZW1haWxzIjtzOjA6IiI7czoxNjoiYmFubmVkX3VzZXJuYW1lcyI7czowOiIiO3M6MTk6ImJhbm5lZF9zY3JlZW5fbmFtZXMiO3M6MDoiIjtzOjEwOiJiYW5fYWN0aW9uIjtzOjg6InJlc3RyaWN0IjtzOjExOiJiYW5fbWVzc2FnZSI7czozNDoiVGhpcyBzaXRlIGlzIGN1cnJlbnRseSB1bmF2YWlsYWJsZSI7czoxNToiYmFuX2Rlc3RpbmF0aW9uIjtzOjIxOiJodHRwOi8vd3d3LnlhaG9vLmNvbS8iO3M6MTY6ImVuYWJsZV9lbW90aWNvbnMiO3M6MToieSI7czoxMjoiZW1vdGljb25fdXJsIjtzOjQzOiJodHRwOi8vd3d3LnVnaGVsbGlwb3dlci5jb20vaW1hZ2VzL3NtaWxleXMvIjtzOjE5OiJyZWNvdW50X2JhdGNoX3RvdGFsIjtzOjQ6IjEwMDAiO3M6MTc6Im5ld192ZXJzaW9uX2NoZWNrIjtzOjE6InkiO3M6MTc6ImVuYWJsZV90aHJvdHRsaW5nIjtzOjE6Im4iO3M6MTc6ImJhbmlzaF9tYXNrZWRfaXBzIjtzOjE6InkiO3M6MTQ6Im1heF9wYWdlX2xvYWRzIjtzOjI6IjEwIjtzOjEzOiJ0aW1lX2ludGVydmFsIjtzOjE6IjgiO3M6MTI6ImxvY2tvdXRfdGltZSI7czoyOiIzMCI7czoxNToiYmFuaXNobWVudF90eXBlIjtzOjc6Im1lc3NhZ2UiO3M6MTQ6ImJhbmlzaG1lbnRfdXJsIjtzOjA6IiI7czoxODoiYmFuaXNobWVudF9tZXNzYWdlIjtzOjUwOiJZb3UgaGF2ZSBleGNlZWRlZCB0aGUgYWxsb3dlZCBwYWdlIGxvYWQgZnJlcXVlbmN5LiI7czoxNzoiZW5hYmxlX3NlYXJjaF9sb2ciO3M6MToieSI7czoxOToibWF4X2xvZ2dlZF9zZWFyY2hlcyI7czozOiI1MDAiO3M6MTc6InRoZW1lX2ZvbGRlcl9wYXRoIjtzOjI4OiJDOlx4YW1wcFxodGRvY3NccGhjblx0aGVtZXNcIjtzOjEwOiJpc19zaXRlX29uIjtzOjE6InkiO3M6MTE6InJ0ZV9lbmFibGVkIjtzOjE6InkiO3M6MjI6InJ0ZV9kZWZhdWx0X3Rvb2xzZXRfaWQiO3M6MToiMSI7fQ==', 'YTozOntzOjE5OiJtYWlsaW5nbGlzdF9lbmFibGVkIjtzOjE6InkiO3M6MTg6Im1haWxpbmdsaXN0X25vdGlmeSI7czoxOiJuIjtzOjI1OiJtYWlsaW5nbGlzdF9ub3RpZnlfZW1haWxzIjtzOjA6IiI7fQ==', 'YTo0NDp7czoxMDoidW5fbWluX2xlbiI7czoxOiI0IjtzOjEwOiJwd19taW5fbGVuIjtzOjE6IjUiO3M6MjU6ImFsbG93X21lbWJlcl9yZWdpc3RyYXRpb24iO3M6MToibiI7czoyNToiYWxsb3dfbWVtYmVyX2xvY2FsaXphdGlvbiI7czoxOiJ5IjtzOjE4OiJyZXFfbWJyX2FjdGl2YXRpb24iO3M6NDoibm9uZSI7czoyMzoibmV3X21lbWJlcl9ub3RpZmljYXRpb24iO3M6MToibiI7czoyMzoibWJyX25vdGlmaWNhdGlvbl9lbWFpbHMiO3M6MDoiIjtzOjI0OiJyZXF1aXJlX3Rlcm1zX29mX3NlcnZpY2UiO3M6MToibiI7czoyMjoidXNlX21lbWJlcnNoaXBfY2FwdGNoYSI7czoxOiJuIjtzOjIwOiJkZWZhdWx0X21lbWJlcl9ncm91cCI7czoxOiI1IjtzOjE1OiJwcm9maWxlX3RyaWdnZXIiO3M6NjoibWVtYmVyIjtzOjEyOiJtZW1iZXJfdGhlbWUiO3M6NzoiZGVmYXVsdCI7czoxNDoiZW5hYmxlX2F2YXRhcnMiO3M6MToieSI7czoyMDoiYWxsb3dfYXZhdGFyX3VwbG9hZHMiO3M6MToibiI7czoxMDoiYXZhdGFyX3VybCI7czo0MzoiaHR0cDovL3d3dy51Z2hlbGxpcG93ZXIuY29tL2ltYWdlcy9hdmF0YXJzLyI7czoxMToiYXZhdGFyX3BhdGgiO3M6MzY6IkM6L3hhbXBwL2h0ZG9jcy9waGNuL2ltYWdlcy9hdmF0YXJzLyI7czoxNjoiYXZhdGFyX21heF93aWR0aCI7czozOiIxMDAiO3M6MTc6ImF2YXRhcl9tYXhfaGVpZ2h0IjtzOjM6IjEwMCI7czoxMzoiYXZhdGFyX21heF9rYiI7czoyOiI1MCI7czoxMzoiZW5hYmxlX3Bob3RvcyI7czoxOiJuIjtzOjk6InBob3RvX3VybCI7czo0OToiaHR0cDovL3d3dy51Z2hlbGxpcG93ZXIuY29tL2ltYWdlcy9tZW1iZXJfcGhvdG9zLyI7czoxMDoicGhvdG9fcGF0aCI7czo0MjoiQzoveGFtcHAvaHRkb2NzL3BoY24vaW1hZ2VzL21lbWJlcl9waG90b3MvIjtzOjE1OiJwaG90b19tYXhfd2lkdGgiO3M6MzoiMTAwIjtzOjE2OiJwaG90b19tYXhfaGVpZ2h0IjtzOjM6IjEwMCI7czoxMjoicGhvdG9fbWF4X2tiIjtzOjI6IjUwIjtzOjE2OiJhbGxvd19zaWduYXR1cmVzIjtzOjE6InkiO3M6MTM6InNpZ19tYXhsZW5ndGgiO3M6MzoiNTAwIjtzOjIxOiJzaWdfYWxsb3dfaW1nX2hvdGxpbmsiO3M6MToibiI7czoyMDoic2lnX2FsbG93X2ltZ191cGxvYWQiO3M6MToibiI7czoxMToic2lnX2ltZ191cmwiO3M6NTc6Imh0dHA6Ly93d3cudWdoZWxsaXBvd2VyLmNvbS9pbWFnZXMvc2lnbmF0dXJlX2F0dGFjaG1lbnRzLyI7czoxMjoic2lnX2ltZ19wYXRoIjtzOjUwOiJDOi94YW1wcC9odGRvY3MvcGhjbi9pbWFnZXMvc2lnbmF0dXJlX2F0dGFjaG1lbnRzLyI7czoxNzoic2lnX2ltZ19tYXhfd2lkdGgiO3M6MzoiNDgwIjtzOjE4OiJzaWdfaW1nX21heF9oZWlnaHQiO3M6MjoiODAiO3M6MTQ6InNpZ19pbWdfbWF4X2tiIjtzOjI6IjMwIjtzOjE5OiJwcnZfbXNnX3VwbG9hZF9wYXRoIjtzOjQzOiJDOi94YW1wcC9odGRvY3MvcGhjbi9pbWFnZXMvcG1fYXR0YWNobWVudHMvIjtzOjIzOiJwcnZfbXNnX21heF9hdHRhY2htZW50cyI7czoxOiIzIjtzOjIyOiJwcnZfbXNnX2F0dGFjaF9tYXhzaXplIjtzOjM6IjI1MCI7czoyMDoicHJ2X21zZ19hdHRhY2hfdG90YWwiO3M6MzoiMTAwIjtzOjE5OiJwcnZfbXNnX2h0bWxfZm9ybWF0IjtzOjQ6InNhZmUiO3M6MTg6InBydl9tc2dfYXV0b19saW5rcyI7czoxOiJ5IjtzOjE3OiJwcnZfbXNnX21heF9jaGFycyI7czo0OiI2MDAwIjtzOjE5OiJtZW1iZXJsaXN0X29yZGVyX2J5IjtzOjE3OiJ0b3RhbF9mb3J1bV9wb3N0cyI7czoyMToibWVtYmVybGlzdF9zb3J0X29yZGVyIjtzOjQ6ImRlc2MiO3M6MjA6Im1lbWJlcmxpc3Rfcm93X2xpbWl0IjtzOjI6IjIwIjt9', 'YTo2OntzOjExOiJzdHJpY3RfdXJscyI7czoxOiJuIjtzOjg6InNpdGVfNDA0IjtzOjA6IiI7czoxOToic2F2ZV90bXBsX3JldmlzaW9ucyI7czoxOiJuIjtzOjE4OiJtYXhfdG1wbF9yZXZpc2lvbnMiO3M6MToiNSI7czoxNToic2F2ZV90bXBsX2ZpbGVzIjtzOjE6Im4iO3M6MTg6InRtcGxfZmlsZV9iYXNlcGF0aCI7czo1OToiQzpceGFtcHBcaHRkb2NzXHBoY25ccGhjbi1hZG1pblxleHByZXNzaW9uZW5naW5lXHRlbXBsYXRlc1wiO30=', 'YTo5OntzOjIxOiJpbWFnZV9yZXNpemVfcHJvdG9jb2wiO3M6MzoiZ2QyIjtzOjE4OiJpbWFnZV9saWJyYXJ5X3BhdGgiO3M6MDoiIjtzOjE2OiJ0aHVtYm5haWxfcHJlZml4IjtzOjU6InRodW1iIjtzOjE0OiJ3b3JkX3NlcGFyYXRvciI7czo0OiJkYXNoIjtzOjE3OiJ1c2VfY2F0ZWdvcnlfbmFtZSI7czoxOiJuIjtzOjIyOiJyZXNlcnZlZF9jYXRlZ29yeV93b3JkIjtzOjg6ImNhdGVnb3J5IjtzOjIzOiJhdXRvX2NvbnZlcnRfaGlnaF9hc2NpaSI7czoxOiJuIjtzOjIyOiJuZXdfcG9zdHNfY2xlYXJfY2FjaGVzIjtzOjE6InkiO3M6MjM6ImF1dG9fYXNzaWduX2NhdF9wYXJlbnRzIjtzOjE6InkiO30=', 'YToyOntzOjc6ImVtYWlsZWQiO2E6MDp7fXM6Mzc6Ii9ob21lNC91Z2hlbGxpcC9wdWJsaWNfaHRtbC9pbmRleC5waHAiO3M6MzI6IjYxYmQ4OTJmOWRmNTE5NDdmZmMwYzdiZGY1ZDljYmY1Ijt9', 'YToxOntpOjE7YTozOntzOjQ6InVyaXMiO2E6NDp7aTo0O3M6NjoiL2Fib3V0IjtpOjY7czoxNDoiL3NhZmV0eS1wb2xpY3kiO2k6NztzOjg6Ii9jb250YWN0IjtpOjE3O3M6MTg6Ii9wbGFudHMtZmFjaWxpdGllcyI7fXM6OToidGVtcGxhdGVzIjthOjQ6e2k6NDtzOjI6IjEwIjtpOjY7czoyOiIxMCI7aTo3O3M6MjoiMTEiO2k6MTc7czoxOiI3Ijt9czozOiJ1cmwiO3M6Mjg6Imh0dHA6Ly93d3cudWdoZWxsaXBvd2VyLmNvbS8iO319');

-- --------------------------------------------------------

--
-- Table structure for table `exp_snippets`
--

CREATE TABLE IF NOT EXISTS `exp_snippets` (
  `snippet_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) NOT NULL,
  `snippet_name` varchar(75) NOT NULL,
  `snippet_contents` text,
  PRIMARY KEY (`snippet_id`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_specialty_templates`
--

CREATE TABLE IF NOT EXISTS `exp_specialty_templates` (
  `template_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `enable_template` char(1) NOT NULL DEFAULT 'y',
  `template_name` varchar(50) NOT NULL,
  `data_title` varchar(80) NOT NULL,
  `template_data` text NOT NULL,
  PRIMARY KEY (`template_id`),
  KEY `template_name` (`template_name`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=17 ;

--
-- Dumping data for table `exp_specialty_templates`
--

INSERT INTO `exp_specialty_templates` (`template_id`, `site_id`, `enable_template`, `template_name`, `data_title`, `template_data`) VALUES
(1, 1, 'y', 'offline_template', '', '<html>\n<head>\n\n<title>System Offline</title>\n\n<style type="text/css">\n\nbody { \nbackground-color:	#ffffff; \nmargin:				50px; \nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-size:			11px;\ncolor:				#000;\nbackground-color:	#fff;\n}\n\na {\nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-weight:		bold;\nletter-spacing:		.09em;\ntext-decoration:	none;\ncolor:			  #330099;\nbackground-color:	transparent;\n}\n  \na:visited {\ncolor:				#330099;\nbackground-color:	transparent;\n}\n\na:hover {\ncolor:				#000;\ntext-decoration:	underline;\nbackground-color:	transparent;\n}\n\n#content  {\nborder:				#999999 1px solid;\npadding:			22px 25px 14px 25px;\n}\n\nh1 {\nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-weight:		bold;\nfont-size:			14px;\ncolor:				#000;\nmargin-top: 		0;\nmargin-bottom:		14px;\n}\n\np {\nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-size: 			12px;\nfont-weight: 		normal;\nmargin-top: 		12px;\nmargin-bottom: 		14px;\ncolor: 				#000;\n}\n</style>\n\n</head>\n\n<body>\n\n<div id="content">\n\n<h1>System Offline</h1>\n\n<p>This site is currently offline</p>\n\n</div>\n\n</body>\n\n</html>'),
(2, 1, 'y', 'message_template', '', '<html>\n<head>\n\n<title>{title}</title>\n\n<meta http-equiv=''content-type'' content=''text/html; charset={charset}'' />\n\n{meta_refresh}\n\n<style type="text/css">\n\nbody { \nbackground-color:	#ffffff; \nmargin:				50px; \nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-size:			11px;\ncolor:				#000;\nbackground-color:	#fff;\n}\n\na {\nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nletter-spacing:		.09em;\ntext-decoration:	none;\ncolor:			  #330099;\nbackground-color:	transparent;\n}\n  \na:visited {\ncolor:				#330099;\nbackground-color:	transparent;\n}\n\na:active {\ncolor:				#ccc;\nbackground-color:	transparent;\n}\n\na:hover {\ncolor:				#000;\ntext-decoration:	underline;\nbackground-color:	transparent;\n}\n\n#content  {\nborder:				#000 1px solid;\nbackground-color: 	#DEDFE3;\npadding:			22px 25px 14px 25px;\n}\n\nh1 {\nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-weight:		bold;\nfont-size:			14px;\ncolor:				#000;\nmargin-top: 		0;\nmargin-bottom:		14px;\n}\n\np {\nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-size: 			12px;\nfont-weight: 		normal;\nmargin-top: 		12px;\nmargin-bottom: 		14px;\ncolor: 				#000;\n}\n\nul {\nmargin-bottom: 		16px;\n}\n\nli {\nlist-style:			square;\nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-size: 			12px;\nfont-weight: 		normal;\nmargin-top: 		8px;\nmargin-bottom: 		8px;\ncolor: 				#000;\n}\n\n</style>\n\n</head>\n\n<body>\n\n<div id="content">\n\n<h1>{heading}</h1>\n\n{content}\n\n<p>{link}</p>\n\n</div>\n\n</body>\n\n</html>'),
(3, 1, 'y', 'admin_notify_reg', 'Notification of new member registration', 'New member registration site: {site_name}\n\nScreen name: {name}\nUser name: {username}\nEmail: {email}\n\nYour control panel URL: {control_panel_url}'),
(4, 1, 'y', 'admin_notify_entry', 'A new channel entry has been posted', 'A new entry has been posted in the following channel:\n{channel_name}\n\nThe title of the entry is:\n{entry_title}\n\nPosted by: {name}\nEmail: {email}\n\nTo read the entry please visit: \n{entry_url}\n'),
(5, 1, 'y', 'admin_notify_mailinglist', 'Someone has subscribed to your mailing list', 'A new mailing list subscription has been accepted.\n\nEmail Address: {email}\nMailing List: {mailing_list}'),
(6, 1, 'y', 'admin_notify_comment', 'You have just received a comment', 'You have just received a comment for the following channel:\n{channel_name}\n\nThe title of the entry is:\n{entry_title}\n\nLocated at: \n{comment_url}\n\nPosted by: {name}\nEmail: {email}\nURL: {url}\nLocation: {location}\n\n{comment}'),
(7, 1, 'y', 'mbr_activation_instructions', 'Enclosed is your activation code', 'Thank you for your new member registration.\n\nTo activate your new account, please visit the following URL:\n\n{unwrap}{activation_url}{/unwrap}\n\nThank You!\n\n{site_name}\n\n{site_url}'),
(8, 1, 'y', 'forgot_password_instructions', 'Login information', '{name},\n\nTo reset your password, please go to the following page:\n\n{reset_url}\n\nYour password will be automatically reset, and a new password will be emailed to you.\n\nIf you do not wish to reset your password, ignore this message. It will expire in 24 hours.\n\n{site_name}\n{site_url}'),
(9, 1, 'y', 'reset_password_notification', 'New Login Information', '{name},\n\nHere is your new login information:\n\nUsername: {username}\nPassword: {password}\n\n{site_name}\n{site_url}'),
(10, 1, 'y', 'validated_member_notify', 'Your membership account has been activated', '{name},\n\nYour membership account has been activated and is ready for use.\n\nThank You!\n\n{site_name}\n{site_url}'),
(11, 1, 'y', 'decline_member_validation', 'Your membership account has been declined', '{name},\n\nWe''re sorry but our staff has decided not to validate your membership.\n\n{site_name}\n{site_url}'),
(12, 1, 'y', 'mailinglist_activation_instructions', 'Email Confirmation', 'Thank you for joining the "{mailing_list}" mailing list!\n\nPlease click the link below to confirm your email.\n\nIf you do not want to be added to our list, ignore this email.\n\n{unwrap}{activation_url}{/unwrap}\n\nThank You!\n\n{site_name}'),
(13, 1, 'y', 'comment_notification', 'Someone just responded to your comment', '{name_of_commenter} just responded to the entry you subscribed to at:\n{channel_name}\n\nThe title of the entry is:\n{entry_title}\n\nYou can see the comment at the following URL:\n{comment_url}\n\n{comment}\n\nTo stop receiving notifications for this comment, click here:\n{notification_removal_url}'),
(14, 1, 'y', 'comments_opened_notification', 'New comments have been added', 'Responses have been added to the entry you subscribed to at:\n{channel_name}\n\nThe title of the entry is:\n{entry_title}\n\nYou can see the comments at the following URL:\n{comment_url}\n\n{comments}\n{comment} \n{/comments}\n\nTo stop receiving notifications for this entry, click here:\n{notification_removal_url}'),
(15, 1, 'y', 'private_message_notification', 'Someone has sent you a Private Message', '\n{recipient_name},\n\n{sender_name} has just sent you a Private Message titled ‘{message_subject}’.\n\nYou can see the Private Message by logging in and viewing your inbox at:\n{site_url}\n\nContent:\n\n{message_content}\n\nTo stop receiving notifications of Private Messages, turn the option off in your Email Settings.\n\n{site_name}\n{site_url}'),
(16, 1, 'y', 'pm_inbox_full', 'Your private message mailbox is full', '{recipient_name},\n\n{sender_name} has just attempted to send you a Private Message,\nbut your inbox is full, exceeding the maximum of {pm_storage_limit}.\n\nPlease log in and remove unwanted messages from your inbox at:\n{site_url}');

-- --------------------------------------------------------

--
-- Table structure for table `exp_stats`
--

CREATE TABLE IF NOT EXISTS `exp_stats` (
  `stat_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `total_members` mediumint(7) NOT NULL DEFAULT '0',
  `recent_member_id` int(10) NOT NULL DEFAULT '0',
  `recent_member` varchar(50) NOT NULL,
  `total_entries` mediumint(8) NOT NULL DEFAULT '0',
  `total_forum_topics` mediumint(8) NOT NULL DEFAULT '0',
  `total_forum_posts` mediumint(8) NOT NULL DEFAULT '0',
  `total_comments` mediumint(8) NOT NULL DEFAULT '0',
  `last_entry_date` int(10) unsigned NOT NULL DEFAULT '0',
  `last_forum_post_date` int(10) unsigned NOT NULL DEFAULT '0',
  `last_comment_date` int(10) unsigned NOT NULL DEFAULT '0',
  `last_visitor_date` int(10) unsigned NOT NULL DEFAULT '0',
  `most_visitors` mediumint(7) NOT NULL DEFAULT '0',
  `most_visitor_date` int(10) unsigned NOT NULL DEFAULT '0',
  `last_cache_clear` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`stat_id`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `exp_stats`
--

INSERT INTO `exp_stats` (`stat_id`, `site_id`, `total_members`, `recent_member_id`, `recent_member`, `total_entries`, `total_forum_topics`, `total_forum_posts`, `total_comments`, `last_entry_date`, `last_forum_post_date`, `last_comment_date`, `last_visitor_date`, `most_visitors`, `most_visitor_date`, `last_cache_clear`) VALUES
(1, 1, 2, 2, 'phcn_admin', 14, 0, 0, 0, 1419878629, 0, 0, 1425254864, 75, 1424711326, 1425466728);

-- --------------------------------------------------------

--
-- Table structure for table `exp_statuses`
--

CREATE TABLE IF NOT EXISTS `exp_statuses` (
  `status_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_id` int(4) unsigned NOT NULL,
  `status` varchar(50) NOT NULL,
  `status_order` int(3) unsigned NOT NULL,
  `highlight` varchar(30) NOT NULL,
  PRIMARY KEY (`status_id`),
  KEY `group_id` (`group_id`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `exp_statuses`
--

INSERT INTO `exp_statuses` (`status_id`, `site_id`, `group_id`, `status`, `status_order`, `highlight`) VALUES
(1, 1, 1, 'open', 1, '009933'),
(2, 1, 1, 'closed', 2, '990000'),
(3, 1, 2, 'open', 1, '009933'),
(4, 1, 2, 'closed', 2, '990000');

-- --------------------------------------------------------

--
-- Table structure for table `exp_status_groups`
--

CREATE TABLE IF NOT EXISTS `exp_status_groups` (
  `group_id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_name` varchar(50) NOT NULL,
  PRIMARY KEY (`group_id`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `exp_status_groups`
--

INSERT INTO `exp_status_groups` (`group_id`, `site_id`, `group_name`) VALUES
(1, 1, 'Statuses'),
(2, 1, 'Always Open');

-- --------------------------------------------------------

--
-- Table structure for table `exp_status_no_access`
--

CREATE TABLE IF NOT EXISTS `exp_status_no_access` (
  `status_id` int(6) unsigned NOT NULL,
  `member_group` smallint(4) unsigned NOT NULL,
  PRIMARY KEY (`status_id`,`member_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `exp_templates`
--

CREATE TABLE IF NOT EXISTS `exp_templates` (
  `template_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_id` int(6) unsigned NOT NULL,
  `template_name` varchar(50) NOT NULL,
  `save_template_file` char(1) NOT NULL DEFAULT 'n',
  `template_type` varchar(16) NOT NULL DEFAULT 'webpage',
  `template_data` mediumtext,
  `template_notes` text,
  `edit_date` int(10) NOT NULL DEFAULT '0',
  `last_author_id` int(10) unsigned NOT NULL DEFAULT '0',
  `cache` char(1) NOT NULL DEFAULT 'n',
  `refresh` int(6) unsigned NOT NULL DEFAULT '0',
  `no_auth_bounce` varchar(50) NOT NULL DEFAULT '',
  `enable_http_auth` char(1) NOT NULL DEFAULT 'n',
  `allow_php` char(1) NOT NULL DEFAULT 'n',
  `php_parse_location` char(1) NOT NULL DEFAULT 'o',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`template_id`),
  KEY `group_id` (`group_id`),
  KEY `template_name` (`template_name`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `exp_templates`
--

INSERT INTO `exp_templates` (`template_id`, `site_id`, `group_id`, `template_name`, `save_template_file`, `template_type`, `template_data`, `template_notes`, `edit_date`, `last_author_id`, `cache`, `refresh`, `no_auth_bounce`, `enable_http_auth`, `allow_php`, `php_parse_location`, `hits`) VALUES
(1, 1, 1, 'index', 'n', 'webpage', '{embed="Site/.header" title="Ughelli Power"}		\n<div id="slide" class="grid_16">\n			{exp:channel:entries channel="homepage_slideshow" disable="categories|member_data|pagination"}\n			<div class="slide">\n				{exp:imgsizer:size src="{slideshow_image}" width="941" height="425"}\n					<img src="{sized}" alt="{title}" width="{width}" height="{height}" />\n				{/exp:imgsizer:size}\n\n				<h1>Ughelli Power, the black start of the national grid </h1>\n			</div>\n			{/exp:channel:entries}\n		</div>\n\n		<div id="news_container" class="grid_16">\n			<h2 class="home_subhead light_blue">News</h2>\n\n			<div id="news">\n				{exp:channel:entries channel="press_release" limit="1" disable="categories|member_data|custom_data"}\n					<div class="news"><a href=''{title_permalink="press-release/view/"}''><h6>{title}</h6></a></div>\n				{/exp:channel:entries}\n			</div>\n		</div>\n\n		<div id="teasers" class="grid_16">\n			<div class="grid_4 teaser alpha">\n				<a href="/about"><img src="assets/img/t_the-black-start.jpg" alt="The black start of the national grid" width="220" height="144" /></a>\n			</div>\n\n			<div class="grid_4 teaser">\n				<img src="assets/img/t_900megawatts-and-counting.jpg" alt="9000 Mega Watts and counting" width="220" height="144" />\n			</div>\n\n			<div class="grid_4 teaser omega">\n				<a href="/plants-facilities"><img src="assets/img/t_generating-power.jpg" alt="Generating Power for millions of Nigerians" width="461" height="144"></a>\n			</div>\n		</div>\n{embed="Site/.footer"}', '', 1366378117, 1, 'n', 0, '', 'n', 'n', 'o', 28055),
(2, 1, 1, '.header', 'n', 'webpage', '<!doctype html>\n<html lang="en">\n<head>\n	<meta charset="UTF-8" />\n	<meta http-equiv="x-ua-compatible" content="IE=edge,chrome=1" />\n	<title>{embed:title}</title>\n   	 <link rel="stylesheet" href="/assets/css/style.css" media="screen" type="text/css" media="screen">\n	<link rel="stylesheet" href="/assets/js/fancybox/jquery.fancybox.css" type="text/css" media="screen">\n	<link rel="shortcut icon" href="/assets/img/favicon.ico" type="image/x-icon">\n	<!--[if lt IE 9]>\n	<script src="/assets/js/html5shiv.js"></script>\n	<![endif]-->\n</head>\n<body>\n	<div class="container_16">\n		<header id="header">\n			<div id="phcn_logo" class="grid_7"><a href="/" title="Ughelli Power Plc">PHCN Ughelli Power PLC</a></div>\n\n			<nav class="grid_9 omega">\n				<ul id="nav">\n					<li><a href="/">Home</a></li>\n\n					<li><a href="/about">About</a></li>\n\n					<li><a href="/plants-facilities">Plants/Facilities</a></li>\n\n					<li><a href="/press-release">Press Release</a></li>\n\n					<li><a href="/safety-policy">Safety Policy</a></li>\n\n					<li><a href="/contact">Contact</a></li>\n				</ul>\n			</nav>\n		</header>', '', 1366349188, 1, 'n', 0, '', 'n', 'n', 'o', 0),
(3, 1, 1, '.footer', 'n', 'webpage', '		<footer class="grid_14">\n			<h6>Copyright &copy; Transcorp Ughelli Power, All rights reserved.</h6>\n			\n			<ul>\n					<li><a href="/">Home</a></li>\n\n					<li><a href="/about">About</a></li>\n\n					<li><a href="/plants-facilities">Plants/Facilities</a></li>\n\n					<li><a href="/safety-policy">Safety Policy</a></li>\n\n					<li><a href="/contact">Contact</a></li>\n				</ul>\n\n		</footer>\n	</div>\n    	<script src="/assets/js/jquery.js"></script>\n	<script src="/assets/js/easing.js"></script>\n	<script src="/assets/js/cycle.js"></script>\n	<script src="/assets/js/mousewheel.js"></script>\n	<script src="/assets/js/fancybox/jquery.fancybox.pack.js"></script>\n	<script type="text/javascript" src="/assets/js/fancybox/helpers/jquery.fancybox-thumbs.js?v=1.0.7"></script>\n	<script src="/assets/js/script.js"></script>\n</body>\n</html>', '', 1389789181, 2, 'n', 0, '', 'n', 'n', 'o', 0),
(4, 1, 1, 'about', 'n', 'webpage', '{embed="Site/.header" title="About Us - Ughelli Power Plc"}\n			<div id="body" class="grid_16">\n			<div id="wrapper" class="grid_14 prefix_1 suffix_1">\n				<h1 class="heading">About Us</h1>\n		\n				<div class="grid_6 alpha">\n					<img src="assets/img/ughelli-gas-turbine.jpg" alt="Ughelli Gas Turbine">\n\n					<p class="emphasis_light">Gas Turbine Station located at Kilometer 15, to Ughelli Town, along Warri/Ughelli to Patani route</p>\n				</div>				\n				\n				<div class="grid_7">\n					<h2 class="subhead bigger clearfix">Ughelli Power makes life easier for millions of Nigerians, by generating up to 900MW of eletricity, thereby contributing its quota in actualizing the goal that Nigerians enjoy cheap and constant power supply.</h2>\n\n					<div class="line">&nbsp;</div>\n					<h2 class="subhead_dark">\n						Vision\n					</h2>\n\n					<p>\n						To be the best in generation of reliable, stable and high quality eletricity within the Nigerian domain.\n					</p>\n\n					<h2 class="subhead_dark">\n						Mission\n					</h2>\n\n					<p>\n						To generate stable eletricity efficiently; at the most competitive cost through team work, while partnering with the community and the environment\n					</p>\n				</div>\n				\n				<div class="grid_14 line alpha">&nbsp;</div>\n\n				<div class="grid_9">\n					<h2 class="subhead_dark">\n						Historical Perspective\n					</h2>\n\n					<p>Ughelli power is among the 18 eletricity successor comapnies unbundled from Power Holding Company of Nigeria (PHCN) in 2003. Owing to various changes in the Federal Government policies on the electricity industry from 1973 to 2009, Ughelli Power Plc has on various occasions changed its name and out-look.</p>\n\n					<p>	The station was built in 1964 with an installed capacity of 2X36MW or 72MW from two Stal-Laval gas turbines. Then the station was called Electricity Corporation of Nigeria (ECN).</p>\n\n					<p>In 1975 six units of gas turbines (20MW each) were installed in the station, after the merger of Niger Dam Authority, Kainji and the Electricity Corporation of Nigeria, Ijora, Delta (Ughelli) and Afam: the Coal Corporation Power Station at Oji and Thermal Station (Diesel) under the public works Department, Kaduna, in 1972 to form the National Electric Power Authority (NEPA).</p>\n\n					<p>In 1978 additional six units of GE gas turbines, like the ones installed in 1975, were added to Delta Power Station to boost the installed capacity to total of 312MW, as follows:</p>\n\n					<p>\n						Delta I, 2 X 36 &thinsp; &thinsp; &thinsp;72MW <br />\n						Delta II, 6 X 20&thinsp; &thinsp; &thinsp;120MW <br />\n						Delta III, 6 X 20&thinsp; &thinsp;&thinsp;120MW </br />\n						<strong>Total &thinsp; &thinsp;&thinsp;&thinsp; &thinsp; &thinsp; &thinsp; &thinsp; &thinsp; &thinsp; &thinsp; 312MW</strong>\n					</p>\n\n					<p>The station was upgraded in 1991 with the addition of 6 X 100 = 600MW (GE) gas turbines.</p>\n\n					<p>From 2000 to 2008 Delta II and Delta III GE units were upgraded to 150MW station each: built by Marubeni of Japan. The control systems were upgraded to Mark V, a fully computerized control system: for Delta II and III. While Delta I is scrapped.</p>\n\n					<p>Delta IV control system was also upgraded to Mark V by GE of USA which built the station.</p>\n\n					<p>Today, the generation capacity of Ughelli Power stands at 900MW with the Delta II, III & IV running at full capacity. Most of the electricity producted by Ughelli is transported through a network of conductors, to the national grid.</p>\n				</div>\n\n				<div id="quick_facts" class="grid_4 omega">\n					<h1 class="subhead_dark bigger">Quick Facts</h1>\n\n					<h3 class="line">&nbsp;</h3>\n\n					<ul class="list border_bottom">\n						<li>Over 49years of Service</li>\n\n						<li>Ughelli Power, has four (4) power plants, Delta I, Delta II, Delta III &amp; Delta IV with the Delta I retired.</li>\n\n						<li>Ughelli power contributes about 900MW to the National Grid</li>\n\n						<li>Custom fitted engine starters in Delta II and Delta III turbines enables the station to black start the national grid in case of emergency or cases of total </li>\n\n						<li>Ughelli power provides auxillary facilities for staff, such as: Staff Housing, Medicare, School and Recreational Club.</li>\n					</ul>\n				</div>\n			</div>\n		</div>\n{embed="Site/.footer"}', '', 1365706973, 1, 'n', 0, '', 'n', 'n', 'o', 64),
(6, 1, 1, 'safety-policy', 'n', 'webpage', '{embed="Site/.header" title="Safety Policy - Ughelli Power"}		\n	 	<div id="body" class="grid_16">\n			<div id="wrapper" class="grid_14 prefix_1 suffix_1">\n				<h1 class="heading">Safety Policy</h1>\n\n				<h2 class="grid_10 subhead bigger clearfix">Please use the contact form below to contact us, or you can reach us via our office addresss and phone numbers</h2>\n\n				<div class="grid_11">\n					<p><strong>At Ughelli power, we recognize the value of safe and reliable operations and believe that our success is directly linked to the safety of our employees and the public.</strong></p>\n\n					<p>We  meet this challenge by promoting a safety culture wherein full compliance with safety regulations is the minimum level of acceptable performance. Doing so, requires a disciplined approach to safety, including governing adherence to standards that clearly communicates safety expectations, employee safety programs that meet and exceed these expecations. </p>\n\n					<p>In compliance with our safety measures, we have put in place emergency measures, when all efforts fails. These includes an antifire system with sprinklers and hydrant fire fighting system with flame detector for fighting fire emergency. Also, a medical care center is located in the plant premises, for quick response in case of medical emergency.</p>\n\n					<p>Our host communities are also not left out from these safety measures, we continually educate people on how to observe safety measures around our installations and what to do in cases of emergency.</p>\n\n					<h2 class="subhead_dark">Electrical Safety tips</h2>\n\n					<ul class="list">\n						<li><strong>Keep away from transformers.</strong></li>\n\n						<li><strong>Never attempt to open the door of one of these transformers.</strong> If you find a door unlocked, call the nearest PHCN service station.</li>\n\n						<li><strong>Look up!</strong> Always examine your surroundings for power line locations before doing any outside work.</li>\n\n						<li><strong>Be cautious on the roof.</strong> Working on a roof may put you close to an overhead power line. Avoid standing up and accidentally touching a line with your head or shoulder.</li>\n\n						<li><strong>Do not plant vegetation</strong> to grow up or near utility poles or live wires.</li>\n\n						<li><strong>Be aware when moving farm equipment.</strong> Stay clear of overhead power lines when moving or storing farm equipments. Metals and wet objects conduct eletricity.</li>\n\n						<li><strong>Do not throw objects up into power lines.</strong> This can cause short circuits and could result in injuries. This includes items you might not consider conductive, like ropes and strings</li>\n\n						<li><strong>See something tangled in a power line? Stay clear.</strong> Never attempt to move an object from a power line yourself. Never climb the pole. Call any PHCN service station - they can help</li>\n\n						<li><strong>Never touch a downed power line.</strong> If you see a downed power line, contact your local PHCN service station immediately. Don’t touch the line or anything that is in contact with it. Don’t attempt to move the line. Keep others away, and consider every wire on the ground to be energized and dangerous.</li>\n\n						<li><strong>Obey warning signs.</strong> “DANGER: HIGH VOLTAGE” and other warning signs are posted in some locations. But remember, all electrical equipment can be dangerous.</li>\n\n						<li><strong>Substations are not playgrounds.</strong> At neighborhood substations, high-voltage electricity is reduced to be sent to homes. Don''t climb over or crawl under substation fences, walls or gates. If a ball or toy goes over a fence and into a substation, call the nearest PHCN office. We will come and get it out for you.</li>\n\n						<li><strong>Stay inside during storms.</strong> When there is lightning outdoors, get inside a building or car if possible. Keep away from windows and open doors</li>\n					</ul>\n				</div>\n\n			</div>\n		</div>\n{embed="Site/.footer"}', '', 1366346796, 1, 'n', 0, '', 'n', 'n', 'o', 37),
(7, 1, 1, 'plants-facilities', 'n', 'webpage', '{embed="Site/.header" title="Plants Facilities"}		\n		{exp:channel:entries limit="1"}\n			{plant_content}\n	\n		<div class="grid_13 prefix_1">				\n{plant_images}		\n			{exp:imgsizer:size src="{plant_image}" width="160" height="122"}\n			<a href="{plant_image}" class="fancybox-thumb" rel="fancybox-thumb" title="{plant_title}">\n				<img src="{sized}" alt="{plant_title}" width="{width}" height="{height}">\n			</a>\n			{/exp:imgsizer:size}\n		{/plant_images}\n		</div>\n\n		{/exp:channel:entries}\n{embed="Site/.footer"}', '', 1389598689, 2, 'n', 0, '', 'n', 'n', 'o', 5741),
(8, 1, 1, 'news-press-release', 'n', 'webpage', '', NULL, 1365765100, 1, 'n', 0, '', 'n', 'n', 'o', 0),
(9, 1, 1, 'press-release', 'n', 'webpage', '{embed="Site/.header" title="Press Release - Ughelli Power"}\n		<div id="body" class="grid_16">\n			<div id="wrapper" class="grid_14 prefix_1 suffix_1">\n				<h1 class="heading">News/Press Release</h1>\n				\n				{exp:channel:entries channel="press_release" orderby="date" disable="categories|member_data"}\n				<div class="press_release grid_13">\n					<h3>{entry_date format="%j%S %F %Y"}</h3>\n\n					<h2 class="subhead_dark bigger">{title}</h2>\n\n						{content}\n\n					<a href=''{title_permalink="press-release/view"}''><h4>Read more &rarr;</h4></a>\n				</div>\n				{/exp:channel:entries}\n		</div>\n	</div>\n{embed="Site/.footer"}', '', 1366338737, 1, 'y', 0, '', 'n', 'n', 'o', 9937),
(10, 1, 1, '.general_content', 'n', 'webpage', '{embed="Site/.header" title="Ughelli Power"}		\n	{exp:channel:entries limit="1" disable="member_data|pagination|categories"}\n		{general_content}\n	{/exp:channel:entries}\n{embed="Site/.footer"}', '', 1366341706, 1, 'y', 0, '', 'n', 'n', 'o', 9717),
(11, 1, 2, 'index', 'n', 'webpage', '{embed="Site/.header" title="Contact Us - Ughelli Power Plc"}\n			<div id="body" class="grid_16 alternate_bg">\n			<div id="wrapper" class="grid_14 prefix_1 suffix_1">\n				<h1 class="heading">Contact Us</h1>\n\n				<p class="contact_summary grid_10 clearfix"><strong>Please use the contact form below to contact us, or you can reach us via our office addresss and phone numbers</strong></p>\n\n				<div class="line grid_14 alpha">\n					&nbsp;\n				</div>\n				\n				<div class="grid_7 alpha">\n					<h2 class="subhead_dark">\n						Contact Form\n					</h2>\n					\n					{exp:freeform:form \n	form_name="contact"\n	return="contact/thankyou"\n	required="name|email|message"\n	notify="info@transcorpughelli.com​"\n	reply_to="yes" \n	reply_to_name_field="name" \n	reply_to_email_field="email" \n	template="contact_template"\n	form:id="form_contact"\n}\n						<form action="http://www.ughellipower.com" method="post" id="form_contact">\n  <ul id="contact_form"><li>Name</li><li><input type="text" name="name" id="form_name"><div class="form_error"></div></li><li>Email</li><li><input type="text" name="email" id="form_email"><div class="form_error"></div></li><li>Subject</li><li><input type="text" name="subject"><div class="form_error"></div></li><li>Message</li><li><textarea name="message" id="form_message" cols="30" rows="10"></textarea><div class="form_error"></div></li><li><input type="submit" value="submit" name="submit" class="submit"></li></ul>\n{/exp:freeform:form}\n				</div>\n\n				{exp:channel:entries limit="1" channel="contact"}\n				<div class="grid_7 omega">\n					<h2 class="subhead_dark">\n						Quick Contact\n					</h2>\n\n					{contact}\n\n					<p>\n						<span class="social_media">\n							<a href="{facebook_link}"><img src="/assets/img/facebook.jpg" alt="Ughelli Power on facebook" width="50" height="50"></a>\n						</span>\n\n						<span class="social_media">\n							<a href="{twitter_link}"><img src="/assets/img/twitter.jpg" alt="Ughelli Power on twitter" width="50" height="50"></a>\n						</span>\n					</p>\n				</div>\n				{/exp:channel:entries}\n			</div>\n		</div>\n{embed="Site/.footer"}', '', 1389791294, 2, 'n', 0, '', 'n', 'n', 'o', 3252),
(12, 1, 2, 'thankyou', 'n', 'webpage', '{embed="Site/.header" title="Contact Us - Ughelli Power Plc"}\n			<div id="body" class="grid_16 alternate_bg">\n			<div id="wrapper" class="grid_14 prefix_1 suffix_1">\n				<h1 class="heading">Contact Us</h1>\n\n				<p class="contact_summary grid_10 clearfix"><strong>Thank you contacting us, your message has been received. If we need to contact you, we will do that in the shortest time possible.</strong></p>\n\n				<div class="line grid_14 alpha">\n					&nbsp;\n				</div>\n			</div>\n		</div>\n{embed="Site/.footer"}', '', 1389788630, 2, 'n', 0, '', 'n', 'n', 'o', 138);

-- --------------------------------------------------------

--
-- Table structure for table `exp_template_groups`
--

CREATE TABLE IF NOT EXISTS `exp_template_groups` (
  `group_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_name` varchar(50) NOT NULL,
  `group_order` int(3) unsigned NOT NULL,
  `is_site_default` char(1) NOT NULL DEFAULT 'n',
  PRIMARY KEY (`group_id`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `exp_template_groups`
--

INSERT INTO `exp_template_groups` (`group_id`, `site_id`, `group_name`, `group_order`, `is_site_default`) VALUES
(1, 1, 'Site', 1, 'y'),
(2, 1, 'contact', 2, 'n');

-- --------------------------------------------------------

--
-- Table structure for table `exp_template_member_groups`
--

CREATE TABLE IF NOT EXISTS `exp_template_member_groups` (
  `group_id` smallint(4) unsigned NOT NULL,
  `template_group_id` mediumint(5) unsigned NOT NULL,
  PRIMARY KEY (`group_id`,`template_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `exp_template_member_groups`
--

INSERT INTO `exp_template_member_groups` (`group_id`, `template_group_id`) VALUES
(6, 1),
(6, 2);

-- --------------------------------------------------------

--
-- Table structure for table `exp_template_no_access`
--

CREATE TABLE IF NOT EXISTS `exp_template_no_access` (
  `template_id` int(6) unsigned NOT NULL,
  `member_group` smallint(4) unsigned NOT NULL,
  PRIMARY KEY (`template_id`,`member_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `exp_throttle`
--

CREATE TABLE IF NOT EXISTS `exp_throttle` (
  `throttle_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  `hits` int(10) unsigned NOT NULL,
  `locked_out` char(1) NOT NULL DEFAULT 'n',
  PRIMARY KEY (`throttle_id`),
  KEY `ip_address` (`ip_address`),
  KEY `last_activity` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_upload_no_access`
--

CREATE TABLE IF NOT EXISTS `exp_upload_no_access` (
  `upload_id` int(6) unsigned NOT NULL,
  `upload_loc` varchar(3) NOT NULL,
  `member_group` smallint(4) unsigned NOT NULL,
  PRIMARY KEY (`upload_id`,`member_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `exp_upload_prefs`
--

CREATE TABLE IF NOT EXISTS `exp_upload_prefs` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `name` varchar(50) NOT NULL,
  `server_path` varchar(255) NOT NULL DEFAULT '',
  `url` varchar(100) NOT NULL,
  `allowed_types` varchar(3) NOT NULL DEFAULT 'img',
  `max_size` varchar(16) DEFAULT NULL,
  `max_height` varchar(6) DEFAULT NULL,
  `max_width` varchar(6) DEFAULT NULL,
  `properties` varchar(120) DEFAULT NULL,
  `pre_format` varchar(120) DEFAULT NULL,
  `post_format` varchar(120) DEFAULT NULL,
  `file_properties` varchar(120) DEFAULT NULL,
  `file_pre_format` varchar(120) DEFAULT NULL,
  `file_post_format` varchar(120) DEFAULT NULL,
  `cat_group` varchar(255) DEFAULT NULL,
  `batch_location` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `exp_upload_prefs`
--

INSERT INTO `exp_upload_prefs` (`id`, `site_id`, `name`, `server_path`, `url`, `allowed_types`, `max_size`, `max_height`, `max_width`, `properties`, `pre_format`, `post_format`, `file_properties`, `file_pre_format`, `file_post_format`, `cat_group`, `batch_location`) VALUES
(1, 1, 'Site Images', '/home4/ughellip/public_html/images/site-images/', 'http://www.ughellipower.com/images/site-images/', 'img', '', '', '', '', '', '', '', '', '', '', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `exp_wygwam_configs`
--

CREATE TABLE IF NOT EXISTS `exp_wygwam_configs` (
  `config_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `config_name` varchar(32) DEFAULT NULL,
  `settings` text,
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `exp_wygwam_configs`
--

INSERT INTO `exp_wygwam_configs` (`config_id`, `config_name`, `settings`) VALUES
(1, 'Basic', 'YTo1OntzOjc6InRvb2xiYXIiO2E6MTA6e2k6MDtzOjQ6IkJvbGQiO2k6MTtzOjY6Ikl0YWxpYyI7aToyO3M6OToiVW5kZXJsaW5lIjtpOjM7czo2OiJTdHJpa2UiO2k6NDtzOjEyOiJOdW1iZXJlZExpc3QiO2k6NTtzOjEyOiJCdWxsZXRlZExpc3QiO2k6NjtzOjQ6IkxpbmsiO2k6NztzOjY6IlVubGluayI7aTo4O3M6NjoiQW5jaG9yIjtpOjk7czo1OiJBYm91dCI7fXM6NjoiaGVpZ2h0IjtpOjIwMDtzOjE0OiJyZXNpemVfZW5hYmxlZCI7czoxOiJ5IjtzOjExOiJjb250ZW50c0NzcyI7YTowOnt9czoxMDoidXBsb2FkX2RpciI7czowOiIiO30='),
(2, 'Full', 'YTo1OntzOjc6InRvb2xiYXIiO2E6NjQ6e2k6MDtzOjY6IlNvdXJjZSI7aToxO3M6NDoiU2F2ZSI7aToyO3M6NzoiTmV3UGFnZSI7aTozO3M6NzoiUHJldmlldyI7aTo0O3M6OToiVGVtcGxhdGVzIjtpOjU7czozOiJDdXQiO2k6NjtzOjQ6IkNvcHkiO2k6NztzOjU6IlBhc3RlIjtpOjg7czo5OiJQYXN0ZVRleHQiO2k6OTtzOjEzOiJQYXN0ZUZyb21Xb3JkIjtpOjEwO3M6NToiUHJpbnQiO2k6MTE7czoxMjoiU3BlbGxDaGVja2VyIjtpOjEyO3M6NToiU2NheXQiO2k6MTM7czo0OiJVbmRvIjtpOjE0O3M6NDoiUmVkbyI7aToxNTtzOjQ6IkZpbmQiO2k6MTY7czo3OiJSZXBsYWNlIjtpOjE3O3M6OToiU2VsZWN0QWxsIjtpOjE4O3M6MTI6IlJlbW92ZUZvcm1hdCI7aToxOTtzOjQ6IkZvcm0iO2k6MjA7czo4OiJDaGVja2JveCI7aToyMTtzOjU6IlJhZGlvIjtpOjIyO3M6OToiVGV4dEZpZWxkIjtpOjIzO3M6ODoiVGV4dGFyZWEiO2k6MjQ7czo2OiJTZWxlY3QiO2k6MjU7czo2OiJCdXR0b24iO2k6MjY7czoxMToiSW1hZ2VCdXR0b24iO2k6Mjc7czoxMToiSGlkZGVuRmllbGQiO2k6Mjg7czoxOiIvIjtpOjI5O3M6NDoiQm9sZCI7aTozMDtzOjY6Ikl0YWxpYyI7aTozMTtzOjk6IlVuZGVybGluZSI7aTozMjtzOjY6IlN0cmlrZSI7aTozMztzOjk6IlN1YnNjcmlwdCI7aTozNDtzOjExOiJTdXBlcnNjcmlwdCI7aTozNTtzOjEyOiJOdW1iZXJlZExpc3QiO2k6MzY7czoxMjoiQnVsbGV0ZWRMaXN0IjtpOjM3O3M6NzoiT3V0ZGVudCI7aTozODtzOjY6IkluZGVudCI7aTozOTtzOjEwOiJCbG9ja3F1b3RlIjtpOjQwO3M6MTE6Ikp1c3RpZnlMZWZ0IjtpOjQxO3M6MTM6Ikp1c3RpZnlDZW50ZXIiO2k6NDI7czoxMjoiSnVzdGlmeVJpZ2h0IjtpOjQzO3M6MTI6Ikp1c3RpZnlCbG9jayI7aTo0NDtzOjQ6IkxpbmsiO2k6NDU7czo2OiJVbmxpbmsiO2k6NDY7czo2OiJBbmNob3IiO2k6NDc7czo1OiJJbWFnZSI7aTo0ODtzOjU6IkZsYXNoIjtpOjQ5O3M6NToiVGFibGUiO2k6NTA7czoxNDoiSG9yaXpvbnRhbFJ1bGUiO2k6NTE7czo2OiJTbWlsZXkiO2k6NTI7czoxMToiU3BlY2lhbENoYXIiO2k6NTM7czo5OiJQYWdlQnJlYWsiO2k6NTQ7czoxOiIvIjtpOjU1O3M6NjoiU3R5bGVzIjtpOjU2O3M6NjoiRm9ybWF0IjtpOjU3O3M6NDoiRm9udCI7aTo1ODtzOjg6IkZvbnRTaXplIjtpOjU5O3M6OToiVGV4dENvbG9yIjtpOjYwO3M6NzoiQkdDb2xvciI7aTo2MTtzOjg6Ik1heGltaXplIjtpOjYyO3M6MTA6IlNob3dCbG9ja3MiO2k6NjM7czo1OiJBYm91dCI7fXM6NjoiaGVpZ2h0IjtpOjIwMDtzOjE0OiJyZXNpemVfZW5hYmxlZCI7czoxOiJ5IjtzOjExOiJjb250ZW50c0NzcyI7YTowOnt9czoxMDoidXBsb2FkX2RpciI7czowOiIiO30='),
(3, 'For site', 'YTo1OntzOjc6InRvb2xiYXIiO2E6NDQ6e2k6MDtzOjY6IlNvdXJjZSI7aToxO3M6NDoiU2F2ZSI7aToyO3M6NzoiTmV3UGFnZSI7aTozO3M6NzoiUHJldmlldyI7aTo0O3M6OToiVGVtcGxhdGVzIjtpOjU7czozOiJDdXQiO2k6NjtzOjQ6IkNvcHkiO2k6NztzOjU6IlBhc3RlIjtpOjg7czo5OiJQYXN0ZVRleHQiO2k6OTtzOjEzOiJQYXN0ZUZyb21Xb3JkIjtpOjEwO3M6NToiUHJpbnQiO2k6MTE7czoxMjoiU3BlbGxDaGVja2VyIjtpOjEyO3M6NToiU2NheXQiO2k6MTM7czo0OiJVbmRvIjtpOjE0O3M6NDoiUmVkbyI7aToxNTtzOjQ6IkZpbmQiO2k6MTY7czo3OiJSZXBsYWNlIjtpOjE3O3M6NDoiQm9sZCI7aToxODtzOjY6Ikl0YWxpYyI7aToxOTtzOjk6IlVuZGVybGluZSI7aToyMDtzOjY6IlN0cmlrZSI7aToyMTtzOjk6IlN1YnNjcmlwdCI7aToyMjtzOjExOiJTdXBlcnNjcmlwdCI7aToyMztzOjEyOiJOdW1iZXJlZExpc3QiO2k6MjQ7czoxMjoiQnVsbGV0ZWRMaXN0IjtpOjI1O3M6NzoiT3V0ZGVudCI7aToyNjtzOjY6IkluZGVudCI7aToyNztzOjEwOiJCbG9ja3F1b3RlIjtpOjI4O3M6MTE6Ikp1c3RpZnlMZWZ0IjtpOjI5O3M6MTM6Ikp1c3RpZnlDZW50ZXIiO2k6MzA7czoxMjoiSnVzdGlmeVJpZ2h0IjtpOjMxO3M6MTI6Ikp1c3RpZnlCbG9jayI7aTozMjtzOjQ6IkxpbmsiO2k6MzM7czo2OiJVbmxpbmsiO2k6MzQ7czo2OiJBbmNob3IiO2k6MzU7czo1OiJJbWFnZSI7aTozNjtzOjU6IkZsYXNoIjtpOjM3O3M6NToiVGFibGUiO2k6Mzg7czoxNDoiSG9yaXpvbnRhbFJ1bGUiO2k6Mzk7czo2OiJTbWlsZXkiO2k6NDA7czoxMToiU3BlY2lhbENoYXIiO2k6NDE7czo5OiJQYWdlQnJlYWsiO2k6NDI7czoxOiIvIjtpOjQzO3M6MToiLyI7fXM6NjoiaGVpZ2h0IjtzOjM6IjUwMCI7czoxNDoicmVzaXplX2VuYWJsZWQiO3M6MToieSI7czoxMToiY29udGVudHNDc3MiO2E6MTp7aTowO3M6NDg6Imh0dHA6Ly93d3cudWdoZWxsaXBvd2VyLmNvbS9hc3NldHMvY3NzL3N0eWxlLmNzcyI7fXM6MTA6InVwbG9hZF9kaXIiO3M6MToiMSI7fQ==');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
