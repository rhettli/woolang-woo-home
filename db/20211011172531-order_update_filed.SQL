-- 这里是sql注释

-- sql结尾以 -- DONE 表示此sql已经执行完毕

-- 本文件使用：woo murphy sql add order_update_filed 生成

alter table `order`
    add addr_name varchar(20) null; -- DONE

alter table `order`
    add addr_phone varchar(15) null; -- DONE

alter table `order`
    add addr_addr varchar(200) null; -- DONE

alter table `order`
    add number int null comment '订单数量'; -- DONE

alter table `order`
    add size int null; -- DONE

alter table `order`
    add remark varchar(500) null; -- DONE

alter table `order`
    add style int null comment '款式'; -- DONE

