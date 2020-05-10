<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "userDAO.UserDAO" %>
<%@ page import = "java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="user" class="userDTO.UserDTO" scope="page" />
	<jsp:setProperty name = "user" property = "*" />

	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>회원가입_2</title>
</head>
<body>
	<%

	
	UserDAO userDAO = new UserDAO(); /*객체 생성하면서 오라클 연결까지*/
	
	if(user.getUserID() == null || user.getUserPassword() == null || user.getUserName() == null || user.getUserGender() == null || user.getUserEmail() == null){
		PrintWriter print = response.getWriter();
		print.println("<script>");
		print.println("alert('입력이 안된 사항이 있습니다.')");
		print.println("history.back()");
		print.println("</script>");
	}else if(userDAO.join(user) == 1){
		session.setAttribute("userID", user.getUserID());
		PrintWriter print = response.getWriter();
		print.println("<script>");
		print.println("location.href = 'Main.jsp'");
		print.println("</script>");
	}else if(userDAO.join(user) == 0){
		PrintWriter print = response.getWriter();
		print.println("<script>");
		print.println("alert('잘못 입력되었습니다.')");
		print.println("history.back()");
		print.println("</script>");
	}
	
	
	
	%>
</body>
</html>