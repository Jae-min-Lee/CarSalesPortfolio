<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Free Board_Write</title>
<link href="css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="js/FBCheck.js"></script>
</head>
<body>
	<c:import url="header.jsp" />
				<!-- Breadcrumb End -->
	    <div class="breadcrumb-option set-bg" data-setbg="images/breadcrumb-bg.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>Board Write Page</h2>
                        <div class="breadcrumb__links">
                            <a href="Main.jsp"><i class="fa fa-home"></i> Home</a>
                            <a href="BoardList.jsp">FreeBoard</a>
                            <span>Board Write Page</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb Begin -->
	<form action="BoardWritePro.jsp" method="post" name="chkform">
		<div class="container" style="margin-top: 30px">
			<h2 align="center">Board Write Page</h2>
			<fieldset>
				<div class="form-group">
					<label class="col-form-label col-form-label-lg" for="inputLarge">WRITER</label>
					<input type="text" name="writer" class="form-control"
						id="inputLarge" placeholder="Enter your ID" />
				</div>
				<div class="form-group">
					<label class="col-form-label col-form-label-lg" for="inputLarge">SUBJECT</label>
					<input type="text" name="subject" class="form-control"
						id="inputLarge" placeholder="Enter the Subject." />
				</div>
				<div class="form-group">
					<label class="col-form-label col-form-label-lg" for="inputLarge">E-MAIL</label>
					<input type="text" name="email" class="form-control"
						id="inputLarge" placeholder="Enter your E-Mail." />
				</div>
				<div class="form-group">
					<label class="col-form-label col-form-label-lg" for="inputLarge">PASSWORD</label>
					<input type="password" name="password" class="form-control"
						id="inputLarge" placeholder="Enter your Password." />
				</div>
				<div class="form-group">
					<label class="col-form-label col-form-label-lg" for="inputLarge">CONTENT</label>
					<textarea class="form-control" name="content" style="resize: none;"
						id="exampleTextarea" rows="3"></textarea>
				</div>
				<div class="form-group" align="center">
				<input type="button" class="btn btn-info" value="Write" onclick="chkInfo()"/>&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="reset" class="btn btn-warning" value="Reset">&nbsp;&nbsp;&nbsp;&nbsp;

					<button class="btn btn-primary"
						onclick="location.href='BoardList.jsp'">List</button>
				</div>
			</fieldset>
		</div>
	</form>
	<c:import url="footer.jsp" />
</body>
</html>