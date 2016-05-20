# MongoDB Java

使用的时候是3.0版本的驱动

## 官网
[https://www.mongodb.org/](https://www.mongodb.org/)

## 是用Maven导入驱动包
``` xml
<dependency>
	<groupId>org.mongodb</groupId>
	<artifactId>mongo-java-driver</artifactId>
	<version>3.2.2</version>
</dependency>
```

## java代码
``` java
MongoClient mongoClient = new MongoClient();
// 数据库
MongoDatabase db = mongoClient.getDatabase("dbname");
// 集合
MongoCollection<Document> coll = db.getCollection("colname");
// 删除集合
coll.drop();
// 添加索引
List<IndexModel> indexes = new ArrayList<>()
indexes.add(new IndexModel(new Document("owner", 1)));
coll.createIndexes(indexes);
// 保存过个数据
List<Document> docs = new ArrayList<Document>();
Document doc = new Document("name", "test")
					.append("mail", "test@163.com");
docs.add(doc);	
coll.insertMany(docs);
// 查询
// 使用eq需要导入import static com.mongodb.client.model.Filters.*;
FindIterable<Document> iterable = coll.find(eq("owner", owner));
// 查询全部
FindIterable<Document> iterable = coll.find();
iterable.forEach(new Block<Document>() {
	@Override
	public void apply(final Document doc) {
		String name = doc.getString("name");
	}
});
// 删除多个记录
coll.deleteMany(new Document("name", "test"));
```