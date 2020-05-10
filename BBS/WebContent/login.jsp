<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name = "viewport" content ="width=device-width", initial-scale="1">
<link rel = "stylesheet" href = "css/bootstrap.css">
<title>JSP 게시판 만들기</title>
</head>
<body>

	<div class = "container">
	<div class = "col-lg-4"></div>
	<div class = "col-lg-4">>
	<div class = "jumbotron" style = "padding-top: 20px;">
		<form method = "post" action = "LoginAction.jsp" >
			<h3 style = "text-align: center;">로그인 화면</h3>
			<div class ="form-group">
				<input type = "text" placeholder = "아이디" name = "userID" maxlength = "20">
			</div>
			<div class ="form-group">
				<input type = "password" placeholder = "비밀번호" name = "userPassword" maxlength = "20">
			</div>
			<div class ="form-group">
				<input type = "submit" value = "로그인">
			</div>
			<div class ="form-group">
				<input type = "button" id = "joinButton" onclick="location.href='Join.jsp'" value = "회원가입">
			</div>
			
		</form>
	</div>
	</div>
	<script src = "https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src = "js/bootstrap.js"></script>
</body>
</html>