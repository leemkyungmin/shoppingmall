<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/style/PopupLogin.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script type="text/javascript">
		$().ready(function(){
			$('.user').click(function(){
				if(!$(this).hasClass('selected')){
					$(this).addClass('selected');
					$('.dept').removeClass('selected');
				}
				$('#type').val('user');
			});
			$('.dept').click(function(){
				if(!$(this).hasClass('selected')){
					$(this).addClass('selected');
					$('.user').removeClass('selected');
				}
				$('#type').val('dept');
			});
			
			$(document).on('click','#login',function(){
				
				var id = $('#id');
				var pw =$('#pw');
				var type =$('#type').val();
				if(id .val()==''){
					alert('아이디를 입력해주세요');
					id.focus();
				} else if(pw.val() ==''){
					alert('비밀번호를 입력해주세요');
					pw.focus();
				} else{
					
					$.ajax({
						url:'${pageContext.request.contextPath}/product/buy/loginchk',
						type:'post',
						data:'id='+id.val() + '&pw='+pw.val() +'&type='+type,
						success:function(data){
							
							if(data ==0){
								alert('로그인 실패'); 
							} else { 
								
								opener.$('#fm').submit();
								window.close();
								
							}
						} ,error:function(){
							alert('통신실패');
						}
					});
				}
				
				
			});
			
		});
	</script>

</head>
<body>
	<div class="wrap">
		<div class="content">
			<div class="content_logo">
				<img alt="" src="${pageContext.request.contextPath}/resources/images/쇼핑몰_로고.PNG">
			</div>
			<div class="lcontent">
				<div class="login_type">
					<div class="user selected">일반회원
					</div>
					<div class="dept">
						기업회원
					</div>
				</div>
				<div class="login_form">
					<div class="id_form">
						<input type="text" name="id" id="id" placeholder="아이디">
					</div>
					<div class="pw_form">
						<input type="password" name="pw" id="pw" placeholder="비밀번호">
					</div>
					<div class="login_btn">
						<input type="hidden" id="type" value="user">
						<input type="button" id="login" value="로그인">
					</div>
					<div class="find_info">
						<div class="id_pw_find">
							<a id="find_id">아이디 찾기</a> / 
							<a id="find_id">비밀번호 찾기</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		
	</div>
</body>
</html>