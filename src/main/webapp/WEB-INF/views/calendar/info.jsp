<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="Content-Script-Type" content="text/javascript">
<meta http-equiv="Content-Style-Type" content="text/css">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>GTCS/INFORMATION</title>
<link rel="stylesheet" href="http://lei1007.shiningcorp.com/css/default.css">
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





</head>
<body>


	<div id="sh_wrapper">
		<!-- 상단 시작 { -->
		<div id="sh_hd">
			<div class="top_nav_bg"></div>
			<h1 id="hd_h1"></h1>
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
					<h1 id="top_logo">
						<a href="GTCSMAIN"><img
							src="./resources/sh_img/hd/top_menu/logo.png" width="150px"
							height="75px" alt="사이트 로고" /></a>
					</h1>

					<div id="top_menu_wrapper">
						<!--menu!-->
						<ul id="top_menu">


							<li class="list list01"><a href="show_menu">그늘집</a></li>

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

							<li class="list list04"><a href="score">스코어관리</a></li>

							<li class="list list05"><a href="notice">공지사항</a></li>

						</ul>
					</div>
					<!--menu!-->
					<div style="clear: both; visibility: hidden"></div>
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
				<img src="./resources/sh_img/hd/sub_main_banner/sub_main_banner.png"
					alt="" />
			</div>
			<div id="sh_container_wrapper">
				<!-- 서브메뉴 -->
				<div id="sh_aside">
					<div id="aside_tit">
						<ul>예약시스템
						</ul>
						<!-- 소분류 시작 -->
							<div id="l_menu">
								<ul>
								
								
								<c:choose>
								<c:when test="${userid != 'admin'}">

									<li class='l_menu_OFF'><a href="info">프로그램</a></li>

									<li class='l_menu_OFF' style=''><a href="home">예약하기</a> </li>

								</c:when>
								<c:when test="${userid == 'admin'}">
									<li class='l_menu_OFF'><a href="info">프로그램</a></li>

									<li class='l_menu_OFF' style=''><a href="home">예약하기</a> </li>
									
									<li class='l_menu_OFF' style=''><a href="adminReser">신규예약확인</a> </li>
								</c:when>

							</c:choose>
								
								
							</ul>
							</div>
							<!-- 소분류 끝 -->
					</div>
					<!-- 대분류 끝 -->


				</div>
				<!-- 콘텐츠영역 -->
				<div id="sh_content">
					<div id="sh_content_tit">
						<h3>프로그램</h3>
						<span>홈 > 예약 및 안내 > 프로그램</span>
					</div>

					<div id="PageCommon" class="p0201_lei">
						<div class="top_area">
							<p>GTCS PROGRAM</p>
							<div>GTCS 입니다.</div>
							예약요금은 모든 적용 요금이며, -<br /> 그린피, 카트비, 캐디피를 포함 합니다.
						</div>
						<div class="cont_area">
							<p class="tit">그린피<span>　> 그린피 후불입니다.</span></p>
							<dl>
								<dt>평　일</dt>
								<dd>이용요금 : 100,000원 (장비임대료 포함)</dd>
								<dt>주말 및 공휴일</dt>
								<dd>이용요금 : 140,000원 (장비임대료 포함)</dd>
							</dl>
							<p class="tit">카트비<span>　> 카트비 후불입니다.</span></p>
							<dl>
								<dt>전동카트(5인용)</dt>
								<dd>이용요금 : 70,000원 </dd>
								
							</dl>
							<p class="tit">
								캐디피 <span>　> 캐디피 후불입니다.</span>
							</p>
							<dl>
								<dt>캐　디</dt>
								<dd>캐디피 : 120,000원 / 팀(4BAG)</dd>
								<!-- <dt>친절 캐디</dt>
								<dd>캐디피 : 100,000원 / 팀(4)</dd> -->
								
							</dl>
						</div>
						<script>
							$(document).ready(
									function() {
										$('.p0201_lei dl dt:odd').css(
												'background-color', '#669608');// 짝수 dt 배경컬러
									});
						</script>
					</div>

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

	</div>
</body>
</html>

