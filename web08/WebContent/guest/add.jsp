<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<table>
		<tr>
			<td><img alt="logo" src="<%=application.getContextPath()%>/imgs/logo.png"></td>
		</tr>
		<tr>
			<td>
				<a href="<%=application.getContextPath()%>">HOME</a>
				<a href="<%=application.getContextPath()%>/guest/list.jsp">GUEST</a>
				<a href="#">LOGIN</a>
			</td>
		</tr>
		<tr>
			<td>
				<h1>�Է�������</h1>
				<form action="insert.jsp" method="get">
					<p>
						���:<input type="text" name="sabun">
					</p>
					<p>
						�̸�:<input type="text" name="name">
					</p>
					<p>
						�ݾ�:<input type="text" name="pay">
					</p>
					<p>
						<input type="submit" value="�Է�">
						<input type="reset" value="���">
					</p>
				</form>
			</td>
		</tr>
		<tr>
			<td>
			@����
			</td>
		</tr>
	</table>
</body>
</html>