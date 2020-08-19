<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="kr.co.min.dao.EventDAO"%>
<%@page import="kr.co.min.beans.EventBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Event Admin Write</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");

	String uploadPath = request.getRealPath("/event");

	int size = 10 * 1024 * 1024;
	String img = "";
	String origfilename1 = "";
	try {
		MultipartRequest multi = new MultipartRequest(request, uploadPath, size, "UTF-8", new DefaultFileRenamePolicy());

		Enumeration files = multi.getFileNames();

		String file1 = (String) files.nextElement();
		img = multi.getFilesystemName(file1);
		origfilename1 = multi.getOriginalFileName(file1);

		String title = multi.getParameter("title");
		String content = multi.getParameter("content");
		String term = multi.getParameter("term");

		EventBean EventBean = new EventBean();
		EventBean.setTitle(title);
		EventBean.setContent(content);
		EventBean.setTerm(term);
		EventBean.setImg(img);

		EventDAO dao = new EventDAO();
		dao.insertEventBoard(EventBean);
	} catch (Exception e) {
		e.printStackTrace();
	}
	response.sendRedirect("Event.jsp");
	%>

</body>
</html>