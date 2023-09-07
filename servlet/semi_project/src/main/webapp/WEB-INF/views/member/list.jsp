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
	<div class="container mt-5">
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
		    	<c:forEach items="${list}" var="member">
			      <tr>
			        <td>${member.me_id}</td>
			        <td>${member.me_name}</td>
			        <td>${member.me_address}</td>
			        <td>${member.me_phone}</td>
			      </tr>
			    </c:forEach>
		    </tbody>
		</table>
	</div>
</body>
</html>