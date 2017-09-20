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
<title>공지사항</title>
<style>
.board{ width:1200px; align:center; margin-top:60px;}



</style>
</head>
<jsp:include page="../mainpage.jsp"></jsp:include>
<body>






<center>
<div class="board">
	<table class="table table-hover">
		<tr align="center">
			<th>글번호</th>
			<th><a style="color:black;">제목</a></th>
			<th>작성자</th>
			<th>등록일</th>
		</tr>
		<c:forEach items="${list}" var="board">
		<tr>
			<td>${board.bno}</td>
			<td><a href="readn?bno=${board.bno}" style="color:black;">${board.title}</a></td>
			<td>${board.writer}</td>
			<td><fmt:formatDate pattern="yyyy년 MM월 dd일" value="${board.regdate}"/></td>
		</tr>
		</c:forEach>
		</table>
</div>
<br><br><br>
<c:choose>
	  <c:when test="${sessionScope.id == null}">
		  <script>
			  $(document).ready(function(){
			        alert('로그인 후 이용할 수 있습니다.');
			        location.href='home';
			  });
		  </script>
	  </c:when> 
	  <c:when test="${id == 'admin'}">
			<button type="button" class="btn btn-default" onclick="location.href='register'">글쓰기</button>
	  </c:when> 
	  <c:otherwise>
	  </c:otherwise>
</c:choose>	  

<br><br>


</body>
</html>