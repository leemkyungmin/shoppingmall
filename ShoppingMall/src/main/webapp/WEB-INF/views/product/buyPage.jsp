<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html >
<html>
<head>
<meta charset="UTF-8">
<title>주문/결제</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/style/buyPage.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	$().ready(function(){
		var arr =${arr};
		var obj_arr = new Array();
		obj_arr.push(arr);
		console.log(obj_arr);
		console.log(obj_arr.length);
		var html ='';
		/*  테스트용*/
		
		for(var i=0; i<obj_arr.length; i++){
			var obj =new Object();
			obj =obj_arr[i];
			console.log(obj);
			$('.producct_option').append('옵션:'+obj.toponame +'/'+obj.poname)
		}
		
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
					<span class="span_bold_sizeup">주문결제</span>
				</div>
				<div class="buy_steps">
					<ul>
						<li>
							<a href="${pageContext.request.contextPath }/product/myCart">
								<span class="myCart">
									01.장바구니
								</span>
							</a>
						</li>
						<li class="this_step">
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
			<form action="">
				<div class="content">
					
					<div class="order_addr_info">
						<div class="title">
							배송정보
						</div>
						<div class="user_info">
							<div class="order_name">
								${udto eq null ? deptdto.dName :udto.uName }
								
							</div>
							<div class="order_addr">
								<c:set var="address" value="${udto eq  null ? deptdto.dAddress : udto.uAddress }"/>
								<c:set var="post_addr" value="${fn:split(address,'/') }"/>
								
								(<span class="post_addr">
									${post_addr[0]}
								</span>)
								<span class="road_addr">
									${post_addr[1] }
								</span>
								<span class="detail_addr">
									${post_addr[2]}
								</span>
							</div>
							<div class="phone">
								<c:set var="phone" value="${udto eq null ? deptdto.dPhone : udto.uPhone }" />
								
								<c:if test="${fn:length(phone) ==11 }">
									${fn:substring(phone,0,3) }-${fn:substring(phone,3,7) }-${fn:substring(phone,7,11) }
								</c:if>
								<c:if test="${fn:length(phone) ==10 }">
									${fn:substring(phone,0,2) }-${fn:substring(phone,2,6)}-${fn:substring(phone,6,10) }
								</c:if>
							</div>
							<div class="order_require_ment">
								
								<div class="require_option">
									<select id="req_option" name="req_option">
										<option value="">배송시 요청사항 선택하기</option>
										<option value="직접수령하겠습니다.">직접수령 하겠습니다.</option>
										<option value="문 앞에 놓아주세요">문 앞에 놓아주세요</option>
										<option value="경비실에 맡겨주세요">경비실에 맡겨주세요</option>
										<option value="배송 전 휴대폰으로 연락주세요">배송 전 휴대폰으로 연락주세요</option>
										<option value="파손위험이 있는 상품이니 조심히 다뤄주세요">파손위험이 있는 상품이니 조심히 다뤄주세요</option>
										<option value="직접입력">직접입력</option>		
									</select>
								</div>
								<div class="self_require">
									<input type="text" name="self" id="self" placeholder="수령방법을 입력해주세요.(최대 50자)" maxlength="50"> 
									<span class="self_require_count">
										0</span>/50
								</div>
								<script type="text/javascript">
									$().ready(function(){
										$(document).on('change','#req_option',function(){
											var data =$(this).val();
											console.log(data);
											if(data =='직접입력'){
												$('.self_require').addClass('active');
											} else {
												$('.self_require').removeClass('active');
											}
										});
										
										
										$('#self').keydown(function(){
											var data = $(this).val();
											if(data.length <=50){
												$('.self_require_count').text(data.length);
											} else {
												alert('50자 이상 입력하실수없습니다.');
											}
											
										});
									});
								</script>
							</div>
							
							<div class="order_product_info">
								<div class="seller_name">${pdto.pName }</div>
								<ul class="order_list">
									<li>
										<div class="product_body">
											<div class="product_img">
												<img src="${pageContext.request.contextPath}/resources/images/Department_sumnail/${pdto.pSumnail}">
											</div>
											<div class="product_info_body">
												<div class="pName">
													${pName }
												</div>
												<div class="producct_option">
													
												</div>
											</div>
										</div>
									</li>
								</ul>
							</div>
							
						</div>
					</div>
					<div class="order_side">
						1111111111111111111111111
					</div>
			</div>
		</form>
	</div>
<%@ include file="../Template/fotter.jsp"%>