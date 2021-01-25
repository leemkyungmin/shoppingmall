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
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/js-cookie/2.2.1/js.cookie.js"></script>
	<script>
	$().ready(function(){
		
		//read쿠키 초기화
		Cookies.set('popread','',{ expires:-1});
		var poplist = new Array();
		poplist=${poplist};
		
		var donotopen = new Array();
		donotopen = Cookies.getJSON('donotopen');;
		
		var pop ='';
		if(donotopen !=null){
			console.log(donotopen[0].popidx);
			for(var i =poplist.length-1; i>=0; i--){
				for(var j=0; j<donotopen.length; j++){
					if(poplist[i].popidx == donotopen[j].popidx){
						delete(poplist[i]);
						poplist.splice(i,1);
						break;
					}
					
				}
				
			}       	
		}
		if(poplist.length >0){   
			for(var i =0; i<poplist.length; i++){
				if(i==0){
					$('.navi').append('<input class="pop_navi selected" type="button" data-id="'+i+'" data-value="'+poplist[i].popidx+'" value="'+(i+1)+'" >');
					$('#popImg').attr('src','${pageContext.request.contextPath}/resources/assets/images/popupImg/'+poplist[i].popimg);
					$('#popup_btn').attr('data-id',poplist[i].popidx);
					$('#popup_btn').attr('data-value',i);
					popupread(poplist[i].popidx);
				} else {
					$('.navi').append('<input class="pop_navi" type="button" data-id="'+i+'" data-value="'+poplist[i].popidx+'" value="'+(i+1)+'" >');
				}
				
			}
			$('#myModal').show();   
		} 
		    
		$(document).on('click','.navi .pop_navi',function(){
			if(!$(this).hasClass('selected')){
				var i =$(this).data('id');
				var popidx =$(this).data('value');
				
				$('.pop_navi').removeClass('selected');
				$(this).addClass('selected');
				$('#popImg').prop('src','${pageContext.request.contextPath}/resources/assets/images/popupImg/'+poplist[i].popimg);
				
				$('#popup_btn').attr('data-id',popidx); 
				$('#popup_btn').attr('data-value',i);
				popupread(popidx);    
			}           
		});
		
		$('#popup_btn').click(function(){
			var next = $(this).data('value');
			var popidx =$(this).data('id');   
			if($('#chk_donotopen').is(':checked')==true){

				popupnotopen(popidx);
				
			} else{
				popupread(popidx);
			}
			
			$('.navi .pop_navi').removeClass('selected');
			$('.navi .pop_navi:nth-child('+(next+2)+')').addClass('selected');
			$('#popImg').prop('src','${pageContext.request.contextPath}/resources/assets/images/popupImg/'+poplist[(next+1)].popimg);
			$('#chk_donotopen').prop('checked',true);
			$(this).removeData('id');
			$(this).removeData('value');
			$(this).attr('data-id',poplist[(next+1)].popidx);
			$(this).attr('data-value',(next+1)); 
			
		});
		
		
		var popreadcount =0;	
		
		function popupread( popidx ){
			
			popreadcount++;
			if(Cookies.get('popread') === undefined|| // 쿠키에 key로 list 가 존재하지 않거나
					Cookies.get('popread') == '[null]'){ // 안에 값이 다 삭제가되어 [null] 인 경우
				Cookies.set('popread', "[{\"popidx\":\""+popidx+"\"}]",{ expires:1});

			} else {
				console.log(Cookies.getJSON('popread'));
				var json_list = Cookies.getJSON('popread');
				
				 for(var i=0; i<json_list.length; i++){
					for(key in json_list[i]){
						if(json_list[i][key]==popidx){
							delete json_list[i];
							json_list.splice(i,1);
							break;
						}
					}
				}
				   
				json_list.push({
					popidx: '"'+popidx+'"',
				});
				Cookies.set('popread', json_list,{ expires:1}); 
				
				if(poplist.length <= popreadcount){
					$('#myModal').hide();
				}
				
			}
			
		}
		function popupnotopen( popidx ){
			
			if(Cookies.get('donotopen') === undefined|| // 쿠키에 key로 list 가 존재하지 않거나
					Cookies.get('donotopen') == '[null]'){ // 안에 값이 다 삭제가되어 [null] 인 경우
				Cookies.set('donotopen', "[{\"popidx\":\""+popidx+"\"}]",{ expires:1});
				console.log(Cookies.getJSON('donotopen'));
			} else {
				console.log(Cookies.getJSON('donotopen'));
				var json_list = Cookies.getJSON('donotopen');
				
				 for(var i=0; i<json_list.length; i++){
					for(key in json_list[i]){
						if(json_list[i][key]==popidx){
							delete json_list[i];
							json_list.splice(i,1);
							break;
						}
					}
				}
				
				json_list.push({
					popidx: popidx,
				});
				Cookies.set('donotopen', json_list,{ expires:1}); 
				
				console.log('poplist.length : '+poplist.length);
				console.log('json_list.length : '+json_list.length);
				
				if(poplist.length <= json_list.length){
					$('#myModal').hide();
				}
				
			}
		}
		
		
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
	 <div id="myModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-header" data-backdrop="static">
			<!-- data-dismiss="modal" -->
		<div class="modal-title" data-backdrop="static">
			<ul class="donotopen">
				<li>
					<div class="navi">
					</div>
					<div class="controll">
						<label for=chk_donotopen>하루동안 열지않기</label>
						<input type="checkbox" id="chk_donotopen" value="1" checked="checked">
						<input type="button" id="popup_btn" value="확인">
					</div>
					
				</li>
			</ul>
		</div>   	
			
		</div>
		<div class="modal-body" data-backdrop="static">
			<img  id="popImg">
		</div>
				  
		<div class="modal_layer" data-backdrop="static"></div>
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
			
			var arr = ptag.split(',');
			ptag =arr[0];
			console.log(ptag);
			
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

	

