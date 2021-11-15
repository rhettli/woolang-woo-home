-- 这里是sql注释
-- sql结尾以 -- DONE 表示此sql已经执行完毕
-- 本文件使用：woo murphy sql add change_order_payment_no_unique 生成


create unique index order_payment_no_uindex
	on `order` (payment_no);

