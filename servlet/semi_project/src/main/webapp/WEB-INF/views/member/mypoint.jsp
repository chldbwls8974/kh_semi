<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<title>My Point</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>

	<div class="container mt-5">
		<h2><span style="color: olive; font-weight: bold;">포인트 내역</span></h2>
		<table class="table table-hover mt-4">
		<label><b style="color: olive;">'${user.me_id}'</b>회원님의 포인트 적립 내용</label>
		    <thead>
		      <tr style="background: wheat; font-weight: bold;">
		        <th>예약 번호</th>
		        <th>적립된 포인트</th>
		        <th>내용</th>
		      </tr>
		    </thead>
		    <tbody>
		      <c:forEach items="${list }" var="point">
			      <tr>
			      	<td>${point.po_re_num}</td>
			      	<td>${point.po_point}</td>
			      	<td>${point.po_content}</td>
			      </tr>
			  </c:forEach>
			</tbody>     
		</table>
	</div>
<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>			
</body>
</html>