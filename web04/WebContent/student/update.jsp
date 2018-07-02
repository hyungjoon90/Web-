<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<%!
	public boolean validate(String msg){ //숫자로만 false, 문자 true
		for(int i=0;i<msg.length();i++){
			char temp=msg.charAt(i);
			if(!Character.isDigit(temp)){
				return true;
			}
		}
	return false;
	}
%>
<body>
	<%
	String param1=request.getParameter("num");
	//String param2=request.getParameter("kor").trim();
	//String param3=request.getParameter("eng").trim();
	//String param4=request.getParameter("math").trim();
	String[] params=new String[3];
	params[0]=request.getParameter("kor").trim();
	params[1]=request.getParameter("eng").trim();
	params[2]=request.getParameter("math").trim();
	
	for(int i=0; i<params.length; i++){
		if(params[i].length()==0){
			response.sendRedirect("edit2.jsp?num="+param1+"&err="+i+"&errmsg=2");
			return;
		}else if(validate(params[i])){
				response.sendRedirect("edit2.jsp?num="+param1+"&err="+i+"&errmsg=3");
				return;
		}else if(Integer.parseInt(params[i])>100){
			response.sendRedirect("edit2.jsp?num="+param1+"&err="+i+"&errmsg=1");
			return;
		}
	}
	
	int num = Integer.parseInt(param1);
	int kor = Integer.parseInt(params[0]);
	int eng = Integer.parseInt(params[1]);
	int math = Integer.parseInt(params[2]);
	
	String sql="UPDATE STUDENT SET KOR="+kor+",ENG="+eng+",MATH="+math+" WHERE NUM="+num;
	
	String driver="oracle.jdbc.driver.OracleDriver";
	String url="jdbc:oracle:thin:@203.236.209.214:1521:xe";
	String id="scott";
	String pw="tiger";
	Connection conn=null;
	Statement stmt =null;
	
	try{
		Class.forName(driver);
		conn=DriverManager.getConnection(url,id,pw);
		stmt=conn.createStatement();
		int cnt = stmt.executeUpdate(sql);
		if(cnt>0){
			response.sendRedirect("edit.jsp");
		}else{
			response.sendRedirect("edit.jsp?num="+num);
		}
		
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		if(stmt!=null){stmt.close();}
		if(conn!=null){conn.close();}
	}
	
	
	%>
</body>
</html>