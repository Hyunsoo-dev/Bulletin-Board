<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name = "viewport" content ="width=device-width", initial-scale="1">
<link rel = "stylesheet" href = "css/bootstrap.css">
<link rel = "stylesheet" href = "1.css">
<title>JSP 게시판 만들기</title>
</head>
<body>
	
	<!-- <div class = "container">
	<div class = "col-lg-4"></div>
	<div class = "col-lg-4">>
	<div class = "jumbotron" style = "padding-top: 20px;"> -->
	
	<div class = "loginContainer"> 
		<form method = "post" action = "LoginAction.jsp" >
			<!-- <h3 style = "text-align: center;">로그인 화면</h3> -->
			
				아이디  <input class = "inputType" type = "text" placeholder = "아이디" name = "userID" maxlength = "20"><br>
			
			
				비밀번호  <input class = "inputType" type = "password" placeholder = "비밀번호" name = "userPassword" maxlength = "20"><br>
			
			
				<input class = "inputType" type = "submit" value = "로그인">
				<input class = "inputType" type = "button" id = "joinButton" onclick="location.href='Join.jsp'" value = "회원가입">
	
			
		</form>
		<form method = "post" action = "Join.jsp" >
		
		</form>
	</div>
	<script src = "https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src = "js/bootstrap.js"></script>
</body>
</html>