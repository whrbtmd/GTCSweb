<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<jsp:include page="mainpage.jsp"></jsp:include>
<body>

<form role="form" method="post" class="form-inline" align="center">
<div class="board">
	<table class="table table-hover" align="center" border=1>
		<tr align="center">
			<th>주문자</th>
			<th>상품명</th>
			<th><a style="color:black;">상품이미지</a></th>
			<th>가격</th>
			<!-- <th>등록일</th> -->
		</tr>
		<c:forEach var="cart" items="${cart}">
		<tr align="center">
			<td>${cart.id}</td> 
			<td><a href="cartRegister?pnum=${cart.pnum}" style="color:black;">${cart.pname}</a></td>
			<td><img class="material-product" src="resources/image/${cart.pimage}" style="width: 1px height: 1px"></td>
			<td>${cart.pprice}</td>
		</tr>
		</c:forEach>
		</table>
</div>


</form>

</body>
</html>