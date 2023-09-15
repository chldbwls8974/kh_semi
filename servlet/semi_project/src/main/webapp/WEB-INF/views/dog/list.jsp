<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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
	<table class="table table-hover mt-4">
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
			<th>수정</th>
			<th>삭제</th>
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
				<td><a href="<c:url value='/dog/update?d_num=${dog.d_num }'/>" class="btn btn-outline-success" role="button">수정</a></td>
			    <td>
			    <form action="<c:url value='/dog/delete'/>" method="post">
			        <button class="btn btn-outline-danger btn-dog-delete">삭제</button>
			        <input type="hidden" name="d_num" value="${dog.d_num}">
		        </form>
		        </td>
			</tr>
		</c:forEach>
	</table>
	
	<c:choose>
	    <c:when test="${fn:length(list) < 3 }">
	   		<!--  -->
	   		<a href="<c:url value='/dog/insert'/>" class="btn btn-outline-success">반려견 등록</a>
	    </c:when>
	    <c:otherwise>
			 <!-- 거짓인 경우 -->
			 <a href="<c:url value='/dog/list'/>" class="btn btn-outline-success" id="btnAdd">반려견 등록</a>
			 <script type="text/javascript">
			 	$("#btnAdd").click(function(){
				 	alert('반려견은 3마리 까지 등록할 수 있습니다.');
			 	})
			 </script>
	    </c:otherwise>
	</c:choose>
</div>
</body>
</html>