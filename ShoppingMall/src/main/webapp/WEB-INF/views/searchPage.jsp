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
				search_cookies();
				
			}
			
		});
	</script>
	
	<div class="wrap">
		<div class="wrap-content">
			<div class="result">
				<div class="search_Count">
					<Strong>
						검색결과<span class="count"></span>
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
								<div class="items-products-img">${items.pNimg}</div>
								<div class="items-products-name">${items.pName}</div>
								<div class="items-products-rating">
									<span class="review_count">${items.Rcount}</span>
								</div>
								<div class="items-products-price">${items.pRice}</div>
								
							</div>
						</li>
					</c:forEach>
				</ul>
				
			</section>
			
		</div>
		
	</div>

</body>
</html>