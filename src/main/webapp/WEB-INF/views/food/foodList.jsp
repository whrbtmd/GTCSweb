<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@page import="java.util.*"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="Content-Script-Type" content="text/javascript">
<meta http-equiv="Content-Style-Type" content="text/css">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<title>GTCS/그늘집 메뉴-식사</title>
<link rel="stylesheet"
	href="http://lei1007.shiningcorp.com/css/default.css">
<link rel="stylesheet"
	href="http://lei1007.shiningcorp.com/skin/board/gallery02/style.css">
<link rel="stylesheet"
	href="http://lei1007.shiningcorp.com/css/user.css">
<link rel="stylesheet"
	href="http://lei1007.shiningcorp.com/css/page_style.css">
<link rel="stylesheet"
	href="http://lei1007.shiningcorp.com/sh_img/hd/top_menu/style.css">
<link rel="stylesheet"
	href="http://lei1007.shiningcorp.com/sh_img/hd/aside/style.css">



<script src="http://lei1007.shiningcorp.com/js/jquery-1.8.3.min.js"></script>
<script src="http://lei1007.shiningcorp.com/js/jquery.menu.js"></script>
<script src="http://lei1007.shiningcorp.com/js/common.js"></script>
<script src="http://lei1007.shiningcorp.com/js/wrest.js"></script>

<script type="text/javascript"
	src="http://lei1007.shiningcorp.com/sh_img/hd/aside/jquery-ui.js"></script>
<script src="http://lei1007.shiningcorp.com/sh_img/hd/aside/script.js"></script>
<script
	src="http://lei1007.shiningcorp.com/sh_img/hd/top_menu/script.js"></script>


<!--[if lt IE 8]>
<script src="http://lei1007.shiningcorp.com/js/js/PIE_uncompressed.js"></script> 
<![endif]-->


</head>
<body>


	<body>
	<c:choose>
		<c:when test="${sessionScope.userid == null}">
			<script>
				$(document).ready(function() {
					alert(' 로그인 후 이용할 수 있습니다.');
					location.href = 'GTCSMAIN';
				});
			</script>
		</c:when>

	</c:choose>

	<div id="sh_wrapper">
		<!-- 상단 시작 { -->
		<div id="sh_hd">
			<div class="top_nav_bg"></div>
			<h1 id="hd_h1">공지사항 1 페이지</h1>
			<div id="skip_to_container">
				<a href="#container">본문 바로가기</a>
			</div>
			<div id="sh_hd_wrapper">
				<ul id="sh_tip_menu">
					<li><c:choose>
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
					<h1 id="top_logo"><a href="GTCSMAIN"><img src="/resources/sh_img/hd/top_menu/logo.png" width="150px" height="75px" alt="사이트 로고" /></a></h1>

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

									<li class="list list03"><a href="home">예약</a>
										<ul class="sub_ul3"></ul></li>

								</c:when>
								<c:when test="${userid == 'admin'}">
									<li class="list list03"><a href="adm/home">관리자페이지</a>
										<ul class="sub_ul3"></ul></li>
								</c:when>

							</c:choose>

							<li class="list list04"><a href="score">스코어관리</a></li>

							<li class="list list05"><a href="notice">공지사항</a></li>

						</ul>
					</div>

					<!-- 소분류 끝 -->
				</div>
			</div>
			<!-- } 상단 끝 -->


			<!-- 콘텐츠 시작 { -->
			<div id="sh_container">
				<div id="sh_container_topbg"></div>
				<!-- 서브상단 이미지 -->
				<div id="sh_container_top">
					<img
						src="./resources/sh_img/hd/sub_main_banner/sub_main_banner.png"
						alt="" />
				</div>
				<div id="sh_container_wrapper">
					<!-- 서브메뉴 -->
					<div id="sh_aside">
						<div id="aside_tit">
							<ul>그늘집 메뉴
							</ul>
							<!-- 소분류 시작 -->
							<div id="l_menu">
								<ul>

									<li class='l_menu_OFF'><a href="show_menu">식사</a></li>


									<li class='l_menu_OFF' style=''><a href="show_menu">음료</a>
									</li>

								</ul>
							</div>
							<!-- 소분류 끝 -->

						</div>
						<!-- 대분류 끝 -->


					</div>
					<!-- 콘텐츠영역 --><div id="sh_content">
		<div id="sh_content_tit">
			<h3>그늘집 메뉴</h3>
			<span>홈 > 그늘집 메뉴 > 식사</span>
		</div>

		<!-- <h2 id="container_title">갤러리 B타입<span class="sound_only"> 목록</span></h2> -->

		<!-- 게시판 목록 시작 { -->
		<div id="bo_gall" style="width: 100%">




			<form name="fboardlist" id="fboardlist" method="post">

				<input type='hidden' value="${food.pid}">
				<c:choose>
					<c:when test="${userid == 'admin'}">
						<a href="foodInsert"><img src="./resources/img/finsert.png"
							width="60px" height="35px" class="I"> </a>
					</c:when>
				</c:choose>
				<div>

					<c:forEach items="${listf}" var="food">
						<ul id="sh_gall_ul">

							<li class="sh_gall_li " style=""><input type='hidden'
								value="${food.pid}">
								<ul class="sh_gall_con">


									<li class="sh_gall_href"><a href="Detail?pid=${food.pid}">
											<img src="/getByteImage1?&pid=${food.pid}" width="174"
											height="135">
									</a></li>


									<li class="sh_gall_text_href"><input type='hidden'
										value="${food.pid}"> <a href="Detail?pid=${food.pid}">
											${food.pfood_name} </a>

										<p class="sh_l_txt sh_l_txt01">
											<input type='hidden' value="${food.pid}">
										</p>
										<p class="sh_l_txt">${food.pfood_name}</p>
										<p class="sh_l_txt">${food.pprice} 원</p> <span
										class="sound_only">댓글</span><span class="sound_only">개</span>
										</a></li>

								</ul></li>


						</ul>
					</c:forEach>
				</div>

				<div style="clear: both"></div>
			</form>
		</div>











		<!-- 페이지 -->



		<!-- } 게시판 목록 끝 -->
	</div>
	<!-- sh_content -->


	</div>
	<!-- sh_container_wrapper -->
	</div>
	<!-- sh_container -->

	<!-- } 콘텐츠 끝 -->


	<!-- 하단 시작 { -->
	<div id="sh_ft" style="margin-top: 0px; height: 140px">
		<div id="sh_ft_wrapper">
			<div id="address">
				<p>
					상호 : GTCS 사업자 번호 : 053.940.5114, 대표 : 김건협, 개인정보 관리 책임자 : 서제교
					SJK@naver.com<br /> 주소 : 대구광역시 북구 복현로 35 (복현2동 218), 고객센터 :
					053.940.5114, 팩스 : 053-940-5114 <br>
				<p>
					Copyright ⓒ <strong>2016 YEUNGJIN COLLEGE</strong> All rights
					reserved.
				</p>
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


</body>


</html>

