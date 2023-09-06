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
	<h3>포인트 적립내용 추가</h3>
	<form action="" method="post">
			<input type="text" name="po_point" placeholder="포인트"> <br>
			<input type="text" name="po_content" placeholder="내용"> <br>
			<input type="text" name="po_me_id" placeholder="적립대상자"> <br>
			<button>등록</button>
		</form>
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
	</script>
</body>
</html>