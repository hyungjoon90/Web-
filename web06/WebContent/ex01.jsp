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
	//주소?msg=abcd1234
	String msg=request.getParameter("msg");
	out.println("<h1>"+msg+"</h1>");
	
	JspWriter myOut=pageContext.getOut();
	ServletRequest req=pageContext.getRequest();
	String msg2=req.getParameter("msg");
	myOut.println("<h1>"+msg2+"</h1>");
	
	String path=application.getContextPath();
	out.println("<h1>"+path+"</h1>");
	
	String msg3=application.getInitParameter("msg");
	%>
	<h1><%=msg3 %></h1>
</body>
</html>