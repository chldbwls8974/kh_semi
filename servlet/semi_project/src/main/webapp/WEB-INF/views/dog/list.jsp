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
<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>

<div class="container mt-5">
	<h2>나의 반려견</h2>
	<table class="table table-bordered mt-4">
	<thead>
		<tr>
			<th>반려견 번호</th>
			<th>이름</th>
			<th>나이</th>
			<th>성별</th>
			<th>무게(kg)</th>
			<th>특이사항</th>
			<th>견주ID</th>
			<th>크기</th>
		</tr>
	</thead>
		<c:forEach items="${list}" var="dog">
			<tr>
				<td>${dog.d_num }</td>
				<td>${dog.d_name}</td>
				<td>${dog.d_age}</td>
				<td>${dog.d_gen}</td>
				<td>${dog.d_kg}</td>
				<td>${dog.d_detail}</td>
				<td>${dog.d_me_id }</td>
				<td>${dog.d_si_name }</td>
			</tr>
		</c:forEach>
	</table>
</div>
</body>
</html>