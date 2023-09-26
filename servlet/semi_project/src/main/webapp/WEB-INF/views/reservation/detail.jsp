
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<title>예약 상세 정보</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>

	<div class="container mt-5">
		<h2>예약 상세 정보</h2>
		<c:if test="${user.me_authority =='USER'}">
			<label><b>'${user.me_id}'</b>회원님의 예약 상세 정보</label>
		</c:if>
		<table class="table table-hover mt-4">

			<br>
			<thead>
				<tr>
				<c:if test="${user.me_authority=='ADMIN'}"><th>예약자</th></c:if>
					<th>예약번호</th>
					<th>반려견 번호</th>
					<th>반려견 이름</th>
					<th>객실 번호</th>
					<th>이용 시작일</th>
					<th>이용 종료일</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${rl}" var="rl">
					<tr>
						<c:if test="${user.me_authority=='ADMIN'}"><td>${rl.re_me_id}</td></c:if>
						<td>${rl.rl_re_num}</td>



						<td>${rl.rl_d_num}</td>
						<td><c:forEach items="${Doglist}" var="dog">
								<c:if test="${dog.d_num eq rl.rl_d_num}">
                        ${dog.d_name}
                    </c:if>
							</c:forEach></td>
						<td>${rl.ro_name}</td>
						<td><c:forEach items="${reservation}" var="reservation">
								<c:if test="${reservation.re_num eq rl.rl_re_num}">
						${reservation.re_date}
					</c:if>
							</c:forEach></td>

						<td><c:forEach items="${reservation}" var="reservation">
								<c:if test="${reservation.re_num eq rl.rl_re_num}">
						${reservation.re_end_date}
					</c:if>
							</c:forEach></td>



					</tr>
				</c:forEach>
			</tbody>
		</table>
		<hr>
		<a class="btn btn-float-right btn-outline-dark mt-1 col-3 "
			href="/semi_project/reservation/list" role="button">목록으로</a>
		<c:if test="${rl.get(0).re_state eq '미완료'}">
			<form action="<c:url value='/reservation/insert'/>" method="get"
				class="mt-2">
				<input type="hidden" value="${rl.get(0).rl_re_num }" name="re_num">
				<c:if test="${user.me_authority =='USER'}">
					<button class="form-control btn btn-outline-dark col-3">결제하기</button>
				</c:if>
			</form>
		</c:if>
	</div>

</body>
</html>
