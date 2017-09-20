<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css"
	href="./resources/css/jquery.datetimepicker.css" />
<style type="text/css">
.custom-date-style {
	background-color: red !important;
}

.input-wide {
	width: 500px;
}
#datetimepicker1{
	width: 200px;
}
</style>
</head>
<body>

	<p>
		<a href="http://xdsoft.net/jqplugins/datetimepicker/">Homepage</a>
	</p>
	
	<form>
	
	<h3>TimePicker</h3>
	<input type="text" id="datetimepicker1" placeholder="  클릭하여 시간을 선택해 주세요"/>
	<br>
	<br>
	
	</form>
</body>
<script src="./resources/js/jquery.js"></script>
<script src="./resources/js/build/jquery.datetimepicker.full.js"></script>
<script>
	
	/* $.datetimepicker.setLocale('en'); */
	
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
	
</script>
</html>