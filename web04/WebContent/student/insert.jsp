<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.sql.*"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
	String param1=request.getParameter("num").trim();
	String param2=request.getParameter("name").trim();
	
	int num=Integer.parseInt(param1);
	String name=param2;
	
	for(int i=0; i<param1.length(); i++){
		char temp = param1.charAt(i);
		if(!Character.isDigit(temp)){
			response.sendRedirect("add.jsp");
			return;
		}
	}
	
	if(name.length()<2|| name.length()>12){
		response.sendRedirect("add.jsp");
		return;
	}
	
	
	String sql ="insert into student (num,name) values("+num+",'"+name+"')";
	//System.out.println(sql);
	
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
			response.sendRedirect("add.jsp");
		}
		
	}catch(Exception e){
		System.out.println("�л���� ����");
		response.sendRedirect("add.jsp");
	}finally{
		if(stmt!=null){stmt.close();}
		if(conn!=null){conn.close();}
	}
	
	%>
</body>
</html>