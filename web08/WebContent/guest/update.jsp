<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.*, java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<%

String param1=request.getParameter("name");
String param2=request.getParameter("pay");

String name=param1;
int pay=Integer.parseInt(param2);

int sabun=Integer.parseInt(request.getParameter("sabun"));

String driver=application.getInitParameter("driver");
String url=application.getInitParameter("url");
String user=application.getInitParameter("user");
String password=application.getInitParameter("password");

HashMap map=new HashMap();

String sql="update guest set name='"+name+"',pay='"+pay+"' where sabun="+sabun;
Connection conn=null;
Statement stmt=null;
ResultSet rs=null;

try{
	Class.forName(driver);
	conn=DriverManager.getConnection(url,user,password);
	stmt=conn.createStatement();
	int cnt=stmt.executeUpdate(sql);
	if(cnt>0){
		response.sendRedirect("detail.jsp");
	}else{
		response.sendRedirect("detail.jsp?sabun="+sabun);
	}
}catch(Exception e){
	e.printStackTrace();
}finally{
	if(stmt!=null){stmt.close();}
	if(conn!=null){conn.close();}
}

%>
<body>

</body>
</html>