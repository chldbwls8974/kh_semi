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
<title>회원 등급 기준액 변경</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
	<div class="container mt-5">
		<h3>회원 등급 기준액 변경</h3>
		<h5 class="mt-5">현재 등급 기준액은 <b>"${criteria.le_benefit }원"</b> 입니다.</h5>
		<form action="<c:url value='/member/level'/>" method="post" class="mt-4">
			<div class="form-group">
				<label>등급 기준액</label>
				<input type="hidden" value="${criteria.le_name }" name="grade">
				<input type="number" class="form-control" min="0" placeholder="${criteria.le_benefit }" name="level_cri" required>
			</div>
			<button class="btn btn-outline-success col-12">변경</button>
		</form>
	</div>
</body>
<script type="text/javascript">

	<% 
	Boolean result = (Boolean)request.getAttribute("Ok");
	if(result != null && result){
	%>
	alert('회원 등급 기준액 수정에 성공했습니다.');
	location.href="/semi_project/member/level";
	<% 
	}else if(result != null && !result){ %>
	alert('회원 등급 기준액 수정에 성공했습니다.')
	<%
	}
	%>
	
	if ('${user}' == null || '${user.me_authority}' != 'ADMIN') {
    	alert('권한이 없습니다.');
	    location.href="/semi_project";
    }
</script>

</html>