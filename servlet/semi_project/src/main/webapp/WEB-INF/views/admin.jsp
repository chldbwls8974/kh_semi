<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
	
	<div class="container mt-5">
	  <h2>관리자 권한</h2>
	  <ul class="nav flex-column">
	    <li class="nav-item">
	      <a class="nav-link" href="/semi_project/branch/list">지점관리</a>
	    </li>
	    <li class="nav-item">
	      <a class="nav-link" href="/semi_project/room/main">방 관리</a>
	    </li>
	    <li class="nav-item">
	      <a class="nav-link" href="/semi_project/member/list">회원관리</a>
	    </li>
	    <li class="nav-item">
	      <a class="nav-link" href="/semi_project/point/main">포인트관리</a>
	    </li>
	    <li class="nav-item">
	      <a class="nav-link" href="/semi_project/price/update">가격수정</a>
	    </li>
	    <li class="nav-item">
	      <a class="nav-link" href="/semi_project/level/update">등급별 혜택 수정</a>
	    </li>
	    <li class="nav-item">
	      <a class="nav-link" href="/semi_project/size/update">견종 사이즈 수정</a>
	    </li>
	  </ul>
	</div>

<script type="text/javascript">
// 	if ('${user}' == null || '${user.me_authority}' != 'ADMIN') {
// 		alert('권한이 없습니다.');
// 	    location.href="/semi_project";
// 	}
</script>
</body>
</html>