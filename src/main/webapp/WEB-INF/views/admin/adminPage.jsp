<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
<style>
	.center{
	
		maring: 5%;
		text-align : center;
		border: 3px solid green;
	}
	.g{
		margin : 2%;
	}
	
	.banana{
		margin-left:130px;
		width : 280px;
		height:100px;
	} 
	.fine{
		margin-left:80px;
		width : 280px;
		height:100px;
	}
	.apple{
		margin-top:50px; margin-left:500px;
	}
	
	 footer {
	background-color: #f2f2f2;
	padding: 25px;
}
</style>
<title>GTCS/ADMINPAGE</title>
</head>
<jsp:include page="../mainpage.jsp"></jsp:include>
<body>
<br /><br />
	<div class="apple">
	<a href="home"><img class="banana" src="./resources/img/adminRes.png"></a>
	<a href="/productRegister"><img class="fine" src="./resources/img/adminShop.png"></a>
	
	<br /><br /><br /><br /><br />
	
	<a href="food"><img class="banana" src="./resources/img/adminFood.png"></a>
	<a href="traffic"><img class="fine" src="./resources/img/adminTraffic.png"></a>
	
	<br /><br /><br /><br /><br />
	
	<a href="score"><img class="banana" src="./resources/img/adminScore.png"></a>
	<a href="member"><img class="fine" src="./resources/img/adminMem.png"></a>
	
	<br /><br /><br /><br /><br />
	</div>
	

<br><br><br><br>
<footer class="container-fluid text-center">
  <p>
주소 : 대구광역시 북구 복현로 35 (복현2동 218) <br>
Tel : 053.940.5114 <br>
Copyright 2012 YEUNGJIN COLLEGE GTCS. All rights reserved.
</p>
</footer>
</body>
</html>