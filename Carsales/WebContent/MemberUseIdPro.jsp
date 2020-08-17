<%@page import="kr.co.min.beans.MemberBean"%>
<%@page import="kr.co.min.dao.MemberDAO"%>
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
try{
String custname = request.getParameter("custname");

MemberDAO dao = new MemberDAO();

MemberBean bean = dao.CheckUserID(custname);

if(bean.getCustname() == null){
	%><script type="text/javascript">
	alert('This ID is available.');
	opener.chkform.idchk.value = 1;
	window.close();
	</script>	
<%}
else{
	%><script type="text/javascript">
alert('This ID already in use.');
location.href='MemberUseId.jsp';
</script><%
	}
}catch(Exception e){
	e.printStackTrace();
}%>

</body>
</html>