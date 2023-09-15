<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
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
						<img src="<c:url value='/resources/images/room.jpg'/>" alt="방1" width="800"/>
					</div>
					<div>객실 이름 : ${room.ro_name }</div>
					<div>객실 타입 :${room.ro_detail }</div>
					<div>지점명 : ${branch.br_name}</div>
					<div>최대 수용 마리 수 : ${room.ro_max_cap}</div>	
					<div>현재 수용 마리 수 : ${room.ro_now_cap}</div>
				</c:if>
			</div>
		</div>
		<a href="<c:url value='/room/main${cri.currentUrl }'/>" class="btn btn-outline-dark mt-2 btn-float-right">뒤로가기</a>
		<!-- 회원만 보이게 -->
		<c:if test="${sessionScope.user != null}">
			<a href="<c:url value='/reservation/main?ro_num=${room.ro_num }'/>" class="btn btn-outline-dark mt-2">예약하기</a>
		</c:if>
	</div>
	
	<div class="container">
		<a href="<c:url value='/room/update?ro_num=${room.ro_num }'/>" class="btn btn-outline-warning mt-2">수정</a>
	</div>
	<form action="<c:url value='/room/delete'/>" method="post">
		 <button class="btn btn-outline-danger btn-room-delete">삭제</button>
		 <input type="hidden" name="ro_num" value="${room.ro_num}">
	</form>	
	
	
	<script type="text/javascript">
		$(function(){
			$('#btn-delete').on("click", function(){
				if(confirm('삭제하시겠습니까?')){
					form.action='/room/main';
					form.submit();
				}
			})
		});
	</script>
		
</body>
</html>