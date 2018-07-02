<%@page import="oracle.jdbc.driver.OracleDriver"%>
<%@page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.sql.*"%>
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
			<td vlign="top">
				<!-- 내용들어갈부분 -->
				<%
				String param=request.getParameter("empno");
				String sql="select * from emp where empno="+param;
				
				String url="jdbc:oracle:thin:@203.236.209.214:1521:xe";
				String id="scott";
				String pw="tiger";
				
				Connection conn=null;
				Statement stmt=null;
				ResultSet rs=null;
				new OracleDriver();
				try{
					conn=DriverManager.getConnection(url,id,pw);
					stmt=conn.createStatement();
					rs=stmt.executeQuery(sql);
				
				if(rs.next()){
				%>
				<h1>상세보기</h1>
				<table>
					<tr>
						<td width="150" bgcolor="#cccccc">사번</td>
						<td><%=rs.getInt(1) %></td>
					</tr>
					<tr>
						<td width="150" bgcolor="#cccccc">이름</td>
						<td><%=rs.getString(2) %></td>
					</tr>
					<tr>
						<td width="150" bgcolor="#cccccc">직책</td>
						<td><%=rs.getString(3) %></td>
					</tr>
					<tr>
						<td width="150" bgcolor="#cccccc">직속상관</td>
						<td><%=rs.getInt(4) %></td>
					</tr>
					<tr>
						<td width="150" bgcolor="#cccccc">입사일</td>
						<td><%=rs.getDate(5) %></td>
					</tr>
					<tr>
						<td width="150" bgcolor="#cccccc">연봉</td>
						<td><%=rs.getInt(6) %></td>
					</tr>
					<tr>
						<td width="150" bgcolor="#cccccc">성과급</td>
						<td><%=rs.getInt(7) %></td>
					</tr>
					<tr>
						<td width="150" bgcolor="#cccccc">부서번호</td>
						<td><%=rs.getInt(8) %></td>
					</tr>
					
				</table>
				<a href="page7.jsp?empno=<%=rs.getInt(1)%>">수정</a>
				<%
				}
				}catch(Exception e){
					System.out.println("오류났어요~");
				}finally{
						if(rs!=null){rs.close();}
						if(stmt!=null){stmt.close();}
						if(conn!=null){conn.close();}
				}
				%>
				
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