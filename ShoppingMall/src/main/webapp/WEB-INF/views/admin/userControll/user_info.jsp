<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<title>Insert title here</title>

<style>
	.wrap{
		width: 100%;
	}
	.content table{
		width: 100%;
		border-collapse: collapse;
	}
	.content table tbody tr:nth-child(2n-1){
		background-color: lightgray;
	}
	.content table tr{
		width: 100%;
		height: 40px;
		border: 1px solid lightgray;
	}
	.content table thead th{
		text-align: center;
	}
	.content table tbody td{
		text-align: center;
		
	}
	.content table tbody td:first-child {
		width: 117px;
	}
	.content table tfoot td{
		width: 150px;
		text-align: right;
		padding-right:20px;
	}
</style>

</head>
<body>

	<div class="wrap">
		<div class="content">
			<table>
				<c:if test="${blist.size() >0 }">
					<thead>
						<tr>
							<th>주문 일자</th>
							<th>주문 상품 정보</th>
							<th>상품 금액(수량)</th>
							<th>배송비</th>
							<th>주문상태</th>
						</tr>
						
					</thead>

					<c:forEach var="buylist" items="${blist }">
						<tr>
							<td>${buylist.bDate }</td>
							<td>${buylist.pName }</td>
							<td><fmt:formatNumber value="${buylist.price}" pattern="#,###" /></td>
							<td><fmt:formatNumber value="${buylist.pOrder_price}" pattern="#,###" /></td>
							<td>
									<c:if test="${buylist.bOrder_status eq 1 }">
										<div class="o-status">
											입금 대기	
										</div>
									</c:if>
									<c:if test="${buylist.bOrder_status eq 2 }">
										<div class="o-status">
											입금확인 / 상품 준비
										</div>
											
									</c:if>
									<c:if test="${buylist.bOrder_status eq 3 }">
										<div class="o-status">
											상품 배송중
										</div>
											
									</c:if>
									<c:if test="${buylist.bOrder_status eq 4 }">
										<div class="o-status">
											배송완료
										</div>
											
									</c:if> 
								</td>
						</tr>
					</c:forEach>
				</c:if>
				<c:if test="${rlist.size() >0 }">
					<thead>
						<tr>
							<th>작성일</th>
							<th>내용</th>
							<th>별점</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="review" items="${rlist }">
							<tr>
								<td>${review.rWrite_date }</td>
								<td>${review.rContent }</td>
								<td>${review.rAting }</td>
							</tr>
						</c:forEach>
					</tbody>
				</c:if>
				<c:if test="${cslist.size()>0 }">
					<thead>
						<tr>
							<th>상담번호</th>
							<th>상담분류</th>
							<th>제목</th>
							<th>작성일</th>
							<th>상담상태</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="clist" items="${cslist }">
							<tr>
								<td>
										<div class="csdto-num">
											${clist.cIdx}
										</div>
									</td>
									<td>
										<div class="csdto-type">
											<c:if test="${clist.cType eq 1}">
												[상품문의]
											</c:if>
										</div>
									</td> 
									<td>
										<div class="csdto-title">
											${clist.cTitle}
										</div>
									</td>
									<td>
										${clist.cReg_date}
									</td>
									<td>
										<c:if test="${clist.cStatus eq '0' }">
											상담 대기중
										</c:if>
										<c:if test="${clist.cStatus eq '1' }">
											상담 완료
										</c:if>
										
									</td>
							</tr>
						</c:forEach>
					</tbody>
				</c:if>
				<tfoot>
					<tr>
						<td colspan="5">${pageMaker }</td>
					</tr>
				</tfoot>
			</table>
		</div>
	</div>
</body>
</html>