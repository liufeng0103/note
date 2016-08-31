# Spring

## 记录
* JUnit测试类AbstractJUnit4SpringCOntextTests做单元测试的时候测试类继承这个类，可以自动注入
* 手动获取Spring容器
```java
ApplicationContext context = new ClassPathXmlApplicationContext("beans.xml");
context.getBean("userDAO", UserDAO.class); // Spring3对泛型的支持
// 或者在类名上注解方式来设置
@ContextConfiguration("classpath:beans.xml") 指明配置文件
```
* 在类名上加上@Configuration的注解，把这个类当做一个配置文件
* @Bean 定义bean，默认名为方法名。相当于在配置文件里面配置了这个bean
* 在类中注入属性 private @Value("#jdbcProperties.url") String jdbcUrl;
* SpEL一种Spring提供的表达式语言,类似于动态语言，在配置文件中的用法：
```xml
<bean id="my" class="com.ibm.eacm.MyBean">
	<property name="randomNumber" value="#{T(java.lang.Math).random * 100}"/>
	<property name="userRegion" value="#{systemProperties['user.country']}"/>
</bean>
```


