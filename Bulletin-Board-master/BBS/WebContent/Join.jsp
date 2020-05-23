<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name = "viewport" content ="width=device-width", initial-scale="1">
<link rel = "stylesheet" href = "css/bootstrap.css">
<link rel = "stylesheet" href = "1.css">
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
    
  
	<div class = "loginContainer">
	
	
		<form method = "post" action = "JoinAction.jsp" >
			<!--  <h3 style = "text-align: center;">회원가입 화면</h3>-->
			
				<label>아이디</label><input class = "inputType" type = "text" placeholder = "아이디" name = "userID"  maxlength = "20" ><br>
			
			
				<label>비밀번호</label><input class = "inputType" type = "password" placeholder = "비밀번호" name = "userPassword" maxlength = "20" ><br>
			
			
				<label>이름</label><input class = "inputType" type = "text" placeholder = "이름" name = "userName" maxlength = "20"><br>
			
				
				<label>성별</label> 
				<input type = "radio" name = "userGender" value = "male" checked>male
				<input type = "radio" name = "userGender" value = "female">female<br>
				
				<label>이메일</label>
				<input class = "inputType" type = "email" name = "userEmail" placeholder ="이메일" maxlength = "30"><br>
			
				
				<input class = "inputType" type = "submit" value = "회원가입">
			
		</form>
	
	
	<script src = "https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src = "js/bootstrap.js"></script>
</body>
</html>