<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
	.wrap{
		width: 500px;
		height: 500px;
	}
	.title{
		width:500px;
		height:42px;
		background: red;
		margin-bottom: 5px;
	}
	.title h2{
		margin: 0;
		color: white;
	}
	.info{
		text-align: center;
	}
	.content-info{
		border-bottom: 1px solid #ddd;
		margin-bottom: 15px;
	}
	.pw-form label{
		display:inline-block;
		width: 150px;
	}
	.input-form{
		margin: 5px 0;
	}
	.pw-form{
		margin-left: 10px;
	}
	.input-btn{
		margin: 50px 0;
		text-align: center;
	}
	
	.input-btn input[type=button]{
		width: 100px;
	}
	
</style>
<script type="text/javascript">
	$().ready(function(){
		
		var pwReg= new RegExp('^(?=.*[a-zA-Z])(?=.*[~!@#$%^*+=-])(?=.*[0-9]).{6,20}');
		
		$('#chk-btn').click(function(){
			var oldpw = $('#old_pw');
			var newpw1 =$('#new_pw1');
			var newpw2 =$('#new_pw2');
			
			if(oldpw.val() ==''){
				alert('기존 비밀번호를 입력해주세요');
				oldpw.focus();
			} else if (newpw1.val() =='' || newpw2.val() ==''){
				alert('새로운 비밀번호를 입력해주세요');
				newpw1.focus();
			} else if (newpw1.val() == newpw2.val()){
				if(pwReg.test(newpw1.val())){
					$.ajax({
						url:'${pageContext.request.contextPath}/my/updatepw',
						data:'old_pw='+ oldpw.val() +'&new_pw='+newpw1.val(),
						type:'POST',
						success:function(data){
							if(data=='1'){
								alert('비밀번호 변경 성공했습니다.');
								window.close();
							}else{
								alert('기존 비밀번호 확인해주세요');
								oldpw.focus();
							}
						}, error:function(){
							alert('통신 실패');
						}
					});
				}else{
					alert('비밀번호 양식이 틀립니다.');
				}
			} else{
				alert('새로운 비밀번호가 틀립니다.');
				newpw2.focus();
			}
		});
	});

</script>
</head>
<body>
	<div class="wrap">
		<div class="title">
			<h2>비밀번호 변경</h2>
		</div>
		<div class="content-info">
			<div class="info">
				<p>띄어쓰기 없는 영문/숫자/특수문자 2종류 이상 조합하여<br/> 6~20자 사용가능</p>
			</div> 
		</div>
		<div class="pw-form">
			<form action="UpdatePw" method="post">
				<div class="input-form">
					<label for="old_pw">기존 비밀번호 입력 </label><input type="password" id="old_pw">
				</div>
				<div class="input-form">
					<label for="new_pw1">새 비밀번호 입력 </label><input type="password" id="new_pw1"><br/>
				</div>
				<div class="input-form">
					<label for="new_pw2">새 비밀번호 확인 </label><input type="password" id="new_pw2">
				</div>
				<div class="input-btn">
					<input type="button" id="chk-btn" value="확인">
				</div>
			</form>
		</div>
	</div>
</body>
</html>