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
<title>등급혜택 변경</title>
</head>
<body>
	<div class="container">
	<h1>등급혜택 변경</h1>
 	<form action="<c:url value='/level/update'/>" method="post">
 		<div class = "form-group">
 			<label>일반회원 적립률</label>
 			<input type="text" class="form-control" name="le_benefit"  placeholder="% 제외하고 입력" required>
 		</div>
 		<div class = "form-group">
 			<label>vip회원 적립률</label>
 			<input type="text" class="form-control" name="le_benefit_vip" placeholder="% 제외하고 입력" required >
 		</div>
 		<button class="btn btn-outline-warning col-12">변경</button>
 	</form>	
</div>
	<script>
	   <% 
       Boolean result = (Boolean)request.getAttribute("Ok");
	   if(result != null && result){
    %>
       alert('변경 성공');
       location.href="/semi_project";
    <% 
       }else if(result != null && !result){ %>
       alert('변경 실패');
    <%
       }
    %>
	</script>
</body>
</html>