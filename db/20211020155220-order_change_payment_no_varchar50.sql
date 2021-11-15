-- 这里是sql注释
-- sql结尾以 -- DONE 表示此sql已经执行完毕
-- 本文件使用：woo murphy sql add order_change_payment_no_varchar50 生成


alter table `order` modify payment_no varchar(50) null;

