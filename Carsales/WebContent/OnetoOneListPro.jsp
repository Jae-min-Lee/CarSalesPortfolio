<%@page import="kr.co.min.dao.OnetoOneDAO"%>
<%@page import="kr.co.min.beans.OnetoOneBean"%>
<%@page import="kr.co.min.beans.MemberBean"%>
<%@page import="kr.co.min.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Contact Us</title>
</head>
<body>
	<%
		try {
		String custname = request.getParameter("custname");

		MemberDAO dao = new MemberDAO();

		MemberBean MemberBean = dao.oneMemberInfo(custname);

		String phone = request.getParameter("phone");

		String email1 = request.getParameter("email");

		OnetoOneDAO odao = new OnetoOneDAO();

		String email2 = odao.getPhone(phone);

		if (email1.equals(email2)) {
	%>
	<script type="text/javascript">
		location.href="OnetoOneList.jsp?custname=<%=custname%>&phone=<%=phone%>";
	</script>
	<%
		} else {
	%>
	<script>
		alert("전화번호나 이메일이 잘못되었습니다. 확인 바랍니다.");
		history.go(-1);
	</script>
	<%
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
	%>
</body>
</html>