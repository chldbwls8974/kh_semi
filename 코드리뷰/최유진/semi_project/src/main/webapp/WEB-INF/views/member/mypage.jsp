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

<div class="container">
  <h2>마이 페이지</h2>
  <div class="card">
    <div class="card-body d-flex flex-column mb-5">
    	<label>아이디</label>
    	<div class="pb-3">${user.me_id }</div>
    	<label>이름</label>
    	<div class="pb-3">${user.me_name }</div>
    	<label>주소</label>
    	<div class="pb-3">${user.me_address}</div>
    	<label>연락처</label>
    	<div class="pb-3">${user.me_phone}</div>
    	<label>포인트</label>
    	<div class="pb-3">${user.me_point}</div>
    	<button class="btn btn-outline-success col-3 float-left">개인정보수정</button>
    </div>
  </div>
</div>
</body>
</html>