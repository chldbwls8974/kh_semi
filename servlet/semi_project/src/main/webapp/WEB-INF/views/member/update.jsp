<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
<div class="container mt-5">
	<h1>개인정보 수정</h1>
	<form action="<c:url value='/member/update'/>" method="post" class="mt-4">	
 		<div class = "form-group">
 		 	<label>아이디</label>
			<div class="form-control">${user.me_id}</div>
 		</div>
 		<div class = "form-group">
 			<label>이름</label>
 			<input type="text" class="form-control" name="name" required>
 		</div>
 		<div class = "form-group">
 			<label>주소</label>
 			<input type="text" class="form-control" name="address" required>
 		</div>
 		<div class = "form-group">
 			<label>연락처</label>
 			<input type="number" maxlength="11" oninput="phoneLength(this);" class="form-control" name="phone" required>
 		</div>
 	
 		<button class="btn btn-outline-warning col-12">수정</button>
 	</form>	
 	<br><a href="<c:url value='/member/mypage'/>"  class="btn btn-outline-dark col-3 btn float-right">취소</a><br>
</div>
<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>	
</body>
<script>
	   <% 
       Boolean result = (Boolean)request.getAttribute("Ok");
	   if(result != null && result){
    %>
       alert('수정 성공');
       location.href="/semi_project/member/mypage";
    <% 
       }else if(result != null && !result){ %>
       alert('수정 실패');
    <%
       }
    %>
    
  	//전화번호 길이제한
    function phoneLength(e){
    	if(e.value.length > e.maxLength){
    		e.value = e.value.slice(0,e.maxLength);
    	}
    }
    
	</script>
</body>
</html>