<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
	<table class="table table-hover">
	    <thead>
	      <tr>
	        <th>아이디</th>
	        <th>이름</th>
	        <th>주소</th>
	        <th>번호</th>
	      </tr>
	    </thead>
	    <tbody>
	    	<c:forEach items="${list}" var="branch">
		      <tr>
		        <td>${user.me_id}</td>
		        <td>${user.me_name}</td>
		        <td>${user.address}</td>
		        <td>${user.me_phone}</td>
		      </tr>
		    </c:forEach>
	    </tbody>
	</table>
</body>
</html>