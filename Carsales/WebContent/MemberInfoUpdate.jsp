<%@page import="kr.co.min.beans.MemberBean"%>
<%@page import="kr.co.min.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
                    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정</title>
</head>
<body>
<%
String custname = request.getParameter("custname");
MemberDAO dao = new MemberDAO();
MemberBean MemberBean = dao.oneMemberInfo(custname);
%>
<section>
		<c:import url="header.jsp" />
	</section>
	<!-- Breadcrumb End -->
    <div class="breadcrumb-option set-bg" data-setbg="images/breadcrumb-bg.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>My Page_Info Update</h2>
                        <div class="breadcrumb__links">
                            <a href="Main.jsp"><i class="fa fa-home"></i> Home</a>
                            <a href="MemberMypage.jsp">My Page</a>
                            <span>My Page_Info Update</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb Begin -->
	<form action="MemberInfoUpdatePro.jsp" method="post">
<div class="container" style="margin-top:100px">
	<div class="row">
		<div class="col-sm-3"></div>
		<div class="col-sm-6">
			<div class="card shadow">
				<div class="card-body">
				<h3>Member Info Update</h3>
				<br>
					<div class="form-group">
						<label for="board_file">ID</label>
						<input type="text" name="custname" class="form-control" value="<%=MemberBean.getCustname() %>" disabled="disabled"/>
					</div>
					<div class="form-group">
						<label for="board_date">Tel</label>
						<input type="tel" name="phone" class="form-control" value="<%=MemberBean.getPhone() %>"/>
					</div>
					<div class="form-group">
						<label for="board_subject">Address</label>
						<input type="email" name="adress" class="form-control" value="<%=MemberBean.getAdress() %>"/>
					</div>
					<div class="form-group">
						<label for="board_subject">Password</label>
						<input type="password" class="form-control" name="custpw"/><input type="hidden" value="<%=MemberBean.getCustno() %>" name="custno"/>
					</div>
					<div class="form-group">
						<div class="text-right">
							<input type="submit" class="btn btn-primary"  value="Update"/>
							<a href="MemberMypage.jsp?custname=<%=MemberBean.getCustname() %>" class="btn btn-primary">Cancel</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-sm-3"></div>
	</div>
</div>
</form>
<br><br><br>
	<footer>
		<c:import url="footer.jsp" />
	</footer>
</body>
</html>