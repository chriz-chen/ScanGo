#### 參考資料

##### 1. Spring 官方文件: <https://docs.spring.io/spring-framework/reference/web/webmvc.html>

##### 2. Spring 官方文件- Spring Web MVC - Method Arguments: <https://docs.spring.io/spring-framework/reference/web/webmvc/mvc-controller/ann-methods/arguments.html>

##### 3. Spring MVC Custom Validation: <https://www.baeldung.com/spring-mvc-custom-validator>

##### 4. Bisum - Multipurpose eCommerce Template:<https://spreethemesprevious.github.io/bisum/> <https://themeforest.net/user/spreethemes/portfolio>

##### 5. Tomcat 虛擬路徑配置

	(1) server.xml: 請在Eclipse中的 Servers 專案中，找到 server.xml 檔案，並找到 <Host> 標籤，加入以下這段
	 
	```
	<Host appBase="webapps" autoDeploy="true" name="localhost"
					unpackWARs="true">
	...
	<Context path="/ScanGo/avators" docBase="C:/uploads/avator" />
	</Host>
	```
	
	(2) 透過 <http://localhost:8080/ScanGo/avators/{XXX}.png> 即可讀取該台機器中的 C:/uploads/avator/{XXX}.png 檔案

##### 6. Html QR Code: <https://scanapp.org/html5-qrcode-docs/docs/intro> <https://codesandbox.io/search?refinementList%5Btemplate%5D=&refinementList%5Bnpm_dependencies.dependency%5D%5B0%5D=html5-qrcode&page=1&configure%5BhitsPerPage%5D=12>

##### 7. 改 MySQL 全域時區：

```
SELECT @@global.time_zone;
set @@global.time_zone = '+8:00';
```

##### 8. Spring IoC / DI / AOP:

	Spring IoC / DI / AOP

	=== Component/Bean 定義 (IoC, Inversion of Control 反轉控制) ====
	@Component("userDaoImpl")
	public class UserDAOImpl implements UserDAO{
	
	}
	
	1.UserDAOImpl userDAOImpl = new UserDAOImpl(); (開發人員自己建立物件，自己 new())
	  現在交由 Spring 自己去建立物件，根據 @Component 的定義資訊的class，他會自己去 new()
	
	2.Inversion of Control 反轉控制
	  控制：物件的建立(new 物件)
	  反轉：以前是開發人員自己new，現在是Spring去new。
	
	3.小結: 
	  Spirng 會去建立一個 UserDAOImpl 物件，而且預設名稱為 userDAOImpl，如果有給他名稱 @Component("userDaoImpl")，就會用那個名稱。
	  
	4.@Repository、@Controller、@Service：都是 @Component，只是綽號不同而已。這些綽號，代表不同的開發上的意義。
	
	  Controller：他是控制器(路由、表單驗證、Session、頁面Model)的類別。
	  
	  Repository：他是資料庫儲存(JdbcTemplate、SQL...)的類別。
	  
	  Service：他是處理商業邏輯(用戶資訊確認、忘記密碼-舊密碼...)的類別。

	=== DI (Dependency Injection 依賴注入) ====

	@Controller
	@RequestMapping
	public class MemberController {
		
		@Autowired
		@Qualifier("userDAOImpl")
		private UserDAO userDAO1;
		
		
		@Autowired
		private UserDAO userDAO2;

	}
	
	1. @Controller: 就是 @Component，只是有一個綽號叫做 Controller，目的是可以清楚的表示他是一個 Controller。
	
	2. Spirng 會去建立一個 MemberController 物件，而且預設名稱為 memberController。
	
	3. 依賴：在 MemberController 中，使用了 UserDAO。(has-a 擁有)
	
	4. 注入：Spring 因為知道這個依賴關係，所以他會主動把 UserDAO 的 Bean/Component 給這個 Controller。
	
	   以前沒有注入，要自己 new。例如：private UserDAO userDAO = new UserDAOImpl();
	   
	5. @Autowired：自動綁定，依照物件 型別 / 名稱，去幫你自動注入。
	
	   (1) @Qualifier("userDAOImpl")：根據 userDAOImpl 名稱，去尋找 Spring 容器中 名稱一樣為 userDAOImpl 的物件。
	   
	   (2) 沒有寫 @Qualifier("userDAOImpl")，預設就是 @Qualifier("userDAOImpl")。

	=======
	
	=== AOP (Aspect-oriented programming, 橫切關注分離) ====
	
	情境： 想要知道用戶使用系統的足跡( 想要知道用戶進入哪些 Controller，傳什麼樣的參數，回傳什麼樣的結果，以及這個用戶是誰)
	
	1. 商業邏輯：Controller 裡面的程式碼。例如：登入。
	
	2. 關注：用戶使用系統的足跡。這個關注，跟商業邏輯無關。
	
	3. 分離：與商業邏輯分離。
	
	4. 橫切：關注。
	
	   縱切：商業邏輯。
	
			|
	   -----|----> 關注：用戶使用系統的足跡 (Log)。
			|
	   -----|----> 關注：捕捉 Controller 的所有例外，然後回傳客製的錯誤頁面。(全域捕捉)。
			|
			|
			V


