<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../Template/header.jsp"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/style/showproduct.css">

	<div class="wrap">
		<div class="wrap-content">
			<div class="product-content">
				<div class="info-content">
					<div class="sumnail_img">
						<img src="${pageContext.request.contextPath}/resources/images/Department_sumnail/${pdto.pSumnail}">
					</div>
					<div class="product_info">
						<div class="product_review">
							####별점
						</div>
						<div class="product_pname">
							<strong>
								${pdto.pName }
							</strong>
						</div>
						<div class="order_price">
							${pdto.pOrder_price}원 ~
						</div>
					</div>
				</div>
				<script type="text/javascript">
					$().ready(function(){
						$('.pDetail_btn').click(function(){
							var datas = $(this).data('value');
							var height = $(document).scrollTop();
							console.log('현재위치 : '+height);
							console.log('태그 위치 : '+$(datas).offset().top);
							$('html,body').animate({
								scrollTop:$(datas).offset().top-180
							},500);
						});
						$(window).scroll(function(){
							var offsetY = $(document).scrollTop();
							var targetY = $('#tabDetail').offset().top-180;
							console.log('offsetY : '+offsetY);
							console.log('tableheight : '+targetY);
							if(offsetY >= $('#tabDetail').offset().top-180 ){
								if($('.pDetail').data('value')=='none'){
									$('.pDetail').addClass('fixed');
									$('.pDetail').data('value','fixed');
									$('.option-menu').addClass('fixed');
								}
							} else {
								if($('.pDetail').data('value')=='fixed'){
									$('.pDetail').removeClass('fixed');
									$('.pDetail').data('value','none');
									$('.option-menu').removeClass('fixed');
								}
							}
						});
					});
				
					
				</script>
				<div class="tabDetail" id="tabDetail">
					<ul class="pDetail" data-value="none">
						<li>
							<button class="pDetail_btn" id="pDetail_btn" data-value="#products_info">상품 정보</button>
						</li>
						<li>
							<button class="pDetail_btn" id="pDetail_btn" data-value="#review">상품 리뷰</button>
						</li>
						<li>
							<button class="pDetail_btn" id="pDetail_btn" data-value="#dept_info">판매자 정보</button>
						</li>

					</ul>
					<div class="products_info" id="products_info">
						<table class="info_table">
							<colgroup>
								<col style="width:18%">
								<col style="width:32%">
								<col style="width:18%">
								<col style="width:32%">
							</colgroup>
							<tbody>
								<tr>
									<td>상품상태</td>
									<td>새상품</td>
									<td>상품번호</td>
									<td>${pdto.pIdx }</td>
								</tr>
								<tr>
									<td>배송방법</td>
									<td>택배</td>
									<td>배송가능지역</td>
									<td>전국</td>
								</tr>
								<tr>
									<td>제조일자/유효기간</td>
									<td>판매자에게 문의</td>
									<td>원산지</td>
									<td>상품상세참고</td>
								</tr>
								<tr>
									<td>A/S안내</td>
									<td colspan="3">${deptdto.dName} ${deptdto.dPhone }</td>
								</tr>
							</tbody>
						</table>
						
						<div class="notice_img">
							<c:set var="notice_img" value="${pndto.pNimg }"/>
							<c:forEach var="pn_img" items="${fn:split(notice_img,',')}" varStatus="i">
								<div class="imgs">
									<img src="${pageContext.request.contextPath}/resources/images/Department_notice/${pn_img}">
								</div>
							</c:forEach>
						</div>
						<div class="product_img">
							<c:set var="product_img" value="${pndto.pImg}"/>
							<c:forEach var="pimg" items="${fn:split(product_img,',')}">
								<div class="imgs">
									<img src="${pageContext.request.contextPath}/resources/images/Department_product_img/${pimg}">
								</div>
							</c:forEach>
						</div>
					</div>
					<div class="review" id="review" >
						<div class="review_title">
							<div class="review_rating">
								리뷰 평점 / 별  /리뷰 개수 
							</div>
							<div class="review_reating_persent">
								리뷰 퍼센테이지 
							</div>
						</div>
						<div class="review_Content">
							<div class="review_Content_title">
								<span class="span_bold">
									전체리뷰
								</span>
								#### xxx건
							</div>
							<div class="review_content_list">
								<ul class="review_list">
									<c:if test="${rdto.size() ne 0  }">
										<c:forEach var="rlist" items="${rdto }">
											<li>
												<div class="review_detail">
													<div class="review_writer">
														<div class="writer">
															작성자:${rlist.rWriter}
														</div>
														<div class="write_date">
															${rlist.rWrite_date}
														</div>
													</div>
													<div class="review_rating">
														${rlist.rAting }
													</div>
													<div class="buy_options">
														<span class="option_font">
														
															<c:forEach var="options" items="${bodto }" varStatus="i">
																<c:if test="${options.bIdx eq rlist.bIdx }">
																	 <span class="option_font_blue">옵션${i.count}</span> : ${options.bOname } 
																</c:if>
															</c:forEach>
														</span>
													</div>
													
													<div class="review_contents">
														<p>${rlist.rContent }</p>
													</div>
												</div>
												
											</li>											
										</c:forEach>
									</c:if>
								</ul>
								<div class="reivew_list_more">
									<a href="">리뷰 더보기</a>
								</div>
							</div>
						</div>
						<div class="seller-info">
							<div class="resend_title">
								반품 / 교환 정보
							</div>
							<table>
								<tr>
									<td>판매자명</td>
									<td>${deptdto.dName }</td>
								</tr>
								<tr>
									<td>연락처</td>
									<td>${deptdto.dPhone}</td>
								</tr>
								<tr>
									<td>고객문의 가능시간</td>
									<td>09시~18시(공휴일 제외)</td>
								</tr>
								<tr>
									<td>반품 / 교환지 주소</td>
									<td>${fn:replace(deptdto.dAddress,'/',' ') }</td>
								</tr>
								<tr>
									<td>반품 / 교환안내</td>
									<td>${deptdto.dName} ${deptdto.dPhone }</td>
								</tr>
								<tr>
									<td>반품 / 교환기준</td>
									<td>
										상품 수령 후 7일 이내에 신청하실 수 있습니다. 단, 제품이 표시광고 내용과 다르거나 불량 등 계약과 다르게 이행된 경우는<br>
										제품 수령일부터 3개월 이내, 그 사실을 안 날 또는 알 수 있었던 날부터 30일이내에 교환/반품이 가능합니다
										<ul>
											<li>
												추가적으로 다음의 경우 해당하는 반품/교환은 신청이 불가능할 수 있습니다.
												<ul>
													<li>-소비자의 책임 있는 사유로 상품 등이 멸실 또는 훼손된 경우 (단지, 상품 확인을 위한 포장 훼손 제외)</li>
													<li>-소비자의 사용 또는 소비에 의해 상품 등의 가치가 현저히 감소한 경우</li>
													<li>-시간의 경과에 의해 재판매가 곤란할 정도로 상품 등의 가치가 현저히 감소한 경우</li>
													<li>-복제가 가능한 상품 등의 포장을 훼손한 경우</li>
													<li>-소비자의 주문에 따라 개별적으로 생산되는 상품이 제작에 들어간 경우</li>
												</ul>
											</li>
										</ul>
									</td>
								</tr>
							</table>
						</div>
						<div class="seller">
							<div class="seller-title">
								판매자정보
							</div>
							<table>
								<tr>
									
								</tr>
							</table>
						</div>
					</div>
				</div>
			</div>
			<div class="option-menu">
				<div class="option_menu_inner">
					<ul class="product_buy_list" id="buyList">
						<li>
							<div class="option1">
								<a href="">
									<span class="span_bold">옵션명 1</span>
									<!-- 
										<i class="fas fa-chevron-up"></i> 접는 표시 
										<i class="fas fa-chevron-down"></i> 펼치는 표시 
									 -->
									<button><i class="fas fa-chevron-down"></i></button>
								</a>
							</div>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	
<%@ include file="../Template/fotter.jsp"%>