<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<table width="1180" align="center">
		<tr>
			<td align="center">
			<img alt="logo" src="/web05/imgs/logo.png">
			</td>
		</tr>
		<tr>
			<td bgcolor="#cccccc" align="center">
			|	<a href="/web05/index.jsp">H O M E</a>||
				<a href="/web05/user/list.jsp">������</a>||
				<a href="/web05/bbs/list.jsp">�� �� ��</a>||
				<%
				Boolean login=(Boolean)session.getAttribute("result");
				if(login==null || login==false){
				%>
				<a href="/web05/login/form.jsp">�� �� ��</a>|
				<%}else{ %>
				<a href="/web05/login/form.jsp">�� �� �� ��</a>|
				<%} %>
			</td>
		</tr>
		<tr>
			<td align="center">
				<h1>������</h1>
				<form action="/web05/useradd.jsp">
					<p>��� <input type="text" name="sabun"></p>
					<p>�̸� <input type="text" name="name"></p>
					<input type="submit" value="���">
					<input type="reset" value="���">
				</form>
				
			<br><br><br>
			</td>
		</tr>
		<tr>
			<td bgcolor="#cccccc">
			Copyright (c) ��Ʈķ�� All rights reserved.
			</td>
		</tr>
	</table>
</body>
</html>