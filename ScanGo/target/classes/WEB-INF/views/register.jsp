<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sp"%>

<%@ include file="/WEB-INF/header.jspf"%>

<main id="MainContent" class="content-for-layout">
	<div class="login-page mt-80">
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
								<h4 class="label d-inline">帳號</h4>
								<sp:errors path="username"
									cssClass="text-danger text-nowrap text-end" />
							</div>
							<sp:input type="text" path="username" />
						</fieldset>
					</div>
					<div class="col-12">
						<fieldset>
							<div class="d-flex justify-content-between">
								<h4 class="label d-inline">密碼</h4>
								<sp:errors path="password"
									cssClass="text-danger text-nowrap text-end" />
							</div>
							<sp:input type="password" path="password" />
						</fieldset>
					</div>
					<div class="col-12">
						<fieldset>
						    <div class="d-flex justify-content-between">
						        <h4 class="label confirmPassword">再次確認密碼</h4>
						        <sp:errors path="confirmPassword"
									cssClass="text-danger text-nowrap text-end" />
						    </div>
						    <sp:input type="password" path="confirmPassword" />
					    </fieldset>
					</div>   
					<div class="col-12">
						<fieldset>
							<div class="d-flex justify-content-between">
								<h4 class="label">信箱</h4>
								<sp:errors path="email"
									cssClass="text-danger text-nowrap text-end" />
							</div>
							<sp:input type="email" path="email" />
						</fieldset>
					</div>
					<div class="col-12">
						<fieldset>
							<div class="d-flex justify-content-between">
								<h4 class="label">手機</h4>
								<sp:errors path="phone"
									cssClass="text-danger text-nowrap text-end" />
							</div>
							<sp:input type="text" path="phone" />
						</fieldset>
					</div>
					<div class="col-12">
						<fieldset>
							<div class="d-flex justify-content-between">
								<h4 class="label d-inline">生日</h4>
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