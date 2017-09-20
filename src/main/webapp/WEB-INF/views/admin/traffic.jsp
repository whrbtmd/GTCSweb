<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="initial-scale=1.0, user-scalable=no">
<script src="/resources/js/jquery-2.2.2.min.js"></script>
 <title>Google Geolocation Test</title>

  <style type="text/css">
    html, body, #map-canvas { height: 700px; margin: 0; padding: 0; }
    #map-canvas img { max-width: none !important; }
    #save-widget {
  width: 300px;
  box-shadow: rgba(0, 0, 0, 0.298039) 0px 1px 4px -1px;
  background-color: white;
  padding: 10px;
  font-family: Roboto, Arial;
  font-size: 13px;
  margin: 15px;
}
  </style>

   <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.2/jquery.min.js"></script>
   <script src="https://gtccc.herokuapp.com/socket.io/socket.io.js"></script>
  <script src="/resources/js/admin.js"></script>
</head>

<body>
  <!-- <script src="http://localhost:80/socket.io/socket.io.js"></script>

  <script>

  var socket = io.connect('http://localhost:80');  //localhost로 연결합니다.

    function submit(){
      socket.emit('my other event', { name : 'send',val:'3333' });   //서버에 my other event 이벤트를 보냅니다.
    }
  submit();
  //setInterval(submit,3000);
  </script> -->
  <!-- 이까지 -->
  <div id="map-canvas"></div>
  <div class='Update' style="display:none" id="updateDiv">
    <input type='radio' name='radio' class="radio" value="1">왼쪽
    <input type='radio' name='radio' class="radio" value="2">오른쪽
    <button id='submit'>적용</button>
  </div>


<a href="home">관리자페이지로 돌아가기</a>

</body>

</html>