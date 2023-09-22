<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<title>반려견 정보 수정</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
	<div class="container mt-5">
		<h2>반려견 정보 수정</h2>
			<form action="<c:url value='/dog/update'/>" method="post" class="mt-4">	
		 		<div class = "form-group">
		 		 	<label>견주ID</label>
					<div class="form-control">${user.me_id}</div>
		 		</div>
		 		<input type="hidden" name="d_num" value="${dog.d_num}">		

		 		<div class = "form-group">
		 			<label>반려견 이름</label>
		 			<input type="text" class="form-control" name="d_name" required >
		 		</div>
		 		<div class = "form-group">
		 			<label>나이</label>
		 			<input type="number" class="form-control" name="d_age"   min="1" required >
		 		</div>
		 		<div class="form-group">
					<label>성별</label>
					<select class="form-control" id="doggen" name="d_gen">
						<option>M</option>
						<option>F</option>
					</select>
				</div>
		 		<div class = "form-group">
		 			<label>무게</label>
		 			<input type="number" class="form-control" name="d_kg" placeholder="kg 제외하고 입력"  min="1" required>
		 		</div>
		 		<div class = "form-group">
		 			<label>특이사항</label>
		 			<textarea rows="10" cols="20" class="form-control" name="d_detail"></textarea>
		 		</div>
		 		<br><button class="btn btn-outline-warning col-12">수정</button><br>		 		
		 	</form>	
	 	<br><a href="<c:url value='/dog/list'/>"  class="btn btn-outline-dark col-3 btn float-right">취소</a><br>
	</div>
	<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>	
<%--  ${dog} --%>
</body>
	<script>
	   <% 
       Boolean result = (Boolean)request.getAttribute("Ok");
	   if(result != null && result){
	    %>
	       alert('수정 성공');
	       location.href="/semi_project/dog/list";
	    <% 
	       }else if(result != null && !result){ %>
	       alert('수정 실패');
	    <%
	       }
	    %>
	</script>
</html>