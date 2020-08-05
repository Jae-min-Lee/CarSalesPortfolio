<%@page import="kr.co.min.dao.CarCompanyDAO"%>
<%@page import="kr.co.min.beans.CarCompanyBean"%>
<%@page import="kr.co.min.beans.CarSizeBean"%>
<%@page import="kr.co.min.dao.CarSizeDAO"%>
<%@page import="kr.co.min.beans.MemberBean"%>
<%@page import="kr.co.min.dao.MemberDAO"%>
<%@page import="kr.co.min.beans.CarListBean"%>
<%@page import="kr.co.min.dao.CarListDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Car_Detail</title>
</head>
<body>
	<%
		String custname = (String) session.getAttribute("custname");

	MemberDAO mdao = new MemberDAO();

	MemberBean MemberBean = mdao.oneMemberInfo(custname);

	int carsale_num = Integer.parseInt(request.getParameter("num"));

	CarListDAO dao = new CarListDAO();
	CarListBean bean = dao.getOneBoard(carsale_num);
	CarSizeDAO sdao = new CarSizeDAO();
	CarSizeBean sbean = sdao.getReadCarSize(bean.getCarsale_Category());
	CarCompanyDAO comdao = new CarCompanyDAO();
	CarCompanyBean combean = comdao.getReadCarCompany(bean.getCarsale_company());
	%>
<c:import url="header.jsp" />
    <!-- Breadcrumb End -->
    <div class="breadcrumb-option set-bg" data-setbg="images/breadcrumb-bg.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2><%=bean.getCarsale_name()%></h2>
                        <div class="breadcrumb__links">
                            <a href="Main.jsp"><i class="fa fa-home"></i> Home</a>
                            <a href="CarList.jsp">Car Listing</a>
                            <span><%=bean.getCarsale_name()%></span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb Begin -->
    
	<!-- Car Details Section Begin -->
    <section class="car-details spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-9">
                    <div class="car__details__pic">
                        <div class="car__details__pic__large">
                           <img src="upload/<%=bean.getCarsale_img()%>" width="100%" />
                        </div>
                    </div>
                    </div>
                <div class="col-lg-3">
                    <div class="car__details__sidebar">
                        <div class="car__details__sidebar__model">
                            <ul>
                                <li>Name <span><%=bean.getCarsale_name()%></span></li>
                                <li>Category <span><%=sbean.getName()%></span></li>
                                <li>Brand <span><%=combean.getName()%></span></li>
                                <li>Price <span>$<%=bean.getCarsale_Price()%></span></li>
                                <li>Lean More <span><button onclick="<%=bean.getCarsale_info()%>" class="btn btn-danger">GO</button></span></li>
                            </ul>
						<%
							if (custname.equals("admin") && MemberBean.getCustno() == 1) {
						%>
								<a href="CarListUpdateForm.jsp?carsale_num=<%=bean.getCarsale_num()%>"
									class="btn btn-primary">Update</a>&nbsp;&nbsp;&nbsp;<a
									href="CarListDeleteForm.jsp?carsale_num=<%=bean.getCarsale_num()%>"
									class="btn btn-danger">Delete</a><hr><a href='CarList.jsp'
									class="btn btn-info">CarList</a>
						<%
							} else {
						%>	
								<a href="CarSalesReservation.jsp?num=<%=bean.getCarsale_num()%>"
									class="btn btn-primary">Get Reservation</a><hr><a href='CarList.jsp'
									class="btn btn-info">CarList</a>
						<%
							}
						%>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Car Details Section End -->
		<c:import url="footer.jsp" />
</body>
</html>