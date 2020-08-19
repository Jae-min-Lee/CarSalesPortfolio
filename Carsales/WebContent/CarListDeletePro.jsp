<%@page import="kr.co.min.dao.CarListDAO"%>
<%@page import="kr.co.min.beans.CarListBean"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Car Management</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");

	int carsale_num = Integer.parseInt(request.getParameter("carsale_num"));
	String carsale_img = request.getParameter("carsale_img");

	CarListDAO dao = new CarListDAO();
	dao.filedelete(carsale_img);
	dao.deleteBoard(carsale_num);

	response.sendRedirect("CarList.jsp");
	%>
</body>
</html>