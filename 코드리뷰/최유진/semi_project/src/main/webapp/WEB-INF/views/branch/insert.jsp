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
<title>지점 등록</title>
</head>
<body>
	<div class="container">
	<h1>지점 등록</h1>
<<<<<<< HEAD:코드리뷰/최유진/semi_project/src/main/webapp/WEB-INF/views/branch/insert.jsp
	<%-- <form action = "" method="post">
		<input type="text" name="name" placeholder="지점명"> <br>
		<input type="text" name="phone" placeholder="전화번호"> <br>
		<button>등록</button>
	</form>
	<script>
		<% 
			Boolean result = (Boolean)request.getAttribute("ok");
			if(result != null && result){
		%>
			alert('지점등록 성공!')
		<%
			}else if(result != null && !result){
		%>
			alert('지점등록 실패!')
		<%
			}
		%>
	</script> --%>
=======
	<form action="<c:url value='/views/insert'/>" method="post">
	 	<div class = "form-group">
			<label>지점명</label>
			<input type="text" class="form-control" name="br_name">
		</div>
		<div class = "form-group">
			<label>전화번호</label>
			<input type="text" class="form-control" name="br_phone">
		</div>
 		<button class="btn btn-outline-warning col-12">등록</button>
 	</form>	
 	<br><button class="btn btn-outline-dark col-3 btn float-right" id="btnCancel">취소</button><br>
</div>
	<script>
		 <% 
	       Boolean result = (Boolean)request.getAttribute("ok");
		   if(result != null && result){
	    %>
	       alert('지점등록 성공!');
	       location.href="/semi_project";
	    <% 	
	       }else if(result != null && !result){ %>
	       alert('지점등록 실패!'')
	    <%
	       }
	    %>
	</script>
</body>
</html>