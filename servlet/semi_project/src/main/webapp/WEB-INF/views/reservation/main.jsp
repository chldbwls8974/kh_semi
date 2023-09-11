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
		<h2>예약하기</h2>
		
		<form action="<c:url value='/reservation/insert'/>">
			<input type="hidden" class="form-control" name="re_me_id" value="${user.me_id }">
			<!-- 날짜 입력은 데이터피커로 받을 것 -->
			<div class="form-group">
				<label>호텔 이용 시작 날짜</label>
				<input type="text" id="datePicker" class="form-control" name="re_date"> 
			</div>
			<div class="form-group">
				<label>이용기간</label>
				<input type="text" class="form-control" name="re_stay" placeholder="ex)3박4일 이용하시면 4 라고 입력해주세요"> 
			</div>
			<div class="form-group">
				<label>맡기고자 하는 개를 선택해주세요</label>
				<select class="form-control dogSelect">
					<option value="0">반려동물 선택</option>
					<c:forEach items="${dogList }" var="dog">
						<option value="${dog.d_si_name }">${dog.d_name }</option>
					</c:forEach>
				</select>
			</div>
			<div class="form-group">
				<label>예약하고자 하는 방을 선택해주세요</label>
				<select class="form-control">
					<c:forEach items="${roomList }" var="room">
						<option value="${room.ro_num }">${room.ro_name }</option>
					</c:forEach>
				</select>
			</div>
			<div class="form-group">
				<input type="button" class="btn btn-add btn-outline-warning col-12" value="+">
			</div>
			<button class="btn btn-float-right btn-outline-success col-3  mt-2">확인</button>
		</form>
	</div>
	
	<script type="text/javascript">
		$('.dogSelect').change(function(){
			let dSize=$(this).val();
			console.log(dSize);
		});
		
	
	
	
	
	
	
	
	
	
	
	
	
		$('.btn-add').click(function(){
			let add =
				`
				<hr class="my-5 w-65">
				<div class="form-group">
				<label>맡기고자 하는 개를 선택해주세요</label>
				<select class="form-control">
					<c:forEach items="${dogList }" var="dog">
						<option value="${dog.d_num }">${dog.d_name }</option>
					</c:forEach>
				</select>
			</div>
			<div class="form-group">
				<label>예약하고자 하는 방을 선택해주세요</label>
				<select class="form-control">
					<c:forEach items="${roomList }" var="room">
						<option value="${room.ro_num }" <c:if test="${dog.d_si_name}==${room.ro_detail } ">selected</c:if>>${room.ro_name }</option>
					</c:forEach>
				</select>
			</div>`;
			$(this).before(add);
		});
	</script>


</body>
</html>