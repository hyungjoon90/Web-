<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<%!
	public void func01(){

	}
%>
<body>
	<% //스크립트릿의 내장객체 - out,request,
	String addr = request.getRemoteAddr();
	out.print(addr);
	out.print("<br>");
	String addr2 = request.getLocalAddr();
	out.print(addr2);
	out.print("<br>");
	String prot=request.getProtocol();
	out.print(prot);
	out.print("<br>");
	int port=request.getRemotePort();
	out.print(port);
	out.print("<br>");
	int port2 =request.getLocalPort();
	out.print(port2);
	out.print("<br>");
	String uri =request.getRequestURI();
	out.print(uri);
	out.print("<br>");
	StringBuffer url =request.getRequestURL();
	out.print(url);
	out.print("<br>");
	String name =request.getContextPath();
	out.print(name);
	out.print("<br>");
	%>
</body>
</html>