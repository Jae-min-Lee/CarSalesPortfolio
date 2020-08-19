<%@page import="kr.co.min.dao.EventDAO"%>
<%@page import="kr.co.min.beans.EventBean"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Event Admin Delete</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");

	int num = Integer.parseInt(request.getParameter("num"));
	String img = request.getParameter("img");

	EventDAO dao = new EventDAO();

	dao.filedelete(img);
	dao.deleteBoard(num);

	response.sendRedirect("Event.jsp");
	%>
</body>
</html>