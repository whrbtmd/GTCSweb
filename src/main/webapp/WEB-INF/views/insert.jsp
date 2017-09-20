<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@page import="java.util.*"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet"
	href="http://lei1007.shiningcorp.com/css/default.css">
<link rel="stylesheet"
	href="http://lei1007.shiningcorp.com/skin/board/sh_basic/style.css">
<link rel="stylesheet"
	href="http://lei1007.shiningcorp.com/css/user.css">
<link rel="stylesheet"
	href="http://lei1007.shiningcorp.com/css/page_style.css">
<link rel="stylesheet"
	href="http://lei1007.shiningcorp.com/sh_img/hd/top_menu/style.css">
<link rel="stylesheet"
	href="http://lei1007.shiningcorp.com/sh_img/hd/aside/style.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<style>
.material-icons {
	margin-left: 30%;
}

.product {
	margin: 0%;
}

footer {
	background-color: #f2f2f2;
	padding: 25px;
}
</style>
<title>상품등록</title>
</head>



<body>


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
						<c:when test="${sessionScope.id == null}">
							<div align="right">
								<a href="joinForm" class="top"><span
									class="glyphicon glyphicon-user white"></span> 회원가입</a> <a
									class="top" href="loginForm" id="myBtnn"> <span
									class="glyphicon glyphicon-log-in white"></span> 로그인
								</a> &nbsp;&nbsp;
							</div>
						</c:when>
						<c:when test="${sessionScope.id == 'admin'}">
							<div class="top" align="right">
								<span class="glyphicon glyphicon-user white"><b>'관리자'님</b></span>&nbsp;&nbsp;
								<a class="top" href="logout"><span
									class="glyphicon glyphicon-log-out white"></span> 로그아웃</a>
								&nbsp;&nbsp;
							</div>
						</c:when>
						<c:otherwise>
							<div class="top" align="right">
								<span class="glyphicon glyphicon-user white"><b>'${sessionScope.id}'님</b></span>&nbsp;&nbsp;
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

						<li class="list list01"><a href="#">PROGRAM</a>
							<ul class="sub_ul1">
								<li><a href="#" class="">GTCS PROGRAM 소개</a> <!-- <a href="#" class="">센터 갤러리</a>  -->
								</li>
								<li class="smenu_back"></li>
							</ul></li>

						<li class="list list02"><a href="#">그늘집</a>
							<ul class="sub_ul2">
								<li><a href="#" class="">프로그램</a></li>
								<li class="smenu_back"></li>
							</ul></li>

						<li class="list list03"><a href="insert?category=DRIVERS">SHOP</a>
							<ul class="sub_ul3">
								<li><a href="insert?category=DRIVERS" class="">DRIVERS</a>
									<a href="insert?category=PUTTER" class="">PUTTER</a> <a
									href="insert?category=CLUB" class="">CLUB</a> <a
									href="insert?category=Hybrids" class="">HYBRIDS</a></li>
								<li class="smenu_back"></li>
							</ul></li>

						<li class="list list04"><a href="info">예약 및 안내</a>
							<ul class="sub_ul4">
								<li><a href="home" class="">예약신청</a></li>
								<li class="smenu_back"></li>
							</ul></li>

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
	
	
	
	

						<div class="container">

							<br> <br>

							<div class="row">




								<c:choose>
									<c:when test="${sessionScope.id == null}">
										<script>
											$(document).ready(function() {
												alert(' 로그인 후 이용할 수 있습니다.');
												location.href = 'GTCSMAIN';
											});
										</script>
									</c:when>

								</c:choose>

								<br /> <br /> <br />


							</div>

							<form role="form" method="post">

								<c:forEach items="${list}" var="p">
									<div class="container_list" style='float: left;'>



										<!-- <i class="material-icons" style="font-size: 15px; color: gray; margin-left: 90%">settings</i> -->



										<input type="hidden" name="id" value="${p.id}"> <input
											type="hidden" name="pnum" value="${p.pnum}"> <br>

										<c:choose>
											<c:when test="${id == 'admin'}">
												<a href="readpro?pnum=${p.pnum}"> <img
													class="material-icons" src="./resources/img/setting.png"
													style='float: center;' width=5% height=5%>
												</a>
											</c:when>
										</c:choose>
										<p>
											<a href="readpro?pnum=${p.pnum}"> <img
												class="material-product" src="resources/image/${p.pimage}"
												width=45% height=45%></a>
										</p>
										<p>_______________________</p>
										<br>
										<p>
											<font color="skyblue"><b>상품명</b></font>
										</p>
										<a href="readpro?pnum=${p.pnum}" style="color: black;"><p>${p.pname}</p></a>
										<p>_______________________</p>
										<br>
										<p>
											<font color="skyblue"><b>상품가격</b></font>
										</p>

										<p>${p.pprice}</p>
										<p>_______________________</p>
										<p>
											<font color="skyblue"><b>제조원</b></font>
										</p>

										<p>${p.pmaker}</p>
										<p>_______________________</p>
										<br>
										<p>
											<font color="skyblue"><b>상품 설명</b></font>
										</p>
										<p>${p.pcontext}</p>
										<br>
									</div>
								</c:forEach>
							</form>




						</div>
						<div class="text-center">
							<ul class="pagination">
								<c:if test="${pageMaker.prev}">
									<li><a
										href="insert${pageMaker.makeSearch(pageMaker.startPage-1)}">&laquo;</a></li>
								</c:if>

								<c:forEach begin="${pageMaker.startPage }"
									end="${pageMaker.endPage }" var="idx">
									<li
										<c:out value="${pageMaker.cri.page == idx?'class = active':''}"/>>
										<a href="insert${pageMaker.makeSearch(idx) }">${idx }</a>
									</li>
								</c:forEach>

								<c:if test="${pageMaker.next && pageMaker.endPage > 0 }">
									<li><a
										href="insert${pageMaker.makeSearch(pageMaker.endPage +1) }">&raquo;</a></li>
								</c:if>
							</ul>
						</div>




					

					<!-- 라인,버튼색깔 관리자 입력 { -->
					<style>
.btn_bo_adm input {
	background: #669608
}

a.btn_admin {
	background: #669608;
	border: 1px solid #669608
}
</style>
					<!-- } 라인,버튼색깔 관리자 입력 -->

					<h2 id="container_title">
						<span class="sound_only">목록</span>
					</h2>

					<!-- 게시판 목록 시작 { -->
					<div id="bo_list" style="width: 100%">
						<!-- 게시판 카테고리 시작 { -->
						<!-- } 게시판 카테고리 끝 -->



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


		<div id="sh_ft" style="margin-top: 150px; height: 140px">
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