<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../Template/header.jsp" %>

<style>
	.wrap{
		width: 1200px;
		min-height: 1500px;
		z-index: 20;
		margin: 0 auto;
		padding: 10px 0 50px;
		outline: none; 
	}
	.title{
		margin-top:20px;
		font-size: 20px;
		height: 50px;
	}
	.myproduct_count{
		display: inline-block;
		float: left;
	}
	.new_products_input{
		display:inline-block;
		float: right;
	}
	.product_box{
		width: 100%;
		height: 300px;
		border :1px solid black;
		padding: 10px;
		margin: 20px auto;
	}
	.product_box .product_reg_date{
		text-align: right;
		border-bottom: 1px solid lightgray;
		font-size: 21px;
		margin: 10px 0;
		padding-right: 50px;
	}
	.product_box img{
		width: 220px;
		height: 220px;
		float: left;
	}
	.product_box .product_info{
		float:left;
		margin: auto 10px;
		font-size: 20px;
		width :800px;
		height: 200px;
		padding-top: 47px;
	}
</style>
<script>
	$().ready(function(){
		$('.input_product').click(function(){
			location.href="newProductsForm";
		});
	});
</script>
	<div class="wrap">
		<div class="wrap-content">
			<div class="title">
				<div class="myproduct_count">
					<span class="count">${sessionScope.name}님 판매 상품 개수:${myplist.size()}</span>
				</div>
				<div class="new_products_input">
					<a class="input_product">새 상품 등록</a>
				</div>
			</div>
			<div class="content">
				<c:if test="${myplise.size() eq 0 }">
					<div class="no_list">
						판매중인 상품이 없습니다.
					</div>
				</c:if>
				<c:if test="${myplist.size() >0 }">
					<c:forEach var="list" items="${myplist }">
						<div class="product_box">
							<div class="product_reg_date">
								등록일 :${list.pDate }
							</div>
							
							<div class="product_img">
								<img  src="${pageContext.request.contextPath}/resources/assets/images/Department_sumnail/${list.pSumnail}">
							</div>
							<div class="product_info">
								<div class="product_pname">
									${list.pname }
								</div>
								<div class="product_rating">
									총 별점:${list.rTotal}점
									작성된 댓글수 :${list.rCount}개
								</div>
								<div class="product_price">
									${list.price}원~
								</div>
							</div>
							
						</div>
					</c:forEach>
				</c:if>
			</div>
		</div>
	</div>
	

<%@ include file="../Template/fotter.jsp" %>