<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ include file="../Template/header.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/style/newProduct.css">
	<div class="wrap">
		<div class="wrap_content">
			<form id="fm" method="post" action="${pageContext.request.contextPath }/product/insertproduct" enctype="multipart/form-data">
			
				<div class="product_pname">
					<label for="pName"> 상품명</label>
					<input type="text" name="pName" id="pName" placeholder="상품명">
				</div>
				<div class="product_psumnail">
					<label for="pSumnail">상품 메인 이미지</label>
					<input type="file" name="pSumnail" id="pSumnail"  accept="image/jpeg,png">
				</div>
				<div class="product_sumnail">
					<img id="sumnail" src="">
				</div>
				<div class="product_notice">
					<label for="notice_img">공지사항 이미지(중복 등록가능)</label>
					<input type="file" id="notice_img" multiple="multiple">
				</div>
				<div class="product_notice_imgs">
					<ul class="notice_imgs"></ul>
				</div>
				<div class="product_info">
					<label for="info_img">상품 이미지</label>
					<input type="file" id="info_img" multiple="multiple">
				</div>
				<div class="product_info_img">
					<ul class="product_img">
					</ul>
				</div>
				<div class="product_info_table">
					<table>
						<tbody>
							<tr>
								<td><label for="price">상품 평균 가격</label></td>
								<td><input type="text" id="price" name="price" placeholder="숫자만 입력해주세요"></td>
							</tr>
							<tr>
								<td><label for="order_price">배송비</label></td>
								<td><input type="text" id="order_price" name="order_price" placeholder="숫자만 입력해주세요"></td>
							</tr>
						</tbody>
					</table>
				</div>
				<!-- 마지막 div data-value 값으로  add_option을 처리 ??  $('.option_list:last').data('value');-->
				
				<script type="text/javascript">
					function add_option(){
						var data = $('.option_list:last').data('value')+1;
						
						var html ='';
						html +='<div class="option_list" data-value='+data+'>';
						html +='<div class="left_option">';
						html +='<label>옵션 1</label>';
						html +='<input type="text" id="option1" name="option1" placeholder="종류 옵션">';						
						html +='</div>';
						html +='<div class="right_option">';
						html +='<div class="add_option2 op'+data+'">';
						html +='<label>옵션 2</label>';
						html +='<input type="button" id="add_option2_'+data+'" onclick="add_option2('+data+')" value="+">';
						html +='<input type="button"  onclick="remove_option2('+data+')" value="-">';
						html +='</div>';
						html +='<div class="option_list_add">';
						html +='<table class="this_option'+data+'"><thead><tr><td>옵션 명</td><td>가격</td></tr></thead>';
						html +='<tbody>';
						html +='<tr>';
						html +='<td><input type="text" id="option2_name'+data+'" name="option2_name'+data+'" placeholder="세부 옵션"></td>';
						html +='<td><input type="text" id="option2_price'+data+'" name="option2_price'+data+'" placeholder="가격"></td>';
						html +='</tr>';
						html +='</tbody></table>';
						html +='</div></div></div>';
					
						$('.product_option').append(html);
					}
					function remove_option(){
						var length =$('.option_list').length;
						if( length >1){
							$('.option_list:last').remove();
						}
						
					}
					function add_option2(data){
						var html ='';
						html +='<tr>';
						html +='<td><input type="text" id="option2_name'+data+'" name="option2_name'+data+'" placeholder="세부 옵션"></td>';
						html +='<td><input type="text" id="option2_price'+data+'" name="option2_price'+data+'" placeholder="가격"></td>';
						html +='</tr>';
						
						
						$('.this_option'+data).append(html);
					}
					function remove_option2(data){
						var length = $('.this_option'+data+' tbody tr').length;
						if(length >1){
							$('.this_option'+data+ ' tbody tr:last').remove();
						} else {
							alert('최소 1개의 옵션이 필요합니다.');
						}
					}
					//썸네일 사진 변경 이벤트 
					$('#pSumnail').change(function(){
						var fm = new FormData();
						fm.append('file',$('#pSumnail')[0].files[0]);
						$.ajax({
							url :'${pageContext.request.contextPath}/product/insertsumnail',
							type :'post',
							enctype: 'multipart/form-data',
							data :fm,
							processData: false,
							contentType: false,
							success:function(data){
								$('#sumNail').val(data);
								$('.product_sumnail').css({'display':'block'});
								$('#sumnail').attr('src','${pageContext.request.contextPath}/resources/images/Department_sumnail/'+data);
							},error :function(){
								alert('통신 실패');
							}
						});
					});	
					$('#notice_img').change(function(){
						var fm = new FormData();
						var files = $('#notice_img')[0].files;
						var i=0;
						for(i=0; i<files.length; i++){
							fm.append('files',files[i]);
							console.log(files[i]);
						}
						
						$.ajax({
							url:'${pageContext.request.contextPath}/product/productnoticeupload',
							enctype: 'multipart/form-data',
							data :fm,
							processData: false,
							contentType: false,
							type :'post',
							success :function(data){
								$('#pnoticeimg').val(data);
								var data_len = data.split(',');
								var i=0;
								var html ='';
								for( i=0; i<data_len.length; i++){
									html +='<li>';
									html +='<img src="${pageContext.request.contextPath}/resources/images/Department_notice/'+data_len[i]+'">'
									html +='</li>';
								}
								$('.notice_imgs').append(html);
								$('.product_notice_imgs').css({'display':'block'});
								
							}, error:function(){
								alert('통신 실패');
							}
						});
					});
					$('#info_img').change(function(){
						var fm = new FormData();
						var images = $(this)[0].files;
						var i = 0;
						for (i=0; i<images.length; i++){
							fm.append('files',images[i]);
						}
						
						$.ajax({
							url : '${pageContext.request.contextPath}/product/product_infoupload',
							data : fm,
							enctype :'multipart/form-data',
							processData: false,
							contentType: false,
							type :'post',
							success :function(data){
								$('#pimg').val(data);
								var image = data.split(',');
								var j =0;
								var html ='';
								for(j=0; j<image.length; j++){
									html +='<li>';
									html +='<img src="${pageContext.request.contextPath}/resources/images/Department_product_img/'+image[j]+'">';
									html +='</li>';
								}
								$('.product_img').append(html);
								$('.product_info_img').css({'display':'block'})
								
								
							},error:function(){
								alert('통신 실패');
							}
					
						});
					});
				</script>
				<div class="product_option">
					<div class="add_option" >
						<input type="button" id="option1_add" onclick="add_option()" value="종류 옵션 추가 ">
						<input type="button" id="option1_add" onclick="remove_option()" value="종류 옵션 삭제 ">
					</div>
					<div class="option_list" data-value=1>
						<div class="left_option">
							<label>옵션 1</label>
							<input type="text" id="option1" name="option1" placeholder="종류 옵션">
						</div>
						<div class="right_option">
							<div class="add_option2 op1">
								<label>옵션 2</label>
								<input type="button"  onclick="add_option2(1)" value="+">
								<input type="button"  onclick="remove_option2(1)" value="-">
							</div>
							<div class="option_list_add">
								<table class="this_option1" >
									<thead>
										<tr>
											<td>옵션 명</td>
											<td>가격</td>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td><input type="text" id="option2_name1" name="option2_name1" placeholder="세부 옵션"></td>
											<td><input type="text" id="option2_price1" name="option2_price1" placeholder="가격"></td>
										</tr>
									</tbody>
									
								</table>
								
							</div>
							
						</div>
					</div>
					
				</div>
				<div class="btn-controll">
					<input type="hidden" id="sumNail" name="sumNail">
					<input type="hidden" id="pnoticeimg" name="pnoticeimg">
					<input type="hidden" id="pimg" name="pimg">
					<input type="button" value="등록" id="btn_submit">
					<input type="button" value="취소" id="btn_cancel">
				</div>
			</form>
		</div>
	</div>
	<script>
		$().ready(function(){
			$('#btn_submit').click(function(){
				var title = $('#pName');
				var pSumnail =$('#pSumnail')[0].files;
				var notice_img =$('#notice_img')[0].files;
				var info_img =$('#info_img')[0].files;
				var price =$('#price');
				var order_price =$('#order_price');
				var form = $('#fm');
				if(title.val() ==''){
					alert('상품명을 입력해주세요');
					title.focus();
				} else if( pSumnail.length == 0){
					alert('메인 사진 등록해주세요');
				} else if(notice_img.length == 0){
					alert('공지사항 이미지를 입력해주세요');
				} else if(info_img.length == 0) {
					alert('상품 이미지를 입력해주세요');
				} else if(price.val() ==''){
					alert('가격을 입력해주세요');
					price.focus();
				} else if(order_price ==''){
					alert('배송비 를 입력해주세요');
					order_price.focus();
				} else {
					form.submit();
				}
				
			});
		});
	</script>

<%@ include file="../Template/fotter.jsp" %>