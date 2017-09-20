<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" import="yjc.wdb.spring.domain.*, java.util.*"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<html lang="en" class="no-js">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="msapplication-tap-highlight" content="no" />

<title>admin</title>

<script
	src="http://cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
<!-- <script src="http://code.jquery.com/jquery-1.8.2.min.js"></script> -->
<!--   <script src="http://cdn.oesmith.co.uk/morris-0.4.1.min.js"></script> -->

<!-- <script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script> -->
<!-- <script src="//cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script> -->
<!-- <script src="//cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.min.js"></script> -->
<link rel="stylesheet" href="../css/bootstrap2.css">
<link rel="stylesheet" href="../css/rank.css">
<link rel="stylesheet"
	href="//cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.css">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">

<link rel="stylesheet" href="../css/css.css">
<!--   <link rel="stylesheet" href="../css/admin.css"> -->
<link rel="icon" href="img/favicon.ico" type="image/x-icon" />
<link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon" />
<!--[if lt IE 9]>
      <script src="bower_components/html5shiv/dist/html5shiv.min.js"></script>
      <script src="bower_components/respondJs/dest/respond.min.js"></script>
    <![endif]-->
<style>
.white, .white a {
	color: #fff;
}

.top {
	color: white;
}

.navbar {
	margin-bottom: 0;
	border-radius: 0;
}
</style>
<script>
	Morris.Donut({
		element : 'donut-example',
		data : [ {
			label : "Download Sales",
			value : 12
		}, {
			label : "In-Store Sales",
			value : 30
		}, {
			label : "Mail-Order Sales",
			value : 20
		} ]
	});
</script>
</head>


