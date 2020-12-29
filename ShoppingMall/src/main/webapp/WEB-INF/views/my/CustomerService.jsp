<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../Template/header.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/style/orderList.css">

<script>
	
</script>


	<div class="wrap">
		<div class="my_mall-list">
			<h2>상담 내역</h2>
			
		</div>
		<div class="side_list">
			<div class="smyshopping">
				<div class="side-title">
					<h3>상담 내역</h3>
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
			
			
			
			<div class="myorderlist-title">
				<h2>상담 내역</h2>
				<div class="customer-svc-write">
					<a href="Write-Customer-Service">
						상담글 쓰기
					</a>
				</div>
				
			</div>			
			<div class="custom_list">
				<table class="custom_svc">
					<thead>
						<tr>
							<th>상담 번호</th>
							<th>상담분류</th>
							<th>제목</th>
							<th>작성일</th>
							<th>상담 상태</th>
						</tr>
					</thead>
					<tbody>
						
						<c:if test="${csdto.size() >0 }">		
							<c:forEach var="csdto" items="${csdto}" varStatus="i">
								<tr>
									<td>
										<div class="csdto-num">
											${csdto.cIdx}
										</div>
									</td>
									<td>
										<div class="csdto-type">
											${cdto.cType }
										</div>
									</td>
									<td>
										<div class="csdto-title">
											${csdto.cTitle}
										</div>
									</td>
									<td>
										${csdto.cReg_date}
									</td>
									<td>
										<c:if test="${csdto.cStatus eq 0 }">
											상담 대기중
										</c:if>
										<c:if test="${csdto.cStatus eq 1 }">
											상담 완료
										</c:if>
									</td>
								</tr>
							</c:forEach>
						</c:if> 
						<c:if test="${csdto.size() eq 0 }">
							<tr>
								<td colspan="6" class="no_info">
									<strong>
										작성된 상담내역이 없습니다.
									</strong>
								</td>
							</tr>
						</c:if>
					</tbody>
					<tfoot>
						<th colspan="6">${pagemaker}</th>
					</tfoot>
				</table>
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