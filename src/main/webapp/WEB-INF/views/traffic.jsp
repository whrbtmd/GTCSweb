<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="resources/js/jquery-2.2.2.min.js"></script>
<script type="text/javascript" src="resources/js/sweetalert.min.js"></script>
<link rel="stylesheet" href="http://lei1007.shiningcorp.com/css/default.css">
<link rel="stylesheet" href="http://lei1007.shiningcorp.com/skin/latest/sh_basic/style.css">
<link rel="stylesheet" href="http://lei1007.shiningcorp.com/css/user.css">
<link rel="stylesheet" href="http://lei1007.shiningcorp.com/css/page_style.css">
<link rel="stylesheet" type="text/css" href="css/font1.css" />
<link rel="stylesheet" href="http://lei1007.shiningcorp.com/sh_img/hd/aside/style.css">
<link rel="stylesheet" href="css/sweetalert.css">
<!--specifies that the map should be displayed full-screen and should not be resizable by the user-->
<meta name="viewport" content="initial-scale=1.0, user-scalable=no">
<!-- 소켓io 추가 -->
<title>Admin</title>

<style type="text/css">
html, body, #map-canvas {
	height: 100%;
	margin: 0;
	padding: 0;
}
#map-canvas {
width: 65%;
margin: 0, 400px;
}
/* #map-canvas img { */
/* 	max-width: none !important; */
/* } */

#save-widget {
	width: 300px;
	box-shadow: rgba(0, 0, 0, 0.298039) 0px 1px 4px -1px;
	background-color: white;
	padding: 10px;
	font-family: Roboto, Arial;
	font-size: 13px;
	margin: 15px;
}

#controll {
	width: 19%;
	height: 100%;
	float: right;
}

#user {
	height: 30%;
	overflow-y: scroll;
	padding-right: 15px;
	padding-left: 15px;
	margin-top: 15px;
	margin-right: 15px;
	background: #FFF;
	border: 1px solid #D5D5D5;
	-moz-border-radius: 5px;
	-webkit-border-radius: 5px;
	border-radius: 10px;
}

