<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Room1</title>
</head>
<body>
	<h3>객실 상세정보</h3>

	<div class="group">
		<label>객실 이름</label>
		<div class="control">${room.ro_name}</div>
	</div>
	<div class="group">
		<label>지점명</label>
		<div class="control">${branch.br_name}</div>
	</div>
	<div class="group">
		<label>객실 상세정보</label>
		<div class="control">${room.ro_detail}</div>
	</div>
	<div class="group">
		<label>최대 수용마리 수</label>
		<div class="control">${room.ro_max_cap}</div>
	</div>
</body>
</html>