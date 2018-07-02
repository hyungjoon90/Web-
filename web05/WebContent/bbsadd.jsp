<%@page import="java.sql.*"%>
<%@page import="com.day05.util.MyOracle"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
	int sabun=Integer.parseInt(request.getParameter("sabun"));
	
	String sub=request.getParameter("sub");
	sub=sub.replace("<", "&lt;");
	sub=sub.replace(">", "&gt;");
	
	String content=request.getParameter("content");
	//content=content.replace("<", "&lt;");
	//content=content.replace(">", "&gt;");
	//content=content.replace("\r\n", "\n");
	//content=content.replace("\n", "<br>");
	//content=content.replace(" ", "&nbsp");

	
	String sql= "insert into bbs(num,sub,content,sabun) values(bbs_seq.nextval,'"
																+sub+"','"+content+"',"+sabun+")";
	
		Connection conn=MyOracle.getConnection();
		Statement stmt=null;
	try{
		stmt =conn.createStatement();
		int cnt = stmt.executeUpdate(sql);
	
		if(cnt>0){
			response.sendRedirect("bbs/list.jsp");
		}else{
			response.sendRedirect("bbs/add.jsp");
		}
		
	}catch(Exception e){
		
	}finally{
		if(stmt!=null){stmt.close();}
		if(conn!=null){conn.close();}
	}
	%>
</body>
</html>