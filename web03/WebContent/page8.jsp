<%@page import="org.apache.catalina.connector.Request"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
	String empno=request.getParameter("empno");
	String sal=request.getParameter("sal");
	String comm=request.getParameter("comm");
	String sql="update emp set sal="+sal+",comm="+comm+" where empno="+empno;
	
	System.out.println(sql);
	
	Class.forName("oracle.jdbc.driver.OracleDriver");
	String url="jdbc:oracle:thin:@203.236.209.214:1521:xe";
	String id="scott";
	String pw="tiger";
	
	Connection conn=null;
	Statement stmt=null;
	
	conn=DriverManager.getConnection(url,id,pw);
	stmt=conn.createStatement();
	stmt.executeQuery(sql);
	
	conn.close();
	
	response.sendRedirect("page4.jsp?empno="+empno);
	%>
</body>
</html>