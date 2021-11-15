-- 这里是sql注释
-- sql结尾以 -- DONE 表示此sql已经执行完毕
-- 本文件使用：woo murphy sql add table_report 生成


create table report
(
    id int auto_increment,
    created_at int null,
    updated_at int null,
    title varchar(150) null comment '一句话描述',
    content tinytext null,
    member_id int null,
    constraint report_pk
        primary key (id)
);

