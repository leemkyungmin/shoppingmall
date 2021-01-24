<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<head>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<style>
		body{
			overflow-x:hidden;
			overflow-y:hidden; 
		}
		.wrap{
			width: 800px;
			min-height: 800px;
		}
		.footer-wrap{
			position: absolute;
			bottom: 0;
			left:0;
		}
		table{
			border-collapse: collapse;
		}
		tr{
			height: 40px;
			border: 0;
		}
		td,th{
			text-align: center;
			border: 1px solid black;
			border-collapse: collapse;
		}
		td input[type=button]{
			height: 100%;
			width: 100%;
		}
		.wrap{
			min-height: 800px;
		}
	</style>
</head>
<body>
	<div class="wrap">
		<div class="wrap-content">
			<div class="DeptInfo">
				<h1>${exlist[0].en_Date } 일 자료 </h1>
			</div>
			<div class="table-content">
				<table>
					<thead>
						<tr>
							<th>날짜</th>
							<th>회차</th>
							<th>생성된 파일명</th>
							<th>송장번호 등록된 파일명</th>
							<th>파일 수정</th>
						</tr>
					</thead> 
					
					<tbody>
						<c:forEach var="ef" items="${exlist }" varStatus="i">
							<tr>
								<td>${ef.en_Date }</td>
								<td>${i.count }</td>
								<td><a href="${pageContext.request.contextPath}/resources/excelFiles/${ef.enFile_name}"> ${ef.enFile_name }	</a></td>
								<td>
									<c:if test="${ef.enFile_final eq null}">
										 '아직등록된 파일이없습니다'
									</c:if>
									<c:if test="${ef.enFile_final ne null}">
										<a href="${pageContext.request.contextPath}/resources/excelFiles/${ef.enFile_final}"> ${ef.enFile_final}</a>
									</c:if>
									
								</td>
								<td><input data-id="${ef.enIdx }" type="button" class="en_final" value="파일수정">
							</tr>
						</c:forEach>
					</tbody>

				</table>   
			</div>
		</div>
	</div>
	<form name="frm" action="${pageContext.request.contextPath}/Excel/uploadFinalFile" method="post" style="display:none;">
		<input type="file" id="final_file" accept="application/vnd.ms-excel,application/vnd.openxmlformats-officedocument.spreadsheetml.sheet,.csv,.cell,.xls">
		<input type="hidden" id="enidx">
	</form>
	<script>
		
		$().ready(function(){
			$('.en_final').click(function(){
				$('#enidx').val($(this).data('id'));
				if($(this).data('file')==null){
					$('#final_file').click();
				} else {
					if(confirm('등록된 파일이 있습니다. 새로운 파일을 등록하시겠습니까?')){
						$('#final_file').click();
					} else{
						return ;
					}
				}
			});
			$('#final_file').change(function(){
				var enidx =$('#enidx').val();
				var fm = new FormData();
				fm.append('enidx',enidx);
				fm.append('file',$('#final_file')[0].files[0]);
					
				$.ajax({
					url:'${pageContext.request.contextPath}/Excel/excel_final_updload',
					type :'post',
					enctype: 'multipart/form-data',
					data :fm,
					processData: false,
					contentType: false,
					async: false,
					succees:function(data){
												
					} ,error:function(){
						console.log('error');
					}
				});
				
				history.go(0);
			});
		
		});
		
		
	</script>
</body>