<%@page import="kr.co.min.beans.CarCompanyBean"%>
<%@page import="kr.co.min.dao.CarCompanyDAO"%>
<%@page import="kr.co.min.dao.MemberDAO"%>
<%@page import="kr.co.min.beans.MemberBean"%>
<%@page import="kr.co.min.dao.ReservationDAO"%>
<%@page import="kr.co.min.beans.ReservationBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zxx">
<%
try {
	String custname = (String) session.getAttribute("custname");

	if (custname == null) {//로그인이 되어있지 않으면.
		custname = "GUEST";
	}

	MemberBean bean = new MemberBean();
	MemberDAO dao = new MemberDAO();
	bean = dao.oneMemberInfo(custname);
	
	int com1 = 1, com2 = 2, com3 = 3, com4 = 4, com5 = 5;
%>
<head>
    <meta charset="UTF-8">
    <meta name="description" content="HVAC Template">
    <meta name="keywords" content="HVAC, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>header</title>

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

    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>

    <!-- Offcanvas Menu Begin -->
    <div class="offcanvas-menu-overlay"></div>
    <div class="offcanvas-menu-wrapper">
        <div class="offcanvas__widget">
            <a href="#"><i class="fa fa-cart-plus"></i></a>
            <%
		
		if (custname.equals("GUEST")) {
				%>
				 <p><a href="MemberLogin.jsp" class="primary-btn">Login</a></p>
				&nbsp;
				<p><a href="MemberSignup.jsp" class="primary-btn">Sign up</a></p>
				<%
					} else if (custname.equals("admin") && bean.getCustno() == 1) {
				%>
				<p><a href="MemberLogout.jsp" class="primary-btn">Logout</a></p>
				<p><a href="Adminpage.jsp?custname=<%=custname%>" class="primary-btn">AdminPage</a></p>
				<%
					} else {
				%>
				<p><a href="MemberLogout.jsp" class="primary-btn">Logout</a></p>
				&nbsp;
				<p><a href="MemberMypage.jsp?custname=<%=custname%>"  class="primary-btn">My page</a></p>
				<%
					}
				%>
        </div>
        <div class="offcanvas__logo">
            <a href="Main.jsp"><img src="images/logo.png" alt=""></a>
        </div>
        <div id="mobile-menu-wrap"></div>
        <ul class="offcanvas__widget__add">
            <li><i class="fa fa-clock-o"></i> Week day: 08:00 am to 18:00 pm</li>
            <li><i class="fa fa-envelope-o"></i>woals2670@daum.net</li>
        </ul>
        <div class="offcanvas__phone__num">
            <i class="fa fa-phone"></i>
            <span>(+123) 345 678 910</span>
        </div>
    </div>
    <!-- Offcanvas Menu End -->

    <!-- Header Section Begin -->
    <header class="header">
        <div class="header__top">
            <div class="container">
                <div class="row">
                    <div class="col-lg-7">
                        <ul class="header__top__widget">
                            <li><i class="fa fa-clock-o"></i> Week day: 08:00 am to 18:00 pm</li>
                            <li><i class="fa fa-envelope-o"></i> woals2670@daum.net</li>
                        </ul>
                    </div>
                    <div class="col-lg-5">
                        <div class="header__top__right">
                            <div class="header__top__phone">
                                <i class="fa fa-phone"></i>
                                <span>(+123) 345 6789</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-lg-2">
                    <div class="header__logo">
                        <a href="Main.jsp"><img src="images/logo.png" alt=""></a>
                    </div>
                </div>
                <div class="col-lg-10">
                    <div class="header__nav">
                        <nav class="header__menu">
                            <ul>
                                <li class="active"><a href="Main.jsp">Home</a></li>
                                <li><a href="#">Introduce</a>
                                    <ul class="dropdown">
                                        <li><a href="Introduce_Hello.jsp">About Us</a></li>
                                        <li><a href="Introduce_Map.jsp">Map</a></li>
                                    </ul>
                                </li>
                                <li><a href="#">Sales</a>
                                    <ul class="dropdown">
                                    	<li><a href="CarList.jsp?">CarListAll</a></li>
                                        <li><a href="CarList_Hyundai.jsp?num=<%=com1%>">Hyundai</a></li>
                                        <li><a href="CarList_Kia.jsp?num=<%=com2%>">KIA</a></li>
                                        <li><a href="CarList_Ssangyong.jsp?num=<%=com3%>">Ssangyong</a></li>
                                        <li><a href="CarList_RnaultSamsungm.jsp?num=<%=com4%>">RnaultSamsungm</a></li>
                                        <li><a href="CarList_Chevrolet.jsp?num=<%=com5%>">Chevrolet<br>(GM DAEWOO)</a></li>
                                        
                                    </ul>
                                </li>
                                <li><a href="#">Community</a>
                                    <ul class="dropdown">
                                        <li><a href="Event.jsp">Event</a></li>
                                        <li><a href="BoardList.jsp">FreeBoard</a></li>
                                    </ul>
                                </li>
                                <li><a href="FAQ.jsp">FAQ</a></li>
                            </ul>
                        </nav>
                        <div class="header__nav__widget">
                            <div class="header__nav__widget__btn">
                                <a href="CarReservationCheck.jsp?custno=<%=bean.getCustno()%>"><i class="fa fa-cart-plus"></i></a>
                            </div>
                            <%
		
		if (custname.equals("GUEST")) {
				%>
				 <a href="MemberLogin.jsp" class="primary-btn">Login</a>
				&nbsp;
				<a href="MemberSignup.jsp" class="primary-btn">Sign up</a>
				<%
					} else if (custname.equals("admin") && bean.getCustno() == 1) {
				%>
				<a href="MemberLogout.jsp" class="primary-btn">Logout</a>
				&nbsp;
				<a href="Adminpage.jsp?custname=<%=custname%>" class="primary-btn">AdminPage</a>
				<%
					} else {
				%>
				<a href="MemberLogout.jsp" class="primary-btn">Logout</a>
				&nbsp;
				<a href="MemberMypage.jsp?custname=<%=custname%>"  class="primary-btn">My page</a>
				<%
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
				%>
                           
                        </div>
                    </div>
                </div>
            </div>
            <div class="canvas__open">
                <span class="fa fa-bars"></span>
            </div>
        </div>
    </header>
    <!-- Header Section End -->

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
</body>
</html>