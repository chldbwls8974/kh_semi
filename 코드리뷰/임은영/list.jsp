<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>지점 조회</h1>
	<a href="<%=request.getContextPath()%>/member/insert">지점 등록</a>
	<%=request.getAttribute("list") %>
</body>
</html>
