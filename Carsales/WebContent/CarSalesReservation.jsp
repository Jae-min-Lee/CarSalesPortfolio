<%@page import="kr.co.min.beans.ReservationBean"%>
<%@page import="kr.co.min.dao.ReservationDAO"%>
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
<title>차량구매예약</title>
<script type="text/javascript" src="js/jquery-3.5.1.min.js"></script>
</head>
<body>
	<%
		String custname = (String) session.getAttribute("custname");

	MemberDAO mdao = new MemberDAO();

	MemberBean MemberBean = mdao.oneMemberInfo(custname);

	int carsale_num = Integer.parseInt(request.getParameter("num"));

	CarListDAO dao = new CarListDAO();
	ReservationDAO rdao = new ReservationDAO();
	CarListBean bean = dao.getOneBoard(carsale_num);
	%>
	<script type="text/javascript">
		var sell_price =
	<%=bean.getCarsale_Price()%>
		;
		var amount;

		function init() {
			sell_price = document.form.sell_price.value;
			amount = document.form.amount.value;
			document.form.price.value = sell_price;
			change();
		}

		function add() {
			hm = document.form.amount;
			price = document.form.price;
			hm.value++;
			price.value = parseInt(hm.value) * sell_price;

		}

		function del() {
			hm = document.form.amount;
			price = document.form.price;
			if (hm.value > 1) {
				hm.value--;
				price.value = parseInt(hm.value) * sell_price;
			}
		}

		function change() {
			hm = document.form.amount;
			price = document.form.price;
			
			if (hm.value < 0) {
				hm.value = 1;
			}
			price.value = parseInt(hm.value) * sell_price;
		}
	</script>
	<c:import url="header.jsp" />
	<!-- Breadcrumb End -->
	<div class="breadcrumb-option set-bg"
		data-setbg="images/breadcrumb-bg.jpg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="breadcrumb__text">
						<h2><%=bean.getCarsale_name()%>_Reservation</h2>
						<div class="breadcrumb__links">
							<a href="Main.jsp"><i class="fa fa-home"></i> Home</a> <a
								href="#">Car Sale_Reservation</a> <span><%=bean.getCarsale_name()%></span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Breadcrumb Begin -->

	<!-- Car Details Section Begin -->
	<section class="car-details spad">
	<form name="form" action="CarSalesReservationPro.jsp" method="post">
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
									<li>Brand <span><%=bean.getCarsale_company()%></span></li>
									<li>Cost <span>$<%=bean.getCarsale_Price()%></span></li>
									<li>Quantity<span><div id="function">
												<input type="button" value=" - " onclick="del();"
													class="btn btn-secondary"> <input type="text"
													id="test" name="amount" value="1" size="3"
													onchange="change();" readonly="readonly"
													class="form-control-sm" /> <input type="button"
													value=" + " onclick="add();" class="btn btn-secondary">
											</div></span></li>
											<li>Price($)<span>
									<input type="text"
										class="form-control" name="price" value="<%=bean.getCarsale_Price()%>" readonly="readonly" />
<hr>
											</span></li>
									<li>Lean More <span><button
												onclick="<%=bean.getCarsale_info()%>" class="btn btn-danger">GO</button></span></li>
								</ul>
								
								<input type="hidden" name="carsale_name" value="<%=bean.getCarsale_name()%>" />
								<input type="hidden" name="carsale_img" value="<%=bean.getCarsale_img()%>" />
								<input type="hidden" name="custno" value="<%=MemberBean.getCustno()%>" />
								<input type="hidden" name="pcost" value="<%=bean.getCarsale_Price()%>"/>
								<input type="hidden" name="pcode" value="<%=bean.getCarsale_num()%>" />
								<input type="submit" value="Get Reservation" class="btn btn-danger" />
								<hr>
								<a href="CarList.jsp" class="btn btn-info">CarList</a>
							</div>
						</div>
					</div>
					
				</div>
			</div>
			</form>
	</section>
	<c:import url="footer.jsp" />
</body>
</html>