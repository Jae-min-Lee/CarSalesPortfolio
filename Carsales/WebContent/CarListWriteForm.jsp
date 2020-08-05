<%@page import="kr.co.min.beans.MemberBean"%>
<%@page import="kr.co.min.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 자동차등록</title>
<link href="css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script type="text/javascript">
	function fileCheck(obj) {
		pathpoing = obj.value.lastIndexOf('.');
		filepoint = obj.value.substring(pathpoint + 1, obj.length);
		filetype = filepoint.toLowerCase();
		if (filetype == 'jpg' || filetype == 'gif' || filetype == 'png'
				|| filetype == 'jpeg' || filetype == 'bmp') {
			//정상적인 이미지 확장자 파일의 경우
		} else {
			alert('이미지 파일만 선택 할 수 있습니다.');
			parentObj = obj.parentNode
			node = parentObj.replaceChild(obj.cloneNode(true), obj);
			return false;
		}
		if (filetype == 'bmp') {
			upload = confirm('BMP파일은 웹상에서 사용하기에 적절한 이미지 포맷이 아닙니다. \n 그래도 사용하시겠습니까?');
			if (upload)
				return false;
		}
	}
</script>
</head>
<body>
	<%
		String custname = request.getParameter("custname");

	MemberDAO dao = new MemberDAO();

	MemberBean MemberBean = dao.oneMemberInfo(custname);
	%>
				 <!-- Breadcrumb End -->
    <div class="breadcrumb-option set-bg" data-setbg="images/breadcrumb-bg.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>Car Listing_Write</h2>
                        <div class="breadcrumb__links">
                            <a href="Main.jsp"><i class="fa fa-home"></i> Home</a>
                            <a href="CarList.jsp">Car Listing</a>
                            <span>Car Listing_Write</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb Begin -->
		<c:import url="header.jsp" />
	<form action="CarListWritePro.jsp" method="post"
		enctype="multipart/form-data">
		<div class="container" style="margin-top: 100px">
			<h2 class="card-header">Car Listing_Write</h2>
			<fieldset>
				<div class="form-group">
					<label class="col-form-label col-form-label-lg" for="inputLarge">차
						이름을 입력해 주세요.</label> <input type="text" name="carsale_name"
						class="form-control" id="inputLarge" placeholder="차이름을 입력해 주세요." />
				</div>
				<div class="form-group">
					<label class="col-form-label col-form-label-lg" for="inputLarge">차종
						입력해주세요.</label> <select name="carsale_Category">
						<option value="01">소형</option>
						<option value="02">중형</option>
						<option value="03">대형</option>
						<option value="04">소형SUV</option>
						<option value="05">중형SUV</option>
						<option value="06">대형SUV</option>
						<option value="07">기타</option>
					</select>
				</div>
				<div class="form-group">
					<label class="col-form-label col-form-label-lg" for="inputLarge">차가격을
						입력해주세요.(※만원단위)</label> <input type="text" name="carsale_Price"
						class="form-control" id="inputLarge"
						placeholder="차가격을 만원단위로 입력해 주세요." />
				</div>
				<div class="form-group">
					<label class="col-form-label col-form-label-lg" for="inputLarge">차량제조
						회사를 입력해주세요.</label> <select name="carsale_company">
						<option data-display="Brand">Select Brand</option>
						<option value="1">Hyundai</option>
						<option value="2">KIA</option>
						<option value="3">Ssangyong</option>
						<option value="4">RnaultSamsungm</option>
						<option value="5">Chevrolet(GM DAEWOO)</option>
					</select>
				</div>
				<div class="form-group">
					<label class="col-form-label col-form-label-lg" for="inputLarge">차량정보
						링크주소를 입력해 주세요.</label> <input type="text" name="carsale_info"
						class="form-control" id="inputLarge"
						placeholder="차량정보 링크주소를 입력해 주세요." />
				</div>
				<div class="form-group">
					<label for="exampleInputFile">파일 업로드</label> <input type="file"
						class="form-control-file" id="exampleInputFile"
						aria-describedby="fileHelp" name="carsale_img"
						onchange="filecheck(this)"
						accept="image/gif, image/jpeg, image/png" /> <small id="fileHelp"
						class="form-text text-muted">파일 용량은 최대 10MB 까지 가능합니다.</small>
				</div>
				<Input type="submit" class="btn btn-primary btn-lg btn-block"
					value="글등록" />
			</fieldset>
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