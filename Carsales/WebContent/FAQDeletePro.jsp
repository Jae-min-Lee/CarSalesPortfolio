<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "kr.co.min.dao.FAQDAO" %>  
<%@ page import = "kr.co.min.beans.FAQBean" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
		int num = Integer.parseInt(request.getParameter("num"));

		//
		FAQDAO bdao = new FAQDAO();
		
		bdao.deleteFAQ(num);   
		
		response.sendRedirect("FAQList.jsp");
%>
	
</body>
</html>