<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "kr.co.min.dao.FAQDAO" %>  
<%@ page import = "kr.co.min.beans.FAQBean" %> 
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>FAQ Admin Update</title>
<link href="css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="js/FAQCheckUpdate.js"></script>
</head>
<body>
	<c:import url="header.jsp"/>
	<%
		int num = Integer.parseInt(request.getParameter("num"));

	FAQDAO bdao = new FAQDAO();
	FAQBean bean = bdao.getOneFAQ(num);
	%>
		 <!-- Breadcrumb End -->
    <div class="breadcrumb-option set-bg" data-setbg="images/breadcrumb-bg.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>FAQ_Update</h2>
                        <div class="breadcrumb__links">
                            <a href="Main.jsp"><i class="fa fa-home"></i> Home</a>
                            <a href="FAQ.jsp">FAQ</a>
                            <span>FAQ_Update</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb Begin -->
<form action="FAQUpdatePro.jsp" method="post" name="chkform">
<div class="container" style="margin-top: 30px">
<h2 align="center">FAQ_Update</h2>
		<fieldset>
				<div class="form-group">
					<label class="col-form-label col-form-label-lg" for="inputLarge">No</label>
					<input type="text" class="form-control" id="inputLarge"
						value="<%=bean.getNum()%>" readonly="readonly" />
				<div class="form-group">
					<label class="col-form-label col-form-label-lg" for="inputLarge">Subject</label>
					<input type="text" name="subject" class="form-control"
						id="inputLarge" value="<%=bean.getSubject()%>"
						/>
				</div>
				<div class="form-group">
					<label class="col-form-label col-form-label-lg" for="inputLarge">Content</label>
					<input type="text" name="content" class="form-control"
						id="inputLarge" value="<%=bean.getContent()%>"
						/>
				</div>
				<div class="form-group" align="center">
					<input type="hidden" name="num" value="<%=bean.getNum()%>"> 
					<input type="button" class="btn btn-warning" value="Update" onclick="chkInfo()"/>
					&nbsp;&nbsp; <input type="button" onclick="location.href='FAQ.jsp'" class="btn btn-primary" value="List">
				</div></div>
			</fieldset>
		</div>
	</form>
	<c:import url="footer.jsp" />
</body>
</html>