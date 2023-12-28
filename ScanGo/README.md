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


