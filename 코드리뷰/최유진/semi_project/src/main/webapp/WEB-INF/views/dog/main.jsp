<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<title>Dog Hotel</title>
</head>
<body>

	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
	  <!-- Brand/logo -->
	  <a class="navbar-brand" href="#">
	    <img src="#" alt="logo" style="width:40px;">
	  </a>
	  
	  <!-- Links -->
	  <div class="collapse navbar-collapse justify-content-between">
	  	<ul class="navbar-nav">
		  <c:if test="${user==null }">
		    <li class="nav-item">
		      <a class="nav-link" href="<c:url value='/member/login'/>">로그인</a>
		    </li>
		    <li class="nav-item">
		      <a class="nav-link" href="<c:url value='/member/signup'/>">회원가입</a>
		    </li>
		  </c:if>
		  <c:if test="${user!=null }">
		  
		    <li class="nav-item">
		      <a class="nav-link" href="#">둘러보기</a>
		    </li>
		    <li class="nav-item">
		      <a class="nav-link" href="#">예매하기</a>
		    </li>
		 </ul>
		 <ul class="navbar-nav">  
		    <li class="nav-item">
		      <a class="nav-link" href="#">${user.me_id }님 환영합니다</a>
		    </li>
		    <li class="nav-item">
		      <a class="nav-link" href="<c:url value='/member/mypage'/>">마이페이지</a>
		    </li>
		     <li class="nav-item">
		      <a class="nav-link" href="<c:url value='/member/logout'/>">로그아웃</a>
		    </li>
		     <li class="nav-item">
		      <a class="nav-link" href="<c:url value='/dog/main'/>">나의 반려견</a>
		    </li>
		    </div>
		  </c:if>
	</nav>
<a href="<c:url value='/dog/insert'/>">나의 반려견 등록</a> <br>
<a href="<c:url value='/dog/list'/>">나의 반려견 목록</a>
</body>
</html>