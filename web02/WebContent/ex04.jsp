<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%//��Ƽ�� -Ŭ������ %>
<%@ 
page import ="java.util.Date"
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<%! //����� - Ŭ���� ��, �޼��� ��
	public int func01(int a,int b){
	return a*b;
}
%>

<body>
	<%
	Date date =new Date();
	out.println(date);
	%>
	<h1>�������� ǥ�� �־� ����ϼ���</h1>
	<table border="1" cellspacing="0">
	<%
	for(int i=2; i<10; i++){%>
		<tr align="center">
		
			<% //��ũ��Ʈ�� - �޼��� ����
			for(int j=2;j<10;j++){%>
			<td align="center">
				<%out.println(i+"x"+j+"="+func01(i,j));
				%>			
			</td>
			<%}%>
		</tr>
	<%}%>
	</table>
</body>
</html>