<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>	<%
	out.println("�ڹٷ� ���� ����");
	%></title>
</head>
<body>
	<!--�ּ�-->
	<!--
	������ �ּ�
	-->
	<h1>html�� �ۼ�</h1>
	<%
	//��ũ��Ʈ��
	//jsp���� �ּ�
	/*
	jsp������ �ּ�
	*/
	out.println("<h1>�ڹٷ� �ۼ�</h1>");
	for(int i=0; i<10; i++){
	%>
	<p>����</p>
	<%
	}
	%>
</body>
</html>