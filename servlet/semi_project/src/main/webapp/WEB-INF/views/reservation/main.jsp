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
		
		<form action="<c:url value='/reservation/insert'/>" method="post" class="reserv-box">
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
				<label>지점을 선택해주세요</label>
				<select class="form-control" name="branchSelect">
					<option value="0">지점 선택</option>
					<c:forEach items="${branchList }" var="br">
						<option value="${br.br_num }">${br.br_name }</option>
					</c:forEach>
				</select>
			</div>
			<div class="form-group">
				<label>맡기고자 하는 개를 선택해주세요</label>
				<select class="form-control" name="dogSelect">
					<option value="0">반려동물 선택</option>
					<c:forEach items="${dogList }" var="dog">
						<option value="${dog.d_si_name }">${dog.d_name }</option>
					</c:forEach>
				</select>
			</div>
		
			<div class="form-group">
				<label>예약하고자 하는 방을 선택해주세요</label>
				<select class="form-control" name="roomSelect">
					<option value="0">방 선택</option>
					<!-- room.ro_br_num == br.br_num -->
					<c:forEach items="${roomList }" var="room">
						<option value="${room.ro_detail }">${room.ro_name }</option>
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
	function ajaxJsonToJson(async, type, url, sendObject, successFunc){
		$.ajax({
			async : async, 
			type : type, 
			url : '<c:url value="/"/>'+url, 
			data : JSON.stringify(sendObject), 
			contentType : "application/json; charset=UTF-8", 
			dataType : "json",
			success : successFunc
		});
	}
// 	$('[name=roomSelect]').click(function(){
//  		let d_si_name = $('[name=dogSelect]').val();
//  		let br_num = $('[name=branchSelect]').val();
//  		let data = {
//  				d_si_name :  d_si_name,
//  				br_num : br_num
//  		}
//  		console.log(data);
// 	});
	$('[name=roomSelect]').click(function(){
		/* 개 size */
		let d_si_name = $('[name=dogSelect]').val();
		/* 지점번호 */
 		let br_num = $('[name=branchSelect]').val();
		let data = {
 				"d_si_name" :  d_si_name,
 				"br_num" : br_num
		}
 		console.log(data);
		ajaxJsonToJson(false, 'post','/reservation/main', data, (data)=>{
			console.log(data);
			console.log(data);
		});
	});
</script>


</body>
</html>