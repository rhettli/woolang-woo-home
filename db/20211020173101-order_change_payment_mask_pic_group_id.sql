-- 这里是sql注释
-- sql结尾以 -- DONE 表示此sql已经执行完毕
-- 本文件使用：woo murphy sql add order_change_payment_mask_pic_group_id 生成


alter table `order`
    add mask_pic_group_id int null comment '所属印花组';

