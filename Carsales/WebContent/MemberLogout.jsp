<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그아웃</title>
</head>
<body>
<%
try{
%>
	<script type="text/javascript">
	alert('Success Logout.');
	</script><%
session.invalidate();
response.sendRedirect("Main.jsp");
}catch(Exception e){
	e.printStackTrace();
}%>
</body>
</html>