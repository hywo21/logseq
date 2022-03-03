- #lombok
- {{renderer :toc_dssvsoc}}
	- ## Lombok
	  id:: 6220d85b-2b00-4d40-9bd1-7b58d3fa555a
		- ### 引入依赖
		- ```xml
		   <dependency>
		       <groupId>org.projectlombok</groupId>
		       <artifactId>lombok</artifactId>
		  </dependency>
		  ```
		- ### 基本使用
		- ```java
		  @NoArgsConstructor
		  //@AllArgsConstructor
		  @Data
		  @ToString
		  @EqualsAndHashCode
		  public class User {
		  - private String name;
		    private Integer age;
		  - private Pet pet;
		  - public User(String name,Integer age){
		        this.name = name;
		        this.age = age;
		    }
		  }
		  ```
		- ### 注解解释
			- @Data
				- 作用于类上，是以下注解的集合：@ToString @EqualsAndHashCode @Getter @Setter @RequiredArgsConstructor
			- @Log
				- 作用于类上，生成日志变量。针对不同的日志实现产品，有不同的注解：
			- @ToString
				- 作用于类，覆盖默认的toString()方法，可以通过of属性限定显示某些字段，通过exclude属性排除某些字段
			- @EqualsAndHashCode
				- 作用于类，覆盖默认的equals和hashCode
			- @NonNull
				- 主要作用于成员变量和参数中，标识不能为空，否则抛出空指针异常。
			- @NoArgsConstructor
				- 生成无参构造器；
			- @AllArgsConstructor
				- 生成全参构造器
-