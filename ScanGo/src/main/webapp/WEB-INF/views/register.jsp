<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sp"%>

<%@ include file="/WEB-INF/header.jspf"%>

<style>

.register-area{
	margin-top: 50px;
	height: 110vh;
}

.login-form{
	background-color: #DCDCDC;
	border-radius: 10px;
}

.title{
	font-size: 18px;
	margin-left: 5px;
	letter-spacing: 4px;
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
					<h2 class="section-heading text-center">註冊帳號</h2>
				</div>
				<div class="row">
					<div class="col-12">
						<fieldset>
							<div class="d-flex justify-content-between">
								<h4 class="title d-inline">帳號</h4>
								<sp:errors path="username"
									cssClass="text-danger text-nowrap text-end" />
							</div>
							<sp:input type="text" id="account" path="username" />
						</fieldset>
					</div>
					<div class="col-12">
						<fieldset>
							<div class="d-flex justify-content-between">
								<h4 class="title d-inline">密碼</h4>
								<sp:errors path="password"
									cssClass="text-danger text-nowrap text-end" />
							</div>
							<sp:input type="password" id="password" path="password" />
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
						    style="font-size: 16px; padding: 8px; letter-spacing: 4px;" />
					    </fieldset>
					</div>   
					<div class="col-12">
						<fieldset>
							<div class="d-flex justify-content-between">
								<h4 class="title">信箱</h4>
								<sp:errors path="email"
									cssClass="text-danger text-nowrap text-end" />
							</div>
							<sp:input type="email" id="email" path="email" 
							style="font-size: 16px; padding: 8px; letter-spacing: 4px;"/>
						</fieldset>
					</div>
					<div class="col-12">
						<fieldset>
							<div class="d-flex justify-content-between">
								<h4 class="title">手機</h4>
								<sp:errors path="phone"
									cssClass="text-danger text-nowrap text-end" />
							</div>
							<sp:input type="text" id="phone" path="phone" />
						</fieldset>
					</div>
					<div class="col-12">
						<fieldset>
							<div class="d-flex justify-content-between">
								<h4 class="title d-inline">生日</h4>
								<sp:errors path="birthday"
									cssClass="text-danger text-nowrap text-end" />
							</div>
							<sp:input type="date" path="birthday" />
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