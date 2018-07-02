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
				<h1>성적 입력 페이지</h1>
				<%
				String param = request.getParameter("num");
				int num=Integer.parseInt(param);
				String sql="SELECT NAME,KOR,ENG,MATH,NUM FROM STUDENT WHERE NUM="+num;
				String driver="oracle.jdbc.driver.OracleDriver";
				String url="jdbc:oracle:thin:@203.236.209.214:1521:xe";
				String id="scott";
				String pw="tiger";
				Connection conn=null;
				Statement stmt =null;
				ResultSet rs=null;
				try{
					Class.forName(driver);
					conn=DriverManager.getConnection(url,id,pw);
					stmt=conn.createStatement();
					rs=stmt.executeQuery(sql);
					if(rs.next()){
				%>
				<form action="update.jsp">
				<table>
		         <tr>
		            <td>학번</td>
		            <td><%=request.getParameter("num") %></td>
		         </tr>
		         <tr>
		            <td>이름</td>
		            <td><%=rs.getString(1) %></td>
		         </tr>
		         <tr>
		            <td>국어</td>
		            <td><input type="text" name="kor" value="<%=rs.getInt(2)%>">
		            <%
		            String errIdx=request.getParameter("err");
		            String errMsg=request.getParameter("errmsg");
		            if("0".equals(errIdx)){
		            	if("1".equals(errMsg)){
		            	out.println("<font color ='red'>0~100까지의 값만 가능합니다.<font>");
		            	}else if ("2".equals(errMsg)){
		            		out.println("<font color ='red'>값이 비었습니다.<font>");
		            	}else if ("3".equals(errMsg)){
		            		out.println("<font color ='red'>숫자만 입력하세요.<font>");
		            	}
		            }
		            %>
		            </td>
		         </tr>
		         <tr>
		            <td>영어</td>
		            <td><input type="text" name="eng" value="<%=rs.getInt(3)%>">
		            
		            <%
		            if("1".equals(errIdx)){
		            	if("1".equals(errMsg)){
		            	out.println("<font color ='red'>0~100까지의 값만 가능합니다.<font>");
		            	}else if ("2".equals(errMsg)){
		            		out.println("<font color ='red'>값이 비었습니다.<font>");
		            	}else if ("3".equals(errMsg)){
		            		out.println("<font color ='red'>숫자만 입력하세요.<font>");
		            	}
		            }
		            %>
		            </td>
		         </tr>
		         <tr>
		            <td>수학</td>
		            <td><input type="text" name="math" value="<%=rs.getInt(4)%>">
		            <%
		            if("2".equals(errIdx)){
		            	if("1".equals(errMsg)){
		            	out.println("<font color ='red'>0~100까지의 값만 가능합니다.<font>");
		            	}else if ("2".equals(errMsg)){
		            		out.println("<font color ='red'>값이 비었습니다.<font>");
		            	}else if ("3".equals(errMsg)){
		            		out.println("<font color ='red'>숫자만 입력하세요.<font>");
		            	}
		            }
		            %>
		            </td>
		         </tr>
		         <tr>
		            <td colspan="2">
		            <input type="hidden" name="num" value="<%=rs.getInt(5)%>">
		            <input type="submit" value="입력">
		            </td>
		         </tr>
		         </table>
		         </form>
				<%
					}
				}catch(Exception e){
					
				}finally{
					if(rs!=null){rs.close();}
					if(stmt!=null){stmt.close();}
					if(conn!=null){conn.close();}
				}
				%>
				
				<br><br><br>
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