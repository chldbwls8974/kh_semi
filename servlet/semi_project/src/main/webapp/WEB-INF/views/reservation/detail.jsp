
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
  <h2>예약 상세 정보</h2>
 
   <table class="table table-hover mt-4">
    <label><b>'${user.me_id}'</b>회원님의 예약 상세 정보</label>	<br>
		<thead>
	      <tr>
	        <th>예약리스트 번호</th>
	        <th>이용 시작일	</th>
	        <th>이용 종료일	</th>
	        <th>반려동물 번호</th>
	        <th>반려동물 이름</th>
	        <th>방번호</th>
	        <th>예약번호</th>
	      </tr>
	    </thead>
	    <tbody>
	      <c:forEach items="${rl}" var="rl">
		      <tr>
			    <td>${rl.rl_num}</td>
				<td>
		      	<c:forEach items="${reservation}" var="reservation">
		      		<c:if test="${reservation.re_num eq rl.rl_re_num}">
						${reservation.re_date}
					</c:if>
				</c:forEach>
				</td>
				<td>
		      	<c:forEach items="${reservation}" var="reservation">
		      		<c:if test="${reservation.re_num eq rl.rl_re_num}">
						${reservation.re_end_date}
					</c:if>
				</c:forEach>
				</td>
		      	<td>${rl.rl_d_num}</td>
		      	<td>
		      	<c:forEach items="${Doglist}" var="dog">
				 	<c:if test="${dog.d_num eq rl.rl_d_num}">
                        ${dog.d_name}
                    </c:if>
				</c:forEach>
				</td>
		      	<td>${rl.rl_ro_num}</td>
		      	<td>${rl.rl_re_num}</td>
		      </tr>
		  </c:forEach>
		</tbody>     
	</table>
	<hr>
	<a class="btn btn-float-right btn-outline-success mt-1 col-3 " href="/semi_project/member/mypage" role="button">목록으로</a>
</div>
		
</body>
</html>
