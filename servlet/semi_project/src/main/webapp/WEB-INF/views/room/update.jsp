<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"">
<title>Insert title here</title>
</head>
<body>
	<h3>객실 수정</h3>
	<form action="<c:url value='/room/update'/>" method="post">
		<input type="hidden" name="ro_num" value="${room.ro_num }">
		<input type="text" name="title" placeholder="제목" value="${room.ro_name }"> <br>
		<button>등록</button>
	</form>
</body>
</html>