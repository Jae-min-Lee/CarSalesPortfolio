<%@page import="kr.co.min.dao.ReservationDAO"%>
<%@page import="kr.co.min.beans.ReservationBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Car Sales Reservation</title>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");

String carsale_img = request.getParameter("carsale_img");
String carsale_name = request.getParameter("carsale_name");
int custno = Integer.parseInt(request.getParameter("custno"));
int pcost = Integer.parseInt(request.getParameter("pcost"));
String pcode = request.getParameter("pcode");
int amount = Integer.parseInt(request.getParameter("amount"));
int price = Integer.parseInt(request.getParameter("price"));

ReservationBean bean = new ReservationBean();

bean.setCarsale_img(carsale_img);
bean.setCarsale_name(carsale_name);
bean.setCustno(custno);
bean.setPcost(pcost);
bean.setPcode(pcode);
bean.setAmount(amount);
bean.setPrice(price);
	
	ReservationDAO dao = new ReservationDAO();
	dao.getReservationInfo(bean);
	
	//회원을 마쳤으면 로그인 화면으로 이동
		 response.sendRedirect("CarList.jsp"); 
	%>
</body>
</html>