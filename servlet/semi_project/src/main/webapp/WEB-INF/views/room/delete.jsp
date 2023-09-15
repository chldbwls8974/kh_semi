<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<script type="text/javascript">
	<% 
	Boolean result = (Boolean)request.getAttribute("ok");
	if(result != null && result){
	%>
	alert('객실 삭제에 성공했습니다.');
	location.href="/semi_project/room/main";
	<% 
	}else if(result != null && !result){ %>
	alert('객실 삭제에 실패했습니다.')
	<%
	}
	%>
</script>
	
</body>
</html>