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
<div class="container mt-5">
	<h1>반려견 정보 수정</h1>
	<form action="<c:url value='/dog/update'/>" method="post" class="mt-4">	
 		<input type="hidden" name="d_num" value="${dog.d_num}">
 		<div class = "form-group">
 			<label>반려견 이름</label>
 			<input type="text" class="form-control" name="d_name">
 		</div>
 		<div class = "form-group">
 			<label>나이</label>
 			<input type="text" class="form-control" name="d_age">
 		</div>
 		<div class = "form-group">
 			<label>성별</label>
 			<input type="text" class="form-control" name="d_gen" placeholder="M or F">
 		</div>
 		<div class = "form-group">
 			<label>무게</label>
 			<input type="text" class="form-control" name="d_kg" placeholder="kg 제외하고 입력">
 		</div>
 		<div class = "form-group">
 			<label>특이사항</label>
 			<textarea rows="10" cols="20" class="form-control" name="d_detail"></textarea>
 		</div>
 		<button class="btn btn-outline-warning col-12">수정</button>
 	</form>	
 	<br><a href="<c:url value='/dog/list'/>"  class="btn btn-outline-dark col-3 btn float-right">취소</a><br>
</div>
	  
</body>
</html>