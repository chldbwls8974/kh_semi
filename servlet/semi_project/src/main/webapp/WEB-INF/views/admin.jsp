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

<style type="text/css">

span{
	color: black;
	line-height: 30px;
}
a:hover {
	background-color: gainsboro;
}

</style>

<title>Admin Page</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
	
	<div class="container mt-5">
	  <h2><span style="color: olive; font-weight: bold; margin-bottom: 30px">관리자 권한</span></h2>
	  <ul class="nav flex-column">
	 	<li class="nav-item">
	      <a class="nav-link" href="/semi_project/dog/list"><span>반려견 관리</span></a>
	    </li>
	    <li class="nav-item">
	      <a class="nav-link" href="/semi_project/branch/list"><span>지점 관리</span></a>
	    </li>
	    <li class="nav-item">
	      <a class="nav-link" href="/semi_project/room/main"><span>객실 관리</span></a>
	    </li>
	    <li class="nav-item">
	      <a class="nav-link" href="/semi_project/member/list"><span>회원 관리</span></a>
	    </li>
	    <li class="nav-item">
	      <a class="nav-link" href="/semi_project/point/main"><span>포인트 관리</span></a>
	    </li>
	    <li class="nav-item">
	      <a class="nav-link" href="/semi_project/price/update"><span>객실 가격 수정</span></a>
	    </li>
	    <li class="nav-item">
	      <a class="nav-link" href="/semi_project/level/update"><span>등급별 혜택 수정</span></a>
	    </li>
	    <li class="nav-item">
	      <a class="nav-link" href="/semi_project/size/update"><span>견종 사이즈 수정</span></a>
	    </li>
	    <li class="nav-item">
	      <a class="nav-link" href="/semi_project/reservation/list"><span>예약 확인하기</span></a>
		</li>	
	  </ul>
	</div>
<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
<script type="text/javascript">
	if ('${user}' == null || '${user.me_authority}' != 'ADMIN') {
		alert('권한이 없습니다.');
	    location.href="/semi_project";
	}
	
	window.onpopstate = function(event) {
	    // 뒤로 가기 이벤트를 감지한 경우 실행할 코드 작성
	    console.log("뒤로 가기 이벤트 감지");
	};
</script>
</body>
</html>