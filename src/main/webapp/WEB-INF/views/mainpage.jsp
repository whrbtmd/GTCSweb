<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <title>Main</title>
<style>
.white, .white a{
	color : #fff;
}
.top{
	color:white;
}
.navbar {
      margin-bottom: 0;
      border-radius: 0;
    }

.carousel-inner img {
     /* width: 100%;*/ /* Set width to 100% */
      margin: auto;
      min-height:200px;
  }
 @media (max-width: 600px) {
    .carousel-caption {
      display: none;
    }
  }  

</style>
</head>
<body>

	

	<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <!-- <a class="navbar-brand" href="#">Logo</a> -->
      
      <img src="./resources/img/whiteLogo.png" width="110px" height="58px">
      
    </div>
			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav">
					<li><a href="mainDegin">Home</a></li>
					<li><a href="insert?category=DRIVERS">그늘집</a></li>
					<li><a href="home">예 약</a></li>
					<li><a href="notice">공지사항</a></li>
					<c:choose>
						<c:when test="${id == 'admin'}">
							<li><a href="adminPage">관리자</a></li>
						</c:when>
					</c:choose>
				</ul>
				<ul class="nav navbar-nav navbar-right loggin">
					<li><br><c:choose>
							<c:when test="${sessionScope.id == null}">
								<div align="right">
									<a href="joinForm" class="top"><span class="glyphicon glyphicon-user white"></span> 회원가입</a> 
									<a class="top" href="loginForm" id="myBtnn">
									<span class="glyphicon glyphicon-log-in white"></span> 로그인</a> &nbsp;&nbsp;
								</div>
							</c:when>
							<c:when test="${sessionScope.id == 'admin'}">
								<div class="top" align="right">
									<span class="glyphicon glyphicon-user white"><b>'관리자'님</b></span>&nbsp;&nbsp;
									<a class="top" href="logout"><span
										class="glyphicon glyphicon-log-out white"></span> 로그아웃</a> &nbsp;&nbsp;
								</div>
							</c:when>
							<c:otherwise>
								<div class="top" align="right">
									<span class="glyphicon glyphicon-user white"><b>'${sessionScope.id}'님</b></span>&nbsp;&nbsp;
									<a class="top" href="logout"><span
										class="glyphicon glyphicon-log-out white"></span> 로그아웃</a> &nbsp;&nbsp;
								</div>
							</c:otherwise>
						</c:choose></li>
				</ul>
			</div>
		</div>
</nav>







  <div class="modal fade" id="myModall" role="dialog">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header" style="padding:35px 50px;">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4><span class="glyphicon glyphicon-user"></span> LOGIN</h4>
        </div>
        <div class="modal-body" style="padding:40px 50px;">
          <form role="form" action="loginProcess" method="post">
            <div class="form-group">
              <label for="id"><span class="glyphicon glyphicon-menu-down"></span> ID</label>
              <input type="text" class="form-control" id="id" name="id">
            </div>
            <div class="form-group">
              <label for="ppw"><span class="glyphicon glyphicon-menu-down"></span> PW</label>
              <input type="password" class="form-control" id="pw" name="pw">
            </div>
              <button type="submit" class="btn btn-success btn-block"><span class="glyphicon glyphicon-off"></span> Login</button>
          </form>
        </div>
      </div>   
    </div>
  </div>



<script>
$(document).ready(function(){
    $("#myBtnn").click(function(){
        $("#myModall").modal();
    });
});
</script>



</body>
</html>