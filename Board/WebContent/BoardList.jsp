<%@page import="model.BoardBean"%>
<%@page import="java.util.Vector"%>
<%@page import="model.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>��ü �Խñ� ����</title>
</head>
<body>

	<%
		//��ü �Խñ��� ������ jsp ������ �����;���.
		BoardDAO bdao = new BoardDAO();
	
		//��ü �Խñ��� ���� �޾��ִ� �ҽ� 
		Vector<BoardBean> vec = bdao.getAllBoard();
	%>
	
	<table width = "700" border = "1">
		<tr height = "40">
			<td width = "50"> ��ȣ </td>
			<td width = "320"> ���� </td>
			<td width = "100"> �ۼ��� </td>
			<td width = "150"> �ۼ��� </td>
			<td width = "80"> ��ȸ�� </td>
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
				<input type ="button" value = "�۾���" onclick = "location.href = 'BoardWriteForm.jsp'">
			</td>
		</tr>
		
	</table>
	
	
</body>
</html>