-- 这里是sql注释
-- sql结尾以 -- DONE 表示此sql已经执行完毕
-- 本文件使用：woo murphy sql add table_platform 生成


create table platform
(
    id int auto_increment,
    created_at int null,
    updated_at int null,
    name varchar(50) null comment '平台名称',
    icon varchar(200) null comment '平台图标地址',
    constraint platform_pk
        primary key (id)
);

