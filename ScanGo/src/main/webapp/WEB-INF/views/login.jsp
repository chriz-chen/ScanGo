<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sp"%>

<%@ include file="/WEB-INF/header.jspf"%>

<style>
.btn-primary:hover {
    background-color: #313d44;
    color: #fff;
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

.title {
	font-size: 18px !important;
	margin-left: 5px;
	letter-spacing: 5px !important;
	font-weight: 500 !important;
}


/* 斜線樣式 */
.separator {
    display: flex;
    align-items: center;
    text-align: center;
}

.separator::before,
.separator::after {
    content: "";
    flex: 1;
    border-bottom: 1px solid #000; /* 設定橫線樣式 */
}

.separator::before {
    margin-right: 0.5em; /* 設定橫線右邊的間距 */
}

.separator::after {
    margin-left: 0.5em; /* 設定橫線左邊的間距 */
}


/* google login*/
.gsi-material-button {
  -moz-user-select: none;
  -webkit-user-select: none;
  -ms-user-select: none;
  -webkit-appearance: none;
  background-color: WHITE;
  background-image: none;
  border: 1px solid #747775;
  -webkit-border-radius: 20px;
  border-radius: 20px;
  -webkit-box-sizing: border-box;
  box-sizing: border-box;
  color: #1f1f1f;
  cursor: pointer;
  font-family: 'Roboto', arial, sans-serif;
  font-size: 14px;
  height: 40px;
  letter-spacing: 0.25px;
  outline: none;
  overflow: hidden;
  padding: 0 12px;
  position: relative;
  text-align: center;
  -webkit-transition: background-color .218s, border-color .218s, box-shadow .218s;
  transition: background-color .218s, border-color .218s, box-shadow .218s;
  vertical-align: middle;
  white-space: nowrap;
  width: auto;
  max-width: 400px;
  min-width: min-content;
}

.gsi-material-button .gsi-material-button-icon {
  height: 20px;
  margin-right: 12px;
  min-width: 20px;
  width: 20px;
}

.gsi-material-button .gsi-material-button-content-wrapper {
  -webkit-align-items: center;
  align-items: center;
  display: flex;
  -webkit-flex-direction: row;
  flex-direction: row;
  -webkit-flex-wrap: nowrap;
  flex-wrap: nowrap;
  height: 100%;
  justify-content: space-between;
  position: relative;
  width: 100%;
}

.gsi-material-button .gsi-material-button-contents {
  -webkit-flex-grow: 1;
  flex-grow: 1;
  font-family: 'Roboto', arial, sans-serif;
  font-weight: 500;
  overflow: hidden;
  text-overflow: ellipsis;
  vertical-align: top;
}

.gsi-material-button .gsi-material-button-state {
  -webkit-transition: opacity .218s;
  transition: opacity .218s;
  bottom: 0;
  left: 0;
  opacity: 0;
  position: absolute;
  right: 0;
  top: 0;
}

.gsi-material-button:disabled {
  cursor: default;
  background-color: #ffffff61;
  border-color: #1f1f1f1f;
}

.gsi-material-button:disabled .gsi-material-button-contents {
  opacity: 38%;
}

.gsi-material-button:disabled .gsi-material-button-icon {
  opacity: 38%;
}

.gsi-material-button:not(:disabled):active .gsi-material-button-state, 
.gsi-material-button:not(:disabled):focus .gsi-material-button-state {
  background-color: #303030;
  opacity: 12%;
}

.gsi-material-button:not(:disabled):hover {
  -webkit-box-shadow: 0 1px 2px 0 rgba(60, 64, 67, .30), 0 1px 3px 1px rgba(60, 64, 67, .15);
  box-shadow: 0 1px 2px 0 rgba(60, 64, 67, .30), 0 1px 3px 1px rgba(60, 64, 67, .15);
}

.gsi-material-button:not(:disabled):hover .gsi-material-button-state {
  background-color: #303030;
  opacity: 8%;
}
</style>

<script type="text/javascript">
	function googleLoginBackend() {
		var loginUser = document.getElementById('loginUser');
		loginUser.action = 'login/secure/customlogin/google'; // Google 第三方登入路徑
		loginUser.submit();
	}
</script>

<main id="MainContent" class="content-for-layout">
	<div class="container vh-100">
		<sp:form modelAttribute="loginUser" method="post" id="loginUser"
			action="${ pageContext.request.contextPath }/mvc/login"
			class="login-form common-form mx-auto mt-5">
			<p class="text-center text-danger fs-5">${ errorMessage }</p>
			<div class="section-header mb-3">
				<h1 class="text-center" style="font-size: 40px; letter-spacing: 10px">登入</h1>
			</div>
			<div class="row">
				<div class="col-12">
					<fieldset>
						<div class="d-flex justify-content-between">
							<label class="title">帳號</label>
							<sp:errors path="username"
								cssClass="text-danger text-nowrap text-end" />
						</div>
						<sp:input type="text" path="username"
							style="font-size: 16px; padding: 8px; letter-spacing: 4px;"
							value="admin" />
					</fieldset>
				</div>
				<div class="col-12">
					<fieldset>
						<div class="d-flex justify-content-between">
							<label class="title">密碼</label>
							<sp:errors path="password"
								cssClass="text-danger text-nowrap text-end" />
						</div>
						<sp:input type="password" path="password"
							style="font-size: 16px; padding: 8px; letter-spacing: 4px;"
							value="111111" />
					</fieldset>
				</div>
				<div class="col-12">
					<fieldset>
						<div class="d-flex justify-content-between">
							<label class="title">驗證碼</label>
							<sp:errors path="code"
								cssClass="text-danger text-nowrap text-end" />
						</div>
						<sp:input type="text" path="code" style="font-size: 16px; padding: 8px; letter-spacing: 4px;" />
					</fieldset>
					<div class="d-flex align-items-center justify-content-between mt-2">
				        <!-- 驗證碼圖片 -->
				        <img src="${pageContext.request.contextPath}/mvc/login/getcode" alt="驗證碼" class="mr-2">
				
				        <!-- 忘記密碼的超連結 -->
				        <a href="${pageContext.request.contextPath}/mvc/auth/sendEmail" class="" style="font-size: 17px">忘記密碼？</a>
				    </div>
				</div>
				
				<div class="col-12 mt-3 mb-3">
					<button type="submit" class="btn-primary d-block mt-4 btn-signin">登入</button>
					<a href="${ pageContext.request.contextPath }/mvc/register"
						class="btn-secondary mt-2 btn-signin">註冊帳號</a>
				</div>
				<div class="justify-content-center text-center">
					<!-- <h5 class="text-center">Or login with</h5> -->
					<div class="separator fs-5 mb-3">或</div>
					<button class="gsi-material-button" onclick="googleLoginBackend()">
					  <div class="gsi-material-button-state"></div>
					  <div class="gsi-material-button-content-wrapper">
					    <div class="gsi-material-button-icon">
					      <svg version="1.1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 48 48" xmlns:xlink="http://www.w3.org/1999/xlink" style="display: block;">
					        <path fill="#EA4335" d="M24 9.5c3.54 0 6.71 1.22 9.21 3.6l6.85-6.85C35.9 2.38 30.47 0 24 0 14.62 0 6.51 5.38 2.56 13.22l7.98 6.19C12.43 13.72 17.74 9.5 24 9.5z"></path>
					        <path fill="#4285F4" d="M46.98 24.55c0-1.57-.15-3.09-.38-4.55H24v9.02h12.94c-.58 2.96-2.26 5.48-4.78 7.18l7.73 6c4.51-4.18 7.09-10.36 7.09-17.65z"></path>
					        <path fill="#FBBC05" d="M10.53 28.59c-.48-1.45-.76-2.99-.76-4.59s.27-3.14.76-4.59l-7.98-6.19C.92 16.46 0 20.12 0 24c0 3.88.92 7.54 2.56 10.78l7.97-6.19z"></path>
					        <path fill="#34A853" d="M24 48c6.48 0 11.93-2.13 15.89-5.81l-7.73-6c-2.15 1.45-4.92 2.3-8.16 2.3-6.26 0-11.57-4.22-13.47-9.91l-7.98 6.19C6.51 42.62 14.62 48 24 48z"></path>
					        <path fill="none" d="M0 0h48v48H0z"></path>
					      </svg>
					    </div>
					    <span class="gsi-material-button-contents">使用 Google 登入</span>
					    <span style="display: none;">使用 Google 登入</span>
					  </div>
					</button>
					<!-- <button type="button" class="pure-button pure-button-primary" onclick="googleLoginBackend()">😺google 登入</button> -->
				</div>
			</div>

		</sp:form>
	</div>
</main>

<%@ include file="/WEB-INF/footer.jspf"%>