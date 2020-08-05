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
<title>쉬어가는 고양이</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");

	String uploadPath = request.getRealPath("/upload");

	int size = 10 * 1024 * 1024;
	String carsale_img = "";
	String origfilename1 = "";
	try {
		MultipartRequest multi = new MultipartRequest(request, uploadPath, size, "UTF-8", new DefaultFileRenamePolicy());

		Enumeration files = multi.getFileNames();

		String file1 = (String) files.nextElement();
		carsale_img = multi.getFilesystemName(file1);
		origfilename1 = multi.getOriginalFileName(file1);

		String carsale_name = multi.getParameter("carsale_name");
		int carsale_Category = Integer.parseInt(multi.getParameter("carsale_Category"));
		int carsale_Price = Integer.parseInt(multi.getParameter("carsale_Price"));
		int carsale_company = Integer.parseInt(multi.getParameter("carsale_company"));
		String carsale_info = multi.getParameter("carsale_info");

		CarListBean CarListBean = new CarListBean();
		CarListBean.setCarsale_name(carsale_name);
		CarListBean.setCarsale_Category(carsale_Category);
		CarListBean.setCarsale_Price(carsale_Price);
		CarListBean.setCarsale_company(carsale_company);
		CarListBean.setCarsale_img(carsale_img);
		CarListBean.setCarsale_info(carsale_info);

		CarListDAO dao = new CarListDAO();
		dao.insertCarsale_imgBoard(CarListBean);
	} catch (Exception e) {
		e.printStackTrace();
	}
	response.sendRedirect("CarList.jsp");
	%>

</body>
</html>