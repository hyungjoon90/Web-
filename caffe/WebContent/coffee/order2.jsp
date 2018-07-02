<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
	String param1=request.getParameter("name").trim();
	String param2=request.getParameter("coffee").trim();
	String param3=request.getParameter("milk").trim();
	
	String name=param1;
	int coffee=Integer.parseInt(param2);
	int milk=Integer.parseInt(param3);
	
	String sql ="insert into coffee values('"+name+"',"+coffee+","+milk+")";
	System.out.println(sql);
	
	String url ="jdbc:oracle:thin:@203.236.209.214:1521:xe";
	String id="scott";
	String pw="tiger";
	
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection conn=null;
	Statement stmt =null;
	
	try{
		conn=DriverManager.getConnection(url,id,pw);
		stmt=conn.createStatement();
		int cnt=stmt.executeUpdate(sql);
		
		if(cnt>0){
			response.sendRedirect("../");
		}else{
			response.sendRedirect("order.jsp");
		}
	}catch(Exception e){
		System.out.println("오류");
	}finally{
		if(stmt!=null){stmt.close();}
		if(conn!=null){conn.close();}
	}
	
	
	
	
	
	
	
	
	
	
	
	
	%>
</body>
</html>