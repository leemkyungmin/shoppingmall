<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>배너 보기</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
	.wrap{
		margin: 30px;
	}
	.info{
		width: 100%;
	}
	input[type=text],input[type=date]{
		width: 200px;
	}
	input{
		margin: 5px;
	}
</style>
<script type="text/javascript">
	$().ready(function(){
		$('#img').change(function(){
			var fm = new FormData();
			fm.append('file',$('#img')[0].files[0]);
			$.ajax({
				url:'${pageContext.request.contextPath}/admin/change_bannerImg',
				type:'post',
				data:fm,
				enctype: 'multipart/form-data',
				processData: false,
				contentType: false,
				success:function(data){
					$('#bFilename').val(data);
					$('#bannerImg').prop('src','${pageContext.request.contextPath}/resources/assets/images/bannerImg/'+data);
					
				},error:function(){
					console.log('error');
				}
			});
			
		});
	});
</script>
</head>
<body>

	<div class="wrap">
		<div class="content">
			<div class="info">
				<form name="frm" method="post" enctype="multipart/form-data">
					<table>
						<tr>
							<td>업체명</td>
							<td>
								<input type="text" name="bdeptname" id="bdeptname" value="${bdto.BDEPTNAME}">
							</td>
						</tr>
						<tr>
							<td>담당자</td>
							<td><input type="text" name="bmanager" id="bmanager" value="${bdto.bManager}"></td>
						</tr>
						<tr>
							<td>연락처</td>
							<td><input type="text" name="bmanager_number" id="bmanager_number" value="${bdto.bManager_number}" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"></td>
						</tr>
						<tr>
							<td>종료일</td>
							<td>
								<input type="date" name="bdate" id="bdate" value="${bdto.BDATE}" style="color:black">
							</td>
						</tr>
						<tr>
							<td>이미지</td>
							<td><input type="file" name="img" id="img" accept="image/*"> 
						</tr>
						<tr>
							<td colspan="2">
								<input type="button" name="submit_btn" id="submit_btn" value="수정하기">
								<input type="button" name="cancel_btn" id="cancel_btn" value="취소/닫기">
								<input type="button" name="delete_btn" id="delete_btn" value="삭제">
							</td>
						</tr>
					</table>
					<input type="hidden" value="${bdto.bidx }" name="bidx" id="bidx">
					<input type="hidden" value="${bdto.bFilename }" name="bFilename" id="bFilename">
				</form>
				<div class="return_img">
					<img id="bannerImg" src="${pageContext.request.contextPath }/resources/assets/images/bannerImg/${bdto.bFilename}">
				</div>
			</div>
			<script type="text/javascript">
				$().ready(function(){
					
					$('#submit_btn').click(function(){
						var bdeptname = $('#bdeptname').val().trim();
						var bmanager =$('#bmanager').val().trim();
						var bmanager_number = $('#bmanager_number').val().trim();
						var bdate = $('#bdate').val();
						var bidx = $('#bidx').val();
						var bFilename =$('#bFilename').val();
						if(bdeptname ==''){
							 alert('업체명이 빈칸입니다');
							 
						} else if(bmanager ==''){
							alert('담당자를 입력해주세요');
						} else if( bmanager_number ==''){
							alert('담당자 번호를 입력해주세요');
						}  else {
							$.ajax({
								url:'${pageContext.request.contextPath }/admin/update_banner',
								type:'post',
								data :'bidx='+bidx+'&bdeptname='+bdeptname+'&bmanager='+bmanager+'&bmanager_number='+bmanager_number+'&bdate='+bdate+'&bFilename='+bFilename,
								success:function(data){
									if(data==1){
										alert('수정완료');
									}
								}, error:function(){
									console.log('error');
								}
							});
						}
						
					});
					
					$('#cancel_btn').click(function(){
						window.close();
					});
					
					$('#delete_btn').click(function(){
						if(confirm('정말 삭제하시겠습니까?')){
							$.ajax({
								url:'${pageContext.request.contextPath}/admin/DeleteBanner',
								type:'post',
								data:'bidx='+$('#bidx').val(),
								success:function(data){
									if(data >0){
										alert('해당 배너 삭제되었습니다.');
										window.close();
									}
								},error:function(){
									console.log('error');
								}
							});
						}
						
					});
					
				});
			</script>
		</div>
	</div>

</body>
</html>