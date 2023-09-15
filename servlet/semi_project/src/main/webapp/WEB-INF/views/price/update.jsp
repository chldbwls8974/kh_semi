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
<title>가격 변경</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
	<div class="container mt-5">
	<h2>가격 변경</h2>
 	<form action="<c:url value='/price/update'/>" method="post" class="mt-4">
 		<div class = "form-group">
 			<label>소형견 가격</label>
 			<input type="text" class="form-control" name="pr_price_s" placeholder="${sPrice.pr_price }"  required >
 		</div>
 		<div class = "form-group">
 			<label>중형견 가격</label>
 			<input type="text" class="form-control" name="pr_price_m" placeholder="${mPrice.pr_price }"  required>
 		</div>
 		<div class = "form-group">
 			<label>대형견 가격</label>
 			<input type="text" class="form-control" name="pr_price_l" placeholder="${lPrice.pr_price }" required>
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