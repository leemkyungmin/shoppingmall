<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
 <%@ include file="../Template/Adminhearder.jsp" %>
 <ol class="breadcrumb">
          <li class="breadcrumb-item">
            <a href="${pageContext.request.contextPath}/admin/adminPage">관리자페이지</a>
          </li>
         
        </ol>

     	<Style>
     		td,th{
     			text-align: center;
     		}
     	tbody td:nth-child(1) {
			width: 100px;
		}
		tbody td:nth-child(2),td:nth-child(4),td:nth-child(5) {
			width: 200px;
		}
     	</Style>
		
		<script>
			$().ready(function(){
				
				var cstatus='${cStatus}';
				
				if(cstatus =='0'){
					$('.btn_controll').removeClass('active');
					$('.btn_controll:first-child').addClass('active');
				} else if(cstatus =='1') {
					$('.btn_controll').removeClass('active');
					$('.btn_controll:nth-child(3)').addClass('active');
				} else {
					$('.btn_controll').removeClass('active');
					$('.btn_controll:nth-child(2)').addClass('active');
				}
								
				
				$('.show_customer_detail').click(function(){
					var cidx = $(this).data('id');
					location.href='${pageContext.request.contextPath}/admin/Customer_Service_Detail?cidx='+cidx; 
					
				});
				$('.btn_controll').click(function(){
					
					if(!$(this).hasClass('active')){
						var data = $(this).data('value');
						$('.btn_controll').removeClass('active');
						$(this).addClass('active');
						change_type(data);
					}
						
				});
			});
			
			function change_type(data){
				location.href='${pageContext.request.contextPath}/admin/Customer_service?cStatus='+data
			}
			
		</script>
		 <style>
		 	.controller{
		 		margin:10px 0;
		 		display:block;
		 		height: 40px;
		 	}
		 	.btn_controll{
		 		float: left;	
		 	}
		 	.btn_controll.active{
		 		background-color: red;
		 		color:white;
		 	}
		 </style>
    
        <!-- DataTables Example -->
        <div class="card mb-3">
          <div class="card-header">
            <i class="fas fa-table"></i>
            	고객센터 </div>
          <div class="card-body">
            <div class="table-responsive">
               <div class="controller">
               		<input type="button" class="btn_controll" id="wait_cvs" value="상담대기" data-value="0">
               		<input type="button" class="btn_controll" id="proceeding_cvs" value="상담중" data-value="9">
               		<input type="button" class="btn_controll" id="fin_cvs" value="상담완료" data-value="1">
               </div>
               
              <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                  <tr>
                    <th>번호</th>
                    <th>상담분류</th>
                    <th>제목</th>
                    <th>상담여부</th>
                    <th>작성일</th>
                    
                  </tr>
                </thead>
                <tbody>
                
                  <c:if test="${cslist.size() eq 0 }">
                  	<tr>
                  		<td colspan="4" style="height: 500px">작성된 상담리스트가 없습니다.</td>
                  	</tr>
                  </c:if>
                  <c:if test="${cslist.size() >0 }">
                  	<c:forEach var="cs" items="${cslist }">
                  		<tr class="show_customer_detail" data-id=${cs.cIdx }>
                  			<td>${cs.cIdx}</td>
                  			<td>
                  				<c:if test="${cs.cType eq 1 }">[상품문의]</c:if>
                  				<c:if test="${cs.cType eq 2 }">[구매문의]</c:if>
                  				<c:if test="${cs.cType eq 3 }">[판매문의]</c:if>
                  				<c:if test="${cs.cType eq 4 }">[광고문의]</c:if>
                  			</td>
                  			<td>${cs.cTitle}</td>
                  			<td>
                  				<c:if test="${cs.cStatus eq 0}">
                  					상담대기중
                  				</c:if>
                  				<c:if test="${cs.cStatus eq 9}">
                  					다른 상담원이 상담글 작성중
                  				</c:if>
                  				<c:if test="${cs.cStatus eq 1}">
                  					상담완료
                  				</c:if>
                  			</td>
                  			<td>${cs.cReg_date}</td>
                  		</tr>
                  	</c:forEach>
                  </c:if>
                </tbody>
              </table>
            </div>
          </div>
        </div>
<%@ include file="../Template/Adminfotter.jsp" %>