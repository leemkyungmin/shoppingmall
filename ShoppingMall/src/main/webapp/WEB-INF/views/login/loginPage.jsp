<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/assets/style/login.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> <!-- ajax -->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/assets/js/loginPage.js"></script>
</head>
<body>
<c:if test="${sessionScope.uSerid !=null ||  sessionScope.dId !=null}">
		<script type="text/javascript">
			location.href='index';
		</script>
</c:if>

	
	<div class="s_login">
		<h1 class="login_logo">
			<a href="index"><img id="logoimg" src="resources/images/쇼핑몰_로고.PNG" alt="회원가입 로고"></a>
		</h1>
		<form name="login_form" id="login_form">
			<div class="login_type">
				<div class="user-border">
					<input type ="button" id="user_login" name="user_login" value="일반회원">
				</div>
				<div class="dept-border">
					<input type ="button" id="dept_login" name="dept_login" value="기업회원">
				</div>
			</div>
				<input type="hidden" value="user" id="type">
				<div class="form-body">
				
				<input type="text" name ="id" id="id" placeholder="아이디">
				<input type="password" name ="pw" id="pw" placeholder="비밀번호는 6자이상 ~ 20자 이하 " maxlength="20">
				<input type="button" id="loginbtn" value="로그인"> 
				<div class="side">
				
					<div class="auto_login_chk">
						<input type="checkbox" id="auto_login">
						<label for="auto_login">자동로그인</label>
					</div>
					<div class="login_find">
						<a href="searchIdForm" id="searchIdForm">
						<label for="searchIdForm">아이디찾기</label></a>
						<label> / </label>
						<a href="searchPwForm" id="searchPwForm">
						<label for="searchPwForm">비밀번호찾기</label></a>
					</div>
				</div>
			</div>
		</form>
		
	</div>

</body>
</html>