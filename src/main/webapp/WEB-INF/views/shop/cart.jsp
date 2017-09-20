<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="UTF-8">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	<link rel="stylesheet" type="text/css" href="../css/style2.css" />
	<link rel="stylesheet" type="text/css" href="../css/style3.css" />
	<link rel="stylesheet" type="text/css" href="../css/bootstrap.css" />
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

							<script type="text/javascript"
								src="http://lei1007.shiningcorp.com/sh_img/hd/aside/jquery-ui.js"></script>
							<script
								src="http://lei1007.shiningcorp.com/sh_img/hd/aside/script.js"></script>
							<script
								src="http://lei1007.shiningcorp.com/sh_img/hd/top_menu/script.js"></script>
							<link rel="stylesheet"
								href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">
								<title>GTCS/장바구니</title> <script>
				$(document).ready(
						function() {
							$('#searchBtn').on(
									"click",
									function(event) {
										self.location = "list"
												+ '?'
												+ "searchType="
												+ $("select option:selected")
														.val() + "&keyword="
												+ $('#keywordInput').val();
									});

						});
			</script>
			<style>
.navbar-header {
	backgroud-color: white;
}

.top {
	color: gray;
	margin-left: 10px;
}

.top-main {
	background-color: #6B9900;
	width: 100%;
	height: 60px;
	font-color: white;
}

.top-main a {
	color: white;
	margin-left: 80px;
	font-weight: bold;
	margin-bottom: 0 auto;
	font-size: 10pt;
}

.top-main a:hover {
	color: gray;
	text-decoration: none;
}

.top-main-right {
	text-color: black;
	margin-right: 80px;
}

.modal-header, h4, .close {
	background-color: #5cb85c;
	color: white !important;
	text-align: center;
	font-size: 30px;
}

.modal-footer {
	background-color: #f9f9f9;
}
</style>
</head>

<body>
	<div id="sh_hd">

		<div id="sh_hd_wrapper">
			<ul id="sh_tip_menu">
				<li><c:choose>
						<c:when test="${sessionScope.userid == null}">
							<div align="right">
								<a href="joinForm" class="top"><span
									class="glyphicon glyphicon-user"></span> 회원가입</a> <a class="top"
									href="loginForm"> <span class="glyphicon glyphicon-log-in"></span>
									로그인
								</a> &nbsp;&nbsp;
							</div>
						</c:when>
						<c:when test="${sessionScope.userid == 'admin'}">
							<div class="top" align="right">
								<span class="glyphicon glyphicon-user"><b>'관리자'님</b></span>&nbsp;&nbsp;
								<a class="top" href="logout"><span
									class="glyphicon glyphicon-log-out "></span> 로그아웃</a> &nbsp;&nbsp;
							</div>
						</c:when>
						<c:otherwise>
							<div class="top" align="right">
								<span class="glyphicon glyphicon-user"><b>'${sessionScope.userid}'님</b></span>&nbsp;&nbsp;
								<a class="top" href="logout"><span
									class="glyphicon glyphicon-log-out "></span> 로그아웃</a> &nbsp;&nbsp;
							</div>
						</c:otherwise>
					</c:choose></li>
			</ul>
			<div id="sh_top_menu_wrapper">
				<h1 id="top_logo">
					<a href="../GTCSMAIN"><img
						src="../resources/sh_img/hd/top_menu/logo.png" width="150px"
						height="75px" alt="사이트 로고" title=""></a>
				</h1>

				<div id="top_menu_wrapper">
					<!--menu!-->
					<ul id="top_menu">


						<li class="list list01"><a href="../show_menu">그늘집</a></li>

						<li class="list list02"><a href="../shop/list">쇼핑몰</a>
							<ul class="sub_ul2">
								<li><a href="shop/goodlist?category=Driver" class="">DRIVERS</a>
									<a href="shop/goodlist?category=PUTTER" class="">PUTTER</a> <a
									href="shop/goodlist?category=CLUB" class="">CLUB</a> <a
									href="shop/goodlist?category=HYBRIDS" class="">HYBRIDS</a></li>
								<li class="smenu_back"></li>
							</ul></li>

						<c:choose>
							<c:when test="${userid != 'admin'}">

								<li class="list list03"><a href="../info">예약 및 안내</a>
									<ul class="sub_ul3"></ul></li>

							</c:when>
							<c:when test="${userid == 'admin'}">
								<li class="list list03"><a href="../adm/home">관리자페이지</a>
									<ul class="sub_ul3"></ul></li>
							</c:when>

						</c:choose>

						<li class="list list04"><a href="#">스코어관리</a></li>

						<li class="list list05"><a href="../notice">공지사항</a></li>

					</ul>
				</div>
				<!--menu!-->
				<div style="clear: both; visibility: hidden"></div>
			</div>
			<!-- 소분류 끝 -->
		</div>
	</div>
	<div id="sh_container">

		<!-- 서브상단 이미지 -->
		<div id="sh_container_top">
			<img src="../resources/sh_img/hd/sub_main_banner/sub_main_banner.png" ;
				alt="">
		</div>
<div id="sh_container_wrapper">
		<div class="breadcurb-area">
			<div class="container">
				<ul class="breadcrumb">
					<li><a href="../GTCSMAIN">Home</a></li>
					<li><a href="../shop/list">Shop</a></li>
					<li>Cart</li>
				</ul>
			</div>
		</div>
		<div class="chart-area">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<div class="chart-item table-responsive fix">
							<table class="col-md-12">
								<thead>
									<tr>
										<th class="th-product">Product</th>
										<th class="th-details">Details</th>
										<th class="th-edit">Edit</th>
										<th class="th-qty">Qty</th>
										<th class="th-price">Price</th>
										<th class="th-total">Sub Total</th>
										<th class="th-delate">Delete</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="list" items="${cartlist}">
										<tr>
											<td class="th-product"><a href="#"><img
													src="/shop/getByteImage?&goodsNumber=${list.shop_no}"
													alt="cart"></a></td>
											<td class="th-details">
												<h2>
													<a href="/board/shop/read?goodsNumber=${list.cno}">${list.name}</a>
												</h2>
												<div class="best-product-rating">
													<a href="#"><i class="fa fa-star"></i></a> <a href="#"><i
														class="fa fa-star"></i></a> <a href="#"><i
														class="fa fa-star"></i></a> <a href="#"><i
														class="fa fa-star-o"></i></a> <a href="#"><i
														class="fa fa-star-o"></i></a>
												</div>
												<p>Product Color : Red</p>
												<p>Product Code : 2201 RS</p>
											</td>
											<td class="th-edit"><a href="#">Edit</a></td>
											<td class="th-qty"><input type="number" min="1"
												placeholder="1" value="${list.quantity }"></td>
											<td id="price_${list.shop_no}" vals="${list.price}"
												class="th-price">${list.price}</td>
											<td id="sub_tot_${list.shop_no}" class="th-total">${list.quantity * list.price}</td>
											<td class="th-delate"><a href="delCart?no=${list.cno}"
												class="del_cart" vals="${list.cno}"><i
													class="fa fa-trash"></i></a></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
						<div class="cart-button">
							<button type="button" class="btn">Continue Shopping</button>
						</div>
					</div>
				</div>

			</div>
		</div>
		</div>
</body>
</html>