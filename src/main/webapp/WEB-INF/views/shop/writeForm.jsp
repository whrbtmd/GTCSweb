<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="Content-Script-Type" content="text/javascript">
<meta http-equiv="Content-Style-Type" content="text/css">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<title>GTCS/상품등록</title>

<link rel="stylesheet" href="http://lei1007.shiningcorp.com/css/default.css">
<link rel="stylesheet" href="http://lei1007.shiningcorp.com/skin/board/sh_basic/style.css">
<link rel="stylesheet" href="http://lei1007.shiningcorp.com/css/user.css">
<link rel="stylesheet" href="http://lei1007.shiningcorp.com/css/page_style.css">
<!-- <link rel="stylesheet"type="text/css"href="css/font1.css" /> -->
<link rel="stylesheet" href="http://lei1007.shiningcorp.com/sh_img/hd/top_menu/style.css">
<link rel="stylesheet" href="http://lei1007.shiningcorp.com/sh_img/hd/aside/style.css">



<script src="http://lei1007.shiningcorp.com/js/jquery-1.8.3.min.js"></script>
<script src="http://lei1007.shiningcorp.com/js/jquery.menu.js"></script>
<script src="http://lei1007.shiningcorp.com/js/common.js"></script>
<script src="http://lei1007.shiningcorp.com/js/wrest.js"></script>

<script type="text/javascript" src="http://lei1007.shiningcorp.com/sh_img/hd/aside/jquery-ui.js"></script>
<script src="http://lei1007.shiningcorp.com/sh_img/hd/aside/script.js"></script>
<script src="http://lei1007.shiningcorp.com/sh_img/hd/top_menu/script.js"></script>
<script>
      $(document).ready(
            function() {
               $('#searchBtn').on(
                     "click",
                     function(event) {
                        self.location = "notice" + '?' + "searchType="
                              + $("select option:selected").val()
                              + "&keyword="
                              + $('#keywordInput').val();
                     });

            });
   </script>


</head>
<body >

<div id="sh_wrapper">
<!-- 상단 시작 { -->
<div id="sh_hd">	
	<div class="top_nav_bg"></div>
    <h1 id="hd_h1">공지사항 1 페이지</h1>
    <div id="skip_to_container"><a href="#container">본문 바로가기</a></div>
        <div id="sh_hd_wrapper">		
		<ul id="sh_tip_menu">
	<li>
					<c:choose>
							<c:when test="${sessionScope.userid == null}">
								<div align="right">
									<a href="joinForm" class="top"><span
										class="glyphicon glyphicon-user white"></span> 회원가입</a> <a
										class="top" href="loginForm"> <span
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
	<h1 id="top_logo"><a href="GTCSMAIN"><img src="./resources/sh_img/hd/top_menu/logo.png" width="150px" height="75px" alt="사이트 로고" /></a></h1>

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
	<div style="clear:both; visibility:hidden"></div> 
</div>
<!-- 소분류 끝 -->	</div>
</div>
<!-- } 상단 끝 -->


	
		<!-- 콘텐츠 시작 { -->
<div id="sh_container">	
	<div id="sh_container_topbg"></div>
		<!-- 서브상단 이미지 -->	
	<div id="sh_container_top"><img src="./resources/sh_img/hd/sub_main_banner/sub_main_banner.png" alt="" /></div>
	<div id="sh_container_wrapper">	
		<!-- 서브메뉴 -->
		<div id="sh_aside"><div id="aside_tit"><ul>
</ul></div>
<!-- 대분류 끝 -->

<!-- 소분류 시작 -->
<!-- <div id="l_menu">
<ul>

	
	<li class='l_menu_OFF'  >
	<a href="loginForm" >로그인</a>
	</li>

	
	<li class='l_menu_OFF'  style=''>
	<a href="joinForm" >회원가입</a>
	</li>

	</ul ></div> -->
<!-- 소분류 끝 -->
</div>		
		<!-- 콘텐츠영역 -->
		<div id="sh_content">
			<div id="sh_content_tit">
				<h3>상품등록</h3>
				<span>홈 > SHOP > 상품등록</span>
			</div>
	
<!-- 회원정보 입력/수정 시작 { -->
<div class="mbskin">

    <script src="http://lei1007.shiningcorp.com/js/jquery.register_form.js"></script>
    
    
    
    
    
    
    
    <form method="post" enctype="multipart/form-data">
     <br /><br />
    <div class="tbl_frm01 tbl_wrap ">
        <table style="width:100%">
        <caption>상품 등록</caption>
        <tbody>
        <tr>
            <th scope="row"><label for="name">상품명<strong class="sound_only">필수</strong></label></th>
            <td>
                <input type="text" name="name" id="name" required  class="frm_input" maxlength="20">
            </td>
        </tr>
        
        <tr>
            <th scope="row"><label for=imgFile>이미지<strong class="sound_only">필수</strong></label></th>
            <td><input type="file" name="imgFile" id="imgFile" required class="frm_input" maxlength="20"></td>
        </tr>
        
        <tr>
            <th scope="row"><label for="category">구성<strong class="sound_only">필수</strong></label></th>
            <td>
                <select name="category" id="category" class="form-control">
    			<option selected="selected1" value="">종류</option>
				<option value="Driver">Driver</option>
				<option value="Hybrid">Hybrid</option>
				<option value="IronSets">Iron Sets</option>
				<option value="putters">putters</option>
   				</select>
            </td>
        </tr>
        
        
        <tr>
            <th scope="row"><label for="price">가격<strong class="sound_only">필수</strong></label></th>
            <td><input type="text" name="price" id="price" required class="frm_input" maxlength="20"></td>
        </tr>
        
        <tr>
            <th scope="row"><label for="stock">재고<strong class="sound_only">필수</strong></label></th>
            <td><input type="text" name="stock" id="stock" required class="frm_input" maxlength="20"></td>
        </tr>
        
        <tr>
            <th scope="row"><label for="manufacturer">제조사<strong class="sound_only">필수</strong></label></th>
            <td><input type="text" name="manufacturer" id="manufacturer" required class="frm_input" maxlength="20"></td>
        </tr>
        
        
        
        </tbody>
        </table>
    </div>

  
<br /><br />

    <div class="btn_confirm">
        <button type="submit" class="btn_submit">등록</button>
        <a href='list?s=${param.s}' class="btn_cancel">취소</a>
    </div>
    </form>

    
    
    
    
    
    
    
    
    
    
    
    
    

</div>
<!-- } 회원정보 입력/수정 끝 -->    	</div><!-- sh_content -->
	
   
	</div><!-- sh_container_wrapper --> 
</div><!-- sh_container -->

<!-- } 콘텐츠 끝 -->











<!-- 하단 시작 { -->
<div id="sh_ft" style="margin-top:0px;height:140px" >
	<div id="sh_ft_wrapper">
				<div id="address">
			<p>
				상호 : GTCS 사업자 번호 : 053.940.5114,  대표 : 김건협, 개인정보 관리 책임자 : 서제교 SJK@naver.com<br />
주소 : 대구광역시 북구 복현로 35 (복현2동 218), 센터 : 053.940.5114, 팩스 : 053-940-5114				<br>
								<p>Copyright ⓒ <strong>2016 YEUNGJIN COLLEGE</strong> All rights reserved.</p>
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

<!-- 사용스킨 : http://lei1007.shiningcorp.com/skin/board/sh_basic -->


