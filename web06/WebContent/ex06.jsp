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
		String msg=(String)application.getAttribute("msg");
		String msg2=(String)session.getAttribute("msg2");
		String msg3=(String)request.getAttribute("msg3");
		String msg4=(String)pageContext.getAttribute("msg4");
	%>
	<h1><%=msg %></h1>
	<h1><%=msg2 %></h1>
	<h1><%=msg3 %></h1>
	<h1><%=msg4 %></h1>
</body>
</html>