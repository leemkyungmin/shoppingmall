<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ include file="../Template/Adminhearder.jsp" %>
	
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
						console.log('1111');
					}

					var id =$(this).data('value');
						
					var status = "toolbar=no,directories=no,scrollbars=no,resizable=no,status=no,menubar=no,width=1200px, height=1000, top=0,left=20"; 
						
					win=window.open('${pageContext.request.contextPath}/admin/user_Detail?uidx='+id,'',status);
				});
			});
		
		</script>
	
    

        <!-- Breadcrumbs-->
        <ol class="breadcrumb">
          <li class="breadcrumb-item">
            <a href="${pageContext.request.contextPath}/admin/adminPage">관리자페이지</a>
          </li>
         
        </ol>

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

     
     

  <%@ include file="../Template/Adminfotter.jsp" %>