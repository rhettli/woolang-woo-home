-- 这里是sql注释
-- sql结尾以 -- DONE 表示此sql已经执行完毕
-- 本文件使用：woo murphy sql add mask_pic_add_filed_remark 生成


alter table mask_pic
    add remark varchar(200) null comment '备注';