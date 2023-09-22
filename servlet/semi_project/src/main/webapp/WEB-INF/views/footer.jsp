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
<title>footer</title>
<style type="text/css">
	html, body{
		height: 100%;
	}
	body{
		display: flex; flex-direction: column;
	}
	div{
		flex: 1;
	}
	a{
		
	}
	
	footer{
		position: relative;
		bottom: 0;
		width: 100%;
		height: 60px;
 		margin-top: 50px; 
/*  		transform : translateY(-100%);  */
	}
	
</style>

</head>
<body>
	
	<footer class="container-fluid bg-dark">
		<a class="navbar-brand" href="/semi_project">DogHotel</a>
		<small style="color: gray;">Copyright &copy;team1 :임은영 이충희 최유진 이지선</small>
	</footer>
</body>
</html>