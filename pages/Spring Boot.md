- #springboot #java #后端
- ### springboot 配置
	- maven配置
	  
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
	- springboot依赖引入
	  
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
	- 打包部署依赖引入
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
- ### springboot依赖管理特性
	- 父项目做依赖管理
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
	- 开发导入starter场景启动器
	  1. 比如 spring-boot-starter-*:  *就是某种场景
	  2. 只要引入starter, 这个场景的所有常规需要的依赖会自动引入
-
	- 无需关注版本号，自动版本仲裁
	  １．引入依赖默认都可不写版本
	  ２．引入非仲裁的jar,要写版本号
	-
	- 可以修改默认版本号
	  1. 查看 spring-boot-dependencies中规定依赖版本号
	  2. 在当前项目中重写配置
	  
	  ``` xml
	  <properties>
	  	<mysql.version>5.1.43</mysql.version>
	  </properties>
	  ```
-
-
-
-
-
-
-
-
-