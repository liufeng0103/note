# MongoDB常用命令

MongoDB的mongo客户端常用命令

- mongo  
打开MongoDB客户端程序
- help   
打印常用的命令
- show dbs  
打印所有数据库
- show collections  
打印所有集合
- use test  
切换到test数据库
- db.colname.findOne()  
显示一条记录
- db.colname.find({"name":"haha"})  
查找集合中name是haha的记录
- db.colname.find({"name":"haha"}).pretty()  
查找集合中name是haha的记录，并格式化结果，方便查看
- db.colname.count()  
显示集合中的记录数
- db.colname.ensureIndex({"name":1,"item":1})  
为集合创建索引，1表示索引从小到大排序
- db.colname.dropIndex({"name":1,"item":1})  
删除索引
- db.colname.dropIndex("name_item")  
通过索引名删除索引
- db.colname.getIndexs()  
显示集合的所有索引