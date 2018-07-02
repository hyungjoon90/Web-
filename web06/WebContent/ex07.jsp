<%@page import="java.util.Date"%>
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
	long time=session.getCreationTime();
	long time2=session.getLastAccessedTime();
	Date date=new Date(time);
	Date date2=new Date(time2);
	session.setAttribute("msg", "abcd1234");
	String msg2=(String)session.getAttribute("msg2");
	
	System.out.println(session.getMaxInactiveInterval());
	
	%>
	<h1>세션객체(ex07)</h1>
	<p>id:<%=id %></p>
	<p>time:<%=date %></p>
	<p>time:<%=date2 %></p>
	<p>msg2:<%=msg2 %></p>
	<a href="ex08.jsp">next</a>
</body>
</html>