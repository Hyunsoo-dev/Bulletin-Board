<%@page import="javax.websocket.Session"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "userDAO.UserDAO" %>
<%@ page import = "java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="user" class="user.UserDTO" scope="page" />
	<jsp:setProperty name = "user" property = "userID" />
	<jsp:setProperty name = "user" property = "userPassword" />
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>로그인</title>
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
		
	UserDAO userDAO = new UserDAO(); /*객체 생성하면서 오라클 연결까지*/
	int result = userDAO.login(user.getUserID(),user.getUserPassword());
	
	if(result == 1){
		session.setAttribute("userID", user.getUserID());//로그인 성공시 세션 부여
		PrintWriter print = response.getWriter();
		print.println("<script>");
		print.println("location.href = 'Main.jsp'");
		print.println("</script>");
	}else if(result == 0){
		PrintWriter print = response.getWriter();
		print.println("<script>");
		print.println("alert('비밀번호가 틀립니다.')");
		print.println("history.back()");
		print.println("</script>");
	}else if(result == -2){
		PrintWriter print = response.getWriter();
		print.println("<script>");
		print.println("alert('데이터베이스 오류입니다.')");
		print.println("history.back()");
		print.println("</script>");
	}else if(result == -1){
		PrintWriter print = response.getWriter();
		print.println("<script>");
		print.println("alert('존재하지 않는 아이디 입니다.')");
		print.println("history.back()");
		print.println("</script>");
	}
	%>
</body>
</html>