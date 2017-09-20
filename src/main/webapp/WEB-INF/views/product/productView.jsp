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
<title>게시글 상세보기</title>
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
	  $("#removepro").on("click", function(){
		   formObj.setAttribute("action", "removepro");
		   formObj.submit();
		  });
	
	  /* 수정 */
	  $("#modifypro").on("click", function(){
		  alert("수정완료!");
		   formObj.setAttribute("action", "modifypro");
		   formObj.submit();
		  });
  
  /* 장바구니 */
  $("#cartRegister").on("click", function(){
	   formObj.setAttribute("action", "cartRegister");
	   formObj.submit();
	  });
  
  /* 구매 */
  $("#purchase").on("click", function(){
	   formObj.setAttribute("action", "purchase");
	   formObj.submit();
	  });
  
  
  $("#listDetail").on("click", function(){
	   
	   formObj.setAttribute("action", "insert");
	   formObj.submit();
	   
	   //self.location="listAll";
	  });
  
  
  
  
  /* 등록되어있는 모든 제품 보기
  $("#listDetail").on("click", function(){
	   
	   formObj.setAttribute("action", "listPutters");
	   formObj.submit();
	   
	   //self.location="listAll";
	  }); */
  
  
  
 }); 
</script>
</head>
<jsp:include page="../mainpage.jsp"></jsp:include>
<%-- <jsp:include page="../mainpage.jsp"></jsp:include> --%>
<body>


<h1><center>PRODUCT DETAIL</center></h1>
<form role="form" method="post" class="form-inline" align="center" id="form-inline">

<fieldset>
<label for="pname">상품명 </label>
   		<input type="text" value="${product.pname}" name="pname" class="form-control" id="pname"><br>
  	<br>

<label for="pprice">상품가격 </label>
   		<input type="text" value="${product.pprice}" name="pprice" class="form-control" id="pprice"><br>
  	<br>
<label for="pmaker">제조원 </label>
   		<input type="text" value="${product.pmaker}" name="pmaker" class="form-control" id="pmaker"><br>
  	<br>
<label for="pcontext">상품설명</label>
   		<input type="text" value="${product.pcontext}" name="pcontext" class="form-control" id="pcontext"><br>
  	<br>


</fieldset>


</form>

	<c:choose>
		<c:when test="${id == 'admin'}">
			<div align="center">

				<button type="submit" class="btn btn-default" id="modifypro">수정</button>

				<button type="submit" class="btn btn-default" id="removepro">삭제</button>
				
				<!-- <button type="submit" class="btn btn-default" id="listDetail">전체목록</button> -->

			</div>
		</c:when>
	</c:choose>

































<%-- <h1><center>PRODUCT DETAIL</center></h1>
<form role="form" method="post" class="form-inline" align="center" id="form-inline">
<input type='hidden' name="pimage" value="${product.pimage}">
<input type='hidden' name="id" value="${product.id}">
<input type='hidden' name="pname" value="${product.pname}">
<input type='hidden' name="pprice" value="${product.pprice}">
<div class="board">
	<table class="table table-hover">
		<tr align="center">
		<th>　　　　　　</th>
			
			<th>상품명</th>
			<th><a style="color:black;">상품이미지</a></th>
			<th>가격</th>
			<!-- <th>등록일</th> -->
		</tr>
		<c:forEach items="${listPutters}" var="product">
		<tr>
			<td ><input type='hidden' name="pnum" value="${product.pnum}"></td> 
			<td><a href="productView?pnum=${product.pnum}" style="color:black;">${product.pname}</a></td>
			<td><img class="material-product" src="resources/image/${product.pimage}" style=""width: 1px height: 1px"></td>
			<td>${product.pprice}</td>
		</tr>
		</c:forEach>
		</table>
</div>


</form>




	<c:choose>
		<c:when test="${id != 'admin'}">
			<div align="center">


				<button type="submit" class="btn btn-default" id="listDetail">전체목록</button>

				<button type="submit" class="btn btn-default" id="cartRegister">장바구니</button>

				<button type="submit" class="btn btn-default" id="purchase">구매</button>
				<br>
				<br>
				<br>
			</div>
		</c:when>
		<c:when test="${id == 'admin'}">
			<div align="center">

				<button type="submit" class="btn btn-default" id="modifyc">수정</button>

				<button type="submit" class="btn btn-default" id="removec">삭제</button>

			</div>
		</c:when>
		<c:otherwise>
		</c:otherwise>
	</c:choose>
 --%>

</body>
</html> 
