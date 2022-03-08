- #springboot #redis
- ### 引入依赖
- ```
          <dependency>
              <groupId>org.springframework.boot</groupId>
              <artifactId>spring-boot-starter-data-redis</artifactId>
          </dependency>
  ```
-
- ### redisTemplate和lettuce
- ```java
  @SpringBootTest
  public class Boot05WebAdminApplicationTests {
  
      @Autowired
      StringRedisTemplate redisTemplate;
  
  
      @Autowired
      RedisConnectionFactory redisConnectionFactory;
  
      @Test
      void testRedis(){
          ValueOperations<String, String> operations = redisTemplate.opsForValue();
  
          operations.set("hello","world");
  
          String hello = operations.get("hello");
          System.out.println(hello);
  
          System.out.println(redisConnectionFactory.getClass());
      }
  
  }
  ```
- application.yml配置
- ```yml
  spring:
    redis:
  #   url: redis://lfy:Lfy123456@r-bp1nc7reqesxisgxpipd.redis.rds.aliyuncs.com:6379
      host: r-bp1nc7reqesxisgxpipd.redis.rds.aliyuncs.com
      port: 6379
      password: lfy:Lfy123456
      lettuce:   # 另一个用来连接redis的java框架
        pool:
          max-active: 10
          min-idle: 5
  ```
- ### 使用jedis
	- 引入依赖
	- ```xml
	  <!--        导入jedis-->
	          <dependency>
	              <groupId>redis.clients</groupId>
	              <artifactId>jedis</artifactId>
	          </dependency>
	  ```
	- application.yml配置
	- ```yml
	  spring:
	    redis:
	  #   url: redis://lfy:Lfy123456@r-bp1nc7reqesxisgxpipd.redis.rds.aliyuncs.com:6379
	      host: r-bp1nc7reqesxisgxpipd.redis.rds.aliyuncs.com
	      port: 6379
	      password: lfy:Lfy123456
	      client-type: jedis
	      jedis:
	        pool:
	          max-active: 10
	  ```
-