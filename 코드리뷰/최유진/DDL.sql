DROP DATABASE IF EXISTS SEMI;
CREATE DATABASE SEMI;
USE SEMI;

DROP TABLE IF EXISTS `member`;

CREATE TABLE `member` (
	`me_id`	varchar(10)	NOT NULL PRIMARY KEY,
	`me_le_name`	varchar(3)	NOT NULL,
	`me_pw`	varchar(255)	NOT NULL,
	`me_name`	varchar(20)	NOT NULL,
	`me_address`	varchar(100)	NOT NULL,
	`me_phone`	char(13)	NOT NULL,
	`me_total_price`	int	NOT NULL DEFAULT 0,
	`me_authority`	varchar(5)	NOT NULL DEFAULT 'USER',
	`me_point`	int	NOT NULL DEFAULT 0
);

DROP TABLE IF EXISTS `branch`;

CREATE TABLE `branch` (
	`br_num`	int	NOT NULL PRIMARY KEY AUTO_INCREMENT,
	`br_name`	varchar(5)	NOT NULL,
	`br_phone`	char(13)	NOT NULL,
	`br_lo_num`	int	NOT NULL
);

DROP TABLE IF EXISTS `dog`;

CREATE TABLE `dog` (
	`d_num`	varchar(13)	NOT NULL PRIMARY KEY,
	`d_name`	varchar(20) NOT	NULL,
	`d_age`	char(2)	NOT NULL,
	`d_gen`	char(1)	NOT NULL,
	`d_kg`	int	NOT NULL DEFAULT 0,
	`d_detail`	varchar(50)	NULL,
	`d_me_id`	varchar(10)	NOT NULL,
	`d_si_name`	varchar(6)	NOT NULL
);

DROP TABLE IF EXISTS `room`;

CREATE TABLE `room` (
	`ro_num`	int	NOT NULL PRIMARY KEY AUTO_INCREMENT,
	`ro_name`	varchar(10)	NOT NULL,
	`ro_max_cap`	int	NOT NULL,
	`ro_now_cap`	int	NOT NULL DEFAULT 0,
	`ro_br_num`	int	NOT NULL
);

DROP TABLE IF EXISTS `price`;

CREATE TABLE `price` (
	`si_pr_name`	varchar(6)	NOT NULL PRIMARY KEY,
	`pr_price`	int	NOT NULL DEFAULT 30000
);

DROP TABLE IF EXISTS `local`;

CREATE TABLE `local` (
	`lo_num`	int	NOT NULL PRIMARY KEY AUTO_INCREMENT,
	`lo_name`	varchar(5)	NOT NULL
);

DROP TABLE IF EXISTS `reservationList`;

CREATE TABLE `reservationList` (
	`rl_num`	int	NOT NULL PRIMARY KEY AUTO_INCREMENT,
	`rl_d_num`	varchar(13)	NOT NULL,
	`rl_ro_num`	int	NOT NULL,
	`rl_re_num`	int	NOT NULL
);

DROP TABLE IF EXISTS `point`;

CREATE TABLE `point` (
	`po_num`	int	NOT NULL PRIMARY KEY AUTO_INCREMENT,
	`po_point`	int NOT	NULL DEFAULT 0,
	`po_content`	varchar(30)	NOT NULL,
	`po_me_id`	varchar(10)	NOT NULL
);

DROP TABLE IF EXISTS `pay`;

CREATE TABLE `pay` (
	`pa_num`	int	NOT NULL PRIMARY KEY AUTO_INCREMENT,
	`pa_price`	int	NOT NULL,
	`pa_real_price`	int	NOT NULL DEFAULT 0,
	`pa_use_point`	int	NOT NULL DEFAULT 0,
	`pa_add_point`	int	NOT NULL DEFAULT 0,
	`pa_re_num`	int	NOT NULL
);

DROP TABLE IF EXISTS `level`;

CREATE TABLE `level` (
	`le_name`	varchar(3)	NOT NULL PRIMARY KEY DEFAULT 'gen',
	`le_benefit`	int	NOT NULL DEFAULT 5
);

DROP TABLE IF EXISTS `reservation`;

CREATE TABLE `reservation` (
	`re_num`	int	NOT NULL PRIMARY KEY,
	`re_me_id`	varchar(10)	NOT NULL,
	`re_date`	date	NOT NULL,
	`re_stay`	int	NOT NULL DEFAULT 1,
	`re_s_count`	int	NOT NULL DEFAULT 0,
	`re_m_count`	int	NOT NULL DEFAULT 0,
	`re_l_count`	int	NOT NULL DEFAULT 0
);

DROP TABLE IF EXISTS `size`;

CREATE TABLE `size` (
	`si_name`	varchar(6)	NOT NULL PRIMARY KEY,
	`si_min_kg`	int	NOT NULL
);


ALTER TABLE `member` ADD CONSTRAINT `FK_level_TO_member_1` FOREIGN KEY (
	`me_le_name`
)
REFERENCES `level` (
	`le_name`
);

ALTER TABLE `branch` ADD CONSTRAINT `FK_local_TO_branch_1` FOREIGN KEY (
	`br_lo_num`
)
REFERENCES `local` (
	`lo_num`
);

ALTER TABLE `dog` ADD CONSTRAINT `FK_member_TO_dog_1` FOREIGN KEY (
	`d_me_id`
)
REFERENCES `member` (
	`me_id`
);

ALTER TABLE `dog` ADD CONSTRAINT `FK_size_TO_dog_1` FOREIGN KEY (
	`d_si_name`
)
REFERENCES `size` (
	`si_name`
);

ALTER TABLE `room` ADD CONSTRAINT `FK_branch_TO_room_1` FOREIGN KEY (
	`ro_br_num`
)
REFERENCES `branch` (
	`br_num`
);

ALTER TABLE `price` ADD CONSTRAINT `FK_size_TO_price_1` FOREIGN KEY (
	`si_pr_name`
)
REFERENCES `size` (
	`si_name`
);

ALTER TABLE `reservationList` ADD CONSTRAINT `FK_dog_TO_reservationList_1` FOREIGN KEY (
	`rl_d_num`
)
REFERENCES `dog` (
	`d_num`
);

ALTER TABLE `reservationList` ADD CONSTRAINT `FK_room_TO_reservationList_1` FOREIGN KEY (
	`rl_ro_num`
)
REFERENCES `room` (
	`ro_num`
);

ALTER TABLE `reservationList` ADD CONSTRAINT `FK_reservation_TO_reservationList_1` FOREIGN KEY (
	`rl_re_num`
)
REFERENCES `reservation` (
	`re_num`
);

ALTER TABLE `point` ADD CONSTRAINT `FK_member_TO_point_1` FOREIGN KEY (
	`po_me_id`
)
REFERENCES `member` (
	`me_id`
);

ALTER TABLE `pay` ADD CONSTRAINT `FK_reservation_TO_pay_1` FOREIGN KEY (
	`pa_re_num`
)
REFERENCES `reservation` (
	`re_num`
);

ALTER TABLE `reservation` ADD CONSTRAINT `FK_member_TO_reservation_1` FOREIGN KEY (
	`re_me_id`
)
REFERENCES `member` (
	`me_id`
);

