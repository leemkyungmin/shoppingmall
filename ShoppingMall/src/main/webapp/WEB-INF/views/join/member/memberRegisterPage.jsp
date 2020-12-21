<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/Template/registerhearder.jsp" %>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="${pageContext.request.contextPath}/resources/assets/js/DaumPostcode.js"></script>
<script>
	$().ready(function(){
		//header title 변경
		$('.reg_type').text('일반 회원 가입');
		
		$('#Email_host').css('display','none');
		var idChecked = 'Unchecked';
		var pwChecked ='Unchecked';
		var emailChecked ='Unchecked';
		$('#uId').keyup(function(){
			var uid = $('#uId').val();
			var idk =$('.idcheck');
			if(id.length ==0){
				idk.empty();				
			}else{
				$.ajax({
					url : 'uIdcheck',
					type : 'post',
					data : 'uId='+id,
					success : function(data){
						if(data =='0'){
							idk.empty();
							idk.text('사용 가능한 아이디입니다.');
							idChecked = 'checked';
						}else{
							idk.empty();
							idk.text('이미 사용중인 아이디입니다.');
							$('#uId').focus();
							idChecked = 'Unchecked';
						}
					},
					error : function(){
						idChecked = 'Unchecked';
						alert('ajax 통신 실패');
					}
					
				});
				  ;
			}
			
		});
		$('#uPw').keyup(function(){

			pwchk();
		});
		$('#uPw2').keyup(function(){

			pwchk();
		});
		function pwchk(){
			pwChecked='Unchecked';
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
						pwChecked='Unchecked';
					}else if(uPw.length<6){
						uPwchk.text('비밀번호는 6자 이상으로 입력해주세요');
						pwChecked='Unchecked';
					}else if(!pwReg.test(uPw)){
						uPwchk.text('비밀번호 최소 6자 이상 문자 1개이상, 특수문자 를 입력해주세요');
						pwChecked='Unchecked';
					}else{
						uPwchk.text('비밀번호가 일치합니다.');
						pwChecked='checked';
					}	
				}else {
					uPwchk.text('비밀번호가 틀립니다.');
					pwChecked='Unchecked';
				}
				   
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
		var Email_Auth_key ;
		var click;
		$('#uEmailchk').click(function(){
			Email_Auth_key ='';
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
					type : 'POST',
					data : 'uEmail=' + Email + '&uSerid=' + $('#uId').val(),
					success : function(data){
						Email_Auth_key=data;
						$('#myModal').show();
						var start_min =5;
						var start_sec =0;
						click =setInterval(() => {
							if(start_min ==0 && start_sec ==0){
								clearInterval(click);
								alert('인증 시간이 만료되었습니다.');
								email_auth_cancel();
							}else{
								if(start_sec==0){
									start_min -=1;
									start_sec =60;
								}else {
									start_sec -=1;
								}
								if(start_min ==0 && start_sec == 0){
									clearInterval();
								}
								$('.time').text((start_min.length=1 ? '0'+start_min : start_min) + ' : ' +(start_sec >9 ?start_sec : '0'+start_sec));
							}
							
						}, 1000);
						
					},error:function(){
						alert('ajax 통신실패');
					}
				});
			}
			
		});
		//생성된 인증번호와 사용자가 입력한 인증번호를 검사하는 clickEvent
		$('.auth-check').click(function(){
			var uEmail_auth = $('#uEmail-auth').val();
			if(Email_Auth_key == uEmail_auth){
				alert('인증 성공');
				
				clearInterval(click);
				emailChecked ='checked';
				$('#myModal').hide();
			
				return;
			}else{
				alert('인증 번호를 확인해주세요');
				emailChecked ='Unchecked';
			}
		});
		$('#email_auth_cancel').click(function(){
			email_auth_cancel();
			clearInterval(click);
		});
		function email_auth_cancel(){
			Email_Auth_key ='';
			emailChecked ='Unchecked';
			$('#uEmail-auth').val('');
			$('#myModal').hide();
			
		}
		
		
		$('#step01-next').click(function(){
			if(idChecked =='Unchecked'){
				alert('이미 사용중인 아이디 이거나 아이디가 입력되지 않았습니다.').
				$('#uId').focus();
			}else if(pwChecked =='Unchecked'){
				alert('비밀번호가 틀리거나 조건이 맞지 않습니다.').
				$('#uPw').focus();
			}else if(emailChecked =='Unchecked'){
				alert('이메일 인증하지 않았습니다..').
				$('#uEmail').focus();
			}else{
				$('.step1').css({'display' : 'none'});
				$('.step2').css({'display' : 'block'});
			}
			
			
		});
		$('#cancel').click(function(){
			if(confirm('회원 가입을 취소하시겠습니까?')){
				location.href='index';
			}else{
				return;
			}
		});
		
		$('#reg_cancel').click(function(){
			if(confirm('회원 가입을 취소하시겠습니까?')){
				location.href='index';
			}else{
				return;
			}
		});
		
		
		var uPhonechecked ="Unchecked";
		var uPhoneReg = new RegExp('(01[016789])([1-9]{1}[0-9]{2,3})([0-9]{4})$');
		$('#uPhone').keyup(function(){
			var uPhone = $('#uPhone').val();
			var uPhone_check =$('.uPhone_check');
			if(uPhone.length == 11){
				if(uPhoneReg.test(uPhone)){
					uPhonechecked = "checked";
					uPhone_check.text('사용 가능한 번호');
				}else{
					uPhonechecked = "Unchecekd";
					uPhone_check.text('형식에 맞지 않는 번호');
				}
			}else {
				uPhonechecked =="Unchecked";
				uPhone_check.text('휴대폰번호 11자리(하이픈 빼고 입력해주세요)');
			}
		});
		$('#reg_complate').click(function(){
			if(idChecked =='checked' && uPhonechecked =='checked' && pwChecked =='checked' && emailChecked =='checked' && $('#uName').val().length !=0){
				$('#fm').submit();
			}else{
				alert('잘못된 정보가 입력됬습니다. 다시 작성해주세요');
				$('.step1').css({'display' : 'block'});
				$('.step2').css({'display' : 'block'});
				$('#fm').reset();
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
	
	.mreg-form .form-style{
		position:relative;
		left:80px;
		width: 1000px;
		height : 50px; 
		margin-top:15px;
	}
	.post_address{
		position:relative;
		left:80px;
		width: 1000px;
		height : 150px; 
		margin-top:15px;
	}
	.mreg-form .form-style label {
		display:inline-block;
		text-align:center;
		width: 70px;
		height: 100%;
		margin-right: 15px;
	}
	.uEmail-auth-label{
		display:inline-block;
		text-align:center;
		width: 70px;
		margin-right: 15px;
	}
	.mreg-form .form-style input[type=text],input[type=password] ,#uEmail-auth{
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
	.modal-backdrop fade in{
		height: 0;
	}
	#Modal,#myModal {
         display: none;
	    position: absolute;
	    margin: auto;
	    width: 700px;
	    height: 800px;
	    z-index: 1;
	    left: 17%;
	    top: 41%;
    }
        
    #Modal h2{
    	margin:0;
   	}
  
    #Modal .modal-content,#myModal .modal-body {
	    width:100%;
	    height:100px;
	    margin:0px auto;
	    padding:20px 10px;
	    background:#fff;
    }
    .modal-foot{
   		width:100%;
	    height:100px;
	    text-align:center;
	    margin:0px auto;
	    padding:20px 10px;
	    background:#fff;
    }
    .modal-foot input[type=button]{
    	    width: 150px;
    		height: 50px;
    }
    #myModal .modal-title {
    	width: 700px;
    	position: relative;
    	height: 100%;
    line-height: 100%;
         
	}
	#myModal .modal-title .title {
		position: absolute;
		text-align: center;
		/* left: 10px; */
		width: 100%;
		font-size: 18px;
	}
	#Modal .modal-content,#myModal .modal-title .close {
    	position: absolute;
   		right: 30px;
         
	}
        
	#Modal .modal_layer ,#myModal .modal_layer{
    	position:fixed;
    	top:0;
    	left:0;
		width:100%;
   		height:100%;
    	background:rgba(0, 0, 0, 0.5);
     	z-index:-1;
	}
	#myModal .modal-header{
		position: relative;
		width: 700px;
		height: 46px;
		background: white;
		border-bottom: 1px solid black;
		padding:10px 10px;
	}
	.modal-header >button{
		position: absolute;
		bottom: 0;
		right: 10px;
	}
	.controll-btns{
		width: 100%;
		height: 200px;
		text-align: center;
		
	}
	.controll-btns input[type=button],.form-style input[type=button]{
		width: 200px;
	    height: 50px;
	    margin: 20px;
	}
	.auth-check{
		width: 100px;
		height: 32px;
		margin-left  :20px;
	}
	.mreg-form .step2{
		display:none; 
	} 
	.step2 .post_address input{
		width: 200px;
	    height: 32px;
	    margin: 2px auto;
	}
	.step2 .post_address input[type=text]:last-child {
		width: 300px;
	    height: 32px;
	    margin: 2px auto;
	}
	.post_address lebel{
		height: 100px;
	}
	.post_address .post-lable{
		position: relative;
    	height: 100px;
	}
	.post_address .post-addr{
		position: absolute;
	    left: 100px;
	    top: 0px;
	}
