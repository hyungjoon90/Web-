<%@page import="com.sun.javafx.runtime.SystemProperties"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import ="java.sql.*"%>
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
			<td>
				<!-- ������κ� -->
					<%
					
					int empno=Integer.parseInt(request.getParameter("empno"));
					String ename=request.getParameter("ename");
					String job=request.getParameter("job");
					int mgr=Integer.parseInt(request.getParameter("mgr"));
					int sal=Integer.parseInt(request.getParameter("sal"));
					int deptno=Integer.parseInt(request.getParameter("deptno"));
					
					String sql="insert into emp (empno,ename,job,mgr,hiredate,sal,deptno)";
					sql+="values ("+empno+",'"+ename+"','"+job+"',"+mgr+",sysdate,"+sal+","+deptno+")";
					
					Connection conn=null;
					Statement stmt=null;
					try{
						Class.forName("oracle.jdbc.driver.OracleDriver");
						String url="jdbc:oracle:thin:@203.236.209.214:1521:xe";
						String id="scott";
						String pw="tiger";
						
						conn=DriverManager.getConnection(url,id,pw);
						stmt=conn.createStatement();
						int cnt = stmt.executeUpdate(sql);
						
						if(cnt>0){
							//out.println("<h1>�Է¿Ϸ�</h1>");
							response.sendRedirect("page3.jsp");
						}else{
							out.println("<h1>�Է½���</h1>");
						}
					}catch(ClassNotFoundException e){
						System.out.println("����̹� jar���� Ȯ�ο��");
					}catch(SQLException e){
						System.out.println("���� ����(url,id,pw)Ȯ�ο��");
						out.println("<h1>����� ��õ� �ٶ��ϴ�.</h1>");
					}finally{
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