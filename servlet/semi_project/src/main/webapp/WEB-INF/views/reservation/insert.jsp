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
<title>pay</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
	<div class="container mt-5">
	<h2>결제</h2>
		<form action="<c:url value='/reservation/pay'/>" method="post" class="mt-4">
			<input type="hidden" class="form-control" name="me_level" value="${user.me_le_name }">
			<input type="hidden" class="form-control" name="me_id" value="${user.me_id }">
			<input type="hidden" class="form-control" name="re_num" value="${reserv.re_num}">
			<div class="form-group">
				<label>총 결제 금액</label>
				<input type="text" class="form-control" name="re_price" value="${reserv.re_price }" readonly>
			</div>
			<div class="form-group">
				<label>내 포인트</label>
				<input type="text" class="form-control" name="me_point" value="${user.me_point }" readonly>
			</div>
			<div class="form-group">
				<label>사용할 포인트 내역</label>
				<input type="text" class="form-control" name="re_use_point">
			</div>
			<div class="form-group">
				<button class="btn btn-use btn-outline-dark col-12" type="button">사용</button>
			</div>
			<div class="form-group">
				<label>적립 예정 포인트</label>
				<input type="text" class="form-control" name="re_add_point" value="0" readonly>
			</div>
			<hr>
			<div class="form-group">
				<label>결제 예정 금액</label>
				<input type="text" class="form-control" name="re_real_price" value="${reserv.re_price }" readonly>
			</div>
			
			<button class="btn btn-pay btn-outline-success col-12">결제하기</button>
		</form>
	</div>
<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>	

<script type="text/javascript">
	$(document).on('click','.btn-use',function(){
		let level = $('[name=me_level]').val()
		let per = level=='일반'? 0.05: 0.1;
		let price = $('[name=re_price]').val() - $('[name=re_use_point]').val()
		let point = (price)*per
		
		$('[name=re_real_price]').attr("value",price);
		$('[name=re_add_point]').attr("value",point);
	})
	
	

</script>
<script type="text/javascript">
</script>
</body>
</html>