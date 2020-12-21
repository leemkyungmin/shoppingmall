<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE >
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입 -lkmShoppingmall</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script> <!-- 부스트스랩 (modal 창 사용하기 위한 js파일)  -->
<style type="text/css">
	.reg_header, .wrap{
		position: relative;
		margin : 50px 300px 0px;
		border-bottom: 1px solid black;
	}
	.reg_header h1,ol{
		display:inline-block;
	}
	
	.reg_header h1 img{
		width: 150px;
		height: 40px;
	}
	ul,ol{
		list-style: none;
	}
	.reg_header ol{
		
		position:absolute;
		right:0;
		margin-top:35px;
			
	}
	.reg_header .location li{
		float: left;
	    margin-left: 18px;
	    font-size: 20px;
	    letter-spacing: -0.5px;
	    color: #999;
	    
	}
	.reg_header .location li .on{
		color: #111;
   		font-weight: bold;
	}
	.reg_header h1 span{
		display:inline-block;
		vertical-align: middle;
		margin-bottom: 28px;
	}
	.location li.on {
	    color: #111;
	    font-weight: bold;
    }
</style>

</head>
<body>
	<header class="reg_header">
		<h1>
			<img alt="메인 로고" src="../resources/assets/images/logo1.PNG" onclick="location.href='../index'">
			<span class="reg_type"></span>
		</h1>
		<ol class="location">
			<li class="step1">1 회원선택</li>
			<li class="step2">2 약관동의</li>
			<li class="step3">3 정보입력</li>
			<li class="step4">4 가입완료</li>
		</ol>
	</header>