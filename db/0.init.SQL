-- generate by woo-1.15,2020.09


-- in_predicate_conversion_threshold = 1000
-- innodb_version = 10.5.12
-- protocol_version = 10
-- slave_type_conversions =
-- system_versioning_alter_history = ERROR
-- system_versioning_asof = DEFAULT
-- tls_version = TLSv1.1,TLSv1.2,TLSv1.3
-- version = 10.5.12-MariaDB-1:10.5.12+maria~focal
-- version_comment = mariadb.org binary distribution
-- version_compile_machine = x86_64
-- version_compile_os = debian-linux-gnu
-- version_malloc_library = system
-- version_source_revision = b5569b62408375f35e2fe851158a7ff17e378ed1
-- version_ssl_library = OpenSSL 1.1.1f  31 Mar 2020
-- wsrep_patch_version = wsrep_26.22



create database if not exists mask;
use mask;

CREATE TABLE `action` (
                          `id` int(11) NOT NULL AUTO_INCREMENT,
                          `member_id` int(11) DEFAULT NULL,
                          `doing` int(11) DEFAULT NULL COMMENT '1小程序登陆，2网站登陆，3发起小程序订单',
                          `bind_id` int(11) DEFAULT NULL COMMENT '绑定的id',
                          `created_at` int(11) DEFAULT NULL,
                          PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='文章表';

insert into `action` (created_at,id,member_id,doing,bind_id)values(1632729458,1,1,1,2);

CREATE TABLE `article` (
                           `id` int(11) NOT NULL AUTO_INCREMENT,
                           `product_channel_id` int(11) DEFAULT NULL,
                           `title` varchar(300) DEFAULT NULL,
                           `member_id` int(11) DEFAULT NULL,
                           `real_member_id` int(11) DEFAULT NULL,
                           `content` text DEFAULT NULL,
                           `descr` varchar(500) DEFAULT NULL,
                           `status` tinyint(4) DEFAULT 0 COMMENT '0 草稿 ， 1 发布',
                           `created_at` int(11) DEFAULT NULL,
                           `refresh_at` int(11) DEFAULT NULL,
                           `updated_at` int(11) DEFAULT 0,
                           `is_virtual` tinyint(1) DEFAULT 0 COMMENT '是否虚拟用户发布',
                           `comment_num` int(11) DEFAULT 0 COMMENT '评论数量',
                           `view_num` int(11) DEFAULT 0 COMMENT '查看次数',
                           PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文章表';

CREATE TABLE `attentions` (
                              `id` int(11) NOT NULL AUTO_INCREMENT,
                              `created_at` int(11) DEFAULT NULL,
                              `updated_at` int(11) DEFAULT NULL,
                              `content` text DEFAULT NULL,
                              `is_watched` tinyint(1) DEFAULT 0,
                              PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `banners` (
                           `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
                           `operator_id` int(11) DEFAULT NULL,
                           `name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                           `image` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                           `url` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                           `created_at` int(11) DEFAULT NULL,
                           `status` int(11) DEFAULT NULL,
                           `rank` int(11) DEFAULT NULL,
                           `type` int(11) DEFAULT NULL,
                           `platforms` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                           `partner_ids` text COLLATE utf8_bin DEFAULT NULL,
                           `material_type` int(11) DEFAULT 0,
                           `material_ids` text COLLATE utf8_bin DEFAULT NULL,
                           `template_id` int(11) DEFAULT NULL,
                           `xcx_url` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                           `product_channel_ids` varchar(511) COLLATE utf8_bin DEFAULT NULL,
                           `app_url` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                           PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

CREATE TABLE `cloud` (
                         `id` int(11) NOT NULL AUTO_INCREMENT,
                         `created_at` int(11) DEFAULT NULL,
                         `vip_expire` int(11) DEFAULT NULL COMMENT 'vip到期时间',
                         `updated_at` int(11) DEFAULT NULL,
                         `member_id` int(11) DEFAULT NULL,
                         `total_size` bigint(20) DEFAULT NULL,
                         `used_size` bigint(20) DEFAULT 0,
                         `remark` varchar(200) DEFAULT NULL,
                         `short_psw` varchar(10) DEFAULT NULL,
                         `short_time_expire_at` int(11) DEFAULT NULL COMMENT '密码输入一次后的有效时间内不需要重复输入短密码',
                         PRIMARY KEY (`id`),
                         UNIQUE KEY `cloud_member_id_uindex` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `cloud_file` (
                              `id` int(11) NOT NULL AUTO_INCREMENT,
                              `pid` int(11) DEFAULT 0 COMMENT '所属目录id',
                              `refer_id` int(11) DEFAULT NULL COMMENT '引用id，md5一致引用即可',
                              `created_at` int(11) DEFAULT NULL,
                              `updated_at` int(11) DEFAULT NULL,
                              `member_id` int(11) DEFAULT NULL,
                              `folder` varchar(500) DEFAULT NULL COMMENT '文件所在目录',
                              `name` varchar(500) CHARACTER SET utf8mb4 DEFAULT NULL,
                              `md5` varchar(50) DEFAULT NULL,
                              `file_created_at` int(11) DEFAULT NULL,
                              `file_updated_at` int(11) DEFAULT NULL,
                              `share_uri` varchar(100) DEFAULT NULL COMMENT '分享地址 有则可以分享',
                              `share_expire` int(11) DEFAULT NULL COMMENT '分享到期时间',
                              `share_psw` varchar(20) DEFAULT NULL,
                              `mime` varchar(50) DEFAULT NULL,
                              `real_size` bigint(20) DEFAULT 0,
                              `size` bigint(20) DEFAULT 64000 COMMENT '用于计算用户文件总大小的尺寸，默认64k',
                              `is_folder` tinyint(1) DEFAULT 0,
                              `download_times` int(11) DEFAULT NULL,
                              `is_for_refer` tinyint(4) DEFAULT 0 COMMENT '文件被删除后，如果被引用，那么开启此开关',
                              PRIMARY KEY (`id`),
                              KEY `cloud_file_md5_index` (`md5`),
                              KEY `cloud_file_member_id_folder_is_folder_index` (`member_id`,`folder`,`is_folder`),
                              KEY `cloud_file_pid_index` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='用户云文件表';

CREATE TABLE `cloud_file_history` (
                                      `id` int(11) NOT NULL AUTO_INCREMENT,
                                      `created_at` int(11) DEFAULT NULL,
                                      `member_id` int(11) DEFAULT NULL,
                                      `file_id` int(11) DEFAULT NULL,
                                      `remark` varchar(200) DEFAULT NULL,
                                      `type` bit(1) DEFAULT NULL COMMENT '1添加 2删除 3重命名',
                                      PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `codes` (
                         `id` int(11) NOT NULL AUTO_INCREMENT,
                         `title` varchar(500) NOT NULL,
                         `created_at` int(11) DEFAULT NULL,
                         `updated_at` int(11) DEFAULT 0,
                         `member_id` int(11) NOT NULL,
                         `is_private` tinyint(1) DEFAULT 0,
                         `content_all` text DEFAULT NULL,
                         `content_windows` text DEFAULT NULL,
                         `content_drawin` text DEFAULT NULL,
                         `content_linux` text DEFAULT NULL,
                         `status` tinyint(4) DEFAULT 0,
                         `source` tinyint(4) DEFAULT 0 COMMENT '0 自己撰写，1 github， 2 gitee',
                         `use_cli` tinyint(1) DEFAULT 0 COMMENT '是否使用cli命令行执行',
                         `platform` varchar(30) DEFAULT NULL COMMENT '1 全部平台 2 linux 3 mac 4 linux&mac',
                         `alias` varchar(50) DEFAULT NULL,
                         `language` varchar(30) DEFAULT NULL,
                         `remark` tinytext DEFAULT NULL,
                         PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `comment_article` (
                                   `id` int(11) NOT NULL AUTO_INCREMENT,
                                   `parent_id` int(11) DEFAULT 0 COMMENT '评论的父id（父评论id）',
                                   `reply_member_id` int(11) DEFAULT NULL COMMENT '被回复的人的id',
                                   `created_at` int(11) DEFAULT NULL,
                                   `content` tinytext CHARACTER SET utf8mb4 DEFAULT NULL,
                                   `member_id` int(11) DEFAULT NULL COMMENT '发表评论的人的id',
                                   `real_member_id` int(11) DEFAULT NULL COMMENT '真正发表人id（用做虚拟用户的时候使用）',
                                   `is_virtual` tinyint(1) DEFAULT 0,
                                   `article_id` int(11) DEFAULT NULL,
                                   `like_num` int(11) DEFAULT 0,
                                   `sub_comment_num` int(11) DEFAULT 0,
                                   PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `comment_code` (
                                `id` int(11) NOT NULL AUTO_INCREMENT,
                                `created_at` int(11) DEFAULT NULL,
                                `content` tinytext CHARACTER SET utf8mb4 DEFAULT NULL,
                                `member_id` int(11) DEFAULT NULL,
                                `real_member_id` int(11) DEFAULT NULL,
                                `is_virtual` tinyint(1) DEFAULT 0,
                                PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `covers` (
                          `id` int(11) NOT NULL AUTO_INCREMENT,
                          `created_at` int(11) DEFAULT NULL,
                          `updated_at` int(11) DEFAULT NULL,
                          `title` varchar(200) CHARACTER SET utf8mb4 DEFAULT NULL,
                          `descr` varchar(500) CHARACTER SET utf8mb4 DEFAULT NULL,
                          `path` varchar(200) DEFAULT NULL,
                          `member_id` int(11) DEFAULT NULL,
                          `type` int(11) DEFAULT NULL,
                          `status` int(11) DEFAULT 0,
                          `md5` varchar(32) DEFAULT NULL,
                          `tags` varchar(300) DEFAULT NULL,
                          PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='登陆封面';

CREATE TABLE `device` (
                          `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
                          `platform` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT 'windows drawin linux',
                          `version_code` int(11) DEFAULT NULL,
                          `version_name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                          `sid` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                          `member_id` int(11) DEFAULT NULL COMMENT '当前设备最后一个登录的member_id',
                          `reg_num` int(11) DEFAULT NULL,
                          `status` int(11) DEFAULT 1 COMMENT '1 正常，0 禁封',
                          `ip` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                          `created_at` int(11) DEFAULT NULL,
                          `device_no` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                          `last_at` int(11) DEFAULT NULL,
                          `latitude` decimal(11,8) DEFAULT NULL,
                          `longitude` decimal(11,8) DEFAULT NULL,
                          `net` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                          PRIMARY KEY (`id`),
                          UNIQUE KEY `device_pk` (`device_no`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


CREATE TABLE `favorite` (
                            `id` int(11) NOT NULL AUTO_INCREMENT,
                            `created_at` int(11) DEFAULT NULL,
                            `title` int(11) DEFAULT NULL,
                            `content` int(11) DEFAULT NULL,
                            `updated_at` int(11) DEFAULT NULL,
                            `files` varchar(200) DEFAULT NULL,
                            PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `feed_back` (
                             `id` int(11) NOT NULL AUTO_INCREMENT,
                             `created_at` int(11) DEFAULT NULL,
                             `member_id` int(11) DEFAULT NULL,
                             `content` int(11) DEFAULT NULL,
                             `type` varchar(30) DEFAULT NULL,
                             PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `file` (
                        `id` int(11) NOT NULL AUTO_INCREMENT,
                        `user_id` int(11) DEFAULT NULL COMMENT '用户id',
                        `md5` int(11) DEFAULT NULL COMMENT '公司id',
                        `type` int(11) DEFAULT 1 COMMENT '0图片',
                        `created_at` int(11) DEFAULT NULL,
                        PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='用户上传的图片保存表';

CREATE TABLE `im_msg` (
                          `id` int(11) NOT NULL AUTO_INCREMENT,
                          `member_id` int(11) NOT NULL,
                          `receiver_id` int(11) NOT NULL,
                          `created_at` int(11) DEFAULT NULL,
                          `content` int(11) NOT NULL,
                          `is_read` tinyint(1) DEFAULT 0,
                          PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `mask_obj` (
                            `id` int(11) NOT NULL AUTO_INCREMENT,
                            `created_at` int(11) DEFAULT NULL,
                            `updated_at` int(11) DEFAULT NULL,
                            `operator_id` int(11) DEFAULT NULL,
                            `font_path` varchar(100) DEFAULT NULL,
                            `back_path` varchar(100) DEFAULT NULL,
                            `side_line_path` varchar(100) DEFAULT NULL,
                            `status` int(11) DEFAULT NULL,
                            `type` int(11) DEFAULT NULL COMMENT '0 成人口罩模型，1 小孩口罩模型',
                            PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;


CREATE TABLE `mask_pic` (
                            `id` int(11) NOT NULL AUTO_INCREMENT,
                            `path` varchar(500) DEFAULT NULL,
                            `updated_at` int(11) DEFAULT NULL,
                            `created_at` int(11) DEFAULT NULL,
                            `status` int(11) DEFAULT 0 COMMENT '0 无效，1 有效',
                            `md5` varchar(32) DEFAULT NULL,
                            PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;


CREATE TABLE `mb_history` (
                              `id` int(11) NOT NULL AUTO_INCREMENT,
                              `mb` decimal(11,6) DEFAULT 0.000000 COMMENT '用户剩余资产（字节）1024b*1024b*1024b=1GB',
                              `type` int(11) DEFAULT NULL COMMENT '记录交易类型 1 充值 2 他人赠送 3 赠送他人 4 购买物品',
                              `created_at` int(11) DEFAULT 0,
                              `member_id` int(11) DEFAULT NULL,
                              `left` decimal(11,6) DEFAULT NULL,
                              PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='用户资产1GB=1元';

CREATE TABLE `mb_storage_history` (
                                      `id` int(11) NOT NULL AUTO_INCREMENT,
                                      `member_id` int(11) DEFAULT NULL,
                                      `b` bigint(20) DEFAULT 0 COMMENT '用户剩余资产（字节）1024b*1024b*1024b=1GB',
                                      `type` int(11) DEFAULT NULL COMMENT '记录交易类型',
                                      `b_time_inc` bigint(20) DEFAULT 0 COMMENT '用户增长时间的字节，当达到50GB的时候，立即增加期限4个月，然后归零，重新开始计算',
                                      `b_time_inc_total` bigint(20) DEFAULT 0 COMMENT '用户总共增长时间的字节，不归零，仅仅用做统计',
                                      `created_at` int(11) DEFAULT 0,
                                      `update_at` int(11) DEFAULT 0,
                                      PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `mb_ticket` (
                             `id` int(11) NOT NULL AUTO_INCREMENT,
                             `member_id` int(11) DEFAULT NULL,
                             `created_at` int(11) DEFAULT NULL,
                             `update_at` int(11) DEFAULT NULL,
                             `gb` bigint(20) DEFAULT 0,
                             `gb_left` bigint(20) DEFAULT 0,
                             `inc_time` int(11) DEFAULT 0 COMMENT '剩余增长时间',
                             `inc_time_total` int(11) DEFAULT 0 COMMENT '总共增长时间',
                             `uid` varchar(100) DEFAULT NULL,
                             PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='存储票据，gb历史可以兑换票据，票据可以兑换存储';

CREATE TABLE `member` (
                          `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',
                          `uid` int(11) DEFAULT NULL,
                          `username` char(16) DEFAULT NULL COMMENT '用户名',
                          `password` char(32) DEFAULT NULL COMMENT '密码',
                          `nickname` varchar(20) DEFAULT NULL,
                          `email` char(32) DEFAULT NULL COMMENT '用户邮箱',
                          `mobile` char(15) DEFAULT '' COMMENT '用户手机',
                          `reg_ip` varchar(20) DEFAULT NULL COMMENT '注册IP',
                          `last_login_ip` varchar(20) DEFAULT NULL COMMENT '最后登录IP',
                          `status` tinyint(4) DEFAULT 0 COMMENT '用户状态:0 待审核,1 正常,2 小黑屋,3 被禁用',
                          `qq_openid` varchar(100) DEFAULT NULL,
                          `sina_openid` varchar(100) DEFAULT NULL,
                          `login_type` tinyint(1) DEFAULT NULL COMMENT '会员登录方式：1pc2app3cmd',
                          `is_test` int(11) DEFAULT NULL COMMENT '是否是内部测试号',
                          `sid` varchar(100) DEFAULT NULL COMMENT '最后一次登录的sid',
                          `product_channel_id` int(10) unsigned DEFAULT NULL,
                          `last_at` int(11) DEFAULT NULL,
                          `created_at` int(11) DEFAULT NULL,
                          `device_id` int(11) DEFAULT NULL,
                          `openid` varchar(255) DEFAULT NULL,
                          `xcx_openid` varchar(255) DEFAULT NULL,
                          `latitude` float DEFAULT NULL,
                          `longitude` float DEFAULT NULL,
                          `device_no` varchar(100) DEFAULT NULL,
                          `balance` decimal(10,2) DEFAULT NULL,
                          `wx_third_unionid` varchar(100) DEFAULT NULL,
                          `user_status` int(11) DEFAULT 0,
                          `avatar` varchar(200) DEFAULT NULL,
                          `sex` int(11) DEFAULT NULL,
                          `expire_app_at` int(11) DEFAULT NULL COMMENT 'app可以直接执行代码到期时间\n',
                          `expire_cmd_at` int(11) DEFAULT NULL COMMENT '用户可以使用cmd到期时间',
                          `is_random` tinyint(4) DEFAULT NULL,
                          `sync_id` varchar(200) DEFAULT NULL,
                          `can_virtual` tinyint(4) DEFAULT 0 COMMENT '是否可以操作虚拟用户',
                          `tags` varchar(100) DEFAULT NULL COMMENT '空格分割的标签',
                          `words` varchar(200) DEFAULT NULL COMMENT '他的至理名言',
                          `article_num` int(11) DEFAULT NULL COMMENT '发布的文章数量',
                          `code_num` int(11) DEFAULT NULL COMMENT '发布的功能代码数量',
                          `mb_storage` bigint(20) DEFAULT NULL,
                          `device_num` int(11) DEFAULT 6,
                          `left_mb` decimal(11,6) DEFAULT NULL,
                          `sp` varchar(10) DEFAULT NULL COMMENT '短密码',
                          `sp_expire_at` int(11) DEFAULT NULL,
                          PRIMARY KEY (`id`),
                          UNIQUE KEY `member_username_uindex` (`username`),
                          UNIQUE KEY `hd_member_sid_uindex` (`sid`),
                          UNIQUE KEY `member_email_uindex` (`email`),
                          KEY `member_openid_index` (`openid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='用户表';


CREATE TABLE `merchant_products` (
                                     `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
                                     `user_id` int(11) DEFAULT NULL,
                                     `product_id` int(11) DEFAULT NULL,
                                     `type` int(11) DEFAULT NULL,
                                     `status` int(11) DEFAULT NULL,
                                     `created_at` int(11) DEFAULT NULL,
                                     `updated_at` int(11) DEFAULT NULL,
                                     `rank` int(11) DEFAULT NULL,
                                     `score` int(11) DEFAULT NULL,
                                     `sale_num` int(11) DEFAULT NULL,
                                     PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

CREATE TABLE `operator` (
                            `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
                            `status` int(11) DEFAULT NULL,
                            `username` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                            `password` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                            `operator_role_id` int(11) DEFAULT NULL,
                            `updated_at` int(11) DEFAULT NULL,
                            `ip` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                            `active_at` int(11) DEFAULT NULL,
                            `created_at` int(11) DEFAULT NULL,
                            `password_updated_at` int(11) DEFAULT NULL,
                            `role` varchar(50) COLLATE utf8_bin DEFAULT NULL,
                            PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


CREATE TABLE `operator_login_his` (
                                      `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
                                      `operator_id` int(11) DEFAULT NULL,
                                      `ip` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                      `created_at` int(11) DEFAULT NULL,
                                      `updated_at` int(11) DEFAULT NULL,
                                      `location` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                      PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


CREATE TABLE `operator_permission` (
                                       `id` int(11) NOT NULL AUTO_INCREMENT,
                                       `p` varchar(50) DEFAULT NULL,
                                       `i` varchar(50) DEFAULT NULL,
                                       `name` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
                                       `created_at` int(11) DEFAULT NULL,
                                       PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `operator_records` (
                                    `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
                                    `operator_id` int(11) DEFAULT NULL,
                                    `table_name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                    `target_id` int(11) DEFAULT NULL,
                                    `action_type` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                    `data` text COLLATE utf8_bin DEFAULT NULL,
                                    `updated_at` int(11) DEFAULT NULL,
                                    `created_at` int(11) DEFAULT NULL,
                                    PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

CREATE TABLE `operator_role` (
                                 `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
                                 `name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                 `status` int(11) DEFAULT NULL,
                                 `updated_at` int(11) DEFAULT NULL,
                                 `created_at` int(11) DEFAULT NULL,
                                 `permission_items` text COLLATE utf8_bin DEFAULT NULL COMMENT '逗号分割的permission id',
                                 `is_admin` bit(1) DEFAULT b'0',
                                 PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

insert into `operator_role` (status,updated_at,created_at,is_admin,id,name)values(1,1631867129,1631866859," ",1,"主管");

insert into `operator_role` (id,name,status,updated_at,created_at,is_admin)values(2,"运营",1,1631866859,1631866859," ");

insert into `operator_role` (status,updated_at,created_at,is_admin,id,name)values(1,1631866859,1631866889," ",3,"测试");

CREATE TABLE `order` (
                         `id` int(11) NOT NULL AUTO_INCREMENT,
                         `member_id` int(11) DEFAULT NULL,
                         `payment_no` int(11) DEFAULT NULL,
                         `payment_status` int(11) DEFAULT NULL COMMENT '1 已支付 0 未支付',
                         `notify_status` int(11) DEFAULT NULL,
                         `payment_type` varchar(20) DEFAULT NULL,
                         `buy_type` varchar(20) DEFAULT NULL,
                         `buy_time` varchar(20) DEFAULT NULL,
                         `payed_at` int(11) DEFAULT NULL,
                         `updated_at` int(11) DEFAULT NULL,
                         `created_at` int(11) DEFAULT NULL,
                         `cny_amount` decimal(11,2) DEFAULT NULL,
                         `status` tinyint(4) DEFAULT 0 COMMENT '0订单发起，1已支付',
                         `tm` datetime DEFAULT NULL,
                         PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

insert into `order` (payment_status,cny_amount,status,tm,payed_at,id,member_id,payment_type,buy_type,created_at,buy_time,notify_status,payment_no,updated_at)values(1,318.15,1,"2021-09-27 18:12:24 +0800 CST",1632729458,1,1,"1","1",1632729458,"1632729458",1,23224,1632825097);

insert into `order` (tm,id,buy_time,payed_at,notify_status,payment_type,created_at,status,payment_status,buy_type,updated_at,member_id,payment_no,cny_amount)values("2021-09-27 18:12:27 +0800 CST",2,"1632729458",1632729458,1,"1",1632729458,0,1,"1",1632825094,1,533456,344.15);

CREATE TABLE `package` (
                           `id` int(11) NOT NULL AUTO_INCREMENT,
                           `member_id` int(11) DEFAULT NULL,
                           `name` varchar(100) DEFAULT NULL,
                           `title` varchar(200) DEFAULT NULL,
                           `port` varchar(200) DEFAULT NULL,
                           `git_source` varchar(355) DEFAULT NULL,
                           `platform` varchar(100) DEFAULT NULL,
                           `created_at` int(11) DEFAULT NULL,
                           `updated_at` int(11) DEFAULT 0,
                           `run_type` varchar(50) DEFAULT NULL COMMENT 'package cmd plugs',
                           `install_times` int(11) DEFAULT 0,
                           `remark` tinytext DEFAULT NULL,
                           `status` int(11) DEFAULT 0,
                           PRIMARY KEY (`id`),
                           KEY `cw_package_member_id_name_index` (`member_id`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `partners` (
                            `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
                            `name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                            `fr` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                            `product_channel_ids` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                            `created_at` int(11) DEFAULT NULL,
                            `status` int(11) DEFAULT NULL,
                            `notify_callback` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                            `member_group_id` int(11) DEFAULT NULL,
                            `invite_code` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                            `company_name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                            `company_icp` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                            `company_service_phone` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                            `kefu_mobile` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                            PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

CREATE TABLE `payment_channel_product_channels` (
                                                    `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
                                                    `payment_channel_id` int(11) DEFAULT NULL,
                                                    `product_channel_id` int(11) DEFAULT NULL,
                                                    `created_at` int(11) DEFAULT NULL,
                                                    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `payment_channels` (
                                    `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
                                    `mer_no` varchar(255) DEFAULT NULL,
                                    `app_id` varchar(255) DEFAULT NULL,
                                    `app_password` text DEFAULT NULL,
                                    `gateway_url` varchar(255) DEFAULT NULL,
                                    `rank` int(11) DEFAULT NULL,
                                    `status` int(11) DEFAULT NULL,
                                    `name` varchar(255) DEFAULT NULL,
                                    `clazz` varchar(255) DEFAULT NULL,
                                    `created_at` int(11) DEFAULT NULL,
                                    `updated_at` int(11) DEFAULT NULL,
                                    `mer_name` varchar(255) DEFAULT NULL,
                                    `fee` decimal(10,5) DEFAULT NULL,
                                    `platform` varchar(255) DEFAULT NULL,
                                    `need_vesion` varchar(255) DEFAULT NULL,
                                    `app_key` text DEFAULT NULL,
                                    `payment_type` varchar(255) DEFAULT NULL,
                                    `discount` decimal(10,2) DEFAULT NULL,
                                    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `product_channels` (
                                    `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
                                    `name` varchar(255) DEFAULT NULL,
                                    `code` varchar(255) DEFAULT NULL,
                                    `company_name` varchar(255) DEFAULT NULL,
                                    `domain` varchar(255) DEFAULT NULL,
                                    `service_phone` varchar(255) DEFAULT NULL,
                                    `avatar` varchar(255) DEFAULT NULL,
                                    `sms_sign` varchar(255) DEFAULT NULL,
                                    `status` int(11) DEFAULT NULL,
                                    `icp` varchar(255) DEFAULT NULL,
                                    `created_at` int(11) DEFAULT NULL,
                                    `updated_at` int(11) DEFAULT NULL,
                                    `agreement_company_name` varchar(255) DEFAULT NULL,
                                    `agreement_company_shortname` varchar(255) DEFAULT NULL,
                                    `xcx_secret` varchar(255) DEFAULT NULL,
                                    `xcx_appid` varchar(255) DEFAULT NULL,
                                    `xcx_token` varchar(255) DEFAULT NULL,
                                    `xcx_fr` varchar(255) DEFAULT NULL,
                                    `operator_id` int(11) DEFAULT NULL,
                                    `xcx_stable_version` int(11) DEFAULT NULL,
                                    `role` int(11) DEFAULT NULL,
                                    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `products` (
                            `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
                            `name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                            `icon` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                            `amount` decimal(10,2) DEFAULT NULL,
                            `status` int(11) DEFAULT NULL,
                            `rank` int(11) DEFAULT NULL,
                            `created_at` int(11) DEFAULT NULL,
                            `updated_at` int(11) DEFAULT NULL,
                            `discount_level` int(11) DEFAULT NULL,
                            `gold_member_amount` decimal(10,2) DEFAULT NULL,
                            `standard_member_amount` decimal(10,2) DEFAULT NULL,
                            `sale_num` int(11) DEFAULT NULL,
                            `category_id` int(11) DEFAULT NULL,
                            `brand_id` int(11) DEFAULT NULL,
                            `start_order_num` int(11) DEFAULT NULL,
                            `multiple_num` int(11) DEFAULT NULL,
                            `is_essence` int(11) DEFAULT NULL,
                            `is_bargain` int(11) DEFAULT NULL,
                            `is_free_post` int(11) DEFAULT NULL,
                            `free_post_num` int(11) DEFAULT NULL,
                            `remark` tinytext COLLATE utf8_bin DEFAULT NULL,
                            `description` text COLLATE utf8_bin DEFAULT NULL,
                            `is_new` int(11) DEFAULT NULL,
                            `unit` tinytext COLLATE utf8_bin DEFAULT NULL,
                            `supplier_id` int(11) DEFAULT 0,
                            `express_company_ids` text COLLATE utf8_bin DEFAULT NULL,
                            `purchase_name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                            `c_cash_score` int(11) DEFAULT NULL,
                            `c_amount` decimal(10,2) DEFAULT NULL,
                            `tax_rate` decimal(10,4) DEFAULT NULL,
                            `outsourcing` int(11) DEFAULT 0,
                            `promotion` int(11) DEFAULT 0,
                            `quality` int(11) DEFAULT 0,
                            `material_form` int(11) DEFAULT NULL,
                            `ordinary_amount` decimal(10,2) DEFAULT 0.00,
                            `activity_image` varchar(200) COLLATE utf8_bin DEFAULT NULL,
                            `update_reason` varchar(191) COLLATE utf8_bin DEFAULT NULL,
                            `update_status` int(11) DEFAULT 0,
                            `vip_member_amount` decimal(10,2) DEFAULT NULL,
                            `params` varchar(1024) COLLATE utf8_bin DEFAULT NULL,
                            `unique_no` int(11) DEFAULT NULL,
                            `standard_member_range` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                            `gold_member_range` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                            `type` int(11) DEFAULT 0,
                            `sell_type` int(11) DEFAULT 0,
                            PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

CREATE TABLE `program` (
                           `id` int(11) NOT NULL AUTO_INCREMENT,
                           `member_id` int(11) DEFAULT NULL,
                           `name` varchar(50) DEFAULT NULL,
                           `git_source` tinytext DEFAULT NULL COMMENT '保存的git地址',
                           `install_times` int(11) DEFAULT 0 COMMENT '安装次数',
                           `created_at` int(11) DEFAULT NULL,
                           `updated_at` int(11) DEFAULT 0,
                           PRIMARY KEY (`id`),
                           KEY `cw_program_member_id_name_pk` (`member_id`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `question` (
                            `id` int(11) NOT NULL AUTO_INCREMENT,
                            `product_channel_id` int(11) DEFAULT NULL,
                            `member_id` int(11) DEFAULT NULL,
                            `title` text DEFAULT NULL,
                            `status` int(11) DEFAULT NULL,
                            `content` text DEFAULT NULL,
                            `created_at` int(11) DEFAULT NULL,
                            `updated_at` int(11) DEFAULT NULL,
                            PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `schema_migrations` (
                                     `version` varchar(255) DEFAULT NULL,
                                     UNIQUE KEY `version` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `slice_codes` (
                               `id` int(11) NOT NULL AUTO_INCREMENT,
                               `article_id` int(11) DEFAULT NULL,
                               `created_at` int(11) DEFAULT NULL,
                               `updated_at` int(11) DEFAULT NULL,
                               `member_id` int(11) DEFAULT NULL,
                               `content` text CHARACTER SET utf8mb4 DEFAULT NULL,
                               `exec_times` int(11) DEFAULT NULL,
                               `lan` varchar(20) DEFAULT NULL,
                               `new_column` int(11) DEFAULT NULL,
                               `is_freedom` tinyint(1) DEFAULT 0 COMMENT '是否是冗余代码段',
                               PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `sms_his` (
                           `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
                           `mobile` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                           `sms_type` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                           `content` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                           `auth_status` int(11) DEFAULT NULL,
                           `send_status` int(11) DEFAULT NULL,
                           `expired_at` int(11) DEFAULT NULL,
                           `created_at` int(11) DEFAULT NULL,
                           `device_id` int(11) DEFAULT NULL,
                           `sms_token` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                           `code` varchar(8) COLLATE utf8_bin DEFAULT NULL COMMENT '验证码',
                           `updated_at` int(11) DEFAULT NULL,
                           PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

CREATE TABLE `sms_platform` (
                                `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
                                `name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                `username` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                `password` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                `url` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                `clazz` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                `status` int(11) DEFAULT NULL,
                                `rank` int(11) DEFAULT NULL,
                                `signature` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                `created_at` int(11) DEFAULT NULL,
                                `sms_type` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                `template` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                `company_no` varchar(127) COLLATE utf8_bin DEFAULT NULL,
                                `mobile_operator` int(11) DEFAULT NULL,
                                `product_channel_ids` text COLLATE utf8_bin DEFAULT NULL,
                                `operator_id` int(11) DEFAULT NULL,
                                PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

CREATE TABLE `sql` (
                       `id` int(11) NOT NULL AUTO_INCREMENT,
                       `sql` varchar(200) DEFAULT NULL,
                       `created_at` int(11) DEFAULT NULL,
                       PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `stats` (
                         `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
                         `stat_at` int(11) DEFAULT NULL,
                         `time_type` int(11) DEFAULT NULL,
                         `province_id` int(11) DEFAULT -1,
                         `platform` varchar(255) COLLATE utf8_bin DEFAULT '-1',
                         `version_code` int(11) DEFAULT -1,
                         `product_channel_id` int(11) DEFAULT -1,
                         `partner_id` int(11) DEFAULT -1,
                         `sex` int(11) DEFAULT -1,
                         `data` text COLLATE utf8_bin DEFAULT NULL,
                         PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

CREATE TABLE `table_name` (
                              `id` int(11) NOT NULL,
                              `mm` varchar(60) DEFAULT NULL,
                              UNIQUE KEY `table_name_id_uindex` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `tags` (
                        `id` int(11) NOT NULL AUTO_INCREMENT,
                        `pid` int(11) DEFAULT NULL COMMENT '用户id',
                        `title` varchar(100) COLLATE utf8_bin DEFAULT NULL,
                        `created_at` int(11) DEFAULT NULL,
                        `update_at` int(11) DEFAULT NULL,
                        `type` tinyint(4) DEFAULT 0 COMMENT '1 随意 2 语言种类',
                        `icon` varchar(200) COLLATE utf8_bin DEFAULT NULL,
                        PRIMARY KEY (`id`),
                        UNIQUE KEY `tags_title_uindex` (`title`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

CREATE TABLE `tags_map_article` (
                                    `id` int(11) NOT NULL AUTO_INCREMENT,
                                    `tag_id` int(11) DEFAULT NULL,
                                    `article_id` int(11) DEFAULT NULL,
                                    `created_at` int(11) DEFAULT NULL,
                                    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `tags_map_code` (
                                 `id` int(11) NOT NULL AUTO_INCREMENT,
                                 `tag_id` int(11) NOT NULL,
                                 `code_id` int(11) NOT NULL,
                                 `created_at` int(11) DEFAULT NULL,
                                 PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `version` (
                           `id` int(11) NOT NULL AUTO_INCREMENT,
                           `created_at` int(11) DEFAULT NULL,
                           `updated_at` int(11) DEFAULT NULL,
                           `ver` decimal(10,3) DEFAULT NULL,
                           `addr` varchar(500) DEFAULT NULL,
                           `status` int(11) DEFAULT 1 COMMENT '1 可用 0不可用',
                           `is_woo` bit(1) DEFAULT b'0',
                           `real_ver` int(11) DEFAULT NULL,
                           `code` tinytext DEFAULT NULL,
                           `force` tinyint(4) DEFAULT 0,
                           PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `z_db_schema` (
                               `id` int(11) NOT NULL AUTO_INCREMENT,
                               `sql_name` varchar(100) NOT NULL,
                               `created_at` int(11) DEFAULT NULL,
                               PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用于记录数据表更改记录';

