<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../Template/header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/style/orderList.css">
<script>
	$().ready(function(){
		$('.cdto_list').click(function(){
			var data =$(this).data('value');
			
			if(data !=null){
				window.open("${pageContext.request.contextPath}/my/custom_svc/"+data,'상담글', "width = 1000, height = 1000, top = 50, left = 500, location = no");
			}
		});
	});
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
					<a href="${pageContext.request.contextPath }/my/myCartList">카트</a>
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
							<c:forEach var="cdto" items="${csdto}" varStatus="i">
								<tr class="cdto_list" data-value="${cdto.cIdx}">
									
									<td>
										<div class="csdto-num">
											${cdto.cIdx}
										</div>
									</td>
									<td>
										<div class="csdto-type">
											<c:if test="${cdto.cType eq 1}">
												[상품문의]
											</c:if>
											<c:if test="${cdto.cType eq 2}">
												[구매문의]
											</c:if>
											<c:if test="${cdto.cType eq 3}">
												[판매문의]
											</c:if>
											<c:if test="${cdto.cType eq 4}">
												[광고문의]
											</c:if>
										</div>
									</td> 
									<td>
										<div class="csdto-title">
											${cdto.cTitle}
										</div>
									</td>
									<td>
										${cdto.cReg_date}
									</td>
									<td>
										<c:if test="${cdto.cStatus eq '0' }">
											상담 대기중
										</c:if>
										<c:if test="${cdto.cStatus eq '1' }">
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