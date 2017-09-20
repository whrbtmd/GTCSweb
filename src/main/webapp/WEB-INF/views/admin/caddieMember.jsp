<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://lei1007.shiningcorp.com/css/default.css">
<link rel="stylesheet" href="http://lei1007.shiningcorp.com/skin/board/sh_basic/style.css">
<link rel="stylesheet" href="http://lei1007.shiningcorp.com/css/user.css">
<link rel="stylesheet" href="http://lei1007.shiningcorp.com/css/page_style.css">
<link rel="stylesheet" href="http://lei1007.shiningcorp.com/sh_img/hd/top_menu/style.css">
<link rel="stylesheet" href="http://lei1007.shiningcorp.com/sh_img/hd/aside/style.css">
	<script src="http://lei1007.shiningcorp.com/js/jquery-1.8.3.min.js"></script>
<script>
      $(document).ready(
            function() {
               $('#searchBtn').on(
                     "click",
                     function(event) {
                        self.location = "caddieMember" + '?' + "searchType="
                              + $("select option:selected").val()
                              + "&keyword="
                              + $('#keywordInput').val();
                     });

            });
   </script>
<script>
$(document).ready(function(){
    $('[data-toggle="tooltip"]').tooltip();
});
</script>
<style>

.insert{
	margin-top:30px; margin-left:750px; margin-bottom:10px;
}
.search{
	margin-top:80px; margin-left:1100px;
}
.imgg{
	margin-top:50px; margin-left:650px;
	width:400px; height:20px;
}
.title{
	margin-top:10px;
	
	width:130px;
	height :80px;
}
</style>

<title>GTCS/캐디목록</title>

</head>

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
					<h1 id="top_logo">
						<a href="GTCSMAIN"><img
							src="./resources/sh_img/hd/top_menu/logo.png" width="150px"
							height="75px" alt="사이트 로고" /></a>
					</h1>

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
						<ul>캐디 관리
						</ul>
					</div>
					<!-- 대분류 끝 -->


				</div>
				<!-- 콘텐츠영역 -->
				<div id="sh_content">
					<div id="sh_content_tit">





<center><img class="title" src ="./resources/img/cdlist.png"></center>

<div class="insert">
	<a href="caddieInsert"><img src="./resources/img/insert.png" data-toggle="tooltip" title="캐디등록!" width="40px;" height="50px;"></a>
</div>




						<div class="tbl_head01 tbl_wrap">
							<table>
								<caption>캐디목록</caption>
								<thead>
									<tr>
										<th scope="col">회원아이디</th>
										<th scope="col">회원 이름</th>
										<th scope="col">연락처</th>
										<!-- <th scope="col">주소</th> -->
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${listcd}" var="member">
										<tr class="">
											<td class="td_name sv_use"><center>${member.userid}</center></td>
											<td class="td_name sv_use"><a
												href="readcd?userid=${member.userid}" style="color: black;"><center>${member.username}</center></a></td>
											<td class="td_name sv_use"><center>${member.phone}</center></td>
											<%-- <td class="td_name sv_use"><center>${member.address}</center></td> --%>

										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>






















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
				font_resize("container",
						get_cookie("ck_font_resize_rmv_class"),
						get_cookie("ck_font_resize_add_class"));
			});
		</script>

	</div>
</body>
</html>
