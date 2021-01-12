<%@page import="java.util.ArrayList"%>
<%@page import ="com.lkm.shoppingmall.dto.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../Template/header.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/style/orderList.css">
<c:set var="stDay" value="${stDay}"/>
<c:set var="endDay" value="${endDay}"/>
<c:set var="styear" value="${fn:substring(stDay,0,4)}"/>
<c:set var="stmonth" value="${fn:substring(stDay,5,7)}"/>
<c:set var="stday" value="${fn:substring(stDay,8,10)}"/>
<c:set var="endyear" value="${fn:substring(endDay,0,4)}"/>
<c:set var="endmonth" value="${fn:substring(endDay,5,7)}"/>
<c:set var="endday" value="${fn:substring(endDay,8,10)}"/>

<script>
	$().ready(function(){
		
		sDay_update();
		eDay_update();
		function sDay_update(){
			$('#st_day').html('');
			var year = $('#st_year').val();
			var month = $('#st_month').val();
			var date = 32-new Date(year,month-1,32).getDate();
			var syear = '${styear}';
			var smonth = '${stmonth}';
			var sday  ='${stday}';
			
			var html ='';
			var i =0;
			for(i = 1; i<date+1; i++){
				if(year == syear && month == smonth && i==sday){
					html +='<option value='+i+' selected="selected" onselect="st_dayChange()">';
					html +=i;
					html +='</option>';
				}else{
					html +='<option value='+i+' onselect="st_dayChange()">';
					html +=i;
					html +='</option>';
				}
			}
			$('#st_day').html(html);
			
		}
		function eDay_update(){
			$('#end_day').html('');
			var year = $('#end_year').val();
			var month = $('#end_month').val();
			var date = 32-new Date(year,month-1,32).getDate();
			var eyear = '${endyear}';
			var emonth = '${endmonth}';
			var eday  ='${endday}';
			var html ='';
			var i =0;
			for(i = 1; i<date+1; i++){
				if(year == eyear && month == emonth && (i)==eday){
					html +='<option value='+i+' selected="selected" onselect="end_dayChange()">';
					html +=i;
					html +='</option>';
				}else{
					html +='<option value='+i+' onselect="end_dayChange()">';
					html +=i;
					html +='</option>';
				}
			}
			$('#end_day').html(html);
		}
		
		$('#st_month').change(function(){
			sDay_update();
		});
		$('#st_year').change(function(){
			sDay_update();
		});
		$('#end_month').change(function(){
			eDay_update();
		});
		$('#end_month').change(function(){
			eDay_update();
		});
		
	});
