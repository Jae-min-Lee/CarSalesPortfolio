<%@page import="kr.co.min.beans.MemberBean"%>
<%@page import="kr.co.min.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
                <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 탈퇴</title>
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
                        <h2>My Page_Info Delete</h2>
                        <div class="breadcrumb__links">
                            <a href="Main.jsp"><i class="fa fa-home"></i> Home</a>
                            <a href="MemberMypage.jsp">My Page</a>
                            <span>My Page_Info Delete</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb Begin -->
	<form action="MemberInfoDeletePro.jsp" method="post">
<div class="container" style="margin-top:100px">
	<div class="row">
		<div class="col-sm-3"></div>
		<div class="col-sm-6">
			<div class="card shadow">
				<div class="card-body">
				<h1>Cancel Subscription</h1>
					<div class="form-group">
						<label for="board_file">아이디</label>
						<input type="text" class="form-control" value="<%=MemberBean.getCustname() %>" disabled="disabled"/>
					</div>
					<div class="form-group">
						<label for="board_subject">비밀번호</label>
						<input type="password" class="form-control" name="custpw"/><input type="hidden" value="<%=MemberBean.getCustno() %>" name="custno"/>
					</div>
					<div class="form-group">
						<div class="text-right">
							<input type="submit" class="btn btn-primary" value="회원탈퇴">
							<a href="MemberMypage.jsp?user_id=<%=custname%>" class="btn btn-primary" >취소</a>
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