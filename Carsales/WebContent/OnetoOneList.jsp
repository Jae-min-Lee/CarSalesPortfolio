<%@page import="kr.co.min.beans.OnetoOneBean"%>
<%@page import="kr.co.min.dao.OnetoOneDAO"%>
<%@page import="kr.co.min.beans.MemberBean"%>
<%@page import="kr.co.min.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String custname = request.getParameter("custname");

	MemberDAO dao = new MemberDAO();

	MemberBean MemberBean = dao.oneMemberInfo(custname);

	String phone = request.getParameter("phone");

	OnetoOneDAO odao = new OnetoOneDAO();

	OnetoOneBean obean = odao.getMyInfo(phone);
	%>
	<c:import url="header.jsp" />
	<!-- Breadcrumb End -->
	<div class="breadcrumb-option set-bg"
		data-setbg="images/breadcrumb-bg.jpg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="breadcrumb__text">
						<h2>My Page_Contact Us Check</h2>
						<div class="breadcrumb__links">
							<a href="Main.jsp"><i class="fa fa-home"></i> Home</a> <a
								href="MemberMypage.jsp">My Page</a> <span>My Page_Contact
								Us Check</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Breadcrumb Begin -->
		<div align="center">
		<div class="container" style="margin-top: 30px; margin-bottom: 30px">
			<div class="card shadow">
				<div class="card-body">
					<h3 class="card-title" align="left">My Page</h3><br><hr>
					<div class="col-lg-10 col-md-10">
						<div class="contact__form">
							<div class="row">
								<div class="col-lg-5" align="left">
									<label class="col-form-label col-form-label">[ID] |</label> <label
										class="col-form-label col-form-label"><%=MemberBean.getCustname()%></label>
								</div>
								<div class="col-lg-15" align="left">
									<label class="col-form-label col-form-label">[Address]
										|</label> <label class="col-form-label col-form-label"><%=MemberBean.getAdress()%></label>
								</div>
								<div class="col-lg-5" align="left">
									<label class="col-form-label col-form-label">[Tel] |</label> <label
										class="col-form-label col-form-label"><%=MemberBean.getPhone()%></label>
								</div>
								<div class="col-lg-15" align="left">
									<label class="col-form-label col-form-label">[Area
										Code] |</label> <label class="col-form-label col-form-label"><%=MemberBean.getCity()%></label>
								</div>
							</div>
							<hr>
						</div>
					</div>
				</div>
				<div align="Center">
		<div class="col-lg-7" align="left">
			<div class="hero__tab">
				<div class="tab-content">
					<div class="tab-pane active" id="tabs-1" role="tabpanel">
						<div class="hero__tab__form">
							<div align="center">
								<div class="container"
									style="margin-top: 30px; margin-bottom: 30px">
									<div class="card shadow">
										<div class="card-body">
											<h3 class="card-title" align="left">Contact Us Info</h3>
											<br><hr>
											<div class="col-lg-10 col-md-10">
												<div class="contact__form">
													<div class="row">
														<div class="col-lg-15" align="left">
															<label class="col-form-label col-form-label">[Response
																Tel] |</label> <label class="col-form-label col-form-label"><%=obean.getPhone()%></label>
														</div>
														<div class="col-lg-15" align="left">
															<label class="col-form-label col-form-label">[Response
																E-mail] |</label> <label class="col-form-label col-form-label"><%=obean.getEamil()%></label>
														</div>
													</div>
													<div class="col-lg-15" align="left">
														<h5>
															<label class="col-form-label col-form-label">[Subject]
																|</label> <input type="text" value="<%=obean.getSubject()%>"
																disabled="disabled" />
														</h5>
													</div>
													<textarea class="form-control" name="content"
														style="resize: none;" id="exampleTextarea" rows="3"
														disabled="disabled"><%=obean.getContent()%></textarea>
													<hr>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="form-group">
							<div class="text-right">
									<button class="btn btn-info"
										onclick="location.href='MemberInfoUpdate.jsp?custname=<%=custname%>'">My
										Info Update</button>
									<button class="btn btn-danger"
										onclick="location.href='MemberInfoDelete.jsp?custname=<%=custname%>'">Cancel
										Subscription</button>
							</div>
						</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		</div>
	</div>
</div></div>
	<c:import url="footer.jsp" />
</body>
</html>