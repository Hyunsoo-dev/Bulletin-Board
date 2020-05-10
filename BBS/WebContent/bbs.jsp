<%@page import="java.util.ArrayList"%>
<%@page import="bbs.BbsDAO"%>
<%@page import="bbs.BbsDTO"%>
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
	 int pageNumber = 1;
	 if(request.getParameter("pageNumber") !=  null){
		 pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
	 }
	 %>	
	 
	<% 
		if(userID != null){
	%>
		<div class = "container">
		<div class = "row">
			<table class = "table table-striped" style = "text-align: center; border : 1px solid #dddddd">
				<thead>
					<tr>
						<th style = "background-color: #eeeeee; text-align: center;">번호</th>
						<th style = "background-color: #eeeeee; text-align: center;">제목</th>
						<th style = "background-color: #eeeeee; text-align: center;">작성자</th>
						<th style = "background-color: #eeeeee; text-align: center;">작성일</th>
					</tr>
				</thead>
				<tbody>
				<%
					BbsDAO bbsDAO = new BbsDAO();
					ArrayList<BbsDTO> list = bbsDAO.getList(pageNumber);
					
					for(int i = 0; i < list.size(); i++){
				%>
				<tr>		
					<td><%=	list.get(i).getBbsID() %></td>
					<td><a href="view.jsp?bbsID=<%=list.get(i).getBbsID() %>"><%=	list.get(i).getBbsTitle() %></td>
					<td><%=	list.get(i).getUserID() %></td>
					<td><%=	list.get(i).getBbsDate() %></td>
				</tr>	
				<% 
					}	
				%>
				</tbody>
			</table>
			
			<div>
			<input type = "button" id = "writeButton" onclick = "location.href = 'write.jsp'" value = "글쓰기">
			</div>
		</div>
	</div>
	<% 
		}else {
			response.sendRedirect("Login.jsp");
		}
	%>
	 
	
	 
	 
	<script src = "https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src = "js/bootstrap.js"></script>
	
	
</body>
</html>