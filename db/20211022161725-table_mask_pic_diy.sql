-- 这里是sql注释
-- sql结尾以 -- DONE 表示此sql已经执行完毕
-- 本文件使用：woo murphy sql add table_mask_pic_diy 生成


create table mask_pic_diy
(
    id int auto_increment,
    created_at int null,
    updated_at int null,
    path int null comment '保存路径，相对地址',
    md5 int null,
    member_id int null,
    constraint mask_pic_diy_pk
        primary key (id)
);

