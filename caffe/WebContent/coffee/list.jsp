<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>index.jsp</title>
</head>
<body>
	<table  width="100%">
		<tr>
			<td colspan="5" align="center">
			<a href="../"><img width="20%" alt="�ΰ�" src="/caffe/imgs/logo.png" border="0"></a>
			</td>
		</tr>
		<tr>
			<td></td>
			<td align="center"><font size="5"><a href="hello.jsp">�λ縻</a></font></td>
			<td align="center"><font size="5"><a href="list.jsp">���</a></font></td>
			<td align="center"><font size="5"><a href="order.jsp">��ǰ�ֹ�</a></font></td>
			<td></td>
		</tr>
		<tr>
			<td colspan="5" align="center">
			<!-- ������� �� -->
				<table width="80%" border="1" cellspacing="0">
					<tr align="center">
						<th>�����</th>
						<th>Ŀ��</th>
						<th>����</th>
					</tr>
					<%
					String driver ="oracle.jdbc.driver.OracleDriver";
					String url="jdbc:oracle:thin:@localhost:1521:xe";
					String id="scott";
					String pw="tiger";
					
					String sql="SELECT * FROM COFFEE";
					Connection conn=null;
					Statement stmt =null;
					ResultSet rs=null;
					
					Class.forName(driver);
					try{
						conn=DriverManager.getConnection(url,id,pw);
						System.out.println("1��");
						stmt=conn.createStatement();
						System.out.println("2��");
						rs=stmt.executeQuery(sql);
						System.out.println("3��");
					
					while(rs.next()){
					%>
					<tr align="center">
						<td><%=rs.getString(1)%></td>
						<td><%=rs.getInt(2)%></td>
						<td><%=rs.getInt(3)%></td>
					</tr>
					<%
						} 
					}catch(Exception e){
						System.out.println("����");
					}finally{
						if(rs!=null){rs.close();}
						if(stmt!=null){stmt.close();}
						if(conn!=null){conn.close();}
					}
					%>
					
				</table>
			<!-- ���볡���� �� -->
			</td>
		</tr>
		<tr>
			<td colspan="5" align="center"> 
			<font size="4">HY Coffee�� �׻� �ְ��� Ŀ�Ǹ� ����ϴ�. �ְ��� ��� ������ �����ϰڽ��ϴ�.</font>
			</td>
		</tr>
	</table>
</body>
</html>