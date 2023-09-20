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
<title>로그인</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
<div class="container mt-5">
	<h2>로그인</h2>
 	<form action="<c:url value='/member/login'/>" method="post" class="mt-4">
 		<div class = "form-group">
 			<label>아이디</label>
 			<input type="text" class="form-control" name="me_id" required>
 		</div>
 		<div class = "form-group">
 			<label>비번</label>
 			<input type="password" class="form-control" name="me_pw" required>
 		</div>
 	
 		<button class="btn btn-outline-warning col-12">로그인</button>
 	</form>	
 	<br><button class="btn btn-outline-dark col-3 btn float-right" id="btnCancel">취소</button><br>
</div>
<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>	
</body>
<script>
	   <% 
       Boolean result = (Boolean)request.getAttribute("Ok");
	   if(result != null && result){
    %>
       alert('로그인 성공');
       location.href="/semi_project";
    <% 
       }else if(result != null && !result){ %>
       alert('로그인 실패')
    <%
       }
    %>
</script>
</html>