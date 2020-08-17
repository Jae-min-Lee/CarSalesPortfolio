<%@page import="kr.co.min.beans.MemberBean"%>
<%@page import="kr.co.min.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Contact Us</title>
<link href="css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
</head>
<body>
	<%
		try {
		String custname = (String) session.getAttribute("custname");

		MemberDAO mdao = new MemberDAO();

		MemberBean MemberBean = mdao.oneMemberInfo(custname);

		if (custname == null) {
	%>
	<script>
		alert("로그인을 먼저 해주세요.");
		location.href = 'MemberLogin.jsp';
	</script>
	<%
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
	%>
	<c:import url="header.jsp" />
	<!-- Breadcrumb End -->
	<div class="breadcrumb-option set-bg"
		data-setbg="images/breadcrumb-bg.jpg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="breadcrumb__text">
						<h2>Contact Us</h2>
						<div class="breadcrumb__links">
							<a href="./index.html"><i class="fa fa-home"></i> Home</a> <span>Contact
								Us</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Breadcrumb Begin -->

	<!-- Contact Section Begin -->
	<section class="contact spad">
	<div class="container">
		<div class="row">
			<div class="col-lg-6 col-md-6">
				<div class="contact__text">
					<div class="section-title">
						<h2>Let’s Work Together</h2>
						<p>To make requests for further information, contact us via
							our social channels.</p>
					</div>
					<ul>
						<li><span>Weekday</span> 08:00 am to 18:00 pm</li>
						<li><span>Saturday:</span> 10:00 am to 16:00 pm</li>
						<li><span>Sunday:</span> Closed</li>
					</ul>
				</div>
			</div>
			<div class="col-lg-6 col-md-6">
				<div class="contact__form">
					<form action="OnetoOnePro.jsp" id="form" class="form-horizontal"
						method="post">
						<div class="row">
							<div class="col-lg-6">
								<input type="tel" name="phone" placeholder="Tel" />
								</div>
								<div class="col-lg-6">
									<input type="eamil" name="eamil" placeholder="E-mail" />
								</div>
							</div>
							<input type="text" name="subject" placeholder="Subject" />
							<textarea class="form-control" name="content"
								style="resize: none;" id="exampleTextarea" rows="3">Your Questions</textarea>
							<button type="submit" class="site-btn">Send</button>&nbsp;&nbsp;
							<button type="reset" class="site-btn">Reset</button>&nbsp;
							<hr>
					</form>
						<a class="site-btn" href="FAQ.jsp">FAQ List</a>
				</div>
			</div>
		</div>
	</div>
	</section>
	<!-- Contact Section End -->
	<c:import url="footer.jsp" />
</body>
</html>