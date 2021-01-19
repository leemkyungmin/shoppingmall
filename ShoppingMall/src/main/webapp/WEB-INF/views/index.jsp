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
		pidx_list = JSON.parse(localStorage.getItem('recent_show_product'));
		
		if(pidx_list !=null){
			var html ='';
			
			for(var i=0; i<pidx_list.length; i++){
				var pidx =pidx_list[i]['pidx'];
				
				$.ajax({
					url:'${pageContext.request.contextPath}/getProductInfo',
					data:'pidx='+pidx,
					type:'post',
					async: false,
					success:function(datas){ 
						
						var obj = JSON.parse(datas);
						var pname =JSON.stringify(obj.pname).replace(/\"/gi, "");
						var price =JSON.stringify(obj.price);
						var psumnail =JSON.stringify(obj.psumnail).replace(/\"/gi, "");
						var ptag =JSON.stringify(obj.ptag).replace(/\"/gi, "");
						html +='<li class="rlist" data-id="'+(i+1)+'" data-value="'+ptag+'">';
						html +='<a href="${pageContext.request.contextPath}/product/products/'+pidx+'">';
						html +='<div class="search_item">';
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
						html +='</div>';
						html +='</a>';
						html +='</li>';
						 
					}, error:function(){
						console.log('error');
					}
				});
				
				
			}

			$('.slide ul').append(html);
			
		}
		setTimeout(() => {
			$('.recnet_plist .rlist:first-child').addClass('active');
		}, 500);	
			
		
	});
	</script>
  <div class="wrap">
  	<div class="banners">
	  	<div class="splide banner">
			<div class="splide__track">
				<ul class="splide__list">
				<c:forEach var="bimg" items="${bdto}">
					<li class="splide__slide">
						 <img class="bimgs"  src="${pageContext.request.contextPath }/resources/assets/images/bannerImg/${bimg.bFilename}">
					</li>
				</c:forEach>
					
					
				</ul>
			</div>
		</div>
	</div>
	<div class="user_main">
		<div class="recent_products">
			<div class="recent_product_info">
				<h1>최근 본 상품</h1>
			</div>
			<div class="recent_list">
				<div class="slide">
					<ul class="recnet_plist">
						
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
		new Splide( '.banner', {
			type    : 'loop',
			perPage : 1,
			autoplay: true,
		} ).mount();
		
	} );
	
		function init(ptag,id){
			console.log(ptag,id)
			var html ='';
			$.ajax({
				url:'${pageContext.request.contextPath}/recent_product_list',
				data:'ptag='+ptag,
				type:'post',
				async: false,
				success:function(data){
					var arr = JSON.parse(data);
					
					html +='<div class="sameTag_list">';
					html +='<div class="productlist">';
					html +='<div class="splide item_list">';
					html +='<div class="splide__track">';
					html +='<ul class="splide__list">';
					
				    for(var j=0; j<arr.length; j++){
						
						
						
						html +='<li class="splide__slide">';
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
					
				}, error:function(){
					console.log('error');
				}
			}); 
			
			$('.rlist:nth-child('+id+')').append(html);
			
				new Splide( '.item_list', {
					perPage: 5,
					rewind : true,
				} ).mount();
			
			$('.rlist .splide__slide').css({'width':'224px'});
			
		}
	
		$().ready(function(){
		
			init($('.rlist:first-child').data('value'),$('.rlist:first-child').data('id'));
				
		
		$(document).on('mouseover','.rlist',function(){
			
			if(!$(this).hasClass('active')){
				$('.rlist').removeClass('active');
				$(this).addClass('active');
				$('.sameTag_list').remove();
				var id = $(this).data('id');
				var ptag =$(this).data('value');
				
				init(ptag,id);
			}
			
			
		});
			
	});
	
	setTimeout(() => {
		
		$('.sameTag_list .splide__slide').css({'width':'224px'});
	}, 500);
	
 	
</script>

	

