-- 这里是sql注释
-- sql结尾以 -- DONE 表示此sql已经执行完毕
-- 本文件使用：woo murphy sql add add_table_mask_pic_group 生成


create table mask_pic_group
(
    id int auto_increment,
    name varchar(30) null,
    created_at int null,
    updated_at int null,
    constraint mask_pic_group_pk
        primary key (id)
)
    comment '印花图片组';

