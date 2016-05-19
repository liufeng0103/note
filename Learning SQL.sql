DB2常用命令
http://www.jb51.net/article/21172.htm

DB 数据库名不能大于8位
JDBC
与数组不同，数据库的索引是从1开始的
当使用完ResultSet， Statement或Connection对象时， 应立即调用close方法。 这些对象都是用了规模较大的数据结构。 不应该等垃圾回收器来处理它们

DB2 Join
Join
--内连接：inner join在两表共有的行才会输出，内连接没有左右之分。
select * from t1 inner join t2 on t1.c3=t2.c1
--左外连接：left outer join左连接保留前面表的所有记录,后表中没有的补null。
select * from t1 left outer join t2 on t1.c3=t2.c1
--右外连接：right outer join右连接保留后表的所有记录,前表中没有的补null。在DB2的内部机制中,会把右外连接重写成左外连接.故我们在写sql语句时尽量使用左外连接。
select * from t1 right outer join t2 on t1.c3=t2.c1
--全外连接：full outer join全外连接会输出两表的所有的数据,包括内连接和左外连接和右外连接的行。
select * from t1 full outer join t2 on t1.c3=t2.c1
--总结：内连接,全有才有;左外连接,左有就有;右外连接,右有就有;全外连接,全都有

select distinct xmlentitytype from price.xmlidlcache with ur;
select unique xmlentitytype from price.xmlidlcache with ur;
where x between a and b;-- >=a and <=b
where x in('a','b');
where x like 'a%b_' --% more _ single
where a like '&/' escape '/'; --查询中有特殊符号时用escape
--排序
--升序
order by x asc
order by x asc
--降序
order by x desc
--某列升序，某列降序
order by x asc,y desc
--分页查询
select * from tablename fetch first 3 row only;
select * from (select x,y,rownumber() over(order by x asc) from table_b) where a between 1 and 3;
select x,y,rownumber() over(order by x asc) from table_b;
--相等关联
select a.name,b.score from table_a a join table_b b on a.name=b.name;
--自我关联
select a.name,b.num from table_a a inner join table_b on a.num=b.num;
--左外关联,对于要求数据全部显示的表为主表，其它表向它关联
select a.num,a.name,b.score from table_a a left outer join table_b b on a.num = b.num and b.classno = '001';
--集合运算,union跟union all的区别一点，union会的合并后的结果进行重复数据过滤。
select * from table_a union all select * from table_b;
--对于union运算后的结果排序，只能用子查询。
--分组查询
--分组函数 
avg[{distinct|all}] max min count sum 
--group by,分组检索2中情况，1.使用分组函数，2.查询列必须是分组列
select avg(score) from table_a group by classno;
--having,在having过滤条件中最好使用分组函数过滤，普通过滤条件效率很低，不推荐。
select avg(score) from table_a group by classno having avg(score)>80;
--子查询
--检索子查询，子查询结果必须只有一条数据，否则用语句控制。oracle: rownum<2;db2: fetch first 1 row only,mysql: limit 1
--in 与not in，not in 效率最低 不建议使用。exists跟in类似，exists做子查询是效率高
--视图，作用：限制用户访问敏感数据，执行复杂查询。
create view view_name as select 查询语句;
drop view view_name;
--索引，对于经常查询的列加索引加快查询速度，主键默认加了索引
create index index_name on table_name(x,y...);
drop index index_name;
--索引多查询快，但增删改会变慢，视图同理
--序列
create table table_name(
	order_id int not null
	generated always as identity	--创建序列
	(start with 1					--起始为1
	increment by 1					--每次累加1
	minvalue 1						--最小值1
	no maxvalue						--没有最大值
	no cycle						--序列不循环
	no cache						--不用缓存
	order),							--排序
	cust_id int
)
--存储过程
--触发器
create trigger trigger_name before/after 触发条件[referencing new a n old as o]触发器内部语句块;
create trigger tri_scoreinfo after update of score on tbl_scoreinfo referencing new as n old as o for each row when(N.score<10) update tbl_scoreinfo set score =0 where stuno = n.stuno;
create trigger ins_history after update on scoreinfo for each row insert into ...;