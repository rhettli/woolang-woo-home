-- 这里是sql注释
-- sql结尾以 -- DONE 表示此sql已经执行完毕
-- 本文件使用：woo murphy sql add order_add_filed_alter 生成


alter table `order`
    add product_name varchar(50) null;


ALTER TABLE `order` CHANGE product_name product_name VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;