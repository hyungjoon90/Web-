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
				<img alt="로고" src="imgs/logo.png">
			</td>
		</tr>
		
		<tr>
			<td width="150" height="600" bgcolor="#9999ff">
				<p><a href="page1.jsp">인사말</a></p>
				<p><a href="page2.jsp">오시는길</a></p>
				<p><a href="page3.jsp">게시판</a></p>
				<p><a href="#">방명록</a></p>
				<p><a href="#">등등</a></p>
			</td>
			<td valign="top">
				<!-- 내용들어갈부분 -->
				<h1>게시판</h1>
				
				<table width="80%" border="1" cellspacing="0">
					<tr>
						<td>사원번호</td>
						<td>사원명</td>
						<td>연봉</td>
						<td>입사일</td>
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
						System.out.println("오류났었음");
					}finally{
						if(rs!=null)rs.close();
						if(stmt!=null)stmt.close();
						if(conn!=null)conn.close();
					}
					%>
				</table>
				<a href="page5.jsp">입력</a>
				
				<!-- 내용들어갈부분 끝 -->
			</td>
		</tr>
		
		<tr>
			<td colspan="2" bgcolor="blue"> 
				비트캠프 서울시 서초구 서초동 1327-15 비트아카데미빌딩｜ 사업자등록번호 : 214-85-24928
				<br>(주)비트컴퓨터 서초지점 대표이사 : 조현정 / 문의 : 02-3486-9600 / 팩스 : 02-6007-1245
				<br>통신판매업 신고번호 : 제 서초-00098호 / 개인정보보호관리책임자 : 권도혁
				<br>Copyright (c) 비트캠프 All rights reserved. 
			</td>
		</tr>
	</table>
</body>
</html>