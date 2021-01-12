<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/Template/header.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/style/buySuccess.css">

	<div class="wrap">
		<div class="wrap_content">
			<div class="title">
				<h2>주문 성공</h2>
			</div>
			<div class="table_content">
				<table class="first_table">
					<tbody>
						<tr>
							<td>주문번호</td>
							<td colspan="2">${odto.bOrder_num }</td>
						</tr>
						<tr>
							<td>주문일자</td>
							<td colspan="2">${odto.bDate }</td>
						</tr>
						<tr>
							<td>주문금액</td>
							<td colspan="2">${total_price}원</td>
						</tr>
					</tbody>
					<tr>
						<td rowspan="${options.size()+2 }">구매상품</td>
						<td>
							<table class="second_table">
								<thead>
									<tr>
										<td>상품명</td>
										<td>가격</td>
										<td>수량</td>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="option" items="${options }">
										<tr>
											<td>${option.boname }</td>
											<td>${option.boprice }</td>
											<td>${option.bocount}</td>
										</tr>
									</c:forEach>
									<tr>
										<td>합계</td>
										<td>${total_price }</td>
										<td>${total_count }</td>
									</tr>
								</tbody>
							</table>
						</td>
					</tr>
					<tfoot>
						<tr class="right">
							<td colspan="3">
								<input type="button" value="주문/배송조회" id="orderList">
								<input type="button" value="메인페이지" id="mainPage">
							</td>
						</tr>
					</tfoot>
					
				</table>
				<script type="text/javascript">
					$().ready(function(){
						$('#orderList').click(function(){
							location.href="${pageContext.request.contextPath}/order/OrderList";
						});
						$('#mainPage').click(function(){
							location.href="${pageContext.request.contextPath}/index";
						});
					});
				</script>
			</div>
		</div>
	</div>

<%@ include file="/WEB-INF/views/Template/fotter.jsp" %>

