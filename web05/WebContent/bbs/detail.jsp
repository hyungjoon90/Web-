<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.day05.util.MyOracle,java.sql.*"%>
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
			<img alt="logo" src="imgs/logo.png">
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
				<%
			
				
				int num=Integer.parseInt(request.getParameter("idx"));
				
				String name="";
				String sub="제목없음";
				String content="";
				Date nalja=null;
				
				
				String sql="SELECT NUM,SUB,(SELECT NAME FROM BBS_USER B WHERE B.SABUN=A.SABUN) AS NAME,NALJA,CONTENT FROM BBS A where num="+num;
				
				Connection conn=MyOracle.getConnection();
				Statement stmt=null;
				ResultSet rs=null;
				try{
					stmt=conn.createStatement();
					rs=stmt.executeQuery(sql);
					if(rs.next()){
						num=rs.getInt(1);
						sub=rs.getString(2);
						name=rs.getString(3);
						nalja=rs.getDate(4);
						content=rs.getString(5);
					}
				} catch(Exception e){
					
				}finally{
					if(rs!=null){rs.close();}
					if(stmt!=null){stmt.close();}
					if(conn!=null){conn.close();}
				}
				
				content=content.replace("<", "&lt;");
				content=content.replace(">", "&gt;");
				content=content.replace("\r\n", "\n");
				content=content.replace("\n", "<br>");
				content=content.replace(" ", "&nbsp");
				%>
				<h1><%=num %>번 글 상세보기</h1>
				<table width="80%" align="center">
					<tr>
						<td bgcolor="#cccccc">제목</td>
						<td colspan="3"><%=sub %></td>
					</tr>
					<tr>
						<td bgcolor="#cccccc">글쓴이</td>
						<td><%=name %></td>
						<td bgcolor="#cccccc">날짜</td>
						<td><%=nalja %></td>
					</tr>
					<tr>
						<td colspan="4" bgcolor="#cccccc">내용</td>
					</tr>
					<tr>
						<td colspan="4"><%=content %></td>
					</tr>
				
				</table>
				
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