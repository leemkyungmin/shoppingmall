<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰작성하기</title>
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

<!-- include summernote css/js-->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
<script src="${pageContext.request.contextPath}/resources/assets/js/rating.js"></script>

<script type="text/javascript">
	function mark(star) {
		$('#star').val(star);
	}
	$().ready(function(){
		$('#contents').summernote({
			height : 500,
			callbacks: {
				onImageUpload: function(files, editor, welEditable) {
		            for (var i = files.length - 1; i >= 0; i--) {
		            	sendFile(files[i], this);
		            }
				}
			}
		});
		$('#star_grade a').click(function(){
            $(this).parent().children("a").removeClass("on"); /* 별점의 on 클래스 전부 제거 */ 
            $(this).addClass("on").prevAll("a").addClass("on"); /* 클릭한 별과, 그 앞 까지 별점에 on 클래스 추가 */
            return false;
        });
	});
	function sendFile(file, el) {
		var form_data = new FormData();
      	form_data.append('file', file);
      	$.ajax({
        	data: form_data,
        	type: "POST",
        	url: '${pageContext.request.contextPath}/my/insertReviewImg',
        	cache: false,
        	contentType: false,
        	enctype: 'multipart/form-data',
        	processData: false,
        	success: function(img_name) {
          		$(el).summernote('insertImage', '${pageContext.request.contextPath}/resources/images/reviewImg/'+img_name);
        	}
      	});
	}
	
</script>
<style>
	.wrap{
		width: 1000px;
		margin: 50px auto;
	}
	#title{
		width: 100%;
		height: 40px
	}
	#star_grade a{
		display: inline-block;
		font-size: 32px;
       	text-decoration: none;
    	color: gray;
    	width: 32px;
    	cursor: pointer;
	}
	#star_grade a.on{
		color: red;
	}
</style>
</head>
<body>
	<div class="wrap">
		<div class="wrap_content">
			<form id="fm" action="${pageContext.request.contextPath}/my/insertReview" method="post">
				<div class="rate">
					<p id="star_grade">
				        <a onclick="mark(1)">★</a>
				        <a onclick="mark(2)">★</a>
				        <a onclick="mark(3)">★</a>
				        <a onclick="mark(4)">★</a>
				        <a onclick="mark(5)">★</a>
					</p>
					<input id="star" type="hidden" name="point"/>
				</div>
				
				<textarea name="contents" id="contents"></textarea>
				<input type="hidden" name="bidx" id="bidx" value="${bidx }">
				<input type="button" name="submit_btn" id="submit_btn" value="작성하기">
				<input type="button" name="cancel_btn" id="cancel_btn" value="취소">
			</form>
		</div>
	</div>
	<script type="text/javascript">
		$().ready(function(){
			$('#submit_btn').click(function(){
				var point= $('#star');
				
				var content  =$('#contents');
				if(content.val() ==''){
					alert('내용을 입력해주세요');
					content.focus();
				} else if(point.val() ==null || point.val() ==''){
					alert('별점을 입력해주세요');
				} else {
					$('#fm').submit();
				}
				
				
			});
		});
	</script>
</body>
</html>