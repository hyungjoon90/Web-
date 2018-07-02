<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%//디렉티브 -클래스밖 %>
<%@ 
page import ="java.util.Date"
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<%! //선언부 - 클래스 안, 메서드 밖
	public int func01(int a,int b){
	return a*b;
}
%>

<body>
	<%
	Date date =new Date();
	out.println(date);
	%>
	<h1>구구단을 표에 넣어 출력하세요</h1>
	<table border="1" cellspacing="0">
	<%
	for(int i=2; i<10; i++){%>
		<tr align="center">
		
			<% //스크립트릿 - 메서드 내부
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