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
<link rel="stylesheet" href="http://lei1007.shiningcorp.com/css/default.css">
<link rel="stylesheet" href="http://lei1007.shiningcorp.com/skin/board/sh_basic/style.css">
<link rel="stylesheet" href="http://lei1007.shiningcorp.com/css/user.css">
<link rel="stylesheet" href="http://lei1007.shiningcorp.com/css/page_style.css"><link rel="stylesheet"type="text/css"href="../css/font1.css" />
<link rel="stylesheet" href="http://lei1007.shiningcorp.com/sh_img/hd/aside/style.css">

<title>GTCS/게시글 상세보기</title>
<style>
.form-inline{margin-top:60px;}
#writer{width:80px;} #title{width:500px;}
</style>
<script>
 $(document).ready(function(){
  var formObj = $("form[role='form']");
  
  $("#modify").on("click", function(){
   formObj.attr("action", "modify");
   formObj.submit();
  });
  
  $("#delete").on("click", function(){
   formObj.attr("action", "remove");
   formObj.submit();
  });
  
  $("#listAll").on("click", function(){
   
   formObj.attr("action", "notice");
   formObj.submit();
   
  });
 });
</script>
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
				<h3>공지사항</h3>
				<span>홈 > 공지사항</span>
			</div>
	
<script src="http://lei1007.shiningcorp.com/js/viewimageresize.js"></script>

<!-- 라인,버튼색깔 관리자 입력 { -->
<style>
.btn_bo_adm input{background:#669608}
a.btn_admin { background:#669608;border:1px solid #669608}
</style>
<!-- } 라인,버튼색깔 관리자 입력 -->





<form role="form" method="post">
<input type="hidden" name="bno" value="${board.bno }">
<!-- 게시물 읽기 시작 { -->
<article id="bo_v" style="width:100%">
    <header>
        <h1 id="bo_v_title">${board.title }</h1>
    </header>

    <section id="bo_v_info">
        <h2>페이지 정보</h2>
        작성자 <strong><span class="sv_member">${board.writer }</span></strong>
       작성일 <span class="sound_only"></span><strong>${board.regdate }</strong>
      
        
    </section>




							<section id="bo_v_atc">
								<h2 id="bo_v_atc_title">본문</h2>
								<div id="bo_v_img"></div>

								<!-- 본문 내용 시작 { -->
								<table width="100%" border="0" cellpadding="0" cellspacing="0"
									class="basicset">

								</table>

								<!-- 본문 내용 시작 { -->
								<div id="bo_v_con">${board.content}</div>
								<!-- } 본문 내용 끝 -->


							</section>
							
							</form>   
    




<script src="http://lei1007.shiningcorp.com/js/md5.js"></script>

    <!-- 링크 버튼 시작 { -->
    <c:choose>
    <c:when test="${userid != 'admin' }">
    <div id="bo_v_bot">       
        <ul class="bo_v_com"><li><a href="notice" class="btn_b01">목록</a></li></ul>
    </div>
    </c:when>
    <c:when test="${userid == 'admin' }">
    <div id="bo_v_bot">       
        <ul class="bo_v_com"><li><a href="notice" class="btn_b01">목록</a></li></ul>
        <ul class="bo_v_com"><li><button type="submit" class="btn_b01" id="modify">수정</button></li></ul>
        <ul class="bo_v_com"><li><button type="submit" class="btn_b01" id="delete">삭제</button></li></ul>
    </div>
    </c:when>
    </c:choose>
    
    <!-- } 링크 버튼 끝 -->

</article>
<!-- } 게시판 읽기 끝 -->



   	</div><!-- sh_content -->
	
   
	</div><!-- sh_container_wrapper --> 
</div><!-- sh_container -->

<!-- } 콘텐츠 끝 -->



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
</body>
</html> 







<%-- 

<!-- 콘텐츠영역 -->
		<div id="sh_content">
			<div id="sh_content_tit">
				

<form role="form" method="post" class="form-inline" align="center">
<fieldset>
<input type="hidden" name="bno" value="${board.bno}">
 	<label for="writer">글쓴이 </label>
   		<input type="text" value="${board.writer}" name="writer" class="form-control" id="writer"><br>
  	<br>
  	<label for="title">제목 </label> 
   		<input type="text" value="${board.title}" name="title" class="form-control" id="title"><br>
 <br> 	
 <div class="form-group form-horizontal">
  <label for="content">내용</label> 
   <textarea name="content" rows="20" cols="120" class="form-control">${board.content}</textarea>
 </div>
</fieldset>
</form>
<br>




<c:choose>
		<c:when test="${userid != 'admin'}">
			<div align="center">


				 <button type="submit" class="btn btn-default" id="listAll">전체목록</button>
				<br>
				<br>
				<br>
			</div>
		</c:when>
		<c:when test="${userid == 'admin'}">
			<div align="center">
	<button type="submit" class="btn btn-default" id="listAll">전체목록</button>
			
	 <button type="submit" class="btn btn-default" id="modify">수정</button>
	
	 
	 
	 <button type="submit" class="btn btn-default" id="delete">삭제</button>
	

			</div>
		</c:when>
		<c:otherwise>
		</c:otherwise>
	</c:choose>


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
    	</div><!-- sh_content --> --%>