<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>    
<!DOCTYPE html>
<html>
<head>

<title>GTCS/예약확인</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
<link rel="stylesheet" href="http://lei1007.shiningcorp.com/css/default.css">
<link rel="stylesheet" href="http://lei1007.shiningcorp.com/skin/board/sh_basic/style.css">
<link rel="stylesheet" href="http://lei1007.shiningcorp.com/css/user.css">
<link rel="stylesheet" href="http://lei1007.shiningcorp.com/css/page_style.css">
<link rel="stylesheet"type="text/css"href="../css/font1.css" />
<link rel="stylesheet" href="http://lei1007.shiningcorp.com/sh_img/hd/aside/style.css">
<script src="http://lei1007.shiningcorp.com/js/jquery-1.8.3.min.js"></script>
<script src="http://lei1007.shiningcorp.com/js/jquery.menu.js"></script>
<script src="http://lei1007.shiningcorp.com/js/common.js"></script>
<script src="http://lei1007.shiningcorp.com/js/wrest.js"></script>
<script type="text/javascript" src="http://lei1007.shiningcorp.com/sh_img/hd/aside/jquery-ui.js"></script>
<script src="http://lei1007.shiningcorp.com/sh_img/hd/aside/script.js"></script>
<script src="http://lei1007.shiningcorp.com/sh_img/hd/top_menu/script.js"></script>
<script>
$(document).ready(function(){
	  var formObj = $("form[role='form']");
	  
	  $("#delete").on("click", function(){
		   formObj.attr("action", "delete");
		   formObj.submit();
		  });
	  
	  $("#eventListAll").on("click", function(){
	   
	   formObj.attr("action", "eventListAll");
	   formObj.submit();
	  });
	 });

</script>
<style>
.detail{
	margin-top:60px;
}
.title{
	margin-top:20px;
	
	width:200px;
	height :80px;
}
table {
	margin-left:40%;
    border-collapse: collapse;
    width: 25%;
}
th, td {
    padding: 8px;
    border-bottom: 1px solid #ddd;
}
</style>
</head>

<body>

<div id="sh_wrapper">
<!-- 상단 시작 { -->
<div id="sh_hd">	
	<div class="top_nav_bg"></div>
    <h1 id="hd_h1">공지사항 1 페이지</h1>
    <div id="skip_to_container"><a href="#container">본문 바로가기</a></div>
        <div id="sh_hd_wrapper">		
		<ul id="sh_tip_menu">
	<li>
					<c:choose>
							<c:when test="${sessionScope.userid == null}">
								<div align="right">
									<a href="joinForm" class="top"><span
										class="glyphicon glyphicon-user white"></span> 회원가입</a> <a
										class="top" href="loginForm" id="myBtnn"> <span
										class="glyphicon glyphicon-log-in white"></span> 로그인
									</a> &nbsp;&nbsp;
								</div>
							</c:when>
							<c:when test="${sessionScope.userid == 'admin'}">
								<div class="top" align="right">
									<span class="glyphicon glyphicon-user white"><b>'관리자'님</b></span>&nbsp;&nbsp;
									<a class="top" href="logout"><span
										class="glyphicon glyphicon-log-out white"></span> 로그아웃</a>
									&nbsp;&nbsp;
								</div>
							</c:when>
							<c:otherwise>
								<div class="top" align="right">
									<span class="glyphicon glyphicon-user white"><b>'${sessionScope.userid}'님</b></span>&nbsp;&nbsp;
									<a class="top" href="logout"><span
										class="glyphicon glyphicon-log-out white"></span> 로그아웃</a>
									&nbsp;&nbsp;
								</div>
							</c:otherwise>
						</c:choose></li>
</ul>
<div id="sh_top_menu_wrapper">
	<h1 id="top_logo"><a href="GTCSMAIN"><img src="./resources/sh_img/hd/top_menu/logo.png" width="150px" height="75px" alt="사이트 로고" /></a></h1>

	<div id="top_menu_wrapper">
		<!--menu!-->
		<ul id="top_menu">


							<li class="list list01"><a href="show_menu">그늘집</a>
								</li>

							<li class="list list02"><a href="shop/list">쇼핑몰</a>
								<ul class="sub_ul2">
									<li><a href="shop/goodlist?category=Driver" class="">DRIVERS</a>
										<a href="shop/goodlist?category=PUTTER" class="">PUTTER</a> <a
										href="shop/goodlist?category=CLUB" class="">CLUB</a> <a
										href="shop/goodlist?category=HYBRIDS" class="">HYBRIDS</a></li>
									<li class="smenu_back"></li>
								</ul></li>

							<c:choose>
								<c:when test="${userid != 'admin'}">

									<li class="list list03"><a href="info">예약 및 안내</a>
										<ul class="sub_ul3"></ul></li>

								</c:when>
								<c:when test="${userid == 'admin'}">
									<li class="list list03"><a href="adm/home">관리자페이지</a>
										<ul class="sub_ul3"></ul></li>
								</c:when>

							</c:choose>

							<li class="list list04"><a href="#">스코어관리</a></li>
							
							<li class="list list05"><a href="notice">공지사항</a></li>

						</ul>
		</div>
		<!--menu!-->
	<div style="clear:both; visibility:hidden"></div> 
</div>
<!-- 소분류 끝 -->	</div>
</div>
<!-- } 상단 끝 -->

