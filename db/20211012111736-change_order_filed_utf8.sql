-- 这里是sql注释

-- sql结尾以 -- DONE 表示此sql已经执行完毕

-- 本文件使用：woo murphy sql add change_order_filed_utf8 生成

ALTER TABLE `order` CHANGE addr_name addr_name VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

ALTER TABLE `order` CHANGE addr_addr addr_addr VARCHAR(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

ALTER TABLE `order` CHANGE remark remark VARCHAR(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

