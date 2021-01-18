<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
 
<head>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>SB Admin - Dashboard</title>

  <!-- Custom fonts for this template-->
  <link href="${pageContext.request.contextPath}/resources/assets/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

  <!-- Page level plugin CSS-->
  <link href="${pageContext.request.contextPath}/resources/assets/vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="${pageContext.request.contextPath}/resources/assets/style/sb_admin/sb-admin.css" rel="stylesheet">
  
</head>

<body id="page-top">

  <nav class="navbar navbar-expand navbar-dark bg-dark static-top">

    <a class="navbar-brand mr-1" href="${pageContext.request.contextPath}/admin/adminPage">lkm-shoppingmall관리자패이지</a>

    
    
  </nav>

  <div id="wrapper">

    <!-- Sidebar -->
    <ul class="sidebar navbar-nav">
      <li class="nav-item active">
        <a class="nav-link" href="admin/homePageControll">
          <i class="fas fa-fw fa-tachometer-alt"></i>
          <span>홈페이지 관리</span>
        </a>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="pagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <i class="fas fa-fw fa-folder"></i>
          <span>회원 관리</span>
        </a>
        <div class="dropdown-menu" aria-labelledby="pagesDropdown">
          <h6 class="dropdown-header">회원관리</h6>
          <a class="dropdown-item" href="${pageContext.request.contextPath}/admin/UserInfo">일반회원 보기</a>
          <a class="dropdown-item" href="${pageContext.request.contextPath}/admin/deptInfo">기업회원 보기</a>
          
      </li>
     
      <li class="nav-item">
        <a class="nav-link" href="admin/Customer_service">
          <i class="fas fa-fw fa-table"></i>
          <span>고객센터</span></a>
      </li>
    </ul>

    <div id="content-wrapper">

      <div class="container-fluid">

        <!-- Breadcrumbs-->
        <ol class="breadcrumb">
          <li class="breadcrumb-item">
            <a href="${pageContext.request.contextPath}/admin/adminPage">관리자페이지</a>
          </li>
         
        </ol>

     
		<script type="text/javascript">
			$().ready(function(){
				setTimeout(() => {
					$('.table.table-bordered tr th:first-child,.table.table-bordered tr td:first-child' ).css({'width':'50px','text-align':'center'});
					$('.table.table-bordered tr th:last-child,.table.table-bordered tr td:last-child' ).css({'width':'100px','text-align':'center'});
				}, 500);
				var win;
				$('.table.table-bordered tbody tr').click(function(){
					
					if(win !=null){
						win.close();
					}

					var id =$(this).data('value');
						
					var status = "toolbar=no,directories=no,scrollbars=no,resizable=no,status=no,menubar=no,width=1200px, height=1000, top=0,left=20"; 
						
					win=window.open('${pageContext.request.contextPath}/admin/user_Detail?uidx='+id,'',status);
					
					
					
				});
			});
		
		</script>
      
        <!-- DataTables Example -->
        <div class="card mb-3">
          <div class="card-header">
            <i class="fas fa-table"></i>
            	일반회원 목록</div>
          <div class="card-body">
            <div class="table-responsive">
              <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                  <tr>
                    <th>번호</th>
                    <th>아이디</th>
                    <th>이름</th>
                    <th>연락처</th>
                    <th>포인트</th>
                    <th>등급</th>
                    
                  </tr>
                </thead>
               		
                <tbody>
                  <c:if test="${ulist.size() > 0 }">
                  	<c:forEach var="user" items="${ulist }">
                  		<tr data-value=${user.uIdx }>
                  			<td>${user.uIdx }</td>
                  			<td>${user.uSerid }</td>
                  			<td>${user.uName }</td>
                  			<td>${user.uPhone }</td>
                  			<td>${user.uPoint }</td>
                  			<td>${user.uGrade }</td>
                  		</tr>
                  	</c:forEach>
                  </c:if>
                  <c:if test=""></c:if>
                </tbody>
              </table>
            </div>
          </div>
        
        </div>

      </div>
      <!-- /.container-fluid -->

      <!-- Sticky Footer -->
      <footer class="sticky-footer">
        <div class="container my-auto">
          <div class="copyright text-center my-auto">
            <span>Copyright © Your Website 2020</span>
          </div>
        </div>
      </footer>

    </div>
    <!-- /.content-wrapper -->

  </div>
  <!-- /#wrapper -->

  <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>

  

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

</body>

</html>
