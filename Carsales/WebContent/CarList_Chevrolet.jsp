<%@page import="kr.co.min.beans.MemberBean"%>
<%@page import="kr.co.min.dao.MemberDAO"%>
<%@page import="kr.co.min.beans.CarListBean"%>
<%@page import="java.util.*"%>
<%@page import="kr.co.min.dao.CarListDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
               <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta name="description" content="HVAC Template">
    <meta name="keywords" content="HVAC, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>CarList</title>
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
try{
	

	
String custname = (String)session.getAttribute("custname");

if(custname == null||custname.equals("")){
	%>
	<script>
	alert("로그인을 먼저 해주세요.");
	location.href='MemberLogin.jsp';
	</script>
<%}

MemberDAO mdao = new MemberDAO();

MemberBean MemberBean = mdao.oneMemberInfo(custname);


	int pageSize=9; //화면에 보여질 게시글의 숫자 지정
	//현재 카운터를 클릭한 번호값으로 일어옵니다.
	String pageNum = request.getParameter("pageNum");
	
	if(pageNum == null){
		pageNum = "1";
	}

	int count = 0; //전체 글의 갯수를 저장하는 변수
	int number = 0;//페이지 넘버링 변수

	//현재 보고자하는 페이지 숫자를 저장합니다.
	int currentPage = Integer.parseInt(pageNum);
	
	CarListDAO dao = new CarListDAO();
	//전체 게시글의 내용을 jsp쪽으로 가져옵니다. 전체 게시글의 갯수를 읽어드립니다. 
	count = dao.getAllcount();
	
	//현재 페이지에 보열줄 시작 번호를 설정  = 데이터 베이스에서 불러올 시작번호
	int startRow = (currentPage -1)*pageSize + 1; 
	int endRow = currentPage * pageSize;
	
	//테이블에 표시할 번호를 지정
	number = count - (currentPage - 1) * pageSize;
	
	int num = Integer.parseInt(request.getParameter("num"));
	ArrayList<CarListBean> al = dao.getCompanyCarList(num);
	System.out.println(num);
%>

<c:import url="header.jsp" />
		
		 <!-- Breadcrumb End -->
    <div class="breadcrumb-option set-bg" data-setbg="images/breadcrumb-bg.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>Car Listing</h2>
                        <div class="breadcrumb__links">
                            <a href="Main.jsp"><i class="fa fa-home"></i> Home</a>
                            <a href="CarList.jsp">Car Listing</a>
                            <span>Car Listing_Chevrolet</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb Begin -->

    <!-- Car Section Begin -->
    <section class="car spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="car__sidebar">
                        <div class="car__filter">
                            <h5>Car Filter</h5>
                            <form action="CarListSearchCompany.jsp" method="get">
                                <select name="brand">
                                    <option data-display="Brand">Select Brand</option>
                                    <option value="1">Hyundai</option>
                                    <option value="2">KIA</option>
                                    <option value="3">Ssangyong</option>
                                    <option value="4">RnaultSamsungm</option>
                                    <option value="5">Chevrolet(GM DAEWOO)</option>
                                </select>
                                <div class="car__filter__btn">
                                    <input type="submit" class="site-btn" value="Search More"/>
                                </div>
                            </form>
                            <hr>
                            <form action="CarListSearchCategory.jsp" method="get">
                            <select name="model">
                                    <option data-display="Model">Select Model</option>
                                    <option value="1">Small CAR</option>
                                    <option value="2">Mid-size CAR </option>
                                    <option value="3">Full-sized CAR</option>
                                    <option value="4">Small SUV</option>
                                    <option value="5">Mid-size SUV</option>
                                    <option value="6">Full-sized SUV</option>
                                    <option value="7">Other</option>
                                </select>
                                <div class="car__filter__btn">
                                    <input type="submit" class="site-btn" value="Search More"/>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                    <div class="col-lg-9">
                    <div class="row">
<%
int j = 0;
for(int i=0; i<al.size(); i++){
	CarListBean bean = al.get(i);
%>
<div class="col-lg-4 col-md-4">
			<div class="car__item">
                                <div class="car__item__pic">
                                <a href="CarListInfo.jsp?num=<%=bean.getCarsale_num() %>">
                                    <img src="upload/<%=bean.getCarsale_img()%>"></a>
                                </div>
                                <div class="car__item__text">
                                    <div class="car__item__text__inner">
                                        <div class="label-date">2020</div>
                                        <h5><a href="CarListInfo.jsp?num=<%=bean.getCarsale_num() %>"><%=bean.getCarsale_name()%></a></h5>
                                        <ul>
                                            <li><span>35,000</span> mi</li>
                                            <li>Auto</li>
                                            <li><span>700</span> hp</li>
                                        </ul>
                                    </div>
                                    <div class="car__item__price">
                                        <span class="car-option">Buy Car</span>
                                        <h6>$<%=bean.getCarsale_Price() %></h6>
                                    </div>
                                </div>
                            </div></div>
                            <%}}catch(Exception e){
                            	e.printStackTrace();
                            }%>
</div>
</div></div></div></section>
<c:import url="footer.jsp" />
</body>
</html>