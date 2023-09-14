<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

  <style>
  /* Make the image fully responsive */
  .carousel-inner img {
    width: 100%;
    height: 100%;
  }
  </style>

<title>객실 상세페이지</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
	<div class="container mt-5">
	<h3>객실 상세정보</h3>
		<div class="card">
			<div class="card-body">
				<c:if test="${room != null }">
					<div>
						<img alt="room" src="./방1">
					</div>
					<div>객실 타입 : ${room.ro_name }</div>
					<div>객실 상세 정보 :${room.ro_detail }</div>
					<div>지점 번호 : ${branch.ro_br_name}</div>
					<div>최대 수용 마리 수 : ${room.ro_max_cap}</div>	
					<div>현재 수용 마리 수 : ${room.ro_now_cap}</div>
				</c:if>
			</div>
		</div>
		<a href="<c:url value='/room/main${cri.currentUrl }'/>" class="btn btn-outline-dark mt-2 btn-float-right">뒤로가기</a>
	</div>
	
	<!-- 회원만 보이게 -->
	<c:if test="${sessionScope.m_admin=='n'}">
		<div class="container">
			<a href="<c:url value='/reservation/main?ro_num=${room.ro_num }'/>" class="btn btn-outline-warning mt-2">예약하기</a>
		</div>
	</c:if>
	
	<!-- 관리자만 보이게 -->
	<c:if test="${sessionScope.m_admin=='y'}">
		<div class="container">
			<a href="<c:url value='/room/update?ro_num=${room.ro_num }'/>" class="btn btn-outline-warning mt-2">수정</a>
			<a href="<c:url value='/room/delete?ro_num=${room.ro_num }'/>" class="btn btn-outline-warning mt-2">삭제</a>
		</div>
	</c:if>	
</body>
</html>