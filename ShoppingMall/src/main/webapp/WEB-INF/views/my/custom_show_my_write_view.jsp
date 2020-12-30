<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	        		alert(img_name);
	          		$(el).summernote('insertImage', '${pageContext.request.contextPath}/resources/images/summernote/'+img_name);
	        	}
	      	});
		}
		$('#update').click(function(){
			var cType = $('#cType');
			var cTitle =$('#cTitle');
			var cContent =$('#summernote');
			var cIdx = ${csdto.cIdx};
			$.ajax({
				url:"${pageContext.request.contextPath}/my/update_custom_svc",
				type :'post',	
				data :'cType='+cType.val() +'&cTitle='+cTitle.val()+'&cContent='+cContent.val() +'&cIdx='+cIdx,
				success : function(data){
					if(data ==1){
						alert('수정완료');
						history.go(0);
					} else {
						alert('답글이 달려 수정이 불가능합니다.');
						histroy.go(0);
					}
				}, error :function(){
					alert('통신 실패');
				}
				
			});
			
		});
		$('#close_btn').click(function(){
			window.close();
		});
	});
</script>
<style>
	.wrap{
		width: 1000px;
		margin: 30px auto;
	}
	.wrap .title{
		font-size: 20px;
		margin: 10px 0;
		padding:10px 0;
		border-bottom: 1px solid gray;
	}
	.wrap .title .title-ctype label{
		width: 80px;
	}
	.wrap .title .title-ctype #cType,#cTitle,.hit_count,.title-ctype{
		height: 29px;
		display:inline-block;
		
	}
	.wrap .title .title-ctype #cTitle{
		width: 600px;
	}
	.hit_count{
		float: right;
	}
	.content #summernote{
		height: 500px;
	}
	.wrap .btns{
		height: 40px;
	    margin: 10px auto;
	    text-align: right;
	    margin-bottom: 20px;
	}
	.wrap .user_svc form{
		border-bottom: 1px solid gray;
		margin-bottom: 20px;
	}
	.wrap .btns input[type=button]{
		width: 200px;
		height: 40px;
		margin-left: 20px;
	}
	
	.customer_svc_review {
		min-height: 500px;
		border:  1px solid black;
		font-size: 20px;
	}
	.customer_svc_review .admin_review_writer{
		padding: 10px;
		margin-bottom: 15px;
		border-bottom: 1px solid gray;
	}
	.admin_review_content{
		padding: 10px;
	}
	.user_svc{
		min-height: 500px;
		
	}
</style>
</head>
<body>
	<div class="wrap">
		<div class="user_svc">
			<form action="update_customer_svc" method="post">
				<div class="title">
					<div class="title-ctype">
						<label for="cTitle">제목</label>
						<select id="cType">
							<option value="1">상품문의</option>
							<option value="2">구매문의</option>
							<option value="3">판매문의</option>
							<option value="4">광고문의</option>
						</select>
						
						<input type="text" id="cTitle" name="cTitle" value=${csdto.cTitle }>
					</div>
					<div class="hit_count">
						<label>조회수 : ${csdto.cHit }</label>
					</div>
					<div class="wirte_date">
						<label>작성일 : </label>
					</div>
							
				</div>
				<div class="content">
					<textarea id="summernote">${csdto.cContent }</textarea>
				</div>
				<div class="btns">
					<c:if test="${csdto.cStatus eq 0 }">
						<input type="button" id="update" value="수정하기">
					</c:if>
					<input type="button" id="close_btn" value="닫기">
				</div>
			</form>
		</div>
		<c:if test="${csrdto ne null }">
			<div class="customer_svc_review">
				<div class="admin_review_writer">
					<div class="writer">
						<label>작성자:관리자</label>
					</div>
					<div class="write_date">
						<label>작성일:</label>
					</div>
				</div>
				
				<div class="admin_review_content">
					가나다라마바사 아자차카파타하 도레미파솔라시도레미파솔라시도레미
					도레미파솔라시도 레미파솔라시도레미 
				</div>
			</div>
		</c:if>
		
	</div>
</body>
</html>