# Spring

## ��¼
* JUnit������AbstractJUnit4SpringCOntextTests����Ԫ���Ե�ʱ�������̳�����࣬�����Զ�ע��
* �ֶ���ȡSpring����
```java
ApplicationContext context = new ClassPathXmlApplicationContext("beans.xml");
context.getBean("userDAO", UserDAO.class); // Spring3�Է��͵�֧��
// ������������ע�ⷽʽ������
@ContextConfiguration("classpath:beans.xml") ָ�������ļ�
```
* �������ϼ���@Configuration��ע�⣬������൱��һ�������ļ�
* @Bean ����bean��Ĭ����Ϊ���������൱���������ļ��������������bean
* ������ע������ private @Value("#jdbcProperties.url") String jdbcUrl;
* SpELһ��Spring�ṩ�ı��ʽ����,�����ڶ�̬���ԣ��������ļ��е��÷���
```xml
<bean id="my" class="com.ibm.eacm.MyBean">
	<property name="randomNumber" value="#{T(java.lang.Math).random * 100}"/>
	<property name="userRegion" value="#{systemProperties['user.country']}"/>
</bean>
```


