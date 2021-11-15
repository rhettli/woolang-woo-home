# woo code language official website

### dev use: [woo](https://woolang.net) +[murphy](https://gitee.com/oshine/murphy)


## Get Start:
1.) create a new file ".env",and type the content below:
```editorconfig

# 当前环境设置，pre线下环境，测试环境；  prd线上 正式环境
environment=prd

# sql_user=root
# sql_psw=H987hgbrfd2387/*-451sd

# mysql/postgres 链接串
db_conn=root:123456@(127.0.0.1:3306)/wbpl?charset=utf8&parseTime=True&loc=Local
db_adapter=mysql


redis_addr=127.0.0.1:6379
redis_psw=
redis_db=0


ssdb_addr=127.0.0.1:8888
ssdb_psw=
ssdb_db=0



# 短信配置 阿里云

# 短信签名名称。请在控制台国内消息页面中的签名管理页签下签名名称一列查看
sign_name=
# 短信模板ID。请在控制台国内消息页面中的模板管理页签下模板CODE一列查看。
template_code=

```

2.) start with: `woo ./ -t http`