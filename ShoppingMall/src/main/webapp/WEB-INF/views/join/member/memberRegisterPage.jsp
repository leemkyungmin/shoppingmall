<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/Template/registerhearder.jsp" %>
	
	
	<div class="wrap">
		<div class="wrap-content">
			<div class="reg-title">
				<h1>가입 정보 입력</h1>
			</div>
			<div class="mreg-form">
				<form  method="post" action="memberRegSuccess">
					<div class="form-style">
						<label for = "uId">아이디</label>
						<input type= "text" name="uId" id="uId">
						<input type="button" value="아이디 중복 확인">
					</div>
					<div class="fomr-style">
						<label for = "uPw">비밀번호</label>
						<input type= "text" name="uPw" id="uPw">
					</div>
				</form>
			</div>
		</div>
	</div>
	
</body>
</html>