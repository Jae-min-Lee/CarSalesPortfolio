<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "kr.co.min.dao.BoardDAO" %>  
<%@ page import = "kr.co.min.beans.BoardBean" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Free Board_Delete</title>
<link href="css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="js/FBCheckDelete.js"></script>
</head>
<body>
<c:import url="header.jsp"/>
	<%
		int num = Integer.parseInt(request.getParameter("num"));

		BoardDAO bdao = new BoardDAO();
		BoardBean bean = bdao.getOneUpdateBoard(num);
	%>
			<!-- Breadcrumb End -->
	    <div class="breadcrumb-option set-bg" data-setbg="images/breadcrumb-bg.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>Board Info Delete Page</h2>
                        <div class="breadcrumb__links">
                            <a href="Main.jsp"><i class="fa fa-home"></i> Home</a>
                            <a href="BoardList.jsp">FreeBoard</a>
                            <span>Board Info Delete Page</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb Begin -->
	<form action="BoardDeletePro.jsp" method="post" name="chkform">
		<div class="container" style="margin-top: 30px">
<h2 align="center">Board Info Delete Page</h2>
		<fieldset>
				<div class="form-group">
					<label class="col-form-label col-form-label-lg" for="inputLarge">NO</label>
					<input type="text" class="form-control" id="inputLarge"
						value="<%=bean.getNum()%>" readonly="readonly" />
				</div>
				<div class="form-group">
					<label class="col-form-label col-form-label-lg" for="inputLarge">SUBJECT</label>
					<input type="text" name="subject" class="form-control"
						id="inputLarge" value="<%=bean.getSubject()%>"
						readonly="readonly" />
				</div>
				<div class="form-group">
					<label class="col-form-label col-form-label-lg" for="inputLarge">PASSWORD</label>
					<input type="password" name="password" class="form-control"
						id="inputLarge" placeholder="Enter your Password" />
				</div>
				<div class="form-group">
					<label class="col-form-label col-form-label-lg" for="inputLarge">CONTENT</label>
					<input type="text" name="content" class="form-control"
						id="inputLarge" value="<%=bean.getContent()%>"
						readonly="readonly" />
				</div>
				<div class="form-group" align="center">
					<input type="hidden" name="num" value="<%=bean.getNum()%>"> 
					<input type="button" class="btn btn-warning" value="Delete" onclick="chkInfo()"/>&nbsp;&nbsp; 
					<input type="button" onclick="location.href='BoardList.jsp'" class="btn btn-primary" value="List">
				</div>
			</fieldset></div>
	</form>
<c:import url="footer.jsp" />
</body>
</html>