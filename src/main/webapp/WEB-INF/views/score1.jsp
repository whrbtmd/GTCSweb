<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
	<link rel="stylesheet"type="text/css"href="css/font1.css" />
<style>
.tbl_wrap table {
	width: 100%;
	border-collapse: collapse;
	border-spacing: 0;
	border-top: 2px solid #666
}

.tbl_wrap caption {
	padding: 10px 0;
	font-weight: bold;
	text-align: left
}

.tbl_head01 {
	margin: 0 0 10px
}

.tbl_head01 caption {
	padding: 0;
	font-size: 0;
	line-height: 0;
	overflow: hidden
}

.tbl_head01 thead th {
	padding: 12px 0;
	border-bottom: 1px solid #BFBFBF;
	background: #fff;
	color: #333;
	font-size: 1.1em;
	text-align: center;
	letter-spacing: 0
}

.tbl_head01 thead a {
	color: #333
}

.tbl_head01 thead th input {
	vertical-align: top
} /* middle 로 하면 게시판 읽기에서 목록 사용시 체크박스 라인 깨짐 */
.tbl_head01 tfoot th, .tbl_head01 tfoot td {
	padding: 10px 0;
	border-top: 1px solid #c1d1d5;
	border-bottom: 1px solid #c1d1d5;
	background: #d7e0e2;
	text-align: center
}

.tbl_head01 tbody th {
	padding: 8px 0;
	border-top: 1px solid #e9e9e9;
	border-bottom: 1px solid #e9e9e9
}

.tbl_head01 td {
	padding: 10px 5px;
	border-top: 1px solid #e9e9e9;
	border-bottom: 1px solid #e9e9e9;
	line-height: 1.5em;
	word-break: break-all;
	font-size: 1.1em
}

.tbl_head01 a {
	
}

.tbl_head02 {
	margin: 0 0 10px
}

.tbl_head02 caption {
	padding: 0;
	font-size: 0;
	line-height: 0;
	overflow: hidden
}

.tbl_head02 thead th {
	padding: 5px 0;
	border-top: 1px solid #d1dee2;
	border-bottom: 1px solid #d1dee2;
	background: #e5ecef;
	color: #383838;
	font-size: 0.95em;
	text-align: center;
	letter-spacing: -0.1em
}

.tbl_head02 thead a {
	color: #383838
}

.tbl_head02 thead th input {
	vertical-align: top
} /* middle 로 하면 게시판 읽기에서 목록 사용시 체크박스 라인 깨짐 */
.tbl_head02 tfoot th, .tbl_head02 tfoot td {
	padding: 10px 0;
	border-top: 1px solid #c1d1d5;
	border-bottom: 1px solid #c1d1d5;
	background: #d7e0e2;
	text-align: center
}

.tbl_head02 tbody th {
	padding: 5px 0;
	border-top: 1px solid #e9e9e9;
	border-bottom: 1px solid #e9e9e9
}

.tbl_head02 td {
	padding: 5px 3px;
	border-top: 1px solid #e9e9e9;
	border-bottom: 1px solid #e9e9e9;
	line-height: 1.4em;
	word-break: break-all
}

.tbl_head02 a {
	
}
</style>
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



<script src="http://lei1007.shiningcorp.com/js/jquery-1.8.3.min.js"></script>
<script src="http://lei1007.shiningcorp.com/js/jquery.menu.js"></script>
<script src="http://lei1007.shiningcorp.com/js/common.js"></script>
<script src="http://lei1007.shiningcorp.com/js/wrest.js"></script>

<script type="text/javascript"
	src="http://lei1007.shiningcorp.com/sh_img/hd/aside/jquery-ui.js"></script>
<script src="http://lei1007.shiningcorp.com/sh_img/hd/aside/script.js"></script>
<script
	src="http://lei1007.shiningcorp.com/sh_img/hd/top_menu/script.js"></script>


<title>GTCS/스코어관리</title>
<script src="/board/resources/js/score.js"></script>


</head>
<body>
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
					<li>




						<div class="top" align="right">
							<span class="glyphicon glyphicon-user white"><b>${sessionScope.userid}님</b></span>&nbsp;&nbsp;
							<a class="top" href="logout"><span
								class="glyphicon glyphicon-log-out white"></span> 로그아웃</a>
							&nbsp;&nbsp;
						</div>

					</li>
				</ul>
				<div id="sh_top_menu_wrapper">
					<h1 id="top_logo">
						<a href="GTCSMAIN"><img
							src="./resources/sh_img/hd/top_menu/logo.png" width="150px"
							height="75px" alt="사이트 로고" title=""></a>
					</h1>

					<div id="top_menu_wrapper">
						<!--menu!-->
						<ul id="top_menu">


							<li class="list list01"><a href="show_menu" class="">그늘집</a>
							</li>

							<li class="list list02"><a href="shop/list">쇼핑몰</a>
								<ul class="sub_ul2">
									<li><a href="shop/goodlist?category=Driver" class="">DRIVERS</a>
										<a href="shop/goodlist?category=PUTTER" class="">PUTTER</a> <a
										href="shop/goodlist?category=CLUB" class="">CLUB</a> <a
										href="shop/goodlist?category=HYBRIDS" class="">HYBRIDS</a></li>
									<li class="smenu_back"></li>
								</ul></li>




							<li class="list list03"><a href="info" class="">예약 및 안내</a>
								<ul class="sub_ul3" style="display: none;"></ul></li>






							<li class="list list04"><a href="#" class="">스코어관리</a></li>

							<li class="list list05"><a href="notice" class="">공지사항</a></li>

						</ul>
					</div>
					<!--menu!-->
					<div style="clear: both; visibility: hidden"></div>
				</div>
				<div id="sh_container_top">
					<img
						src="./resources/sh_img/hd/sub_main_banner/sub_main_banner.png"
						alt="">
				</div>
				<div id="sh_container_wrapper">
					<div id="maincontent">
						<!-- Left Content -->
						<div id="leftcontent">
						
						
						
						
						
						
						
						
						
 			<div class="tbl_head01 tbl_wrap">

							<table align="center" style="width: 80%;">
								<caption>스코어 조회</caption>
								<thead>
									<tr>
										<th>홀 이름</th>
										<th>1홀</th>
										<th>2홀</th>
										<th>3홀</th>
										<th>4홀</th>
										<th>5홀</th>
										<th>6홀</th>
										<th>7홀</th>
										<th>8홀</th>
										<th>9홀</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="m" items="${score}">
										<tr>
										<td>${m.gname}</td>
											<td>${m.h1}</td>
											<td>${m.h2}</td>
											<td>${m.h3}</td>
											<td> ${m.h4}</td>
											<td> ${m.h5}</td>
											<td>${m.h6}</td>
											<td>${m.h7}</td>
											<td>${m.h8}</td>
											<td> ${m.h9}</td>
										</tr>
										
									</c:forEach>
								</tbody>
							</table>
</div>
						</div>


					</div>
				</div>
				<!-- End Content -->
			</div>
			
			<!-- 하단 시작 { -->
<div id="sh_ft" style="margin-top:13%;height:140px" >
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
</body>
</html>