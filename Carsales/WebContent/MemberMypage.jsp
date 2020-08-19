<%@page import="kr.co.min.beans.MemberGradeBean"%>
<%@page import="kr.co.min.beans.MemberBean"%>
<%@page import="kr.co.min.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Page</title>
</head>
<body>
	<%
		String custname = request.getParameter("custname");

	MemberDAO dao = new MemberDAO();

	MemberBean MemberBean = dao.oneMemberInfo(custname);
	%>
	<c:import url="header.jsp" />
	 <!-- Breadcrumb End -->
    <div class="breadcrumb-option set-bg" data-setbg="images/breadcrumb-bg.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>My Page</h2>
                        <div class="breadcrumb__links">
                            <a href="Main.jsp"><i class="fa fa-home"></i> Home</a>
                            <span>My Page</span>
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
								<%
								MemberGradeBean gbean = dao.readMemberGrade(MemberBean.getGrade());
								%>
									<label class="col-form-label col-form-label">[Grade] |</label> <label class="col-form-label col-form-label"><%=gbean.getName() %></label>
								</div>
							</div>
							<hr>
						</div>
					</div>
				</div>
				<%
					if (custname.equals("admin") && MemberBean.getCustno() == 1) {
				%>
				<a href=" AdminOnetoOneList.jsp"
					class="btn btn-primary btn-lg btn-block">Contact Us Check</a>
				<%
					} else {
				%>
				<div align="center">
				<div class="col-lg-7" align="left">
				<div class="hero__tab">
			<div class="tab-content">
				<div class="tab-pane active" id="tabs-1" role="tabpanel">
				<form action="OnetoOneListPro.jsp" method="post">
				<div class="hero__tab__form">
						<h4 align="left">Contact Us Check</h4>
						<hr>
						<div class="form-group" align="left">
							<label for="board_file">Tel</label> <input type="tel"
								class="form-control" name="phone" /> <label for="board_file">E-mail</label>
							<input type="email" class="form-control" name="email" /> <input
								type="hidden" value="<%=custname%>" name="custname"><br>
							<input type="submit" class="btn btn-info" value="Check">
						</div>
					</div>
				</form>
				<br>
				<div class="form-group">
					<div class="text-right"><p>
						<button class="btn btn-info"
							onclick="location.href='MemberInfoUpdate.jsp?custname=<%=custname%>'">My Info Update</button>
						<button class="btn btn-danger"
							onclick="location.href='MemberInfoDelete.jsp?custname=<%=custname%>'">Cancel Subscription</button></p>
					</div>
				</div>
				<%
					}
				%>
			</div>
		</div>
	</div></div></div></div></div></div>
	<c:import url="footer.jsp" />
</body>
</html>