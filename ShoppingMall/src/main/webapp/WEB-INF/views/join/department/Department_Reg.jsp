<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/Template/registerhearder.jsp" %>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="${pageContext.request.contextPath}/resources/assets/js/DaumPostcode.js"></script>

<style>
	.wrap {
	    width: 1000px;
	    height:1000px;
	    margin: 0px auto;
	}
	.wrap .wrap-content .reg-form{
		position:relative;
		width: 1000px;
		height: 500px;
	}
	.wrap .wrap-content .reg-form .form-style,.department-no,.post_address{
		position:relative;
		left:80px;
		width: 1000px;
		height : 50px; 
		margin-top:15px;
	}
	.post_address{
		height: 150px;
	}
	.wrap .wrap-content .reg-form label{
		display:inline-block;
		width: 100px;
		
	}
	.wrap .wrap-content .reg-form form input[type=text],input[type=password]{
		width: 400px;
		height: 32px;
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
	.btn-controll{
		width :1000px;
		text-align: center;
	}
	.btn-controll input[type=button]{
		margin : 5px;
		width:200px;
		height: 70px;
	}
</style>

<script>
	$().ready(function(){
		//header title 변경
		$('.reg_type').text('사업자 고객 회원가입');
		
		var dIdcheck = "Unchecked";
		var dPwcheck = "Unchecked";
		var dPhonecheck ="Unchecked";
		var dAddresscheck = "Unchecked";
		var dSaupcheck = "Unchehcked";
		
		$('#dId').keydown(function(){
			dIdcheck ="Unchecked";
			var dId =$('#dId').val();
			var id_span =$('.dIdcheck');
			if(dId.length >4 && dId.trim() != ''){
				$.ajax({
					url : 'dIdcheck',
					type : 'POST',
					data : 'dId='+dId,
					success : function(data){
						if(data=='0'){
							id_span.text('사용 가능한 아이디입니다.');
							dIdcheck='checked';
						}else {
							id_span.text('이미 사용중인 아이디입니다.');
							dIdcheck ="Unchecked";
						}
					},error : function(){
						alert('통신 실패');
					}
				});
			}else{
				dIdcheck ="Unchecked";
				return ;
			}
		});
		$('#saup-no').keydown(function(){
			dSaupcheck ="Unchecked";
			var saup_no =$(this).val();
			var saupcheck = $('.saupcheck');
			if(saup_no.length ==11){
				$.ajax({
					url : 'dSaup_nocheck',
					type : 'POST',
					data : 'dSaup_no='+saup_no,
					success : function(data){
						if(data =='0'){
							saupcheck.text('사용가능한 사업자 번호입니다..');
							dSaupcheck ="checked";
						}else{
							saupcheck.text('이미 사용중인 사업자 번호입니다.');
							dSaupcheck ="checked";
						}
					},error : function(){
						alert('통신 실패');
					}
				});
			}			
		});
		$('#dPw').keyup(function(){

			pwchk();
		});
		$('#dPw2').keyup(function(){

			pwchk();
		});
		function pwchk(){
			dPwcheck='Unchecked';
			var dPwchk = $('.dPwcheck');
			var dPw = $('#dPw').val();
			var dPw2 = $('#dPw2').val();
			var pwReg= new RegExp('^(?=.*[a-zA-Z])(?=.*[~!@#$%^*+=-])(?=.*[0-9]).{6,20}');
			var a1;			
			if(dPw.length > 5 && dPw2.length >5){
				if(dPw == dPw2){
					if(dPw =='' || dPw2 ==''){
						dPwchk.text('비밀번호를 입력해주세요.');
						dPwcheck='Unchecked';
					}else if(dPw.length<6){
						dPwchk.text('비밀번호는 6자 이상으로 입력해주세요');
						dPwcheck='Unchecked';
					}else if(!pwReg.test(dPw)){
						dPwchk.text('비밀번호 최소 6자 이상 문자 1개이상, 특수문자 를 입력해주세요');
						dPwcheck='Unchecked';
					}else{
						dPwchk.text('비밀번호가 일치합니다.');
						dPwcheck='checked';
					}	
				}else {
					dPwchk.text('비밀번호가 틀립니다.');
					dPwcheck='Unchecked';
				}
				   
			}
			
		}
		
		
		$('#cancel').click(function(){
			if(confirm('회원 가입을 취소하시겠습니까??')){
				location.href="/index";
			}else {
				return ;
			}
		});
		$('#success').click(function(){
			var fm =$('#fm');
			if(dIdcheck =='Unchecked'){
				alert('아이디를 확인해주세요!!');
				$('#dId').focus();
			}else if(dPwcheck =='Unchecked'){
				alert('비밀번호를 확인해주세요!!');
				$('#dPw').focus();
			}else if($('#dPhone').val() ==''){
				alert('연락처를 입력해주세요 ');
				$('#dPhone').focus();
			}else if(dSaupcheck =='Unchecked'){
				alert('사업자 번호를 확인해주세요!!');
				$('#dSaup_no').focus();
			}else if($('#detailAddress').val() ==''){
				alert('사업자 번호를 입력해주세요.!');
				DaumPostcode();
			}else{
				fm.submit();
			}
		});
	});
</script>
	<div class="wrap">
		<div class="wrap-content">
			<div class="reg-form">
				<form action="department_reg_success" name="fm" id="fm" method="POST">
					<div class="department-no">
						<label for ="saup-no">사업자 번호</label>
						<input type="text" name="saup-no" id="saup-no" placeholder="사업자번호(-)빼고" maxlength="11">
						<span class="saupcheck"></span>
					</div>
					<div class="department-info">
						<div class="dInfo">
							<div class="form-style">
								<label for="dName">사업자명</label>
								<input type="text" name="dName" id="dName" placeholder="사업자명">							</div>
							<div class="form-style">
								<label for="dId">아이디</label>
								<input type="text" name="dId" id ="dId" placeholder="아이디">
								<span class="dIdcheck"></span>
							</div>
							<div class="form-style">
								<label for="dPw">비밀번호</label>
								<input type="password" name="dPw" id ="dPw" placeholder="비밀번호 ">
							</div>
							<div class="form-style">
								<label for="dPw2"></label>
								<input type="password" name="dPw2" id ="dPw2" placeholder="비밀번호  확인">
								<span class="dPwcheck"></span>
							</div>
							<div class="form-style">
								<label for="dPhone">전화번호</label>
								<input type="text" name="dPhone" id="dPhone" maxlength ="11" placeholder="전화번호 (-)빼고">
								<span class="dPhonecheck"></span>
							</div>
							<div class="post_address">
								<div class="post-lable">
									<label for="postbtn">주소</label> 
								</div>
								<div class="post-addr">
									<input type="text" id="postcode" name="postcode" placeholder="우편번호" readonly="readonly">
									<input type="button" id="postbtn" onclick="DaumPostcode()"  value="우편번호찾기"/><br/>
									<input type="text" id="roadAddress" name="roadAddress" placeholder="도로명주소" readonly="readonly">
									<input type="text" id="jibunAddress" name="jibunAddress" placeholder="지번주소" readonly="readonly">
								<span id="guide" style="color:#999;display:none"></span><br/>
								<input type="text" id="detailAddress" name="detailAddress" placeholder="상세주소" >
								</div>
								<input type="hidden" id="dType" name="dType" value="${dType}=='buy' ? 1 : 0 ">
							</div>
							<div class="btn-controll">
								<input type="button" id="cancel" value="취소">
								<input type="button" id="success" value="회원가입">
							</div>
						</div>	
						
					</div>
				</form>
			</div>
		</div>
	</div>
	
</body>
</html>