<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<link href="css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
</head>
<body>
	<c:import url="header.jsp" />
	<div align="center">
	<div class="col-lg-7" align="left">
		<div class="hero__tab">
			<div class="tab-content">
				<div class="tab-pane active" id="tabs-1" role="tabpanel">
					<div class="hero__tab__form">
						<h2>Login pleases</h2>
						<form action="MemberLoginPro.jsp" id="form"
							class="form-horizontal" method="post">
							<p class="lead">
							<div class="form-group">
								<label class="col-form-label col-form-label-lg" for="inputLarge"><p>ID</p></label>
								<input class="form-control form-control-lg" name="custname"
									type="text" placeholder="ID" id="inputLarge">
							</div>
							<div class="form-group">
								<label class="col-form-label col-form-label-lg" for="inputLarge"><p>Password</p></label>
								<input class="form-control form-control-lg" type="password"
									name="custpw" placeholder="Password" id="inputLarge">
							</div>
							<br>
							<hr class="my-4">
							<p class="lead">
								<Input type="submit" class="btn btn-danger btn-lg btn-block"
									value="Login" /> <input type="button"
									class="btn btn-danger btn-lg btn-block" value="Cancle"
									onclick="location.href='Main.jsp'">
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