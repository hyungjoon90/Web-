<%@page import="oracle.jdbc.driver.OracleDriver"%>
<%@page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<table width="800" align="center">
		<tr>
			<td colspan="2">
				<a href="main.jsp">
				<img alt="�ΰ�" src="imgs/logo.png">
			</td>
		</tr>
		
		<tr>
			<td width="150" height="600" bgcolor="#9999ff">
				<p><a href="page1.jsp">�λ縻</a></p>
				<p><a href="page2.jsp">���ô±�</a></p>
				<p><a href="page3.jsp">�Խ���</a></p>
				<p><a href="#">����</a></p>
				<p><a href="#">���</a></p>
			</td>
			<td vlign="top">
				<!-- ������κ� -->
				<%
				String param=request.getParameter("empno");
				String sql="select * from emp where empno="+param;
				
				String url="jdbc:oracle:thin:@203.236.209.214:1521:xe";
				String id="scott";
				String pw="tiger";
				
				Connection conn=null;
				Statement stmt=null;
				ResultSet rs=null;
				new OracleDriver();
				try{
					conn=DriverManager.getConnection(url,id,pw);
					stmt=conn.createStatement();
					rs=stmt.executeQuery(sql);
				
				if(rs.next()){
				%>
				<h1>�󼼺���</h1>
				<table>
					<tr>
						<td width="150" bgcolor="#cccccc">���</td>
						<td><%=rs.getInt(1) %></td>
					</tr>
					<tr>
						<td width="150" bgcolor="#cccccc">�̸�</td>
						<td><%=rs.getString(2) %></td>
					</tr>
					<tr>
						<td width="150" bgcolor="#cccccc">��å</td>
						<td><%=rs.getString(3) %></td>
					</tr>
					<tr>
						<td width="150" bgcolor="#cccccc">���ӻ��</td>
						<td><%=rs.getInt(4) %></td>
					</tr>
					<tr>
						<td width="150" bgcolor="#cccccc">�Ի���</td>
						<td><%=rs.getDate(5) %></td>
					</tr>
					<tr>
						<td width="150" bgcolor="#cccccc">����</td>
						<td><%=rs.getInt(6) %></td>
					</tr>
					<tr>
						<td width="150" bgcolor="#cccccc">������</td>
						<td><%=rs.getInt(7) %></td>
					</tr>
					<tr>
						<td width="150" bgcolor="#cccccc">�μ���ȣ</td>
						<td><%=rs.getInt(8) %></td>
					</tr>
					
				</table>
				<a href="page7.jsp?empno=<%=rs.getInt(1)%>">����</a>
				<%
				}
				}catch(Exception e){
					System.out.println("���������~");
				}finally{
						if(rs!=null){rs.close();}
						if(stmt!=null){stmt.close();}
						if(conn!=null){conn.close();}
				}
				%>
				
				<!-- ������κ� �� -->
			</td>
		</tr>
		
		<tr>
			<td colspan="2" bgcolor="blue"> 
				��Ʈķ�� ����� ���ʱ� ���ʵ� 1327-15 ��Ʈ��ī���̺����� ����ڵ�Ϲ�ȣ : 214-85-24928
				<br>(��)��Ʈ��ǻ�� �������� ��ǥ�̻� : ������ / ���� : 02-3486-9600 / �ѽ� : 02-6007-1245
				<br>����Ǹž� �Ű��ȣ : �� ����-00098ȣ / ����������ȣ����å���� : �ǵ���
				<br>Copyright (c) ��Ʈķ�� All rights reserved. 
			</td>
		</tr>
	</table>
</body>
</html>