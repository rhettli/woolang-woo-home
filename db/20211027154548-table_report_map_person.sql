-- 这里是sql注释
-- sql结尾以 -- DONE 表示此sql已经执行完毕
-- 本文件使用：woo murphy sql add table_report_map_person 生成


create table report_map_person
(
    id int auto_increment,
    created_at int null,
    updated_at int null,
    report_id int null,
    person_id int null,
    constraint report_map_person_pk
        primary key (id)
)
    comment '举报映射人物表';

