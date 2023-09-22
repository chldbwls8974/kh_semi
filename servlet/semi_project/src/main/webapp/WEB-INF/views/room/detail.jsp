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

/* Slideshow container */
.slideshow-container {
  max-width: 1000px;
  position: relative;
  margin: auto;
}

/* Hide the images by default */
.mySlides {
  display: none;
}

/* Next & previous buttons */
.prev, .next {
  cursor: pointer;
  position: absolute;
  top: 50%;
  width: auto;
  margin-top: -22px;
  padding: 16px;
  color: white;
  font-weight: bold;
  font-size: 18px;
  transition: 0.6s ease;
  border-radius: 0 3px 3px 0;
  user-select: none;
}

/* Position the "next button" to the right */
.next {
  right: 0;
  border-radius: 3px 0 0 3px;
}

/* On hover, add a black background color with a little bit see-through */
.prev:hover, .next:hover {
  background-color: rgba(0,0,0,0.8);
}

/* Caption text */
.text {
  color: #f2f2f2;
  font-size: 15px;
  padding: 8px 12px;
  position: absolute;
  bottom: 8px;
  width: 100%;
  text-align: center;
}

/* Number text (1/3 etc) */
.numbertext {
  color: #f2f2f2;
  font-size: 12px;
  padding: 8px 12px;
  position: absolute;
  top: 0;
}

/* The dots/bullets/indicators */
.dot {
  cursor: pointer;
  height: 15px;
  width: 15px;
  margin: 0 2px;
  background-color: #bbb;
  border-radius: 50%;
  display: inline-block;
  transition: background-color 0.6s ease;
}

.active, .dot:hover {
  background-color: #717171;
}

/* Fading animation */
.fade {
  animation-name: fade;
  animation-duration: 1.5s;
}

@keyframes fade {
  from {opacity: .4}
  to {opacity: 1}
}
  
  .btn-room-delete{
  	float: left
  }
  </style>

<title>객실 상세정보</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
	<div class="container mt-5">
	<h2>객실 상세정보</h2>
		<div class="card">
			<div class="card-body">
			
				<div class="slideshow-container">
					<div class="mySlides fade">
    				 <div class="numbertext">1 / 3</div>
					  <img src="<c:url value='/resources/images/img1.jpg'/>" alt="방1" style="width:100%"/>
					  <div class="text">Room</div>
  					</div>
					<div class="mySlides fade">
    				 <div class="numbertext">2 / 3</div>
					  <img src="<c:url value='/resources/images/img2.jpg'/>" alt="방1" style="width:100%"/>
					  <div class="text">내부 사진</div>
  					</div>		
					<div class="mySlides fade">
    				 <div class="numbertext">3 / 3</div>
					  <img src="<c:url value='/resources/images/img3.jpg'/>" alt="방1" style="width:100%"/>
					  <div class="text">외부 시설</div>
  					</div>
					  <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
  					<a class="next" onclick="plusSlides(1)">&#10095;</a>
				</div><br>
				<div style="text-align:center">
				  <span class="dot" onclick="currentSlide(1)"></span>
				  <span class="dot" onclick="currentSlide(2)"></span>
				  <span class="dot" onclick="currentSlide(3)"></span>
				</div>
					
				<c:if test="${room != null }">
					<div>객실 이름 : ${room.ro_name }</div>
					<div>객실 타입 :${room.ro_detail }</div>
					<div>지점명 : ${branch.br_name}</div>
					<div>최대 수용 마리 수 : ${room.ro_max_cap}</div>	
					<div>현재 수용 마리 수 : ${room.ro_now_cap}</div>
				</c:if>
			</div>
		</div>
		<form>
			<a href="<c:url value='/room/main${cri.currentUrl }'/>" class="btn btn-outline-dark mt-2 btn-float-right">뒤로가기</a>
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