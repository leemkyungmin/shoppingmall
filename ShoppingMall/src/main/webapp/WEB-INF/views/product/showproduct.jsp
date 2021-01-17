<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../Template/header.jsp"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/style/showproduct.css">
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
	    content: '';
	}
</style>
<script>
	$().ready(function(){
		var pidx ="${pdto.pIdx}";
		
		var arr =  new Array();
		arr =JSON.parse(localStorage.getItem('recent_show_product'));
		
		if(localStorage.getItem('recent_show_product') ===undefined || localStorage.getItem('recent_show_product')=='[null]' ||localStorage.getItem('recent_show_product')==null){
			localStorage.setItem('recent_show_product',"[{\"pidx\":\""+pidx+"\"}]");
		} else {
			
			for(var i=0; i<arr.length; i++){
				for(key in arr[i]){
					if(arr[i][key]==pidx){
						delete arr[i];
						arr=JSON.parse(JSON.stringify(arr).replace(/(,null|null,)/g,''));
						break;
					}
				}
			}
			 
			arr.push({
				pidx:pidx,
			});
			if(arr.length > 5){
				arr.splice(0,(json_list.length-5)); 
			}
			localStorage.setItem('recent_show_product', JSON.stringify(arr));
		}
		
		
	});
</script>

	<div class="wrap">
		<div class="wrap-content">
			<div class="product-content">
				<div class="info-content">
					<div class="sumnail_img">
						<img src="${pageContext.request.contextPath}/resources/images/Department_sumnail/${pdto.pSumnail}">
					</div>
					<div class="product_info">
						<div class="product_review">
							<span class="star">${pdto.pRating }</span>
							<a href="#review">${rdto.size()}개 리뷰보기</a>
						</div>
						<div class="product_pname">
							<strong>
								${pdto.pName }
							</strong>
						</div>
						<div class="order_price">
							${pdto.pOrder_price}원 ~
						</div>
					</div>
				</div>
				<script type="text/javascript">
					$().ready(function(){
						$('.pDetail_btn').click(function(){
							var datas = $(this).data('value');
							var height = $(document).scrollTop();
							$('html,body').animate({
								scrollTop:$(datas).offset().top-180
							},500);
						});
						$(window).scroll(function(){
							var offsetY = $(document).scrollTop();
							var targetY = $('#tabDetail').offset().top-180;
							
							if(offsetY >= $('.product-content').offset().top-180){
								$('.option-menu').addClass('fixed');
							}else {
								$('.option-menu').removeClass('fixed');
							}
							
							if(offsetY >= $('#tabDetail').offset().top-180 ){
								if($('.pDetail').data('value')=='none'){
									$('.pDetail').addClass('fixed');
									$('.pDetail').data('value','fixed');
									
								}
							}else {
								if($('.pDetail').data('value')=='fixed'){
									$('.pDetail').removeClass('fixed');
									$('.pDetail').data('value','none');
									
								}
							}
							var sellerTargetY=$('.seller-info').offset().top;
							if(offsetY >(sellerTargetY-500)){
								$('.option-menu.fixed').addClass('op_fix');
							}else if(offsetY <(sellerTargetY-500)){
								$('.option-menu.fixed').removeClass('op_fix');
							}
							
							var product_info =$('#products_info').offset().top;
							var review =$('#review').offset().top;
							var seller_info =$('.seller-info').offset().top;

							if(offsetY <= (review-200)){
								$('.pDetail_btn').css({'background':'lightgray','color':'black'});
								$('.pDetail_btn.b1').css({'background':'red','color':'white'});
							} else if(offsetY >= (review-200) && offsetY <(seller_info-200) ){
								$('.pDetail_btn').css({'background':'lightgray','color':'black'});
								$('.pDetail_btn.b2').css({'background':'red','color':'white'});
							} else if(offsetY >=(seller_info-200)){
								$('.pDetail_btn').css({'background':'lightgray','color':'black'});
								$('.pDetail_btn.b3').css({'background':'red','color':'white'});
							}
							
						});
					});
				
					
				</script>
				<div class="tabDetail" id="tabDetail">
					<ul class="pDetail" data-value="none">
						<li>
							<button class="pDetail_btn b1" id="pDetail_btn" data-value="#products_info">상품 정보</button>
						</li>
						<li>
							<button class="pDetail_btn b2" id="pDetail_btn" data-value="#review">상품 리뷰</button>
						</li>
						<li>
							<button class="pDetail_btn b3" id="pDetail_btn" data-value=".seller-info">판매자 정보</button>
						</li>

					</ul>
					<div class="products_info" id="products_info">
						<table class="info_table">
							<colgroup>
								<col style="width:18%">
								<col style="width:32%">
								<col style="width:18%">
								<col style="width:32%">
							</colgroup>
							<tbody>
								<tr>
									<td>상품상태</td>
									<td>새상품</td>
									<td>상품번호</td>
									<td>${pdto.pIdx }</td>
								</tr>
								<tr>
									<td>배송방법</td>
									<td>택배</td>
									<td>배송가능지역</td>
									<td>전국</td>
								</tr>
								<tr>
									<td>제조일자/유효기간</td>
									<td>판매자에게 문의</td>
									<td>원산지</td>
									<td>상품상세참고</td>
								</tr>
								<tr>
									<td>A/S안내</td>
									<td colspan="3">${deptdto.dName} ${deptdto.dPhone }</td>
								</tr>
							</tbody>
						</table>
						
						<div class="notice_img">
							<c:set var="notice_img" value="${pndto.pNimg }"/>
							<c:forEach var="pn_img" items="${fn:split(notice_img,',')}" varStatus="i">
								<div class="imgs">
									<img src="${pageContext.request.contextPath}/resources/images/Department_notice/${pn_img}">
								</div>
							</c:forEach>
						</div>
						<div class="product_img">
							<c:set var="product_img" value="${pndto.pImg}"/>
							<c:forEach var="pimg" items="${fn:split(product_img,',')}">
								<div class="imgs">
									<img src="${pageContext.request.contextPath}/resources/images/Department_product_img/${pimg}">
								</div>
							</c:forEach>
						</div>
					</div>
					<div class="review" id="review" >
						<div class="review_title">
							<div class="review_rating">
								${pdto.pRating} / 
								<span class="star">${pdto.pRating}</span>  /${rdto.size()}리뷰 개수
								<script type="text/javascript">
									$().ready(function(){
										var length =0;
										var data = ${pdto.pRating}*20;
										if(data <20){
											length =10;	
										} else if (data <30){
											length =20;
										} else if (data <40){
											length =30;
										} else if (data <50){
											length =40;
										} else if (data <60){
											length =50;
										} else if (data <70){
											length =60;
										} else if (data <80){
											length =70;
										} else if (data <90){
											length =80;
										} else if (data <100){
											length =90;
										}
										$('.star').addClass('count_'+length);
										
									});
								</script>
								
							</div>
							<div class="review_reating_persent">
								리뷰 퍼센테이지 
							</div>
						</div>
						<div class="review_Content">
							<div class="review_Content_title">
								<span class="span_bold">
									전체리뷰
								</span>
								${rdto.size() }건
							</div>
							<div class="review_content_list">
								<ul class="review_list">
									<c:if test="${rdto.size() ne 0  }">
										<c:forEach var="rlist" items="${rdto }">
											<li>
												<div class="review_detail">
													<div class="review_writer">
														<div class="writer">
															작성자:${rlist.rWriter}
														</div>
														<div class="write_date">
															${rlist.rWrite_date}
														</div>
													</div>
													<div class="review_rating">
														${rlist.rAting }
													</div>
													<div class="buy_options">
														<span class="option_font">
														
															<c:forEach var="options" items="${bodto }" varStatus="i">
																<c:if test="${options.bIdx eq rlist.bIdx }">
																	 <span class="option_font_blue">옵션${i.count}</span> : ${options.bOname } 
																</c:if>
															</c:forEach>
														</span>
													</div>
													
													<div class="review_contents">
														<p>${rlist.rContent }</p>
													</div>
												</div>
												
											</li>											
										</c:forEach>
									</c:if>
								</ul>
								<div class="reivew_list_more">
									<a href="">리뷰 더보기</a>
								</div>
							</div>
						</div>
						<div class="seller-info">
							<div class="resend_title">
								반품 / 교환 정보
							</div>
							<table>
								<tr>
									<td>판매자명</td>
									<td>${deptdto.dName }</td>
								</tr>
								<tr>
									<td>연락처</td>
									<td>${deptdto.dPhone}</td>
								</tr>
								<tr>
									<td>고객문의 가능시간</td>
									<td>09시~18시(공휴일 제외)</td>
								</tr>
								<tr>
									<td>반품 / 교환지 주소</td>
									<td>${fn:replace(deptdto.dAddress,'/',' ') }</td>
								</tr>
								<tr>
									<td>반품 / 교환안내</td>
									<td>${deptdto.dName} ${deptdto.dPhone }</td>
								</tr>
								<tr>
									<td>반품 / 교환기준</td>
									<td>
										상품 수령 후 7일 이내에 신청하실 수 있습니다. 단, 제품이 표시광고 내용과 다르거나 불량 등 계약과 다르게 이행된 경우는<br>
										제품 수령일부터 3개월 이내, 그 사실을 안 날 또는 알 수 있었던 날부터 30일이내에 교환/반품이 가능합니다
										<ul>
											<li>
												추가적으로 다음의 경우 해당하는 반품/교환은 신청이 불가능할 수 있습니다.
												<ul>
													<li>-소비자의 책임 있는 사유로 상품 등이 멸실 또는 훼손된 경우 (단지, 상품 확인을 위한 포장 훼손 제외)</li>
													<li>-소비자의 사용 또는 소비에 의해 상품 등의 가치가 현저히 감소한 경우</li>
													<li>-시간의 경과에 의해 재판매가 곤란할 정도로 상품 등의 가치가 현저히 감소한 경우</li>
													<li>-복제가 가능한 상품 등의 포장을 훼손한 경우</li>
													<li>-소비자의 주문에 따라 개별적으로 생산되는 상품이 제작에 들어간 경우</li>
												</ul>
											</li>
										</ul>
									</td>
								</tr>
							</table>
						</div>
						<div class="seller">
							<div class="seller-title">
								판매자정보
							</div>
							<table>
								<tr>
									<td>판매자</td>
									<td>${deptdto.dName}</td>
									<td>대표번호</td>
									<td>${deptdto.dPhone}</td>
								</tr>
								<tr>
									<td>사업자등록번호</td>
									<td>${deptdto.dSaup_no}</td>
									<td>가입일</td>
									<td>${deptdto.dReg_date }</td>
								</tr>
								<tr>
									<td>영업 소재지</td>
									<td colspan="3">${fn:replace(deptdto.dAddress,'/',' ') }
								</tr>
							</table>
						</div>
					</div>
				</div>
			</div>
			<div class="option-menu">
				<div class="option_menu_inner">
					<ul class="product_buy_list" id="buyList">
						<li>
							<div class="option op1" data-value="disable">
								<div class="first_option" >
								
									<a >
										<span class="span_bold op1">옵션명 1</span>
										<!-- 
											<i class="fas fa-chevron-up"></i> 접는 표시 
											<i class="fas fa-chevron-down"></i> 펼치는 표시 
										 -->
										<i class="fas fa-chevron-down fa-2x"></i>
									</a>
								</div>
								<div class="first_option_list" >
									<ul>
										<c:forEach var="op1" items="${podto}" varStatus="i">
											<li class="op1_li" data-value="${op1.poidx}" data-id="${i.count}">
												<div class="op1_name">
													상품명 :<span class="pName">${op1.poname}</span>
												</div>
												<div class="price">
													평균가격 :
													<span class="op1_price">
														${op1.poprice}
													</span>원
												</div>
											</li>
										</c:forEach>
									</ul>
									
								</div>
							</div>
							<script type="text/javascript">
								$().ready(function(){
									$('.option.op1').click(function(){
										if(!$('.first_option_list').hasClass('active')){
											$(this).addClass('active');
											$('.first_option_list').addClass('active');
											if($('.second_option_list').addClass('active')){
												$('.second_option_list').removeClass('active');
											}
										} else {
											$(this).removeClass('active');
											$('.first_option_list').removeClass('active');
																						
										}
									});
									$('.op1_li').click(function(){
										var data_num = $(this).data('id');
										$('.span_bold.op1').text($('.op1_li:nth-child('+data_num+') .op1_name .pName').text());
										
										var poidx =$(this).data('value');
										var pidx= ${pdto.pIdx};
										$.ajax({
											url:'${pageContext.request.contextPath}/product/getOption2',
											data:'poidx='+poidx+'&pidx='+pidx,
											type:'post',
											success:function(data){

												var json_data =  JSON.stringify(data);
												console.log(json_data);
												var html ='';
												var obj = JSON.parse(json_data);												
												for(var i =0; i<obj.length; i++){
													html +='<li class="op2_li" data-value="'+obj[i].poidx+'" data-id="'+(i+1)+'">';
													html +='<div class="op2_name">';
													html +='상품명 :<span class="pName">'+obj[i].poname+'</span>';
													html +='</div>';
													html +='<div class="price">';
													html +='가격 :<span class="op2_price">';
													html +=obj[i].poprice;
													html +='</span>원</div></li>';
												}
												$('.from_ajax_op2 li').remove();
												$('.from_ajax_op2').append(html);
												$('.second_option_list').addClass('active');
												$('.option.op2').addClass('active');
												if(!$('.second_option').hasClass('active')){
													
													$('.second_option').addClass('active');
												}
											},error:function(){
												alert('통신 실패');
											}
										});
										
									});
									 
									
								});
							</script>
							
							
							<div class="option op2" >
								<div class="second_option" data-value="disable">
									<a >
										<span class="span_bold">옵션명 2</span>
										<i class="fas fa-chevron-down fa-2x"></i>
									</a>
								</div>
								<div class="second_option_list">
									<ul class="from_ajax_op2">
										
									</ul>
								</div>
								<script type="text/javascript">
									$().ready(function(){
										var reg= "oninput="+"this.value=this.value.replace(/[^0-9.]/g,'').replace(/(\..*)\./g,'$1');";
										var option_arr = new Array();
										$(document).on('click','.option.op2.active .second_option',function(){
											if($('.second_option_list').hasClass('active')){
												$('.second_option_list').removeClass('active');
												$('.second_option').removeClass('active');
											} else {
												$('.second_option_list').addClass('active');
												$('.second_option').addClass('active');
											}
										});
										$(document).on('click','.op2_li',function(){
											var index = $(this).data('id');
											var poidx =$(this).data('value');
											var poname =$('.op2_li:nth-child('+index+') .op2_name .pName').text();
											var poprice =$('.op2_li:nth-child('+index+') .op2_price').text();
											var topponame=$('.span_bold.op1').text();
											if(option_arr.length ==0){
												var option_obj =new Object();
												option_obj.poidx =poidx;
												option_obj.topponame =topponame;
												option_obj.poname =poname;
												option_obj.poprice =poprice
												option_obj.count =1;
												option_arr.push(option_obj);
											} else {
												var cot =0;
												for(var i=0; i<option_arr.length; i++){
													if(option_arr[i].poidx ==poidx){
														var option_obj =option_arr[i];
														option_obj.count +=1;
														cot++;
														break;
													} 
												}
												if(cot ==0){
													var option_obj =new Object();
													option_obj.poidx =poidx;
													option_obj.poname =poname;
													option_obj.topponame =topponame;
													option_obj.poprice =poprice
													option_obj.count =1;
													option_arr.push(option_obj);
												}
											}
											$('.option_buy_list ul li').remove();
											var cart_list ='';
											
											var total_count =option_arr.length;
											var total_price =0;
											for( var i=0; i<option_arr.length; i++){
												
												total_price += (option_arr[i].poprice) *option_arr[i].count; 
												console.log(total_price);
												cart_list+='<li data-value="'+option_arr[i].poidx+'">';
												cart_list+='<div class="cart">';
												cart_list+='<div class="option_name">';
												cart_list+='<div class="poname">';
												cart_list+=option_arr[i].topponame+' / '+option_arr[i].poname+'</div>';
												cart_list+='<div class="delete">';
												cart_list +='<input type="button" class="delete_cart" value="X" data-value="'+option_arr[i].poidx+'" data-id='+i+'>';
												cart_list+='</div></div>';
												cart_list+='<div class="count">';
												cart_list+='<input type="text" id="opcount" readonly value="'+option_arr[i].count+'"'+reg+'>';
																								
												cart_list+='<div class="count_btn">';
												cart_list+='<input type="button" class="opcount_down" value="-" data-id="'+i+'">';
												cart_list+='<input type="button" class="opcount_up" value="+" data-id="'+i+'">';
												cart_list +='</div>';
												cart_list +='<div class="poprice">';
												cart_list +='<span class="price">';
												cart_list +=option_arr[i].poprice;
												cart_list +='</span>원'
												cart_list +='</div>';
												cart_list+='</div></div></li>';
											}
											
											var tot_price= total_price+'';
											var point =tot_price.length %3;
											var str =tot_price.substring(0,point);
																					
											while(point <tot_price.length){
												if( str !=''){
													str +=',';
												}
												str +=tot_price.substring(point, point+3);
												point+=3;
											}
																						
											$('.totalcount').text(total_count);
											$('.totalprice').text(str);
											$('.span_bold.op1').text('옵션명 1');
											$('.option_buy_list ul').append(cart_list);
											$('.option-menu div').removeClass('active');
											
										});
										$(document).on('click','.delete_cart',function(){
											var data =$(this).data('value');
											var id =$(this).data('id');
											option_arr.splice(id,1);
											$('.option_buy_list ul li:nth-child('+(id+1)+')').remove();
										});
										$(document).on('click','.opcount_down',function(){
											var id =$(this).data('id');
											var data_val =$(this).data('value');
											if( $('.option_buy_list ul li:nth-child('+(id+1)+') #opcount').val() >1 ){
												$('.option_buy_list ul li:nth-child('+(id+1)+') #opcount').val($('.option_buy_list ul li:nth-child('+(id+1)+') #opcount').val()-1);
												var total_price =0;
												for(var i =0; i<option_arr.length; i++){
													var option_obj =option_arr[i];
													if(i ==id*1){
														option_obj.count -=1;
													}
													total_price  += option_obj.poprice * option_obj.count;
												}
												console.log(option_arr);
												var tot_price= total_price+'';
												var point =tot_price.length %3;
												var str =tot_price.substring(0,point);
																						
												while(point <tot_price.length){
													if( str !=''){
														str +=',';
													}
													str +=tot_price.substring(point, point+3);
													point+=3;
												}
												
												$('.totalprice').text(str);
												
												var aa = option_arr[id];
												var price = aa.poprice;
												var count = aa.count;
												var total = price *count
												
												tot_price= total+'';
												point =tot_price.length %3;
												str =tot_price.substring(0,point);
												while(point <tot_price.length){
													if( str !=''){
														str +=',';
													}
													str +=tot_price.substring(point, point+3);
													point+=3;
												}
												
												$('.option_buy_list ul li:nth-child('+(id+1)+') .price').text(str);
												
											}
										});
										$(document).on('click','.opcount_up',function(){
											var id =$(this).data('id');
											var data_val =$(this).data('value');
											$('.option_buy_list ul li:nth-child('+(id+1)+') #opcount').val(($('.option_buy_list ul li:nth-child('+(id+1)+') #opcount').val())*1+1);
											var total_price =0;
											for(var i =0; i<option_arr.length; i++){
												var option_obj =option_arr[i];
												if(i ==id*1){
													option_obj.count +=1;
												}
												total_price += option_obj.poprice *option_obj.count;
											}
											var tot_price= total_price+'';
											var point =tot_price.length %3;
											var str =tot_price.substring(0,point);
																					
											while(point <tot_price.length){
												if( str !=''){
													str +=',';
												}
												str +=tot_price.substring(point, point+3);
												point+=3;
											}
											
											$('.totalprice').text(str);
											var aa = option_arr[id];
											var price = aa.poprice;
											var count = aa.count;
											var total =price * count;
											
											tot_price= total+'';
											point =tot_price.length %3;
											str =tot_price.substring(0,point);
											while(point <tot_price.length){
												if( str !=''){
													str +=',';
												}
												str +=tot_price.substring(point, point+3);
												point+=3;
											}
											
											$('.option_buy_list ul li:nth-child('+(id+1)+') .price').text(str);

											
										});
										
										$('.btn_controll input[type=button]').click(function(){
											var data_remote = $(this).data('remote');
											
											var fm =$('#fm');
											fm.attr('action','${pageContext.request.contextPath}/product/'+data_remote);
											$('#selected_option').val(JSON.stringify(option_arr)); 
											
											if(${not empty sessionScope}){
												if(${sessionScope.buysell eq 'sell'} && ${sessionScope.idx eq pdto.dIdx} ){ 
													alert('자기 물건은 구매하실수없습니다.');
												} else {
													if(option_arr.length >0){

														fm.submit();
														
													} else {
														alert('옵션을 선택해주세요');
													}
												}
											} else {
												var status = "toolbar=no,directories=no,scrollbars=no,resizable=no,status=no,menubar=no,width=750, height=700, top=0,left=20"; 
												window.open('${pageContext.request.contextPath}/product/buy/login?type='+data_remote,'로그인',status);
												
											}
											
										});
										
									});
									
								</script>
								
							</div>
							
						</li>
					</ul>
					
				</div>
				<div class="option_buy_list">
					<ul></ul>					
				</div>
							
				<div class="buy-btn">
					<div class="total">
						<div class="total_count">
							<strong class="red_color">
								 총 <span class="totalcount">0</span> 개
							</strong>
						</div>
						<div class="total_price">
							<strong class="red_color sizeup">
									<span class="totalprice">0</span> 원
							</strong>
						</div>
					</div>
					<div class="btn_controll">
						<form method="post" id="fm" >
							<input type="hidden" id="selected_option" name="selected_option">
							<input type="hidden" id="pIdx" name="pIdx" value="${pdto.pIdx }">
							<input type="button" id="insertcart" value="장바구니" data-remote="insert_cart">
							<input type="hidden" id="dIdx" value=${pdto.dIdx }>
							<input type="button" id="buyItme" value="구매하기" data-remote ="buy">
						</form>
					</div>
					
				</div>
			</div>
		</div>
	</div>
	
<%@ include file="../Template/fotter.jsp"%>