-- 这里是sql注释
-- sql结尾以 -- DONE 表示此sql已经执行完毕
-- 本文件使用：woo murphy sql add order_add_filed_trade_no 生成


alter table `order`
    add trade_no varchar(36) null;
