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
<title>GTCS/캐디정보상세보기</title>
<style>
.form-inline{margin-top:60px;}
#writer{width:80px;} #title{width:500px;}
.board{
	maring : auto;
}
</style>
<script>
$(document).ready(function(){
 
	
	var formObj = document.getElementById("form-inline");
	console.log(formObj);
	
	/* 삭제 */
	  $("#removecd").on("click", function(){
		  alert("삭제성공!");
		   formObj.setAttribute("action", "removecd");
		   formObj.submit();
		  });
	
	  /* 수정 */
	  $("#modifycd").on("click", function(){
		  alert("수정완료!");
		   formObj.setAttribute("action", "modifycd");
		   formObj.submit();
		  });
  
 
  
  $("#listcd").on("click", function(){
	   
	   formObj.setAttribute("action", "caddieMember");
	   formObj.submit();
	   
	   //self.location="listAll";
	  });
 }); 
</script>
</head>
<jsp:include page="../mainpage.jsp"></jsp:include>

<body>
<h1><center>CADDIE DETAIL</center></h1>
<form role="form" method="post" class="form-inline" align="center" id="form-inline">

<fieldset>
<label for="userid">회원아이디 </label>
   		<input type="text" value="${caddie.userid}" name="userid" class="form-control" id="userid" readonly><br>
  	<br>
<label for="userpw">비밀번호 </label>
   		<input type="text" value="${caddie.userpw}" name="userpw" class="form-control" id="userpw"><br>
  	<br>
<label for="username">회원명 </label>
   		<input type="text" value="${caddie.username}" name="username" class="form-control" id="username"><br>
  	<br>
<label for="phone">회원 연락처 </label>
   		<input type="text" value="${caddie.phone}" name="phone" class="form-control" id="phone"><br>
  	<br>
<label for="address">회원 거주지 </label>
   		<input type="text" value="${caddie.address}" name="address" class="form-control" id="address"><br>
  	<br>


</fieldset>


</form>

	<c:choose>
		<c:when test="${userid == 'admin'}">
			<div align="center">

				<button type="submit" class="btn btn-default" id="modifycd">수정</button>

				<button type="submit" class="btn btn-default" id="removecd">삭제</button>
				
				<button type="submit" class="btn btn-default" id="listcd">전체목록</button>

			</div>
		</c:when>
	</c:choose>


</body>
</html> 
