<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 확인 -lkm Shoppingmall</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/style/confirmPassword.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/assets/js/confirmPassword.js"></script>

</head>
<body>
	<div class="wrap">
		<div class="wrap-header">
			<a href="${pageContext.request.contextPath}/index">
				<img alt="logo1" src="${pageContext.request.contextPath}/resources/assets/images/logo1.PNG">
			</a>
			<div class="header-title">
				<h2>비밀번호 확인</h2>
			</div>
		</div>
		<div class="wrap_content">
				<p class="pass_info">
					회원님의 개인정보를 안전하게 보호하기 위해 <br/>
					<span class="bold-red">인증후 변경이 가능</span>합니다.
				</p>
				<div class="password-check">
					<p class="connect_id">아이디 :${sessionScope.id }
					<div class="password-box">
						<div class="password-input">
							<input type="password" id="pw" name="pw" placeholder="비밀번호를 입력해주세요">
						</div>
						<div class="password-btn">
							<input type="button" id="pw_btn" value="확인">
						</div>
						
					</div>
				</div>
		</div>
		
		
	</div>
</body>
</html>