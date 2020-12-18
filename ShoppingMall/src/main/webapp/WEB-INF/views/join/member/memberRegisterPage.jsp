<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/Template/registerhearder.jsp" %>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
function DaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var roadAddr = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ''; // 참고 항목 변수

            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                extraRoadAddr += data.bname;
            }
            // 건물명이 있고, 공동주택일 경우 추가한다.
            if(data.buildingName !== '' && data.apartment === 'Y'){
               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if(extraRoadAddr !== ''){
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('postcode').value = data.zonecode;
            document.getElementById("roadAddress").value = roadAddr;
            document.getElementById("jibunAddress").value = data.jibunAddress;
            
            // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
            
            var guideTextBox = document.getElementById("guide");
            // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
            if(data.autoRoadAddress) {
                var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                guideTextBox.style.display = 'block';

            } else if(data.autoJibunAddress) {
                var expJibunAddr = data.autoJibunAddress;
                guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                guideTextBox.style.display = 'block';
            } else {
                guideTextBox.innerHTML = '';
                guideTextBox.style.display = 'none';
            }
        }
    }).open();
}
</script>
<script>
	$().ready(function(){
		$('#Email_host').css('display','none');
		var idChecked = 'idUnchecked';
		$('#uId').keyup(function(){
			var id = $('#uId').val();
			var idk =$('.idcheck');
			if(id.length ==0){
				idk.empty();				
			}else{
				$.ajax({
					url : 'uIdcheck',
					type : 'post',
					data : 'uId='+uId,
					success : function(data){
						if(data =='0'){
							idk.empty();
							idk.text('사용 가능한 아이디입니다.');
							idChecked = 'idchecked';
						}else{
							idk.empty();
							idk.text('이미 사용중인 아이디입니다.');
							$('#uId').focus();
							idChecked = 'idUnchecked';
						}
					},
					error : function(){
						alert('ajax 통신 실패');
					}
					
				});
			}
			
		});
		$('#uPw').keyup(function(){

			pwchk();
		});
		$('#uPw2').keyup(function(){

			pwchk();
		});
		function pwchk(){
			var uPwchk = $('.uPwcheck');
			var uPw = $('#uPw').val();
			var uPw2 = $('#uPw2').val();
			var pwReg= new RegExp('^(?=.*[a-zA-Z])(?=.*[~!@#$%^*+=-])(?=.*[0-9]).{6,20}');
			var a1;			
			if(uPw.length > 5 && uPw2.length >5){
				a1 = pwReg.test(uPw);
				console.log('정규식 : ' + a1);
				console.log('비밀번호 :' + (uPw==uPw2));
				if(uPw == uPw2){
					if(uPw =='' || uPw2 ==''){
						uPwchk.text('비밀번호를 입력해주세요.');
					}else if(uPw.length<6){
						uPwchk.text('비밀번호는 6자 이상으로 입력해주세요');
					}else if(!pwReg.test(uPw)){
						uPwchk.text('비밀번호 최소 6자 이상 문자 1개이상, 특수문자 를 입력해주세요');
					}else{
						uPwchk.text('비밀번호가 일치합니다.');
					}	
				}else {
					uPwchk.text('비밀번호가 틀립니다.');
				}
			}else{
				uPwchk.empty();
			}
			
		}
		
		//이메일 직접입력 클릭시 
		$('.Email_addr').change(function(){
			var email =$('.Email_addr').val();
			if(email=='write'){
				$('#Email_host').val('');
				$('#Email_host').css('display','inline-block');
			}else{
				$('#Email_host').css('display','none');
				$('#Email_host').val(email);
			}
		});
		
		$('#uEmailchk').click(function(){
			var Email_host = $('#Email_host');
			var uEmail = $('#uEmail');
			var Email;
			if(uEmail.val() ==''){
				alert('이메일을 아이디를 입력해주세요.!');
				uEmail.focus();
			}else if($('#Email_host').val()==''){
				alert('도메인 주소를 입력해주세요.!');
				return;
			}else{
				Email = uEmail.val() + '@' + Email_host.val();
				$.ajax({
					url : 'uEmail_Auth',
					type : 'post',
					data : 'uEmail = ' + Email + '&uSerid=' + $('#uId').val(),
					success : function(data){
						$('.email_check').removeAttr('hidden');
						var start_min =5;
						var start_sec =0;
						setInterval(() => {
							if(start_sec==0){
								start_min -=1;
								start_sec =60;
							}else {
								start_sec -=1;
							}
							$('.time').text(start_min.length=1 ? '0'+start_min : start_min + ' : ' +start_sec >9 ?start_sec : '0'+start_sec);
						}, 1000);
					},error:function(){
						alert('ajax 통신실패');
					}
				});
			}
			 
			
		});
		
	});
	
