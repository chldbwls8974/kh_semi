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
<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
	
	
	<div class="container mt-5">
		<h2>방 전체보기</h2>
		<table class="table table-hover mt-4">
			 <thead>
			      <tr>
			        <th>방 번호</th>
			        <th>방 이름</th>
			        <th>지점 번호</th>
			      </tr>
		    </thead>
		    <tbody>
				<c:forEach items="${list}" var="room">
					<tr>
						<td>${room.ro_num}</td>
						<td><a href="<c:url value='/room/plus/roomdetail?ro_num=${room.ro_num}'/>">${room.ro_name }</a></td>
						<td>${room.ro_br_num}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<!-- 주소 변경 -->
		<a href="<%=request.getContextPath()%>/room/roomdetail">객실 보러가기</a>
	 </div>
</body>
</html>
