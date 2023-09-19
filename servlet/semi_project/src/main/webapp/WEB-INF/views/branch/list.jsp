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
<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>	
	<div class="container mt-5">
		<h2>지점 조회</h2>
		<c:choose>
			<c:when test="${pm.totalCount != 0}">
				<table class="table table-hover mt-4">
				    <thead>
				      <tr>
				        <th>지점번호</th>
				        <th>지점명</th>
				        <th>지점 연락처</th>
				        <th>지점 삭제</th>
				      </tr>
				    </thead>
				    <tbody>
				    	<c:forEach items="${list}" var="branch">
					      <tr>
					        <td>${branch.br_num}</td>
					        <td>${branch.br_name}</td>
					        <td>${branch.br_phone}</td>
					        <td>
					        <form action="<c:url value='/branch/delete'/>" method="post">
					        <c:choose>
							    <c:when test="${user.me_authority == 'ADMIN' }">
							        <button class="btn btn-outline-danger btn-branch-delete">삭제</button>
							    </c:when>
							    <c:otherwise>
							    	<button type="button" class="btn btn-outline-danger btn-branch-delete btn-no-authority">삭제</button>
							    </c:otherwise>
							</c:choose>
					        <input type="hidden" name="br_num" value="${branch.br_num}">
					        </form>
					        </td>
					      </tr>
					    </c:forEach>
				    </tbody>
				</table>
			</c:when>
			<c:otherwise>
				<h2>등록된 지점이 없습니다.</h2>
			</c:otherwise>
		</c:choose>	
		<a href="<c:url value='/branch/insert'/>" class="btn btn-outline-success">지점 등록</a>
		<a href="/semi_project" class="btn btn-outline-success">메인으로</a>
	</div>
</body>
<script type="text/javascript">
	$('.btn-no-authority').click(function(){
		if ("${user == null || user.me_authority != 'ADMIN'}") {
			alert('권한이 없습니다.');
			location.href="/semi_project";
		}
	})
</script>
</html>