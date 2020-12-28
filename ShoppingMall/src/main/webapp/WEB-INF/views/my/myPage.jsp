<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../Template/header.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/style/orderList.css">

<script>
	
</script>


	<div class="wrap">
		<div class="my_mall-list">
			<h2>회원정보 수정</h2>
			
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
					<a href="">회원정보 변경/탈퇴</a>
				</div>
				<div class="side-item">
					<a href="">나의 배송지 관리</a>
				</div>
			</div>
		</div>
		<div class="wrap_content">
			<div class="myPage_info">
				<div class="user-info-title">
					<span class="font-span red">회원정보</span><span class="font-span"> 변경</span>
					<span class="font-small">고객님의 회원정보를 수정하실 수 있습니다. 회원정보를 변경하시고 반드시 하단에 있는 확인 버튼을 클릭해 주셔야 합니다.</span>
				</div>
				<div class="user-update-menu">
					<ul>
						<li>lkm-shoppingmall은 회원님의 개인정보를 신중히 취급하며 , 회원님의 동의 없이는 기재하신 회원정보가 공개되지 않습니다.</li>
						<li>보다 당양한 서비스를 받으시려면 정확한 정보를 항상 유지해 주셔야합니다.</li>
						<li>영업 목적의 경우 (사업자등록을 가진 경우) 에는 반드시 사업자 샐러(판매자)로 가입하셔야 합니다.</li>
						<li>타인의 개인정보를 도용한 피해방지 및 개인 샐러의 개인정보보호를 위해 범용 공인 인증서를 통한 본인확인 과정을 실시하고 있습니다.</li>
						<li><span class="font-small red">행정구역이 변경되어 사용할 수 없는 주소는 회원정보에서 삭제됩니다.</span>
					</ul>
				</div>
				<div class="user-info">
					<c:if test="${udto !=null }">
					<form action="userUpdate" method="post">
							<table>
								<tbody>
									<tr>
										<td>이름</td>
										<td colspan="3">${udto.uName }</td>
									</tr>
									<tr class="id-rows">
										<td>아이디</td>
										<td>${udto.uSerid}</td>
										<td>회원유형</td>
										<td> 개인 구매회원</td>
									</tr>
									<tr>
										<td>비밀번호</td>
										<td colspan="3"><input type="button" id="pwchange" value="비밀번호 변경하기"></td>
									</tr>
									<tr>
										<td>이메일 주소</td>
										<td colspan="3">${udto.uEmail}</td>
									</tr>
									<tr>
										<td>전화번호</td>
										<td colspan="3">${udto.uPhone }</td>
									</tr>
								
								</tbody>
								<tfoot>
									<tr>
										<td colspan="4">
											<input type="button" id="submit_btn" value="확인">
											<input type="button" id="return_btn" value="취소">
										</td>
									</tr>
								</tfoot>
							</table>
						</form>
						
					</c:if>
				</div>
			</div>
			
		</div>
		
	</div>
<script>
</script>
<%@ include file="../Template/fotter.jsp" %>