<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" errorPage="err.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
	application.setAttribute("msg", "abcd1234");
	session.setAttribute("msg2", "xyz9876");
	request.setAttribute("msg3", "req1234");
	pageContext.setAttribute("msg4", "page1234");
	int a=3/0;
	%>
	<h1><%=pageContext.getAttribute("msg4") %></h1>
	<a href ="ex06.jsp">next</a>
</body>
</html>