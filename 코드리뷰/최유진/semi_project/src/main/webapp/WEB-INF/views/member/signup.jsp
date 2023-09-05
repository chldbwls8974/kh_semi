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
<div class="container">
	<h1>회원가입</h1>
 	<form action="<c:url value='/member/signup'/>" method="post">
 		<div class = "form-group">
 			<label>아이디</label>
 			<input type="text" class="form-control" name="me_id">
 		</div>
 		<div class = "form-group">
 			<label>비번</label>
 			<input type="password" class="form-control" name="me_pw">
 		</div>
 		<div class = "form-group">
 			<label>성함</label>
 			<input type="text" class="form-control" name="me_name">
 		</div>
 		<div class = "form-group">
 			<label>주소</label>
 			<input type="text" class="form-control" name="me_address">
 		</div>
 		<div class = "form-group">
 			<label>핸드폰 번호</label>
 			<input type="text" class="form-control" name="me_phone">
 		</div>
 		<button class="btn btn-outline-warning col-12">회원가입</button>
 	</form>	
</div>
	<script>
	   <% 
       Boolean result = (Boolean)request.getAttribute("Ok");
	   if(result != null && result){
    %>
       alert('회원가입 성공');
       location.href="/semi_project";
    <% 
       }else if(result != null && !result){ %>
       alert('회원가입 실패')
    <%
       }
    %>
	</script>

</body>
</html>