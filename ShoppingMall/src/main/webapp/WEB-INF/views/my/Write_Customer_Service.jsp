<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

<!-- include summernote css/js-->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
<script type="text/javascript">
	$().ready(function(){
		$('#summernote').summernote({
			height : 700,
			callbacks: {
				onImageUpload: function(files, editor, welEditable) {
		            for (var i = files.length - 1; i >= 0; i--) {
		            	sendFile(files[i], this);
		            }
				}
			}
		});
		function sendFile(file, el) {
			var form_data = new FormData();
	      	form_data.append('file', file);
	      	$.ajax({
	        	data: form_data,
	        	type: "POST",
	        	url: '${pageContext.request.contextPath}/my/profileImage',
	        	cache: false,
	        	contentType: false,
	        	enctype: 'multipart/form-data',
	        	processData: false,
	        	success: function(img_name) {
	          		$(el).summernote('insertImage', '${pageContext.request.contextPath}/resources/images/summernote/'+img_name);
	        	}
	      	});
		}
	});
</script>
<meta charset="UTF-8">

<title>고객센터 글작성</title>

<style type="text/css">
	.wrap{
		width: 1000px;
		margin: 0 auto;
	}
	.customer_title{
		border-bottom: 1px solid gray;
		margin-bottom: 40px;
	}
	.title {
		margin-bottom: 40px;
	}
	.title label{
		width: 100px;
		font-size: 15px;
	}
	.title .ctype select{
		width: 200px;
		text-align: center;
	} 
	.title .cTitle input[type="text"] {
		width: 500px;
	}
	.title div {
		margin: 10px 0;
	}
	.note-editing-area {
		height: 500px;
	}
	.form-btn {
		width: 100%;
		text-align: center;
	}
	.form-btn input[type=button]{
		width: 200px;
		height: 50px;
		margin-left: 10px;
	}
</style>
<script type="text/javascript">
	$().ready(function(){
		$('#submit-btn').click(function(){
			var cTitle = $('#cTitle');
			var cContent = $('#summernote');
			var cType =$('#cType');
			if(cTitle.val() ==''){
				alert('상담 제목을 입력해주세요');
				cTitle.focus();
			} else if (cContent.val() ==''){
				alert('상담 내용을 입력해주세요');
				cContent.focus();
			} else {
				$.ajax({
					url:'${pageContext.request.contextPath}/my/upload_customer_svc',
					data:'cTitle='+cTitle.val() +'&cContent='+cContent.val() +'&cType='+cType.val(),
					type :'post',
					success:function(data){
						if(data =='1'){
							alert('상담글 작성완료');
							location.href="${pageContext.request.contextPath}/my/CustomerService";
						} else {
							alert('상담글 작성 실패.');
							history.go(-1);
						}
					}, error:function(){
						alert('통신 실패');
					}
				});
			}
			
		});
		$('#cancel-btn').click(function(){
			history.go(-1);
		});
	});
</script>
</head>
<body>
	<form action="WriteCustomer" method="post">
		<div class="wrap">
			<div class="customer_title">
				<h2>고객센터 글작성</h2>
			</div>
			<div class="title">
				<div class="ctype">
					<label>문의 타입</label>
					<select id="cType">
						<option value="1">상품문의</option>
						<option value="2">구매문의</option>
						<option value="3">판매문의</option>
						<option value="4">광고문의</option>
					</select>
				</div>
				<div class="cTitle">
					<label>제목</label>
					<input type="text" id="cTitle" name="cTitle">
				</div>
				
			</div>
			
			<div class="content">
				<textarea id="summernote"></textarea>
			</div>
			
			<div class="form-btn">
				<input type="button" id="submit-btn" name="submit-btn" value="상담글 작성">
				<input type="button" id="cancel-btn" name="cancel-btn" value="취소">
			</div>
		</div>
	
	</form>
	
</body>
</html>