<!-- 콘텐츠 시작 { -->
<div id="sh_container">	
	<div id="sh_container_topbg"></div>
		<!-- 서브상단 이미지 -->	
	<div id="sh_container_top"><img src="./resources/sh_img/hd/sub_main_banner/sub_main_banner.png" alt="" /></div>
	<div id="sh_container_wrapper">	
		<!-- 서브메뉴 -->
		<div id="sh_aside"><div id="aside_tit"><ul> 예약시스템</ul></div>
<!-- 대분류 끝 -->


</div>		
		<!-- 콘텐츠영역 -->
		<div id="sh_content">
			<div id="sh_content_tit">

<center><img class="title" src ="./resources/img/retitle.png"></center>
 
<form role="form" method="post" class="form-inline" align="center">
<div class="detail">

<br>
<fieldset>

   		

<c:forEach items="${calendardetail}" var="calendardetail">
제　목　:　${calendardetail.title } <br><br>
예약일　:　${calendardetail.startday } <Br><br>
예약 시간　:　${calendardetail.time }<Br><br>
<Br>
<%-- <c:forEach items="${group}" var="group">

팀 　원　:　${group.gname1 } <Br><br>
팀 　원　:　${group.gname2 }<Br><br>
팀 　원　:　${group.gname3 }<Br><br>
팀 　원　:　${group.gname4 }<Br><br>
<Br>

</c:forEach> --%>
<br /><br />
			<div align="center">
				<button type="submit" class="btn btn-default" id="eventListAll">전체목록</button>
	
				<a href="delete?cno=${calendardetail.cno }">삭제</a>
				
			</div>
</c:forEach>





</fieldset> 
</div>

</form>

</div>
	
<!-- 라인,버튼색깔 관리자 입력 { -->
<style>
.btn_bo_adm input{background:#669608}
a.btn_admin { background:#669608;border:1px solid #669608}
</style>
<!-- } 라인,버튼색깔 관리자 입력 -->

<h2 id="container_title"><span class="sound_only">목록</span></h2>

<!-- 게시판 목록 시작 { -->
<div id="bo_list" style="width:100%">
    <!-- 게시판 카테고리 시작 { -->
        <!-- } 게시판 카테고리 끝 -->

   

  

   
        </form>
</div>


<!-- 페이지 -->



<!-- } 게시판 목록 끝 -->
    	</div><!-- sh_content -->
	
   
	</div><!-- sh_container_wrapper --> 
</div><!-- sh_container -->

<!-- } 콘텐츠 끝 -->


<!-- 하단 시작 { -->
<div id="sh_ft" style="margin-top:0px;height:140px" >
	<div id="sh_ft_wrapper">
				<div id="address">
			<p>
				상호 : GTCS 사업자 번호 : 053.940.5114,  대표 : 김건협, 개인정보 관리 책임자 : 서제교 SJK@naver.com<br />
주소 : 대구광역시 북구 복현로 35 (복현2동 218), 고객센터 : 053.940.5114, 팩스 : 053-940-5114				<br>
								<p>Copyright ⓒ <strong>2016 YEUNGJIN COLLEGE</strong> All rights reserved.</p>
			</p>
		</div>
		<!-- 관리자 아이콘 -->
        
	</div>
</div>


<!-- } 하단 끝 -->

<script>
$(function() {
    // 폰트 리사이즈 쿠키있으면 실행
    font_resize("container", get_cookie("ck_font_resize_rmv_class"), get_cookie("ck_font_resize_add_class"));
});
</script>

</div>
</body>
</html>

	

</body>
</html>