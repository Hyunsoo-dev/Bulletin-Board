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
<!-- 	<% 
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
					<tr>
						<td>1</td>
						<td>안녕하세요.</td>
						<td>홍길동</td>
						<td>2020-05-07</td>
					</tr>
				</tbody>
			</table>
			
			<div>
			<input type = "button" id = "writeButton" onclick = "location.href = 'write.jsp'" value = "글쓰기">
			</div>
		</div>
	</div>
</body>
</html>