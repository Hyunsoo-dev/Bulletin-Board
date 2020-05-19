<%@page import="bbs.BbsDAO"%>
<%@page import="bbs.BbsDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<meta name = "viewport" content ="width=device-width" , initial-scale="1">
<link rel = "stylesheet" href = "css/bootstrap.css">
<title>JSP 게시판 만들기</title>
</head>
<body>

	
	<% 
		int bbsID = Integer.parseInt(request.getParameter("bbsID"));
		BbsDTO bbsDTO = new BbsDAO().getBbs(bbsID);
	%>

    <% 
		String userID = null;
		if(session.getAttribute("userID") != null){
		userID = (String)session.getAttribute("userID");
		}
	%>
	

	<script src = "https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src = "js/bootstrap.js"></script>
	
	<div class = "container">
		<div class = "row">
			
				<table class = "table table-striped" style = "text-align: center; border : 1px solid #dddddd">
					<thead>
						<tr>
							<th colspan = "3" style = "background-color: #eeeeee; text-align: center;">게시판 글 보기</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>제목</td>
							<td colspan = "2"><%= bbsDTO.getBbsTitle() %></td>
						</tr>
						<tr>
							<td>작성자</td>
							<td colspan = "2"><%= bbsDTO.getUserID() %></td>
						</tr>
						<tr>
							<td>작성일자</td>
							<td colspan = "2"><%= bbsDTO.getBbsDate() %></td>
						</tr>
						<tr>
							<td>내용</td>
							<td colspan = "2" style= "height:200px; text-align:left; "> <%= bbsDTO.getBbsContent().replaceAll(" ", "&nbsp").replaceAll("<", "&lt").replaceAll(">", "%gt") %></td>
						</tr>
					</tbody>
				</table>
				<input type = "button" name = "bbsButton" onclick = "location.href='bbs.jsp'" value = "목록보기" class = "btn btn-primary">
			
			
			
			
			<% 
				if(userID != null & userID.equals(bbsDTO.getUserID())){
			%>	
				<a href = "update.jsp?bbsID=<%= bbsID  %>" class = "btn btn-primary"> 수정</a>
				<a href = "delete.jsp?bbsID=<%= bbsID  %>" class = "btn btn-primary"> 삭제</a>
			<% 
				}	
			%>	
				
		</div>
	</div>
</body>
</html>