<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="UTF-8">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<!-- <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css"> -->

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<script
		src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
	<script
		src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
	<link rel="stylesheet" type="text/css" href="../css/bootstrap.css" />
	<link rel="stylesheet" type="text/css" href="../css/view.css" />
	<link rel="stylesheet" type="text/css" href="../css/include.css" />

	<title>GTCS/주문하기</title> <script>
		$(document).ready(
				function() {
					$('#searchBtn').on(
							"click",
							function(event) {
								self.location = "list" + '?' + "searchType="
										+ $("select option:selected").val()
										+ "&keyword="
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
	<div class="form-group">
		<div class="col-sm-2" style="margin-left: 100px;">
			<center> <a href="index"><img src="../images/logo.png"
				width="190px;" height="80px;"></a></center>
		</div>
	</div>

	<div class="top-main-right">

		<c:choose>
			<c:when test="${userid == null}">
				<div align="right">
					<a href="../joinForm" class="top"><span
						class="glyphicon glyphicon-user"></span> 회원가입</a> <a class="top"
						href="#" id="myBtnn"><span class="glyphicon glyphicon-log-in"></span>
						로그인</a> &nbsp;&nbsp;
				</div>
			</c:when>
			<c:when test="${userid == 'admin'}">
				<div class="top" align="right">
					<span class="glyphicon glyphicon-user"><b>'관리자'</b></span>&nbsp;&nbsp;
					<a class="top" href="../logout"><span
						class="glyphicon glyphicon-log-out"></span> 로그아웃</a> &nbsp;&nbsp;
				</div>
			</c:when>
			<c:otherwise>
				<div class="top" align="right">
					<span class="glyphicon glyphicon-user"><b>${userid}님</b></span>&nbsp;&nbsp;
					<a class="top" href="../logout"><span
						class="glyphicon glyphicon-log-out"></span> 로그아웃</a> &nbsp;&nbsp;
				</div>
			</c:otherwise>
		</c:choose>


	</div>
	<br><br><br>

				<table align="center" class="top-main">
					<tr>
						<td align="center"><a href="#">메뉴</a> &nbsp;&nbsp; <a
							href="../score">스코어</a> &nbsp;&nbsp; <a
							href="list?userid=${userid }">SHOP</a> &nbsp;&nbsp; <a
							href="#">예 약</a> &nbsp;&nbsp; <a href="../listAll">게시판</a>
							&nbsp;&nbsp; <c:choose>
								<c:when test="${id == 'admin'}">
									<a href="adminPage">관리자</a>
								</c:when>
							</c:choose></td>
					</tr>
				</table>
				<div class="modal fade" id="myModall" role="dialog">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header" style="padding: 35px 50px;">
								<button type="button" class="close" data-dismiss="modal">&times;</button>
								<h4>
									<span class="glyphicon glyphicon-user"></span> LOGIN
								</h4>
							</div>
							<div class="modal-body" style="padding: 40px 50px;">
								<form role="form" action="loginProcess" method="post">
									<div class="form-group">
										<label for="id"><span
											class="glyphicon glyphicon-menu-down"></span> ID</label> <input
											type="text" class="form-control" id="userid" name="userid">
									</div>
									<div class="form-group">
										<label for="ppw"><span
											class="glyphicon glyphicon-menu-down"></span> PW</label> <input
											type="text" class="form-control" id="pw" name="userpw">
									</div>
									<button type="submit" class="btn btn-success btn-block">
										<span class="glyphicon glyphicon-off"></span> Login
									</button>
								</form>
							</div>
						</div>
					</div>
				</div> <script>
					$(document).ready(function() {
						$("#myBtnn").click(function() {
							$("#myModall").modal();
						});
					});
				</script> <!-- 	상단메뉴 시작 -->
				<div class="topmenu">
					<div id="menu_box">
						<ul id="nav">

							<li><a href="../shop/goodlist?category=Driver">Driver</a></li>
							<li><a href="../shop/goodlist?category=Hybrid">Hybrid</a></li>
							<li><a href="../shop/goodlist?category=IronSets">Iron
									Sets</a></li>
							<li><a href="../shop/goodlist?category=putters">putters</a></li>
						</ul>

					</div>
				</div>
<!-- 				<table border="1" style="width: 100%; border: 1px solid #86E57F;" -->
<!-- 					class="tablecss"> -->
<!-- 					<tr class="odd"> -->
<!-- 						<td style="width: 30px; border: 1px solid #86E57F; padding: 4px;"> -->
<!-- 							<select name="searchType"> -->
<!-- 								<option selected="selected" value="">:::검색:::</option> -->


<!-- 								<option value="num" -->
<%-- 									<c:out value="${cri.searchType == 'num'?'selected':''}"/>>번호 --%>


<!-- 									<option value="na" -->
<%-- 										<c:out value="${cri.searchType == 'na'?'selected':''}"/>>상품 --%>
<!-- 										명 -->


<!-- 										<option value="re" -->
<%-- 											<c:out value="${cri.searchType == 're'?'selected':''}"/>>등록자 --%>









										
<!-- 						</select> <input type="text" name="keyword" id="keywordInput" -->
<%-- 							value='${cri.keyword}'> --%>
<!-- 								<button id='searchBtn' class="btn btn-info">Search</button> -->
<!-- 						</td> -->

<!-- 					</tr> -->
<!-- 				</table> -->
				<div id="product">



					<%-- 					<c:forEach var="list" items="${buyVOList}"> --%>
					<!-- 						<div class="box1"> -->

					<!-- 							<div class="box2"> -->
					<!-- 								리스트상품이미지 -->

					<%-- 								<c:set var="query" value="&goodsNumber=${list.shop_no}" /> --%>
					<%-- 								<a href="<c:url value="/shop/read?${query}"/> "> </a> <img --%>
					<%-- 									src="/board/shop/getByteImage?&goodsNumber=${list.shop_no}" --%>
					<!-- 									style="width: 220px; height: 220px" alt="" /> </a> -->
					<!-- 							</div> -->

					<!-- 							<div class="box3"> -->
					<!-- 								<ul> -->
					<!-- 									브랜드 -->
					<%-- 									<li class="brands">${list.manufacturer}</li> --%>
					<!-- 									상품명 -->
					<%-- 									<li class="p_name"><c:set var="query" --%>
					<%-- 											value="&goodsNumber=${list.shop_no}&userid=${userid}" /> <a --%>
					<%-- 										href="<c:url value="/shop/read?${query}"/> "> ${list.name} --%>
					<!-- 									</a></li> -->

					<!-- 									회원전용가 -->

					<!-- 									<div id="GDList_ctrl4_PanPrice8_18"> -->

					<%-- 										<li class="price2">소비자 가격 : <span>${list.price} 원</span></li> --%>

					<!-- 									</div> -->

					<!-- 								</ul> -->
					<!-- 							</div> -->

					<!-- 						</div> -->
					<%-- 					</c:forEach> --%>


<!-- 					<table width="100%" border="0" cellpadding="0" cellspacing="0"> -->
<!-- 						<tr> -->
<!-- 							<td> -->
<!-- 								선택/장바구니 외 버튼& 정렬테이블시작 -->
<!-- 								<table width="100%" border="0" cellpadding="0" cellspacing="0"> -->
<!-- 									<td></td> -->
<!-- 									<tr> -->
<!-- 										<td height="37" align="left" valign="middle" -->
<!-- 											background="../../front/_customskin/_skintpl/hantaro/common/images/index2013/product_data_top.jpg"> -->
<!-- 										</td> -->

<!-- 										<td align="right" valign="middle"><table border="0" -->
<!-- 												cellspacing="0" cellpadding="0"> -->
<!-- 												<tr> -->

<!-- 													<td><select name="perpage" -->
<%-- 														onchange="document.location.href='?perPageNum='+this.value+'&searchType='+'${searchType}'+'&keyword='+'${keyword}'"> --%>
<!-- 															<option selected="selected1" value="">:::조회:::</option> -->
<!-- 															<option value="1">1개씩 보기</option> -->
<!-- 															<option value="2">2개씩 보기</option> -->
<!-- 															<option value="3">3개씩 보기</option> -->
<!-- 															<option value="4">4개씩 보기</option> -->
<!-- 													</select></td> -->
<!-- 													<td width="8">&nbsp;</td> -->
<!-- 												</tr> -->
<!-- 											</table></td> -->
<!-- 									</tr> -->
<!-- 								</table> -->
<!-- 							</td> -->
<!-- 						</tr> -->

<!-- 					</table> -->
					<!--선택/장바구니 외 버튼& 정렬테이블 끝-->
					</td>
					</tr>

					</table>


					<table id="box-table-a" class="table table-hover">

						<tr>
							<th scope="col">상품 번호</th>
							<th scope="col">상품 명</th>
							<th scope="col">브랜드</th>
							<th scope="col">분류</th>
							<th scope="col">가격</th>
							<th scope="col">수량</th>
							<th scope="col">상태</th>
							<th scope="col" class="popup_button" style="display: none;">추가</th>
						</tr>

						<c:choose>
							<c:when test="${hasGoods == false}">
								<tr>
									<td class="popup_button_col" colspan="12">상품이 없습니다.</td>
								</tr>
							</c:when>

							<c:otherwise>
								<c:forEach var="list" items="${buyVOList}">
									<tr id="goods_${list.bno}">
									<input type="hidden" name="no" id="no" value="${list.no}"/>
										<td ><img
											src="/board/shop/getByteImage?&goodsNumber=${list.bno}"
											style="width: 60px; height: 40px" alt="" /></td>
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
										<td class="popup_button" style="display: none;"><button
												class="btn_add_goods" name="${list.bno}">선택</button></td>
												
									</tr>
								</c:forEach>



							</c:otherwise>
						</c:choose>


<!-- 						<tr> -->
<!-- 							<td class="popup_button_col" colspan="12"><a -->
<%-- 								href="<c:url value="/shop/write" />">상품 등록</a></td> --%>
<!-- 						</tr> -->


					</table>



<!-- 					<div class="text-center"> -->
<!-- 						<ul class="pagination"> -->
<%-- 							<c:if test="${pageMaker.prev}"> --%>
<!-- 								<li><a -->
<%-- 									href="list${pageMaker.makeSearch(pageMaker.startPage-1)}">&laquo;</a></li> --%>
<%-- 							</c:if> --%>

<%-- 							<c:forEach begin="${pageMaker.startPage }" --%>
<%-- 								end="${pageMaker.endPage }" var="idx"> --%>
<!-- 								<li -->
<%-- 									<c:out value="${pageMaker.cri.page == idx?'class = active':''}"/>> --%>
<%-- 									<a href="list${pageMaker.makeSearch(idx) }">${idx }</a> --%>
<!-- 								</li> -->
<%-- 							</c:forEach> --%>

<%-- 							<c:if test="${pageMaker.next && pageMaker.endPage > 0 }"> --%>
<!-- 								<li><a -->
<%-- 									href="list${pageMaker.makeSearch(pageMaker.endPage +1) }">&raquo;</a></li> --%>
<%-- 							</c:if> --%>
<!-- 						</ul> -->
<!-- 					</div> -->
</body>
</html>