<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html >
<html>
<head>
<meta charset="UTF-8">
<title>카트내역</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/style/buyPage.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script> 

<script type="text/javascript">

	$().ready(function(){
		checkboxChange();
		store_hap();
	});
	
	
	function commna(price){
		console.log(price);
		var point = price.length%3;
		var str = price.substring(0,point);
		
		while(point <price.length){
			if(str !=''){
				str +=',';
			}
			str += price.substring(point,point+3);
			point  +=3;
		}
		console.log(str);
		return str;
	}
	
	function checkboxChange(){
		var count = $('.order_addr_info ul li').length;
		var product_total =0;
		var post_total=0;
		var total_count =0;
		for(var i=0; i<count; i++){
			
			if($('.order_addr_info ul li:nth-child('+(i+1)+') input[type=checkbox]').prop('checked')){
				product_total += $('.order_addr_info ul li:nth-child('+(i+1)+') .cart_option_total_price .span_bold').text().replace(/,/g, "")*1;
				if( $('.order_addr_info ul li:nth-child('+(i+1)+')' ).data('value') != $('.order_addr_info ul li:nth-child('+(i+2)+')' ).data('value') || i==count-1){
					post_total += $('.order_addr_info ul li:nth-child('+(i+1)+') .post_price .span_bold' ).text().replace(/,/g, "")*1;
				}	
				total_count++;
			}
			
			
		}
		var total = product_total*1 +post_total*1;
		var ptotal =commna(product_total+'');	
		$('.pro_price').text(ptotal);
		
		var posttotal= commna(post_total+'');	
		
		$('.post_total_price').text(posttotal)
		
		var ptotal= commna(total+''); 
		$('.totalprice').text(ptotal)
		
		$('#buy_btn').val('총 '+total_count+'개 주문하기');
	}
	
	function store_hap(){
		var count =$('.border_cart').length;
		
		for(var i=1; i<count+1; i++){
			var li_count =$('.border_cart:nth-child('+i+') .cart_content ul li').length;
			var product_price = 0;
			var post_price =0;
			var total_price =0;
			for(var j=1; j <li_count+1; j++){
				if($('.border_cart:nth-child('+i+') .cart_content ul li:nth-child('+j+') input[type=checkbox]').prop('checked')){
					product_price += $('.border_cart:nth-child('+i+') .cart_content ul li:nth-child('+j+') .cart_option_total_price .span_bold').text().replace(/,/g, "")*1;
					post_price +=$('.border_cart:nth-child('+i+') .cart_content ul li:nth-child('+j+') .post_price .span_bold').text().replace(/,/g, "")*1;
					console.log('product_price : '+product_price);
					console.log('post_price : '+post_price);
				}
			}
			total_price = product_price + total_price;
			$('.border_cart:nth-child('+i+') .store_hap .store_product_price').text(commna(product_price+''));
			$('.border_cart:nth-child('+i+') .store_hap .store_post_price').text(commna(post_price+''));
			$('.border_cart:nth-child('+i+') .store_hap .store_total_price').text(commna(total_price+''));
		}
	}
	
	$(document).on('change','#cidx',function(){
		
		checkboxChange();
		store_hap();
		
	});
	$(document).on('change','#option_count',function(){
		var data_id = $(this).data('id');
		var count =$(this).val();
		$.ajax({
			url:'${pageContext.request.contextPath}/my/update_cart_count',
			type:'post',
			data:'cIdx='+data_id+'&count='+count,
			success:function(data){
				history.go(0);
			},error:function(){
				alert('통신실패');
			}
		});
	});
	
</script>  

