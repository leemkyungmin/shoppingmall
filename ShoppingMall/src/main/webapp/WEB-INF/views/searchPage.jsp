<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="Template/header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

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
				console.log()
				if(json_list.length > 10){
					json_list.splice(0,(json_list.length-10)); 
				}
				Cookies.set('query', json_list);
				console.log(json_list);
				search_cookies('${pageContext.request.contextPath}');
				
			}
			
		});
	</script>
	<style>
		.wrap{
			width: 1200px;
			min-height: 1500px;
		    z-index: 20;
		    margin: 0 auto;
		    padding: 10px 0 50px;
		    outline: none; 
		}
		.result{
			margin-top:20px;
			font-size: 20px;
			padding-right: 100px;
			height: 30px;
		}
		.result .search_Count{
			display:inline-block;
			height: 20px;
			float: left;
		}
		.result .design-controll{
			display:inline-block;
			height: 20px;
			float: right;
		}
		.style-controll{
			width: 100%;
			height: 250px;
			border: 1px solid black;
		}
		.style-controll .items-products-img{
			width: 220px;
			height: 220px;
			float: left;
		}
		.style-controll .item-content{
			float: left;
			width:700px;
			height:200px;
			margin: 30px 20px;
			border-right: 1px solid lightgray;
			font-size: 17px;
		}
		.item-seller{
			float: left;
		    width: 200px;
		    height: 220px;
		    text-align: center;
		    line-height: 220px;
		}
		.style-controll a{
			list-style: none;
			color: black;
			text-decoration: none;
		}
		.items-products-img img{
			width: 230px;
			height: 230px;
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
										<span class="review_count">평점 :${items.rRcount}점  리뷰갯수:${items.rRcount }개</span>
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
				</ul>
				
			</section>
			
		</div>
		
	</div>

</body>
</html>