<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 조회</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
	<div class="container mt-5">
		<h2><span style="color: olive; font-weight: bold;">회원 조회</span></h2>
		<table class="table table-hover mt-4">
		    <thead>
		      <tr style="background: wheat; font-weight: bold;">
		        <th>아이디</th>
		        <th>이름</th>
		        <th>주소</th>
		        <th>번호</th>
		        <th></th>
		      </tr>
		    </thead>
		    <tbody>
		    	<c:forEach items="${list}" var="member">
			      <tr>
			        <td>${member.me_id}</td>
			        <td>${member.me_name}</td>
			        <td>${member.me_address}</td>
			        <td>${member.me_phone}</td>
			        <td>
						<form method="POST" action="<c:url value='/member/delete'/>">
			                <input type="hidden" name="me_id" value="${member.me_id}">
			                <button type="submit" class="btn btn-outline-warning">삭제</button>
            			</form>
			        </td>
			      </tr>
			    </c:forEach>
		    </tbody>
		</table>
		
		<a role="button" class="btn btn-outline-warning" href="<c:url value='/member/level'/>">등급 기준액 변경</a>
		<a role="button" class="btn btn-outline-dark btn-float-right" href="/semi_project/admin">뒤로가기</a>
	</div>
	<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
	<script type="text/javascript">
		
	</script>	
</body>
</html>