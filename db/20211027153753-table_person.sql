-- 这里是sql注释
-- sql结尾以 -- DONE 表示此sql已经执行完毕
-- 本文件使用：woo murphy sql add table_person 生成


create table person
(
    id int auto_increment,
    created_at int null,
    updated_at int null,
    nickname varchar(150) null,
    id_name varchar(50) null comment 'id标识',
    platform int null comment '所属平台',
    constraint person_pk
        primary key (id)
)
    comment '被举报人记录';

