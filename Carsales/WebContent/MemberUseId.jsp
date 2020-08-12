<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Use ID Check</title>
</head>
<body>
<%
String custname = request.getParameter("custname");
%>
<br><br><br>
<h1 align="center">Duplicate ID check</h1><br>
<form action="MemberUseIdPro.jsp" method="post">
<table align="center">
<tr><td align="center">
ID</td><td align="center"><input type="text" name="custname" value="<%=custname %>"/></td></tr>
<tr><td></td></tr>
<tr><td colspan="2" align="center">
<input type="submit" value="Check"/></td></tr>
</table>
</form>
</body>
</html>