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
  	.dropbtn {
	  background-color: #ea2129;
	  color: white;
	  padding: 16px;
	  font-size: 16px;
	  border: none;
	}
	
	.dropdown {
	  position: relative;
	  display: inline-block;
	}
	
	.dropdown-content {
	  display: none;
	  position: absolute;
	  background-color: #f1f1f1;
	  min-width: 180px;
	  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
	  z-index: 1;
	}
	
	.dropdown-content a {
	  color: black;
	  padding: 12px 16px;
	  text-decoration: none;
	  display: block;
	}
	
	.dropdown-content a:hover {background-color: #ddd;}
	
	.dropdown:hover .dropdown-content {display: block;}
  </style>
  <script>
  	$().ready(function(){
  		$('.create_execel').click(function(){
  			// 판매 리스트가 없으면 생성 못하도록 막을것 .
  			location.href='${pageContext.request.contextPath}/Excel/CreateExcelFile';
  		});
  		$('.show_excel_list').click(function(){
  			location.href="${pageContext.request.contextPath}/product/Excel_file"
  		});
  	})
  </script>
	<div class="card mb-3">
          <div class="card-header">
            <i class="fas fa-table"></i>
            	판매 리스트
            	<div class="btn_controll">
            		<div class="dropdown">
					  <button class="dropbtn">파일생성/송장등록</button>
					  <div class="dropdown-content">
					    <a class="create_execel">액셀파일 생성</a>
						<a class="show_excel_list">파일보기/송장등록</a>
					  </div>
					</div>
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