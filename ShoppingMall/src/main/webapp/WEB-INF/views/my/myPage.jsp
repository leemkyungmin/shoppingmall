<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../Template/header.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/style/orderList.css">

<script>
	$().ready(function(){
		$('#Email_addr').attr('readonly','readonly');
		$('#email_change').change(function(){
			if($('#email_change').val()==''){
				$('#Email_addr').removeAttr('readonly','readonly');
			}else{
				$('#Email_addr').attr('readonly','readonly');
				$('#Email_addr').val($('#email_change').val());
			}
		});
		$('#pwchange').click(function(){
			window.open('${pageContext.request.contextPath}/my/UpdatePwForm','비밀번호 변경', "width = 500, height = 500, top = 100, left = 500, location = no");
		});
	});
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
					<a href="${pageContext.request.contextPath}/my/confirmPassword">회원정보 변경</a>
					/<a href="${pageContext.request.contextPath }/my/deleteuser">탈퇴</a>
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
					<form>
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
										<td colspan="3">
											<c:set var="email" value="${udto.uEmail}"/>
											<c:set var="email_addr" value="${fn:substringAfter(email,'@') }"/>
											<input type="text" id="uEmail" value=${fn:substringBefore(email,'@') }>@
											<input type="text" id="Email_addr" value=${email_addr }>
											<select id="email_change">
												<option value="">직접 입력</option>
												<option value="naver.com">naver.com</option>
												<option value="hanmail.net">hanmail.net</option>
												<option value="daum.net">daum.net</option>
												<option value="nate.com">nate.com</option>
												<option value="gmail.com">gmail.com</option>
											</select>
											
										</td>
									</tr>
									<tr>
										<c:set var="uPhone" value="${udto.uPhone }"></c:set>
									
										<c:set var="first_num" value="${fn:substring(uPhone,0,3)}" ></c:set>
										<c:set var="second_num" value="${fn:substring(uPhone,3,7) }"></c:set>
										<c:set var="last_num" value="${fn:substring(uPhone,7,11) }"></c:set>
										
										<td>전화번호</td>
										<td colspan="3">
											<input type="text" name=first_num id="first_num" value=${first_num }> - 
											<input type="text" name=second_num id="second_num" value=${second_num }> - 
											<input type="text" name=last_num id="last_num" value=${last_num }>
										</td>
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
						<script type="text/javascript">
							$().ready(function(){
								$('#return_btn').click(function(){
									location.href="${pageContext.request.contextPath}/order/OrderList";
								});
								$('#submit_btn').click(function(){
									var uEmail = $('#uEmail');
									var Email_addr =$('#Email_addr');
									var first_num =$('#first_num');
									var second_num =$('#second_num');
									var last_num =$('#last_num');
									if(uEmail.val() ==''){
										alert('이메일을 입력해주세요');
										uEmail.focus();
									} else if ( Email_addr.val() =='' ){
										alert('이메일 주소를 입력해주세요');
										Email_addr.focus();
									} else if ( first_num.val() ==''  || first_num.val().length <3){
										alert('전화 번호 양식이 아닙니다.');
										first_num.focus();
									} else if ( second_num.val() =='' || second_num.val().length <4){
										alert('전화 번호 양식이 아닙니다.');
										second_num.focus();
									} else if ( last_num.val() ==''  || last_num.val().length <4 ){
										alert('전화 번호 양식이 아닙니다.');
										last_num.focus();
									} else {
										if(confirm('회원정보를 수정하시겠습니까?')){
											var email = uEmail.val()+'@'+Email_addr.val();
											var phone = first_num.val()+second_num.val()+last_num.val();
											$.ajax({
												url : '${pageContext.request.contextPath}/my/userUpdate',
												type :'post',
												data :'uEmail=' + email +'&uPhone='+phone,
												success :function(data){
													if(data ==1){
														alert('회원정보 수정 완료');
														history.go(0);
													} else if(data ==-1){
														alert('로그인 세션 만료로 업데이트 실패 다시 시도해주세요');
														location.href='${pageContext.request.contextPath}/login';
													} else {
														alert('업데이트 실패');
													}
												},error:function(){
													alert('통신 실패');
												}
											});
										} else {
											return ;
										}
									}
									
								});
							});
						</script>
					</c:if>
					<c:if test="${deptdto ne null }" >
						<form>
							<table>
								<tbody>
									<tr>
										<td>이름</td>
										<td colspan="3">${deptdto.dName }</td>
									</tr>
									<tr class="id-rows">
										<td>아이디</td>
										<td>${deptdto.dId}</td>
										<td>회원유형</td>
										<td>
											<c:if test="${deptdto.dType eq 'sell' }">
												기업 회원 판매고객
											</c:if>
											<c:if test="${deptdto.dType eq 'buy' }">
												기업 회원 구매
											</c:if>
										</td>
									</tr>
									<tr>
										<td>비밀번호</td>
										<td colspan="3"><input type="button" id="pwchange" value="비밀번호 변경하기"></td>
									</tr>
									
									<tr>
										<c:set var="uPhone" value="${deptdto.dPhone }"></c:set>
									
										<c:set var="first_num" value="${fn:substring(uPhone,0,3)}" ></c:set>
										<c:set var="second_num" value="${fn:substring(uPhone,3,7) }"></c:set>
										<c:set var="last_num" value="${fn:substring(uPhone,7,11) }"></c:set>
										
										<td>전화번호</td>
										<td colspan="3">
											<input type="text" name=first_num id="first_num" value=${first_num }> - 
											<input type="text" name=second_num id="second_num" value=${second_num }> - 
											<input type="text" name=last_num id="last_num" value=${last_num }>
										</td>
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
	$().ready(function(){
		$('#email_change').val('${email_addr}').attr('SELECTED','SELECTED');
	});
</script>
<%@ include file="../Template/fotter.jsp" %>