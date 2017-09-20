<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>GTCS/ADMINPAGE</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">


<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

<style> 
    a{
       color:white;
       margin-left:80px;
       font-weight: bold;
       
    }
    
    a:hover{
       color:gray;
       text-decoration:none;
    }
    
    .navbar-header{
       backgroud-color:white;
    }
    
    .top{
       color:gray;
       margin-left:10px;
    }
    
     .top-main{
       background-color:#6B9900;
       width:100%;
       height:60px;
       font-color:white;
    }
    
     .top-main-right{
       text-color:black;
       margin-right:80px;
    }
    
    .modal-header, h4, .close {
      background-color: #5cb85c;
      color:white !important;
      text-align: center;
      font-size: 30px;
     }
     
     .modal-footer {
      background-color: #f9f9f9;
     }
    
</style>
</head>
<body>

<br>

<div class="form-group">
   <div class="col-sm-2" style="margin-left: 100px;">
      <center><a href="Home"><img src="images/logo.png" width="190px;" height="80px;"></a></center>
   </div>
</div>

<div class="top-main-right">

<c:choose>
     <c:when test="${sessionScope.id == null}">
       <div align="right">
         <a href="joinForm" class="top"><span class="glyphicon glyphicon-user"></span> 회원가입</a>
         <a class="top" href="#" id="myBtnn"><span class="glyphicon glyphicon-log-in"></span> 로그인</a> &nbsp;&nbsp;   
      </div>
     </c:when>
     <c:when test="${sessionScope.id == 'admin'}">
         <div class="top" align="right">
         <span class="glyphicon glyphicon-user"><b>'관리자'</b></span>&nbsp;&nbsp;
         <a class="top" href="logout"><span class="glyphicon glyphicon-log-out"></span> 로그아웃</a> &nbsp;&nbsp;
      </div>
     </c:when>  
     <c:otherwise>
       <div class="top" align="right">
         <span class="glyphicon glyphicon-user"><b>'${sessionScope.id}'님</b></span>&nbsp;&nbsp;
         <a class="top" href="logout"><span class="glyphicon glyphicon-log-out"></span> 로그아웃</a> &nbsp;&nbsp;
      </div>
     </c:otherwise>
</c:choose>


</div>
<br><br><br>

<table align="center" class="top-main">
   <tr>
      <td align="center">
         <a href="#">메뉴</a> &nbsp;&nbsp;
         <a href="score">스코어</a> &nbsp;&nbsp;
         <a href="shop/list?userid=${userid }">SHOP</a> &nbsp;&nbsp;
         <a href="#">예  약</a> &nbsp;&nbsp;
          <a href="listAll">게시판</a> &nbsp;&nbsp; 
          <c:choose>
               <c:when test="${id == 'admin'}">
                  <a href="adminPage">관리자</a>
               </c:when>
            </c:choose>
         </td>
   </tr>
</table>



<!-- Modal -->
  <div class="modal fade" id="myModall" role="dialog">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header" style="padding:35px 50px;">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4><span class="glyphicon glyphicon-user"></span> LOGIN</h4>
        </div>
        <div class="modal-body" style="padding:40px 50px;">
          <form role="form" action="adm/loginProcess" method="post">
            <div class="form-group">
              <label for="id"><span class="glyphicon glyphicon-menu-down"></span> ID</label>
              <input type="text" class="form-control" id="id" name="userid">
            </div>
            <div class="form-group">
              <label for="ppw"><span class="glyphicon glyphicon-menu-down"></span> PW</label>
              <input type="text" class="form-control" id="pw" name="userpw">
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