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
</head>
<body>
<c:if test="${sessionScope.uSerid !=null ||  sessionScope.dId !=null}">
		<script type="text/javascript">
			location.href='index';
		</script>
</c:if>
<script type="text/javascript">
	$(document).ready(function(){
		
		$('#loginbtn').click(function(){
			var id =$('#id');	
			var pw =$('#pw'); 
			if(id.val() ==''){
				alert('아이디를 입력해주세요');
				id.focus();
			}else if(pw.val() =='' || pw.length >20 || pw.val() <6 ){
				alert('비밀번호를 확인해주세요');
				pw.focus();
			}else{
				$.ajax({
					url : 'loginchk',
					type : 'post',
					data : 'uSerid=' + id.val() + '&uPw=' + pw.val() +'&type='+$('#type').val(),
					success : function(data){
						if(data =='1'){
							alert('로그인 성공');
							location.href= 'index';
						}else{
							alert('아이디 비밀번호를 확인해주세요');
							pw.focus();
							pw.val('');
						}
					},
					error : function(){
						alert('ajax통신 실패');
					}
				});
			}
		}); 
		$('#dept_login').click(function(){
			$('#type').val('dept');
			$('.dept-border').css({'background' : 'yellow'});
			$(this).css({'background' : 'yellow',"font-weight" : "bold"});
			$('.user-border').css({'background' : 'white'});
			$('#user_login').css({'background' : 'white',"font-weight" : "normal"});
		});
		$('#user_login').click(function(){
			$('#type').val('user');
			
			$(this).css({'background' : 'yellow',"font-weight" : "bold"});
			$('.user-border').css({'background' : 'yellow'});
			$('.dept-border').css({'background' : 'white'});
			$('#dept_login').css({'background' : 'white',"font-weight" : "normal"});
		});
	});
</script>
	
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