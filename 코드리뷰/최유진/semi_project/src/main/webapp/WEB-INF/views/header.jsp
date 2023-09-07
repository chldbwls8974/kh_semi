<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<style>
  /* 사진 크기 */
  .carousel-inner img {
    width: 100%;
    height: 100%;
  }
  </style>
<title>Insert title here</title>
</head>
<body>
<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
  <!-- Brand/logo -->
    <a class="navbar-brand" href="/semi_project">DogHotel</a>
  
  <!-- Links -->
  <div class="collapse navbar-collapse justify-content-between">
  	<ul class="navbar-nav">
	
	    <li class="nav-item">
	      <a class="nav-link" href="/semi_project/member/login">로그인</a>
	    </li>
	    <li class="nav-item">
	      <a class="nav-link" href="/semi_project/member/signup">회원가입</a>
	    </li>
	  
 	</ul>
 	<ul class="navbar-nav">  
 		<li class="nav-item">
	      <a class="nav-link" href="#">${user.me_id }님 환영합니다</a>
	    </li>
	     <li class="nav-item">
	      <a class="nav-link" href="/semi_project/dog/main">동물등록하기</a>
	    </li>
	    <li class="nav-item">
	      <a class="nav-link" href="/semi_project/member/mypage">마이페이지</a>
	    </li>
	     <li class="nav-item">
	      <a class="nav-link" href="/semi_project/member/logout">로그아웃</a>
	    </li>
   
	    <li class="nav-item">
	      <a class="nav-link" href="#">관리자 권한</a>
	    </li>
	    <li class="nav-item">
	      <a class="nav-link" href="/semi_project/branch/list">지점관리</a>
	    </li>
	     <li class="nav-item">
	      <a class="nav-link" href="/semi_project/room/roommain">객실관리</a>
	    </li>
	    <li class="nav-item">
	      <a class="nav-link" href="#">회원관리</a>
	    </li>
	    <li class="nav-item">
	      <a class="nav-link" href="/semi_project/point/main">포인트관리</a>
	    </li>
	     <li class="nav-item">
	      <a class="nav-link" href="/semi_project/member/logout">로그아웃</a>
	    </li> 
	 </ul>
  </div>	 
</nav>
</body>
</html>