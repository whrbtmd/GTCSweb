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
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	<link rel="stylesheet" type="text/css" href="../css/style2.css" />
	<link rel="stylesheet" type="text/css" href="../css/style3.css" />
	<link rel="stylesheet" type="text/css" href="../css/bootstrap.css" />
	<link rel="stylesheet" href="http://lei1007.shiningcorp.com/css/default.css">
		<link rel="stylesheet" href="http://lei1007.shiningcorp.com/skin/board/sh_basic/style.css">

			<link rel="stylesheet" 	href="http://lei1007.shiningcorp.com/css/user.css">
				<link rel="stylesheet" href="http://lei1007.shiningcorp.com/css/page_style.css">
					<link rel="stylesheet"type="text/css"href="../css/font1.css" />
						<link rel="stylesheet" href="http://lei1007.shiningcorp.com/sh_img/hd/aside/style.css">

		<title>GTCS/상품목록</title> <script>
			$(document).ready(
					function() {
						$('#searchBtn').on(
								"click",
								function(event) {
									self.location = "goodlist" + '?'
											+ "searchType="
											+ $('#searchType').val()
											+ "&keyword="
											+ $('#keywordInput').val()
											+ "&category="
											+ $('#category').val();
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
										class="glyphicon glyphicon-user"></span> 회원가입</a> 
										<a class="top" href="loginForm"> 
										<span class="glyphicon glyphicon-log-in"></span> 로그인
									</a> &nbsp;&nbsp;
								</div>
							</c:when>
							<c:when test="${sessionScope.userid == 'admin'}">
								<div class="top" align="right">
									<span class="glyphicon glyphicon-user"><b>'관리자'님</b></span>&nbsp;&nbsp;
									<a class="top" href="logout"><span
										class="glyphicon glyphicon-log-out "></span> 로그아웃</a>
									&nbsp;&nbsp;
								</div>
							</c:when>
							<c:otherwise>
								<div class="top" align="right">
									<span class="glyphicon glyphicon-user"><b>'${sessionScope.userid}'님</b></span>&nbsp;&nbsp;
									<a class="top" href="logout"><span
										class="glyphicon glyphicon-log-out "></span> 로그아웃</a>
									&nbsp;&nbsp;
								</div>
							</c:otherwise>
						</c:choose></li>
				</ul>
			<div id="sh_top_menu_wrapper">
				<h1 id="top_logo">
					<a href="GTCSMAIN"><img
						src="../resources/sh_img/hd/top_menu/logo.png" width="150px"
						height="75px" alt="사이트 로고" title=""></a>
				</h1>

				<div id="top_menu_wrapper">
					<!--menu!-->
					<ul id="top_menu">


							<li class="list list01"><a href="../show_menu">그늘집</a>
								</li>

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

	</div>
	<div class="product-item-area">
		<div class="container">
			<div class="row">
				<div class="col-md-3 col-sm-4">
					<div class="product-item-categori">
						<div class="product-type">
							<h2>Product Type</h2>
							<ul>
								<li><a href="../shop/goodlist?category=Driver" class="a"><i
										class="fa fa-angle-right"></i>Driver</a></li>
								<li><a href="../shop/goodlist?category=Hybrid" class="a"><i
										class="fa fa-angle-right"></i>Hybrid</a></li>
								<li><a href="../shop/goodlist?category=IronSets" class="a"><i
										class="fa fa-angle-right"></i>IronSets</a></li>
								<li><a href="../shop/goodlist?category=putters" class="a"><i
										class="fa fa-angle-right"></i>putters</a></li>
							</ul>
						</div>
					</div>

				</div>
				<div class="col-md-8 col-lg-9 col-sm-12">
					<div class="row">
						<div class="col-md-12 col-sm-12 col-xs-12">
							<div class="features-tab">
								<!-- Nav tabs -->
								<div class="shop-all-tab">
									<div class="two-part">
<!-- 										<ul class="nav tabs" role="tablist"> -->
<!-- 											<li class="vali">View as:</li> -->
<!-- 											<li role="presentation" class="active"><a href="#home" -->
<!-- 												aria-controls="home" role="tab" data-toggle="tab"><i -->
<!-- 													class="fa fa-th-large"></i></a></li> -->
<!-- 											<li role="presentation"><a href="#profile" -->
<!-- 												aria-controls="profile" role="tab" data-toggle="tab"><i -->
<!-- 													class="fa fa-align-justify"></i></a></li> -->
<!-- 										</ul> -->
									</div>
									<div class="re-shop">
										<div class="sort-by">
<!-- 											<div class="shop6"> -->
<!-- 												<label>Sort By :</label> <select> -->
<!-- 													<option value="">Default sorting</option> -->
<!-- 													<option value="">Sort by popularity</option> -->
<!-- 													<option value="">Sort by newness</option> -->
<!-- 													<option value="">Sort by price: low to high</option> -->

<!-- 												</select> -->
<!-- 											</div> -->
										</div>
										<div class="shop5">
											<label>Show :</label> <select name="perpage"
												onchange="document.location.href='?perPageNum='+this.value+'&searchType='+'${searchType}'+'&keyword='+'${keyword}'+'&category='+'${category}'">
												<option selected="selected1" value="">show</option>
												<option value="3">3개씩 보기</option>
												<option value="6">6개씩 보기</option>
												<option value="12">12개씩 보기</option>
												<option value="24">24개씩 보기</option>
											</select>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<script>
					// 					$(".product-type a").click(
					// 							function(e) {
					// 								$(this).closest(".product-type").find("a")
					// 										.removeClass("active");
					// 								$(this).addClass("a").addClass("active");
					// 								e.preventDefault();

					// 							});
				</script>
				<div class="col-md-9 col-sm-8">
					<div class="product-item-list">

						<div class="row">


							<c:forEach var="list" items="${goodsVOList}">
								<div class="col-md-4 col-sm-6 hidden-sm">
									<div class="single-item-area">
										<div class="single-item">
											<div class="product-item-img">
											
											
						<c:set var="query" value="&goodsNumber=${list.bno}" />
						<a href="<c:url value="/shop/read?${query}"/> "> </a> 
						<img src="/shop/getByteImage?&goodsNumber=${list.bno}"
							style="width: 220px; height: 220px" alt="" /> </a>

											</div>
											<div class="single-item-content">
												<h2>
													<c:set var="query"
														value="&goodsNumber=${list.bno}&userid=${userid}" />
													<a href="<c:url value="/shop/read?${query}"/> ">
														${list.name} </a>
												</h2>
												<div class="best-product-rating">
													<a href="#"><i class="fa fa-star"></i></a> <a href="#"><i
														class="fa fa-star"></i></a> <a href="#"><i
														class="fa fa-star"></i></a> <a href="#"><i
														class="fa fa-star"></i></a> <a href="#"><i
														class="fa fa-star"></i></a>
												</div>
												<h3>${list.price}</h3>
											</div>
										</div>
										<div class="item-action-button fix">
											<a href="#">Add to Cart</a>
											<div class="item-action-icon">
												<a href="#"><i class="fa fa-heart"></i></a> <a href="#"><i
													class="fa fa-signal"></i></a> <a href="#"><i
													class="fa fa-search"></i></a>
											</div>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
						<table border="1" style="width: 100%; border: 1px solid WHITE;"
							class="tablecss">
							<tr>
								<td style="width: 30px; padding: 4px;"><select
									name="searchType" id="searchType">


										<option value="num"
											<c:out value="${cri.searchType == 'num'?'selected':''}"/>>번호


											<option value="na"
												<c:out value="${cri.searchType == 'na'?'selected':''}"/>>상품
												명


												<option value="re"
													<c:out value="${cri.searchType == 're'?'selected':''}"/>>등록자










												
								</select> <input type="text" name="keyword" id="keywordInput"
									value='${cri.keyword}'> <input type="hidden"
										name="category" id="category" value='${category}'>
											<button id='searchBtn' class="btn btn-info">Search</button></td>

							</tr>
						</table>
					</div>
					<div class="shop-pagination floatright">
						<ul class="pagination">
							<c:if test="${pageMaker.prev}">
								<li><a
									href="list${pageMaker.makeSearch(pageMaker.startPage-1)}"><i
										class="fa fa-angle-left"></i></a></li>
							</c:if>

							<c:forEach begin="${pageMaker.startPage }"
								end="${pageMaker.endPage }" var="idx">
								<li
									<c:out value="${pageMaker.cri.page == idx?'class = active':''}"/>>
									<a href="list${pageMaker.makeSearch(idx) }">${idx }</a>
								</li>
							</c:forEach>

							<c:if test="${pageMaker.next && pageMaker.endPage > 0 }">
								<li><a
									href="list${pageMaker.makeSearch(pageMaker.endPage +1) }"><i
										class="fa fa-angle-right"></i></a></li>
							</c:if>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>