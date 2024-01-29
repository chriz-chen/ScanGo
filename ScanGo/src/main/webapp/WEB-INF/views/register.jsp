<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sp"%>

<%@ include file="/WEB-INF/header.jspf"%>

<style>

.register-area{
	margin-top: 50px;
	height: 110vh;
}

.MainContent{
	background-color: #fffefb;
}

.login-form {
    background-color: #b6ccd8;
    border-radius: 10px;
    box-shadow: 0 8px 12px rgba(0, 0, 0, 0.2); /* 更大的阴影效果 */
    border: 2px solid #555; /* 更明显的边框 */
}


.title{
	font-size: 18px;
	margin-left: 8px;
	letter-spacing: 4px;
	font-weight: 400;
}

#account, #password, 
#passwordCheck
#email, #phone{
	font-size: 16px; 
	padding: 8px; 
	letter-spacing: 4px;
}


</style>

<main id="MainContent" class="content-for-layout">
	<div class="register-area mt-80">
		<div class="container">
			<sp:form modelAttribute="registerUser"
				action="${pageContext.request.contextPath}/mvc/register"
				cssClass="login-form common-form mx-auto" method="post"
				enctype="multipart/form-data">

				<p class="text-center text-danger">${ error }</p>
				<div class="section-header mb-3">
					<h2 class="section-heading text-center" 
					    style="font-size: 40px; letter-spacing: 10px">註冊帳號</h2>
				</div>
				<div class="row">
					<div class="col-12">
						<fieldset>
							<div class="d-flex justify-content-between">
								<h4 class="title d-inline">帳號</h4>
								<sp:errors path="username"
									cssClass="text-danger text-nowrap text-end"/>
							</div>
							<sp:input type="text" id="account" path="username"  placeholder="請輸入帳號" value="user999"/>
						</fieldset>
					</div>
					<div class="col-12">
						<fieldset>
							<div class="d-flex justify-content-between">
								<h4 class="title d-inline">密碼</h4>
								<sp:errors path="password"
									cssClass="text-danger text-nowrap text-end" />
							</div>
							<sp:input type="password" id="password" path="password"  placeholder="密碼(請使用6位數以上)" value="111111"/>
						</fieldset>
					</div>
					<div class="col-12">
						<fieldset>
						    <div class="d-flex justify-content-between">
						        <h4 class="title confirmPassword">密碼再次確認</h4>
						        <sp:errors path="confirmPassword"
									cssClass="text-danger text-nowrap text-end" />
						    </div>
						    <sp:input type="password" id="passwordCheck" path="confirmPassword"  
						     placeholder="請再次輸入密碼" style="font-size: 16px; padding: 8px; letter-spacing: 4px;" value="111111"/>
					    </fieldset>
					</div>   
					<div class="col-12">
						<fieldset>
							<div class="d-flex justify-content-between">
								<h4 class="title">信箱</h4>
								<sp:errors path="email"
									cssClass="text-danger text-nowrap text-end" />
							</div>
							<sp:input type="email" id="email" path="email" placeholder="請輸入信箱"
							style="font-size: 16px; padding: 8px; letter-spacing: 4px;" value="user999@gmail.com"/>
						</fieldset>
					</div>
					<div class="col-12">
						<fieldset>
							<div class="d-flex justify-content-between">
								<h4 class="title">手機</h4>
								<sp:errors path="phone"
									cssClass="text-danger text-nowrap text-end" />
							</div>
							<sp:input type="text" id="phone" path="phone" placeholder="請輸入手機號碼"  
							value="111111" />
						</fieldset>
					</div>
					<div class="col-12">
						<fieldset>
							<div class="d-flex justify-content-between">
								<h4 class="title d-inline">生日</h4>
								<sp:errors path="birthday"
									cssClass="text-danger text-nowrap text-end" />
							</div>
							<sp:input type="date" path="birthday" value="1997-12-12"/>
						</fieldset>
					</div>
					
					
					
					<%-- <div class="col-12">
						<fieldset>
							<div class="d-flex justify-content-between">
								<label class="label d-inline btn btn-outline-primary w-100">Picture
									<sp:input type="file" path="avator" cssClass="d-none"
										accept=".jpg, .jpeg, .png, .gif" /> 上傳檔案
								</label> </label>
								<sp:errors path="avator"
									cssClass="text-danger text-nowrap text-end" />
							</div>
						</fieldset>
					</div> --%>
					<div class="col-12 mt-3">
						<button type="submit" class="btn-primary d-block mt-3 btn-signin">加入會員</button>
					</div>
				</div>
			</sp:form>
		</div>
	</div>
</main>

<%@ include file="/WEB-INF/footer.jspf"%>