#chatlist {
	height: 40%;
	overflow-y: scroll;
	padding: 25px 15px 15px;
	margin-top: 15px;
	margin-right: 15px;
	background: #FFF;
	border: 1px solid #D5D5D5;
	-moz-border-radius: 5px;
	-webkit-border-radius: 5px;
	border-radius: 10px;
}
</style>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.2/jquery.min.js"></script>
<script src="https://gtccc.herokuapp.com/socket.io/socket.io.js"></script>
<script type="text/javascript" src="resources/js/admin.js"></script>
<script src="https://cloud.apizee.com/libs/jquery-1.9.0.min.js"></script>
<script src="https://cloud.apizee.com/apiRTC/apiRTC-latest.min.js"></script>
</head>
<body><div id="sh_hd_wrapper">
<div id="sh_top_menu_wrapper">
					<h1 id="top_logo"><a href="GTCSMAIN">
						<img src="./resources/sh_img/hd/top_menu/logo.png" width="150px"
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


									<li class="list list03"><a href="adm/home">관리자페이지</a>
										<ul class="sub_ul3"></ul></li>

							<li class="list list04"><a href="score">스코어관리</a></li>
							
							<li class="list list05"><a href="notice">공지사항</a></li>

						</ul>
					</div>
					<!--menu!-->
					<div style="clear: both; visibility: hidden"></div>
				</div>
				</div>
	<div id="myRemoteVideo" style="display: none"></div>
	<video id="myMiniVideo" autoplay="autoplay" style="display: none"></video>
		<div id="controll">
		<div id="user">
			<center>
				<button class="allsendmg"
					style="background: none; border: 0px;  margin-top: 2%">
					<img src="resources/image/all_mg.png"
						style="width: 50px; height: 50px">
				</button>
				<b id="usercount" style="font-size: 30px"></b>
			</center>
			<hr style="color: black">
			<div id="userlist"></div>
		</div>
		<div id="lateup"></div>
		<div id="chatlist">
			<b style="font-size: 30px">받은 메세지</b>
			<hr style="color: black">
		</div>
		<div id="locinfo" style="display: none"></div>
		<center>
			<button id='hangup'
				; style='background: none; float: right; display: none; border: none;'>
				<img src='resources/image/exit.png'
					style='width: 50px; height: 50px; float: right; padding-right: 70px; padding-top: 10px'>
			</button>
			<div id="callarea" style="padding-top: 30px;"></div>
		</center>
	</div>
	<script>
		/*무전기*/
		function incomingCallHandler(e) {
			apiRTC.addEventListener("remoteHangup", remoteHangupHandler);
			$('#hangup').show();
		}

		function remoteHangupHandler(e) {
			$('#hangup').hide();
			$('#callarea').empty();
		}

		function userMediaErrorHandler(e) {
		}

		function sessionReadyHandler(e) {

			apiRTC.addEventListener("incomingCall", incomingCallHandler);
			apiRTC.addEventListener("userMediaError", userMediaErrorHandler);

			var webRTCClient = apiCC.session.createWebRTCClient({
				minilocalVideo : "myMiniVideo",
				remoteVideo : "myRemoteVideo",
				status : "status"
			});

			$(document).on(
					"click",
					'#call',
					function() {
						window.alert(this.value)
						swal({
							title : "알림",
							text : "통화연결을 하시겠습니까?",
							type : "warning",
							showCancelButton : true,
							confirmButtonColor : "#5CD1E5",
							confirmButtonText : "연결",
							cancelButtonText : "취소",
							closeOnConfirm : false,
							closeOnCancel : false
						}, function(isConfirm) {
							if (isConfirm) {
								swal("성공", "연결 되었습니다.", "success");
								apiRTC.addEventListener("remoteHangup",
										remoteHangupHandler);
								destNumber = call.value;
								webRTCClient.call(destNumber);
								$('#hangup').show();
							} else {
								swal("취소", "취소 하셨습니다.", "error");
							}
						});

					});

			$(document).on("click", '#hangup', function() {
				swal({
					title : "알림",
					text : "연결을 종료하시겠습니까?",
					type : "warning",
					showCancelButton : true,
					confirmButtonColor : "#DD6B55",
					confirmButtonText : "종료",
					closeOnConfirm : false
				}, function() {
					swal("종료", "연결이 종료되었습니다.", "success");
					webRTCClient.hangUp();
					$('#hangup').hide();
					$('#callarea').empty();
				});
			});
		}

		function onDeviceReady() {

			if (device.platform == 'iOS') {
				cordova.plugins.iosrtc.registerGlobals();
			}
		}

		$(document).ready(function() {

			apiRTC.init({
				apiCCId : "1234",
				onReady : sessionReadyHandler,
				apiKey : "813b5d0f13ebaa1093fa118e43c35903"
			});

			document.addEventListener("deviceready", onDeviceReady, false);
		});

		/*여기까지*/
		$(document)
				.ready(
						function() {

							$(document)
									.on(
											"click",
											'.serch',
											function() {
												var testid = this.value;
												$('div[id=' + this.value + ']')
														.each(
																function() {

																	//    var test = $()
																	var nowloc = $(
																			'i[id='
																					+ testid
																					+ '1]')
																			.text();
																	var nowloc2 = $(
																			'i[id='
																					+ testid
																					+ '2]')
																			.text();

																	map
																			.setCenter(new google.maps.LatLng(
																					nowloc,
																					nowloc2));
																	map
																			.setZoom(25);
																	//function initMap() {
																	//
																	//  var map = new google.maps.Map(document.getElementById('map'), {
																	//    zoom: 4,
																	//    center: myLatlng
																	//  });
																	//
																	//
																	//}
																	//    map = new google.maps.Map(document.getElementById('map-canvas'), {
																	//    zoom: 25,
																	//    center: new google.maps.LatLng(nowloc,nowloc2),
																	//    mapTypeId: google.maps.MapTypeId.ROADMAP
																	//  });  
																});
											});
							var uid = "admin";
							var socket = io
									.connect('https://gtccc.herokuapp.com');
							socket.on('connect', function() {
								socket.emit('user', uid);
							});
							socket.on('curcalluser', function(curid) {
								sessionStorage.curcalluser = curid;
								$('#callarea').append(
										"<i style='font-size:30px;'> "
												+ sessionStorage.curcalluser
												+ "님의 무전</i>");
							})
							socket
									.on(
											'updateuser',
											function(usernames) {
												$('#userlist').empty();
												$('#usercount').empty();
												$
														.each(
																usernames,
																function(key,
																		value) {
																	sessionStorage.usercount = usernames.length - 1;
																	if (value != "admin") {

																		$(
																				'#userlist')
																				.append(
																						'<b id="'+value+'" style="font-size:25px;">'
																								+ value
																								+ '</b>');
																		$(
																				'#userlist')
																				.append(
																						'<small id="'+value+'"></small>');
																		$(
																				'#userlist')
																				.append(
																						'<big id="'+value+'"></big>');
																		$(
																				'#userlist')
																				.append(
																						'<button class="serch" value="'+value+'" style="background:none;border:none"><img src="resources/image/serch.png" style="width:20px;height:20px"></button><br/>');
																	}
																});
												$('#usercount')
														.append(
																'<b>캐디현황 ( '
																		+ sessionStorage.usercount
																		+ ' ) </b><br/>');
											});

							$(document)
									.on(
											"click",
											'#chatbtnclick2',
											function() {
												var idd = this.value;
												var cuid = uid;
												/*socket.emit('guestjoin', idd);*/
												//채팅 신청 시 말뜨게 하기
												swal(
														{
															title : idd
																	+ "님에게 전송",
															text : "메세지를 입력하세요",
															type : "input",
															showCancelButton : true,
															closeOnConfirm : false,
															animation : "slide-from-top",
															inputPlaceholder : "내용"
														},
														function(inputValue) {
															if (inputValue === false)
																return false;
															if (inputValue === "") {
																swal
																		.showInputError("입력값이 없습니다");
																return false
															}
															socket.emit(
																	'req_join',
																	idd,
																	inputValue,
																	cuid);
															swal(
																	"전송완료",
																	"메세지: "
																			+ inputValue,
																	"success");
														});
											});
							socket.on('res_join', function(idd, inputValue,
									cuid) {
								if (idd == uid) {
									$('#chatlist').append(
											"<b>" + cuid + ": " + inputValue
													+ "</b></br>");
									var audio = new Audio(
											"resources/image/mgso.mp3");
									audio.play()
									swal({
										title : cuid + "님의 메세지",
										text : inputValue,
										type : "input",
										showCancelButton : true,
										closeOnConfirm : false,
										animation : "slide-from-top",
										inputPlaceholder : "답장"
									}, function(inputValue) {
										if (inputValue === false)
											return false;
										if (inputValue === "") {
											swal.showInputError("입력값이 없습니다");
											return false
										}
										swal("전송완료", "메세지: " + inputValue,
												"success");
										socket.emit('req_again', cuid,
												inputValue, idd);
									});
								}
							})
							socket.on('res_again', function(cuid, inputValue,
									idd) {
								if (cuid == uid) {
									$('#chatlist').append(
											"<b>" + idd + ": " + inputValue
													+ "</b></br>");
									var audio = new Audio(
											"resources/image/mgso.mp3");
									audio.play()
									swal({
										title : idd + "님의 메세지",
										text : inputValue,
										type : "input",
										showCancelButton : true,
										closeOnConfirm : false,
										animation : "slide-from-top",
										inputPlaceholder : "답장"
									}, function(inputValue) {
										if (inputValue === false)
											return false;
										if (inputValue === "") {
											swal.showInputError("입력값이 없습니다");
											return false
										}
										swal("전송완료", "메세지: " + inputValue,
												"success");
										socket.emit('req_join', idd,
												inputValue, cuid);
									});
								}
							});
						});
		$(document).on("click", '.allsendmg', function() {
			swal({
				title : "전체전송",
				text : "메세지를 입력하세요",
				type : "input",
				showCancelButton : true,
				closeOnConfirm : false,
				animation : "slide-from-top",
				inputPlaceholder : "내용"
			}, function(inputValue) {
				if (inputValue === false)
					return false;
				if (inputValue === "") {
					swal.showInputError("입력값이 없습니다");
					return false
				}
				socket.emit('allsendmg', inputValue);
				swal("전송완료", "메세지: " + inputValue, "success");
			});
		});
	</script>
	<div id="map-canvas" style="width: 62%; height: 80%; float: center; margin: 0 350px;"></div>
	<div class='Update' style="display: none" id="updateDiv">
		<input type='radio' name='radio' class="radio" value="1">왼쪽 <input
			type='radio' name='radio' class="radio" value="2">오른쪽
		<button id='submit'>적용</button>
	</div>


</body>
</html>
