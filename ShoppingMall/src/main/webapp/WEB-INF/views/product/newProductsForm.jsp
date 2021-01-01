<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ include file="../Template/header.jsp" %>

	<div class="wrap">
		<div class="wrap_content">
			<form action="${pageContext.request.contextPath }/product/insertproduct" enctype="multipart/form-data">
			
				<div class="product_pname">
					<label for="pName"> 상품명</label>
					<input type="text" name="pName" id="pName" placeholder="상품명">
				</div>
				<div class="product_psumnail">
					<label for="pSumnail">상품 메인 이미지</label>
					<input type="file" name="pSumnail" id="pSumnail" >
				</div>
				<div class="product_sumnail">
					<img id="sumnail">
				</div>
				<div class="product_notice">
					<label for="notice_img">공지사항 이미지(중복 등록가능)</label>
					<input type="file" id="notice_img" multiple="multiple">
				</div>
				<div class="product_notice_imgs">
					<ul class="notice_imgs"></ul>
				</div>
				<div class="product_info_img">
					<label for="info_img">상품 이미지</label>
					<input type="file" id="info_img" multiple="multiple">
				</div>
				<div class="product_info_table">
					<table>
						<tbody>
							<tr>
								<td><label for="price">상품 평균 가격</label></td>
								<td><input type="text" id="price" placeholder="숫자만 입력해주세요"></td>
							</tr>
							<tr>
								<td><label for="order_price">배송비</label></td>
								<td><input type="text" id="order_price" placeholder="숫자만 입력해주세요"></td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="product_option">
					<div class="option1">
						<input type="text" name="option1" id="option1" placeholder="옵션명">
					</div>
					<div class="option2">
						<div class="option_btn">
							<button class="add_option">옵션 추가 </button>
						</div>
						<div class="option2_item">
							
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>

<%@ include file="../Template/fotter.jsp" %>