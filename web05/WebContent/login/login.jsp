<%@page import="com.day05.util.MyOracle"%>
<%@page import="java.sql.*"%>
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
				Boolean login=(Boolean)application.getAttribute("result");
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
			<%
			int sabun = Integer.parseInt(request.getParameter("sabun"));
			String name = request.getParameter("name");
			
			String sql="select count(*) from bbs_user where sabun="+sabun+" and name='"+name+"'";
			
			Connection conn=MyOracle.getConnection();
			Statement stmt=null;
			ResultSet rs=null;
			int cnt=0;
			
			try{
				stmt=conn.createStatement();
				rs =stmt.executeQuery(sql);
				
				if(rs.next()){
					cnt=rs.getInt(1);
				}
			}catch(Exception e){
				
			}finally{
				if(rs!=null){rs.close();}
				if(stmt!=null){stmt.close();}
				if(conn!=null){conn.close();}
			}
			if(cnt>0){
				session.setAttribute("result", true);
				session.setAttribute("sabun", true);
			%>	<h1>�α��� ����</h1>
			<%} else { %>	
				<h1>�α��� ����</h1>
			<%}%>
				
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