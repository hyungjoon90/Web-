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
				<h1>�����������α׷�(ver 0.6.0)</h1>
			</td>
		</tr>
		<tr bgcolor="#cccccc">
			<td> </td>
			<td bgcolor="gray" align="center" width="120"><a href="../">
								<font color="#ffffff">HOME</font></a></td>
			<td bgcolor="gray" align="center" width="120"><a href="./list.jsp">
								<font color="#ffffff">��ü����</font></a></td>
			<td bgcolor="gray" align="center" width="120"><a href="./add.jsp">
								<font color="#ffffff">�л����</font></a></td>
			<td bgcolor="gray" align="center" width="120"><a href="./edit.jsp">
								<font color="#ffffff">�����Է�</font></a></td>
			<td> </td>
		</tr>
		<tr>
			<td colspan="6" valign="top" align="center">
				<!--���� start-->
				<h1>���� �Է� ������</h1>
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
		            <td>�й�</td>
		            <td><%=request.getParameter("num") %></td>
		         </tr>
		         <tr>
		            <td>�̸�</td>
		            <td><%=rs.getString(1) %></td>
		         </tr>
		         <tr>
		            <td>����</td>
		            <td><input type="text" name="kor" value="<%=rs.getInt(2)%>">
		            <%
		            String errIdx=request.getParameter("err");
		            String errMsg=request.getParameter("errmsg");
		            if("0".equals(errIdx)){
		            	if("1".equals(errMsg)){
		            	out.println("<font color ='red'>0~100������ ���� �����մϴ�.<font>");
		            	}else if ("2".equals(errMsg)){
		            		out.println("<font color ='red'>���� ������ϴ�.<font>");
		            	}else if ("3".equals(errMsg)){
		            		out.println("<font color ='red'>���ڸ� �Է��ϼ���.<font>");
		            	}
		            }
		            %>
		            </td>
		         </tr>
		         <tr>
		            <td>����</td>
		            <td><input type="text" name="eng" value="<%=rs.getInt(3)%>">
		            
		            <%
		            if("1".equals(errIdx)){
		            	if("1".equals(errMsg)){
		            	out.println("<font color ='red'>0~100������ ���� �����մϴ�.<font>");
		            	}else if ("2".equals(errMsg)){
		            		out.println("<font color ='red'>���� ������ϴ�.<font>");
		            	}else if ("3".equals(errMsg)){
		            		out.println("<font color ='red'>���ڸ� �Է��ϼ���.<font>");
		            	}
		            }
		            %>
		            </td>
		         </tr>
		         <tr>
		            <td>����</td>
		            <td><input type="text" name="math" value="<%=rs.getInt(4)%>">
		            <%
		            if("2".equals(errIdx)){
		            	if("1".equals(errMsg)){
		            	out.println("<font color ='red'>0~100������ ���� �����մϴ�.<font>");
		            	}else if ("2".equals(errMsg)){
		            		out.println("<font color ='red'>���� ������ϴ�.<font>");
		            	}else if ("3".equals(errMsg)){
		            		out.println("<font color ='red'>���ڸ� �Է��ϼ���.<font>");
		            	}
		            }
		            %>
		            </td>
		         </tr>
		         <tr>
		            <td colspan="2">
		            <input type="hidden" name="num" value="<%=rs.getInt(5)%>">
		            <input type="submit" value="�Է�">
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
				<!--���� end-->
			</td>
		</tr>
		<tr bgcolor="#cccccc">
			<td colspan="6">
				�Խù� ���뿡 ���� ���䷻Ʈ�� �������� ������, �̿� ���� �Ǵ��� å���� �̿��� ���ο��� �ֽ��ϴ�.
				���䷻Ʈ������ utorrent���α׷��� ���� �ڷḦ �ޱ� ���Ͽ� �߰迪�� �� �䷻Ʈ������ �������Ҹ� �ϸ�
				�ش� �ڷῡ ���� �������� ������ ������ �������� ������ utorrent���α׷��� ���ؼ� �����ϰ� �ǹǷ� ���䷻Ʈ�ʹ� ���谡 ������ ����մϴ�
			</td>
		</tr>
	</table>
	
	
</body>
</html>