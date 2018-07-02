<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
	String id=session.getId();
	session.setAttribute("msg", "xyz1234");
	
	%>
	<h1>세션객체(ex08)</h1>
	<p>id:<%=id %></p>
	<p>time:<%=session.getCreationTime() %></p>
	<p>time:<%=session.getAttribute("msg")%></p>
</body>
</html>