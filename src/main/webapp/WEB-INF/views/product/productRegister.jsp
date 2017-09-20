<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
<title>Insert title here</title>
<style>
	.form-group{
		 margin-left: 43.5%;
	}
	.title{
	margin-top:20px;
	
	width:120px;
	height :80px;
}
</style>
<script>
$(document).ready(function(){
 
	
	var formObj = document.getElementById("form-inline");
	console.log(formObj);
	/* // 삭제 
	  $("#removec").on("click", function(){
		   formObj.setAttribute("action", "removec");
		   formObj.submit();
		  });
	
	  // 수정
	  $("#modifyc").on("click", function(){
		   formObj.setAttribute("action", "modifyc");
		   formObj.submit();
		  });
  
  //장바구니 
  $("#cartRegister").on("click", function(){
	   formObj.setAttribute("action", "cartRegister");
	   formObj.submit();
	  });
  
  //구매
  $("#purchase").on("click", function(){
	   formObj.setAttribute("action", "purchase");
	   formObj.submit();
	  });  */
   
  $("#newinsert").on("click", function(){
	   
	   formObj.setAttribute("action", "newinsert");
	   formObj.submit();
	   
	   //self.location="listAll";
	  });
 }); 
</script>
</head>
<jsp:include page="../mainpage.jsp"></jsp:include>
<body>
<center><img class="title" src ="./resources/img/shoptitle.png"></center>
<br>

	<form action="newinsert" method="post" enctype="multipart/form-data"
		class="form-inline">
		<div class="form-group">
			<input type="hidden" id="id" name="id" value="${sessionScope.id}"><br>
			<label for="photo"> 상　품　이　미　지</label> 
			<input type="file" class="form-control" id="photo" name="photo">
			<br> <br>
			
			<label for="pname"> 상　　품　　명</label> 
			<input type="text" class="form-control" id="pname" name="pname"> 
			<br> <br>
			
			<label for="pcategory">
				카　테　고　리</label> <select name="pcategory">
				<option value="PUTTERS">PUTTERS</option>
				<option value="DRIVERS">DRIVERS</option>
				<option value="HYBRIDS">HYBRIDS</option>
				<option value="IRONSETS">IRON SETS</option>
			</select> 
			
			<br><br> 
			<label for="pprice"> 상　품　가　격</label> 
			<input type="text" class="form-control" id="pprice" name="pprice"> 
			<br> <br>
			<label	for="pmaker"> 제　　조　　원 </label> 
			<input type="text" class="form-control" id="pmaker" name="pmaker"> 
			<br> <br>
			<label for="pcontext"> 상　품　설　명</label> 
			<input type="textarea" class="form-control" id="pcontext" name="pcontext"><br>

		</div>
<br><br>

	</form>
	<center><input type="submit" class="btn btn-success" id="newinsert" value="등록">
	<input type="reset" class="btn btn-fail" value="취소"></center>
</body>
</html>