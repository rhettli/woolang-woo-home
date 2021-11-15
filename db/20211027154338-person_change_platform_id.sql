-- 这里是sql注释
-- sql结尾以 -- DONE 表示此sql已经执行完毕
-- 本文件使用：woo murphy sql add person_change_platform_id 生成


alter table person change platform platform_id int null comment '所属平台';

alter table platform
    add id_remark varchar(100) null comment '用户平台id备注';

