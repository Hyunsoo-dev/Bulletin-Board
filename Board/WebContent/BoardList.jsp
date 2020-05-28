<%@page import="model.BoardBean"%>
<%@page import="java.util.Vector"%>
<%@page import="model.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>전체 게시글 보기</title>
</head>
<body>

	<%
		//전체 게시글의 내용을 jsp 쪽으로 가져와야함.
		BoardDAO bdao = new BoardDAO();
	
		//전체 게시글을 리턴 받아주는 소스 
		Vector<BoardBean> vec = bdao.getAllBoard();
	%>
	
	<table width = "700" border = "1">
		<tr height = "40">
			<td width = "50"> 번호 </td>
			<td width = "320"> 제목 </td>
			<td width = "100"> 작성자 </td>
			<td width = "150"> 작성일 </td>
			<td width = "80"> 조회수 </td>
		</tr>
		
	<% 
		for(int i = 0; i< vec.size(); i++){
		 	BoardBean bean = vec.get(i);
		
	%>
		<tr>	
			<td width = "50"> <%= i + 1 %> </td>
			<td width = "320" align = "left"><a href="BoardInfo.jsp?num=<%= bean.getNum() %>" style = "text-decoration : none">
			
			<%
				for(int j = 0; j < (bean.getRe_step()-1)*5; j++){
			%>	
				&nbsp;
			<% 
				}
			%>
			<%= bean.getSubject() %></a></td>
			<td width = "100"> <%= bean.getWriter() %> </td>
			<td width = "150"> <%= bean.getReg_date() %> </td>
			<td width = "80"> <%= bean.getReadcount() %> </td>
		</tr>	
	<%
		}
	%>
		<tr height = "40">
			<td colspan = "5">
				<input type ="button" value = "글쓰기" onclick = "location.href = 'BoardWriteForm.jsp'">
			</td>
		</tr>
		
	</table>
	
	
</body>
</html>