<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../Template/header.jsp" %>
<c:set var="today" value="${years}"/>
<c:set var="year" value="${fn:substring(today,0,4)}"/>
<c:set var="month" value="${fn:substring(today,5,7)}"/>
<c:set var="day" value="${fn:substring(today,8,10)}"/>

<script>
	$().ready(function(){
		
		sDay_update();
		eDay_update();
		function sDay_update(){
			$('#st_day').html('');
			var year = $('#st_year').val();
			var month = $('#st_month').val();
			var date = 32-new Date(year,month-1,32).getDate();
			var syear = '${year}';
			var smonth = '${month}';
			var sday  ='${day}';
						
			var html ='';
			var i =0;
			for(i = 1; i<date+1; i++){
				if(year == syear && month == smonth && i==sday){
					html +='<option value='+i+' selected="selected" onselect="st_dayChange()">';
					html +=i;
					html +='</option>';
				}else{
					html +='<option value='+i+' onselect="st_dayChange()">';
					html +=i;
					html +='</option>';
				}
			}
			$('#st_day').html(html);
			
		}
		function eDay_update(){
			$('#end_day').html('');
			var year = $('#st_year').val();
			var month = $('#st_month').val();
			var date = 32-new Date(year,month-1,32).getDate();
			var eyear = '${year}';
			var emonth = '${month}';
			var eday  ='${day}';
						
			var html ='';
			var i =0;
			for(i = 1; i<date+1; i++){
				if(year == eyear && month == emonth && i==eday){
					html +='<option value='+i+' selected="selected" onselect="end_dayChange()">';
					html +=i;
					html +='</option>';
				}else{
					html +='<option value='+i+' onselect="end_dayChange()">';
					html +=i;
					html +='</option>';
				}
			}
			$('#end_day').html(html);
		}
		
		$('#st_month').change(function(){
			sDay_update();
		});
		$('#st_year').change(function(){
			sDay_update();
		});
		$('#end_month').change(function(){
			eDay_update();
		});
		$('#end_month').change(function(){
			eDay_update();
		});
	});
</script>


	<div class="wrap">
		<div class="wrap content">
			<div class="orderList">
				<div class="orderList-title">
					<strong>
						<span class="order-status">주문/배송</span>조회
					</strong>
				</div>
				<div class="cOrder">
					<div class="cContent">
						조회 기간
					</div>
					<div class="cBtns">
						<div class="cTimeBtns">
							<input class="cTimetrack" type="button" name="Today" id="Today" value="오늘">
							<input class="cTimetrack" type="button" name="Week" id="Week" value="1주일">
							<input class="cTimetrack" type="button" name="Month" id="Month" value="1개월">
							<input class="cTimetrack" type="button" name="6Month" id="6Month" value="6개월">
							<input class="cTimetrack" type="button" name="Year" id="Year" value="1년">
							
						</div>
						<div class="cinput">
							
							<select id="st_year" onchange="st_dayChange()">
																
								<c:forEach var="i" begin="0" end="9">
									<c:if test="${year eq (year-i) }">
										<option value="${year-i }"  selected="selected">${year-i }</option>
									</c:if>
									<c:if test="${year ne (year-i) }">
										<option value="${year-i }" >${year-i}</option>
									</c:if>
										
								</c:forEach>
							</select>
							<select id="st_month" onchange ="st_dayChange()">
								<c:forEach var = "i" begin="1" end="12">
									
									<c:if test="${month eq i}">
										<option value="${month}" selected="selected">${month}</option>
									</c:if>
									<c:if test="${month ne i}">
										<option value="${i}">${i}</option>
									</c:if>
								</c:forEach>
							</select>
							<select id="st_day" onchange ="st_dayChange()">
																
							</select>
						</div>
						<div class="cinput">
							
							<select id="end_year" onchange ="end_dayChange()">
																
								<c:forEach var="i" begin="0" end="9">
									<c:if test="${year eq (year-i) }">
										<option value="${year-i }" selected="selected">${year-i }</option>
									</c:if>
									<c:if test="${year ne (year-i) }">
										<option value="${year-i }">${year-i }</option>
									</c:if>
										
								</c:forEach>
							</select>
							<select id="end_month" onchange ="end_dayChange()">
								<c:forEach var = "i" begin="1" end="12">
									
									<c:if test="${month eq i}">
										<option value="${month}" selected="selected" >${month}</option>
									</c:if>
									<c:if test="${month ne i}">
										<option value="${i}" >${i}</option>
									</c:if>
								</c:forEach>
							</select>
							<select id="end_day" onchange ="end_dayChange()">
																
							</select>
						</div>
						<div class="calender-controll">
							<form action="OrderList" method="post">
								<input type="hidden" id="stDay" name="stDay" value="${years }">
								<input type="hidden" id="endDay" name="endDay" value="${years }" >
								<input type="submit" id="search-btn">
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
<script>
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
<%@ include file="../Template/fotter.jsp" %>