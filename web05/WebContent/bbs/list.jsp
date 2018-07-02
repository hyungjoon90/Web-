<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.day05.util.MyOracle, java.sql.*" errorPage="../err.jsp"%>
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
				<a href="/web05/user/list.jsp">사원등록</a>||
				<a href="/web05/bbs/list.jsp">게 시 판</a>||
				<%
				Boolean login=(Boolean)session.getAttribute("result");
				if(login==null || login==false){
				%>
				<a href="/web05/login/form.jsp">로 그 인</a>|
				<%}else{ %>
				<a href="/web05/login/form.jsp">로 그 아 웃</a>|
				<%} %>
			</td>
		</tr>
		<tr>
			<td align="center">
				<h1>사내 게시판</h1>
				<table border="1" cellspacing="0" width="80%" align="center">
					<tr>
						<th width="80">글번호</th>
						<th>제목</th>
						<th width="100">날짜</th>
						<th width="100">글쓴이</th>
					</tr>
					<%
					String sql="SELECT NUM,SUB,NALJA,NAME FROM BBS NATURAL JOIN BBS_USER ORDER BY NUM DESC";
					Connection conn=MyOracle.getConnection();
					
					try{
						Statement stmt=conn.createStatement();
						ResultSet rs= stmt.executeQuery(sql);
					while(rs.next()){
					%>
					<tr align="center">
						<td><%=rs.getInt(1) %></td>
						<td><a href="detail.jsp?idx=<%=rs.getInt(1) %>"><%=rs.getString(2) %></td>
						<td><%=rs.getDate(3) %></td>
						<td><%=rs.getString(4) %></td>
					</tr>
					<%
					}
					}catch(Exception e){
						
					}finally{
						conn.close();
					}
					%>
				</table>
				<a href="add.jsp" >입력</a>
			<br><br><br>
			</td>
		</tr>
		<tr>
			<td bgcolor="#cccccc">
			Copyright (c) 비트캠프 All rights reserved.
			</td>
		</tr>
	</table>
</body>
</html>