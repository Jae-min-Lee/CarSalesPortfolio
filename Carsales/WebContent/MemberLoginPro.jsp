<%@page import="kr.co.min.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
</head>
<body>
<%
try{
request.setCharacterEncoding("UTF-8");
String custname = request.getParameter("custname");
String custpw = request.getParameter("custpw");

MemberDAO rdao = new MemberDAO();

int result = rdao.getloginMember(custname, custpw);

if(result == 0){
%>
<script type="text/javascript">
alert('Incorrect ID or Password.');
location.href='MemberLogin.jsp';
</script>
<%}else{//로그인 성공 
	%>
	<script type="text/javascript">
		alert('Success Login.');
		location.href='MemberLogin.jsp';
		</script>
		<%
		session.setAttribute("custname", custname);
	response.sendRedirect("Main.jsp");
	}
}catch(Exception e){
	e.printStackTrace();
}%>
</body>
</html>