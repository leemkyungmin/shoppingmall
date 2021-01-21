<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../Template/Adminhearder.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	
	<style>
		.wrap{
			width: 100%;
			height: 1000px;
		}
		iframe{
			border:0;
			width: 100%;
			height: 100%;
		}
	</style>
	<script>
		$().ready(function(){
			
			var status= '${csdto.cStatus}';
			var cidx =${csdto.cIdx};
			if(status =='9'){
				alert('다른 상담사가 상담중입니다.');
				history.go(-1);
			} else if(status =='1'){
				
			}else {
				$.ajax({
					url:'${pageContext.request.contextPath}/admin/answer_customer_service',
					type:'post',
					data:'cidx='+cidx,
					success:function(data){
						console.log('상담중으로 변경');
					} ,error:function(){
						console.log('error');
					}
					
				});
			}
			
			
		});
	</script>
	<div class="wrap">
		<iframe src="${pageContext.request.contextPath}/admin/admin_customer_iframe?cidx=${csdto.cIdx}"></iframe>
	</div>

<%@ include file="../Template/Adminfotter.jsp" %>