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
<style>
	.wrap{
		width: 1000px;
		margin: 0 auto;
	}
	.wrap-header{
		border-bottom:2px solid gray;
		height: 50px;
		padding-bottom: 10px;
		margin-top: 50px;
	}
	.wrap-header img{
		width: 94px;
    	height: 40px;
    	line-height: 40px;
    	margin-top: 5px;
	}
	.wrap-header h2{
		display:inline-block;
		margin: 0;
	}
	.wrap-header .header-title{
		display:inline-block;
		height: 50px;
		vertical-align: middle;
	}
	.wrap-header form{
		width: 1000px;
		margin: 0 auto;
	}
	.wrap_content{
		margin-top: 40px;
	}
	.pass_info{
		margin: -1px 0 15px;
	    font-size: 15px;
	    line-height: 24px;
	    letter-spacing: -1px;
	    text-align: center;
	}
	.password-check{
		margin: 0 auto;
		width:330px;
		border: 1px solid gray;
		padding: 20px;
	}
	.password-box .password-input #pw{
		width: 323px;
	    height: 37px;
	    margin: 16px 0 8px;
	}
	.password-btn #pw_btn{
		width: 330px;
		height: 45px;
		margin: 5px 0 8px;
		background: red;
		color: white;
		font-size: 20px;
		font-weight: bold;
		
	}
</style>
<script type="text/javascript">
	$().ready(function(){
		
		$('#pw_btn').click(function(){
			
			var pw = $('#pw');
			
			if(pw.val().length >0){
				$.ajax({
					url : '${pageContext.request.contextPath}/my/pwChk',
					type : 'POST',
					data :'pw='+pw.val(),
					success :function(data){
						if(data ==1){
							location.href='${pageContext.request.contextPath}/my/myPage';
						} else {
							alert('비밀번호가 틀립니다.');
							pw.val('');
							pw.focus();
						}
					}, error :function(){
						alert('서버 오류');
					}
				});
			}
			
			
		});
		
	});
			
</script>

</head>
<body>
	<div class="wrap">
		<div class="wrap-header">
			<img alt="logo1" src="${pageContext.request.contextPath}/resources/assets/images/logo1.PNG">
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