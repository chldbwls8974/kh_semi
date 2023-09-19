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
<title>객실등록</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
	<div class="container mt-5">
		<h3>방 추가하기</h3>
	<!-- 관리자만 등록 버튼 보이게 필요 -->
		<form action="<c:url value='/room/insert'/>" id="frm" method="post" class="mt-4">
			<div class="form-group">
				<label>지점번호</label>
				<select class="form-control" name="branch">
					<option value="0">지점 선택</option>
					<c:forEach items="${branchList }" var="br">
						<option value="${br.br_num }">${br.br_name }</option>
					</c:forEach>
				</select>
			</div>
			<div class="form-group">
				<label>방이름</label>
				<input type="text" class="form-control" name="name" placeholder="방이름">
			</div>
			<div class="form-group">
				<label>최대 수용 마리수</label>
				<input type="text" class="form-control" name="max_cap" placeholder="숫자만 입력하시오.">
			</div>
			<div class="form-group">
				<label>객실 타입</label>
				<input type="text" class="form-control" name="detail" placeholder="객실 타입(S / M / L)">
			</div>
			
			<button class="btn btn-outline-warning col-12">등록</button>
			
		
<!-- 		<input type="button" id="add" value="등록">	 -->
		</form>
	</div>
<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>		
	<script>
	
		<% 
			Boolean result = (Boolean)request.getAttribute("ok");
			if(result != null && result){
		%>
			alert('방 등록 성공');
			location.href = '/semi_project/room/main';
		<%
			}else if(result != null && !result){
		%>
			alert('방 등록 실패')
		<%
			}
		%>
		
		if ('${user}' == null || '${user.me_authority}' != 'ADMIN') {
	    	alert('권한이 없습니다.');
		    location.href="/semi_project";
	    }
	</script>

</body>
</html>
