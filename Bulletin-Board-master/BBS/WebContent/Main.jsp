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
	<% 
	String userID = null;
	if(session.getAttribute("userID") != null){
	userID = (String)session.getAttribute("userID");
	}
	%>
	
	<% 
		if(userID != null){
	%>
		<input type = "button" id = "LogoutButton" onclick = "location.href='LogoutAction.jsp'" value = "로그아웃">
		<input type = "button"	id = "JoinButton" onclick = "location.href='Join.jsp'" value = "회원가입">
		<input type = "button"	id = "writeButton" onclick = "location.href='write.jsp'" value = "게시판">	
	<% 
		}else {
			response.sendRedirect("Login.jsp");
		}
	%>
		
	<script src = "https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src = "js/bootstrap.js"></script>
</body>
</html>