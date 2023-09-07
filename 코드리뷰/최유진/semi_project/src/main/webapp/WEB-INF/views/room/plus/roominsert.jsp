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
<title>방 추가하기</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
	
	<h3>방 추가하기</h3>
	<!-- 관리자만 등록 버튼 보이게 필요 -->
		<form action="" method="post">
			<input type="text" name="detail" placeholder="상세정보"> <br>
			<input type="text" name="name" placeholder="방이름"> <br>
			<button>등록</button>
		</form>
	<script>
		<% 
			Boolean result = (Boolean)request.getAttribute("ok");
			if(result != null && result){
		%>
			alert('게시글 등록 성공!');
			location.href = '<c:url value="/list"/>';
		<%
			}else if(result != null && !result){
		%>
			alert('게시글 등록 실패!')
		<%
			}
		%>
	</script>

</body>
</html>