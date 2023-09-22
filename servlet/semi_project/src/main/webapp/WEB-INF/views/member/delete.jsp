<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 삭제</title>
</head>
<body>

</body>
<script>

<% 
	Boolean result = (Boolean)request.getAttribute("ok");
	if(result != null && result){
%>
	alert('회원 삭제에 성공했습니다.');
	location.href='/semi_project/member/list';
<% 
	}else if(result != null && !result){ %>
	alert('회원 삭제에 실패했습니다.')
<%
	}
%>

</script>
</html>