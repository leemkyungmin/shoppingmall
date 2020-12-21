<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쇼핑몰</title>
	<link rel="stylesheet" href="resources/assets/style/template.css">
	<link rel="stylesheet" href="resources/assets/style/index.css">
	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$('.login').click(function(){
			location.href='login';
		});
		$('.logout').click(function(){
			if(confirm('로그아웃 하시겠습니까?')){
				$.ajax({
					url : 'logout',
					success :function(){
						alert('로그아웃 성공');
						location.href='index';
					},
					error : function(){
						alert('ajax 통신 실패 ');
					}
				});
			}
			
		});
		$('.register').click(function(){
			location.href="join/registerForm";
		})
	});
</script>


</head>
<body>

	<header>
		<div class="main-header">
			<ul class="header-style">
				<li>
					<a href="index">
						<img alt="메인 이미지" src="${pageContext.request.contextPath}/resources/assets/images/logo1.PNG">
					</a>
				</li>
				<li>
					<div class="search-bar">
						<form action="searchPage" class="search-form">
							<input type="text" name ="search-item" id="search-item" placeholder="검색할 단어를 입력하세요">
							<button id="searchBarBtn"><i class="fas fa-search"></i></button>
						</form>
					</div>
				</li>
				<li>
					#####실시간 차트 #####
				</li>
				
			</ul>
			<div class="title_menu">
				<div class="group_menu">
				
				</div>
				<div class="group_login_register">
					
					<c:if test="${sessionScope==null }">
						<button class="login">로그인</button>
						<button class="register">회원 가입</button>				
					</c:if>
					<c:if test="${sessionScope !=null }">
						<button class="myPage">마이페이지</button>
						<button class="logout">로그 아웃</button>				
					</c:if>
					
				</div>
			</div>
			
		</div>
		
		<!-- 로그인 세션을 통해서 사용자 정보가 있으면 마이페이지 ,배송조회 ,카트 등등 선택 메뉴 /// 없으면 회원가입 , 로그인  -->
		<div class="side_bar">
			<c:if test="${sessionScope.uSerid !=null }">
				세션있음
			</c:if>
			<c:if test="${sessionScope.uSerid ==null }">
				세션없음
			</c:if>
			<!-- 로그인 세션 처리후  -->
		</div>
	</header>
