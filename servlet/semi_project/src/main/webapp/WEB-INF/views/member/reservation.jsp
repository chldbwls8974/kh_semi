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
<title>내 예약정보 보기</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>

<div class="container mt-5">
  <h2>나의 예약 정보</h2>
  <div class="card mt-4">
<%--   ${list} --%>
    <div class="card-body d-flex flex-column mb-5">
    		<table class="table table-bordered mt-1">
				<thead>
					<tr>
						<th>예약 번호</th>
						<th>이용 시작일</th>
						<th>이용 종료일</th>
						<th>실 결제 금액</th>

					</tr>
				</thead>
					<c:forEach items="${list}" var="reservation">
						<tr>
							<td>${reservation.re_num}</td>
							<td>${reservation.re_s_count}</td>
							<td>${reservation.re_m_count}</td>
							<td>${reservation.re_real_price}</td>
						</tr>
					</c:forEach>
			</table>
    	</div>
    	<a class="btn btn-float-right btn-outline-dark mt-2 col-5 " href="/semi_project/member/mypage" role="button">뒤로가기</a>
    </div>
</div>

</body>
</html>