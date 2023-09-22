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
* {box-sizing:border-box}

  html,
  body {
        width: 100%;
        height: 100%;
        margin: 0;
   }
 .container{
 	position: relative;
 	box-sizing: border-box;
 	margin-top: 20px;
 }

/* Slideshow container */
.slideshow-container {
  max-width: 100%;
  position: relative;
  margin: auto;
}
.carousel-item img{
  	width : 100%;
  	height : 600px;
  	max-height: 850px;
  	object-fit: cover;
}
.text-box{
	margin-top: 50px;
	margin-left: 20px;
	line-height: 30px;
	border-bottom: solid 1px silver;
}
.text-box h3{
	margin-bottom: 20px;
	border-bottom: solid 1px silver;
}
form{
	text-align: center;
}

  </style>

<title>객실 상세정보</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>

 <div class="container">
	<div id="demo" class="carousel slide" data-ride="carousel">
		
		  <!-- The slideshow -->
		 <div class="container container-box">
		  <div class="container carousel-inner">
		    <div class="carousel-item active">
		      	<img src="<c:url value='/resources/images/imge1.jpg'/>" alt="사진">
		    </div>
		    <div class="carousel-item">
		    	<img src="<c:url value='/resources/images/imge2.jpg'/>" alt="사진">
		    </div>
		    <div class="carousel-item">
		    	<img src="<c:url value='/resources/images/imge3.jpg'/>" alt="사진">
		    </div>
		  <!-- Indicators -->
		  <ul class="carousel-indicators">
		    <li data-target="#demo" data-slide-to="0" class="active"></li>
		    <li data-target="#demo" data-slide-to="1"></li>
		    <li data-target="#demo" data-slide-to="2"></li>
		  </ul>
		  </div>
		  <div class="text-box">
		  	<h3><span style="color: olive; font-weight: bold;">객실 상세정보</span></h3>
			<br>
			<c:if test="${room != null }">
				<p>객실 이름 : ${room.ro_name }</p>
				<p>객실 타입 : ${room.ro_detail }</p>
				<p>지점명 : ${branch.br_name}</p>
				<p>최대 수용 마리 수 : ${room.ro_max_cap}</p>	
				<p>현재 수용 마리 수 : ${room.ro_now_cap}</p>
			</c:if>
		  </div>
		</div>
		  <!-- Left and right controls -->
		  <a class="carousel-control-prev" href="#demo" data-slide="prev">
		    <span class="carousel-control-prev-icon"></span>
		  </a>
		  <a class="carousel-control-next" href="#demo" data-slide="next">
		    <span class="carousel-control-next-icon"></span>
		  </a>
	</div>
		<form>
			<a href="<c:url value='/room/main${cri.currentUrl }'/>" class="btn btn-outline-dark mt-2">뒤로가기</a>
			<a href="<c:url value='/reservation/main?ro_num=${room.ro_num }'/>" class="btn btn-outline-dark mt-2">예약하기</a>	
		</form>
 </div>
	
	<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>	
	<script type="text/javascript">
		$(function(){
			$('#btn-delete').on("click", function(){
				if(confirm('삭제하시겠습니까?')){
					form.action='/room/main';
					form.submit();
				}
			})
		});
		
		let slideIndex = 1;
		showSlides(slideIndex);

		// Next/previous controls
		function plusSlides(n) {
		  showSlides(slideIndex += n);
		}

		// Thumbnail image controls
		function currentSlide(n) {
		  showSlides(slideIndex = n);
		}

		function showSlides(n) {
		  let i;
		  let slides = document.getElementsByClassName("mySlides");
		  let dots = document.getElementsByClassName("dot");
		  if (n > slides.length) {slideIndex = 1}
		  if (n < 1) {slideIndex = slides.length}
		  for (i = 0; i < slides.length; i++) {
		    slides[i].style.display = "none";
		  }
		  for (i = 0; i < dots.length; i++) {
		    dots[i].className = dots[i].className.replace(" active", "");
		  }
		  slides[slideIndex-1].style.display = "block";
		  dots[slideIndex-1].className += " active";
		}
	
	</script>
		
</body>
</html>