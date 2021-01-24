<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../Template/header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn"%>
	<c:set var="stDay" value="${stDay }"/>
	<c:set var="st_year" value="${fn:substringBefore(stDay,'-') }"/>
	<c:set var="st_month" value="${fn:substringBefore(fn:substringAfter(stDay,'-'),'-')}"/>
	<c:set var="st_day" value="${fn:substringAfter(fn:substringAfter(stDay,'-'),'-')}"/>
	<c:set var="endDay" value="${endDay }"/>
	<c:set var="end_year" value="${fn:substringBefore(endDay,'-') }"/>
	<c:set var="end_month" value="${fn:substringBefore(fn:substringAfter(endDay,'-'),'-')}"/>
	<c:set var="end_day" value="${fn:substringAfter(fn:substringAfter(endDay,'-'),'-')}"/>
	<link href="${pageContext.request.contextPath}/resources/assets/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

  <!-- Page level plugin CSS-->
  <link href="${pageContext.request.contextPath}/resources/assets/vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="${pageContext.request.contextPath}/resources/assets/style/sb_admin/sb-admin.css" rel="stylesheet">
	 <!-- Bootstrap core JavaScript-->
  <script src="${pageContext.request.contextPath}/resources/assets/vendor/jquery/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="${pageContext.request.contextPath}/resources/assets/vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Page level plugin JavaScript-->
  <script src="${pageContext.request.contextPath}/resources/assets/vendor/chart.js/Chart.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/assets/vendor/datatables/jquery.dataTables.js"></script>
  <script src="${pageContext.request.contextPath}/resources/assets/vendor/datatables/dataTables.bootstrap4.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="${pageContext.request.contextPath}/resources/assets/js/sb_admin/sb-admin.min.js"></script>

  <!-- Demo scripts for this page-->
  <script src="${pageContext.request.contextPath}/resources/assets/js/sb_admin/demo/datatables-demo.js"></script>
  <script src="${pageContext.request.contextPath}/resources/assets/js/sb_admin/demo/chart-area-demo.js"></script>
  <style>
  	.wrap{
  		min-height: 800px;
  	}
  	.card-header{
  		min-height: 700px;
  	}
  	.content{
  		width:800px;
  		height: 100%;
  		float: left;
  	}
  	.iframe_content{
  		width: 800px;
  		float: left;
  	}
  	.iframe_content iframe{
		border:0;
  		min-height: 700px;
  		width: 100%;
  		overflow-x:hidden; 
  		overflow-y:hidden; 
  	}
  	.title{
  		display:inline-block;
  		height: 54px;
  		line-height:54px;
  		float: left;
  		padding:0 20px;
  	}
  	.select_day{
  		height: 54px;
  		line-height: 54px;
  	}
  	.select_day form{
  		display:inline-block;
  		height: 24px;
  		line-height: 24px;
   	}
   	table{
   		width: 500px;
   	}
   	table td,th{
   		text-align: center;
   	}
  </style>
	<script>
		$().ready(function(){
			$('.card-header').css({'width':'800px'});
			st_time_change();
			end_time_change();
			
			$('.st_year,.st_month,.st_day').change(function(){
				alert('1111');
				var year = $('#st_year').val();
				var month = $('#st_month').val();
				var day = $('#st_day').val();
				$('#stDay').val( year +'-'+ month +'-'+ day);
				
			});
			$('.end_year,.end_month,.end_day').change(function(){
				var year = $('#end_year').val();
				var month = $('#end_month').val();
				var day = $('#end_day').val();
				$('#endtDay').val( year +'-'+ month +'-'+ day);
				
			});
			
			$(document).on('change','#st_day',function(){
				st_dayChange();
			});
			$(document).on('change','#end_day',function(){
				end_dayChange();
			});
			
		});
		
		function st_time_change(){
			
			var year = $('#st_year').val();
			var month = $('#st_month').val();
			var date = 32-new Date(year,month-1,32).getDate();
			var st_day ='';
			
			for(var i=1; i<date+1; i++){
				if(i == ${st_day} && year ==${st_year}	 && month == ${st_month} ){
					st_day +='<option value='+i+' selected="selected" onchange="st_dayChange();">';
					st_day +=i;
					st_day +='</option>';
				} else {
					st_day +='<option value='+i+' onselect="st_dayChange()">';
					st_day +=i;
					st_day +='</option>';
				}
			}
			$('#st_day').html(st_day);
			st_dayChange();
 
		}
		function end_time_change(){
			var year = $('#end_year').val();
			var month = $('#end_month').val();
			var date = 32-new Date(year,month-1,32).getDate();
			var end_day ='';
			
			for(var i=1; i<date+1; i++){
				if(i == ( ${end_day} -1) && year ==${end_year}  && month == ${end_month} ){
					end_day +='<option value='+i+' selected="selected" onchange="end_dayChange();">';
					end_day +=i;
					end_day +='</option>';
				} else {
					end_day +='<option value='+i+' onselect="st_dayChange()">';
					end_day +=i;
					end_day +='</option>';
				}
			}
			$('#end_day').html(end_day);
			end_dayChange();

		}
		function st_dayChange(){
			var year = $('#st_year').val();
			var month =$('#st_month').val();
			var day = $('#st_day').val();
			$('#stDay').val(year+'-'+month+'-'+day);
			console.log(year+'-'+month+'-'+day);
			
		};
		function end_dayChange(){
			var year = $('#end_year').val();
			var month =$('#end_month').val();
			var day = $('#end_day').val();
			$('#endDay').val(year+'-'+month+'-'+day);
			console.log(year+'-'+month+'-'+day);
			
		};
		
		
	</script>
	<div class="wrap">
		<div class="content">
		
		<div class="card mb-3">
          <div class="card-header">
           <div class="calendar">
					<div class="title">
						조회기간
					</div>
					
					
					
					<div class="select_day">
						
					
						<select id="st_year" name="st_year"  onchange="st_time_change()">
							 
							<c:forEach begin="${st_year-10}" end="${st_year }" varStatus="i" step="1" >
								<c:if test="${st_year-i.count +1  eq st_year}">
									<option value="${st_year-i.count +1}" selected="selected" >${st_year- i.count +1 }</option>
								</c:if>
								<c:if test="${st_year-i.count +1  ne st_year}">
									<option value="${st_year-i.count +1}"  >${st_year- i.count +1 }</option>
								</c:if>
							</c:forEach>					
						</select> 년
						<select id="st_month" name="st_month" onchange="st_time_change()">
							
							<c:forEach begin="1" end="12" varStatus="i" step="1" >
								<c:if test="${st_month  eq i.count}">
									<option value="${i.count}" selected="selected" >${i.count }</option>
								</c:if>
								<c:if test="${st_month  ne i.count}">
									<option value="${i.count}">${i.count}</option>
								</c:if>
							</c:forEach>					
						</select> 월
						<select id="st_day">
						</select> 일
						~ 
						<select id="end_year" name="end_year"  onchange="end_time_change()">
							 
							<c:forEach begin="${end_year-10}" end="${end_year }" varStatus="i" step="1" >
								<c:if test="${end_year-i.count +1  eq end_year}">
									<option value="${end_year-i.count +1}" selected="selected" >${end_year- i.count +1 }</option>
								</c:if>
								<c:if test="${end_year-i.count +1  ne end_year}">
									<option value="${end_year-i.count +1}"  >${end_year- i.count +1 }</option>
								</c:if>
							</c:forEach>					
						</select> 년
						<select id="end_month" name="end_month" onchange="end_time_change()">
							
							<c:forEach begin="1" end="12" varStatus="i" step="1" >
								<c:if test="${end_month  eq i.count}">
									<option value="${i.count}" selected="selected" >${i.count }</option>
								</c:if>
								<c:if test="${end_month  ne i.count}">
									<option value="${i.count}">${i.count}</option>
								</c:if>
							</c:forEach>					
						</select> 월
						<select id="end_day" >
						</select> 일
						<form method="get" action="${pageContext.request.contextPath}/product/Excel_file">
							<input type="hidden" id="stDay" name="stDay" value="${stDay }">
							<input type="hidden" id="endDay" name="endDay" value="${endDay }">
							<input type="submit" value="조회하기">
						</form>
					</div>
					
				</div>
		          <div class="card-body">
		            <div class="table-responsive">
		              <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
		                <thead>
		                	<tr>
								<th>날짜</th>
								<th>건수</th>
							</tr>               
						 </thead>
		               		
		                <tbody>
							<c:if test="${eflist.size()>0 }">
								<c:forEach var="ef" items="${eflist }">
									<tr data-date="${ef.en_Date}">
										<td>${ef.en_Date }</td>
										<td>${ef.total }</td>
										
									</tr>
								</c:forEach>
							</c:if>
						</tbody>
		              </table>
		            </div>
		          </div>
		       	 </div>
			     <script type="text/javascript">
			        $().ready(function(){
			        	$('.table tbody tr').click(function(){
			        		var date = $(this).data('date');
			        		$('#enDate').val(date);
			        		document.frm.submit();
			        	});
			        });
			     </script>
					<form name="frm" action="${pageContext.request.contextPath}/product/Dept_list_show" method="post" target="exiframe">
						<input type="hidden" id="enDate" name="enDate">
					</form>
				
			
			</div>
			
		</div>
		<div class="iframe_content">
			<iframe name="exiframe" ></iframe>
		</div>
	</div>

<%@ include file="../Template/fotter.jsp" %>
