- #springboot #java #后端
- 参考： [springboot上](https://blog.csdn.net/u011863024/article/details/113667634)
	- [sprinboot下](https://blog.csdn.net/u011863024/article/details/113667946)
- {{renderer :toc_vrvtmvbyma}}
	- ### **springboot 配置**
		- ◼ maven配置
		  
		  ``` xml
		  <mirrors>
		  	<mirror>
		  		<id>nexus-aliyun</id>
		  		<mirrorOf>central</mirrorOf>
		  		<name>Nexus aliyun</name>
		  		<url>http://maven.aliyun.com/nexus/content/groups/public</url>
		  	</mirror>
		  </mirrors>
		  
		  <profiles>
		  	<profile>
		  		<id>jdk-1.8</id>
		  
		  		<activation>
		  			<activeByDefault>true</activeByDefault>
		  			<jdk>1.8</jdk>
		  		</activation>
		  
		  		<properties>
		  			<maven.compiler.source>1.8</maven.compiler.source>
		  			<maven.compiler.target>1.8</maven.compiler.target>
		  			<maven.compiler.compilerVersion>1.8</maven.compiler.compilerVersion>
		  		</properties>
		  	</profile>
		  </profiles>
		  ```
		- ◼ springboot依赖引入
		  
		  ``` xml
		  <parent>
		  	<groupId>org.springframework.boot</groupId>
		  	<artifactId>spring-boot-starter-parent</artifactId>
		  	<version>2.3.4.RELEASE</version>
		  </parent>
		  
		  <dependencies>
		  	<dependency>
		  		<groupId>org.springframework.boot</groupId>
		  		<artifactId>spring-boot-starter-web</artifactId>
		  	</dependency>
		  </dependencies>
		  ```
		- ◼ 打包部署依赖引入
		  ```xml
		  <build>
		  	<plugins>
		  		<plugin>
		  			<groupId>org.springframework.boot</groupId>
		  			<artifactId>spring-boot-maven-plugin</artifactId>
		  		</plugin>
		  	</plugins>
		  </build>
		  ```
		  在IDEA的Maven插件上点击运行 clean 、package，把helloworld工程项目的打包成jar包
	- ### **springboot依赖管理特性**
		- ◼ 父项目做依赖管理
		  ```xml
		  # 依赖管理
		  <parent>
		  	<groupId>org.springframework.boot</groupId>
		  	<artifactId>spring-boot-starter-parent</artifactId>
		  	<version>2.3.4.RELEASE</version>
		  </parent>
		  # 修改父依赖中依赖包的版本
		      <properties>
		          <mysql.version>5.1.43</mysql.version>
		      </properties>
		  ```
		-
		- ◼ 开发导入starter场景启动器
		  1. 比如 spring-boot-starter-*:  *就是某种场景
		  2. 只要引入starter, 这个场景的所有常规需要的依赖会自动引入
		  3. 见到的 *-spring-boot-starter： 第三方为我们提供的简化开发的场景启动器。
		  > 所有starter场景最底层依赖
		  ```xml
		  <dependency>
		  	<groupId>org.springframework.boot</groupId>
		  	<artifactId>spring-boot-starter</artifactId>
		  	<version>2.3.4.RELEASE</version>
		  	<scope>compile</scope>
		  </dependency>
		  ```
	- ### **自动配置特性**
		- ◼ 自动配置tomcat
			- 引入了tomcat依赖
			- 配置tomcat
			- ```
			  <dependency>
			  	<groupId>org.springframework.boot</groupId>
			  	<artifactId>spring-boot-starter-tomcat</artifactId>
			  	<version>2.3.4.RELEASE</version>
			  	<scope>compile</scope>
			  </dependency>
			  ```
		- ◼ 自动配置好springmvc
			- 引入了springmvc开发全套组件
			- 自动配置springmvc常用功能
		- ◼ 默认的包结构
			- 主程序所在包下的组件都会默认被扫描
			- 无需增加包扫描配置
				- 如果想修改扫描路径
				  ```
				  @SpringBootApplication(scanBasePackages="com.lun")
				  或者
				  @ComponentScan 指定扫描路径
				  ```
			- #+BEGIN_TIP
			  @springBootApplication 
			  相当于 
			  @SpringootConfiruation;@EnableAutoConfiruation;@ComponentScan("xx.xx")
			  #+END_TIP
		- ◼ 按需加载自动配置
			- 引入哪些场景的自动配置才会开启
			- springboot所有自动配置都在spring-boot-autoconfigure包中
	- ### **✔底层注解@Configuration**
		- {{embed ((621f8d9e-8ddd-4a8c-9ebe-fe4600e6b402))}}
		- {{embed ((6220bdab-6d5b-4edd-af03-f15de7c3dd2b))}}
	- ### **✔底层注解@Import**
		- {{embed ((6220c08c-b903-46f4-8006-417494750d79))}}
	- ### **🎉底层注解@Conditional**
		- {{embed ((6220c08c-b903-46f4-8006-417494750d79))}}
	- ### **底层注解@ImportResource**
		- {{embed ((6220c773-1548-473b-8dd3-debd84dbb95d))}}
	- ### **底层注解@ConfigurationProperties**
		- {{embed ((6220c7bc-767c-480a-958b-0f17f920576c))}}
	- ### **springboot 最佳实践**
		- 引入依赖
			- [官方文档](https://docs.spring.io/spring-boot/docs/current/reference/html/using.html#using-boot-starter)
		- 查看自动配置了什么
			- ```
			  # application.properties
			  
			  debug = true  #开启自动配置报告
			  ```
			- 控制台输出
				- Negative: 未生效的自动配置
				- Positive: 生效的自动配置
		- 是否修改application.properties中配置
			- 参考文档:
				- [官方文档](https://docs.spring.io/spring-boot/docs/current/reference/html/application-properties.html#common-application-properties)
		- 自动加入或者替换组件
			- @Bean @Component ...
		- 自定义器: xxxCustomizer
	- ### **扩展:Lombok**
		- {{embed ((6220d85b-2b00-4d40-9bd1-7b58d3fa555a))}}
	- ### **扩展: devtools**
	- {{embed ((6220da23-e85c-4525-a911-70578f92accd))}}