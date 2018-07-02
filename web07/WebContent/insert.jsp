<%@page import="java.util.ArrayList"%>
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
	String sub=request.getParameter("sub");
	String content=request.getParameter("content");
	
	String[] row={sub,content};
	
	ArrayList<String[]> list=(ArrayList<String[]>)application.getAttribute("list");
	if(list==null){list=new ArrayList<String[]>();}
	list.add(row);
	
	application.setAttribute("list", list);
	
	response.sendRedirect(application.getContextPath());
	%>
</body>
</html>