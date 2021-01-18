<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 보기</title>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
	.content{
		margin: 10px 30px;
		height: 100%;
	}
	.userName{
		border-bottom: 1px solid black;
	}
	.user_table{
		margin-top:30px;
		width: 100%;
		border-collapse: collapse;
		
	}
	.user_table tbody tr{
		width: 100%;
		border-bottom :1px solid black;
		height: 40px;
	}
	.user_table tbody tr td:first-child{
		text-align: center;
		background-color: lightgray;
	}
	.user_table tbody tr td:nth-child(2n){
		padding-left: 20px;
	}
	.btn{
		margin:10px;
		position: absolute;
		bottom: 0;
		right: 30px; 
	}
	#grade{
		width: 150px;
		font-size: 15px;
	}
	#close_btn{
		border:0;
		width: 80px;
		height:30px;
		background: red;
		color: white;
		font-size: 15px;
	}
	#user_iframe{
		width: 100%;
		height: 500px;
	}
	.user-controll{
		margin-top: 20px;
	}
</style>
<script type="text/javascript">
	$().ready(function(){
		$('#close_btn').click(function(){
			window.close();
		});
		 var ugrade = ${udto.uGrade};
		 
		 $('#grade').val(ugrade);
		
		
		$(document).on('change','#grade',function(){
			if(prompt('관리자 코드를 입력해주세요','').trim() == 'lkmshoppingmall' ){
				var grade =$('#grade').val();
				$.ajax({
					url:'${pageContext.request.contextPath}/admin/user_update',
					data:'uidx='+${udto.uIdx} +'&grade='+grade,
					type:'post',
					success:function(data){
						
						if(data==1){
							alert('수정 완료');
						}
						
					},error:function(){
						console.log('error');
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
			<div class="userName">
				<h1>${udto.uName }님 회원정보</h1>
			</div>
			<table class="user_table">
				<tbody>
					<tr>
						<td>아이디</td>
						<td>${udto.uSerid }</td>
					</tr>
					
					<tr>
						<td>이름</td>
						<td>${udto.uName }</td>
					</tr>
					<tr>
						<td>연락처</td>
						<td>${udto.uPhone }</td>
					</tr>
					<tr>
						<td>이메일</td>
						<td>${udto.uEmail}</td>
					</tr>
					<tr>
						<td>등급</td>
						<td>
							<select id="grade">
								<option value="1">새싹회원</option>
								<option value="2">일반회원</option>
								<option value="3">우수회원</option>
								<option value="4">vip</option>
								<option value="5">vvip</option>
								<option value="9">관리자</option>
							</select>
						</td>
					</tr>
				</tbody>
			</table>
			<script type="text/javascript">
				$().ready(function(){
					init("user_buys");
					
					
					$('#user_buys').click(function(){
						init("user_buys");
					});
					$('#user_review').click(function(){
						init("user_review");
					});
					$('#user_customer_svc').click(function(){
						init("user_customer_svc");
					})
					
				});
				function init(url){
					document.ifrm.action ="${pageContext.request.contextPath}/admin/usercontroll/"+url;
					console.log(url);
					document.ifrm.submit();
				}
			</script>
			<div class="user-controll">
				<div class="btns">
					<input type="button" id="user_buys" value="구매목록" >
					<input type="button" id="user_review" value="리뷰목록">
					<input type="button" id="user_customer_svc" value="상담내역">
				</div>
				<form method="get" target="Uifream" name="ifrm">
					<input  type="hidden" id="uidx" name="uidx" value="${udto.uIdx }">
				</form>
				<iframe name="Uifream" id="user_iframe"></iframe>
			</div>
		</div>
		<div class="btn">
			<input type="button" id="close_btn" value="닫기">
			
		</div>
	</div>
	
</body>
</html>