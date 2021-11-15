-- 这里是sql注释
-- sql结尾以 -- DONE 表示此sql已经执行完毕
-- 本文件使用：woo murphy sql add member_add_filed_birthday_at 生成


alter table member
    add birthday_at int null comment '年月日时间戳，不包含时分秒';
