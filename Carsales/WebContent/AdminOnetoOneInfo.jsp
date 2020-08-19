<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="kr.co.min.dao.OnetoOneDAO"%>
<%@ page import="kr.co.min.beans.OnetoOneBean"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Admin Page_Contact Info</title>
<link href="css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
</head>
<body>
	<c:import url="header.jsp" />

	<%
		int num = Integer.parseInt(request.getParameter("num"));

	OnetoOneDAO bdao = new OnetoOneDAO();
	OnetoOneBean bean = bdao.getOneOnetoOne(num);
	
	DateFormat dffrom = new SimpleDateFormat("yyyy-mm-dd hh:mm:ss");
	DateFormat dfto = new SimpleDateFormat("yyyy-MM-dd");  
	Date today = dffrom.parse(bean.getReg_date());
	String sdate = dfto.format(today);
	%>
	<!-- Breadcrumb End -->
	    <div class="breadcrumb-option set-bg" data-setbg="images/breadcrumb-bg.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>Admin Contact Us Info</h2>
                        <div class="breadcrumb__links">
                            <a href="Main.jsp"><i class="fa fa-home"></i> Home</a>
                            <span>Admin Contact Us Info</span>
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
				<h3 class="card-title" align="left">Contact Us Info</h3>
	<div class="col-lg-10 col-md-10">
				<div class="contact__form">
						<div class="row">
							<div class="col-lg-5" align="left">
							<label class="col-form-label col-form-label">[No] |</label>
							<label class="col-form-label col-form-label"><%=bean.getNum()%></label>
								</div>
								<div class="col-lg-15" align="left">
							<label class="col-form-label col-form-label">[Response E-mail] |</label>
							<label class="col-form-label col-form-label"><%=bean.getEamil()%></label>
								</div>
								<div class="col-lg-5" align="left">
							<label class="col-form-label col-form-label">[Response Tel] |</label>
							<label class="col-form-label col-form-label"><%=bean.getPhone() %></label>
								</div>
								<div class="col-lg-15" align="left">
							<label class="col-form-label col-form-label">[Date] |</label>
							<label class="col-form-label col-form-label"><%=sdate %></label>
								</div>
							</div>
							<div class="col-lg-20" align="left">
							<h5><label class="col-form-label col-form-label">[Subject] |</label>
							<input type="text" value="<%=bean.getSubject()%>" disabled="disabled"/></h5>
							</div>
							<textarea class="form-control" name="content"
								style="resize: none;" id="exampleTextarea" rows="3" disabled="disabled"><%=bean.getContent()%></textarea>
							<hr>
				</div>
			</div>
				<div class="form-group" align="center">
					<input type="button" class="btn btn-warning" value="Update"
						onclick="location.href='AdminOnetoOneUpdateForm.jsp?num=<%=bean.getNum()%>'">
					<input type="button" class="btn btn-danger" value="Delete"
						onclick="location.href='AdminOnetoOneDeleteForm.jsp?num=<%=bean.getNum()%>'">
					<input type="button" class="btn btn-primary" value="List"
						onclick="location.href='AdminOnetoOneList.jsp'">
				</div>
		</div>
		</div></div></div>
	<c:import url="footer.jsp" />
</body>
</html>