<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쇼핑몰</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/style/template.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/style/index.css">
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
	
	
	
	$(document).on('click','#search-item',function(e){
		$('.group-search').addClass('show');
	});
	$(document).mouseup(function (e){
		  var LayerPopup = $(".group-search");
		  if(LayerPopup.has(e.target).length === 0){
		    LayerPopup.removeClass("show");
		  }
		});
	$('.cookie-btn').click(function(){
		var cookie_id = $(this).attr('id');
		var del_cookie =Cookies.getJSON('query');
		for(i = 0; i<del_cookie.length ; i++){
			for(keys in del_cookie[i]){
				if(del_cookie[i][keys] == cookie_id ){
					del_cookie.splice(i,1);
				}
			}
		}
		Cookies.set('query', del_cookie);
		console.log(del_cookie);
		search_cookies();
	});
	
	$(document).on('mouseover','#test',function(){
		$('.c_layer').addClass('active');
	});
	$(document).on('mouseout','.c_layer',function(){
		$('.c_layer').removeClass('active');
	});
	$(document).on('mouseover','.c_layer',function(){
		$('.c_layer').addClass('active');
	});
	
	/*$(document).on('mouseout','#test',function(){
		setTimeout(() => {
			$('.c_layer').removeClass('active');
			$(document).on('mouseover','.c_layer',function(){
				$('.c_layer').addClass('active');
			});
		}, 500);
		
	});*/
	$(document).mouseup(function (e){
		  var LayerPopup = $(".c_layer");
		  if(LayerPopup.has(e.target).length === 0){
		    LayerPopup.removeClass("active");
		  }
	});
	

});
</script>


</head>
<body id="body">

	<header>
		<div class="header-style">
			<div class="main-header">
				<a href="${pageContext.request.contextPath}/index">
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
				<div class="user-controll">
					<ul >
						<li class="user-icon">
							<i id="test"class="fas fa-user fa-2x"></i>
							<div class="c_layer">
								<ul>
									<li>
										<a href="${pageContext.request.contextPath}/order/OrderList">주문/배송 조회</a>
									</li>
									<li>
										<a href="${pageContext.request.contextPath}/order/CancelStatus">취소/반품/교환</a>
									</li>
									<li>
										<a href="">고객센터</a>
									</li>
									<li>
										<a href="member/confirmPassword">회원정보</a>
									</li>
									<c:if test="${sessionScope.uSerid !=null || sessionScope.dId !=null }">
										<li>
											<a href="${pageContext.request.contextPath}/logout">로그아웃 </a>
										</li>
									</c:if>
								</ul>
							</div>
						</li>
						<li class="user-icon">
							<i class="fas fa-truck-moving fa-2x"></i>
						</li>
						<li class="user-icon">
							<i class="fas fa-shopping-cart fa-2x"></i>
						</li>
					</ul>
				</div>
			</div>
		</div>
			<div class="title_menu" >
				<div class="shopping-list">
					<div class="group_menu">
						<ul>
							<li>의류</li>
							<li>식품</li>
							<li>뷰티</li>
							<li>가전제품 </li>
							<li>인테리어</li>
						</ul>
					</div>
					<div class="">
						<!-- 상단 li:hover 해당 div 표시 -->
					</div>
					<div class="group_login">
						<c:if test="${sessionScope.uSerid==null || sessionScope.dId==null}">
							<a class="login">로그인</a>
							<a class="register">회원가입</a>				
						</c:if>
						<c:if test="${sessionScope.uSerid!=null || sessionScope.dId!=null }">
							<a class="myPage">마이페이지</a>
							<a class="logout">로그아웃</a>				
						</c:if>
					
					</div>
				</div>
			</div>
		
		
		<!-- 로그인 세션을 통해서 사용자 정보가 있으면 마이페이지 ,배송조회 ,카트 등등 선택 메뉴 /// 없으면 회원가입 , 로그인  -->
		
	</header>
