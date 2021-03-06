<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>새 팝업 추가 </title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>

	<div class="wrap">
		<div class="content">
			<div class="new_pop">
				<form  method="post" name="frm">
					<table>
						<tr>
							<td>팝업 이름</td>
							<td>
								<input type="text" name="popInfo" id="popInfo" placeholder="팝업 이름">
							</td>
						</tr>
						<tr>
							<td>팝업 링크</td>
							<td>
								<input type="text" name="popupUri" id="popupUri" placeholder="팝업 링크 없을시 입력안해도 됨">
							</td>
						</tr>
						<tr>
							<td>팝업 이미지 파일</td>
							<td>
								<input type="file" name="popupImg" id="popupImg" accept="image/*">
							</td>
						</tr>
						<tfoot>
							<tr>
								<td colspan="2">
									<input type="button" id="submit_btn" value="추가"> 
									<input type="button" id="cancel_btn" value="취소"> 
								</td>
							</tr>
						</tfoot>
							
					</table>
					
					<input type="hidden" id="popImg" name="popImg">
					
				</form>
				<div class="show_popImg">
					<img id="img">
				</div>
				
				<script type="text/javascript">
					$().ready(function(){
						
						$('#submit_btn').click(function(){
							var popInfo =$('#popInfo').val();
							var popImg = $('#popImg').val();
							var popupUri =$('#popupUri').val();
							if(popInfo ==''){
								alert('팝업 이름을 입력해주세요');
							} else if(popImg ==''){
								alert('팝업 이미지를 넣어주세요');
							} else {
								$.ajax({
									url:'${pageContext.request.contextPath}/admin/insertNewPopup',
									type:'post',
									data:'popInfo='+popInfo+'&popImg='+popImg+'&popupUri='+popupUri,
									success:function(data){
										opener.history.go(0);
										location.href='${pageContext.request.contextPath}/admin/popupDetail?popidx='+data;
									},error:function(){
										console.log('error');
									}
								});
							}
						});
						$('#cancel_btn').click(function(){
							window.close();
						});
						
						
						$('#popupImg').change(function(){
							var fm = new FormData();
							fm.append('file',$('#popupImg')[0].files[0]);
							$.ajax({
								url:'${pageContext.request.contextPath}/admin/Update_PopupImg',
								type:'post',
								data:fm,
								enctype: 'multipart/form-data',
								processData: false,
								contentType: false,
								success:function(data){
									$('#popImg').val(data);
									$('#img').prop('src','${pageContext.request.contextPath}/resources/assets/images/popupImg/'+data);
									
								},error:function(){
									console.log('error');
								}
							});
						});
					});
				</script>
			</div>
		</div>
	</div>
</body>
</html>