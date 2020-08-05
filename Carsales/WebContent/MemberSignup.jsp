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

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>
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
								class="form-horizontal" method="post">
								<p class="lead">
								<div class="form-group">
									<label class="col-form-label col-form-label-lg"
										for="inputLarge">ID </label> <input
										class="form-control form-control-lg" name="custname"
										type="text" placeholder="ID" id="inputLarge">
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
										id="inputLarge" class="form-control form-control-lg">
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
									<Input type="submit" class="btn btn-danger btn-lg btn-block"
										value="Sign Up" /> <input type="reset"
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