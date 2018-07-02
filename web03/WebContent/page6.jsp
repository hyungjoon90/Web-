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
			<td>
				<!-- 내용들어갈부분 -->
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
							//out.println("<h1>입력완료</h1>");
							response.sendRedirect("page3.jsp");
						}else{
							out.println("<h1>입력실패</h1>");
						}
					}catch(ClassNotFoundException e){
						System.out.println("드라이버 jar파일 확인요망");
					}catch(SQLException e){
						System.out.println("접속 실패(url,id,pw)확인요망");
						out.println("<h1>잠시후 재시도 바랍니다.</h1>");
					}finally{
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