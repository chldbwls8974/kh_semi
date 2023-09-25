<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제</title>
</head>
<body>
<script>
		<% 
			Boolean result = (Boolean)request.getAttribute("ok");
			if(result != null && result){
		%>
			alert('결제 성공!');
			location.href = '/semi_project/reservation/list';
		<%
			}else if(result != null && !result){
		%>
			alert('결제 실패!')
		<%
			}
		%>
		
	</script>
</body>
</html>