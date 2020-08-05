<%@page import="kr.co.min.beans.EventBean"%>
<%@page import="kr.co.min.dao.EventDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
            <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이벤트 게시물 삭제</title>
</head>
<body>
		<c:import url="header.jsp" />
<%
	int num = Integer.parseInt(request.getParameter("num"));

EventDAO dao = new EventDAO();
EventBean bean = dao.getOneBoard(num);
%>
		 <!-- Breadcrumb End -->
    <div class="breadcrumb-option set-bg" data-setbg="images/breadcrumb-bg.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>Event_Delete</h2>
                        <div class="breadcrumb__links">
                            <a href="Main.jsp"><i class="fa fa-home"></i> Home</a>
                            <a href="Event.jsp">Event</a>
                            <span>Event_Delete</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb Begin -->
	<form action="ShelterProtectDeletePro.jsp" method="post" >
<div class="container" style="margin-top:100px">
	<div class="row">
		<div class="col-sm-3"></div>
		<div class="col-sm-6">
			<div class="card shadow">
				<div class="card-body">
					<div class="form-group">
						<label for="board_writer_name">제목</label>
						<input type="text" name="board_writer_name" class="form-control" value="<%=bean.getTitle()%>" disabled="disabled"/>
					</div>
					<div class="form-group">
						<div class="text-right">
						<input type="hidden" name="num" value="<%=num %>"/>
		<input type="hidden" name="img" value="<%=bean.getImg() %>"/>
														<input type="submit" class="btn btn-primary" value="삭제하기">
							<a href='Event.jsp' class="btn btn-info">목록보기</a>
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