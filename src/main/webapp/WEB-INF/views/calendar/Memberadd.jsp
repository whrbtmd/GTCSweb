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

<title>GTCS/비회원등록</title>

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
<script>
 $(document).ready(function(){
  var formObj = $("form[role='form']");
  
  $("#G").on("click", function(){
     var start = $('input[name=start]').val();
     console.log(start);
     var end = $('input[name=end]').val();
     console.log(end);
     var time = $('input[name=time]').val();
     console.log(time);
        formObj.attr("action", "memberadd?start="+start+"&end="+end+"&time="+time);
   
   /* location.href="MAList?start="+start+"&end="+end+"&time="+time; */
   formObj.submit();
  });
  
 
 });
</script>
<style>
.tbl_frm01{
   margin-left:27%;
}
</style>
</head>
<body >

<div id="sh_wrapper">
<!-- 상단 시작 { -->
<div id="sh_hd">   
   <div class="top_nav_bg"></div>
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
<!-- 소분류 끝 -->   </div>
</div>
<!-- } 상단 끝 -->


   
      <!-- 콘텐츠 시작 { -->
<div id="sh_container">   
   <div id="sh_container_topbg"></div>
      <!-- 서브상단 이미지 -->   
   <div id="sh_container_top"><img src="./resources/sh_img/hd/sub_main_banner/sub_main_banner.png" alt="" /></div>
   <div id="sh_container_wrapper">   
      <!-- 서브메뉴 -->
      <div id="sh_aside"><div id="aside_tit"><ul>예약시스템
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
            <h3>팀원등록</h3>
            <span>홈 > 예약 > 팀원등록</span>
         </div>
   
<!-- 회원정보 입력/수정 시작 { -->
<div class="mbskin">

    <script src="http://lei1007.shiningcorp.com/js/jquery.register_form.js"></script>
    
    
    <input type="hidden" name="start" value="${start}">
   <input type="hidden" name="end" value="${end}">
   <input type="hidden" name="time" value="${time}">
    
    <br />
   <br />
   <div class="al">
      <center>
         ※ 신규회원 등록 시 임시로 등록되는 회원입니다.<br>
      </center>
      <center>
         <p>GTCS 서비스를 이용하시려면 회원가입을 해주세요</p>
      </center>
   </div>

   <hr />

   <br />
   <br />


      <center>
         함께할 팀원의 이름을 입력하세요<br>
      </center>
   
    
    
  <form role="form" method="post">
     <br /><br />
    <div class="tbl_frm01 tbl_wrap ">
        <table style="width:60%">
        <caption>회원 정보 입력</caption>
        <tbody>
      
        <tr>
            <th scope="row"><label for="gname1">팀원명<strong class="sound_only">필수</strong></label></th>
            <td><input type="text" name="gname1" id="gname1" value = "박호영" class="frm_input" maxlength="20"></td>
        </tr>
        
        <tr>
            <th scope="row"><label for="gname2">팀원명<strong class="sound_only">필수</strong></label></th>
            <td><input type="text" name="gname2" id="gname2" value = "김석규"  required class="frm_input" maxlength="20"></td>
        </tr>
        
        <tr>
            <th scope="row"><label for="gname3">팀원명<strong class="sound_only">필수</strong></label></th>
            <td><input type="text" name="gname3" id="gname3" value = "박미영" required class="frm_input" maxlength="20"></td>
        </tr>
        
        <tr>
            <th scope="row"><label for="gname4">팀원명<strong class="sound_only">필수</strong></label></th>
            <td><input type="text" name="gname4" id="gname4" value = "고석주" required class="frm_input" maxlength="20"></td>
        </tr>
        
        </tbody>
        </table>
    </div>

  
<br /><br />

    <div class="btn_confirm">
        <button type="submit" id="G" class="btn_submit">예약계속하기</button>
        <a href="home" class="btn_cancel">취소</a>
    </div>
    </form>

    
    
    
    
    
    
    
    
    
    
    
    
    

</div>
<!-- } 회원정보 입력/수정 끝 -->       </div><!-- sh_content -->
   
   
   </div><!-- sh_container_wrapper --> 
</div><!-- sh_container -->

<!-- } 콘텐츠 끝 -->











<!-- 하단 시작 { -->
<div id="sh_ft" style="margin-top:0px;height:140px" >
   <div id="sh_ft_wrapper">
            <div id="address">
         <p>
            상호 : GTCS 사업자 번호 : 053.940.5114,  대표 : 김건협, 개인정보 관리 책임자 : 서제교 SJK@naver.com<br />
주소 : 대구광역시 북구 복현로 35 (복현2동 218), 센터 : 053.940.5114, 팩스 : 053-940-5114            <br>
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

