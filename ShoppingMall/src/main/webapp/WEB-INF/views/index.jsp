<%@page import="java.util.Map"%>
<%@page import="org.springframework.ui.Model"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.lkm.shoppingmall.dto.bannerDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="Template/header.jsp" %>
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
<link href='https://fonts.googleapis.com/css?family=Anton' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Neucha' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@splidejs/splide@latest/dist/css/splide.min.css">

	<script>
	$(function(){
		  
		});
	</script>
  <div class="wrap">
  
  	<div class="splide">
		<div class="splide__track">
			<ul class="splide__list">
			<c:forEach var="bimg" items="${bdto}">
				<li class="splide__slide">
					 <img class="bimgs" alt="${bimg.bFileinfo }" src="resources/assets/images/bannerImg/${bimg.bFilename}">
				</li>
			</c:forEach>
				
				
			</ul>
		</div>
	</div>
		
	<div class="user_main">
		<div class="recent_products">
			<div class="recent_product_info">
				<h1>최근 본 상품</h1>
			</div>
			<div class="recent_list">
				<div class="slide">
					<ul>
						<li>
							<div class="products_wrap">
								<div class="products">
									<img alt="" src="">
								</div>
								<div class="pnote">
									<div class="pinfo">
										<strong>
											<span class="products_info"></span>
										</strong>
									</div>
									<div class="pPrice">
									</div>
								</div>
							</div>

						</li>
						<li>
							<div class="products_wrap">
								<div class="products">
									<img alt="" src="">
								</div>
								<div class="pnote">
									<div class="pinfo">
										<strong>
											<span class="products_info"></span>
										</strong>
									</div>
									<div class="pPrice">
									</div>
								</div>
							</div>

						</li>
						<li>
							<div class="products_wrap">
								<div class="products">
									<img alt="" src="">
								</div>
								<div class="pnote">
									<div class="pinfo">
										<strong>
											<span class="products_info"></span>
										</strong>
									</div>
									<div class="pPrice">
									</div>
								</div>
							</div>

						</li>
						<li>
							<div class="products_wrap">
								<div class="products">
									<img alt="" src="">
								</div>
								<div class="pnote">
									<div class="pinfo">
										<strong>
											<span class="products_info"></span>
										</strong>
									</div>
									<div class="pPrice">
									</div>
								</div>
							</div>

						</li>
					</ul>
				</div>
			</div>	
		</div>
	</div>
	 

  </div>
    
 <%@ include file="Template/fotter.jsp" %>
 
 <script src="https://cdn.jsdelivr.net/npm/@splidejs/splide@latest/dist/js/splide.min.js"></script>
<script>
	document.addEventListener( 'DOMContentLoaded', function () {
		new Splide( '.splide', {
			type    : 'loop',
			perPage : 1,
			autoplay: true,
		} ).mount();
	} );
</script>

	

