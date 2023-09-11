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
<title>객실 상세페이지</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
	
	<h3>객실 상세정보</h3>
	
	<c:if test="${room != null }">
		<div>객실 타입 : ${room.ro_name }</div>
		<div>객실 상세 정보 :${room.ro_detail }</div>
		<div>지점 번호 : ${branch.br_name}</div>
		<div>최대 수용 마리 수 : ${room.ro_max_cap}</div>	
	</c:if>
	
	<a href="<c:url value='/room/roommain${cri.currentUrl }'/>"><button>뒤로가기</button></a>
	<!-- 관리자만 보이게 수정필요 -->
	<a href="<c:url value='/room/plus/roomupdate?ro_num=${room.ro_num }'/>"><button>수정</button></a>
	<a href="<c:url value='/room/plus/roomdelete?ro_num=${room.ro_num }'/>"><button>삭제</button></a>
</body>
</html>