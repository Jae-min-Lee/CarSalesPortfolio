<%@page import="kr.co.min.beans.MemberGradeBean"%>
<%@page import="kr.co.min.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Member Grade Update</title>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");

int custno = Integer.parseInt(request.getParameter("custno"));
String grade = request.getParameter("grade");

MemberDAO dao = new MemberDAO();

dao.insertMemberGrade(custno, grade);

response.sendRedirect("Adminpage.jsp");
%>

</body>
</html>