<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<title>My page</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>

<div class="container mt-5">
  <h2>마이 페이지</h2>
  <div class="card mt-4">
    <div class="card-body d-flex flex-column mb-5">
    	<label>아이디</label>
    	<div class="pb-3">${user.me_id }</div>
    	<label>등급</label>
    	<div class="pb-3">${user.me_le_name }</div>
    	<label>이름</label>
    	<div class="pb-3">${user.me_name }</div>
    	<label>주소</label>
    	<div class="pb-3">${user.me_address}</div>
    	<label>연락처</label>
    	<div class="pb-3">${user.me_phone}</div>
    	<label>포인트</label>
    	<div class="pb-3">${user.me_point}</div>
    	<hr>
    	<label>나의 반려견</label>
    	<div class="pb-3">
    		<table class="table table-bordered mt-1">
				<thead>
					<tr>
						<th>반려견 번호</th>
						<th>이름</th>
						<th>나이</th>
						<th>성별</th>
						<th>무게(kg)</th>
						<th>특이사항</th>
						<th>크기</th>
					</tr>
				</thead>
					<c:forEach items="${list}" var="dog">
						<tr>
							<td>${dog.d_num }</td>
							<td>${dog.d_name}</td>
							<td>${dog.d_age}</td>
							<td>${dog.d_gen}</td>
							<td>${dog.d_kg}</td>
							<td>${dog.d_detail}</td>
							<td>${dog.d_si_name }</td>
						</tr>
					</c:forEach>
			</table>
    	</div>
    	<a class="btn btn-float-righ btn-outline-success col-5 t" href="/semi_project/member/update" role="button">개인정보 수정</a>
    	<!-- 개 등록 버튼 -->
    	<c:choose>
		    <c:when test="${fn:length(list) < 3 }">
		   		<!-- 3마리 이하인 경우 -->
		   		<a href="<c:url value='/dog/insert'/>" class="btn btn-float-right btn-outline-success mt-2 col-5">반려견 등록</a>
		    </c:when>
		    <c:otherwise>
				 <!-- 3마리 이상인 경우 -->
				 <a href="<c:url value='/member/mypage'/>" class="btn btn-float-right btn-outline-success mt-2 col-5" id="btnAdd">반려견 등록</a>
				 <script type="text/javascript">
				 	$("#btnAdd").click(function(){
					 	alert('반려견은 3마리 까지 등록할 수 있습니다.');
				 	})
				 </script>
		    </c:otherwise>
		</c:choose>
		
    	<a class="btn btn-float-right btn-outline-success mt-2 col-5 " href="/semi_project/member/reservation" role="button">내 예약정보 보기</a>
    	
	
    </div>
  </div>
</div>

<script type="text/javascript">
	let totalPoint = 0;
	
	 function autoPoint() {
		 
	 }
</script>
</body>
</html>