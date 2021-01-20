<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<%@ include file="../Template/Adminhearder.jsp" %>
	
	<script type="text/javascript">
			$().ready(function(){
				
				var win;
				$('.table.table-bordered tbody tr').click(function(){
					
					if(win !=null){
						win.close();
					}

					var id =$(this).data('id');
						
					var status = "toolbar=no,directories=no,scrollbars=no,resizable=no,status=no,menubar=no,width=1200px, height=1000, top=0,left=20"; 
						
					win=window.open('${pageContext.request.contextPath}/admin/dept_Detail?didx='+id,'',status);
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
                    <th>상호명</th>
                    <th>사업자번호</th>
                    <th>연락처</th>
                    <th>판매/구매</th>
                    <th>판매금액</th>
                    <th>가입일</th>
                    
                  </tr>		
                </thead>
               		
                <tbody>
                  <c:if test="${deptlist.size() > 0 }">
                  	<c:forEach var="dept" items="${deptlist }">
                  		<tr data-id="${dept.dIdx }">
                  			<td>${dept.dName }</td>
                  			<td>${dept.dSaup_no }</td>
                  			<td>${dept.dPhone }</td>
                  			<td>${dept.dType eq 'sell' ? '기업판매회원' :'기업구매회원' }</td>
                  			<td><fmt:formatNumber value="${dept.total}" pattern="#,###"/></td>
                  			<td>${dept.dReg_date }</td>
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