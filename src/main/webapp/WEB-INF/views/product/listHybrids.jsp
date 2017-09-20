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
<title>Insert title here</title>
</head>
<jsp:include page="../mainpage.jsp"></jsp:include>
<body>
<h1>일반회원 목록 불러오기</h1>


<div class="board">
	<table class="table table-hover">
		<tr align="center">
			<th></th>
			<th>상품명</th>
			<th><a style="color:black;">상품이미지</a></th>
			<th>가격</th>
			<!-- <th>등록일</th> -->
		</tr>
		<c:forEach items="${listHybrids}" var="product">
		<tr>
			<td ><input type='hidden' name="pnum" value="${product.pnum}"></td> 
			<td><a href="productView?pnum=${product.pnum}" style="color:black;">${product.pname}</a></td>
			<td><img class="material-product" src="resources/image/${product.pimage}" style=""width: 1px height: 1px"></td>
			<td>${product.pprice}</td>
		</tr>
		</c:forEach>
		</table>
		
</div>









</body>
</html> 