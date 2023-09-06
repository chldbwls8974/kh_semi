<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방 추가하기</title>
</head>
<body>
	
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