-- 这里是sql注释
-- sql结尾以 -- DONE 表示此sql已经执行完毕
-- 本文件使用：woo murphy sql add mask_pic_group_change_name_utf8 生成


ALTER TABLE `mask_pic_group` CHANGE name name VARCHAR(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;