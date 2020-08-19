<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="kr.co.min.dao.BoardDAO"%>
<%@ page import="kr.co.min.beans.BoardBean"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Free Board_Info</title>
<link href="css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
</head>
<body>
	<c:import url="header.jsp" />

	<%
		int num = Integer.parseInt(request.getParameter("num"));

	BoardDAO bdao = new BoardDAO();
	BoardBean bean = bdao.getOneBoard(num);
	%>
				<!-- Breadcrumb End -->
	    <div class="breadcrumb-option set-bg" data-setbg="images/breadcrumb-bg.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>BoardList Info</h2>
                        <div class="breadcrumb__links">
                            <a href="Main.jsp"><i class="fa fa-home"></i> Home</a>
                            <a href="BoardList.jsp">FreeBoard</a>
                            <span>BoardList Info</span>
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
				<h3 class="card-title" align="left">BoardList Info</h3><br><hr>
	<div class="col-md-5 col-sm-10">
				<div class="contact__form">
						<div class="row">
							<div class="col-md-5 col-sm-10" align="left">
							<label class="col-form-label col-form-label">[No] |</label>
							<label class="col-form-label col-form-label"><%=bean.getNum()%></label>
								</div>
								<div class="col-md-5 col-sm-10" align="left">
							<label class="col-form-label col-form-label">[Date] |</label>
							<label class="col-form-label col-form-label"><%=bean.getReg_date()%></label>
								</div>
								<div class="col-md-5 col-sm-10" align="left">
							<label class="col-form-label col-form-label">[Count] |</label>
							<label class="col-form-label col-form-label"><%=bean.getReadCount()%></label>
								</div>
								<div class="col-md-5 col-sm-10" align="left">
							<label class="col-form-label col-form-label">[Writer] |</label>
							<label class="col-form-label col-form-label"><%=bean.getWriter()%></label>
								</div>
							<div class="col-md-10" align="left">
							<label class="col-form-label col-form-label">[E-mail] |</label>
							<label class="col-form-label col-form-label"><%=bean.getEmail()%></label>
							</div>
							<div class="col-md-10 col-sm-10" align="left">
							<h5><label class="col-form-label col-form-label">[Subject] |</label>
							<input type="text" value="<%=bean.getSubject()%>" disabled="disabled"/></h5>
							</div><br>
							<textarea class="form-control" name="content"
								style="resize: none;" id="exampleTextarea" rows="3" disabled="disabled"><%=bean.getContent()%></textarea>
				</div>
			</div>
			</div>
		<br><hr>
				<div class="form-group" align="center">
					<input type="button" class="btn btn-info" value="Rewrite"
						onclick="location.href='BoardReWriteForm.jsp?num=<%=bean.getNum()%>&ref=<%=bean.getRef()%>&re_step=<%=bean.getRe_step()%>&re_level=<%=bean.getRe_level()%>'">
					<input type="button" class="btn btn-warning" value="Update"
						onclick="location.href='BoardUpdateForm.jsp?num=<%=bean.getNum()%>'">
					<input type="button" class="btn btn-danger" value="Delete"
						onclick="location.href='BoardDeleteForm.jsp?num=<%=bean.getNum()%>'">
					<input type="button" class="btn btn-primary" value="List"
						onclick="location.href='BoardList.jsp'">
				</div>
		
		</div></div></div></div>
	<c:import url="footer.jsp" />
</body>
</html>





