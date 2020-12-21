<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../Template/registerhearder.jsp" %>

<style>
	.register_wrap .register_img .join_person{
		position:relative;
		margin : 10px 300px 50px;
		background: url("../resources/assets/images/register_img.gif") no-repeat 0 0;
		background-size : 100%;
		height: 500px;
	
	}
	.register_hello{
		position:absolute;
		color: yellow;
	    height: 250px;
	    left : 25%;
	    top: 30%;
	    font-weight: bold;
	    font-size: 40px;
	    
	}
	.join_person .uResiter_btn{
		position:absolute;
		left: 25%;
		top: 65%;
	}
	.join_person .uResiter_btn .uResiter{
		width: 255px;
	    height: 50px;
	    border: 4px solid white;
	    padding: 10px;
		
	}
	hr,.join_department{
		margin: 0px 300px;
	}
	.join_person .uResiter_btn .uResiter a{
		font-size : 40px;
		text-decoration: none;
		width: 300px;
		height: 100px;
		
	}
	a:link {
		color:green;
		text-decoration: none;
	}
	a:visited { 
		color:green;
		text-decoration: none;
	}
	a:hover { 
		color:green; 
		text-decoration: underline;
	}
	.register_wrap .user,.customer{
		margin: 20px 300px 0px;
	}
	.join_department .department_choice li{
		display:inline-block;
		margin-top : 10px;
		padding : 20px 30px;
		border-left: 1px solid gray;
	}
	.join_department .department_choice li em{
		font-size: 19px;
	}
	.join_department .department_choice li em span{
		font-weight: bold;
		color: red;
	}
	.department_choice{
		padding-left: 200px;
	}
	.join_department .department_choice li a{
		padding :10px 20px;
		border: 2px solid lightgray;
	}
</style>
<script>
	$('.step1').addClass('on');
	$('.step2').removeClass('on');
	$('.step3').removeClass('on');
	$('.step4').removeClass('on');
</script>
	
 	<div class="register_wrap">
 		<div class="user">
 			일반 회원 가입 
 		</div>
 		<div class="register_img">
 			<div class="join_person">
 				<p class="register_hello">
 					안녕하세요. <br/>
 					lkmShoppingmall에 오신걸 환영합니다.
 					 
 				</p>
 				<div class="uResiter_btn">
	 				<div class= "uResiter">
	 					<a href= "userRegisterForm">일반회원 가입</a>
	 				</div>
 				</div>
 			</div>
 		</div>
 		<hr/>
 		<div class="customer">
 			기업 회원 가입 
 		</div>
 		<div class="join_department">
 			<ul class="department_choice">
 				<li>
 					<em>
 						<span>사업자</span>
 						구매회원
 					</em>
 					<p>
 						사업자 등록증을 보유한<br>
 						구매회원
 					</p>
 					<a href="department_Reg?dType=buy">
 						가입하기
 					</a>
 				</li>
 				<li>
 					<em>
 						<span>사업자</span>
 						판매회원
 					</em>
 					<p>
 						사업자 등록증을 보유한<br>
 						판매회원
 					</p>
 					<a href="department_Reg?dType=sell">
 						가입하기
 					</a>
 				</li>
 				<li>
 					<em>
 						<span>개발 예정</span>
 						개발 예정
 					</em>
 					<p>
 						개발 예정<br>
 						개발 예정
 					</p>
 					<a href="#" style="visibility:hidden">
 						가입하기
 					</a>
 				</li>
 				<li>
 					<em>
 						<span>개발 예정</span>
 						개발 예정
 					</em>
 					<p>
 						개발 예정<br>
 						개발 예정
 					</p>
 					<a href="#" style="visibility:hidden">
 						가입하기
 					</a>
 				</li>
 			</ul>
 		</div>	
 	</div>
 
 
</body>
</html>