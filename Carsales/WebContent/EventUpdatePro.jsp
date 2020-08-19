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
<title>Event Admin Update</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
	
		
	String uploadPath = request.getRealPath("/upload");

	int size = 10 * 1024 * 1024;
	String img = "";
	String origfilename1 = "";
	
		MultipartRequest multi = new MultipartRequest(request, uploadPath, size, "UTF-8", new DefaultFileRenamePolicy());

		Enumeration files = multi.getFileNames();

		String file1 = (String) files.nextElement();
		img = multi.getFilesystemName(file1);
		origfilename1 = multi.getOriginalFileName(file1);

		int num = Integer.parseInt(multi.getParameter("num"));
		String title = multi.getParameter("title");
		String content = multi.getParameter("content");
		String term = multi.getParameter("term");
		String reg_date = multi.getParameter("reg_date");

		EventBean EventBean = new EventBean();
		EventBean.setNum(num);
		EventBean.setTitle(title);
		EventBean.setContent(content);
		EventBean.setTerm(term);
		EventBean.setImg(img);
		EventBean.setReg_date(reg_date);
	
		EventDAO dao = new EventDAO();
	

		dao.updateBoard(EventBean);
	

		response.sendRedirect("Event.jsp");
%>
</body>
</html>