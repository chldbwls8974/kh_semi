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
		<h3>객실 수정</h3>
			<form action="<c:url value='/room/update'/>" method="post" class="mt-4">
				<input type="hidden" name="ro_num" value="${room.ro_num }">
				<div class="form-group">
					<label>지점번호</label>
					<input type="text" class="form-control" name="ro_br_num" value="${room.ro_br_num }"  readonly>
				</div>
				<div class="form-group">
					<label>객실명</label>
					<input type="text" class="form-control" name="ro_name">
				</div>
				<div class="form-group">
					<label>최대 수용 마리 수</label>
					<input type="text" class="form-control" name="ro_max_cap" placeholder="숫자를 입력하세요.">
				</div>
				<div class="form-group">
					<label>현재 수용 마리 수</label>
					<input type="text" class="form-control" name="ro_now_cap" placeholder="숫자를 입력하세요.">
				</div>
				<div class="form-group">
					<label>객실 타입</label>
					<input type="text" class="form-control" name="ro_detail" placeholder="S,M,L 중 하나만 입력하세요.">
				</div>
				<button class="btn btn-outline-success">등록</button>
			</form>
	</div>
<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>	
<script type="text/javascript">

	<% 
	Boolean result = (Boolean)request.getAttribute("ok");
	if(result != null && result){
	%>
	alert('객실 수정에 성공했습니다.');
	location.href="/semi_project/room/main";
	<% 
	}else if(result != null && !result){ %>
	alert('객실 수정에 실패했습니다.')
	<%
	}
	%>
	
	if ("${user == null || user.me_authority != 'ADMIN'}") {
    	alert('권한이 없습니다.');
	    location.href="/semi_project";
    }
</script>

</body>
</html>