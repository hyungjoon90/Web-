<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
	/* 
		http1.0 get pset
		get
			장점 : 빠르다
			단점 : 주소 노출, 제약이 많음(길이,특수문자), 인코딩 문제(한글처리가 쉽지않음.)
				
		post
			장점 : 노출x, 제약없음
			단점 : get보다 느리다
	*/
	%>
	<h1>폼페이지</h1>
	<form action="ex02.jsp" method="post">
		id : <input type ="text" name="id"><br>
		pw : <input type ="password" name="pw"><br>
		<input type="submit" value="전달">
	</form>
</body>
</html>