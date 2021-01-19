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
					}

					var id =$(this).data('value');
						
					var status = "toolbar=no,directories=no,scrollbars=no,resizable=no,status=no,menubar=no,width=800, height=700, top=0,left=20"; 
						
					win=window.open('${pageContext.request.contextPath}/admin/adminNotice_Detail?aidx='+id,'',status);
					
					
					
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
            	메모장</div>
          <div class="card-body">
            <div class="table-responsive">
              <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                  <tr>
                    <th>NO</th>
                    <th>제목</th>
                    <th>작성일</th>
                    
                  </tr>
                </thead>
               		
                <tbody>
                  <c:if test="${alist.size() > 0 }">
                  	<c:forEach var="notice_list" items="${alist }">
                  		<tr data-value="${notice_list.aidx }">
                  			<td>${notice_list.aidx}</td>
                  			<td>${notice_list.aTitle}</td>
                  			<td>${notice_list.aReg_date}</td> 
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
  
