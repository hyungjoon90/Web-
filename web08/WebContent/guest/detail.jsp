<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.sql.*,java.util.HashMap"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<%
	int sabun=Integer.parseInt(request.getParameter("sabun"));
	String sql="select * from guest where sabun="+sabun;
	String driver=application.getInitParameter("driver");
	String url=application.getInitParameter("url");
	String user=application.getInitParameter("user");
	String password=application.getInitParameter("password");
	
	HashMap map=new HashMap();
	
	Connection conn=null;
	Statement stmt=null;
	ResultSet rs=null;
	
	try{
		Class.forName(driver);
		conn=DriverManager.getConnection(url,user,password);
		stmt=conn.createStatement();
		rs=stmt.executeQuery(sql);
		if(rs.next()){
			map.put("sabun", rs.getInt("sabun"));
			map.put("name", rs.getString("name"));
			map.put("nalja", rs.getDate("nalja"));
			map.put("pay", rs.getInt("pay"));
		}
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		if(rs!=null){rs.close();}
		if(stmt!=null){stmt.close();}
		if(conn!=null){conn.close();}
	}
%>
<body>
	<table>
		<tr>
			<td><img alt="logo" src="<%=application.getContextPath()%>/imgs/logo.png"></td>
		</tr>
		<tr>
			<td>
				<a href="<%=application.getContextPath()%>">HOME</a>
				<a href="<%=application.getContextPath()%>/guest/list.jsp">GUEST</a>
				<a href="#">LOGIN</a>
			</td>
		</tr>
		<tr>
			<td>
				<h1>상세페이지</h1>
				<form action="update.jsp">
				<table>
					<tr>
						<td width="100" bgcolor="#cccccc">사번</td>
						<td><input type="text" name="sabun" value="<%=map.get("sabun") %>" readonly="readonly"> <%=map.get("sabun") %></td>
					</tr>
					<tr>
						<td bgcolor="#cccccc">이름</td>
						<td><input type="text" name="name" value="<%=map.get("name") %>"> <%=map.get("name") %></td>
					</tr>
					<tr>
						<td bgcolor="#cccccc">날짜</td>
						<td><input type="text" name="nalja" value="<%=map.get("nalja") %>" readonly="readonly"> <%=map.get("nalja") %></td>
					</tr>
					<tr>
						<td bgcolor="#cccccc">금액</td>
						<td><input type="text" name="pay" value="<%=map.get("pay") %>"> <%=map.get("pay") %></td>
					</tr>
				</table>
					<input type="submit" value="수정">
				</form>
					<a href="delete.jsp"><input type="button" value="삭제"></a>
			</td>
		</tr>
		<tr>
			<td>
			@참고
			</td>
		</tr>
	</table>
</body>
</html>