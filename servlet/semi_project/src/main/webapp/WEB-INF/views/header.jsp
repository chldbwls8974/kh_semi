<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
	<script type="text/javascript">
	function ajaxJsonToJson(async, type, url, sendObject, successFunc){
		$.ajax({
			async : async, 
			type : type, 
			url : url, 
			data : JSON.stringify(sendObject), 
			contentType : "application/json; charset=UTF-8", 
			dataType : "json",
			success : successFunc,
			error : function(a,b,c){
				console.log(a);
				console.log(b);
				console.log(c)
			}
		});
	}
	function ajaxObjectToJson(async, type, url, sendObject, successFunc){
		$.ajax({
			async : async, 
			type : type, 
			url : url, 
			data : sendObject, 
			dataType : "json",
			success : successFunc,
			error : function(a,b,c){
				console.log(a);
				console.log(b);
				console.log(c)
			}
		});
	}
	
	function ajaxObjectToJson2(async, type, url, sendObject, successFunc){
		$.ajax({
			async : async, 
			type : type, 
			url : url, 
			data : sendObject, 
			//dataType : "json",
			success : successFunc,
			error : function(a,b,c){
				console.log(a);
				console.log(b);
				console.log(c)
			}
		});
	}
	</script>
<style>
  /* 사진 크기 */
  .carousel-inner img {
    width: 100%;
    height: 100%;
  }
  
  .a{
  }
  
  	input::-webkit-outer-spin-button,
	input::-webkit-inner-spin-button {
	  -webkit-appearance: none;
	  margin: 0;
	}
  </style>
<title>header</title>
</head>
<body>



	<nav class="navbar navbar-expand-sm navbar-light bg-light">
	  <!-- Brand/logo -->
	    <a class="navbar-brand" href="/semi_project" style=""><span style="color: olive; font-weight: bold;">DogHotel</span></a>
	  
	  <!-- Links -->
	  <div class="collapse navbar-collapse justify-content-between">
	  	<ul class="navbar-nav text-darkgray">
			<c:if test="${user == null }">
			    <li class="nav-item">
			      <a class="nav-link" href="/semi_project/member/login">로그인</a>
			    </li>
			    <li class="nav-item">
			      <a class="nav-link" href="/semi_project/member/signup">회원가입</a>
			    </li>
			 	<li class="nav-item">
			      <a class="nav-link" href="/semi_project/room/main">객실 보기</a>
			    </li>
			</c:if>
			<c:if test="${user != null  && user.me_authority == 'USER'}">
			  	<li class="nav-item">
			      <a class="nav-link" href="/semi_project/dog/list">반려견 등록</a>
			    </li>
			    <li class="nav-item">
			      <a class="nav-link" href="/semi_project/room/main">객실 보기</a>
			    </li>
			    <li class="nav-item">
			      <a class="nav-link" href="/semi_project/reservation/main">예약하기</a>
			    </li>
			</c:if>
		  
	 	</ul>
	 	<ul class="navbar-nav">  
	 		<c:if test="${user != null }">
		 		<li class="nav-item">
			      <a class="nav-link"><span style="color: olive; font-weight: bold;">${user.me_id }</span>님 환영합니다</a>
			    </li>
	 		</c:if>
		    <c:if test="${user != null  && user.me_authority == 'USER' }">
			    <li class="nav-item">
			      <a class="nav-link" href="/semi_project/member/mypage">마이페이지</a>
			    </li>
			</c:if>   
			<c:if test="${user != null }">
			     <li class="nav-item">
			      <a class="nav-link" href="/semi_project/member/logout">로그아웃</a>
			    </li>
		    </c:if> 
	   		<c:if test="${user != null && user.me_authority == 'ADMIN'}">
			    <li class="nav-item">
			      <a class="nav-link" href="/semi_project/admin">관리자 권한</a>
			    </li>
	   		</c:if>
		 </ul>
	  </div>	
	  
	  
	</nav>
</body>
</html>