</head>
<body>
	
	<div class="wrap">
		<div class="wrap_content">
			<div class="wrap_header">
				<a href="${pageContext.request.contextPath }/index">
					<img  src="${pageContext.request.contextPath}/resources/images/쇼핑몰_로고.PNG"> 
				</a>
			</div>
			<div class="wrap_title">
				<div class="wtitle">
					<span class="span_bold_sizeup">카트리스트</span>
				</div>
				<div class="buy_steps">
					<ul>
						<li class="this_step">
							<a href="${pageContext.request.contextPath }/product/myCart">
								<span class="myCart">
									01.장바구니
								</span>
							</a>
						</li>
						<li >
							<span class="order_buy">
								02.주문결제
							</span>
						</li>
						<li>
							<span class="order_complate">
								03.주문완료
							</span>
						</li>
					</ul>
				</div>
			</div>
			<form  name="form" id="form">
				<div class="content">
														
					<div class="order_addr_info">
						<c:forEach var="cart" items="${cdto }" varStatus="i">
							
							<c:if test="${i.count eq 1 or cart.dName  ne cdto[i.count-2].dName }">
								<div class="border_cart">
									<div class="cart_dName">
											<h1>${cart.dName}</h1>
									</div>
									<div class="cart_content">
										<ul data-value="${cart.pIdx}">
							</c:if>
										<li data-id="${cart.cIdx }" data-value="${cart.pIdx}">
											<div class="contents">
												<div class="check_box">
													<input type="checkbox" id="cidx" checked>
												</div>
												<div class="cart_pSumnail">
													<img  src="${pageContext.request.contextPath }/resources/images/Department_sumnail/${cart.pSumnail}">
												</div>
												<div class="cart_procut_content">
													<div class="pName">
														${cart.pName}
													</div>
													<div class="cart_select_option">
														${cart.cName}
													</div>
													<div class="cart_option_count">

														<input type="number" id="option_count" value="${cart.cTotal_Count}" data-id="${cart.cIdx }">
													</div>
												</div>
												<div class="cart_option_total_price">
													<span class="span_bold"><fmt:formatNumber value="${cart.cPrice * cart.cTotal_Count}" pattern="#,###" /></span>원
												</div>
												
												<div class="post_price">
													<span class="span_bold">
														<fmt:formatNumber value="${cart.pOrder_price}" pattern="#,###" />
													</span>
													원
												</div>
											</div>
										</li>
							<c:if test="${i.count eq cdto.size() or cart.dName ne cdto[i.count].dName }">
										</ul>
									</div>
									<div class="store_hap" data-id='${cart.dName}'> 
										<div class="store_title">
											<span class="st_title">
												스토어 주문 합계
											</span>
										</div>
										<div class="store_product">
											<span class="st_product_title">
												상품금액
												<span class="store_product_price">
													0
												</span>원+
											</span>
										</div>
										<div class="store_post">
											<span class="stoe_post_title">
												배송비
												<span class="store_post_price">
													0
												</span>원 =
											</span>
										</div>
										<div class="store_total">
											<span class="total">
											
												<span class="store_total_price">
													0
												</span>원
											</span>
										</div>
										
									</div>
								</div>
							</c:if>
							
							
							
						</c:forEach>
					</div>
					<div class="order_side">
						<div class="total_order">
							<div class="total_title">
								<h2>결제 예정금액</h2>
							</div>
							<div class="total_content">
								<div class="product_total_price">
									<div class="ptotal_title">
										상품 금액
									</div>
									<div class="ptotal_price">
										<span class="pro_price">0</span>원
									</div>
								</div>
								<div class="total_order_Price">
									<div class="ptotal_title">
										배송료
									</div>
									<div class="pOrder_price">
										<span class="post_total_price">0</span>원
									</div>
								</div>
								<div class="total">
									<div class="total_title">
										합계
									</div>
									<div class="tot_price">
										<span class="totalprice">0</span>원
										
									</div>
								</div>
							</div>
							<div class="btn_control">
								<input type="hidden" id="Name" name="Name" value="${udto eq null ? deptdto.dName :udto.uName }">
								<input type="hidden" id="seller" name="seller" value="${pdto.pName }">
								<input type="hidden" id="options" name="options" value=${arr}>
								<input type="hidden" id="total_price" name="total_price">
								<input type="hidden" id="pidx" name="pidx" value="${pdto.pIdx }">
								<input type="hidden" id="didx" name="didx" value="${pdto.dIdx }">
								<input type="button"  id="buy_btn" name="buy_btn"  > 
							</div>
						</div>
					</div>
				</div>
				
				
				
				<script type="text/javascript">
					
					$().ready(function(){
						$(document).on('click','#buy_btn',function(){
							var req_option = $('#req_option');
							if(req_option.val() ==''){
								alert('배송 오쳥사항을 입력해주세요');
								req_option.focus();
								return ;
							} else {
								
								var Name =$('#Name').val();				
								var seller =$('#seller').val();				
								var options =$('#options').val();			
								var total_price =$('#total_price').val();
								
								console.log('###########'); 
								$.ajax({
									url:'${pageContext.request.contextPath}/product/buy/kakaopay',
									method:'post',
									data :'Name='+Name+'&seller=' + seller + '&options=' + options + '&total_price=' + total_price + '&req_option=' + req_option.val(),
									success:function(data){
										
										var status = "toolbar=no,directories=no,scrollbars=no,resizable=no,status=no,menubar=no,width=700, height=700, top=0,left=20"; 
										popup =window.open(data,'테스트결제',status); 							
									}, error:function(){
										alert('통신실패'); 
									}
								});
								
							}
						});
					})    
					
					function popup(frm){
						var req_option = $('#req_option');
						
						if(req_option.val() ==''){
							alert('배송 오쳥사항을 입력해주세요');
							req_option.focus();
							return ;
						} else {
							 
							var Name =frm.Name.value;				
							var seller =frm.seller.value;				
							var options =frm.options.value;				
							var total_price =frm.total_price.value;	
							
							
							
							/* var url    ="${pageContext.request.contextPath}/product/buy/kakaopay";
							var title  = "testpop";
							var status = "toolbar=no,directories=no,scrollbars=no,resizable=no,status=no,menubar=no,width=700, height=700, top=0,left=20"; 
							popup =window.open("", title,status); 
							                                
							frm.target = title;       
							frm.action = url;         
							frm.method = "post";
							frm.submit();      */
							
						}
					}
				
				
				</script>
				</form>
			</div>
	</div>
<%@ include file="../Template/fotter.jsp"%>