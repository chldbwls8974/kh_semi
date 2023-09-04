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
	<h1>반려견 등록</h1>
 	<form action="<c:url value='/dog/insert'/>" method="post">
 		<div class = "form-group">
 			<label>아이디</label>
 			<input type="text" class="form-control" name="d_me_id" value="${user.me_id}" readonly>
 		</div>
 		<div class = "form-group">
 			<label>반려견 이름</label>
 			<input type="text" class="form-control" name="d_name">
 		</div>
 		<div class = "form-group">
 			<label>나이</label>
 			<input type="text" class="form-control" name="d_age">
 		</div>
 		<div class = "form-group">
 			<label>성별</label>
 			<input type="text" class="form-control" name="d_gen" placeholder="M or F">
 		</div>
 		<div class = "form-group">
 			<label>무게</label>
 			<input type="text" class="form-control" name="d_kg" placeholder="kg 제외하고 입력">
 		</div>
 		<div class = "form-group">
 			<label>특이사항</label>
 			<textarea rows="10" cols="20" class="form-control" name="d_detail"></textarea>
 		</div>
 		<button class="btn btn-outline-warning col-12">등록</button>
 	</form>	
</div>
	<script>
	   <% 
       Boolean result = (Boolean)request.getAttribute("Ok");
	   if(result != null && result){
    %>
       alert('반려견 등록 성공');
       location.href="/semi_project/dog/main";
    <% 
       }else if(result != null && !result){ %>
       alert('반려견 등록 실패')
    <%
       }
    %>
	</script>
</body>
</html>