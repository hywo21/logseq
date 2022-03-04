- #springboot #web开发 #后端
-
- ### 🧨静态资源规则
	- 静态资源目录(默认)
		- ```
		  Resouces/static
		  Resouces/public
		  Resouces/resources
		  Resources/META-INF/resources
		  ```
		- 访问方式:  项目根路径/+静态资源名称
		- 如果controller能处理这个路径,不会转到静态资源
	- 改变默认的静态资源路径
		- ```yml
		  spring:
		  	resources:
		  		static-locations: [classpath:/xxx/]
		  ```
		- 访问方式:  项目根路径/+静态资源名称
	- 设置静态资源访问前缀
		- ```yml
		  spring:
		  	mvc:
		      	static-path-pattern: /res/**
		  ```
		- 访问方式: localhost:8080+ static-path-pattern+ 静态资源名称
- ### 请求处理-常用参数注解使用
	- {{embed ((622171bd-6ec8-4a3f-abc7-fe8cf9798a5b))}}
- ### **拦截器**
	- 实现HandlerInterceptor 接口
	- 拦截器注册到容器中(实现WebMvcConfigurer 得 addInterceptors() )
	- 指定拦截规则
	- ```
	  @Slf4j
	  public class LoginInterceptor implements HandlerInterceptor {
	  
	      /**
	       * 目标方法执行之前
	       */
	      @Override
	      public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
	  
	          String requestURI = request.getRequestURI();
	          log.info("preHandle拦截的请求路径是{}",requestURI);
	  
	          //登录检查逻辑
	          HttpSession session = request.getSession();
	  
	          Object loginUser = session.getAttribute("loginUser");
	  
	          if(loginUser != null){
	              //放行
	              return true;
	          }
	  
	          //拦截住。未登录。跳转到登录页
	          request.setAttribute("msg","请先登录");
	  //        re.sendRedirect("/");
	          request.getRequestDispatcher("/").forward(request,response);
	          return false;
	      }
	  
	      /**
	       * 目标方法执行完成以后
	       */
	      @Override
	      public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
	          log.info("postHandle执行{}",modelAndView);
	      }
	  
	      /**
	       * 页面渲染以后
	       */
	      @Override
	      public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
	          log.info("afterCompletion执行异常{}",ex);
	      }
	  }
	  
	  ```
	- 注册
	- ```
	  @Configuration
	  public class AdminWebConfig implements WebMvcConfigurer{
	      @Override
	      public void addInterceptors(InterceptorRegistry registry) {
	          registry.addInterceptor(new LoginInterceptor())//拦截器注册到容器中
	                  .addPathPatterns("/**")  //所有请求都被拦截包括静态资源
	                  .excludePathPatterns("/","/login","/css/**","/fonts/**","/images/**",
	                          "/js/**","/aa/**"); //放行的请求
	  }
	  ```
- ### **文件上传**
	- {{embed ((6221a9cb-4904-48e9-9a22-9c34cab70b60))}}
	- 文件大小配置
		- 所属配置类
		  ```
		  org.springframework.boot.autoconfigure.web.servlet.MultipartAutoConfiguration
		  org.springframework.boot.autoconfigure.web.servlet.MultipartProperties
		  ```
	- ```properties
	  spring.servlet.multipart.max-file-size=10MB
	  spring.servlet.multipart.max-request-size=100MB
	  ```
- ### **错误处理-默认错误处理机制**
	- spring boot 提供了/error 处理所有错误得映射
	- 机器客户端会生成json响应,包含错误信息等数据
	- ```json
	  {
	    "timestamp": "2020-11-22T05:53:28.416+00:00",
	    "status": 404,
	    "error": "Not Found",
	    "message": "No message available",
	    "path": "/asadada"
	  }
	  ```
	- /templates/error/下的4xx，5xx页面会被自动解析