<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방 상세보기</title>
</head>
<body>
	<h2>방 전체보기</h2>
	<div class="container">
		<div class="boay">
			<label>1호(대형견)</label>
	    	<a href="<c:url value='/room/room1'/>">1</a> <br>
	    	<label>2호(중형견)</label>
	    	<a href="<c:url value='/room/room2'/>">2</a> <br>
	    	<label>3호(소형견)</label>
	    	<a href="<c:url value='/room/room3'/>">3</a> <br>
	    </div>
	</div>
</body>
</html>