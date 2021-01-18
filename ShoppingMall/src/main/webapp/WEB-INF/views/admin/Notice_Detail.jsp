<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
	.content{
		margin: 10px 30px;
		height: 100%;
	}
	 .title_bar{
		position: relative;
		padding: 30px;
		border-bottom: 1px solid black;
	}
	
	.title_bar label{
		width: 80px;
	}
	.title{
		display:inline-block;
		position:absolute;
		left: 0;
		top: 15px;
		
	}
	.content label{
		display:inline-block;
		width: 80px;
		border-right: 1px solid black;
		
	}
	.content span{
		padding-left: 20px;
	}
	
	.write_date{
		display: inline-block;
		position:absolute;
		right: 200px;
		top: 15px;
	}
	
	.body-content{
		width: 100%;
		min-height: 500px;
		border: 1px solid gray;
		margin: 20px auto;
	}
	.btn{
		margin:10px;
		position: absolute;
		bottom: 0;
		right: 30px; 
	}
	#close_btn{
		border:0;
		width: 80px;
		height:30px;
		background: red;
		color: white;
		font-size: 15px;
	}
</style>
<script type="text/javascript">
	$().ready(function(){
		$('#close_btn').click(function(){
			window.close();
		});
	});
</script>

</head>
<body>
	<div class="wrap">
		<div class="content">
			<div class="title_bar">
				<div class="title">
					<label >제목</label><span class="title_span">${an.aTitle }</span>
				</div>
				<div class="write_date">
					<label>작성일</label>
					<span class="areg_date">
						${an.aReg_date }
					</span>
				</div>
			</div>
			<div class="body-content">
				<p>${an.aContent }</p>
			</div>
		</div>
		<div class="btn">
			<input type="button" id="close_btn" value="닫기">
			
		</div>
	</div>
	
</body>
</html>