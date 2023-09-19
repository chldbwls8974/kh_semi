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
	
	<div class="container mt-5">
		<h2>포인트 적립내용 추가</h2>
		<form action="<c:url value='/point/insert'/>" method="post" class="mt-4">
		 	<div class = "form-group">
				<label>포인트</label>
				<input type="text" class="form-control" name="po_point" placeholder="포인트">
			</div>
			<div class = "form-group">
				<label>포인트 내용</label>
				<input type="text" class="form-control" name="po_content" placeholder="내용">
			</div>
			<div class = "form-group">
				<label>적립대상자</label>
				<input type="text" class="form-control" name="po_me_id" placeholder="적립대상자">
			</div>
	 		<button class="btn btn-outline-warning col-12 mt-2">등록</button>
	 	</form>	
 	</div>
 	<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>	
	<script>
		<% 
			Boolean result = (Boolean)request.getAttribute("ok");
			if(result != null && result){
		%>
			alert('포인드 등록 성공!');
			location.href = '<c:url value="/point/main"/>';
		<%
			}else if(result != null && !result){
		%>
			alert('포인트등록 실패!')
		<%
			}
		%>
		
		if ('${user}' == null || '${user.me_authority}' != 'ADMIN') {
	    	alert('권한이 없습니다.');
		    location.href="/semi_project";
	    }
	</script>
</body>
</html>