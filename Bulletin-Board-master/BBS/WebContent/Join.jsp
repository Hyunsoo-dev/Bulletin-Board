<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name = "viewport" content ="width=device-width", initial-scale="1">
<link rel = "stylesheet" href = "css/bootstrap.css">
<title>회원가입_1</title>
</head>
<body>
    <%
	String userID = null;
	if(session.getAttribute("userID") != null){
	userID = (String)session.getAttribute("userID");
	}
	if(userID != null){
		PrintWriter print = response.getWriter();
		print.println("<script>");
		print.println("alert('이미 로그인이 되어있습니다..')");
		print.println("location.href = 'Main.jsp'");
		print.println("</script>");
	}
    %>
	<div class = "container">
	<div class = "col-lg-4"></div>
	<div class = "col-lg-4">>
	<div class = "jumbotron" style = "padding-top: 20px;">
		<form method = "post" action = "JoinAction.jsp" >
			<h3 style = "text-align: center;">회원가입 화면</h3>
			<div class ="form-group">
				<input type = "text" placeholder = "아이디" name = "userID" maxlength = "20">
			</div>
			<div class ="form-group">
				<input type = "password" placeholder = "비밀번호" name = "userPassword" maxlength = "20">
			</div>
			<div class ="form-group">
				<input type = "text" placeholder = "이름" name = "userName" maxlength = "20">
			</div>
			<div class ="form-group">
				<input type = "radio" name = "userGender" value = "male" checked>male
				<input type = "radio" name = "userGender" value = "female">female
			</div>
			<div class ="form-group">
				<input type = "email" name = "userEmail" placeholder ="이메일" maxlength = "30">
			</div>
			<div class ="form-group">
				<input type = "submit" value = "회원가입">
			</div>
		</form>
	</div>
	</div>
	<script src = "https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src = "js/bootstrap.js"></script>
</body>
</html>