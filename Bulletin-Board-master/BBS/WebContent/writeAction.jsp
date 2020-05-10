<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import="javax.websocket.Session"%>
<%@ page import = "bbs.BbsDAO" %>
<%@ page import = "java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="bbsdto" class="bbs.BbsDTO" scope="page" />
	<jsp:setProperty name = "bbsdto" property = "bbsTitle" />
	<jsp:setProperty name = "bbsdto" property = "bbsContent" />

	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>게시판 글쓰기</title>
</head>
<body>
	<%
	
	String userID = null;
	if(session.getAttribute("userID") != null){
		userID = (String)session.getAttribute("userID");
	}
	if(userID == null){
		PrintWriter print = response.getWriter();
		print.println("<script>");
		print.println("alert('로그인을 하세요.')");
		print.println("location.href = 'Login.jsp'");
		print.println("</script>");
	}else {
		if(bbsdto.getBbsTitle() == null || bbsdto.getBbsContent() == null){
			PrintWriter print = response.getWriter();
			print.println("<script>");
			print.println("alert('입력이 안된 사항이 있습니다.')");
			print.println("history.back()");
			print.println("</script>");
		}else {
			
			BbsDAO bbsDAO = new BbsDAO(); //객체 생성부터 오라클 연결까지 
			int result = bbsDAO.write(bbsdto , userID);
			if(result == -1){
				PrintWriter print = response.getWriter();
				print.println("<script>");
				print.println("alert('데이터베이스 오류입니다.')");
				print.println("history.back()");
				print.println("</script>");
			}else{	
				PrintWriter print = response.getWriter();
				print.println("<script>");
				print.println("location.href = 'bbs.jsp'");
				print.println("</script>");
			}
		}
	}
	
	
	%>
</body>
</html>