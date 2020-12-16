<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/Template/registerhearder.jsp" %>

<script>
	$().ready(function(){
		
		//아이디가 변경되면 check해제
		var idChecked ='idUncheck';
		$('#uId').change(function(){
			idChecked ='idUncheck';
		});
		
		//아이디 중복 확인 클릭 이벤트
		$('#uIdchk').click(function(){
			var uId = $('#uId').val();
			uId = uId.replace(/ /g,'');
			if(uId.length <5 || uId.length >20){
				alert('아이디는 5자 이상 20자 이하로 생성해주세요...!');
				uId.val('');
				uId.focus();
			}else{
				$.ajax({
					url : 'uIdcheck',
					type : 'post',
					data : 'uId='+uId,
					success : function(data){
						if(data =='0'){
							if(confirm('사용 가능한 아이디 입니다. ')){
								idChecked ='idchecked';
							}else{
								return ;
							}
						}else{
							alert('이미 사용중인 아이디 입니다.');
							$('#uId').val('');
							$('#uId').focus();
						}
					},
					error : function(){
						alert('ajax 통신 실패');
					}
					
				}); //ajax 종료
			
			}
		});	//아이디 중복 확인 종료
		
		//패스워드 중복 확인 
		var pwchk ='pwUnchecked';
		$('#uPwchk').click(function(){
			var upw = $('#uPw').val();
			var upw2 = $('#uPw2').val();
	
			if(uPw != uPw2){
				alert('비밀번호가 틀립니다 .');
				$('#uPw2').focus();
			}else {
				if(upw =='' || upw2 ==''){
					alert('비밀번호를 입력해주세요');
					$('#uPw').focus();
				}else if(upw.length<6){
					alert('비밀번호는 6자 이상으로 입력해주세요');
					$('#upw').focus();
				}else if() // 정규식을 이용해  특수문자 1개 이상 들어가도록 설정 ..
			}
		});
		
	});
</script>

	
	<div class="wrap">
		<div class="wrap-content">
			<div class="reg-title">
				<h1>가입 정보 입력</h1>
			</div>
			<div class="mreg-form">
				<form  method="post" action="memberRegSuccess">
					<div class="step1">
						<div class="form-style">
							<label for = "uId">아이디</label>
							<input type= "text" name="uId" id="uId">
							<input type="button" id="uIdchk" value="아이디 중복 확인">
						</div>
						<div class="form-style">
							<label for = "uPw">비밀번호</label>
							<input type= "text" name="uPw" id="uPw">
						</div>
						<div class="form-style">
							<label for = "uPw2">비밀번호</label>
							<input type= "text" name="uPw2" id="uPw2">
							<input type="button" id="uPwchk" value="비밀번호 확인">
						</div>
						<div class="form-style">
							<label for = "uPw2">이메일</label>
							<input type= "email" name="uEmail" id="uEmail">
							<input type="button" id="uEmailchk" value="이메일 인증하기">
						</div>
						<!-- 이메일 인증 div 열기 $('.email_check').attr('hidden',false);-->
						<div class="email_check" hidden="hidden">
							<div class="email-check_title">
								<h1>입력하신 이메일로 인증코드를 입력해주세요!</h1>
							</div>
							<div class="email-auth-user-input">
								<input type="text" id="uEmail-auth">
							</div>
							<div class="email-auth-btn">
								<p class=".time"></p>
								<button class="auth-check" value="입력"></button>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	
</body>
</html>