<%@page import="kr.co.min.beans.CarListBean"%>
<%@page import="kr.co.min.dao.CarListDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
            <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Car Management</title>
</head>
<body>
<%
	int carsale_num = Integer.parseInt(request.getParameter("carsale_num"));

CarListDAO dao = new CarListDAO();
CarListBean bean = dao.getOneBoard(carsale_num);
%>
<c:import url="header.jsp" />
		 <!-- Breadcrumb End -->
    <div class="breadcrumb-option set-bg" data-setbg="images/breadcrumb-bg.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>Car Listing_Delete</h2>
                        <div class="breadcrumb__links">
                            <a href="Main.jsp"><i class="fa fa-home"></i> Home</a>
                            <a href="CarList.jsp">Car Listing</a>
                            <span>Car Listing_Delete</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb Begin -->
	<form action="CarListDeletePro.jsp" method="post" >
<div class="container" style="margin-top:100px">
	<div class="row">
		<div class="col-sm-3"></div>
		<div class="col-sm-6">
			<div class="card shadow">
				<div class="card-body">
					<div class="form-group">
						<img src="upload/<%=bean.getCarsale_img()%>" width="100%"/>
					</div>
					<div class="form-group">
						<label for="board_writer_name">Car Name</label>
						<input type="text" name="board_writer_name" class="form-control" value="<%=bean.getCarsale_name()%>" disabled="disabled"/>
					<div class="form-group">
						<div class="text-right">
						<input type="hidden" name="num" value="<%=carsale_num %>"/>
		<input type="hidden" name="carsale_img" value="<%=bean.getCarsale_img() %>"/><br>
														<input type="submit" class="btn btn-primary" value="Delete">
							<a href='CarList.jsp' class="btn btn-info">목록보기</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-sm-3"></div>
	</div>
</div>
</div>
</form>
<br><br><br>
	<footer>
		<c:import url="footer.jsp" />
	</footer>
		
</body>
</html>