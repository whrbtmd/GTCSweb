<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta charset="utf-8">
<meta http-equiv="Content-Script-Type" content="text/javascript">
<meta http-equiv="Content-Style-Type" content="text/css">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>GTCS메인화면</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<link rel="stylesheet"
	href="http://lei1007.shiningcorp.com/css/default.css">
<link rel="stylesheet"
	href="http://lei1007.shiningcorp.com/skin/latest/sh_basic/style.css">
<link rel="stylesheet"
	href="http://lei1007.shiningcorp.com/css/user.css">
<link rel="stylesheet"
	href="http://lei1007.shiningcorp.com/css/page_style.css">
<!-- <link rel="stylesheet"type="text/css"href="css/font1.css" /> -->
<link rel="stylesheet"type="text/css"href="css/font1.css" />
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
<script>
$(document).ready(function(){
    $(document.body).on('click', '.iiii', function(){
        location.href="https://shielded-fortress-32957.herokuapp.com/php/admin/admin.html"
    });
});
</script>
<style>
/* body {
font-size:20px;
} */
</style>
</head>
<body>

	<div id="sh_wrapper">
		<!-- 상단 시작 { -->
		<div id="sh_hd">
			<div class="top_nav_bg"></div>
			<h1 id="hd_h1">샤이닝 - 레저/스포츠 홈페이지 샘플</h1>
			<div id="skip_to_container">
				<a href="#container">본문 바로가기</a>
			</div>

			<!-- 팝업레이어 시작 { -->
			<div id="hd_pop">
				<h2>팝업레이어 알림</h2>

				<span class="sound_only">팝업레이어 알림이 없습니다.</span>
			</div>

			<script>
				$(function() {
					$(".hd_pops_reject").click(function() {
						var id = $(this).attr('class').split(' ');
						var ck_name = id[1];
						var exp_time = parseInt(id[2]);
						$("#" + id[1]).css("display", "none");
						set_cookie(ck_name, 1, exp_time, g5_cookie_domain);
					});
					$('.hd_pops_close').click(function() {
						var idb = $(this).attr('class').split(' ');
						$('#' + idb[1]).css('display', 'none');
					});
					$("#hd").css("z-index", 1000);
				});
			</script>
			<!-- } 팝업레이어 끝 -->
			<div id="sh_hd_wrapper">
				<ul id="sh_tip_menu">
					<li><c:choose>
							<c:when test="${sessionScope.userid == null}">
								<div align="right">
									<a href="joinForm" class="top"> <span
										class="glyphicon glyphicon-user small_tip"></span> 회원가입
									</a> <a class="top" href="loginForm"> <span
										class="glyphicon glyphicon-log-in small_tip"></span> 로그인
									</a> &nbsp;&nbsp;
								</div>
							</c:when>
							<c:when test="${sessionScope.userid == 'admin'}">
								<div class="top" align="right">
									<span class="glyphicon glyphicon-user small_tip"><b>'관리자'님</b></span>&nbsp;&nbsp;
									<a class="top" href="logout"><span
										class="glyphicon glyphicon-log-out small_tip"></span> 로그아웃</a>
									&nbsp;&nbsp;
								</div>
							</c:when>
							<c:otherwise>
								<div class="top" align="right">

									<span class="glyphicon glyphicon-user small_tip"><b>'${sessionScope.userid}'님</b></span>

									&nbsp;&nbsp; <a class="top" href="logout"> <span
										class="glyphicon glyphicon-log-out small_tip"></span> 로그아웃
									</a> &nbsp;&nbsp; <a class="top mypage"
										href="myPage?userid=${sessionScope.userid}"> <span
										class="glyphicon glyphicon-log-out small_tip"></span> 마이페이지
									</a> &nbsp;&nbsp;
								</div>
							</c:otherwise>
						</c:choose></li>
				</ul>



				<div id="sh_top_menu_wrapper">
					<h1 id="top_logo">
						<img src="./resources/sh_img/hd/top_menu/logo.png" width="150px"
							height="75px" alt="사이트 로고" />
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
			<script>
				/* 익스7,8에서 png파일 모션시 투명깨지는것 막아줌 */
				function setPng24(obj) {
					obj.width = obj.height = 1;
					obj.className = obj.className.replace(/\bpng24\b/i, '');
					obj.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(src='"
							+ obj.src + "',sizingMethod='image');"
					obj.src = '';
					return '';
				}
			</script>

			<div id="sh_container_wrapper_m">
				<div id="main_banner">
					<link rel="stylesheet" type="text/css"
						href="/sh_img/index/main_banner/style.css" />
					<script type="text/javascript"
						src="/sh_img/index/main_banner/script.js"></script>

					<div id="slideshow">
						<ul id="slides">
							<li><img
								src="./resources/sh_img/index/main_banner/img/main_banner_01.png"
								alt="" /></li>
							<li><img
								src="./resources/sh_img/index/main_banner/img/main_banner_02.png"
								alt="" /></li>
						</ul>
						<ul id="pagination" class="pagination">
							<li onclick="slideshow.pos(0)"></li>
							<li onclick="slideshow.pos(1)"></li>
						</ul>
					</div>

					<script type="text/javascript">
						var slideshow = new TINY.fader.fade('slideshow', {
							id : 'slides',
							auto : 10, /* 전환속도 */
							resume : true,
							navid : 'pagination',
							activeclass : 'current',
							visible : true,
							position : 0
						});
					</script>
				</div>
				<!-- index 시작 { -->
				<div id="sh_index_banner">
					<div id="idx_box01">
						<div id="m01"></div>
						<div id="m02">
							<a href="shop/list"><h3>GOLFSHOP</h3></a>
							<p>
								GOLF<br />GOODS
							</p>
						</div>
						<div id="m03">
							<h3>PROGOLF</h3>
							<a href="info"><p>
								RESERVATION<br />
							</p></a>
						</div>
						<div id="m04">
							<h4>
								GTCS CENTER
								</h3>
								<p class="tel">053.940.5114</p>
								<p class="txt">
									AM 09:00 ~ PM 06:00<br />Fax. 053-940-5114<br />E-Mail.
									jyyoon@gmail.com
								</p>
						</div>
						<div id="m05"></div>
						<div id="m06"></div>
						<div id="m07"></div>
						<div id="m08">
							<h4>
								NEWS&amp;NOTICE <a href="notice">+</a>
							</h4>

							<!-- 공지사항 최신글 시작 { -->
							<div class="sh_lt">
								<!--    <strong class="lt_title"><a href="/board.php?bo_table="></a></strong>!-->
								<ul>
									<li><span class="sh_notice"> <a href="notice" style="font-size:15px;">시스템
												점검 <br>공지사항</a></span></li>

								</ul>
								<!--<div class="lt_more"><a href="/board.php?bo_table="><span class="sound_only"></span>더보기</a></div>!-->
							</div>
							<!-- } 공지사항 최신글 끝 -->
						</div>
					</div>
					<c:choose>

						<c:when test="${sessionScope.userid != 'admin'}">
							<li class="list list03"><a href="adm/home"></a>
								<ul class="sub_ul3"></ul></li>

							<div id="idx_box2">
								<script src="/sh_img/index/idx_box02/script.js"
									type="text/javascript"></script>
								<link rel="stylesheet" type="text/css" media="screen"
									href="/sh_img/index/idx_box02/style.css" />

								<div id="idx_box02_tit" style="height: 50px;">
									<!-- <img src="./resources/sh_img/index/idx_box02/txt.png" /> -->
									<p>
										<strong style="font-size:20px;">Traffic</strong>
									</p>
									<br /><br /><br />
								</div>

								<div id="jqb_object">
									<div class="jqb_slides">
										<div class="jqb_slide" title="">
											<img src="./resources/sh_img/index/idx_box02/main_banner_01.png"
												title="" alt="" />
										</div>
									</div>
									
								</div>
								<script type="text/javascript">
									
								</script></a>
							</div>
						</c:when>
						<c:when test="${sessionScope.userid == 'admin'}">
							<li class="list list03"><a href="adm/home"></a>
								<ul class="sub_ul3"></ul></li>

							<div id="idx_box2">
								<a href="#"> 
								<script src="/sh_img/index/idx_box02/script.js" type="text/javascript"></script>
									<link rel="stylesheet" type="text/css" media="screen" href="/sh_img/index/idx_box02/style.css" />

									<div id="idx_box02_tit">
										
										<p sytle="font-size:20px !important;">
											<strong>Traffic</strong>
										</p>
										<br /><br /><br />
									</div>

									<div id="jqb_object">
										<div class="jqb_slides">
											<div class="jqb_slide" title="">
												<img
													src="./resources/sh_img/index/idx_box02/main_banner_01.png"
													title="" alt="" class="iiii" />
											</div>
										</div>
										<div class="jqb_bar">
											<div id="btn_prev" class="jqb_btn jqb_btn_prev"></div>
											<div id="btn_next" class="jqb_btn jqb_btn_next"></div>
										</div>
									</div> <script type="text/javascript">
										
									</script></a>
							</div>
						</c:when>
					</c:choose>

				</div>
				<!-- } index 끝 -->


			</div>
			<!-- sh_container_wrapper -->
		</div>
		<!-- sh_container -->

		<!-- } 콘텐츠 끝 -->




		<!-- 하단 시작 { -->
		<div id="sh_ft" style="margin-top: -140px; height: 140px">
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
				font_resize("container",
						get_cookie("ck_font_resize_rmv_class"),
						get_cookie("ck_font_resize_add_class"));
			});
		</script>
</body>
</html>
