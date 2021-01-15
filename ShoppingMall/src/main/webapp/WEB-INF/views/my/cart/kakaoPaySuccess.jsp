<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카카오페이 결제성공</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
	<script type="text/javascript">
		$().ready(function(){
			
			var total_price =${info.amount.total };
			var border_num= ${info.partner_order_id };
			var options = opener.$('#options').val();
			var border_status = 2;
			$.ajax({
				url:'${pageContext.request.contextPath}/my/cart/insert',
				method:'post',
				data:'total_price='+total_price+'&border_num='+border_num+'&options='+options+'&border_status='+border_status,
				success:function(data){
					
					opener.location.href="${pageContext.request.contextPath}/order/OrderList";
					window.close();
					
				},error:function(){ 
					console.log('통신실패');
				}
			});
			
		});
	</script>
	<div class="wrap">
		<div class="wrap_content">
			
		</div>
	</div>
	${info}
	결제일시:     ${info.approved_at }<br/>
	주문번호:     ${info.partner_order_id }<br/>
	상품명:    ${info.item_name }<br/>
	상품수량:     ${info.quantity }<br/>
	결제금액:     ${info.amount.total }<br/>
	결제방법:     ${info.payment_method_type }<br/>
</body>
</html>