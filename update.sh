


# 拉取最新代码
git pull


# 更新sql 脚本
./murphy  sql  update


# 清除运行sql缓存
./murphy runtime clear metadata

# 清除视图缓存
./murphy runtime clear view


# 更新完毕后把数据文件上传
git add ./db*

git commit -m "run db"

git push




