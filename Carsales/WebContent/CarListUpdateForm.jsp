<%@page import="kr.co.min.beans.CarListBean"%>
<%@page import="kr.co.min.dao.CarListDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Car Management</title>
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
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="js/CarFileUpload.js"></script>
<script src="js/CarCheckUpdate.js"></script>
<link href="css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">

<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Lato:wght@300;400;700;900&display=swap"
	rel="stylesheet">

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
<link href="css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
</head>
</head>
<body>
	<%
		int carsale_num = Integer.parseInt(request.getParameter("carsale_num"));

	CarListDAO dao = new CarListDAO();
	CarListBean bean = dao.getOneBoard(carsale_num);
	%>
	<!-- Breadcrumb End -->
	<div class="breadcrumb-option set-bg"
		data-setbg="images/breadcrumb-bg.jpg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="breadcrumb__text">
						<h2>Car Listing_Update</h2>
						<div class="breadcrumb__links">
							<a href="Main.jsp"><i class="fa fa-home"></i> Home</a>
							<a href="CarList.jsp">Car Listing</a>
							 <span>Car Listing_Update</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Breadcrumb Begin -->
	<c:import url="header.jsp" />
	<form action="ShelterProtectUpdatePro.jsp" method="post"
		enctype="multipart/form-data" name="chkform">
		<div class="container" style="margin-top: 300px">
		<h2 class="card-header">Car Listing_Update</h2>
		<br>
			<div class="row">
				<div class="col-sm-3"></div>
				<div class="col-sm-6">
					<div class="card shadow">
						<div class="card-body">
							<div class="form-group">
								<img src="upload/<%=bean.getCarsale_img()%>" width="100%" />
							</div>
							<div class="form-group">
								<label for="board_file">File</label> <input type="file"
									name="carsale_img" onchange="filecheck(this)"
									accept="image/gif, image/jpeg, image/png"
									value="<%=bean.getCarsale_img()%>" />
							</div>
							<div class="form-group">
								<label for="board_writer_name">Car Name</label> <input type="text"
									name="carsale_name" class="form-control"
									value="<%=bean.getCarsale_name()%>" />
							</div>
							<div class="form-group">
								<label class="col-form-label">Category</label><br> <select
											name="carsale_Category">
											<option>Select Brand</option>
											<option value="01">Small CAR</option>
											<option value="02">Mid-size CAR</option>
											<option value="03">Full-sized CAR</option>
											<option value="04">Small SUV</option>
											<option value="05">Mid-size SUV</option>
											<option value="06">Full-sized SUV</option>
											<option value="07">Other</option>
										</select><br>
							</div>
							<div class="form-group">
								<br><label for="board_subject">Price($)</label><br> <input type="text"
									name="carsale_Price" class="form-control"
									value="<%=bean.getCarsale_Price()%>" />
							</div>
							<div class="form-group">
								<label for="board_subject">Company</label><br> <select
									name="carsale_company">
									<option>Select Brand</option>
									<option value="1">Hyundai</option>
									<option value="2">KIA</option>
									<option value="3">Ssangyong</option>
									<option value="4">RnaultSamsungm</option>
									<option value="5">Chevrolet(GM DAEWOO)</option>
								</select><br>
							</div>
							<div class="form-group">
								<br><label for="board_content">Car Information</label> <input type="text"
									name="carsale_info" class="form-control"
									value="<%=bean.getCarsale_info()%>" />
							</div>
							<div class="form-group">
								<div class="text-right">
								<input type="button" class="btn btn-primary"
										value="Update Car Information" onclick="chkInfo()"/>
									<a href='CarList.jsp' class="btn btn-info">List</a>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-sm-3"></div>
			</div>
		</div>
	</form>
	<br>
	<br>
	<br>
	<footer>
		<c:import url="footer.jsp" />
	</footer>

</body>
</html>