<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
	#dept_iframe{
		width: 100%;
		height: 500px;
		border:0;
	}
	.user-controll{
		margin-top: 20px;
	}
	.user-controll .btns{
		width: 100%;
	}
	.user-controll .btns  input[type=button]{
		float: left;
		width: 100px;
		height: 40px;
		border:0;
	}
	.user-controll .btns .b.active{
		background-color: red;
		color:white;
		font-weight: bold;
	}
</style>
<script type="text/javascript">
	$().ready(function(){
		$('#close_btn').click(function(){
			window.close();
		});
		 
		
	});
</script>

</head>
<body>
	<div class="wrap">
		<div class="content">
			<div class="userName">
				<h1>${deptdto.dName }님 회원정보</h1>
			</div>
			<table class="user_table">
				<tbody>
					<tr>
						<td>아이디</td>
						<td>${deptdto.dId }</td>
					</tr>
					
					<tr>
						<td>상호명</td>
						<td>${deptdto.dName}</td>
					</tr>
					<tr>
						<td>사업자 번호</td>
						<td>${deptdto.dSaup_no }</td>
					</tr>
					<tr>
						<td>연락처</td>
						<td>${deptdto.dPhone }</td>
					</tr>
					<tr>
						<td>주소</td>
						<td>
							<c:set var="address" value="${deptdto.dAddress }"></c:set>
							<c:set var="post_addr" value="${fn:substringBefore(address,'/') }"/>
							<c:set var="road_addr" value="${fn:substringAfter(address,'/') }"/>
							(${post_addr }) ${road_addr } 
						</td>
					</tr>
					<tr>
						<td>회원분류</td>
						<td>
							<span style="color:red">${deptdto.dType eq 'sell' ?'판매회원' :'구매회원' }</span>
						</td>
					</tr>
					<tr>
						<td>가입일</td>
						<td>${deptdto.dReg_date}</td>
					</tr>
				</tbody>
			</table>
			<script type="text/javascript">
				$().ready(function(){
					init($('.btns input:first-child').data('remote'));
					$('.btns input:first-child').addClass('active');
					
					$('#dept_sell_product').click(function(){
						if(!$(this).hasClass('active')){
							init("dept_sell_product");
							$('.user-controll .btns .b').removeClass('active');
							$(this).addClass("active");
						} 					
					});
					$('#dept_sell_record').click(function(){
						if(!$(this).hasClass('active')){
							init("dept_sell_record");
							$('.user-controll .btns .b').removeClass('active');
							$(this).addClass("active");
						}
					
					});
					$('#dept_customer_svc').click(function(){
						if(!$(this).hasClass('active')){
							init("dept_customer_svc");
							$('.user-controll .btns .b').removeClass('active');
							$(this).addClass("active");
						} 
						
					});
					$('#dept_buys').click(function(){
						if(!$(this).hasClass('active')){
							init("dept_buys");
							$('.user-controll .btns .b').removeClass('active');
							$(this).addClass("active");
						} 
						
					});
					$('#dept_review').click(function(){
						if(!$(this).hasClass('active')){
							init("dept_review");
							$('.user-controll .btns .b').removeClass('active');
							$(this).addClass("active");
						} 
						
					});
					
				});
				function init(url){
					document.ifrm.action ="${pageContext.request.contextPath}/admin/deptcontroll/"+url;
					console.log(url);
					document.ifrm.submit();
				}
			</script>
			<div class="user-controll">
				<div class="btns">
					<c:if test="${deptdto.dType eq 'sell' }">
						<input type="button" class="b" id="dept_sell_product" value="판매 상품목록"  data-remote="dept_sell_product">
						<input type="button" class="b" id="dept_sell_record" value="판매 기록">
					</c:if>
					<c:if test="${deptdto.dType ne 'sell' }">
						<input type="button" class="b" id="dept_buys" value="구매목록" data-remote="dept_buys" >
						<input type="button" class="b" id="dept_review" value="리뷰목록">
					</c:if>
					<input type="button" class="b" id="dept_customer_svc" value="상담내역">
				</div>
				<form method="get" target="Uifream" name="ifrm">
					<input  type="hidden" id="didx" name="didx" value="${deptdto.dIdx }">
				</form>
				<iframe name="Uifream" id="dept_iframe"></iframe>
			</div>
		</div>
		<div class="btn">
			<input type="button" id="close_btn" value="닫기">
			
		</div>
	</div>
	
</body>
</html>