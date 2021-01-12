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
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script> 
<script type="text/javascript">
	$().ready(function(){
		var arr = new Object();
		arr= ${arr};
		var obj_arr = new Array();
		for(var i=0; i<arr.length; i++){
			obj_arr.push(arr[i]);
		}
		$('#buy_btn').val('총 '+obj_arr.length +'개 결제하기');
		   
		var html ='';
		/*  테스트용*/
		
		var option_total_price =0;
		var hap_price=0;
		for(var i=0; i<obj_arr.length; i++){
			var obj =new Object();
			obj =obj_arr[i];
			var price = obj.poprice * obj.count+"";
			var point =price.length %3;
			var str =price.substring(0,point);
			hap_price+=obj.poprice * obj.count;
			option_total_price += obj.poprice * obj.count;
			
			while(point <price.length){
				if( str !=''){
					str +=',';
				}
				str +=price.substring(point, point+3);
				point+=3;
			}
			
			
			
			html +='<li>';
			html +='<div class="product_body">';
			html +='<div class="product_img">';
			html +='<img src="${pageContext.request.contextPath}/resources/images/Department_sumnail/${pdto.pSumnail}">';
			html +='</div>';
			html +='<div class="product_info_body">';
			html +='<div class="pName">';
			html +='${pdto.pName}';
			html +='</div>';
			html +='<div class="producct_option">';
			html +='</div>';
			html +='<div class="order_count">';
			html += '옵션:'+obj.topponame +' / '+obj.poname;			
			html +='</div>';
			html +='</div>';
			html +='<div class="option_count">';
			html +=obj.count+'개';
			html +='</div>';
			html +='<div class="option_price">';
			html +='<span class="span_bold">';
			html += str+'원';
			html +='</span>';
			html +='</div>';
			if( i ==0 || obj[i-1] != obj[i]){
				
				var oprice =${pdto.pOrder_price}+"";
				
				var p = oprice.length%3;
				var s =oprice.substring(0,p);
				
				while(p < oprice.length){
					if( s !=''){
						s +=',';
					}
					s +=oprice.substring(p,p+3);
					p+=3;
				}
				$('.pOrder_price').text(s+'원');
				html +='<div class="order_price">';
				html +=s+'원<br/>';
				html +='<span class="porder">배송비</span>';
				html +='</div>';
			}else {
				if( i ==obj_arr.length-1){
					html +='<div class="empty-box" style="border-bottom:1px solid lightgray">';
					html +='</div>';
				} else {
					html +='<div class="empty-box">';
					html +='</div>';
				}
				
			}
			
			
			html +='</div>';
			html +='</li>';
			
			//$('.producct_option').append('옵션:'+obj.topponame +' / '+obj.poname)
		}
		var pr = hap_price+"";
		var po =pr.length %3;
		var strs =pr.substring(0,po);
	
		while(po <pr.length){
			if( strs !=''){
				strs +=',';
			}
			strs +=pr.substring(po,po+3);
			po+=3;
		}
		console.log(str);
		$('.ptotal_price').text(strs+"원");
		
		option_total_price +=${pdto.pOrder_price};
		option_total_price +='';
		var point =option_total_price.length %3;
		var str =option_total_price.substring(0,point);
		while(point <option_total_price.length){
			if( str !=''){
				str +=',';
			}
			str +=option_total_price.substring(point, point+3);
			point+=3;
		}
		
		$('.tot_price').append(str+'원'); 
		$('#total_price').val(option_total_price*1);
		$('.order_list').append(html);
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
			<form  name="form" id="form">
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
						</div>
						<div class="order_product_info">
							<div class="seller_name">
								<h2>주문상품</h2>
								<p class="text">상품수량 및 옵션변경은 상품상세 또는 장바구니에서 가능합니다.</p>
							</div>
							<div class="seller_pName">
								${pdto.pName }
							</div>
							<div class="olist">
								<ul class="order_list">
									
								</ul>
							</div>
						</div>
							
						
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
										..~금액 부분
									</div>
								</div>
								<div class="total_order_Price">
									<div class="ptotal_title">
										배송료
									</div>
									<div class="pOrder_price">
										
									</div>
								</div>
								<div class="total">
									<div class="total_title">
										합계
									</div>
									<div class="tot_price">
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