</script>


	<div class="wrap">
		<div class="my_mall-list">
			<h2>구매내역</h2>
		</div>
		<div class="side_list">
			<div class="smyshopping">
				<div class="side-title">
					<h3>나의 쇼핑내역</h3>
				</div>
				<div class="side-item">
					<a href="${pageContext.request.contextPath}/order/OrderList">주문/배송조회</a>
				</div>
				<div class="side-item">
					<a href="${pageContext.request.contextPath}/order/OrderCancelList">취소/반품/교환</a>
				</div>
			</div>
			<div class="smyCustomerService">
				<div class="side-title">
					<h3>회원정보</h3>
				</div>
				<div class="side-item">
					<a href="${pageContext.request.contextPath}/my/CustomerService">상담 내역</a>
				</div>
				<div class="side-item">
					<a href="${pageContext.request.contextPath}/my/confirmPassword">회원정보 변경</a>
					/<a href="${pageContext.request.contextPath }/my/deleteuser">탈퇴</a>
				</div>
				<div class="side-item">
					<a href="">나의 배송지 관리</a>
				</div>
			</div>
		</div>
		<div class="wrap_content">
			
			<div class="orderList">
				<div class="orderList-title">
					<strong>
						<span class="order-status">주문/배송</span>조회
					</strong>
				</div>
				<div class="cOrder">
					<div class="cContent">
						조회 기간
					</div>
					<div class="cBtns">
						
						<div class="cinput">
							
							<select id="st_year" onchange="st_dayChange()">
																
								<c:forEach var="i" begin="0" end="9">
									<c:if test="${styear eq (styear-i) }">
										<option value="${styear-i }"  selected="selected">${styear-i }</option>
									</c:if>
									<c:if test="${styear ne (styear-i) }">
										<option value="${styear-i }" >${styear-i}</option>
									</c:if>
										
								</c:forEach>
							</select> 년 
							<select id="st_month" onchange ="st_dayChange()">
								<c:forEach var = "i" begin="1" end="12">
									
									<c:if test="${stmonth eq i}">
										<option value="${stmonth}" selected="selected">${stmonth}</option>
									</c:if>
									<c:if test="${stmonth ne i}">
										<option value="${i}">${i}</option>
									</c:if>
								</c:forEach>
							</select> 월 
							<select id="st_day" onchange ="st_dayChange()">
																
							</select> 일
						</div>
						 ~ 
						<div class="cinput">
							
							<select id="end_year" onchange ="end_dayChange()">
																
								<c:forEach var="i" begin="0" end="9">
									<c:if test="${endyear eq (endyear-i) }">
										<option value="${endyear-i }" selected="selected">${endyear-i }</option>
									</c:if>
									<c:if test="${endyear ne (endyear-i) }">
										<option value="${endyear-i }">${endyear-i }</option>
									</c:if>
										
								</c:forEach>
							</select> 년 
							<select id="end_month" onchange ="end_dayChange()">
								<c:forEach var = "i" begin="1" end="12">
									
									<c:if test="${endmonth eq i}">
										<option value="${endmonth}" selected="selected" >${endmonth}</option>
									</c:if>
									<c:if test="${endmonth ne i}">
										<option value="${i}" >${i}</option>
									</c:if>
								</c:forEach>
							</select> 월 
							<select id="end_day" onchange ="end_dayChange()">
																
							</select> 일 
						</div>
						<div class="calender-controll">
							<form action="OrderList" method="post">
								<input type="hidden" id="stDay" name="stDay" value="${stDay }">
								<input type="hidden" id="endDay" name="endDay" value="${endDay }" >
								<input type="text" id="query" name="query" placeholder="주문 상품명을 검색하세요!">
								<input type="submit" id="search-btn" value="조회하기">
							</form>
						</div>
					</div>
				</div>
			</div>
			
			<div class="myorderlist-title">
				<h2>주문 내역</h2>
			</div>			
			<div class="order-list">
				<table class="order-table">
					<thead>
						<tr>
							<th>주문 일자</th>
							<th>주문 상품 정보</th>
							<th>상품 금액(수량)</th>
							<th>배송비</th>
							<th>주문상태</th>
						</tr>
					</thead>
					<tbody>
						<% int count =0; %>
						<c:if test="${OrderList.size() >0 }">
							<c:forEach var="orderlist" items="${OrderList}" varStatus="i">
								<tr>
									<td>
										<div class="order_bdate">
											${orderlist.bDate}
										</div>
										<div class="order_num">
											(${orderlist.bOrder_num})
										</div>
									</td>
									<td>
										<div class="products_info">
											<div class="products_img">
												<img alt="상품이미지" src="${pageContext.request.contextPath}/resources/images/Department_sumnail/${orderlist.pSumnail}">
											</div>
											<div class="products_name">
												${orderlist.pName }
											</div>
										</div>
									</td>
									<td>
										<div class="price">
											<%
												
												ArrayList<orderListDto> olist = (ArrayList<orderListDto>)request.getAttribute("OrderList");
												
												
												String price = olist.get(count).getPrice()+"";
												
												int point =  price.length()%3;
												String str = price.substring(0,point);
												
												while(point < price.length()){
													if(str !=""){
														str +=",";
													}
													str +=price.substring(point,point+3);
													point +=3;
												}
												
												String order_price =  olist.get(count).getpOrder_price()+"";
												int pointer = order_price.length()%3;
												String st = order_price.substring(0,pointer);
												
												while(pointer < order_price.length()){
													if(st !=""){
														st +=",";
													}
													st +=order_price.subSequence(pointer, pointer+3);
													pointer +=3;
													
												}
												
												count ++;
											%>
											<%=str %>원
										</div>
										<div class="count">
											(${orderlist.count }개)
										</div>
									</td>
									<td>
										<%=st %>원
									</td>
									<td>
										
										<c:if test="${orderlist.bOrder_status eq 1 }">
											<div class="o-status">
												입금 대기	
											</div>
										</c:if>
										<c:if test="${orderlist.bOrder_status eq 2 }">
											<div class="o-status">
												입금확인 / 상품 준비
											</div>
											
										</c:if>
										<c:if test="${orderlist.bOrder_status eq 3 }">
											<div class="o-status">
												상품 배송중
											</div>
											<div class="order-location">
												<input type="button" id="olocation" name="olocation" value="배송조회" data-value="${orderlist.post_num }" data-id="${orderlist.post_dept }" } >
											</div>
											
										</c:if>
										<c:if test="${orderlist.bOrder_status eq 4 }">
											<div class="o-status">
												배송완료
											</div>
											<div class="order-location">
													<input type="button" id="olocation" name="olocation">
													<input type="button" id="Reviewrite" name="Reviewrite">
											</div>
										</c:if> 
									</td>
								</tr>
							</c:forEach>
							
							
							<script>
								$().ready(function(){
									$(document).on('click','#olocation',function(){
										var data =$(this).data('value');
										var id = $(this).data('id');
										$('#t_code').val(id);
										$('#t_invoice').val(data);
										
										var popupTitle = "택배추적 조회";
										var status = "toolbar=no,directories=no,scrollbars=no,resizable=no,status=no,menubar=no,width=1000, height=700, top=50,left=500"; 
										window.open('',popupTitle,status);
										
										var form = document.post_api;
										console.log(form.t_code);
										console.log(form.t_invoice);
										form.target =popupTitle;
										form.method="post";
										form.action="http://info.sweettracker.co.kr/tracking/5";
										console.log(form);
										console.log(form.method);
										console.log(form.action);
										form.submit();
										
										
									});
								});
							</script>
							
						</c:if> 
						<c:if test="${OrderList.size() eq 0 }">
							<tr>
								<td colspan="6" class="no_info">
									<strong>
										최근 주문/배송 조회 내역이 없습니다.
									</strong>
								</td>
							</tr>
						</c:if>
					</tbody>
					<tfoot>
						<th colspan="6">${pageMaker }</th>
					</tfoot>
				</table>
			</div>
			<form id="post_api" name="post_api" >
				<input type="hidden" value="44mhOM53eq2GHI2vtXT4fg" name="t_key" id="t_key">
				<input type="hidden" name="t_code" id="t_code"> <!-- 택배사 코드 -->
				<input type="hidden" name="t_invoice" id="t_invoice"> <!-- 송장번호 --> 
			</form>
			<script type="text/javascript">
				function tab_ch(num){
					var i;
					for( i =1; i<4; i++){
						$('#tabMenuId'+i).css({'background' :'lightgray'});
						$('.tab_id'+i).css({'display' : 'none'});
					}
					$('#tabMenuId'+num).css({'background' :'white'});
					$('.tab_id'+num).css({'display' : 'block'});
				}
			</script>
			
			<div class="info-box">
				<h3>알아두세요!</h3>
				<div class="information">
					<ul class="ul-box">
						<li id="tabMenuId1">
							<a href="javascript:tab_ch(1)" onmouseover="tab_ch(1)" onfocus="tab_ch(1)">공통 안내</a>
						</li>
						<li id="tabMenuId2">
							<a href="javascript:tab_ch(2)" onmouseover="tab_ch(2)" onfocus="tab_ch(2)">해외배송상품 안내</a>
						</li>
						<li id="tabMenuId3">
							<a href="javascript:tab_ch(3)" onmouseover="tab_ch(3)" onfocus="tab_ch(3)">전새계배송 안내</a>
						</li>
					</ul>
					<div class="tab_id1" style="display:block">
						<div class="detail">
							<dl>
								<dd>배송완료 후 구매확정을 하지 않은 경우에는 <strong>배송이 완료된 일로부터 7일 경과 후, 8일째 자동으로 구매확정</strong> 됩니다.
								<br> 단, 화물/퀵배송 등 배송완료 확인이 불가한 경우에는 판매자가 <strong>상품을 발송 처리한 일로부터 28일 경과 후, 29일째 자동으로 구매확정</strong> 됩니다.</dd>
								<dd>자동 구매확정시에는 구매 적립 혜택을 받지 못할 수도 있으니 주의하시기 바랍니다.</dd>
								<dd>OK캐쉬백 카드번호가 오등록 되는 경우 카드번호가 자동삭제되며, 11번가 포인트로 적립이 이루어집니다.</dd>
								<dd>e쿠폰, 모바일상품권 등 SMS로 발송되는 상품은 구매후 <strong>"배송완료"</strong> 상태이며, 오프라인 매장에서 <strong>서비스 이용 후 자동으로 구매확정</strong> 됩니다.</dd>
								<dd>티켓11번가 주문건중, 공연일이 있는 경우는 "공연일+1일째", 공연일이 없는 경우는 "배송중+29일째" 자동으로 구매확정 됩니다.</dd>
							</dl>
						</div>
					</div>
					<div class="tab_id2" style="display:none">
						<div class="detail">
							<dl>
								<dd><strong>해외배송 상품이란?</strong> 상품명 앞에 <span class="ic_plane"><em>비행기</em></span> 아이콘이 붙은 상품은 해외에서 배송되는 항공 배송 상품입니다.</dd>
								<dd><strong>항공배송 상품의 경우</strong> 해외에서 상품을 배송하여 배송준비중 상태와 배송중 상태가 다소 길어질 수 있습니다.</dd>
								<dd><strong>배송준비중</strong> : 판매자가 상품의 재고를 확인하고 국내로 배송하기 위해 준비중인 상태입니다. 구매 대행의 경우 해외 쇼핑몰에 주둔이 되어<br> 현지에서 배송을 위해 물류센터로 이동중인 상태가 포함되어 있어 배송준비중 상태가 약 5~10일 가량 유지될 수 있습니다.</dd>
								<dd><strong>배송중</strong> : 판매자가 해외에서 상품을 국내로 배송한 상태입니다, 물품발송 이후 해외배송을 통해 국내 도착까지는 약 9~20일 가량 소요 될 수 있습니다.</dd>
							</dl>
						</div>
					</div>
					<div class="tab_id3" style="display:none">
						<div class="detail">
						<dl>
								<dd>전세계배송 주문은 <strong>배송준비중 단계까지만 취소가 가능</strong>하며, 판매자 부담의 배송비가 발생한 경우에는 판매자 승인이 필요합니다.</dd>
								<dd><strong>반품</strong>은 11번가 홈페이지 고객센터 <strong>E-MAIL상담</strong>을 통해서만 신청이 가능합니다.</dd>
								<dd>전세계배송 이용 상품은 반품만 가능하며 <strong>교환은 가능하지 않다는 점을 주의</strong>하여 주십시오.</dd>
								<dd>취소/반품과 관련하여 상세한 내용은 <strong>전세계배송관 &gt; 전세계배송 안내</strong>를 확인하여 주십시오.</dd>
							</dl>
						</div>
					</div>
				</div>
			</div>	
			<div class="product_status">
				<div class="step1">
					<div class="step_status">
						<span class="red_bold">1.</span>입금 대기중<br>
						결제를 완료해주세요							
					</div>
				</div>
				<div class="pstatus">
					<i class="fas fa-arrow-right fa-2x"></i>
				</div>
				<div class="step1">
					<div class="step_status">
						<span class="red_bold">2.</span>결제완료<br>
						판매자가 주문정보를<br/>
						확인하기 전입니다.							
					</div>
				</div>
				<div class="pstatus">
					<i class="fas fa-arrow-right fa-2x"></i>
				</div>
				<div class="step1">
					<div class="step_status">
						<span class="red_bold">3.</span>배송 준비중<br>
						판매자가 주문을 확인하고<br/>
						배송을 준비 중입니다.							
					</div>
				</div>
				<div class="pstatus">
					<i class="fas fa-arrow-right fa-2x"></i>
				</div>
				<div class="step1">
					<div class="step_status">
						<span class="red_bold">4.</span>배송중<br>
						물품이 발송되어<br/>
						고객님께 배송합니다.							
					</div>
				</div>
				<div class="pstatus">
					<i class="fas fa-arrow-right fa-2x"></i>
				</div>
				<div class="step1">
					<div class="step_status">
						<span class="red_bold">5.</span>배송완료<br>
						상품수령후 구매확정을<br/>
						선택하시면 거래가 종료됩니다.							
					</div>
				</div>
			</div>
			
			
		</div>
		
	</div>
<script>
	function st_dayChange(){
		var year = $('#st_year').val();
		var month =$('#st_month').val();
		var day = $('#st_day').val();
		$('#stDay').val(year+'-'+month+'-'+day);
		console.log(year+'-'+month+'-'+day);
		
	};
	function end_dayChange(){
		var year = $('#end_year').val();
		var month =$('#end_month').val();
		var day = $('#end_day').val();
		$('#endDay').val(year+'-'+month+'-'+day);
		console.log(year+'-'+month+'-'+day);
		
	};
</script>
<%@ include file="../Template/fotter.jsp" %>