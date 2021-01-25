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
	
	document.onkeydown = function(e){
	    if(e.ctrlKey == true && (e.keyCode == 116 || e.keyCode==78 || e.keyCode == 82)){
	        e.cancelBubble = true; 
	        e.returnValue = false; 
	        setTimeout(function(){
	            window.location.reload();
	        }, 1000);
	        return false;
	    }
	}

	
	$().ready(function(){
		
		$(window).on("beforeunload", callback);
		 
		function callback(){
			var cstatus='${csdto.cStatus}';
			if(cstatus !='1'){
				cidx_callBack();
				
			}
		}
		 
		function off(){
		    $(window).off("beforeunload");
		}
		$('#summernote').summernote({
			height : 700
			
		});
		
		$('#answer_btn').click(function(){
			var answer =$('#answer');
			var cidx = $('#cidx').val();
			if(answer.val() ==''){
				alert('답글 내용을 입력해주세요');
				answer.focus();
			} else  {
				$.ajax({
					url:'${pageContext.request.contextPath}/admin/insert_customer_review',
					type :'post',	
					data :'cidx='+cidx+'&answer='+answer.val(),
					success : function(data){
						if(data ==1){
							off();
							if(confirm('답글 작성완료 목록으로 이동하기')){
								window.top.location.href='${pageContext.request.contextPath}/admin/Customer_service?cStatus='+${csdto.cStatus};
							} else{
								history.go(0);
							}
							
						} else {
							alert('수정실패');
							histroy.go(0);
						}
					}, error :function(){
						console.log('error');
					}
					
				});
			}
			
			
			
		});
		$('#close_btn').click(function(){
			
			if(confirm('답글 달기를 취소하시겠습니까?')){
				cidx_callBack();
			}
		});
	});
	
	function cidx_callBack(){
		var cidx=$('#cidx').val();
		$.ajax({
			url:'${pageContext.request.contextPath}/admin/customer_service_callback',
			data:'cidx='+cidx,
			type:'post',
			success:function(data){
				window.top.location.href='${pageContext.request.contextPath}/admin/Customer_service?cStatus=0';
			},error:function(){
				console.log('error');
			}
		});
	}
		
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
	.wrap .title .title-ctype #cType,#cTitle,.hit_count,.title-ctype,.ctitle{
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
	.summernote{
		margin: 30px 0;
		padding-bottom:20px;
		border-bottom: 1px solid black;
		width: 100%;
		height: 100%;
		font-size: 17px;
	}
	.csr_list{
		font-size: 20px;
		height: 400px;
		border:1px solid black;
	}
	.writer{
		display:inline-block;
		float: left;
	}
	.reg_date{
		display:inline-block;
		float: right;
		margin-right: 20px;
	}
	.answer_title{
		height: 50px;
    	border-bottom: 1px solid black;
    	line-height: 50px;
	}
	.content{
		margin:10px 0;
	}
	p{
		word-break:break-all;
	}
</style>
</head>
<body>
	<div class="wrap">
		<div class="user_svc">
		
				<div class="title">
					<div class="title-ctype">
						<label for="cTitle">제목</label>
						<c:if test="${csdto.cType  eq 1 }">
							[상품문의] 
						</c:if>
						<c:if test="${csdto.cType  eq 2 }">
							[구매문의] 
						</c:if>
						<c:if test="${csdto.cType  eq 3 }">
							[판매문의] 
						</c:if>
						<c:if test="${csdto.cType  eq 4 }">
							[광고문의] 
						</c:if>
						<p class="ctitle">
							${csdto.cTitle }
						</p>
						
					</div>
					
				
				</div>
				<div class="summernote">
					${csdto.cContent }
				</div>
				<form >
					<c:if test="${csrdto eq null }">
						<div class="admin_answer">
							<textarea name="answer" id="answer" style="width: 100%;height: 350px;resize: none;" placeholder="답변할 내용을 입력해주세요"></textarea>
						</div>
					</c:if>
					<c:if test="${csrdto ne null }">
						<div class="csr_list">
							<div class="answer_title">
								<div class="writer">
									작성자:${csrdto.cSrWriter}
								</div>
								<div class="reg_date">
									답변일:${csrdto.cSrwrite_date }
								</div>
							</div>
							<div class="content">
								<p>${csrdto.cSrcontent }</p>
							</div>
						</div>
					</c:if>
					
					<div class="btns">
						<input type="hidden" name="cidx" id="cidx" value=${csdto.cIdx }>
						<input type="button" id="answer_btn" value="답글달기" style="background-color: red; color:white;border:0;">

						<input type="button" id="close_btn" value="닫기">
					</div>
				</form>
		</div>
		
		
	</div>
</body>
</html>