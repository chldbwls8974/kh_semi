<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
	
	<style>
  /* 사진 크기 */
  .carousel-inner img {
    width: 100%;
    height: 100%;
  }
  </style>
<title>방 상세보기</title>
</head>
<body>
		
	<!-- 상단바 -->	
	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
	  <!-- Brand/logo -->
	  <a class="navbar-brand" href="<c:url value='/'/>">DogHotel</a>
	  
	  <!-- Links -->
	  <ul class="navbar-nav">
	    <li class="nav-item">
	      <a class="nav-link" href="<c:url value='/room/plus/roomdetail'/>">room 1</a>
	    </li>
	    <li class="nav-item">
	      <a class="nav-link" href="<c:url value='/room/plus/roomdetail'/>">room 2</a>
	    </li>
	    <li class="nav-item">
	      <a class="nav-link" href="<c:url value='/room/plus/roomdetail'/>">room 3</a>
	    </li>
	  </ul>
	</nav>
	
	<!-- 아래는 부트스트랩 디자인임 무시해도 됨 -->
	<!-- 본문 -->
	<div id="demo" class="carousel slide" data-ride="carousel">
	  <ul class="carousel-indicators">
	    <li data-target="#demo" data-slide-to="0" class="active"></li>
	    <li data-target="#demo" data-slide-to="1"></li>
	    <li data-target="#demo" data-slide-to="2"></li>
	  </ul>
<!-- 	 	<div class="carousel-inner"> -->
<!-- 	    <div class="carousel-item active"> -->
<!-- <!-- 	      <img src="../img/retriever.JPG" alt="retriever" width="1100" height="500"> --> -->
<!-- 	      <a href="#" ><div></div></a> -->
<!-- 	      <div class="carousel-caption"> -->
<!-- 	        <h3>Room 1</h3> -->
<!-- 	        <p>대형견 전용 룸. 중,소형견은 이용 불가합니다.</p> -->
<!-- 	      </div>    -->
<!-- 	    </div> -->
<!-- 	    <div class="carousel-item"> -->
<!-- <!-- 	      <img src="" alt="WelshCorgi" width="1100" height="500"> --> -->
<!-- 	      <a href="#"><div></div></a> -->
<!-- 	      <div class="carousel-caption"> -->
<!-- 	        <h3>Room 2</h3> -->
<!-- 	        <p>중형견 전용 룸. 대,소형견은 이용 불가합니다.</p> -->
<!-- 	      </div>    -->
<!-- 	    </div> -->
<!-- 	    <div class="carousel-item"> -->
<!-- <!-- 	      <img src="" alt="maltese" width="1100" height="500"> --> -->
<!-- 	      <a href="#"><div></div></a> -->
<!-- 	      <div class="carousel-caption"> -->
<!-- 	        <h3>Room 3</h3> -->
<!-- 	        <p>소형견 전용 룸. 중,대형견은 이용 불가합니다.</p> -->
<!-- 	      </div>    -->
<!-- 	    </div> -->
<!-- 	  </div> -->
<!-- 	  <a class="carousel-control-prev" href="#demo" data-slide="prev"> -->
<!-- 	    <span class="carousel-control-prev-icon"></span> -->
<!-- 	  </a> -->
<!-- 	  <a class="carousel-control-next" href="#demo" data-slide="next"> -->
<!-- 	    <span class="carousel-control-next-icon"></span> -->
<!-- 	  </a> -->
<!-- 		</div> -->

			
				<h2>방 전체보기</h2>
				<a href="<%=request.getContextPath()%>/room/roomdetail">객실 보러가기</a>
				<table>
				<c:forEach items="${list}" var="room">
					<tr>
						<td>${room.ro_num}</td>
						<td><a href="<c:url value='/room/plus/roomdetail?ro_num=${room.ro_num}'/>">${room.ro_name }</a></td>
						<td>${room.ro_br_num}</td>
					</tr>
					</c:forEach>
				</table>
	 
</body>
</html>
