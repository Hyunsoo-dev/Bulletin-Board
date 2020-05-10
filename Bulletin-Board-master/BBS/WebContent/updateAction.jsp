<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@page import="bbs.BbsDTO"%>
<%@ page import = "bbs.BbsDAO" %>
<%@ page import = "java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<meta charset="UTF-8">
<meta name = "viewport" content ="width=device-width" , initial-scale="1">
<link rel = "stylesheet" href = "css/bootstrap.css">
<title>게시물 수정 화면</title>
</head>
<body>
	
	<% 
		int bbsID = 0;
		if(request.getParameter("bbsID") != null){
		bbsID = Integer.parseInt(request.getParameter("bbsID"));
		}
		
	
	
		String userID = null;
		if(session.getAttribute("userID") != null){
		userID = (String)session.getAttribute("userID");
		}
	
		if(userID != null){
		BbsDAO bbsDAO = new BbsDAO();
		int result = bbsDAO.update(bbsID , request.getParameter("bbsTitle") , request.getParameter("bbsContent"));
		
		PrintWriter print = response.getWriter();
			if(result > 0){
			
			print.println("<script>");
			print.println("location.href ='bbs.jsp'");
			print.println("</script>");
			} else {
				print.println("<script>");
				print.println("history.back()");	
				print.println("</script>");
			}
	%>
		
		
		
	<%
		}else {
			response.sendRedirect("Login.jsp");
		}
	%>
		 
	<script src = "https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src = "js/bootstrap.js"></script>
	
	
</body>
</html>