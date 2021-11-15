-- 这里是sql注释
-- sql结尾以 -- DONE 表示此sql已经执行完毕
-- 本文件使用：woo murphy sql add order_change_payment_mask_pic_id 生成


alter table `order`
    add mask_pic_id int null;


alter table `order`
    add mask_pic_type smallint null;

alter table `order`
    add mask_pic_path int null;



alter table `order` modify mask_pic_type smallint null comment '0为使用系统内部印花，1位使用自定义印花';

alter table `order` modify mask_pic_path varchar(200) null;

