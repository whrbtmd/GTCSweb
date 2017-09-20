<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css"
	href="./resources/css/jquery.datetimepicker.css" />
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">

<title>GTCS/회원검색</title>

<script>
 $(document).ready(function(){
  var formObj = $("form[role='form']");
  
  $("#addteam").on("click", function(){
	  var start = $('input[name=start]').val();
	  console.log(start);
	  var end = $('input[name=end]').val();
	  console.log(end);
	  var time = $('input[name=time]').val();
	  console.log(time);
   	  formObj.attr("action", "Teammemberadd?start="+start+"&end="+end+"&time="+time);
   
   /* location.href="MAList?start="+start+"&end="+end+"&time="+time; */
   formObj.submit();
  });
  
  addform
  
  $("#addform").on("click", function(){
	  var start = $('input[name=start]').val();
	  console.log(start);
	  var end = $('input[name=end]').val();
	  console.log(end);
	  var time = $('input[name=time]').val();
	  console.log(time);
   	  formObj.attr("action", "addform?start="+start+"&end="+end+"&time="+time);
   
   /* location.href="MAList?start="+start+"&end="+end+"&time="+time; */
   formObj.submit();
  });
 });
</script>

<style>
.Btn {
	margin-top: 10%;
	margin-left: 47%;
}

.B {
	margin-left: 47%;
	margin-top: 5%;
}

.reser {
	margin-left: 10%;
	margin-top: 15%;
}

</style>

</head>

<body>

	<!-- 상단 시작 { -->
	<div id="sh_hd">
		<div class="top_nav_bg"></div>
		
		<div id="sh_hd_wrapper">
			<ul id="sh_tip_menu">
				<li><c:choose>
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
					</c:choose></li>
			</ul>
			<div id="sh_top_menu_wrapper">
				<h1 id="top_logo">
					<a href="GTCSMAIN"><img
						src="./resources/sh_img/hd/top_menu/logo.png" width="150px"
						height="75px" alt="사이트 로고" /></a>
				</h1>

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
				<div style="clear: both; visibility: hidden"></div>
			</div>
			<!-- 소분류 끝 -->
		</div>
	</div>
	<!-- } 상단 끝 -->







	<input type="hidden" name="start" value="${start}">
	<input type="hidden" name="end" value="${end}">
	<input type="hidden" name="time" value="${time}">









	<!-- --------------------------------------------------------------------------------- -->
	<script>
   var count=0;
   $(document.body).on('click','.add', function(){
     var mem =$(this).attr('userid');
     $("#a"+count).val(mem);
     $('#searchMember').modal("hide");
     count++;
    }); 
   

$(document.body).on('click','#addmember', function(){
   count++;
   $("<br><br><div class='col-sm-8'><input type='text'  class='form-control' id=a"+count+" name='tname'></div> <div class='col-sm-2'><button type='button' class='form-control' data-target='#searchMember' data-toggle='modal'><span class='glyphicon glyphicon-zoom-in'></span></button></div><div class='col-sm-2'> <button type='button' class='form-control' id='addmember' data-ng-click='add()'><span class='glyphicon glyphicon-plus'></span></button></div>").appendTo(".addd");
}); 

function membersearch(){
   $('#membersearch').empty();
   
   var search=document.getElementById("searchVal").value; 
   $.ajax({
      type : "GET",
      url : "Membersearch?search=" + search,
      dataType : "json",
      data : "",
      success : function(data) {
         $(data).each(function() {
   
              var confItem = $('<tr></tr>').attr({class: ''});
              $('<td></td>').text(this.userid).attr({value: this.userid}).appendTo(confItem);
              $('<td></td>').text(this.username).attr({value: this.userid}).appendTo(confItem);
              var button =$('<td></td>').appendTo(confItem);
            
              $('<button></button>').text("추가").attr({class: 'btn btn-default add', id: this.userid,type:'button'}).appendTo(button);

                  confItem.appendTo($('#membersearch'));
                  
              
         });

      },
      error : function() {
         window.alert('에러입니다');
      }

   });
}


