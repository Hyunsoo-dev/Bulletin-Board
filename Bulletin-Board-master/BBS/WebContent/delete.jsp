<%@page import="bbs.BbsDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ page import = "bbs.BbsDAO" %>
<meta charset="UTF-8">
<meta name = "viewport" content ="width=device-width" , initial-scale="1">
<link rel = "stylesheet" href = "css/bootstrap.css">
<title>게시물 수정 화면</title>
</head>
<body>
	<% 
		int bbsID = Integer.parseInt(request.getParameter("bbsID"));
		BbsDTO bbsDTO = new BbsDAO().getBbs(bbsID);
		
	
		String userID = null;
		if(session.getAttribute("userID") != null){
		userID = (String)session.getAttribute("userID");
		}
	%>
		
	<% 
		if(userID != null){
	%>
		<div class = "container">
		<div class = "row">
			<form method = "post" action = "deleteAction.jsp?bbsID=<%= bbsID %>">
				<table class = "table table-striped" style = "text-align: center; border : 1px solid #dddddd">
					<thead>
						<tr>
							<th colspan = "2" style = "background-color: #eeeeee; text-align: center;">게시판 삭제 양식</th>
						</tr>
					</thead>
					<tbody>
						
						<tr>
							<td><input type = "text" name = "bbsTitle" value = "<%= bbsDTO.getBbsTitle() %>" maxlength = "50"></td>
						</tr>
						<tr>
							<td><textarea name = "bbsContent" maxlength = "2048" ><%= bbsDTO.getBbsContent() %></textarea></td>
						</tr>
					</tbody>
				</table>
				<input type = "button" name = "bbsButton" onclick = "location.href='bbs.jsp'" value = "목록보기" class = "btn btn-primary">
				<input type = "submit" value = "삭제하기" class = "btn btn-primary">
			</form>		
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