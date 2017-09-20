<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="./resources/css/jquery.datetimepicker.css" />
<title>GTCS/예약등록</title>

<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet"type="text/css"href="../css/font1.css" />
<style>
.Search{
	margin-left:38%;
	border-collapse: collapse;
    width: 30%;
}
.tearch {
    padding: 8px;
    text-align: left;
    border-bottom: 1px solid #ddd;
}
.write{
	margin-left:30%;
}
#datetimepicker1{
	width: 250px;
}
.ti{
	text-align:center;
}

.form-inline{
	margin-top:60px;
	}
.form-group{
      margin-left: 30.5%;
   }

.E{
	margin-left:50%;
}
.a{
	margin-left:30%;
	width:25%;
}
.table{
	width:200px;
}
body {
padding-right: 0px !important;
}
.color{
	margin-left:20.5%;
}
.w3-label{
	margin-left:30.5%;
}
.w3-input{
	margin-left:40%;
	width:250px;
	text-align:center;
}
.modal-content{
	margin-top:200px;
}
.modal-backdrop.in {
    opacity: 0 !important;
    z-index:-12300;
}
.team{
	margin-left:42%;
}
.al{
	color:#8C8C8C;
}

</style>
<link rel="stylesheet" href="http://lei1007.shiningcorp.com/css/default.css">
<link rel="stylesheet" href="http://lei1007.shiningcorp.com/skin/board/sh_basic/style.css">
<link rel="stylesheet" href="http://lei1007.shiningcorp.com/css/user.css">
<link rel="stylesheet" href="http://lei1007.shiningcorp.com/css/page_style.css">
<link rel="stylesheet" href="http://lei1007.shiningcorp.com/sh_img/hd/top_menu/style.css">
<link rel="stylesheet" href="http://lei1007.shiningcorp.com/sh_img/hd/aside/style.css">
<script>
$(document).ready(function(){
	
	$("#btn1").click(function(){
        $("p").append(" 회원명,");
    });
	
	$("#searchTeam").on("click", function(){
		   formObj.attr("action", "searchTeam");
		   formObj.submit();
		  });

	$("#purchase").on("click", function(){
		   formObj.attr("action", "purchase");
		   formObj.submit();
		  });
	
	$('#popUpSubmit').on("click", function(){
		
		
		
		var gname1 = $('#gname1').val();
		var gname2 = $('#gname2').val();
		var gname3 = $('#gname3').val();
		var gname4 = $('#gname4').val();

		$('.center').html("");
		$('.center').append('<label class="w3-label w3-text-black">* 예약자　:　</label> ' + '<input type="text" readonly class="w3-input" name="gname1" value=' + gname1+ '>'+ '<br><br>'
				+ '<label class="w3-label w3-text-black">* 팀원명　:　</label> ' + '<input type="text" readonly class="w3-input" name="gname2" value=' + gname2+ '>'+  '<br><br>'
				+ '<label class="w3-label w3-text-black">* 팀원명　:　</label> ' + '<input type="text" readonly class="w3-input" name="gname3" value=' + gname3+ '>'+  '<br><br>'
				+ '<label class="w3-label w3-text-black">* 팀원명　:　</label> ' + '<input type="text" readonly class="w3-input" name="gname4" value=' + gname4+ '>'+  '<br>'
				);
	
		
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
						</c:choose>
						</li>
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


<input type="hidden" name="start" value="${start}"> 
<input type="hidden" name="end" value="${end}"> 
<input type="hidden" name="time" value="${time}">
 
<!-- 콘텐츠 시작 { -->
<div id="sh_container">	
	<div id="sh_container_topbg"></div>
		<!-- 서브상단 이미지 -->	
	<div id="sh_container_top"><img src="./resources/sh_img/hd/sub_main_banner/sub_main_banner.png" /></div>
	<div id="sh_container_wrapper">	
		<!-- 서브메뉴 -->
		<div id="sh_aside"><div id="aside_tit">
				<ul>예약시스템
						</ul>
						<!-- 소분류 시작 -->
							<div id="l_menu">
								<ul>
									<li class='l_menu_OFF'><a href="info">프로그램</a></li>


									<li class='l_menu_OFF' style=''><a href="home">예약하기</a>
									</li>

								</ul>
							</div>
							<!-- 소분류 끝 -->
					</div>
					<!-- 대분류 끝 -->

</div>		
		<!-- 콘텐츠영역 -->
		<div id="sh_content">
			<div id="sh_content_tit">

<div class="w3-container">









<form id="frm" name="frm" method="post" action="addEvent">


	
	<label class="w3-label w3-text-black" >작성자 ID　:　</label>
	<input class="w3-input" type="text" id="userid" value="${sessionScope.userid }" name="userid">

	<br /><br />

	<label class="w3-label w3-text-black">예약일자　:　</label>
	<input type="text" id="start" class="w3-input" value="${start}" name="startday">

	<br /><br />

	<label class="w3-label w3-text-black">예약시간　:　</label>
	<input type="text" id="datetimepicker1" class="w3-input" value="${time}" name="time">

	<br /><br />
	
	
	<div class="center" id="center">
   <!-- 버튼 -->
   <!-- <button type="button" class="btn btn-primary btn-lg team" data-toggle="modal" data-target="#myModal" >
     팀원 추가
   </button> -->
   <img src="./resources/img/A.png" class=" team" data-toggle="modal" data-target="#myModal" style="width:190px">
	
   <!-- 모달 팝업 -->
   <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
     <div class="modal-dialog">
       <div class="modal-content">
         <div class="modal-header">
      <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
      <h4 class="modal-title" id="myModalLabel" >팀원추가</h4>
         </div>
         <div class="modal-body">
         
         
         <center>
         함께할 팀원의 이름을 입력하세요<br>
      </center>
   
    <div class="tbl_frm01 tbl_wrap ">
        <table style="width:60%; margin-left:20%;">
        <caption>회원 정보 입력</caption>
        <tbody>
      
        <tr>
            <th scope="row"><label for="gname1">예약자<strong class="sound_only">필수</strong></label></th>
            <td><input type="text" name="gname1" id="gname1" value="${sessionScope.userid }" class="frm_input" maxlength="20"></td>
        </tr>
        
        <tr>
            <th scope="row"><label for="gname2">팀원명<strong class="sound_only">필수</strong></label></th>
            <td><input type="text" name="gname2" id="gname2" value = "ksk"  required class="frm_input" maxlength="20"></td>
        </tr>
        
        <tr>
            <th scope="row"><label for="gname3">팀원명<strong class="sound_only">필수</strong></label></th>
            <td><input type="text" name="gname3" id="gname3" value = "pmy" required class="frm_input" maxlength="20"></td>
        </tr>
        
        <tr>
            <th scope="row"><label for="gname4">팀원명<strong class="sound_only">필수</strong></label></th>
            <td><input type="text" name="gname4" id="gname4" value = "ksj" required class="frm_input" maxlength="20"></td>
        </tr>
        
        </tbody>
        </table>
    </div>

         </div>
         <div class="modal-footer">
         <button type="button" class="btn btn-default" data-dismiss="modal" id="popUpSubmit">submit</button>
      <button type="button" class="btn btn-default" data-dismiss="modal" id="popUpClose">Close</button>
         </div>
       </div>
     </div>
   </div>
</div>


    <script src="./resources/js/jquery-2.2.2.min.js"></script>

<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="http://googledrive.com/host/0B-QKv6rUoIcGREtrRTljTlQ3OTg"></script><!-- ie10-viewport-bug-workaround.js -->
<script src="http://googledrive.com/host/0B-QKv6rUoIcGeHd6VV9JczlHUjg"></script><!-- holder.js -->
    
	
		<br /><br />

			<!-- <div class="form-group">
				<label for="color" class="w3-text-evergreen" >* 색　　상　:　</label>  -->
				<input type="hidden" name="color" value="#800000">
			<!-- </div> -->
			
	
		
		
	<label class="w3-label w3-text-evergreen">* 팀　　명　:　</label>
	<input class="w3-input" type="text" id="title" name="title">
	
	<br />
	
	<br /><br />	
	
	
	
	
	<input type="submit" class="write" id="purchase" value="작성하기">
</form>













</div>

</div>
	
<!-- 라인,버튼색깔 관리자 입력 { -->
<style>
.btn_bo_adm input{background:#669608}
a.btn_admin { background:#669608;border:1px solid #669608}
</style>
<!-- } 라인,버튼색깔 관리자 입력 -->

<h2 id="container_title"><span class="sound_only">목록</span></h2>

<!-- 게시판 목록 시작 { -->
<div id="bo_list" style="width:100%">
    <!-- 게시판 카테고리 시작 { -->
        <!-- } 게시판 카테고리 끝 -->


   
        </form>
</div>


<!-- 페이지 -->



<!-- } 게시판 목록 끝 -->
    	</div><!-- sh_content -->
	
   
	</div><!-- sh_container_wrapper --> 
</div><!-- sh_container -->

<!-- } 콘텐츠 끝 -->


<!-- 하단 시작 { -->
<div id="sh_ft" style="margin-top:0px;height:140px" >
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

<script src="./resources/js/jquery.js"></script>
<script src="./resources/js/build/jquery.datetimepicker.full.js"></script>

<script>
$('#datetimepicker1').datetimepicker({
	datepicker : false,
	format : 'H:i',
	allowTimes :[
	'08:00', '09:00', '10:00', '11:00', '12:00'
	, '13:00', '14:00', '15:00', '16:00', '17:00', '18:00'
	]
	/* format : 'H:i',
	step : 60 */
});
$(function() {
    // 폰트 리사이즈 쿠키있으면 실행
    font_resize("container", get_cookie("ck_font_resize_rmv_class"), get_cookie("ck_font_resize_add_class"));
});
</script>

</html>

