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
		<h2>예약하기</h2>
		
		<form action="<c:url value='/reservation/insert'/>">
			<!-- 날짜 입력은 데이터피커로 받을 것 -->
			<div class="form-group">
				<label>호텔 이용 시작 날짜</label>
				<input type="text" id="datePicker" class="form-control" value="2023-09-08" name="re_date"> 
			</div>
			<div class="form-group">
				<label>이용기간</label>
				<input type="text" class="form-control" value="2023-09-08" name="re_stay" placeholder="ex)3박4일 이용하시면 4 라고 입력해주세요"> 
			</div>
			<div class="form-group">
				<label>맡기고자 하는 개를 선택해주세요</label>
				<input type="text" id="datePicker" class="form-control" value="2023-09-08"> 
			</div>
		</form>
		
	</div>


</body>
</html>