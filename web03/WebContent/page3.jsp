<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
			<td valign="top">
				<!-- ������κ� -->
				<h1>�Խ���</h1>
				
				<table width="80%" border="1" cellspacing="0">
					<tr>
						<td>�����ȣ</td>
						<td>�����</td>
						<td>����</td>
						<td>�Ի���</td>
					</tr>
					<%
					String url="jdbc:oracle:thin:@203.236.209.214:1521:xe";
					String id="scott";
					String pw="tiger";
					
					oracle.jdbc.driver.OracleDriver driver=null;
					driver = new oracle.jdbc.driver.OracleDriver();
					
					Connection conn=null;
					Statement stmt=null;
					ResultSet rs=null;
					try{
						conn=DriverManager.getConnection(url,id,pw);
						stmt=conn.createStatement();
						rs=stmt.executeQuery("SELECT EMPNO,ENAME,SAL,HIREDATE FROM EMP");
						while(rs.next()){
					%>
					<tr>
						<td><a href="page4.jsp?empno=<%=rs.getInt(1)%>"><%=rs.getInt(1)%></a></td>
						<td><%=rs.getString(2)%></td>
						<td><%=rs.getInt(3)%></td>
						<td><%=rs.getDate(4)%></td>
					</tr>
					<% 
						}
					}catch(Exception e){
						System.out.println("����������");
					}finally{
						if(rs!=null)rs.close();
						if(stmt!=null)stmt.close();
						if(conn!=null)conn.close();
					}
					%>
				</table>
				<a href="page5.jsp">�Է�</a>
				
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