<%@page import="kr.co.min.beans.EventBean"%>
<%@page import="kr.co.min.dao.EventDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Event Admin Update</title>
<script src="js/EventCheckUpdate.js"></script>
</head>
<body>
<%
		int num = Integer.parseInt(request.getParameter("num"));

EventDAO dao = new EventDAO();
EventBean bean = dao.getOneBoard(num);
	%>
		<c:import url="header.jsp" />
						 <!-- Breadcrumb End -->
    <div class="breadcrumb-option set-bg" data-setbg="images/breadcrumb-bg.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>Event_Update</h2>
                        <div class="breadcrumb__links">
                            <a href="Main.jsp"><i class="fa fa-home"></i> Home</a>
                            <a href="Event.jsp">Event</a>
                            <span>Event_Update</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb Begin -->
	<form action="EventUpdatePro.jsp" method="post" enctype="multipart/form-data" name="chkform">
<div class="container" style="margin-top:30px">
	<div class="row">
		<div class="col-sm-3"></div>
		<div class="col-sm-6">
			<div class="card shadow">
				<div class="card-body">
					<div class="form-group">
						<label for="board_file">FileUpload</label>
						<input type="file" name="img" onchange="filecheck(this)" accept="image/gif, image/jpeg, image/png" value="<%=bean.getImg() %>"/>
					</div>
					<div class="form-group">
						<label for="board_writer_name">Subject</label>
						<input type="text" name="title" class="form-control" value="<%=bean.getTitle()%>"/>
					</div>
					<div class="form-group">
						<label for="board_date">Term</label>
						<input type="text" id="board_date" name="term" class="form-control" value="<%=bean.getTerm()%>"/>
					</div>
					<div class="form-group">
						<label for="board_content">Content</label>
						<textarea id="board_content" name="content" class="form-control" rows="10" style="resize:none"><%=bean.getContent()%></textarea>					
					</div>
					<div class="form-group">
						<div class="text-right">
						<input type="hidden" name="num" value="<%=num %>">
							<input type="button" class="btn btn-primary" value="Update" onclick="chkInfo()"/>
							<a href='Event.jsp' class="btn btn-info">List</a>
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