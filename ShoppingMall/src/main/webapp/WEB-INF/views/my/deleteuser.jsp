<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../Template/header.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/style/orderList.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<div class="wrap">
		<div class="my_mall-list">
			<h2>회원 탈퇴</h2>
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
						${sessionScope.name }님 <span class="order-status">회원탈퇴</span>
						<span class="span_small">회원탈퇴전 다음 사항을 꼭 숙지하시기 바랍니다.</span>
					</strong>
				</div>
				<div class="cOrder">
					<ul class="list-on" >
						<li>
							<span class="span-small">1)회원님께서 메일 수신 및 기타 개인정보 등에 대한 불편으로 회원 탈퇴를 원하신다면, 아래의 방법으로 불편사항을 해결 하실 수 있습니다</span>
						</li>
						<li>
							<span class="span-small">2)저희 쇼핑몰은 고객센터(1599-1599)를 365일 24시간 운영하고 있습니다.</span>
						</li>
						<li>
							<span class="span-small">3)서비스 이용 중 불편사항은 언제든지 연락 주시면, 최선을 다해 해결 되도록 노력하겠습니다.</span>
						</li>
					</ul>
				</div>
			</div>
					
						
			<div class="delete-info-box">
				<h3>회원 탈퇴 안내</h3>
				<div class="delete_user">
					<ul class="list-on">
						<li>
							<span class="span-small">1)회원 탈퇴 시 회원님께서 보유하셨던 비현금성 포인트와 마일리지, 칩/쿠폰, 회원정보, 거래정보 등은 모두 삭제 됩니다.</span>
						</li>
						<li>
							<span class="span-small">2)회원 탈퇴 후 재가입 시에는 신규 회원 가입으로 처리되며, 탈퇴 전의 회원정보와 거래정보 및 포인트, 마일리지, 칩, 쿠폰 정보등은 복구되지 않습니다.</span>
							
						</li>
						<li>
							<span class="span-small">3)신규 회원 가입 유예기간은 아래와 같습니다.</span>
						</li>
					</ul>
				</div>
				<div class="delete_table">
					<table>
						<thead>
							<tr>
								<th>
									즉시 회원 탈퇴가 불가능한 경우
								</th>
								<th>
									탈퇴방법
								</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>
									진행중인 거래(판매 또는 구매) 내역이 있는 경우
								</td>
								<td>
									거래 종료 후 회원 탈퇴 가능
								</td>
							</tr>
							<tr>
								<td>
									인출 가능한 현금성 포인트 및 캐시가 있는 경우
								</td>
								<td>
									잔액을 모두 인출한 이후 회원 탈퇴 가능
								</td>
							</tr>
							<tr>
								<td>
									마이너스 포인트가 있는 경우
								</td>
								<td>
									마이너스된 포인트를 결제한 이후 회원 탈퇴 가능
								</td>
							</tr>
							<tr>
								<td>
									마이너스 캐시가 있는 경우
								</td>
								<td>
									마이너스된 캐시를 결제한 이후 회원 탈퇴 가능
								</td>
							</tr>
							<tr>
								<td>
									전시광고 영역에 상품 및 배너가 전시되어 있는 경우
								</td>
							
								<td>
									전시 기간이 종료된 이후 회원 탈퇴 가능
								</td>
							</tr>
						</tbody>
					</table>	
				</div>
			</div>
			<div class="delete_form">
				<form action="${pageContext.request.contextPath}/my/delete">
					<div class="delete_form_title">
						<h2>${sessionScope.name }님 회원 탈퇴</h2>
					</div>
					<div class="delete_input">
						<div class="del-input">
							<label for=pw>비밀번호</label><input type="password" id="pw" name="pw" placeholder="비밀번호 입력해주세요">
						</div>
						<div class="del-input">
							<label for="delete_ment">입력해주세요</label><input type="text" id="delete_ment" placeholder="탈퇴하기">
						</div>
						<div class="del-input btn">
							<input type="button" id="del_btn" value="탈퇴하기">
						</div>
					</div>
				</form>
			</div>
			
		</div>
		<script type="text/javascript">
			$().ready(function(){ 
				$('#del_btn').click(function(){
					var pw = $('#pw');
					var del_ment =$('#delete_ment');
					
					if(pw.val() ==''){
						alert('비밀번호를 입력해주세요');
						pw.focus();
					} else if (del_ment.val() !='탈퇴하기'){
						alert('탈퇴하기를 입력해주세요!');
						del_ment.focus();
					} else {
						$.ajax({
							url:'${pageContext.request.contextPath}/my/deletecheck',
							data :'pw='+pw.val(),
							type :'post',
							success:function(data){
								if(data ==1){
									alert('${sessionScope.name}님 회원탈퇴 성공');
									location.href="${pageContext.request.contextPath}/index";
								} else {
									alert('탈퇴 실패 비밀번호를 확인해주세요');
								}
							}, error:function(){
								alert('통신 실패');
							}
						});
					}
					
				});
			});
		</script>
	</div>

<%@ include file="../Template/fotter.jsp" %>