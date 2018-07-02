<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
			<a href="../"><img width="20%" alt="로고" src="/caffe/imgs/logo.png" border="0"></a>
			</td>
		</tr>
		<tr>
			<td></td>
			<td align="center"><font size="5"><a href="hello.jsp">인사말</a></font></td>
			<td align="center"><font size="5"><a href="list.jsp">재고량</a></font></td>
			<td align="center"><font size="5"><a href="order.jsp">물품주문</a></font></td>
			<td></td>
		</tr>
		<tr>
			<td colspan="5" align="center">
			<!-- 내용들어가는 곳 -->
				<table width="80%" border="1" cellspacing="0">
					<tr align="center">
						<th>매장명</th>
						<th>커피</th>
						<th>우유</th>
					</tr>
					<%
					String driver ="oracle.jdbc.driver.OracleDriver";
					String url="jdbc:oracle:thin:@localhost:1521:xe";
					String id="scott";
					String pw="tiger";
					
					String sql="SELECT * FROM COFFEE";
					Connection conn=null;
					Statement stmt =null;
					ResultSet rs=null;
					
					Class.forName(driver);
					try{
						conn=DriverManager.getConnection(url,id,pw);
						System.out.println("1차");
						stmt=conn.createStatement();
						System.out.println("2차");
						rs=stmt.executeQuery(sql);
						System.out.println("3차");
					
					while(rs.next()){
					%>
					<tr align="center">
						<td><%=rs.getString(1)%></td>
						<td><%=rs.getInt(2)%></td>
						<td><%=rs.getInt(3)%></td>
					</tr>
					<%
						} 
					}catch(Exception e){
						System.out.println("오류");
					}finally{
						if(rs!=null){rs.close();}
						if(stmt!=null){stmt.close();}
						if(conn!=null){conn.close();}
					}
					%>
					
				</table>
			<!-- 내용끝나는 곳 -->
			</td>
		</tr>
		<tr>
			<td colspan="5" align="center"> 
			<font size="4">HY Coffee는 항상 최고의 커피를 만듭니다. 최고의 향과 맛으로 보답하겠습니다.</font>
			</td>
		</tr>
	</table>
</body>
</html>