<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
  
  <style>
  
  html, body, div, h1, h2, p, img {
    margin: 0;
    padding: 0;
}

body {
    font-family: Arial, sans-serif;
    background-color: azure;
}


/* Main Content Styles */
.main-content {
    width: 100%;
    max-width: 1200px;
    margin: 0 auto; /* 가운데로 */
    padding: 20px;
    background-color: white;
    margin-top: 40px;
}

h1 {
    font-size: 24px;
    padding-top: 10px;
}
 .text-box{    
    margin-top: 50px;
    text-align: center;
    font-family: '맑은 고딕', sans-serif;
    border-bottom: solid 1px wheat;
    border-top: solid 1px wheat;
}

.photo-list {
    display: flex;
    flex-wrap: wrap;
    margin-top: 50px
/*     gap: 20px;  */
}

.photo {
    width: calc(33.33% - 20px);
    padding: 10px;
    background-color: #fff;
/*     box-shadow: 0px 0px 5px rgba(0, 0, 0, 0.1); */
}

.photo2{
	width: calc(50% - 20px);
}

.photo img {
    max-width: 100%;
    height: 100%;
    object-fit:cover; /* 이미지를 높이에 맞추고 가로 비율을 유지 */
    object-position: top; /* 이미지를 상단에서 자름 */    
}
.photo2 img{
	max-width: 100%;
    height: 100%;
    object-fit:cover;
    object-position: top;
    padding: 10px;
}

.carousel-inner img {
    width: 100%;
    max-height: 400px;
    object-fit: cover;
}

/* .container { */
/*     padding: 0; */
/*     margin: 0; */
/*     margin-top: 20px; */
/*     max-width: 100%; */
/*     width: 100%; */
/* } */
/* .photo h2 { */
/*     font-size: 18px; */
/*     margin-top: 10px; */
/* } */

/* .photo p { */
/*     font-size: 14px; */
/*     color: #666; */
/*     margin-top: 10px; */
/* } */

  </style>
  	
<title>Dog Hotel</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>

<!-- 	<div class="container"> </div> -->
	    <div id="demo" class="carousel slide" data-ride="carousel">
	        <!-- Indicators -->
	        <ul class="carousel-indicators">
	            <li data-target="#demo" data-slide-to="0" class="active"></li>
	            <li data-target="#demo" data-slide-to="1"></li>
	            <li data-target="#demo" data-slide-to="2"></li>
	        </ul>
	        
	        <!-- Slides -->
	        <div class="carousel-inner">
	            <div class="carousel-item active">
	                <img src="<c:url value='/resources/images/img10.jpg'/>" alt="사진">
	            </div>
	            <div class="carousel-item">
	                <img src="<c:url value='/resources/images/img3.jpg'/>" alt="사진">
	            </div>
	            <div class="carousel-item">
	                <img src="<c:url value='/resources/images/img4.jpg'/>" alt="사진">
	            </div>
	       
	
	        <!-- Controls (Optional) -->
	        <a class="carousel-control-prev" href="#demo" data-slide="prev">
	            <span class="carousel-control-prev-icon"></span>
	        </a>
	        <a class="carousel-control-next" href="#demo" data-slide="next">
	            <span class="carousel-control-next-icon"></span>
	        </a>
	    </div>
	</div>
	
	 <div class="main-content">
        <div class="photo-list">
            <div class="photo">
                <img src="<c:url value='/resources/images/img1.jpg'/>" alt="photo1">
            </div>
            <div class="photo">
                <img src="<c:url value='/resources/images/img3.jpg'/>" alt="photo3">
            </div>
            <div class="photo">
                <img src="<c:url value='/resources/images/img4.jpg'/>" alt="photo4">
            </div>
        </div>    
        <div class="text-box">
	        <h1><b>소중한 내 가족을 위한 맞춤 위탁 서비스</b></h1>
	        <p style="text-align: center;">반려동물 호텔, <b>Doghotel</b>입니다.</p>
        </div>
        <div class="photo-list">
            <div class="photo2">
                <img src="<c:url value='/resources/images/img5.jpg'/>" alt="photo5">
            </div>
            <div class="photo2">
                <img src="<c:url value='/resources/images/img7.jpg'/>" alt="photo6">
            </div>
        </div>
    </div>

	
	
	
	
<!-- <div id="demo" class="carousel slide mt-5" data-ride="carousel"> -->

<!--   <!-- Indicators -->
<!--   <ul class="carousel-indicators"> -->
<!--     <li data-target="#demo" data-slide-to="0" class="active"></li> -->
<!--     <li data-target="#demo" data-slide-to="1"></li> -->
<!--     <li data-target="#demo" data-slide-to="2"></li> -->
<!--   </ul> -->

<!--   <!-- The slideshow -->
<!--  <div class="container container-box" style="width: 1000px"> -->
<!--   <div class="container carousel-inner"> -->
<!--     <div class="carousel-item active"> -->
<!--       <img src="깜바.jpg" alt="깜바"> -->
<!--     </div> -->
<!--     <div class="carousel-item"> -->
<!--       <img src="복실2.jpg" alt="복실"> -->
<!--     </div> -->
<!--     <div class="carousel-item"> -->
<!--       <img src="써니.jpg" alt="써니"> -->
<!--     </div> -->
<!--     <div class="carousel-item"> -->
<!--       <img src="지선.jpg" alt="지선"> -->
<!--     </div> -->
<!--   </div> -->
<!-- </div> -->
<!--   <!-- Left and right controls -->
<!--   <a class="carousel-control-prev" href="#demo" data-slide="prev"> -->
<!--     <span class="carousel-control-prev-icon"></span> -->
<!--   </a> -->
<!--   <a class="carousel-control-next" href="#demo" data-slide="next"> -->
<!--     <span class="carousel-control-next-icon"></span> -->
<!--   </a> -->

<!-- </div> -->

<footer>
	<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
	<script type="text/javascript">
	// 뒤로가기 막기
	history.pushState(null, null, location.href); 

	window.onpopstate = function() { 
		history.go(1); //현재 페이지로
	}
	</script>
</footer>
</body>
</html>
