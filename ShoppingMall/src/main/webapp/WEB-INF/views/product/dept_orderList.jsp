<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ include file="../Template/header.jsp" %>
	
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
  <link href="${pageContext.request.contextPath}/resources/assets/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

  <!-- Page level plugin CSS-->
  <link href="${pageContext.request.contextPath}/resources/assets/vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="${pageContext.request.contextPath}/resources/assets/style/sb_admin/sb-admin.css" rel="stylesheet">
  <style>
    
  	.btn_controll{
  		display:inline-block;
  		width:300px;
  		float: right;
  	}
  	.btn_controll input[type=button]{
  		background-color: red;
  		color:white;
  		height: 100%;
  		border: 0;
  		height: 38px;
  	}
  </style>
  <script>
  	$().ready(function(){
  		$('#create_execel').click(function(){
  			location.href='${pageContext.request.contextPath}/Excel/CreateExcelFile';
  		});
  	})
  </script>
	<div class="card mb-3">
          <div class="card-header">
            <i class="fas fa-table"></i>
            	판매 리스트
            	<div class="btn_controll">
	           		<input type="button" id="create_execel" value="액셀파일 생성" >
	           </div>
            </div>
           
          <div class="card-body">
            <div class="table-responsive">
              <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                 <tr>
					<td>주문번호</td>
					<td>요청사항</td>
					<td>옵션명</td>
					<td>갯수</td>
					<td>주소</td>
					<td>이름</td>
					<td>연락처</td>
				</tr>
                </thead>
               		
                <tbody>
               
                  	<c:forEach var="i" items="${dolist }">
						<tr>
							<td>${i.bOrder_num }</td>
							<td>${i.bOrder_ment }</td>
							<td>${i.boName }</td>
							<td>${i.boCount }</td>
							<td>${i.address }</td>
							<td>${i.name }</td>
							<td>${i.phone }</td>
						</tr>
					</c:forEach>
                 
                  <c:if test=""></c:if>
                </tbody>
              </table>
            </div>
          </div>
        </div>
	
	
	
<%@ include file="../Template/fotter.jsp" %>