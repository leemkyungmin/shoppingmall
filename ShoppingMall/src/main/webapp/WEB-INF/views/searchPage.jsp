<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="Template/header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
	<link rel="styleSheet" href="${pageContext.request.contextPath }/resources/assets/style/searchPage.css">
	<style>
		.star{
		background-image: url(${pageContext.request.contextPath}/resources/assets/images/images.png);
	    background-position: -170px 0px;
	    width: 178px;
	    height: 32px;
	    background-size: 439px 403px;
	    position: relative;
	    overflow: hidden;
	    display: inline-block;
	    vertical-align: top;
	    color: transparent;
	    line-height: 200px;
	    font-size: 1px;
	    content: '';
	}
	.star::after{
		content :'after';
	}
	.star:after{
		background-image: url(${pageContext.request.contextPath}/resources/assets/images/images.png);
	    background-position: -170px -37px;
	    width: 178px;
	    height: 32px;
	    background-size: 439px 403px;
	    position: absolute;
	    top: 0;
	    left: 0;
	    bottom: 0;
	}
	</style>
	<div class="wrap">
		<div class="wrap-content">
			<div class="result">
				
				<div class="search_Count">
					<Strong>
						검색결과<span class="count">${sdto.size()}개</span>
					</Strong>
				</div>
				<div class="design-controll">
					<select class="search-orderby">
						<option value="낮은 가격순">낮은 가격순</option>
						<option value="낮은 가격순">높은 가격순</option>
						<option value="낮은 가격순">많은 리뷰순</option>
					</select>
				</div>
			</div>
			<section class="search_section">
				<ul class="item-list">
					<c:if test="${sdto.size() ne 0 }">
						<script>
							$().ready(function(){
							
							var q ='${query}';
							
							if(Cookies.get('query') ===undefined || Cookies.get('query')=='[null]'){
								Cookies.set('query',"[{\"name\":\""+q+"\"}]");
								
							}else{  
								var json_list = Cookies.getJSON('query'); 
								
								for(var i=0; i<json_list.length; i++){
									for(key in json_list[i]){
										if(json_list[i][key]==q){
											delete json_list[i];
											json_list=JSON.parse(JSON.stringify(json_list).replace(/(,null|null,)/g,''));
											break;
										}
									}
								}
								
								json_list.push({
									name: q,
								});
								console.log(json_list.length);
								if(json_list.length > 10){
									json_list.splice(0,(json_list.length-10)); 
								}
								Cookies.set('query', json_list);
								console.log(json_list);
								search_cookies('${pageContext.request.contextPath}');
								
							}
							
						});
					</script>
						<c:forEach var="items" items="${sdto}" >
						<li>
							<div class="style-controll">
								<div class="items-products-img">
									<a href="${pageContext.request.contextPath}/product/products/${items.pIdx}">
										<img src="${pageContext.request.contextPath}/resources/images/Department_sumnail/${items.pSumnail}">
									</a>
								</div>
								<div class="item-content">
									<div class="items-products-name">
										<a href="${pageContext.request.contextPath }/product/products/${items.pIdx}">
											${items.pName}
										</a>
									</div>
									
									<div class="items-products-rating">
										
											<span class="star count_${items.rRating }">
												${items.rRating}
												
											</span>
										  	리뷰갯수:${items.rRcount }개
										
									</div>
									<div class="items-products-price">
										가격 :${items.pRice}원 ~
									</div>
								</div>
								<div class="item-seller">
									판매자:${items.dName}
								</div>
							</div>
						</li>
					</c:forEach>
					</c:if>
					
				</ul>
				
			</section>
			
		</div>
		
	</div>
	
</body>
</html>