<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<%
	String url="main.jsp";
	//String name="main.jsp";
	String name=request.getParameter("name");
	
	if("list".equals(name)){
		url="list.jsp";
	}else if("add".equals(name)){
		url="add.jsp";
	}else if("detail".equals(name)){
		url="detail.jsp";
	}
	
	
%>
<body>
	<table width="1024" align="center">
		<tr>
			<td><img alt="logo" src="imgs/logo.png"> </td>
		</tr>
		<tr>
			<td><a href="index.jsp?name=list"> 리스트 </a></td>
		</tr>
		<tr>
			<td>
				<jsp:include page="<%=url%>"></jsp:include>
				<% 
				String result = (String)request.getAttribute("result");
				System.out.println(result);
				if(result!=null){response.sendRedirect(result);}
				
				%>
			</td>
		</tr>
		<tr>
			<td>hy</td>
		</tr>
	</table>
</body>
</html>