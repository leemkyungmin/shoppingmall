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
	$().ready(function(){
		
		var pidx_list = new Array();
		pids_list = JSON.parse(localStorage.getItem('recent_show_product'));
		
		if(pids_list !=null){
			var html ='';
			console.log(pids_list);
			for(var i=0; i<pids_list.length; i++){
				var pidx =pids_list[i]['pidx'];
				html +='<li>';
				
				$.ajax({
					url:'${pageContext.request.contextPath}/getProductInfo',
					data:'pidx='+pidx,
					type:'post',
					success:function(datas){
						
						var obj = JSON.parse(datas);
						var pname =JSON.stringify(obj.pname);
						var price =JSON.stringify(obj.price);
						var psumnail =JSON.stringify(obj.psumnail);
						var ptag =JSON.stringify(obj.ptag).replace(/\"/gi, "");
						console.log(ptag);
						html +='<div class="search_item>"';
						html +='<div class="product_img">';
						html +='<img src="${pageContext.request.contextPath}/resources/images/Department_sumnail/'+psumnail+'">';
						html +='</div>';
						html +='<div class="product_content">';
						html +='<div class="product_pname">';
						html +='<strong>'+pname+'</strong>';
						html +='</div>';
						html +='<div class="product_price">';
						html +='<span class="price_value">'+price+'원~</span>';
						html +='</div>';
						html +='</div>';
						html +='</div>"';
						console.log('첫번째 ajax : '+html);
						$.ajax({
							url:'${pageContext.request.contextPath}/recent_product_list',
							data:'ptag='+ptag,
							type:'post',
							success:function(datas){
								
								var arr = JSON.parse(datas);
								
								html +='<div class="sameTag_list">';
								html +='<div class="productlist">';
								html +='<ul>';
								for(var j=0; j<arr.length; j++){
									html +='<li>';
									var obj_list = arr[j];
									var obj_pidx =obj_list.pidx;
									var name =obj_list.pname;
									var pprice =obj_list.price;
									var sumnail = obj_list.psumnail;
									html +='<a href="${pageContext.request.contextPath}/product/products/'+obj_pidx+'">';
									html +='<div class="productlist_pimg">';
									html +='<img src="${pageContext.request.contextPath}/resources/images/Department_sumnail/'+sumnail+'">';
									html +='</div>';
									html +='<div class="productlist_pcontent">';
									html +='<div class="product_list_pname">';
									html +='<Strong>'+name+'</strong>';
									html +='</div>';
									html +='<div class="productlist_price">';
									html +='<span class="price">'+pprice+'원</span>';
									html +='</div>';
									html +='</div>';
									html +='</a>';
									html +='</li>';
								}
								html +='</ul>';
								html +='</div>';
								html +='</div>';
								console.log('두번째 ajax : '+html);
							}, error:function(){
								console.log('error');
							}
						});
						
					}, error:function(){
						console.log('error');
					}
				});
				html +='</li>';
			}
			setTimeout(() => {
				
			console.log('최종:'+html);
			$('.slide ul').append(html);
			}, 500);
		}
		
	});
	</script>
  <div class="wrap">
  
  	<div class="splide">
		<div class="splide__track">
			<ul class="splide__list">
			<c:forEach var="bimg" items="${bdto}">
				<li class="splide__slide">
					 <img class="bimgs" alt="${bimg.bFileinfo }" src="${pageContext.request.contextPath }/resources/assets/images/bannerImg/${bimg.bFilename}">
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
						
					</ul>
				</div>
			</div>	
		</div>
	</div>
	 
	 
	 <!--  sslide ul 내부 
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
	 
	  -->

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

	

