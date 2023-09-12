<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
  
  <style>
  /* Make the image fully responsive */
  .carousel-inner img {
    width: 100%;
    height: 100%;
  }
  </style>
  
<title>방 상세보기</title>
</head>
<body>

<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
 <div class="container mt-5">
	<h2>객실보기</h2>
		<div>
		<label>지점을 선택해주세요</label>
				<select name="branchSelect">
					<option value="0">지점 선택</option>
					<c:forEach items="${branchList }" var="br">
						<option value="${br.br_num }">${br.br_name }</option>
					</c:forEach>
				</select>
		</div>
		<table class="table table-hover mt-4">
		<thead>
			<tr>
				<th>방번호</th>
				<th>방이름</th>
				<th>최대 수용 반려견 수</th>
				<th>현재 수용 반려견 수</th>
				<th>방 타입</th>
			</tr>
		</thead>
			<tbody>
				<c:forEach items="${list}" var="room">
						<tr>
							<td>${room.ro_num}</td>
							<td><a href="<c:url value='/room/detail?ro_num=${room.ro_num}'/>" >${room.ro_name }</a></td>
							<td>${room.ro_max_cap}</td>
							<td>${room.ro_now_cap}</td>
							<td>${room.ro_detail}</td>
						</tr>
				</c:forEach>
			</tbody>
		</table>	
		<a href="<c:url value='/room/insert'/>" class="btn btn-outline-warning mt-2">등록</a>
</div>	

<!-- <div id="demo" class="carousel slide mt-5" data-ride="carousel"> -->

<!--   <!-- Indicators --> -->
<!--   <ul class="carousel-indicators"> -->
<!--     <li data-target="#demo" data-slide-to="0" class="active"></li> -->
<!--     <li data-target="#demo" data-slide-to="1"></li> -->
<!--     <li data-target="#demo" data-slide-to="2"></li> -->
<!--   </ul> -->

<!--   <!-- The slideshow --> -->
<!--   <div class="container carousel-inner w-65 h-40"> -->
<!--     <div class="carousel-item active"> -->
<%--       <a href="<c:url value='/room/detail'/>"> --%>
<!--       	<img src="https://www.google.com/url?sa=i&url=https%3A%2F%2Funsplash.com%2Fs%2Fphotos%2Fdog-park&psig=AOvVaw2YSWWsQIAxo5IoPcpDH2aS&ust=1694612782203000&source=images&cd=vfe&opi=89978449&ved=0CBAQjRxqFwoTCIiiit6apYEDFQAAAAAdAAAAABAK" alt="방1"/> -->
<!--       </a> -->
<!--     </div> -->
<!--     <div class="carousel-item"> -->
<!--       <img src="운동장.jpg" alt="운동장"/> -->
<!--     </div> -->
<!--     <div class="carousel-item"> -->
<!--       <img src="https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.pexels.com%2Fsearch%2Fliving%2520room%2F&psig=AOvVaw31v1h5UmN02MvuP1GrYMcR&ust=1694613297966000&source=images&cd=vfe&opi=89978449&ved=0CBAQjRxqFwoTCODmuNWcpYEDFQAAAAAdAAAAABAD" alt="방1"/> -->
<!--     </div> -->
<!--       <div class="carousel-item"> -->
<!--       <img src="운동장.jpg" alt="운동장"/> -->
<!--     </div> -->
<!--   </div> -->

<!--   <!-- Left and right controls --> -->
<!--   <a class="carousel-control-prev" href="#demo" data-slide="prev"> -->
<!--     <span class="carousel-control-prev-icon"></span> -->
<!--   </a> -->
<!--   <a class="carousel-control-next" href="#demo" data-slide="next"> -->
<!--     <span class="carousel-control-next-icon"></span> -->
<!--   </a> -->
<!-- </div> -->

</body>
</html>