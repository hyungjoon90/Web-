<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.sql.*"%>
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
			<form action="order2.jsp">
				<p>�����:
				<select name="name">
			<%
			String driver ="oracle.jdbc.driver.OracleDriver";
			String url="jdbc:oracle:thin:@localhost:1521:xe";
			String id="scott";
			String pw="tiger";
			
			String sql="SELECT NAME FROM COFFEE";
			Connection conn=null;
			Statement stmt =null;
			ResultSet rs=null;
			
			Class.forName(driver);
			
			try{
				conn=DriverManager.getConnection(url,id,pw);
		
				stmt=conn.createStatement();
	
				rs=stmt.executeQuery(sql);
				
				while(rs.next()){
			%>
					<option><%=rs.getString(1)%></option>
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
				</p>
						
				<p>Ŀ���ֹ�: <input type="text" name="coffee"></p>
					
				<p>�����ֹ�: <input type="text" name="milk"></p>
				<p>
					<input type="submit" value="�ֹ�">
					<input type="reset" value="���">
				</p>
			</form>
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