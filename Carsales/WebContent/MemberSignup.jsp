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

<title>Sign Up</title>

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
<script src="js/address.js"></script>
<script src="js/UseIdChk.js"></script>
<script src="js/SignUpCheck.js"></script>
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
</head>
<body>
	<c:import url="header.jsp" />
			 <!-- Breadcrumb End -->
    <div class="breadcrumb-option set-bg" data-setbg="images/breadcrumb-bg.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>Sign Up</h2>
                        <div class="breadcrumb__links">
                            <a href="Main.jsp"><i class="fa fa-home"></i> Home</a>
                            <span>Sign Up</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
	<div align="center">
		<div class="col-lg-7" align="left">
			<div class="hero__tab">
				<div class="tab-content">
					<div class="tab-pane active" id="tabs-1" role="tabpanel">
						<div class="hero__tab__form">
							<h2>Sign Up</h2>
							<form action="MemberSignupPro.jsp" id="form"
								class="form-horizontal" method="post" name="chkform">
								<p class="lead">
								<div class="form-group">
									<label class="col-form-label col-form-label-lg"
										for="inputLarge">ID</label><input
										class="form-control form-control-lg" name="custname"
										type="text" placeholder="ID" id="custname"><br>
										<p><a onclick="idcheck()" class="btn btn-warning btn-lg btn-block">Use ID Check</a></p><br>
										<input type="hidden" value=0 id="idchk" name="useid">
								</div>
								<div class="form-group">
									<label class="col-form-label col-form-label-lg"
										for="inputLarge">Password</label> <input
										class="form-control form-control-lg" type="password"
										name="custpw" placeholder="Password" id="inputLarge">
								</div>
								<div class="form-group">
									<label class="col-form-label col-form-label-lg"
										for="inputLarge">Re-enter Password</label> <input
										class="form-control form-control-lg" type="password"
										name="custpw2" placeholder="Re-enter Password" id="inputLarge">
								</div>
								<div class="form-group">
									<label class="col-form-label col-form-label-lg"
										for="inputLarge">Tel</label> <input type="tel"
										placeholder="Tel" name="phone" id="inputLarge"
										class="form-control form-control-lg" />
								</div>
								<div class="form-group">
									<label class="col-form-label col-form-label-lg"
										for="inputLarge">Address </label> 
										<input type="text" class="form-control form-control-lg" id="sample6_postcode" placeholder="Zip Code" name="zipcode"><br>
										<input type="button" class="btn btn-warning btn-lg btn-block" onclick="sample6_execDaumPostcode()" value="Find Zip Code"><br>
										<input type="text" class="form-control form-control-lg" id="sample6_address" placeholder="Address" name="address1"><br>
										<input type="text" class="form-control form-control-lg" id="sample6_detailAddress" placeholder="Detail Address" name="address2"><br>
										<input type="text" class="form-control form-control-lg" id="sample6_extraAddress" placeholder="Detail Address Info" name="address3">
								</div>
								<div class="form-group">
									<label class="col-form-label col-form-label-lg"
										for="inputLarge">City</label><br> <select name="city"
										id="city" class="form-control form-control-lg">
										<option>City</option>
										<option value="01">서울/경기</option>
										<option value="02">인천/부천</option>
										<option value="03">춘천/강원</option>
										<option value="04">부산/울산/경남</option>
										<option value="05">대구/경북</option>
										<option value="06">전주/전북</option>
										<option value="07">광주/전남</option>
										<option value="08">청주/충북</option>
										<option value="09">대전/충남</option>
										<option value="10">제주</option>
									</select>
								</div>
								<br /> <input type="hidden" name="user_num" value="" /> <br>
								<hr class="my-4">
								<p class="lead">
									<input type="button" class="btn btn-danger btn-lg btn-block"
										value="Sign Up" onclick="chkInfo()"/> <input type="reset"
										class="btn btn-primary btn-lg btn-block" value="Reset">
									<input type="button" class="btn btn-warning btn-lg btn-block"
										value="Cancle" onclick="location.href='Main.jsp'">
								</p>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<c:import url="footer.jsp" />
</body>
</html>