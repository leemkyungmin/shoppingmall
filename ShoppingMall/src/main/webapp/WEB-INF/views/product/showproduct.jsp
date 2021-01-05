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
															${rlist.rWriter}
														</div>
														<div class="write_date">
															${rlist.rWrite_date}
														</div>
													</div>
													<div class="review_rating">
														${rlist.rAting }
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