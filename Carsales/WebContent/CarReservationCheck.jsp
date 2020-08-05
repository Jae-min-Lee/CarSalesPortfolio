<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="kr.co.min.dao.ReservationDAO"%>
<%@page import="kr.co.min.beans.ReservationBean"%>
<%@page import="kr.co.min.beans.MemberBean"%>
<%@page import="kr.co.min.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta name="description" content="HVAC Template">
    <meta name="keywords" content="HVAC, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Reservation List</title>
    <!-- Js Plugins -->
    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.nice-select.min.js"></script>
    <script src="js/jquery-ui.min.js"></script>
    <script src="js/jquery.magnific-popup.min.js"></script>
    <script src="js/mixitup.min.js"></script>
    <script src="js/jquery.slicknav.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/main.js"></script>
<link href="css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Lato:wght@300;400;700;900&display=swap" rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="css/magnific-popup.css" type="text/css">
    <link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="css/style.css" type="text/css">
</head>
<body>
	<%
		try {
		String custname = (String) session.getAttribute("custname");

		if (custname == null) {
	%>
	<script>
		alert("로그인을 먼저 해주세요.");
		location.href = 'MemberLogin.jsp';
	</script>

	<%
		}
	MemberDAO mdao = new MemberDAO();

	MemberBean MemberBean = mdao.oneMemberInfo(custname);

	if (custname.equals("admin")) {
	%>
	<script>
		alert("관리자 페이지로 이동합니다.");
		location.href = 'Adminpage.jsp';
	</script>
	<%
		}
	int custno = Integer.parseInt(request.getParameter("custno"));
	ReservationDAO dao = new ReservationDAO();
	ReservationBean cbean = dao.getReservationCheck(custno);
	if(cbean.getPcode() == null || cbean.getPcode().equals("")){
		%>
		<script>
		alert("구매 예약 후 이용해주세요.");
		location.href = 'CarList.jsp';
	</script>
	<%}
	%>
	<c:import url="header.jsp" />
	<!-- Breadcrumb End -->
	<div class="breadcrumb-option set-bg"
		data-setbg="images/breadcrumb-bg.jpg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="breadcrumb__text">
						<h2>Reservation Check</h2>
						<div class="breadcrumb__links">
							<a href="Main.jsp"><i class="fa fa-home"></i> Home</a>
							<span>Reservation Check</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Breadcrumb Begin -->

	<!-- Car Details Section Begin -->
	<section class="car spad">
        <div class="container">
            
	<div class="col-lg-9">
	<div class="row">
			<%
			ArrayList<ReservationBean> al = dao.getAllReservationCheck(custno);

			for(int i=0; i<al.size(); i++){
		ReservationBean bean = al.get(i);
		DateFormat dffrom = new SimpleDateFormat("yyyy-mm-dd hh:mm:ss");
		DateFormat dfto = new SimpleDateFormat("yyyy-MM-dd");  
		Date today = dffrom.parse(bean.getSdate());
		String sdate = dfto.format(today);
	%>
					<div class="col-lg-4 col-md-4">
			<div class="car__item">
                                <div class="car__item__pic">
							<img src="upload/<%=bean.getCarsale_img()%>" width="100%" />
							</div>
							<div class="car__item__text">
                                    <div class="car__item__text__inner">
                                        <div class="label-date">2020</div>
                                        <h5><%=bean.getCarsale_name()%></h5>
                                        <ul>
                                    <li>Member No <span><%=bean.getCustno()%></span></li>
									<li>Sales No <span><%=bean.getSalenol()%></span></li>
									<li>Quantity <span><%=bean.getAmount()%></span></li>
									<li>Sales Date <span><%=sdate %></span></li>
                                        </ul>
                                    </div>
                                    <div class="car__item__price">
                                        <span class="car-option">Price</span>
                                        <h6>$<%=bean.getPrice()%></h6>
                                    </div>
                                </div>
                            </div></div>
							
		<%
	}%></div><%
	} catch (Exception e) {
		e.printStackTrace();
	}
	%>
	</div><div style="float: right; margin-right: 30%;">
	<a href="CarList.jsp" class="btn btn-info">CarList</a>
	</div></div>
	</section>
	<c:import url="footer.jsp" />
</body>
</html>