<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "kr.co.min.dao.BoardDAO" %>  
<%@ page import = "kr.co.min.beans.BoardBean" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Free Board_ReWrite</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
%>
	<jsp:useBean id="boardbean" class="kr.co.min.beans.BoardBean">
		<jsp:setProperty name="boardbean" property="*"/>
	</jsp:useBean>
<%
	BoardDAO bdao = new BoardDAO();
	bdao.reWriteBoard(boardbean);

	response.sendRedirect("BoardList.jsp");
%>
</body>
</html>