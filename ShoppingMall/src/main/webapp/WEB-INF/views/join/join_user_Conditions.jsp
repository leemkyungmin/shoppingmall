<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../Template/registerhearder.jsp" %>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	################### 약관 동의 페이지 작성
	################### 약관 상세 설명 클릭시 modal을 이용해 화면에 출력하기 
	################### 모두 동의 클릭시 체크박스 모두 선택
	################### 필수 선택 사항만 체크되도 동의 버튼 활성화 하기 
	################### <button class="chango">참고 사이트</button>
	<script>
	$(document).ready(function(){
		$('.chango').click(function(){
			window.open(
					'https://www.skt-id.co.kr/member/join/newJoin.do?q=eyJhbGciOiJBMjU2S1ciLCJlbmMiOiJBMjU2R0NNIn0.NFCoJOd7HWOQKoY-CljLkdiFR66D4J_u3-0yd6ghhHCXbhGgs2WK9w.aGFjn5hrLFsLkpip.q0ZpcaREn8RQAMH6thhvZ1xLUaFteyOPy2yS6XICnqK32-vMTkO4w8TyO0ejfLljy1S75SVvCY7YTMih1NVz6F_hk6xXWEtH8w-b-CYt.5jIhBUvcsdjdnLVP2z0CFQ'
					,'약관 동의 참고사이트'
			)
		})
			
		
	});
		
	</script>
</body>
</html>