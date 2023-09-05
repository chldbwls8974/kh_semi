 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>       
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
<<<<<<< HEAD:코드리뷰/최유진/semi_project/src/main/webapp/WEB-INF/views/branch/list.jsp
	<h1>지점 조회</h1>
	<a href="<c:url value='branch/insert'/>">지점 등록</a>
=======
	<div class="container mt-5">
		<h1>지점 조회</h1>
		<c:choose>
			<c:when test="${pm.totalCount != 0}">
				<table class="table table-hover">
				    <thead>
				      <tr>
				        <th>지점번호</th>
				        <th>지점명</th>
				        <th>지점 연락처</th>
				      </tr>
				    </thead>
				    <tbody>
				    	<c:forEach items="${list}" var="branch">
					      <tr>
					        <td>${branch.br_num}</td>
					        <td>${branch.br_name}</td>
					        <td>${branch.br_phone}</td>
					      </tr>
					    </c:forEach>
				    </tbody>
				</table>
			</c:when>
			<c:otherwise>
				<h2>등록된 지점이 없습니다.</h2>
			</c:otherwise>
		</c:choose>	
		<a href="<%=request.getContextPath()%>/views/insert" class="btn btn-outline-success">지점 등록</a>
		<a href="" class="btn btn-outline-success">메인으로</a>
	</div>
>>>>>>> 4132233da10b8b8ba13ce6a046097bb301f69900:코드리뷰/임은영/list.jsp
</body>
</html>