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
	<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">
	<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<script type="text/javascript">    
	$(document).ready(function(){
		$('.login').click(function(){
			location.href='${pageContext.request.contextPath}/login';
		});
		$('.logout').click(function(){
			if(confirm('로그아웃 하시겠습니까?')){
				$.ajax({
					url : '${pageContext.request.contextPath}/logout',
					success :function(){
						alert('로그아웃 성공');
						location.href='${pageContext.request.contextPath}/index';
					},
					error : function(){
						location.href='${pageContext.request.contextPath}/login';
					}
				});
			}
			
		});
		$('.register').click(function(){
			location.href="${pageContext.request.contextPath}/join/registerForm";
		})
		$('.myPage').click(function(){
			location.href="${pageContext.request.contextPath}/my/confirmPassword";
		});
		
		$('.myproducts').click(function(){
			location.href="${pageContext.request.contextPath}/product/myproduct";
		});
		
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
	
	search_cookies('${pageContext.request.contextPath}');
	
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
	$(document).on('click','.cookie-btn',function(){
		var cookie_id = $(this).attr('id');
		var del_cookie =new Array();
		 del_cookie = JSON.parse(localStorage.getItem('query'));
		for(i = 0; i<del_cookie.length ; i++){
			for(keys in del_cookie[i]){
				if(del_cookie[i][keys] == cookie_id ){
					del_cookie.splice(i,1);
				}
			}
		}
		localStorage.setItem('query', JSON.stringify(del_cookie));
		console.log(del_cookie);
		search_cookies('${pageContext.request.contextPath}');
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
	
	
	$('#test').click(function(){
		location.href="${pageContext.request.contextPath}/order/OrderList";
	});
	$('#move_orderlist').click(function(){
		location.href="${pageContext.request.contextPath}/order/OrderList";
	});
	$('#move_myCartList').click(function(){
		location.href="${pageContext.request.contextPath}/my/myCartList";
	});
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
				<div class="header-content">
				
					<div class="headerBar">
						<i class="fas fa-bars fa-2x"></i>
					</div>
					
					<a href="${pageContext.request.contextPath}/index">
						<img class="header-logo" alt="메인 이미지" src="${pageContext.request.contextPath}/resources/assets/images/logo1.PNG">
					</a>
						
					<div class="header-search" id="header-search">
						<form action="${pageContext.request.contextPath}/search" name="fm">
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
										
									</div>
									
								</div>		
										
							</fieldset>
						</form>
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
											<a href="${pageContext.request.contextPath}/order/OrderCancelList">취소/반품/교환</a>
										</li>
										<li>
											<a href="${pageContext.request.contextPath}/my/CustomerService">고객센터</a>
										</li>
										<li>
											<a href="${pageContext.request.contextPath}/my/confirmPassword">회원정보</a>
										</li>
										<c:if test="${sessionScope.idx !=null }">
											<li>
												<a href="${pageContext.request.contextPath}/logout">로그아웃 </a>
											</li>
										</c:if>
									</ul>
								</div>
							</li>
							<li id="move_orderlist" class="user-icon">
								<i class="fas fa-truck-moving fa-2x"></i>
							</li>
							<li class="user-icon" id="move_myCartList">
								<i class="fas fa-shopping-cart fa-2x"></i>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
			<div class="title_menu" >
				<div class="shopping-list">
					
					<div class="group_login">
						<c:if test="${sessionScope.idx ==null}">
							<a class="login">로그인</a>
							<a class="register">회원가입</a>				
						</c:if>
						<c:if test="${sessionScope.idx !=null }">
							<c:if test="${sessionScope.buysell eq 'sell' }">
								<a class="myproducts">내 상품</a>
							</c:if>
							<a class="myPage">마이페이지</a>
							<a class="logout">로그아웃</a>	
							<c:if test="${sessionScope.type=='user' &&sessionScope.grade == 9  }">
								<a class="adminPage">관리페이지</a>
							</c:if>		
						</c:if>
					
					</div>
				</div>
			</div>
		<script type="text/javascript">
			$().ready(function(){
				$('.adminPage').click(function(){
					location.href='${pageContext.request.contextPath}/admin/adminPage';
				});
			});
			
		</script>
		
		<!-- 로그인 세션을 통해서 사용자 정보가 있으면 마이페이지 ,배송조회 ,카트 등등 선택 메뉴 /// 없으면 회원가입 , 로그인  -->
		
	</header>
