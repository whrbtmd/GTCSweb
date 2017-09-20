<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="description" content="Material Design Mobile Template">
<meta name="HandheldFriendly" content="True">
<meta name="MobileOptimized" content="320">
<meta name="viewport" content="width=device-width, initial-scale=1, minimal-ui">
<script src="./resources/js/jquery-2.2.2.min.js"></script>
<script src="./resources/js/test.js"></script>

<script language="javascript">            
function send(form) {
    $.ajax({
 url: "https://shielded-fortress-32957.herokuapp.com/php/order.php",
 type: "POST",
 data: $("form.ajax"+form.food_name.value).serialize(),
 success: function(msg){
  }
 });
  window.alert('test');
}
</script>
<title>Insert title here</title>
</head>
<body>

 <div class="grandparent" style="margin-top:20%;">    
                    <!--페이지내용-->
                    <div data-role="content" class="ui-content" role="main" style="width: 100%; height:100%;">
                         <div class="content-primary" style="margin-bottom:3%;">
                        </div>
                    </div>
                        </div> 


</body>
</html>