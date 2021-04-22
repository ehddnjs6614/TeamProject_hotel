<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/loginForm.css" type="text/css" />
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6"
	crossorigin="anonymous">
<title>Document</title>
<!-- Font awesome CDN -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<!-- Scroll reveal CDN --><!-- 쓸일이 있나..-->
<script src="https://unpkg.com/scrollreveal"></script>
</head>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf"
	crossorigin="anonymous"></script>
<title>Insert title here</title>
</head>
<body>
	<form action="submit" method="post" id="loginform">
		<fieldset>
			<legend class="login-title">
				<strong>LOGIN</strong>
			</legend>

			<div class="login-box">
				<div class="input-text">
					<label for="loginId" class="screen-out">아이디</label>
					<input type="text" name="id" value="${sessionScope.id}" size="20">
				</div>

				<div class="input-text">
					<label for="loginPw" class="screen-out">비밀번호</label>
					<input type="password" name="password" value="${sessionScope.password}" size="20">
				</div>

				<div class="submit-button">
					<button type="submit">로그인</button>
					<button type="button" onclick="location.href='/TeamProject/register/registerAgree'">회원가입</button>
				</div>
				
				<div class="form-container sign-in-container">
					<form action="#">
						<div class="social-container">
							<a href="#" class="social"><i class="fab fa-facebook-f"></i></a>
							<a href="#" class="social"><i class="fab fa-google-plus-g"></i></a>
							<a href="#" class="social"><i class="fab fa-linkedin-in"></i></a>
						</div>
					</form>
				</div>
			</div>

		</fieldset>
	</form>
</body>
</html>