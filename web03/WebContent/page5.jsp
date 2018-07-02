<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<table width="800" align="center">
		<tr>
			<td colspan="2">
				<a href="main.jsp">
				<img alt="로고" src="imgs/logo.png">
			</td>
		</tr>
		
		<tr>
			<td width="150" height="600" bgcolor="#9999ff">
				<p><a href="page1.jsp">인사말</a></p>
				<p><a href="page2.jsp">오시는길</a></p>
				<p><a href="page3.jsp">게시판</a></p>
				<p><a href="#">방명록</a></p>
				<p><a href="#">등등</a></p>
			</td>
			<td vlign="top">
				<!-- 내용들어갈부분 -->
				<h1>입력페이지</h1>
				<form action="page6.jsp">
					<table>
						<tr>
							<td>사번</td>
							<td><input type="text" name="empno"></td>
						</tr>
						<tr>
							<td>이름</td>
							<td><input type="text" name="ename"></td>
						</tr>
						<tr>
							<td>직책</td>
							<td>
								<%
								//sql="select distinct job from emp where job!='PRESIDENT'"
								%>
								<select name="job">
									<option>CLERK</option>
									<option>SALESMAN</option>
									<option>MANAGER</option>
									<option>ANALYST</option>
								</select>
							</td>
						</tr>
						<tr>
							<td>직속상관</td>
							<td>
							<input type="text" name="mgr" value="7839" readonly="readonly">
							</td>
						</tr>
						<tr>
							<td>연봉</td>
							<td><input type="text" name="sal"></td>
						</tr>
						<tr>
							<td>부서번호</td>
							<td>
							<%
							//sql ="select deptno from dept"
							%>
								<select name="deptno">
									<option value="10">ACCOUNTING</option>
									<option value="20">RESEARCH</option>
									<option value="30">SALES</option>
									<option value="40">OPERATIONS</option>
									
								</select>
							</td>
						</tr>
						<tr>
							<td colspan="2">
							<input type="submit" value="입력">
							<input type="reset" value="취소">
							</td>
						</tr>
						
					</table>
				
				</form>
				<!-- 내용들어갈부분 끝 -->
			</td>
		</tr>
		
		<tr>
			<td colspan="2" bgcolor="blue"> 
				비트캠프 서울시 서초구 서초동 1327-15 비트아카데미빌딩｜ 사업자등록번호 : 214-85-24928
				<br>(주)비트컴퓨터 서초지점 대표이사 : 조현정 / 문의 : 02-3486-9600 / 팩스 : 02-6007-1245
				<br>통신판매업 신고번호 : 제 서초-00098호 / 개인정보보호관리책임자 : 권도혁
				<br>Copyright (c) 비트캠프 All rights reserved. 
			</td>
		</tr>
	</table>
</body>
</html>