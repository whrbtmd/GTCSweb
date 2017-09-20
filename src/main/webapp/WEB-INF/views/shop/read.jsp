<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="UTF-8">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   <link rel="stylesheet" type="text/css" href="../css/style2.css" />
   <link rel="stylesheet" type="text/css" href="../css/style3.css" />
   <link rel="stylesheet" type="text/css" href="../css/bootstrap.css" />
   <link rel="stylesheet" href="http://lei1007.shiningcorp.com/css/default.css">
<link rel="stylesheet" href="http://lei1007.shiningcorp.com/skin/board/sh_basic/style.css">

<link rel="stylesheet" href="http://lei1007.shiningcorp.com/css/user.css">
<link rel="stylesheet" href="http://lei1007.shiningcorp.com/css/page_style.css">
<link rel="stylesheet" href="http://lei1007.shiningcorp.com/sh_img/hd/top_menu/style.css">
<link rel="stylesheet" href="http://lei1007.shiningcorp.com/sh_img/hd/aside/style.css">

<script type="text/javascript" src="http://lei1007.shiningcorp.com/sh_img/hd/aside/jquery-ui.js"></script>
<script src="http://lei1007.shiningcorp.com/sh_img/hd/aside/script.js"></script>
<script src="http://lei1007.shiningcorp.com/sh_img/hd/top_menu/script.js"></script>
	<link rel="stylesheet"
		href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">
<!-- 	<link rel="stylesheet" type="text/css" href="../css/bootstrap.css" /> -->
	<link rel="stylesheet" type="text/css" href="../css/include.css" />
	<link rel="stylesheet" type="text/css" href="../css/view.css" />
	<title>GTCS/상품상세정보</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

	
<script>
$(document).ready(function(){
	var formObj = $("form[role='form']");
	
	$("#ImageButton1").on("click", function(){
		formObj.attr("action", "buy?address=${user.address }&userid=${user.userid }&name=${user.username }&price=${goodsVO.price }");
		formObj.submit();
	});

});

</script>
	<style>
.navbar-header {
	backgroud-color: white;
}
.name{
	color:white;
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
			<img src="../resources/sh_img/hd/sub_main_banner/sub_main_banner.png"
				alt="">
		</div>
<div id="sh_container_wrapper">
	<div id="sub">

		<form role="form" method="post" action = "read?userid=${userid}">
		<div id="detail">
			<div class="pimg">
				<div class="bimg">

					<script language="javascript">
						function changeImage(ee) {
							document.getElementById("GD_IMG_DETAILVIEW").src = ee.src;
						}
						
					</script>

					<!-- 500상품이미지 -->
					<img id="GD_IMG_DETAILVIEW"
						src="/shop/getByteImage?&goodsNumber=${goodsVO.bno}"
						style="height: 400px; width: 400px;" />

				</div>

				<div class="simg">
					<ul>
						<li><img id="SGD_IMG_PATH"
							onclick="javascript:changeImage(this);"
							src="/shop/getByteImage?&goodsNumber=${goodsVO.bno}"
							style="height: 72px; width: 72px; cursor: pointer" /></li>
						<li><img id="SGD_IMG_PATH2"
							onclick="javascript:changeImage(this);"
							src="http://www.itemcenter.co.kr/gdsimage/listgdsnull1.jpg"
							style="height: 72px; width: 72px; cursor: pointer; margin:0;" /></li>
						<li><img id="SGD_IMG_PATH3"
							onclick="javascript:changeImage(this);"
							src="http://www.itemcenter.co.kr/gdsimage/listgdsnull1.jpg"
							style="height: 72px; width: 72px; cursor: pointer" /></li>
						<li><img id="SGD_IMG_PATH4"
							onclick="javascript:changeImage(this);"
							src="http://www.itemcenter.co.kr/gdsimage/listgdsnull1.jpg"
							style="height: 72px; width: 72px; cursor: pointer" /></li>
						<!-- 썸네일이미지 -->
					</ul>
				</div>
			</div>

			<div class="d1">
				<div class="d2">
					<ul>
						<!-- 브랜드 -->
						<li class="brands">${goodsVO.manufacturer}</li>

						<!-- 상품명 -->
						<li class="p_name">${goodsVO.name} </li>
						<li class="p_title1">
							<div>
								<ul>
									<div id="PanPrice8_1">

										<li><b>가격</b></li>

									</div>



									<li style="margin-top: 20px;">&nbsp;</li>
								
									<li>배송비</li>
									<li>제조사</li>
									<li>모델명</li>
									<li>상품번호</li>
									<li>&nbsp;</li>
									<li>수량</li>
								</ul>
							</div>
						</li>

						<li class="p_info">
							<div>
								<ul>

									&nbsp;
									<li class="line1"> &nbsp;</li>
									<div id="PanPrice8">

										<li class="price2">${goodsVO.price}원</li>

									</div>

									<!-- 포인트적립 -->
									<li class="line1" style="margin-top: 35px">&nbsp;</li>
									<!-- 배송비 -->
									<li class="line1">10만원이상 무료배송</li>
									<!-- 제조사/원산지 -->
									<li class="line1">${goodsVO.manufacturer}</li>
									<!-- 모델명 -->
									<li class="line1 name">${goodsVO.name}</li>
									<!-- 상품코드 -->
									<li class="line1">${goodsVO.bno}</li>
									<input type="hidden" name="bno" id="bno" value="${goodsVO.bno}"/>
									<input type="hidden" name="shop_no" id="shop_no" value="${goodsVO.bno}"/>
									<!-- 옵션1 -->
									<li class="line1">${goodsVO.userid}</li>
									<!-- 옵션2 -->
									<li class="line1" style="margin-top: 6px">&nbsp;</li>
									<!-- 옵션2 -->
<!-- 									<li class="line1"> &nbsp;</li> -->
									<!-- 수량 -->
									<li class="line1" style="margin-top: 17px"><input
										name="quantity" type="text" value="1" maxlength="5"
										id="quantity" class="inputbox"
										onClick="this.setSelectionRange(0, this.value.length)"
										onkeyup="this.value=number_filter(this.value);"
										style="width: 40px; height: 20px;" /></li>
								</ul>
							</div>
						</li>




					</ul>
				</div>

				<div class="d3">
					<ul>
						<li><input type="image" name="ImageButton1" id="ImageButton1"
							title="바로주문하기" src="../resources/img/주문.JPG" onclick="" /></li>
						<li><input type="image" name="submit" id="ImageButton2"
							title="장바구니담기" src="../resources/img/장바구니.JPG" value="장바구니"></li>
						<li style="clear: both; margin-top: 25px"><a id="HyperLink3"
							href="list">리스트로 돌아가기 &gt;&gt;</a></li>
					</ul>
				</div>

			</div>

		</div>
		</form>
		<!-- 상품상세_기본정보 끝 -->
	</div>
	</div>
</body>
</html>