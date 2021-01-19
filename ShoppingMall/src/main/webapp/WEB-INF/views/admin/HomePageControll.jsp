<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ include file="../Template/Adminhearder.jsp" %>
	
   <style>
   	.homePageControllerBtn{
   		margin:20px 0;
   	}
   .banner-content .banner_table{
   		
   		width: 500px;
   }
   .banner-content table {
   		border-collapse: collapse;
   		width: 500px;
   		border:1px solid black;
   }
   .banner-content table th{
   		text-align: center;
   }
  	.banner-content table td{
  		text-align: center;
  	}
   .banner-content table tr{
   		border-bottom: 1px solid black;
   		height: 40px;
   }
   .banner-content table tbody tr:nth-child(2n-1) {
		background-color: lightgray;
	}
	.homePageControllerBtn{
		width: 100%;
		height: 40px;
	}
	.homePageControllerBtn input{
		width: 100px;
		height: 40px;
		border: 0;
		float:left;
	}
	.homebtn.active{
		background-color: red; 
		color:white;
		font-weight: bold;
	}
	.banner-content,.popup-content{
		display:none;	
	}
	.banner-content.active,.popup-content.active{
		display: block;
	}
	h1{
		display: inline-block;
	}
	.popup-content{
		width: 500px;
	}
	.popup-content table{
		border-collapse: collapse;
   		width: 500px;
   		border:1px solid black;
	}
	.popup-content table tr{
		height: 40px;
		border-bottom: 1px solid black;
	}
	.popup-content table td,.popup-content table th{
		text-align: center;
	}
	.popup-content table td:first-child {
		width: 80px;
	}
	.popup-content table tbody tr:nth-child(2n-1) {
		background-color: lightgray;
	}
	
   </style>
       
        <ol class="breadcrumb">
          <li class="breadcrumb-item">
            <a href="${pageContext.request.contextPath}/admin/adminPage">관리자페이지</a>
          </li>
         
        </ol>

     		<div class="wrap-content">
     			
	     		<div class="homePageControllerBtn">
	     			<input class="homebtn active" type="button" id="showBanner" value="배너 보기">
	     			<input class="homebtn" type="button" id="showPopup" value="팝업창 관리">
	     		</div>
	     		<script type="text/javascript">
	     			$('#showBanner').click(function(){
	     				if(!$(this).hasClass('active')){
	     					$('.homebtn').removeClass('active');
	     					$(this).addClass('active');
	     					$('.popup-content').removeClass('active');
	     					$('.banner-content').addClass('active');
	     				}  
	     			});
	     			$('#showPopup').click(function(){
	     				if(!$(this).hasClass('active')){
	     					$('.homebtn').removeClass('active');
	     					$(this).addClass('active');
	     					$('.popup-content').addClass('active');
	     					$('.banner-content').removeClass('active');
	     				} 
	     			});
	     			
	     		</script>
	     		<div class="banner-content active">
	     			<div class="banner-title">
	     				<h1>배너 목록</h1>
	     				<input type="button" id="insert_banner_btn" value="배너추가"> 
	     			</div>
	     			<div class="banner_table">
	     				<table>
	     					<thead>
	     						<tr>
	     							<th>업체명</th>
	     							<th>만료일</th>
	     						</tr>
	     					</thead>
	     					<tbody>
	     						<c:forEach var="banner" items="${blist }">
	     							<tr data-id="${banner.bidx}">
	     								<td>${banner.BDEPTNAME }</td>
	     								<td>${banner.BDATE }</td>
	     							</tr>
	     						</c:forEach>
	     					</tbody>
	     				</table>
	     			</div>
	     			<script type="text/javascript">
	     				$().ready(function(){
	     					var win;
	     					$('.banner_table tbody tr').click(function(){
	     						
	     						if(win !=null){ 
	     							win.close();
	     						}
	     						var id =$(this).data('id');
	     						var status = "toolbar=no,directories=no,scrollbars=no,resizable=no,status=no,menubar=no,width=1200, height=1000, top=0,left=20"; 
	     						win = window.open("${pageContext.request.contextPath}/admin/showBanner?bidx="+id,"배너보기",status);
	     						
	     					});
	     					$('#insert_banner_btn').click(function(){
	    	     				if(win !=null){
	    	     					win.close();
	    	     				}
	    	     				var status = "toolbar=no,directories=no,scrollbars=no,resizable=no,status=no,menubar=no,width=1200, height=1000, top=0,left=20"; 
	     						win = window.open("${pageContext.request.contextPath}/admin/newBanner","배너추가",status);
	    	     			});
	     					
	     					$('#newPopup').click(function(){
	     						if(win !=null){
	     							win.close();
	     						}
	     						var status = "toolbar=no,directories=no,scrollbars=no,resizable=no,status=no,menubar=no,width=1200, height=1000, top=0,left=20"; 
	     						win = window.open("${pageContext.request.contextPath}/admin/newPopup","새 팝업 생성",status);
	     						
	     					});
	     					$('.popup-content tbody tr').click(function(){
	     						var popidx =$(this).data('id');
	     						if(win !=null){
	     							win.close();
	     						}
	     						var status = "toolbar=no,directories=no,scrollbars=no,resizable=no,status=no,menubar=no,width=1200, height=1000, top=0,left=20"; 
	     						win = window.open("${pageContext.request.contextPath}/admin/popupDetail?popidx="+popidx,"팝업 보기",status);
	     					});
	     					
	     				});
	     			</script>
	     		</div>
	     		<div class="popup-content">
	     			<div class="popup-title">
	     				<h1>팝업 관리</h1>
	     				<input type="button" id="newPopup" value="새 팝업">
	     			</div>
	     			<div class="popup-content">
	     				<table>
	     					<thead>
	     						<tr>
	     							<td>번호</td>
	     							<td>설명</td>
	     						</tr>
	     					</thead>
	     					<tbody>
	     						<c:if test="${popuplist.size() == 0}">
	     							<tr>
	     								<td colspan="2" style="height:100px">등록된 팝업이 없습니다.</td>
	     							</tr>
	     						</c:if>
	     						<c:if test="${popuplist.size() >0 }">
		     						<c:forEach var="list" items="${popuplist }">
		     							<tr data-id="${list.popIdx }">
		     								<td>${list.popIdx }</td>
		     								<td>${list.popInfo }</td>
		     							</tr>
		     						</c:forEach>
	     						</c:if>
	     					</tbody>
	     				</table>
	     			</div>
	     		</div>
     		</div>
     		
     		<div class="popup-content">
     			<div class="popup-title">
     			</div>
     		</div>
     		
        
       

  <%@ include file="../Template/Adminfotter.jsp" %>
