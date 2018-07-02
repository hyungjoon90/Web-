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
				<h1>성적관리프로그램(ver 0.6.0)</h1>
			</td>
		</tr>
		<tr bgcolor="#cccccc">
			<td> </td>
			<td bgcolor="gray" align="center" width="120"><a href="../">
								<font color="#ffffff">HOME</font></a></td>
			<td bgcolor="gray" align="center" width="120"><a href="./list.jsp">
								<font color="#ffffff">전체보기</font></a></td>
			<td bgcolor="gray" align="center" width="120"><a href="./add.jsp">
								<font color="#ffffff">학생등록</font></a></td>
			<td bgcolor="gray" align="center" width="120"><a href="./edit.jsp">
								<font color="#ffffff">성적입력</font></a></td>
			<td> </td>
		</tr>
		<tr>
			<td colspan="6" valign="top" align="center">
				<!--내용 start-->
				<h1>학생성적 목록</h1>
				<table width="80%" border="1" cellspacing="0">
					<tr>
						<th width="50">학번</th>
						<th>이름</th>
						<th>국어</th>
						<th>영어</th>
						<th>수학</th>
						<th width="80">삭제</th>
					</tr>
					<%
					String url="jdbc:oracle:thin:@203.236.209.214:1521:xe";
					String id="scott";
					String pw="tiger";
					
					Class.forName("oracle.jdbc.driver.OracleDriver");
					Connection conn=null;
					Statement stmt=null;
					ResultSet rs=null;
					String sql="SELECT NUM,NAME,KOR,ENG,MATH FROM STUDENT ORDER BY NUM";
					try{
						conn=DriverManager.getConnection(url,id,pw);
						stmt=conn.createStatement();
						rs=stmt.executeQuery(sql);
					
					while(rs.next()){	
					%>
					<tr align="center">
						<td><%=rs.getInt(1)%></td>
						<td><%=rs.getString(2)%></td>
						<td><%=rs.getInt(3)%></td>
						<td><%=rs.getInt(4)%></td>
						<td><%=rs.getInt(5)%></td>
						<td>
							<form action="delete.jsp" method="post">
								<input type="hidden" name="num" value="<%=rs.getInt(1)%>">
								<input type="submit" value ="삭제">
							</form>
						</td>
					</tr>
					<%
						}
					}catch(Exception e){
						System.out.println("list page 오류 - 확인바람");
					}finally{
						if(rs!=null){rs.close();}
						if(stmt!=null){stmt.close();}
						if(conn!=null){conn.close();}
					}
					%>
				</table>
				
				
				<!--내용 end-->
			</td>
		</tr>
		<tr bgcolor="#cccccc">
			<td colspan="6">
				게시물 내용에 대해 이토렌트는 보증하지 않으며, 이에 대한 판단의 책임은 이용자 본인에게 있습니다.
				이토렌트에서는 utorrent프로그램을 통해 자료를 받기 위하여 중계역할 및 토렌트파일을 배포역할만 하며
				해당 자료에 대한 실질적인 파일은 서버에 보관하지 않으며 utorrent프로그램을 통해서 배포하게 되므로 이토렌트와는 관계가 없음을 명시합니다
			</td>
		</tr>
	</table>
	
	
</body>
</html>