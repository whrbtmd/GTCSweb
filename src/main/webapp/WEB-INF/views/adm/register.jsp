<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>게시판 등록 페이지</title>


<style>
form label {
	width: 5em;
	display: inline-block;
}

form input {
	margin-bottom: 20px;
}
</style>
</head>
<body>
	<form method="post" role="form" class="form-inline">
		<fieldset>
			<legend>게시글 작성</legend>

			<label for="writer">작성자 :</label> <input type="text" name="writer"
				id="writer" value="${id}"><br> <label for="title">제
				목: </label> <input id="title" type="text" name="title"> <br> <label
				for="content">내 용: </label>
			<textarea id="content" name="content" rows="10" cols="30"></textarea>
			<br> 
			 <input type="submit" value="등록">
		</fieldset>
	</form>
</body>
</html>