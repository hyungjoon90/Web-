<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>index.jsp</title>
</head>
<body>
	<table width="100%">
		<tr>
			<td colspan="6" align="center">
				<h1>�����������α׷�(ver 0.6.0)</h1>
			</td>
		</tr>
		<tr bgcolor="#cccccc">
			<td> </td>
			<td bgcolor="gray" align="center" width="120"><a href="../">
								<font color="#ffffff">HOME</font></a></td>
			<td bgcolor="gray" align="center" width="120"><a href="./list.jsp">
								<font color="#ffffff">��ü����</font></a></td>
			<td bgcolor="gray" align="center" width="120"><a href="./add.jsp">
								<font color="#ffffff">�л����</font></a></td>
			<td bgcolor="gray" align="center" width="120"><a href="./edit.jsp">
								<font color="#ffffff">�����Է�</font></a></td>
			<td> </td>
		</tr>
		<tr>
			<td colspan="6" valign="top" align="center">
				<!--���� start-->
				<h1>���� �Է� ������</h1>
				<form action="edit2.jsp">
				�й�:
				<select name="num">
				<%
				String sql="SELECT NUM FROM STUDENT ORDER BY NUM";
				String driver="oracle.jdbc.driver.OracleDriver";
				String url="jdbc:oracle:thin:@203.236.209.214:1521:xe";
				String id="scott";
				String pw="tiger";
				
				Connection conn=null;
				Statement stmt =null;
				ResultSet rs=null;
				
				try{
					Class.forName(driver);
					conn=DriverManager.getConnection(url,id,pw);
					stmt=conn.createStatement();
					rs=stmt.executeQuery(sql);
					while(rs.next()){
					
					
				%>
					<option><%=rs.getInt(1) %></option>
				<%
					}
				}catch(Exception e){
					
				}finally{
					if(rs!=null){rs.close();}
					if(stmt!=null){stmt.close();}
					if(conn!=null){conn.close();}
				}
				
				%>
				</select>
				<input type="submit" value="����">
				
				</form>
				<br><br><br>
				<!--���� end-->
			</td>
		</tr>
		<tr bgcolor="#cccccc">
			<td colspan="6">
				�Խù� ���뿡 ���� ���䷻Ʈ�� �������� ������, �̿� ���� �Ǵ��� å���� �̿��� ���ο��� �ֽ��ϴ�.
				���䷻Ʈ������ utorrent���α׷��� ���� �ڷḦ �ޱ� ���Ͽ� �߰迪�� �� �䷻Ʈ������ �������Ҹ� �ϸ�
				�ش� �ڷῡ ���� �������� ������ ������ �������� ������ utorrent���α׷��� ���ؼ� �����ϰ� �ǹǷ� ���䷻Ʈ�ʹ� ���谡 ������ ����մϴ�
			</td>
		</tr>
	</table>
	
	
</body>
</html>