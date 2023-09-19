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
  /* Make the image fully responsive */
  .container-box{
  	width : 65%;
  	height : 40%;
  	min-height: 300px;
  }
  
  .carousel-inner img {
    width: 100%;
    height: 80%;
  }
  </style>
  	
<title>Dog Hotel</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>	
<div id="demo" class="carousel slide mt-5" data-ride="carousel">

  <!-- Indicators -->
  <ul class="carousel-indicators">
    <li data-target="#demo" data-slide-to="0" class="active"></li>
    <li data-target="#demo" data-slide-to="1"></li>
    <li data-target="#demo" data-slide-to="2"></li>
  </ul>

  <!-- The slideshow -->
 <div class="container container-box">
  <div class="container carousel-inner">
    <div class="carousel-item active">
      <img src="깜바.jpg" alt="깜바">
    </div>
    <div class="carousel-item">
      <img src="복실2.jpg" alt="복실">
    </div>
    <div class="carousel-item">
      <img src="써니.jpg" alt="써니">
    </div>
      <div class="carousel-item">
      <img src="지선.jpg" alt="지선">
    </div>
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
</body>
</html>
