- #devtools #springboot
  title:: devtools
- ### devtools
  id:: 6220da23-e85c-4525-a911-70578f92accd
	- spring为开发者提供了一个名为spring-boot-devtools的模块来使Spring Boot应用支持热部署，提高开发者的开发效率，无需手动重启Spring Boot应用。
	- 重新生效方法
		- ctrl+f9(重新编译)
	- 引入依赖
	  ```xml
	  <dependencies>
	      <dependency>
	          <groupId>org.springframework.boot</groupId>
	          <artifactId>spring-boot-devtools</artifactId>
	          <optional>true</optional>
	      </dependency>
	  </dependencies>
	  ```
	- devtools配置
	- ```properties
	  #热部署生效
	  spring.devtools.restart.enabled: true
	  #设置重启的目录
	  #spring.devtools.restart.additional-paths: src/main/java
	  #classpath目录下的WEB-INF文件夹内容修改不重启
	  spring.devtools.restart.exclude: WEB-INF/**
	  ```
	- idea配置
		- 当我们修改了Java类后，IDEA默认是不自动编译的，而spring-boot-devtools又是监测classpath下的文件发生变化才会重启应用，所以需要设置IDEA的自动编译：
		- 1. File-Settings-Compiler-Build Project automatically
		  2. ctrl + shift + alt + /,选择Registry,勾上 Compiler autoMake allow when app running