</style>
	<div class="wrap">
		<div class="wrap-content">
			<div class="reg-title">
				<h1>가입 정보 입력</h1>
			</div>
			<div class="mreg-form">
				<form  method="post" action="memberRegSuccess" id="fm">
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
						
						<div class="controll-btns">
							<input type="button" class="cancel" id="cancel" value="취소" >
							<input type="button" id="step01-next" value="다음">
						</div>
					</div>
					<div class="step2">
						<div class="form-style">
							<label for = "uName">이름</label>
							<input type= "text" name="uName" id="uName" placeholder="이름">
						</div>
						<div class="form-style">
							<label for = "uPhone">전화번호</label>
							<input type= "text" name="uPhone" id="uPhone" placeholder="전화번호 하이픈(-)빼고" maxlength="11">
							<span class="uPhone_check"></span>
						</div>
						<div class="post_address">
								<div class="post-lable">
									<label for="postbtn">주소</label> 
								</div>
								<div class="post-addr">
									<input type="text" id="postcode" name="postcode" placeholder="우편번호" readonly="readonly">
									<input type="button" id="postbtn" onclick="DaumPostcode()" value="우편번호찾기"/><br/>
									<input type="text" id="roadAddress" name="roadAddress" placeholder="도로명주소" readonly="readonly">
									<input type="text" id="jibunAddress" name="jibunAddress" placeholder="지번주소" readonly="readonly">
								<span id="guide" style="color:#999;display:none"></span><br/>
								<input type="text" id="detailAddress" name="detailAddress" placeholder="상세주소">
								</div>
								
							</div>
						<div class="form-style">
							<input type="button" class="reg_controll" id="reg_cancel" value="회원가입 취소">
							<input type="button" class="reg_controll" id="reg_complate" value="회원가입 ">
						</div>
					</div>
				</form>
			</div>
		</div>
		<div id="myModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-header" data-backdrop="static">
			<!-- data-dismiss="modal" -->
		<div class="modal-title" data-backdrop="static">
			<div class="email-check_title">
					<h1>입력하신 이메일로 인증코드를 입력해주세요!</h1>
			</div>
			
		</div>   	
			
		</div>
		<div class="modal-body" data-backdrop="static">
			<div class="email_check">
				<label for="uEmail-auth" class="uEmail-auth-label">
				인증번호</label><input type="text" id="uEmail-auth"><br/>
				<label class="left_time">남은 시간 :</label> <span class="time"></span>
								
			</div>
		</div>
		<div class="modal-foot" data-backdrop ="static">
			<input type="button" id ="email_auth_cancel" value="취소">
			<input type="button" class="auth-check" value="입력" data-toggle="modal" data-target="#myModal">
		</div>
		
				  
		<div class="modal_layer" data-backdrop="static"></div>
	</div>
	<script>
		
		$().ready(function(){
			setInterval(() => {
				if($('.modal-backdrop').val()==''){
					$('.modal-backdrop').remove();
				}	
			}, 500);
		});
		//Modal 버튼 Controll
		
	</script> 
	</div>
	
</body>
</html>