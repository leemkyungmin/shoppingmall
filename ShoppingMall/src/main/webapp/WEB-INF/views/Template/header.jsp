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
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/assets/js/header_search_cookie.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/js-cookie/2.2.1/js.cookie.js"></script>	
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
	
	$('.header-search').click(function(){
		
	});
	$('#searchBarBtn').click(function(){
		var query =$('#search-item');
		var fm =$('#fm');
		if(query.val() !=''){
			fm.submit();
		}else{
			alert('검색할 내용을 입력해주세요');
			query.focus();
		}
	});	
	//검색 쿠키 
	
	search_cookies();
	
	//검색바 클릭시
	
	/*var btn =document.getElementById("search-item");
	var body = document.getElementById('body');
	console.log(btn);
	console.log(body);
	btn.addEventListener('click',function(){
		if($('.group-search').css('display','none')){
		    $('.group-search').toggle();
		}
	})
	body.addEventListener('click',function(e){
		e.stopPropagation();
		if($(e.target).find('search-item')){
			
		}else{
			$('.group-search').toggle();
		}
		
			
		
	})
	  $('#search-item').click(function(event){
		if($('.group-search').css('display','none')){
		    $('.group-search').toggle();
		}
	}); 
	$('body').click(function(event){
		event.stopPropagation();
		if($('.group-search').css('display','none')){
		    $('.group-search').toggle();
		}else{
			 $('.group-search').toggle();
		}

		
	}); */ 
	
	$(document).on('click','#search-item',function(e){
		$('.group-search').addClass('show');
	});
	$(document).mouseup(function (e){
		  var LayerPopup = $(".group-search");
		  if(LayerPopup.has(e.target).length === 0){
		    LayerPopup.removeClass("show");
		  }
		});
	});
</script>


</head>
<body id="body">

	<header>
		<div class="header-style">
			<div class="main-header">
				<a href="index">
					<img class="header-logo" alt="메인 이미지" src="${pageContext.request.contextPath}/resources/assets/images/logo1.PNG">
				</a>
					
				<div class="header-search" id="header-search">
					<form action="search" name="fm">
						<fieldset>
							<legend>검색</legend>
							<div class="search-bar">
								<input type="text" name ="search-item" id="search-item" placeholder="검색할 단어를 입력하세요" autocomplete="off">
								<button id="searchBarBtn"><i class="fas fa-search fa-2x"></i></button>
							</div>
							
							<div class="group-search">
								<div class="search_word">
									<div class="mysearch">
										<div class="mysearch-title">
											<h2>최근 검색어</h2>
										</div>
										<div class="mysearch-content">
											<ul class="slist">
												
											</ul>
										</div>
									</div>
									<div class="top10-list">
										<div class="top10-list-title">
											<h2>실시간 쇼핑 검색어</h2><span class="top10_by_time"></span>
										</div>
									</div>
								</div>
								
							</div>		
									
						</fieldset>
					</form>
				</div>
				<div class="livechart">
					#####실시간 차트 #####
				</div>
			</div>
		</div>
			<div class="title_menu" >
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
