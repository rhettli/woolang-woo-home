-- 这里是sql注释
-- sql结尾以 -- DONE 表示此sql已经执行完毕
-- 本文件使用：woo murphy sql add mask_pic_add_filed_mask_pic_group_id 生成


alter table mask_pic
    add mask_pic_group_id int null comment '所属印花组id';