<body>
	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#myNavbar">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<!-- <a class="navbar-brand" href="#">Logo</a> -->

				<img src="../images/logo1.png" width="110px" height="58px">

			</div>
			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav">
					<li><a href="mainDegin">Home</a></li>
					<li><a href="insert?category=DRIVERS">그늘집</a></li>
					<li><a href="home">예 약</a></li>
					<li><a href="notice">공지사항</a></li>
					<c:choose>
						<c:when test="${id == 'admin'}">
							<li><a href="adminPage">관리자</a></li>
						</c:when>
					</c:choose>
				</ul>
				<ul class="nav navbar-nav navbar-right loggin">
					<li><br> <c:choose>
							<c:when test="${sessionScope.id == null}">
								<div align="right">
									<a href="joinForm" class="top"><span
										class="glyphicon glyphicon-user white"></span> 회원가입</a> <a
										class="top" href="#" id="myBtnn"> <span
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
			</div>
		</div>
	</nav>

	<!--Content-->
	<div id="content" class="content container-fluid">
		<div class="row">
			<div class="col-lg-12">
				<div class="page-header">
					<h2>admin</h2>
					<ol class="breadcrumb">
						<li><a href="index.html">Home</a></li>
						<li class="active">manage</li>
					</ol>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-12">
				<div class="row">
					<div class="col-sm-6 col-lg-3">
						<div class="content-box ultra-widget">
							<div class="w-content big-box">
								<div class="w-progress">
									<span class="w-amount blue">${goodcountmon}</span> <br> <span
										class="text-uppercase w-name">Total profit</span>
								</div>
								<span class="w-refresh w-p-icon"><i class="fa fa-usd"></i></span>
								<div class="progress progress-bar-sm zero-m">
									<div class="progress-bar progress-bar-info" role="progressbar"
										aria-valuenow="45" aria-valuemin="0" aria-valuemax="100"
										style="width: ${aa}%"></div>
								</div>
								<div class="w-status clearfix">
									<div class="w-status-title pull-left text-uppercase">Progress</div>
									<div class="w-status-number pull-right text-uppercase">${aa}%</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-sm-6 col-lg-3">
						<div class="content-box ultra-widget">
							<div class="w-content big-box">
								<div class="w-progress">
									<span class="w-amount green"> </span> <br> <span
										class="text-uppercase w-name"></span>
								</div>
								&nbsp <span class="w-refresh w-p-icon"><i
									class="fa fa-thumbs-o-up"></i></span>
								<div class="progress progress-bar-sm zero-m">
									<div class="progress-bar progress-bar-success"
										role="progressbar" aria-valuenow="67" aria-valuemin="0"
										aria-valuemax="100" style="width: 0%"></div>
								</div>
								<div class="w-status clearfix">
									<div class="w-status-title pull-left text-uppercase">Progress</div>
									<div class="w-status-number pull-right text-uppercase">0%</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-sm-6 col-lg-3">
						<div class="content-box ultra-widget">
							<div class="w-content big-box">
								<div class="w-progress">
									<a href="../adm/order"> <span class="w-amount red">${newor}</span></a>
									<br> <span class="text-uppercase w-name">New orders</span>
								</div>
								<span class="w-refresh w-p-icon"><i
									class="fa fa-shopping-cart"></i></span>
								<div class="progress progress-bar-sm zero-m">
									<div class="progress-bar progress-bar-danger"
										role="progressbar" aria-valuenow="34" aria-valuemin="0"
										aria-valuemax="100" style="width: 34%"></div>
								</div>
								<div class="w-status clearfix">
									<div class="w-status-title pull-left text-uppercase">Progress</div>
									<div class="w-status-number pull-right text-uppercase">34%</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-sm-6 col-lg-3">
						<div class="content-box ultra-widget">
							<div class="w-content big-box">
								<div class="w-progress">
									<span class="w-amount yellow">341</span> <br> <span
										class="text-uppercase w-name">New users</span>
								</div>
								<span class="w-refresh w-p-icon"><i class="fa fa-user"></i></span>
								<div class="progress progress-bar-sm zero-m">
									<div class="progress-bar progress-bar-warning"
										role="progressbar" aria-valuenow="52" aria-valuemin="0"
										aria-valuemax="100" style="width: 52%"></div>
								</div>
								<div class="w-status clearfix">
									<div class="w-status-title pull-left text-uppercase">Progress</div>
									<div class="w-status-number pull-right text-uppercase">52%</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-6">
				<div class="panel panel-default magic-element">
					<div class="content-title big-box i-block">
						<h4 class="zero-m">승인 대기</h4>
					</div>
					<table id="box-table-a" class="table table-hover">

						<tr>
							<th scope="col">상품</th>
							<th scope="col">상품 번호</th>
							<th scope="col">상품 명</th>
							<th scope="col">브랜드</th>
							<th scope="col">분류</th>
							<th scope="col">가격</th>
							<th scope="col">수량</th>
							<th scope="col">상태</th>
							<th scope="col" class="popup_button">추가</th>
						</tr>

						<c:choose>
							<c:when test="${hasGoods == false}">
								<tr>
									<td class="popup_button_col" colspan="12">상품이 없습니다.</td>
								</tr>
							</c:when>

							<c:otherwise>
								<c:forEach var="list" items="${buyVOList2}">
									<form role="form" method="post" action="order">
										<tr id="goods_${list.bno}">


											<td><img
												src="/shop/getByteImage?&goodsNumber=${list.bno}"
												style="width: 60px; height: 40px" alt="" /></td>
											<td>${list.no}</td>
											<input type="hidden" name="no" id="no" value="${list.no}" />
											<td><c:set var="query"
													value="&goodsNumber=${list.bno}&userid=${userid}" /> <a
												href="<c:url value="/shop/read?${query}"/> ">
													${list.name} </a></td>
											<td>${list.manufacturer}</td>
											<td>${list.category}</td>
											<td id="price_${list.bno}">${list.price}</td>
											<%-- 										<td>${list.userid}</td> --%>
											<td>${list.quantity}</td>
											<td>${list.state}</td>
											<td class="popup_button"><button type="submit">승인</button></td>

										</tr>
									</form>
								</c:forEach>



							</c:otherwise>
						</c:choose>


						<!-- 						<tr> -->
						<!-- 							<td class="popup_button_col" colspan="12"><a -->
						<%-- 								href="<c:url value="/shop/write" />">상품 등록</a></td> --%>
						<!-- 						</tr> -->


					</table>
				</div>
			</div>
			<div class="col-lg-6">
				<div class="panel panel-default magic-element">
					<div class="content-title big-box i-block">
						<h4 class="zero-m">승인 완료</h4>
					</div>
					<table id="box-table-a" class="table table-hover">

						<tr>
							<th scope="col">상품</th>
							<th scope="col">상품 번호</th>
							<th scope="col">상품 명</th>
							<th scope="col">브랜드</th>
							<th scope="col">분류</th>
							<th scope="col">가격</th>
							<th scope="col">수량</th>
							<th scope="col">상태</th>
						</tr>

						<c:choose>
							<c:when test="${hasGoods == false}">
								<tr>
									<td class="popup_button_col" colspan="12">상품이 없습니다.</td>
								</tr>
							</c:when>

							<c:otherwise>
								<c:forEach var="list" items="${buyVOList}">
									<form role="form" method="post" action="order">
										<tr id="goods_${list.bno}">


											<td><img
												src="/shop/getByteImage?&goodsNumber=${list.bno}"
												style="width: 60px; height: 40px" alt="" /></td>
											<td>${list.no}</td>
											<input type="hidden" name="no" id="no" value="${list.no}" />
											<td><c:set var="query"
													value="&goodsNumber=${list.bno}&userid=${userid}" /> <a
												href="<c:url value="/shop/read?${query}"/> ">
													${list.name} </a></td>
											<td>${list.manufacturer}</td>
											<td>${list.category}</td>
											<td id="price_${list.bno}">${list.price}</td>
											<%-- 										<td>${list.userid}</td> --%>
											<td>${list.quantity}</td>
											<td>${list.state}</td>

										</tr>
									</form>
								</c:forEach>



							</c:otherwise>
						</c:choose>


						<!-- 						<tr> -->
						<!-- 							<td class="popup_button_col" colspan="12"><a -->
						<%-- 								href="<c:url value="/shop/write" />">상품 등록</a></td> --%>
						<!-- 						</tr> -->


					</table>
				</div>
			</div>
		</div>
	</div>










</body>

</html>
