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
<title>GTCS/RESERVATION</title>
<link rel="stylesheet" href="http://lei1007.shiningcorp.com/css/default.css">
<link rel="stylesheet" href="http://lei1007.shiningcorp.com/skin/board/sh_basic/style.css">
<link rel="stylesheet" href="http://lei1007.shiningcorp.com/css/user.css">
<link rel="stylesheet" href="http://lei1007.shiningcorp.com/css/page_style.css">
<link rel="stylesheet" href="http://lei1007.shiningcorp.com/sh_img/hd/top_menu/style.css">
<link rel="stylesheet" href="http://lei1007.shiningcorp.com/sh_img/hd/aside/style.css">

<script src="http://lei1007.shiningcorp.com/js/jquery-1.8.3.min.js"></script>
<script src="http://lei1007.shiningcorp.com/js/jquery.menu.js"></script>
<script src="http://lei1007.shiningcorp.com/js/common.js"></script>
<script src="http://lei1007.shiningcorp.com/js/wrest.js"></script>
<script type="text/javascript" src="http://lei1007.shiningcorp.com/sh_img/hd/aside/jquery-ui.js"></script>
<script src="http://lei1007.shiningcorp.com/sh_img/hd/aside/script.js"></script>
<script src="http://lei1007.shiningcorp.com/sh_img/hd/top_menu/script.js"></script>
<link rel="stylesheet" type="text/css" href="./resources/css/jquery.datetimepicker.css" />


<style>
.fc-agendaWeek-view tr {
	height: 10px;
}

body {
	
	padding: 0;
	font-family: "Lucida Grande", Helvetica, Arial, Verdana, sans-serif;
	font-size: 14px;
}

#calendar {
	max-width: 900px;
	margin: 0 auto;
	
	 
}
 footer {
	background-color: #f2f2f2;
	padding: 25px;
}
</style>

 <script>

