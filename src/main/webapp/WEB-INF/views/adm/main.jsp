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
      src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
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

            <img src="../resources/img/whiteLogo.png" width="110px" height="58px">

         </div>
         <div class="collapse navbar-collapse" id="myNavbar">
            <ul class="nav navbar-nav">
               <li><a href="/GTCSMAIN">Home</a></li>
               <li><a href="/show_menu">그늘집</a></li>
               <li><a href="/home">예 약</a></li>
               <li><a href="/notice">공지사항</a></li>
               <c:choose>
                  <c:when test="${userid == 'admin'}">
                     <li><a href="adminPage">관리자</a></li>
                  </c:when>
               </c:choose>
            </ul>
            <ul class="nav navbar-nav navbar-right loggin">
               <li><br> <c:choose>
                     <c:when test="${sessionScope.userid == null}">
                        <div align="right">
                           <a href="joinForm" class="top"><span
                              class="glyphicon glyphicon-user white"></span> 회원가입</a> <a
                              class="top" href="#" id="myBtnn"> <span
                              class="glyphicon glyphicon-log-in white"></span> 로그인
                           </a> &nbsp;&nbsp;
                        </div>
                     </c:when>
                     <c:when test="${sessionScope.userid == 'admin'}">
                        <div class="top" align="right">
                           <span class="glyphicon glyphicon-user white"><b>'관리자'님</b></span>&nbsp;&nbsp;
                           <a class="top" href="/logout"><span
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
                           <span class="w-amount blue">${goodcount}</span> <br> <span
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
                           <span class="w-amount green"> ${cal }</span>   <br><span
                              class="text-uppercase w-name"> reservation</span>
                        </div>
                        <span class="w-refresh w-p-icon"><i
                           class="fa fa-calendar"></i></span>
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
               <div class="col-sm-6 col-lg-3"><a href="../adm/order">
                  <div class="content-box ultra-widget"> 
                     <div class="w-content big-box">
                        <div class="w-progress">
                           <span class="w-amount red">${newor}</span>
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
                  </div></a>
               </div>
               <div class="col-sm-6 col-lg-3">
                  <div class="content-box ultra-widget">
                     <div class="w-content big-box">
                        <div class="w-progress">
                           <span class="w-amount yellow">18</span> <br> <span
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
               <div class="panel-body-widget saleRateContent">
                  <!--                   <div class="panel-heading"> -->

                  <!--                      <h3 class="panel-title">sales</h3> -->
                  <!--                   </div> -->
                  <div class="panelMenu">
                     <ul>
                        <li><a href="#" class="pulse activePanelMenu">Day</a></li>
                        <li><a href="#" class="pulse">Month</a></li>
                        <li><a href="#" class="pulse">Year</a></li>
                     </ul>
                  </div>
                  <div class="panelBodyContentChart day panelBodyContentActive">
                     <div class="content-box">
                        <div class="big-box">
                           <div id="morris-day" class="morris-container"></div>
                        </div>
                     </div>
                  </div>
                  <div class="panelBodyContentChart month">
                     <div class="content-box">
                        <div class="big-box">
                           <div id="morris-mon" class="morris-container"></div>
                        </div>
                     </div>
                  </div>
                  <div class="panelBodyContentChart year">
                     <div class="content-box">
                        <div class="big-box">
                           <div id="morris-year" class="morris-container"></div>
                        </div>
                     </div>
                  </div>
                  <br> <br> <br> <br>
               </div>
            </div>
         </div>
         <div class="col-lg-6">

            <div class="row">
               <div class="col-lg-6">
                  <div class="content-box biggest-box">
                     <a href="../menu_write"><img class="fine"
                        src="../resources/img/onefood.png"
                        style="width: 400px; height: 120px;"></a>
                  </div>
               </div>

               <div class="col-lg-6">
                  <div class="content-box biggest-box">
                     <a href="/productRegister"><img class="fine"
                        src="../resources/img/twoshop.png"
                        style="width: 400px; height: 120px;"></a>
                  </div>
               </div>
            </div>

            <br> 
            <div class="row">
               <div class="col-lg-6">
                  <div class="content-box biggest-box">
                     <a href="../order_show"><img class="fine"
                        src="../resources/img/fourtraffic.png"
                        style="width: 400px; height: 120px;"></a>
                  </div>
               </div>
               <div class="col-lg-6">
                  <div class="content-box biggest-box">
                     <a href="/home"><img class="fine"
                        src="../resources/img/threereser.png"
                        style="width: 400px; height: 120px;"></a>
                  </div>
               </div>
            </div>
            <br> 
         </div>
      </div>



      <div class="col-lg-6">
         <div class="panel panel-default magic-element">

            <table width="100%" border="0" cellspacing="0" cellpadding="0"
               class="coupon_shop">
               <tbody>
                  <c:forEach var="list" items="${toporder}" varStatus="status">
                     <tr>
                        <td width="183" style="padding: 10px 0 10px 10px;"><a
                           target="_blank"><img
                              src="/shop/getByteImage?&goodsNumber=${list.bno}" width="160"
                              height="110" class="thumbnail" onmouseover="inFocus_ML(this);"
                              onmouseout="outFocus_ML(this);"
                              style="border: 6px solid rgb(231, 231, 231);"></a></td>
                        <td width="630">
                           <table width="100%" border="0" cellspacing="0" cellpadding="0">
                              <tbody>
                                 <tr>
                                    <td class="shop_name">
                                       <table width="100%" border="0" cellspacing="0"
                                          cellpadding="0">
                                          <tbody>
                                             <tr>
                                                <td rowspan="2" class="rank"><img
                                                   src="http://img.e-runsesang.com/main_201007/man_rank_0${status.count}.gif">
                                                   </a></td>

                                                <td>${list.manufacturer}</td>
                                             </tr>
                                             <tr>
                                                <td valign="top"><span> <img
                                                      src="http://img.e-runsesang.com/main_201007/i_home_m.gif"></a>
                                                      ${list.category}
                                                </span></td>
                                             </tr>
                                          </tbody>
                                       </table>

                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="shop_info">${list.name}</td>
                                 </tr>


                              </tbody>
                           </table>
                        </td>
                        <td align="center">

                           <div
                              style="width: 80px; border-right-width: 30px; padding-right: 15px;">
                              판매량 <span class="rank3">${list.quantity} </span>
                           </div>
                        </td>
                     </tr>
               </tbody>
               </c:forEach>
            </table>

         </div>
      </div>
      <div class="col-md-6">
         <div class="panel">
            <div class="panel-heading">

               <h3 class="panel-title"><a href="/caddieInsert">add caddie</a></h3>
            </div>
            <div class="panel-body-widget saleRateContent">
               <div class="panelMenu">

                  <ul>

                     <li><a href="#" class="pulse activePanelMenu">caddie</a></li>
                     <li><a href="#" class="pulse ">member</a></li>
                  </ul>
               </div>
               <div class="panelBodyContentChart caddie panelBodyContentActive">
                  <img class="title" src="../resources/img/cdlist.png"
                     style="height: 50px; margin-left: 400px;">

                  <table class="table table-hover">
                     <thead>
                        <tr>
                           <th scope="col">회원아이디</th>
                           <th scope="col">회원 이름</th>
                           <th scope="col">연락처</th>
                           <th scope="col">주소</th>
                        </tr>
                     </thead>
                     <tbody>
                        <c:forEach items="${listcd}" var="member">
                           <tr class="">
                              <td class="td_name sv_use">${member.userid}</td>
                              <td class="td_name sv_use"><a
                                 href="readcd?userid=${member.userid}" style="color: black;">${member.username}</a></td>
                              <td class="td_name sv_use">${member.phone}</td>
                              <td class="td_name sv_use">${member.address}</td>

                           </tr>
                        </c:forEach>
                     </tbody>
                  </table>

               </div>

               <div class="panelBodyContentChart member ">
                  <img class="title" src="../resources/img/mblist.png"
                     style="height: 50px; margin-left: 400px;">
                  <table class="table table-hover">
                     <thead>
                        <tr>
                           <th scope="col">회원아이디</th>
                           <th scope="col">회원 이름</th>
                           <th scope="col">연락처</th>
                           <th scope="col">주소</th>
                        </tr>
                     </thead>
                     <tbody>
                        <c:forEach items="${mlist}" var="member">
                           <tr>
                              <td class="td_name sv_use">${member.userid}</td>
                              <td class="td_name sv_use"><a
                                 href="readcd?userid=${member.userid}" style="color: black;">${member.username}</a></td>
                              <td class="td_name sv_use">${member.phone}</td>
                              <td class="td_name sv_use">${member.address}</td>

                           </tr>
                        </c:forEach>
                     </tbody>
                  </table>
               </div>


            </div>

         </div>
      </div>


   </div>






   <script type="text/javascript" src="/resources/js/custom.js"></script>
   <script type="text/javascript" src="/resources/js/js1.js"></script>
   <script type="text/javascript" src="/resources/js/js2.js"></script>
   <script type="text/javascript" src="/resources/js/js3.js"></script>
   <script type="text/javascript" src="/resources/js/js4.js"></script>
   <script type="text/javascript" src="/resources/js/js5.js"></script>
   <script type="text/javascript" src="/resources/js/js6.js"></script>
   <script type="text/javascript" src="/resources/js/js7.js"></script>
   <script type="text/javascript" src="/resources/js/js8.js"></script>
   <script type="text/javascript" src="/resources/js/js9.js"></script>
   <script type="text/javascript" src="/resources/js/donut.js"></script>
   <script type="text/javascript" src="/resources/js/chart.js"></script>
   <script type="text/javascript" src="/resources/js/scroll.js"></script>
   <script type="text/javascript" src="/resources/js/test.js"></script>
   <script type="text/javascript" src="/resources/js/test2.js"></script>
   <script type="text/javascript" src="/resources/js/cal.js"></script>
   <script type="text/javascript" src="/resources/js/aa.js"></script>
   <script type="text/javascript" src="/resources/js/menu.js"></script>
   <script type="text/javascript" src="/resources/js/line.js"></script>
   <!--    <script type = "text/javascript" src="/board/resources/js/common.js"></script> -->
   <script type="text/javascript" src="/resources/js/weather.js"></script>
   <script type="text/javascript" src="/resources/js/select.js"></script>
   <script>
      //Current Date
                
      Morris.Line({
         element : 'morris-mon',
         data : [
<%List<recordVO> list1 = (List<recordVO>) request.getAttribute("list1");
         for (int i = 0; i < list1.size(); i++) {
            recordVO bean = list1.get(i);%>
                { 
            z : '<%=bean.getMon()%>',
            a : '<%=bean.getPrice()%>'
               
                       },
                <%}%>
         ],
         xkey : 'z',
         ykeys : [ 'a' ],
         //            xLabels: 'month',
         labels : [ '판매량' ],
         hideHover : 'auto',
         resize : true,
         lineColors : [ '#63A8EB' ]
      });
      
      Morris.Line({
         element : 'morris-day',
         data : [
<%List<recordVO> list2 = (List<recordVO>) request.getAttribute("list2");
         for (int i = 0; i < list2.size(); i++) {
            recordVO bean = list2.get(i);%>
       { 
   z : '<%=bean.getMon()%>',
   a : '<%=bean.getPrice()%>'
      
              },
       <%}%>
],
         xkey : 'z',
         ykeys : [ 'a' ],
         //            xLabels: 'month',
         labels : [ '판매량' ],
         hideHover : 'auto',
         resize : true,
         lineColors : [ '#63A8EB' ]
      });
      
      Morris.Line({
         element : 'morris-year',
         data : [
<%List<recordVO> list3 = (List<recordVO>) request.getAttribute("list3");
         for (int i = 0; i < list3.size(); i++) {
            recordVO bean = list3.get(i);%>
       { 
   z : '<%=bean.getMon()%>',
   a : '<%=bean.getPrice()%>'
      
              },
       <%}%>
],
         xkey : 'z',
         ykeys : [ 'a' ],
         //            xLabels: 'month',
         labels : [ '판매량' ],
         hideHover : 'auto',
         resize : true,
         lineColors : [ '#63A8EB' ]
      });
      
      
      
      $(".panelMenu a").click(
            function(e) {
               $(this).closest(".panelMenu").find("a").removeClass(
                     "activePanelMenu");
               $(this).addClass("activePanelMenu").addClass("pulse");
               var a = $(this).html();

               if (a == "Month") {
                  $(this).closest(".panel-body-widget").find(".day")
                        .removeClass("panelBodyContentActive");
                  $(this).closest(".panel-body-widget").find(".year")
                        .removeClass("panelBodyContentActive");
                  $(this).closest(".panel-body-widget").find(".month")
                        .addClass("panelBodyContentActive");
               }

               if (a == "Day") {
                  $(this).closest(".panel-body-widget").find(".month")
                        .removeClass("panelBodyContentActive");
                  $(this).closest(".panel-body-widget").find(".year")
                        .removeClass("panelBodyContentActive");
                  $(this).closest(".panel-body-widget").find(".day")
                        .addClass("panelBodyContentActive");
               }

               if (a == "Year") {
                  $(this).closest(".panel-body-widget").find(".month")
                        .removeClass("panelBodyContentActive");
                  $(this).closest(".panel-body-widget").find(".day")
                        .removeClass("panelBodyContentActive");
                  $(this).closest(".panel-body-widget").find(".year")
                        .addClass("panelBodyContentActive");
               }

               e.preventDefault();

            });
      $(".panelMenu a").click(
            function(e) {
               $(this).closest(".panelMenu").find("a").removeClass(
                     "activePanelMenu");
               $(this).addClass("activePanelMenu").addClass("pulse");
               var a = $(this).html();

               if (a == "caddie") {
                  $(this).closest(".panel-body-widget").find(".member")
                        .removeClass("panelBodyContentActive");
                  $(this).closest(".panel-body-widget").find(".caddie")
                        .addClass("panelBodyContentActive");
               }

               if (a == "member") {
                  $(this).closest(".panel-body-widget").find(".caddie")
                        .removeClass("panelBodyContentActive");
                  $(this).closest(".panel-body-widget").find(".member")
                        .addClass("panelBodyContentActive");
               }


               e.preventDefault();

            });
   </script>


</body>

</html>