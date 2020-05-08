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
	<!-- <% 
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
	<% 
		}else {
			response.sendRedirect("Login.jsp");
		}
	%>
		 -->
	<script src = "https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src = "js/bootstrap.js"></script>
	
	<div class = "container">
		<div class = "row">
			<form method = "post" action = "writeAction.jsp" >
				<table class = "table table-striped" style = "text-align: center; border : 1px solid #dddddd">
					<thead>
						<tr>
							<th colspan = "2" style = "background-color: #eeeeee; text-align: center;">게시판 글쓰기 양식</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><input type = "text" name = "bbsTitle" placeholder = "글 제목" maxlength = "50"></td>
						</tr>
						<tr>
							<td><textarea name = "bbsContent" maxlength = "2048" placeholder = "글 내용" style=" heigth:350px;"></textarea></td>
						</tr>
					</tbody>
				</table>
				<input type = "submit" value = "글쓰기">
			</form>		
		</div>
	</div>
</body>
</html>