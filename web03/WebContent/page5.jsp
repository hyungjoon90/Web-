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
			<td vlign="top">
				<!-- ������κ� -->
				<h1>�Է�������</h1>
				<form action="page6.jsp">
					<table>
						<tr>
							<td>���</td>
							<td><input type="text" name="empno"></td>
						</tr>
						<tr>
							<td>�̸�</td>
							<td><input type="text" name="ename"></td>
						</tr>
						<tr>
							<td>��å</td>
							<td>
								<%
								//sql="select distinct job from emp where job!='PRESIDENT'"
								%>
								<select name="job">
									<option>CLERK</option>
									<option>SALESMAN</option>
									<option>MANAGER</option>
									<option>ANALYST</option>
								</select>
							</td>
						</tr>
						<tr>
							<td>���ӻ��</td>
							<td>
							<input type="text" name="mgr" value="7839" readonly="readonly">
							</td>
						</tr>
						<tr>
							<td>����</td>
							<td><input type="text" name="sal"></td>
						</tr>
						<tr>
							<td>�μ���ȣ</td>
							<td>
							<%
							//sql ="select deptno from dept"
							%>
								<select name="deptno">
									<option value="10">ACCOUNTING</option>
									<option value="20">RESEARCH</option>
									<option value="30">SALES</option>
									<option value="40">OPERATIONS</option>
									
								</select>
							</td>
						</tr>
						<tr>
							<td colspan="2">
							<input type="submit" value="�Է�">
							<input type="reset" value="���">
							</td>
						</tr>
						
					</table>
				
				</form>
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