var events_source;
$(document).ready(function() {

	$('#calendar').fullCalendar({
/* 	      googleCalendarApiKey: 'AIzaSyCIHkloN_n1VZSw5I61p6zNQTpRMftHb-4',
	        events: {
	            googleCalendarId: 'starshu121@gamil.com',
	        }, */
	    	header: {
	    		left: "prev,next today",
	    		center: "title",
	    		right: "month,agendaWeek,agendaDay"
	    	},

	     	titleFormat: {
	    		month: "YYYY년 MMMM",
	    		week: "YYYY년 MMMM DD일 ",
	     		day: "YYYY년 MMMM DD일 dddd"
	    	}, 

	      	timeFormat:{
	    		/* month: 'HH:mm',
	    		agenda:'HH:mm' */
//	     		agendaWeek:'H:mm',
//	     		agendaDay:'H:mm'
	    	},  
	    	defaultDate: new Date(),
	    	lang:'ko',
	    	

	    	allDayDefault: false,
	    	defaultView: "month",
	    	editable: true,
	    	weekends : true,
	    	allDayText: '하루종일',
	    	axisFormat:'HH',
	    	monthNames: ["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"],
	    	monthNamesShort: ["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"],
	    	dayNames: ["일요일","월요일","화요일","수요일","목요일","금요일","토요일"],
	    	dayNamesShort: ["일","월","화","수","목","금","토"],
	    	buttonText: {
	    	today : "오늘",
	    	month : "월별",
	    	week : "주별",
	    	day : "일별"
	    	}, 
	    	
	    	selectable: true,
	    	
			selectHelper: true,

			displayEventTime: false, //12a가사라짐!!꺄오!
		events: "events",

		businessHours: true, // display business hours
		select: function(start, end, allDay) {
			// 달력을 마우스로 클릭을 하였을때.
				startDate = start.format();
				endDate = end.format();
					 $.ajax({
							success: function() {
							
							/* window.open("addEvent?startDate="+startDate+"&endDate="+endDate, "toolbar= 0,directories=0,status=no,menubar=0,scrollbars=auto,resizable=no,height=300,width=500,left=0,top=0");*/
							
							 window.open("eventList?start="+startDate+"&end="+endDate);
							
							},
						}); 
	
			$('#calendar').fullCalendar('unselect');
		},
		 eventDrop: function(event) {
		      alert("드랍뽕션");
		      alert(event.title + "\n"+event.end);
			 var ad = null;
				if ((event.end - event.start) % 86400000 == 0) {
					ad = true;
				} else {
					ad = false;					
				}
				if (event.end != null) {
					alert("Ajax 실행");
					$
							.ajax({
								url : 'eventDrop',
								data : "title="
										+ event.title
										+ "&startday="
										+ event.start
												.format("YYYY-MM-DD HH:mm:ss")
										+ "&endday="
										+ event.end
												.format("YYYY-MM-DD HH:mm:ss")
										+ "&ad="
										+ ad,
								type : "POST",
								success : function(
										json) {
									alert("OK");
								}
							});
				}

		   },
		   eventResize : function(event) {
				var ad = null;
				if ((event.end - event.start) % 86400000 == 0) {
					ad = true;
				} else {
					ad = false;
				}
				$
						.ajax({
							url : './evnets_UpdateProcess.jsp',
							data : "title="
									+ event.title
									+ "&start="
									+ event.start
											.format("YYYY-MM-DD HH:mm:ss")
									+ "&end="
									+ event.end
											.format("YYYY-MM-DD HH:mm:ss")
									+ "&ad="
									+ ad,
							type : "POST",
							success : function(
									json) {
								alert("OK");
							}
						});
			 
		},	
		
		
			editable: true,
			eventLimit: true, // allow "more" link when too many events
			
		loading: function(bool) {
			if (bool) $('#loading').show();
			else $('#loading').hide();
		},
		
		 eventClick: function(event, element) {
	      		
 			 $.ajax({
 			 			
 				 		success: function(json) {
 							
 							 window.open("eventDetail?cno="+event.cno, "toolbar=0,directories=0,status=no,menubar=0,scrollbars=auto,resizable=no,height=500,width=500,left=0,top=0");
 					}
 			}); 
 		}
		});
			
    
});
</script>
			<script>
		$(document).ready(function() {
			$('#start').datetimepicker({
				mask : '9999-19-39 29:59:59'
			});
			$('#end').datetimepicker({
				mask : '9999-19-39 29:59:59'
			});
			var gfv_count = 1;
			var gfv_count2 = 1;
				$("#addFile").on("click", function(e) { //파일 추가 버튼
					e.preventDefault();
					fn_addFile();
				});	
			$("#addHash").on("click", function(e) { //해시 추가 버튼
				e.preventDefault();
				fn_addHash();
			});
			$("#write").on("click", function(e) { //작성하기 버튼
				e.preventDefault();
				fn_insertcal();
			});
			
			function fn_insertcal() {
				var comSubmit = new ComSubmit("frm");
				comSubmit.setUrl("<c:url value='addEvent'/>");
				comSubmit.submit();
			}
			function fn_addHash() {
				var str = "<p><input type='text' name='hash_" + (gfv_count2++)
						+ "'><a href='#this' class='btn' name='delete'>삭제</a></p>";
				$("#hashDiv").append(str);
				$("a[name='delete']").on("click", function(e) { //삭제 버튼
					e.preventDefault();
					fn_deleteFile($(this));

				});
			}

			function fn_addFile() {
				var str = "<p><input type='file' name='file_" + (gfv_count++)
						+ "'><a href='#this' class='btn' name='delete'>삭제</a></p>";
				$("#fileDiv").append(str);
				$("a[name='delete']").on("click", function(e) { //삭제 버튼
					e.preventDefault();
					fn_deleteFile($(this));

				});
			}

			function fn_deleteFile(obj) {
				obj.parent().remove();
			}
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
	<h1 id="top_logo"><a href="GTCSMAIN"><img src="./resources/sh_img/hd/top_menu/logo.png" width="150px" height="75px" alt="사이트 로고" /></a></h1>

	<div id="top_menu_wrapper">
		<!--menu!-->
		<ul id="top_menu">
				
			<li class="list list01">
			<a href="#">PROGRAM</a>
				<ul class="sub_ul1" >
					<li>
												<a href="#" class="">GTCS PROGRAM 소개</a> 
												<!-- <a href="#" class="">센터 갤러리</a>  -->
											</li>
					<li class="smenu_back"></li>
				</ul>
				
			</li>
				
			<li class="list list02">
			<a href="#">그늘집</a>
				<ul class="sub_ul2" >
					<li>
												<a href="#" class="">프로그램</a> 
											</li>
					<li class="smenu_back"></li>
				</ul>
				
			</li>
				
			<li class="list list03">
			<a href="insert?category=DRIVERS">SHOP</a>
				<ul class="sub_ul3" >
					<li>
												<a href="insert?category=DRIVERS" class="">DRIVERS</a> 
												<a href="insert?category=PUTTER" class="">PUTTER</a> 
												<a href="insert?category=CLUB" class="">CLUB</a> 
												<a href="insert?category=Hybrids" class="">HYBRIDS</a>
											</li>
					<li class="smenu_back"></li>
				</ul>
				
			</li>
				
			<li class="list list04">
			<a href="home">예약 및 상담</a>
				<ul class="sub_ul4" >
					<li>
												 
												<a href="home" class="">예약신청</a> 
											</li>
					<li class="smenu_back"></li>
				</ul>
				
			</li>
				
			<li class="list list05">
			<a href="notice">공지사항</a>
				
			</li>
			    
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
		<div id="sh_aside"><div id="aside_tit"><ul> 예약시스템</ul></div>
<!-- 대분류 끝 -->


</div>		
		<!-- 콘텐츠영역 -->
		<div id="sh_content">
			<div id="sh_content_tit">
				








					
					
					
					
					
					
					

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

<script>
$(function() {
    // 폰트 리사이즈 쿠키있으면 실행
    font_resize("container", get_cookie("ck_font_resize_rmv_class"), get_cookie("ck_font_resize_add_class"));
});
</script>

</div>
</body>
</html>

