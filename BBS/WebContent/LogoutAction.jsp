<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "userDAO.UserDAO" %>
<%@ page import = "java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>

	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>회원가입_2</title>
</head>
<body>
	<%
		session.invalidate();
	%>
	<script>
		location.href ="Main.jsp";
	</script>
</body>
</html>