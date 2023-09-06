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
	<h1>포인트 적립 관리 페이지</h1>
	<div class="container">
		<table class="table table-hover">
		    <thead>
		      <tr>
		        <th>포인트</th>
		        <th>포인트 내용</th>
		        <th>적립대상자</th>
		      </tr>
		    </thead>
		    <tbody>
		      <c:forEach items="${list }" var="point">
			      <tr>
			        <td>${point.po_point}</td>
			        <td>${point.po_content}</td>
			        <td>${point.po_me_id}</td>
			      </tr>
		      </c:forEach>
		    </tbody>
	  </table>
	 </div> 
<a href="<c:url value='/point/insert'/>" class="btn btn-outline-dark col-3 btn float-right">포인트 적립하기</a>
</body>
</html>