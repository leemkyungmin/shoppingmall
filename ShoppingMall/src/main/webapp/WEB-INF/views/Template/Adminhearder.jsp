<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        <a class="nav-link" href="${pageContext.request.contextPath}/admin/homePageControll">
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