</script>

	<button type="button"
		class="Btn w3-btn w3-sand w3-border w3-border-brown w3-round"
		data-toggle="modal" data-target="#teammemberadd">팀원추가</button>


	<!-- 팀원추가 -->
	<div class="modal fade " id="teammemberadd" role="dialog">
		<form action="Teammemberadd" method="post" role="form">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">
					<div class="modal-header  w3-pale-red">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">팀원추가</h4>
					</div>
					<div class="modal-body">





						<br />

						 <center>
						검색할 팀원의 <b>아이디</b>를 입력해 주세요
						</center> 

						<br>
						<div class="form-group">
							<label for="type"></label>
							<div class="col-sm-8">

								<!-- -------------------------------------------------------------- -->
								<input type="text" class="form-control" id="a0" name="tname">
								<!-- <input type='hidden' class="form-control" id="a1" name="tphone" readonly required> -->
								<!-- -------------------------------------------------------------- -->


							</div>
							<div class="col-sm-2">
								<button type="button" class="form-control"
									data-target="#searchMember" data-toggle="modal"
									data-ng-click="order('tutorId')">
									<span class="glyphicon glyphicon-zoom-in"></span>
								</button>
							</div>
							<div class="col-sm-2">
								<button type="button" class="form-control" id="addmember"
									data-ng-click="add()">
									<span class="glyphicon glyphicon-plus"></span>
								</button>
							</div>
							<div class='addd'></div>
						</div>

						<br>
						<br>


						<div class="modal-footer">
							<!--  <input type="submit" id="teamAdd" class="btn btn-block btn-primary btn-float m-t-25" value="팀원추가"> -->
							<%-- <a href="Teammemberadd?start=${start }&end=${end }&time=${time }&search=${search}&tname=${tname}" >팀원추가</a> --%>

							<button type="submit" id="addteam"
								class="w3-btn w3-sand w3-border w3-border-brown w3-round">팀원추가</button>

						</div>
					</div>
				</div>
			</div>
		</form>
	</div>






	<!-- 검색-->
	<div id="searchMember" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header w3-deep-orange">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true" data-ng-click="editFlag=false;searchVal=''">&times;</button>
					<h4 class="modal-title w3-text-white">회원 검색</h4>
				</div>
				<div class="modal-body">
					<form>
						<table class="table">
							<thead>
								<tr>
									<td colspan="3"><input type="text" id="searchVal"
										name="searchVal" data-ng-model="searchVal"
										class="form-control" required="required"
										placeHolder="아이디를 입력하세요"></td>
									<td></td>
									<td>
										<button type="button" class="form-control"
											onclick="membersearch()">
											<span class="glyphicon glyphicon-zoom-in">&nbsp;검색</span>
										</button>
									</td>
								</tr>
							</thead>
						</table>
						<table id='membersearch' class='table'>
						</table>

					</form>
				</div>
				<div class="modal-footer"></div>
			</div>
		</div>
	</div>
	<!-- --------------------------------------------------------------------------------------------------------------------------- -->
	<br />
	<br />
	

	<hr />

	<br />
	<br />


	<b><center>아이디 or 이름</center></b>
	<br />
	<center>
		<c:forEach items="${teamAddList}" var="member">
	${member.tname}
	</c:forEach>
	</center>






	<div class="reser">

		<%-- <a href="event_addform?start=${start }&end=${end }&time=${time }">◀◁◀◁예약계속하기</a> --%>
		<button type="submit"
			class="w3-btn w3-sand w3-border w3-border-brown w3-round"
			id="addform">◀◁◀◁예약계속하기</button>
	</div>


	<br>
	<br>
	<div id="sh_ft" style="margin-top: 150px; height: 140px">
		<div id="sh_ft_wrapper">
			<div id="address">
				<p>
					상호 : GTCS 사업자 번호 : 053.940.5114, 대표 : 김건협, 개인정보 관리 책임자 : 서제교
					SJK@naver.com<br /> 주소 : 대구광역시 북구 복현로 35 (복현2동 218), 고객센터 :
					053.940.5114, 팩스 : 053-940-5114 <br>
				<p>
					Copyright ⓒ <strong>2016 YEUNGJIN COLLEGE</strong> All rights
					reserved.
				</p>
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