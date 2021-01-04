<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../Template/header.jsp"%>

<style>
	.wrap-content{
		width: 1500px;
		margin:20px auto;
	}
</style>

	<div class="wrap">
		<div class="wrap-content">
			<div class="product-content">
				<div class="sumnail_img">
					<img src="${pageContext.request.contextPath}/resources/images/Department_sumnail/${pdto.pSumnail}">
				</div>
				<div class="product_info">
					<div class="product_review">
						####별점
					</div>
					<div class="product_pname">
						<strong>
							${pdto.pName }
						</strong>
					</div>
					<div class="order_price">
						${pdto.pOrder_price}원
					</div>
				</div>
				<div class="tabDetail">
					<ul>
						<li>
							<button>상품 정보</button>
						</li>
						<li>
							<button>상품 리뷰</button>
						</li>
						<li>
							<button>판매자 정보</button>
						</li>
						
						
					</ul>
				</div>
			</div>
			<div class="option-menu">
			
			</div>
		</div>
	</div>
	
<%@ include file="../Template/fotter.jsp"%>