</script>
<style>
	.wrap {
	    width: 1000px;
	    margin: 0px auto;
	}
	
	.reg-title h1{
		font-size: 44px;
	}
	.mreg-form {
		position:relative;
		width: 1000px;
		height: 500px;

	}
	.mreg-form .step2{
		display:none;
	}
	.mreg-form .form-style{
		position:relative;
		left:80px;
		width: 1000px;
		height : 50px; 
		margin-top:15px;
	}
	.mreg-form .form-style label{
		display:inline-block;
		text-align:center;
		width: 70px;
		height: 100%;
		margin-right: 15px;
	}
	.mreg-form .form-style input[type=text],input[type=password]{
		width: 400px;
		height: 32px;
	}
	.mreg-form .form-style #Email_host, .Email_addr{
		width: 150px;
		height: 32px;
	}
	.mreg-form .form-style #uEmail{
		width: 200px;
		height: 32px;
	}
	.mreg-form .form-style #uEmailchk{
		width: 150px;
		height: 32px;
		background: red;
		color:white;
	}
	
	
</style>
	
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
							<span class="idcheck"></span>
						</div>
						<div class="form-style">
							<label for = "uPw">비밀번호</label>
							<input type= "password" name="uPw" id="uPw">
						</div>
						<div class="form-style">
							<label for = "uPw2">비밀번호</label>
							<input type= "password" name="uPw2" id="uPw2">
							<span class="uPwcheck"></span>
						</div>
						<div class="form-style">
							<label for = "uPw2">이메일</label>
							<input type= "text" name="uEmail" id="uEmail">@
							<input type= "text" name="Email_host" id="Email_host">
							<select class="Email_addr">
								<option value="">선택</option>
								<option value="naver.com">naver.com</option>
								<option value="hanmail.net">hanmail.net</option>
								<option value="daum.net">daum.net</option>
								<option value="nate.com">nate.com</option>
								<option value="gmail.com">gmail.com</option>
								<option value="hotmail.com">hotmail.com</option>
								<option value="write">직접 입력</option>
																
							</select>
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
						<div class="controll-btns">
							<button class="cancel" id="cancel" >취소</button>
							<button class="next" id="step01-next" disabled="disabled">다음</button>
						</div>
					</div>
					<div class="step2">
						<div class="form-style">
							<label for = "uName">이름</label>
							<input type= "text" name="uName" id="uName">
						</div>
						<div class="form-style">
							<label for = "uPhone">전화번호</label>
							<input type= "text" name="uPhone" id="uPhone">
						</div>
						<div class="post_address">
							<input type="text" id="postcode" placeholder="우편번호" readonly="readonly">
							<input type="button" onclick="DaumPostcode()" value="우편번호찾기"/><br/>
							<input type="text" id="roadAddress" placeholder="도로명주소" readonly="readonly">
							<input type="text" id="jibunAddress" placeholder="지번주소" readonly="readonly">
							<span id="guide" style="color:#999;display:none"></span>
							<input type="text" id="detailAddress" placeholder="상세주소">
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	
</body>
</html>