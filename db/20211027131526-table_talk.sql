-- 这里是sql注释
-- sql结尾以 -- DONE 表示此sql已经执行完毕
-- 本文件使用：woo murphy sql add table_talk 生成


create table talk
(
    id int auto_increment,
    created_at int null,
    updated_at int null,
    content tinytext null,
    member_id int null,
    good_times int null comment '帖子被点赞次数',
    reply_times int null comment '回复数量',
    constraint talk_pk
        primary key (id)
)
    comment '交流帖子';

alter table talk change good_times good_num int null comment '帖子被点赞次数';

alter table talk change reply_times reply_num int null comment '回复数量';

alter table talk
    add comment_num int null comment '品论次数';

alter table talk
    add view_num int null;

